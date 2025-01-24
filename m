Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp932073njk;
        Fri, 24 Jan 2025 08:37:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIs5SifJWN5JYnC8j/GGOZ2TuzfKi4Pi7fAwUAzutbxTJ1lw5BuQkVdpedF1oi8oCfkSEuBAqMv71BFw==@linaro.org
X-Google-Smtp-Source: AGHT+IHXKcvwRssv7lskg6JuviRaXFrRlf8VFMimfiWJQdzX/p/Jt3W7q6Ub6wYeX3wD2FPRLOyp
X-Received: by 2002:ac8:5a42:0:b0:467:6c18:9857 with SMTP id d75a77b69052e-46e12c394bdmr515746841cf.37.1737736670554;
        Fri, 24 Jan 2025 08:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736670; cv=none;
        d=google.com; s=arc-20240605;
        b=McSbjyklo1JE0KesLzJxFpeWcn9f/73sHwd2NgGpS1Z6S5Rb882ihvzrwakpQre4N8
         HiqBb11eaUX18WCT0+1Dxy4CUr1TnRl77IozwUTQV0Zx07ilf0k/AVCRAnw/sIqoc94R
         Ubf5ldLQxOaFYsM6R6rZPraExNCkRP+2tIbHdqw/7VIvGUO74kTU96d7JRKGDuMTFo2L
         S3PDVSkTH3MqwIhJMZH8yK37684rbOTcSQZBnaUqX0tTWWOg/VV0GXxwWt6z0eqS1ta9
         OWvQioAsLHu2ZwmEsy1Po2dryvOQ6mqvd10C7sqqq0zEgeuGLyQvf1hqWcbwJIHMKqau
         LY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ol6wjs2XXi3PGGKevFQFr1g6AWQeoCb1SFBUJSxPQd4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Dp71YFgnPp+OPE9aSNLcMYSo6q6ObgCC9yttlge/mJKO2B/afFUJparIppHI/rEgUK
         vtbOcp8W60J5fk6w2rXel7r4iGnx67ZwCLnK28Fzk9vlOUSgCS916elhzmyDnSMo3saD
         Xm68kHb+qgDluPdkIaQGFCE+XrOsIIkG34luAfhBDdL3ZleTP3kr+R4dwptFNhR1gIoz
         ZfWUmaO4Q9fiAdGjKUs1zB/Up9JpHJxcGnx5ZbVCz9fFZ6uBDoEQIFCZEdmKTwGXbmrT
         QFfQGW7xaMQyBHVezbQmqn4TZlCDMgByp8g4ZDttlfgZcZra0pA3T+IKbK7BCm2E1X6Z
         V/AQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MUsfNPJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66888513si30583891cf.201.2025.01.24.08.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:37:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MUsfNPJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMdm-0000CZ-Cc; Fri, 24 Jan 2025 11:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZX-00063i-Pb
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZR-0005ph-IV
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso15178865e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736204; x=1738341004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ol6wjs2XXi3PGGKevFQFr1g6AWQeoCb1SFBUJSxPQd4=;
 b=MUsfNPJSrZyJxcIonXbUjb0dIzlMxExGBMzarZ9q0XS+IL+rnBcgs8gHzjFlq8x9Wk
 hVH/BE3ecc0xAJRnX2UNxu+OUtCUUrTFwGjz0rZBSHnGHIjzeWMnDbOj6llzT2UZ5jeT
 UTLaFwXHR8w/1/x2vTXYMIDBqI/DBFhgOkNYq4kx8NSVdiMDWpCR7YjwsOhWR3+W6n4J
 HGDxapOwzFEX29IZ0cF2Cb+Uz9dClEtOr8i/zhrKE5LEMoRj95ETmFDMG7btIhv3HIjL
 8Kp/BS+yAJ0sKvvsn2jUTDY6Vq8JoR711Mg1U32+EQ+8yJyMBRhSqvzUu/KPLutGHx9u
 n2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736204; x=1738341004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ol6wjs2XXi3PGGKevFQFr1g6AWQeoCb1SFBUJSxPQd4=;
 b=fKrK7d5G0mxz4ycV2dBLPNxp/pIJ9dY+SBu9hGNoeDK9qQjwMa06gOkcwi8syx1iup
 oTGPVhz9OUkTEr4GPZvPWKSqhC+M9SoyqQ6YQ8DEpuCaLga1AQP95p+tKJM/5aEZSrcC
 DTOJ/iUUV/zKzLbPDpmGhiLkxqDHpGjkmIeTZHC7U/u0gug+BftC8WwidhLlkhFPsptN
 GWQIanRo/5Bx7Xr4QDHtBv71/WI+l9OEPs7cy0sYqDcJG/jWsME6I6oiQYdCWChIisCX
 vR/q/iqwLUnsL9eF9kz7Rainz3+rjUwrnSykLvIPNoD0zmIFRxjLPYjZDhiPCKai2G8J
 jF+A==
X-Gm-Message-State: AOJu0YwpfCmf/0aIpmn4lX4mhUsbgFKMNnsjO2ln1lq1tblic3N3b0KE
 QnIK/lb4fchYAuuyar4Z9OlBY1z3gm+gcuSTBeut1BP1Tgk9RUsFQ9LTvB64kW+Z5yTJWj3gUtb
 u
X-Gm-Gg: ASbGnctyVqtekrhwSUXSuyzAGJrq7917KRz47CZ9SBx6vMIBz5coBw5zF4pu/8JVazR
 Hf+hivauEqiEJ+n+RJsWK3Uv8CGPnRn9U7QlLqspj69Oz93Js0wNT/ycPiRWJBD6TJWJp9xibZZ
 EqBT/886N2tr5fw83lgQ0UOUZSWUjILD2UPcn0er8KXn13Jj+DwF5gZzKM99Xxf1tLewhUzq12N
 sfTCNy+yrWKRF2WctAUfYehqJGdHoPKId48GwPWUS5eeMJQb8RpUJe6Y1WLkukshT33PsxqTAns
 YVJj9trzoHM=
X-Received: by 2002:a05:600c:4e89:b0:434:f739:7ce3 with SMTP id
 5b1f17b1804b1-438913cb518mr283514855e9.8.1737736203723; 
 Fri, 24 Jan 2025 08:30:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 68/76] target/arm: Enable FEAT_AFP for '-cpu max'
Date: Fri, 24 Jan 2025 16:28:28 +0000
Message-Id: <20250124162836.2332150-69-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ff7Ocns67M6J

Now that we have completed the handling for FPCR.{AH,FIZ,NEP}, we
can enable FEAT_AFP for '-cpu max', and document that we support it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 60176d08597..63b4cdf5fb1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -20,6 +20,7 @@ the following architecture extensions:
 - FEAT_AA64EL3 (Support for AArch64 at EL3)
 - FEAT_AdvSIMD (Advanced SIMD Extension)
 - FEAT_AES (AESD and AESE instructions)
+- FEAT_AFP (Alternate floating-point behavior)
 - FEAT_Armv9_Crypto (Armv9 Cryptographic Extension)
 - FEAT_ASID16 (16 bit ASID)
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 93573ceeb1a..0bc68aac177 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1218,6 +1218,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
     t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 2);      /* FEAT_ETS2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, AFP, 1);      /* FEAT_AFP */
     t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
     t = FIELD_DP64(t, ID_AA64MMFR1, CMOW, 1);     /* FEAT_CMOW */
     cpu->isar.id_aa64mmfr1 = t;
-- 
2.34.1

