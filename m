Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2885129ocg;
        Mon, 10 Oct 2022 20:24:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Gt6BKg8EnxIa/3/CtV7o87nlYEaPSaJ39kz6lnxfwfEtrLGoAtjz2+q8qurMwt77Z5ReV
X-Received: by 2002:a05:6214:5181:b0:478:69bd:38c5 with SMTP id kl1-20020a056214518100b0047869bd38c5mr17194607qvb.59.1665458659971;
        Mon, 10 Oct 2022 20:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458659; cv=none;
        d=google.com; s=arc-20160816;
        b=Ok9Gxkpnf31uULjH6JITM9f86zf7bhnMVWw8EL7HGm7645Rdx6xDJw/8/xpLEqoJ6c
         yK9YgFanO7s4XDbYHNbKW3QW9GjxrG1DEDnZZj87yBsD4zCUp2GiK7DBGlalrgp3H6Yc
         fJR2ucgIfYF+N5CJbB27vEWDCfW4QCiomb/3oidWeD/6EELgHVXOVuGmEa3vJpkYHU1N
         LaaDNaf2n9R7G8vodmEBeEuDkxf/Tn0W5+Ik18BJ0xpT3KUAYay47oW1nYOF9pFhDoat
         IsRDkQGpzEUnf8l3iWqsqZk7eQi3Fco+/NUnSdSIa7ppYj74NXIceQGTRwelnvCPTk8P
         Ij5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b2ixa769MahWYdKSZ05XJ7WAaj+VfGkFP7b3KRkRK2I=;
        b=LKAhhEMGyjzYXtzOrRMCIy83Iw2Ma0bhqN6LUFRWh9X2z/xOrqB3wF2hKoiNTbdUtN
         8feiNyocreGVMbYIZhD3tyPKQHU156CHvp42GlaxJlWwPGodORzkPb+qlrPAyD9GQGLJ
         8UJowwr2Zd21X86/wf0sd+lJLJrLonzOhuU1Dh7yb47llMlbY+J4jGhs4I/3mcpWenes
         b8ThBZgocyWnrrE4SFu0tiaq8xunfKe9wom2dJd4LHEJytov4+h8SSqM7GLXBw/IDq5T
         XQe6YEH9X7LhjFw/wnOFkYE3U1B+JYYI+7YACebSnj4xIkPvImlfXAHenf7861X6zK1B
         vhHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+B8jp+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ae9d60f000000b006ead289f6b4si4846281qkk.521.2022.10.10.20.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+B8jp+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5sR-0001OM-IE
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nn-0002Fq-BV
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:31 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ng-00030j-Pd
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:30 -0400
Received: by mail-pg1-x535.google.com with SMTP id q9so11764929pgq.8
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2ixa769MahWYdKSZ05XJ7WAaj+VfGkFP7b3KRkRK2I=;
 b=i+B8jp+F0HOVS3raIzD4eIt5hxNTBWG9HO/1CWjnFbQuWw5fajvuH9uiZjUKMsKyhA
 LDWL71MyBXJs7K9EmzqFRRb7yGxUgmKK5yAfn9slXPJXe/C1FFxuFvy2BpvxS7ANbl0I
 W2rydIS9uyr3R+NKL8dALhLGICuJw6imPLH1OR+JnSaRsc6RuXAUrBOC+xdq1QTNNDzs
 xoP/Zzq/3Pu2mP/zXslE/Kf7XI8ojGxoRDc+lqdTx+0Yw9M//ymnC68AuUI83X4ixEla
 /scgo2ur/RTvAJjmPU6GvLIs1cJeE0+HAwDSZWk2lEMGpmzSeP+igi5VUN8i1R0aBUk5
 UdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2ixa769MahWYdKSZ05XJ7WAaj+VfGkFP7b3KRkRK2I=;
 b=HS3VYBHqiW3mYwQswqI/P+NfYj2Z0vKSXI7Rsc9VbvsRYA7DWwjGdmw2U70w3TekjC
 dx7+8dbHnu/FSPH8tdik1EOHefpX/rig4HbUZodjq5N4+vmynTubU6Bv8xcG/FabyAQG
 icfMJ6q/w56IXINOHCw5Hm828SP+0WRV2hroj/xzOfWeFvT5w0ybH+DUhJYdkO4CNp45
 kASO2VFHUTGRXEw0sd3AJzDvRoaAA4UFZBnFcZtobz+qW5XpbwEoc8jMheYQobUQzIHv
 Z5Chkf/DtkzKN1LWu0DNcb89xTBSKY84kAGqyYnpbuLTBFQneL0z5boyVP67IO7Ed+zU
 insg==
X-Gm-Message-State: ACrzQf1tE7XVWYJOB2py2EYFjdtMgIZZWIIqAzYUquzIMtrC4OmD7VHG
 6FjDQC+IGXQI+/zKh9EVW7fOrA==
X-Received: by 2002:a63:d51:0:b0:438:36d9:7fd8 with SMTP id
 17-20020a630d51000000b0043836d97fd8mr18436428pgn.547.1665458362981; 
 Mon, 10 Oct 2022 20:19:22 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 06/24] target/arm: Restrict tlb flush from vttbr_write to
 vmid change
Date: Mon, 10 Oct 2022 20:18:53 -0700
Message-Id: <20221011031911.2408754-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /y0BKu46uOSy

Compare only the VMID field when considering whether we need to flush.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18c51bb777..c672903f43 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3815,10 +3815,10 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * A change in VMID to the stage2 page table (Stage2) invalidates
      * the stage2 and combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
-    if (raw_read(env, ri) != value) {
+    if (extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
         tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
-        raw_write(env, ri, value);
     }
+    raw_write(env, ri, value);
 }
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
-- 
2.34.1

