Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1358528ejf;
        Mon, 15 Aug 2022 12:03:17 -0700 (PDT)
X-Received: by 2002:a7b:cb55:0:b0:3a5:41a:829c with SMTP id v21-20020a7bcb55000000b003a5041a829cmr17512833wmj.153.1660590197211;
        Mon, 15 Aug 2022 12:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660590197; cv=none;
        d=google.com; s=arc-20160816;
        b=ezxzd5pRUg3dWXPvYat9OBN6KFtL8I6lrmUp2XK++Km8EFvOnsEE8DV5pnNXkkOtuY
         QSGQbLMZdyIFlDVbfERB6igsSxfFj3lp3uLrc+mkMQPEZWrstTFA6r7HEIcJPyq1pgJK
         nV9OU6VoqQYnCbLJIOOKSosoDztKnguRh2T2aqd/fD9jAb7nRNfOcXQiKpyVGXzMW4y0
         UA7+a9wwOTIVdGSENIErPgu4D5vGs7GL344YbsuQHOSufZLxlYDHMzkIpg9SzAfvkuSR
         6EI2vYjj5NA0YT37BkOAurmM2QZQ+FoInuP12hqANbK13xK8C1NhJPYDw5H0JGFxwJ0Q
         lwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5A8TTs3Va2xGJWkOhhlXWoJrKWuE9dh71r64qnA1hXg=;
        b=aFQ+GkrxtivRD4hJed6xV5SfmzZdvo4uOXA+FbzKngHkUy8qYgUXOgbRl39IUb4Ter
         samsazwq8nIhSPbmGwfAmIXcniCw36qFLMQnv8NFQrRHSn2PnYNZdl5VOuKdYB+CDOg5
         T814sJlNGcWAUJI7LqENw2ln6+Hvgv0DNZX4teWsoUHdTtmuMmWFkFwTpHqpHAZCwJg5
         psiSsuAGI2EdnLAzpJCLoOh01OAswzrNT31VZ3j6rJtdlPtd9UIH2Dy9t5fuvcDJiLTO
         Vdm2LHybyhuqLuVnbO6qPGmDmWjAUL9gI0/7nTs2AarRxIECE342Fr4vmgxm6nn5HaXY
         0c6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TeWQ0uXT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v5-20020adfa1c5000000b00224fdd9a14csor1837250wrv.24.2022.08.15.12.03.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 12:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TeWQ0uXT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5A8TTs3Va2xGJWkOhhlXWoJrKWuE9dh71r64qnA1hXg=;
        b=TeWQ0uXTpUmhrYxNlSOllS4QmD8AgsYS2jCWVfMlAFYXcQg2q8CEwCvzAKIYG86x1g
         uhlmYiGFqLV0s2WRElGq4bgYA/Xs2y1MIEoJPuwfB7ZSaZ5u/hrzSiEbfRDSXu1jYuU4
         ORn50gpZ/884Cr0T9N0zuAoYGNpSM3I+3PE32sDYDc2aq+xzV4Gj2uKyV2YVBgwrsGf2
         E4GycyuDeNprCM8ZAfVYFljaGEvUg8Ba++BKffpBcHQR7RSLpAyjm3wFszg0IjxfLQwD
         CFabguJUycjq5iVdrNRfLdbbls0bRnAxaidcXMaEFrINbd2oYydBtmLnt0eX87esq+qC
         rlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5A8TTs3Va2xGJWkOhhlXWoJrKWuE9dh71r64qnA1hXg=;
        b=xacvqBu6rQIcXGp+BvEAE44iGreg+MyBENc9GOfQEXN7S4W7Fb2acI+eWdl8JsfFY4
         +iYgPIeFTLec7870bSJ49QkjtwAvKLCjIHGyp4pL4riblZmX7Fof99UuXEt1TlWlf2cE
         ONWP2DOJY0FcL6Qbnu9SvCcZLrC/e0aRGIpj99XU3dpJoJ/0T5OqcK6c46k1r5/APvs5
         3g8ctBiMkK3K5j45fzuf0oNiFOH5sk1/yV3CEWPRN0K/T5RcMINmP2FDjFaTgWB53QKR
         MV3ZejOudv76DyAzWrAaSXFETPITzrzFznXjTO78VztfMzhBBnF/mZoz3bDNXVo+P5ur
         iemg==
X-Gm-Message-State: ACgBeo0hyAqrjug9G/LnuX7+mhQ9+UYZoZLJFvhqeP/j4zI5rjGalCXR
	0BYvzyIrPykY8yv3CRUM9O/3yM0+
X-Google-Smtp-Source: AA6agR7ivGz6wiE4XkaUzAm7deCGF44hrBsgRWnrw1bfLTzdFA1uFKt/1pXreYySn9bfTKFExHCVZQ==
X-Received: by 2002:adf:a448:0:b0:223:a061:521b with SMTP id e8-20020adfa448000000b00223a061521bmr9765234wra.695.1660590196996;
        Mon, 15 Aug 2022 12:03:16 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:03:16 -0700 (PDT)
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
Subject: [PATCH 6/7] target/xtensa: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:03:02 +0100
Message-Id: <20220815190303.2061559-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Jux3UFLJzWaN

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

xtensa semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index dc475a4274b..43d55989349 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2360,13 +2360,14 @@ static uint32_t test_exceptions_simcall(DisasContext *dc,
                                         const OpcodeArg arg[],
                                         const uint32_t par[])
 {
+    bool is_semi = semihosting_enabled(dc->cring != 0);
 #ifdef CONFIG_USER_ONLY
     bool ill = true;
 #else
     /* Between RE.2 and RE.3 simcall opcode's become nop for the hardware. */
-    bool ill = dc->config->hw_version <= 250002 && !semihosting_enabled(false);
+    bool ill = dc->config->hw_version <= 250002 && !is_semi;
 #endif
-    if (ill || !semihosting_enabled(false)) {
+    if (ill || !is_semi) {
         qemu_log_mask(LOG_GUEST_ERROR, "SIMCALL but semihosting is disabled\n");
     }
     return ill ? XTENSA_OP_ILL : 0;
@@ -2376,7 +2377,7 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    if (semihosting_enabled(false)) {
+    if (semihosting_enabled(dc->cring != 0)) {
         gen_helper_simcall(cpu_env);
     }
 #endif
-- 
2.25.1
