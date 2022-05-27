Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1266026lfh;
        Fri, 27 May 2022 13:19:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRH6UbtTPJT1pw35MrS3riXJ6d/ldGfbSStYm65efiHaxGnpSRL+C1pMPTgGSy/A3Flipv
X-Received: by 2002:a05:6214:2389:b0:435:ba04:8f18 with SMTP id fw9-20020a056214238900b00435ba048f18mr36657146qvb.4.1653682799713;
        Fri, 27 May 2022 13:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682799; cv=none;
        d=google.com; s=arc-20160816;
        b=v1VK/PPsuOhSgzef1BZWbeWJhCZeFEJJvr1Kuf4iOS8G0uMzyqRjqRz98G7bymApPt
         OxEf+91sliGbM0ixXHpRjDLiUwjAjGTi8o6lJ2Ei9RGvmtlQ9GCpuEOP/iDeQGkyeGOw
         8xV/TiKONDTI772aPmxmd0wQU4Mvm9f4mFmWHrRLiUzpo+l/q9Co5ccDF+4fQmOt7M7Z
         R8iKMPG4kPg6zb+NuwE4uREeWsC5hMQuWFOZTg9pHvI8cDCVsGZNbcEycNKygwWXzaLp
         56fe/UdgdYB5cCNYgXc6+zIqN0jwxS3O/fhQRfaPdr9CEAXWM1ghZXQYvM9Bfnb6MvMR
         GC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XTG6umjkgZe9IgKv0D/t6G84E8CHer2soIdRzD2x5gc=;
        b=QjGjklPL7XxPxbpWbT4M9EClSJ8HWa3ICc5qdUYFqs0NbuL6wzltZ82ZldHIXmLfLU
         c/jAg7mmvjX0iCt1gGRCTnMeWnBNM0I3F3eRyBoJWYg1fKIi2b3A3YzU3d80kjFiiW/6
         xz8jlTFtiwDvNIE+wfWOeH3aM+yX96WeCGpeDiPofT/1QJh+/5gHZh6NQ0tPETnj6IBv
         T1Bzgpcr9yDiCvUJKoS9P5sN80QKUXYX3lK21hGkCAhYXEBlDQ2QzlRdDVKrM6sYeIw4
         XBMOWk4y8Ic6lMRk6dPQpSKbIeKbmNFoaDqhYlsy1Us2SB8QUhNzCu4tKh+GUz012t2D
         rDGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M0/iys0P";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25-20020ae9ee19000000b0069e7d2ca4dasi3191800qkg.266.2022.05.27.13.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M0/iys0P";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugRD-0001s3-5N
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefw-0002Jj-Q2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefp-0005T2-9A
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id w3so4796447plp.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTG6umjkgZe9IgKv0D/t6G84E8CHer2soIdRzD2x5gc=;
 b=M0/iys0PJixVdtY0pdex1d4XM4KJlpKSBFawYmxmaUzMDkBTVmaojDLfdTVTDJ9mn3
 w/SrjNfb7+fOHtWlB82204fJ+3LJycIMJnKciioGF9VX4U9Kph9v9yPrxBuudj1jNad2
 1p+/NsKG6w3ytlzH74sYf5s4DhgNf2ewUVpsycVUBd/tbcjevZ5dqDuj6FSgjEc7zvAE
 pDLTWwhZVIKTyP4wxSNlBq5uQ/PE4dtDK10K0On78mU1Ht/EWjjThakIcDp9Ye9rG3i8
 /w7aH3q855LU3iNLHXZn4ZZDgLijrd4k6JrM4TDNoGOab6JaimKMguzhUHbx/Iyrn1Gg
 vo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTG6umjkgZe9IgKv0D/t6G84E8CHer2soIdRzD2x5gc=;
 b=JNZVqPjnXSV3HyvbzldoMzWVLfWqaCV8tDNUDCGRTR3nCYoRbYnzpFTQNNVsSFOOH4
 cg3oVAfsckfBz9cFv7fm2ozggL/4XU27cS1kNg43oonDhRFHaE3ykqATNFltdrnmhvqd
 hnes6sTukYWymRcK3dH6T+b81WQm9102glYZUZ26Yd6ZtINdJg0lBMJ8b5ycBaO4u7fL
 OykyfZlPmMYeVGzQCaLW85dSpVwuaXeKM+4cTd5lwvc5kG3UFG1wAHiSya6D8o9CL/fW
 spgKeFuZpTTfEd+pwwnxJMqAYAMV2uTHNbT+AGhcCFPUjyR9ZeC+2+2OcjRf2EOejmgO
 v8zg==
X-Gm-Message-State: AOAM530MbAPbHIs4rj9N4wRMHif1+5QnTbjMFgWpebW8HxjVUZl0E/QH
 zXWbGKdiqDO2u1/+Oi3V/g7KYbVdrL6fLA==
X-Received: by 2002:a17:903:11c4:b0:15f:14df:a919 with SMTP id
 q4-20020a17090311c400b0015f14dfa919mr44157303plh.21.1653676016054; 
 Fri, 27 May 2022 11:26:56 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 114/114] target/arm: Remove aa64_sve check from before
 disas_sve
Date: Fri, 27 May 2022 11:19:07 -0700
Message-Id: <20220527181907.189259-115-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aihQxw4rzGHa

We now have individual checks on all insns within disas_sve.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f502545307..935e1929bb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14772,7 +14772,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         unallocated_encoding(s);
         break;
     case 0x2:
-        if (!dc_isar_feature(aa64_sve, s) || !disas_sve(s, insn)) {
+        if (!disas_sve(s, insn)) {
             unallocated_encoding(s);
         }
         break;
-- 
2.34.1

