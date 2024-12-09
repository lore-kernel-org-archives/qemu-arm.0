Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2868039njb;
        Mon, 9 Dec 2024 12:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUINNnJHK8TbfRYAV6GOVXjabYlG1ufixGO5YIWzAbCUl4IlXN+CF5mSTV5zOU1s/Oc7BNNHVRBShL6OQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGT76w2lLGQnSux/p7kjFLFw0qXsjkAZomR69POsuxkTI6qopvUHi2FCbAY3pttD9PwGDpu
X-Received: by 2002:a05:622a:6a07:b0:467:51a5:8b74 with SMTP id d75a77b69052e-46751a58d47mr94280891cf.42.1733776722255;
        Mon, 09 Dec 2024 12:38:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776722; cv=none;
        d=google.com; s=arc-20240605;
        b=kdYqpO6U6LnM53afFh5XTnnIZbQsCYgGQBOR7eghxiFNHQTsotfWEXVMrxCd3G81Yo
         NYlGBHCdHSQpeMckAjqIWo972yaXY9JRCviNZ7CI+794BcgadcFOngsjMt8CE5rfYeCG
         OgmuKym5UEcSDegLdcDj5gfw0JJVuwphzQfY3JODmfBDpa2TIytpI4mdNNBUZNoOfClg
         9wdMTtelIOc2A4EqivWxsry/ctsb6Vc2AReCZ0aqdHodSq5+qWe7xoMYLv4N6ynZHhDb
         MMofSLcjDDQcDE+G7nR868o4dZD2VvAUmaXPoqxufOooAMlPJ0bFdExcJeJke3JiEWrZ
         Y7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z36PaPssdPX4LUQilDfpdanawwu1/7BMip/Q5SIiz60=;
        fh=bQkS108b468PDWrMlLdqLKWA8DzC4ZergiF0RQEBaSw=;
        b=gMfw/k9THsG7gjWPENEIoXbU0UBqXOjOBB9Y72LJhMVuxl7gkodS6QeLRLd1xveV2o
         sjO3um4mbZONVqHDdy3Xm/za5gOxfze3D2gHtp7yYFJev9FaDR3syWOiFtProj61jSP9
         g/ttj5G2gkyP/MSRUUuNl5nTSgqT3v55Ei8ue9flFrHklMCPSgHVVlSs48gJmLJQCM7p
         Q9oBzglm2B0u+Ysdqt0EyQQLMEYf0gMFLgMx33DCaL6Wp8wPe0ymp724cg2Nzdxf7IJM
         AvWjW47ID4MvGx8l/CN2LOwzn5BZSEFBz0WDTr481arD1Ou3g5dJDmuXFRWekBLHs1x2
         5S8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=lp4X1goY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467451fa63esi75041331cf.360.2024.12.09.12.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:38:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=lp4X1goY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tKkV9-0006Ez-RH; Mon, 09 Dec 2024 15:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV6-0006Cz-Ds
 for qemu-devel@nongnu.org; Mon, 09 Dec 2024 15:37:04 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV3-0003Cn-Cl
 for qemu-devel@nongnu.org; Mon, 09 Dec 2024 15:37:04 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso166505766b.0
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2024 12:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776620; x=1734381420;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z36PaPssdPX4LUQilDfpdanawwu1/7BMip/Q5SIiz60=;
 b=lp4X1goYUlXI2n4VhWK70QV6t0dLthgN4zl/5Z2T3OeWc2dUT/YJAYK6Ot+3PzjmA4
 cee/qaRLf+fQ+EPOl/opnSsEmjqouLUPk8PwmUdXAUH5QMefr29RvkUxEKIXVOtj11Ks
 pmh6ILqlPJWE1c1MV3QuCI6NV8ZRB/0ZRu3a843vWlusR/nYJpRJoy+c9NpzlI9s1DpE
 GwKzX/DG0TZuJPa0mW5pe6AGnUcXxQe+iWuqt7HyMINcP8cttEhKDicW3ijhjThra1hy
 vkDixevRKYrq3Nqf8R4Wrn+5gPg6qkoxHWx58FaU7wjxzSVVs1lN9vurlgz3VoaK/Pch
 BV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776620; x=1734381420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z36PaPssdPX4LUQilDfpdanawwu1/7BMip/Q5SIiz60=;
 b=luDrKFI0KdKHqKBNUXY8zo8YuMuroLknB9aGF6Op5ZJMClz9wzq8wUgNKMtXKzXPEG
 VOEwH5f0w3caY2MbSfvKY3wRLXJmVV5dt50X+uStge7lZuvEhIK9cs/7bVCzCvRMNVjb
 VqYcpKeM7hv3ATuS9zcdUnwPy3yXwTWsrx5WtJN9CZUbN6DDGZtvTR3jVAExiHrB8n3U
 8QQZDSh0Kv6iZSiF/atlESfkyj2ThokY0r6x/UwqRg2ivhCKnuHgYWPBsSFb/DnJFB9Y
 YRH6ym+B3Vb8mqzotiKfdq/ycmgp3rD+5OE39VwyRj42EGg7T+AcxKeOsdyEQwBDOsAw
 Ll9A==
X-Gm-Message-State: AOJu0Yz0Bf1ag/C6XUmqliCmoGdBzBJugZyzYdr2IpQuZY3C/43QLxPb
 jiincLNn58kxzYMz0tRI9+YZ2QXK5R2iWFjBDEU1QR6Q1FRPaneIuKFye9/53wykf4zVB2lQyVU
 p9A==
X-Gm-Gg: ASbGnctMdr+dlb7UwKnB4A6DNh9HiNkEF6mWbRUVn3/P8C387QrG4WYALLrv3aXU9UN
 JjIIkLmdDjWh34mSeS9kaFJuSvyFYSEhCsIaEjW5PaynOJDtMkmj2qf32o5Ec19B52RCsQlDddc
 1z/0VfxiOF/0Oqrn4rEL+rhJULrunC3Odathr7mhQ4nNDqLQ6eanXU7BFprBjRaE/Y45tHtEk04
 pM6itLOJIl1caHAU80AB2ytqmdD0YeuNghB/pUw+6KUDSqqL0+geXwJjlUHOUSteEQQHiISEKvL
 5HisTFWUtWgLuM3dfRCZlAYjOlGsMw==
X-Received: by 2002:a17:906:4ca:b0:aa6:2d86:bd2c with SMTP id
 a640c23a62f3a-aa63a0ed36cmr1178098066b.21.1733776619685; 
 Mon, 09 Dec 2024 12:36:59 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:36:59 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 02/11] arm/hvf: Initialise GICv3 state just before first vCPU
 run
Date: Mon,  9 Dec 2024 21:36:20 +0100
Message-Id: <20241209203629.74436-3-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241209203629.74436-1-phil@philjordan.eu>
References: <20241209203629.74436-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::629;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x629.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VY482XUWhkvd

From: Phil Dennis-Jordan <phil@philjordan.eu>

Initialising the vCPU PFR0_EL1 system register with the GIC flag in
hvf_arch_init_vcpu() does not actually work because the GIC state is
not yet available at that time.

If we set this flag just before running each vCPU for the first time,
the GIC will definitely be fully initialised at that point.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 target/arm/hvf/hvf.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0b334c268e..bc431f25cc 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -993,7 +993,6 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     CPUARMState *env = &arm_cpu->env;
     uint32_t sregs_match_len = ARRAY_SIZE(hvf_sreg_match);
     uint32_t sregs_cnt = 0;
-    uint64_t pfr;
     hv_return_t ret;
     int i;
 
@@ -1042,12 +1041,6 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->mp_affinity);
     assert_hvf_ok(ret);
 
-    ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
-    assert_hvf_ok(ret);
-    pfr |= env->gicv3state ? (1 << 24) : 0;
-    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
-    assert_hvf_ok(ret);
-
     /* We're limited to underlying hardware caps, override internal versions */
     ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
                               &arm_cpu->isar.id_aa64mmfr0);
@@ -1063,6 +1056,16 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_vcpu_before_first_run(CPUState *cpu)
 {
+    uint64_t pfr;
+    hv_return_t ret;
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+
+    ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
+    assert_hvf_ok(ret);
+    pfr |= env->gicv3state ? (1 << 24) : 0;
+    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
+    assert_hvf_ok(ret);
 }
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
-- 
2.39.3 (Apple Git-146)

