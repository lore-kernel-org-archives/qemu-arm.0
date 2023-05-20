Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276057ejb;
        Sat, 20 May 2023 09:27:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZAPbrO/OSmsdC73/wFnMzOs/S9x7d1gNhAT9xFAdN2bva9B1iaDT+juFf3oxePtqQTFw0
X-Received: by 2002:ad4:5aaa:0:b0:5e9:752:766b with SMTP id u10-20020ad45aaa000000b005e90752766bmr11955070qvg.47.1684600054105;
        Sat, 20 May 2023 09:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600054; cv=none;
        d=google.com; s=arc-20160816;
        b=x6ksV5jyRTLgSztev5IWX67tA0j8vaslB0geocpQiz1UWzaeUodZ/g8b1T4fP8/hi3
         BadwLIrNtjftwIINPovxCC7NbClhDNqW9PoJIzMm1UMUKxQXXLObsSsH4fm/5QS7kCzx
         TotfxqwNAjLX28ZAf1zCUeC0Om5KuJyndXY8ByYZbvmkqWdnjrVXNt3mmNjpviFBIkLl
         nw4kSlcE19D+G22uleT+O9wSec8daFQZFyuvI5Q4i25U02gEgHeeiNZJ6DzKxUTiZ/7a
         2iz9ULL3z1eQ+d+Hj6wiXNBjPOnJmxCufh8tTBdlqAg+aIc+U1NO707SybgAF2IouNZu
         Mm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8wi2bOWjMyVLEFUf4QBGubplY21YXqeLF4j5hewlIPc=;
        b=so0ZLtHn7aW2sr3Bh3nxW0VwtpIjOU8gYfulTAgbzdAfS0yEcQkv0jvqs+ecDMA4Qm
         HRwvFKTzAm9F5XOb0FHV/kTkWF++aSBDFCZSM1UJJXEbVqLbbMuHSL/MLshwrybjKEhL
         ZW/SFEIHCuLWgPfN5+IhyK3eLQ82PJYMoYmB3SNFpNJNl89L/LQ7RIYtAmb/wVVFTvEH
         8Eo9EDobOkSSsa3ArlOWIAKk018B7yjPdaeWuFB904PMFViftir8xNndiidv9jKnK0Na
         OcdKY4whcDOX4yVNYldCbbGg43DaJZa+m9EgGqZptESs++4ijDW+MRLhRKrUsXyHhOZb
         Tw/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NlifBBE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js8-20020a0562142aa800b00623a0060cd5si1205608qvb.458.2023.05.20.09.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NlifBBE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PPo-0003Yw-SK; Sat, 20 May 2023 12:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPn-0003Wt-9P
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPk-00034V-7D
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ae87bde5c9so14866815ad.0
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684599999; x=1687191999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wi2bOWjMyVLEFUf4QBGubplY21YXqeLF4j5hewlIPc=;
 b=NlifBBE1Sa6pTUAOl4gfdmRW6vLX2I8IGs1+HiFEjYALEjk2ZZ+t2KUXd6lGZ7hQDZ
 EBknP+1txz5J7xK7VkWQ584fETgPX0yzmEz2hZFq7GDBepVh+tITghv81Bei7o3PhA9W
 O+C4DJCrcWg+KDdXZn1FUuS1SPiqo/gykqI4P7/UV+s0ud09xP37yPQggAqAb9jm+lH0
 KVMUKydJc05VUgNfN2ieVYHbOVoLAZNx8T7t9Z3w0GzthFLLgoweuRflwUI0fK4BbcvD
 yGy+TU3SusHeH9DiY+fMz3tX4qTsnknrsxj/JcKIkK2sbSAeHg3LVlHiLvzG1LDsqMfR
 3ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684599999; x=1687191999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wi2bOWjMyVLEFUf4QBGubplY21YXqeLF4j5hewlIPc=;
 b=ADWB8n+f6Lkz37fEJtWwXR9P806NOLgCwcvAqkQAFy3DvpaiI96nyx3EI1PWOFCHP8
 SH1/eXkhOJDZeHgcZ3GB1fQvX86yj5BSDpobsrk1sSZbtsKyCvdNciTb98f4zDMh78Hd
 VQJxeIU5vMvbi7l2w5a9+jjteohCmN/B5MjI9Pqec5QbBbcWhZryrAx5kqNcTb83Mmg9
 XKVj6tdmXEPufNuh6pb3d2YfQx9FqhjqjWuKAb4QTyM1A92abjzfGOKHWZff+0jX9MDZ
 s7DqZRRMtqK38IZmFWs1DIlcGT4PhJdlByeikQFSuVSf0JYtFW0lknd3ZxfCjQH8zUf2
 T8Ig==
X-Gm-Message-State: AC+VfDwy43wkHTdRTQ0RXpm3ecTlu8wzHbds1X+rmRel64WTMjS42+B9
 7RuW+ceMbsAqEhLQ4EALsBfgAA==
X-Received: by 2002:a17:902:ec90:b0:1ad:e633:ee8f with SMTP id
 x16-20020a170902ec9000b001ade633ee8fmr7592178plg.32.1684599998981; 
 Sat, 20 May 2023 09:26:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 03/27] util: Add i386 CPUINFO_ATOMIC_VMOVDQU
Date: Sat, 20 May 2023 09:26:10 -0700
Message-Id: <20230520162634.3991009-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 76ROyACD10Bp

Add a bit to indicate when VMOVDQU is also atomic if aligned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/i386/host/cpuinfo.h | 1 +
 util/cpuinfo-i386.c              | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/host/include/i386/host/cpuinfo.h b/host/include/i386/host/cpuinfo.h
index e6f7461378..a6537123cf 100644
--- a/host/include/i386/host/cpuinfo.h
+++ b/host/include/i386/host/cpuinfo.h
@@ -25,6 +25,7 @@
 #define CPUINFO_AVX512DQ        (1u << 14)
 #define CPUINFO_AVX512VBMI2     (1u << 15)
 #define CPUINFO_ATOMIC_VMOVDQA  (1u << 16)
+#define CPUINFO_ATOMIC_VMOVDQU  (1u << 17)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/util/cpuinfo-i386.c b/util/cpuinfo-i386.c
index 434319aa71..ab6143d9e7 100644
--- a/util/cpuinfo-i386.c
+++ b/util/cpuinfo-i386.c
@@ -77,8 +77,10 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
                  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
                  */
                 __cpuid(0, a, b, c, d);
-                if (c == signature_INTEL_ecx || c == signature_AMD_ecx) {
+                if (c == signature_INTEL_ecx) {
                     info |= CPUINFO_ATOMIC_VMOVDQA;
+                } else if (c == signature_AMD_ecx) {
+                    info |= CPUINFO_ATOMIC_VMOVDQA | CPUINFO_ATOMIC_VMOVDQU;
                 }
             }
         }
-- 
2.34.1

