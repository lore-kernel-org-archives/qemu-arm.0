Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086184njx;
        Fri, 25 Oct 2024 07:13:11 -0700 (PDT)
X-Received: by 2002:a05:6512:2306:b0:536:7362:5923 with SMTP id 2adb3069b0e04-53b1a2fe329mr6096321e87.1.1729865591721;
        Fri, 25 Oct 2024 07:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865591; cv=none;
        d=google.com; s=arc-20240605;
        b=DH8znSZbAKChlL5TLOlnOZ8RwF3xNuDaX6jXuwNcmCLV8HFaO320Ma6KDTM3vZaRxK
         4a11+Q8dMkfGqlrhwbZgsRmxWG0ey6TuFvxetvgQ/8khnTMHZPpUS4fX7doCTblZaGZb
         oURirz8qhDygOEBzj4O58WRkKnG/d/HMSXHb2BNO9S5dOC/WQ+W7IfFOzP6POBopxD9u
         vLwqLR6qQ/n1nmqolRcYE9f2334VvqtAKQl/lFhj/ukcxqSjIlu9BFw9x3DwsYD+A+Ds
         QR+CBRla2J0gsK/F0zcMnwXKjtZ1PVA7ZiPnUktHo0zouY86L5XcwJKOBWmoCPwUkqj8
         IuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mCkNXmPfCnwutAypvXIltADsiovUrFYgTsHQnSnupeI=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=TNk1VvfO1SaDeU40Itr+WpQpccUBKxG57yLFOsCkpuBDsBM/CvX3Z0zlUA74pRbchE
         RVNod4E1Gq2Yo8Q+m+okK6Z+7mOk7B+/kf2Tw+Z3SfCwoKXzyvEsUTd8DZPEABlpoFwb
         nYBKhak+3qh59F1PQCiFVGJmd/LzROMzBla/P16fzSjU9g30bvphmxg+5FrL/8Aygwkn
         frD5iyemn3GPFU5dPLd65nTIy8x/mLt8w+jOODtzCB2fKVcRnt3id8fXJbWiBHcePJqE
         srkg6JwT1lwIeoWxi7hjlme9SohR5vm3IVdu6OtkEPMUzFZlNuHW6ThbNMiXidYkBaH7
         DjPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPdaz1c0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319397045bsor4479635e9.9.2024.10.25.07.13.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPdaz1c0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865591; x=1730470391; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCkNXmPfCnwutAypvXIltADsiovUrFYgTsHQnSnupeI=;
        b=nPdaz1c0/7CHTwmFSiPFinpd4Vos0IHOT59II2Lbfanb/+D2Bk8WwoiEX8Znm5HOzX
         PxpAlJRpMq572waBfRCxdz67cm5HEXHeIp/YVFzsIwYq2qFsNj5fzGHRNGbPLS7GXRAw
         q19/+bS+prsG2fSuYx3PE4nS5ONMEC0nJOcREGq8tJidwJyWBY78HLcr+Q6xYAvZRBzo
         OBXEbDEIxWkMmAAdXSrmNZDKdu91rjD4B/k8dMU7DJwai5Th/Hzw8Dg/IAVB6PkSBXar
         6L2M417PdGoooLqszaulsnjqe+rHsr/fykrzaJvEWCYNzm3XIgi9vKAcCxoQjMQMGcqd
         MrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865591; x=1730470391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCkNXmPfCnwutAypvXIltADsiovUrFYgTsHQnSnupeI=;
        b=gfXronBE2Tg/6WenWqW5yfsRtQc84Ost7hshd8hToRybJ3xPJnXuOY+Yve/gmZNvWh
         XJNmJmzWSxxzTRuvw6BQp8rfQIoKZbJN9yOwioUyBjvY/n5qhofvFw0Pr3tomlCtZ6M/
         jKsW4ODP9acYTMePmdY6ra/hliAfr5nst6N2lOmppTP9mOkxVyIaV+aoecKd/TG0932j
         Hq9qiHePgN4VGA+rrR/cbYb4pIM/bZAzmLU+3lXLvJLHFsLi8eQRgwTc8xvGFZAWNe9G
         hGq1u/kv450qeI2lXRaPZYacfYaNuJLvO2gMaKZEhdEbB7PCGqmWgZ/1kZ7MZvfpA+p0
         g8Ug==
X-Gm-Message-State: AOJu0YzTvFqsYkHBdG3rtAJJuwRIS9Pk8/a11xUO99nHH9Nf4oB2f0oe
	+ROvDLg72Zl3diazmTg/o+LFt6I4ElE/Rp0w2mTPXPxBQn/Gtaw4MwJzVXbjxmlD9A==
X-Google-Smtp-Source: AGHT+IGCfuJvgEuS7mdaniKHTJpPLHMzAXjXMIj8NGfV9QhRf3aVvXHwK13uI5ILUl55ENf6cj2t+A==
X-Received: by 2002:a05:600c:4687:b0:431:2460:5574 with SMTP id 5b1f17b1804b1-4318418ac7amr71250255e9.27.1729865591153;
        Fri, 25 Oct 2024 07:13:11 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 17/21] target/microblaze: Move setting of float rounding mode to reset
Date: Fri, 25 Oct 2024 15:12:50 +0100
Message-Id: <20241025141254.2141506-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: s9spqf1WWhTy

Although the floating point rounding mode for Microblaze is always
nearest-even, we cannot set it just once in the CPU initfn.  This is
because env->fp_status is in the part of the CPU state struct that is
zeroed on reset.

Move the call to set_float_rounding_mode() into the reset fn.

(This had no guest-visible effects because it happens that the
float_round_nearest_even enum value is 0, so when the struct was
zeroed it didn't corrupt the setting.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/microblaze/cpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 135947ee800..6329a774331 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -201,6 +201,8 @@ static void mb_cpu_reset_hold(Object *obj, ResetType type)
 
     env->pc = cpu->cfg.base_vectors;
 
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+
 #if defined(CONFIG_USER_ONLY)
     /* start in user mode with interrupts enabled.  */
     mb_cpu_write_msr(env, MSR_EE | MSR_IE | MSR_VM | MSR_UM);
@@ -311,15 +313,12 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
 static void mb_cpu_initfn(Object *obj)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(obj);
-    CPUMBState *env = &cpu->env;
 
     gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stack_protect,
                              mb_cpu_gdb_write_stack_protect,
                              gdb_find_static_feature("microblaze-stack-protect.xml"),
                              0);
 
-    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
-
 #ifndef CONFIG_USER_ONLY
     /* Inbound IRQ and FIR lines */
     qdev_init_gpio_in(DEVICE(cpu), microblaze_cpu_set_irq, 2);
-- 
2.34.1
