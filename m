Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp846983lfg;
        Mon, 24 Feb 2020 14:27:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKfKUutSqfZv+djAcCJdPS3zfDbP+KEfr+t0E86p37H4xS9ZWUXYotYiOioJa6Ynqx8KIh
X-Received: by 2002:ac8:42cd:: with SMTP id g13mr50149968qtm.168.1582583255600;
        Mon, 24 Feb 2020 14:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583255; cv=none;
        d=google.com; s=arc-20160816;
        b=JBK2Vh30clV0My9/zeRJgswfGjS5hPoRtl5VzyhEle1v3HSMe3YlWdRTihHmZGG/Zz
         jIeF0qQC8aZALX9xA6WgvDUiNJR8PEBUVSrZE89LN1Xbe4wc0mpRlCY6rfNrDFQQF7ef
         yW8CKkV9H2Z2yZNDPzNjJLa5egn6vIk+lPuDc8re0agwYzQjLhUuJLm4Rc10Tbu3ZSgC
         Sy76gmRF5kLLc4YlAdf83hUDPma1+UhEfF/F7TtThzyro7K6P96b7+ZRH3TsFkOPMbc4
         DQg1ZI/zK6ixb15XILLruZC61rS6+BrsuuStYQ0O7GhvcTzqjK62WGMdGZ8qKfvEEDyt
         lT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aSn4NAeocUzSgV/L7ik2kDrtmTdvw88vbNjqxC4Yo9c=;
        b=YbWUgsy/8Z4nTlhVB2j8jXv8p/VO9anWf7eGQonIKMJZJkR2Np34OdEnirQ87/m6ek
         uDUL0Quvlm4H+8BAbrvKMBE6qCHejQkG8PDJouNn2CAazeFQtjCzP28ilxOeKKe4xHwn
         yBMo1h0guoi6feLFO5BI00Ei7P7+jLtOtIN8saljLV6mG/5elmxxae9E/htXOAFn/oOh
         cj4Hmtxkm3XzakJty6pdAHFBOoWJ/Hq47pfGVoI6xbm7dGqaOhjY5TewVdAEOJ/sQ4T0
         N71SUEJlh7CB4zrwCp3uo+EwG8XEzKcec9kG72Zre4NAtlbdAqeawR2VkJlYi32t3e1e
         KO2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TBKc1TFH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si6597243qtp.191.2020.02.24.14.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TBKc1TFH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6MCN-000457-1p
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7l-0004Q9-Lw
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 17:22:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7k-0005sz-MD
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 17:22:49 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7k-0005sg-HJ
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 17:22:48 -0500
Received: by mail-pf1-x442.google.com with SMTP id x185so6073421pfc.5
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 14:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aSn4NAeocUzSgV/L7ik2kDrtmTdvw88vbNjqxC4Yo9c=;
 b=TBKc1TFH1MMrxxLoVXabVlAV3gqrsgo51CyXapcsrKPErDkzNFao8O+HimXPIXMkg6
 mz460C2vxEDWs9gdokRZxbg+5mwHXlh8tGuh8ohO1U/AHeSH1K5Qa3iNTv6FVXtr9ulb
 ExI0aQ9IQj7nx9KiV6NUvd1+fNDPffQCj9XHkqQGO/On7bQ7BUnKf2TqqTqjWju8ygEo
 kUV9+XNmz3AyRxW+ZgZrU1qa8Yh/p9ldWDH+rS11GGfCwYGJT9ZI9X/QlrK/Gmaw05aN
 DRifucgRRgm473OC7VXWhcPBKSWWCcZDqqNd7hZYxBdPatYud8GxbeK56sy6EESVZ5bi
 sbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSn4NAeocUzSgV/L7ik2kDrtmTdvw88vbNjqxC4Yo9c=;
 b=Cw4Gsr1xlkn+8f3bBOK0qqzb6s7pNWLpwGEs13tJbNkz7CkacenyIJigwye9Ag6eNU
 27gxPx+CCjMsk5uvNChQrCEJetnDtS/0ZYXqeeM/iL4VC1b9qxR3NeoFRi+HcxLjS5L0
 eXMlgFymN73ylV9U5BROfPNY4dqnMewz5oh7InNVVM6G3Hc3yCBeveuuCGBCSuqW8CfV
 jn68mRL9CTQvOqlhxIeXOMfu6ej7Zw+/YgP1MMgZITahnghGXXwiP3/KuaKWR8enY6Te
 v1Hk1JtytKyPYnNJQBIDpBYJP+sfd7RsxHeHqjUcAFEiIv3puZyqBLPh6YLZQGzOu393
 MjIQ==
X-Gm-Message-State: APjAAAWSh/YxXlTDdbquS1k05xQ4VYcDG5Gr/5PVsMbjZd3E7XdL2FCc
 XL0EjRNBdO2vmgk/sef6w0sevQw44SY=
X-Received: by 2002:a62:1594:: with SMTP id 142mr53296303pfv.18.1582582967322; 
 Mon, 24 Feb 2020 14:22:47 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/17] target/arm: Remove ARM_FEATURE_VFP check from
 disas_vfp_insn
Date: Mon, 24 Feb 2020 14:22:25 -0800
Message-Id: <20200224222232.13807-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1J1TbnJEDVjR

We now have proper ISA checks within each trans_* function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0489e0cdaa..893911fca7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2652,10 +2652,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
  */
 static int disas_vfp_insn(DisasContext *s, uint32_t insn)
 {
-    if (!arm_dc_feature(s, ARM_FEATURE_VFP)) {
-        return 1;
-    }
-
     /*
      * If the decodetree decoder handles this insn it will always
      * emit code to either execute the insn or generate an appropriate
-- 
2.20.1

