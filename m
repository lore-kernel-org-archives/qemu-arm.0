Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1041769ejc;
        Mon, 22 Aug 2022 10:27:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4JQgON9Mfm/meqs3hOHfyIn7Teqeq1Hybc3LZX3ASl++JEsy/Ov3JJ6u89cqLOY402XsWb
X-Received: by 2002:a05:622a:413:b0:343:73b9:5cc6 with SMTP id n19-20020a05622a041300b0034373b95cc6mr16088684qtx.655.1661189247040;
        Mon, 22 Aug 2022 10:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661189247; cv=none;
        d=google.com; s=arc-20160816;
        b=JygcI88XYctwRgIzQAQ4CsW4dVIM64/BcDbPmwzwLHOqCgRr4Aq6SzMlQ252NKmdjp
         l9XhDNstBhm4UgAzqab5mylV/89T5f/FWWvebaGX+0inah8a6dChsfxVP5Vn/rBWOVDg
         JNXFUCbCPENMxCmxEhpIE4IVBeNp2+9LN9Wd5tTAmOcwp2UG5havP/cgumyYwKNSW3+P
         GPyEQfPY6ami9BxhukpRPdWoOkv4tVsh4qyiz9OPbNm/vKtmpd/uoSmA8u/ItF1z1ISM
         xe5Bt1Qp9aTyGCKLllEgrWhrnJeg4cne3I9NQf/2ZSwSAbGyQhlSev78vQ2ovLn5UfvB
         0YSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xOAKE939prezp00RTq/5i5dmdsj8gga6ARA2/sjO9wc=;
        b=q3S0NS/6bnqYpz8m/cGB+El5FHWLIFtizv7JHVGXTKnGDtJPQzjLklfir7qtrtDbkl
         NYSuNtcvVn9FQhwddFoM19vvJb3kJMZFbWg7v2gQmCEBCYNSS0UOCD/IvlHAYIbLp/X9
         Hli+9A5JSK/CyestsYK2SinTF1zPw0YMtDZ4YoSB4+MQSUWF4iaWdTIzYIymwTATEp4t
         wHsqRSlmFTRYlXxoOF6yVE0T172xCBDJ6jQmYrkavJD9fDZir3V5ttd6xJgvaNoIa4Ap
         lSUCmJnOeFsN61OQVVEumrjo/Ny0QClR+Sk85BlcxPR2PYlCM+uR0FgzDzQwWs+ORICy
         87zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEUlWy3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn15-20020a05622a1dcf00b00342f67a1d70si4638241qtb.601.2022.08.22.10.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEUlWy3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQBCw-00080W-3B
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P3-0004mM-3k
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ov-0001hb-4m
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id jl18so10262059plb.1
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xOAKE939prezp00RTq/5i5dmdsj8gga6ARA2/sjO9wc=;
 b=aEUlWy3UoR7d+JIoPwO0XW8pQ3zIAH5rPvxXw/p8Y6AVOQqt6VrkcneDRnWb5YbPH6
 h/M4gSWKD6EVLRL7j6MiMNcjdLmw/EklPOTSgi5rsJvLFUaSvPAaxjkDpZjh+Nni0leT
 0DQ3n1gG1OEHI+TwAzM3CzKYp3GYsK9wXaggQlj2hv1jQSjF1Ra5fpsVM7W4feIBR+qN
 V8QIFKLe+fre52IGb8PP5wjXpgrNvoudilOFNwBiDPgZYyr4dhkLWfoHwftpdVeuzm5S
 wfqkAj1Xk6qTaQSgl6zBap7fUY6LVVcGa2kpEKZ51BiC5AeMI1jGBEBVHHmZzSy399a2
 u4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xOAKE939prezp00RTq/5i5dmdsj8gga6ARA2/sjO9wc=;
 b=KhzMXNWc97RBgMqLaN5TiYeSlPX+WcTQGYtrPPhI4AeORaZEWX7tNZyPbpnsDEIc4Q
 jNaKodCFQV1bVroS8eqYjSKkhi7vDsxEFj+LAZ4amOL3tPBUA07UyiV2LgOmc/nlz4E8
 uV2My3Wq1lePld2URhi89spZTJxQA/Pd8Fl8/MiPYBOUSHLp/6d13u1GTZFRCwIsJdak
 aVgkYAwnKLB0LZpdsj9yRNdZKfp8c5rLhQwZ/8x5e4XjH4LjsLu0LT4Wspndd5785F+U
 2vX3hBSei91GWbhk5eypD5OR0/oCQVcNsy1eD2aQnkp9kCMoBWp1OqqVKc5nY1ehiFQp
 Z6ag==
X-Gm-Message-State: ACgBeo0EmmePHGG5UfphOC4+8iHl2av00ab0C5xT34KTonoRBDSRAQFS
 1FwRYqp1/gFBHwQnwSPeBSzE6A==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr23543343pjb.98.1661182295513; 
 Mon, 22 Aug 2022 08:31:35 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 61/66] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 22 Aug 2022 08:27:36 -0700
Message-Id: <20220822152741.1617527-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: klXI0Hln/2C3

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index de8b3392a8..46012a349b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1

