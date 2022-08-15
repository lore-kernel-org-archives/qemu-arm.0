Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1358470ejf;
        Mon, 15 Aug 2022 12:03:11 -0700 (PDT)
X-Received: by 2002:a5d:4411:0:b0:224:f694:3e62 with SMTP id z17-20020a5d4411000000b00224f6943e62mr5827714wrq.47.1660590191611;
        Mon, 15 Aug 2022 12:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660590191; cv=none;
        d=google.com; s=arc-20160816;
        b=V7UgjxsU7T/K6pGAdVC3i+IPvsuJvTqsOJLK/29Cku2oZBMalHrcOadt4YZV1vcbT2
         n61p8rf0h8jjYebQOQGaceLTmNbg4mkMzfdG0tnbEMYk/+MwhjnAXI7BX4bub7SlU6sm
         YBWATns3O0Hd9jmgN7pTmrImC2BQx6u4pn1eSe+xo7EjX0TgyjUr0wEa8i6kMRXtFpUa
         0HlCisPrl89E+kiG2VC6F/cN43O+8sMhrjeSaJb+nUq/X8bhvbt7tXRd2GH2Rkn4MxH9
         6wmwcUf8gDepDQHuq2eIiOJQ58SiGN5OeULDDZoTxMJdJkLegDm6kxcHo28BA+RcuK/u
         mbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PrqYC+Ea+m5GjOCDRyOYZzhgmh4N94e3qWCRBEWRM+s=;
        b=tzZlMNERF7o7+6iJu2iGZSSEy9P3E7cjpoHIO38STlKz1yEmYm/hprYBxotMbiLKAO
         8abviIBWlxS02oxVgEEyzRIUKwyFBeGUk9Xs5mJRoa48aqibdV/FDz6YhuiYn+PQlN2G
         rF62l8aEBYAV7y/lY7Zw+aoaayII47wXDIKDaNvx9QI/5GuBAVr3cx7wMr5dLevIzIda
         HfAv0zUNXnAHCHiy0svSmGO2dRuy4JFw41fJoQHMBVXuBg57jbxK4gDleptc0sB0z7yP
         tSxP89xHyhfGVgJlHwtLEudDJ6PdVvz3KfFrKpq+lBMhkxB/tLo7t+Dwsst7m4YEQd1Y
         pL5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjVCRCi6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d22-20020adfa356000000b00222cdb9f058sor2822317wrb.45.2022.08.15.12.03.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 12:03:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjVCRCi6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PrqYC+Ea+m5GjOCDRyOYZzhgmh4N94e3qWCRBEWRM+s=;
        b=DjVCRCi60O1vAe97iHukk9eRK7yHiuq9xuKeamidUhGOCB/NmI58spRh0s/Ki5XwwI
         HOxsU8cmasSptLjE8wyZH/mqIQeLlEFLU9FdWFKRQMekDyws75fLGUj42NyjwYtnbnjF
         pMBvvpAxoWezzsZeUaerQXRYnFeE5Le4gRGXU3WS5RPX+XdXimyBk6jeJaqXEyisPdPN
         PGXeq7TrhXTGjXqTpb308RNnjSOq3VbJE+0gjkowCtv2O9cMfW6sKXaecscOtuLgOFU8
         tF1q4gZF9VajwtanfrWvp6bXbaXvu7ZvNUEFZZOud1+9CTgYudTsEyVxXXO2kiggEcGI
         FEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PrqYC+Ea+m5GjOCDRyOYZzhgmh4N94e3qWCRBEWRM+s=;
        b=zo71KMKxuhl9hkEktKeE2Im9gPsma//Ar0avwlXfCuUqmarfWWPiqN7fYExKi+z87v
         4w6VNAttpgBPCsho62iJHoWMbRVxaBMlHvkeui17P+slO1JdbVVvgnso6n7a+IP5/w+Y
         4XPvgcSmit6wtX414uItuxPtPlBQDdJXWO+rxdz5vL7nseD9mGcuzzRUHCaeWfFVlzMh
         5xqzGCtsy+brisTqvdVzEeu8WMfORp0j1FQhqvYj4d66fZRsXoK+TFP5X9NEPDxTxEf1
         +9t7y0H0pzkVhEpHcR77ZBQIYipOj/UTy7L1ZCTXPxzb7deaBzViDB3QZ6T1CvGv+YRi
         cmaw==
X-Gm-Message-State: ACgBeo1gwkBEL2ILRkThFlHPLMlLYO6vCFnAUf/G+HIWv89djwTc6xVy
	JYz5BkhR+XRkIrMt9jijcR7+ZxqE
X-Google-Smtp-Source: AA6agR55TLqg0vhN0UnaLF8XG05JJjbRv+bApYIf9XYML7NPEexNNps77mRl9pDSMhK1XjyEVuUTzg==
X-Received: by 2002:adf:e44b:0:b0:220:5bc5:e942 with SMTP id t11-20020adfe44b000000b002205bc5e942mr9410873wrm.179.1660590191359;
        Mon, 15 Aug 2022 12:03:11 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:03:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stefan Pejic <stefan.pejic@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 3/7] target/m68k: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:02:59 +0100
Message-Id: <20220815190303.2061559-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PErJgfkeCczb

Honour the commandline -semihosting-config userspace=on option,
instead of never permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled(), instead of manually checking and
always forbidding semihosting if the guest is in userspace.

(Note that target/m68k doesn't support semihosting at all
in the linux-user build.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 4b3dfec1306..a96a0340506 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -203,8 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cf_rte(env);
             return;
         case EXCP_HALT_INSN:
-            if (semihosting_enabled(false)
-                    && (env->sr & SR_S) != 0
+            if (semihosting_enabled((env->sr & SR_S) == 0)
                     && (env->pc & 3) == 0
                     && cpu_lduw_code(env, env->pc - 4) == 0x4e71
                     && cpu_ldl_code(env, env->pc) == 0x4e7bf000) {
-- 
2.25.1
