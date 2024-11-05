Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2805918njc;
        Tue, 5 Nov 2024 05:05:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6yvPY3EcqBT6Eu6CAc3MnGeezdWCzM7LuKJGyhr+yitD9L0+4+zowIUWXiI65CbThmPtGqTTWnDKm6A==@linaro.org
X-Google-Smtp-Source: AGHT+IFXAhqbzb5JWVv5tUi+dnDUqUay59bTeSdOk4DhMvx2AJciSckx6LXC5kItBBm6jPSf837p
X-Received: by 2002:a05:620a:458f:b0:7ae:d2cf:aef4 with SMTP id af79cd13be357-7b193eff002mr4807791585a.29.1730811922405;
        Tue, 05 Nov 2024 05:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811922; cv=none;
        d=google.com; s=arc-20240605;
        b=XPctyXWYQJ18vhQYtUooLYEBbObd/tlEBjV6trvNr+tuU+dqH/ipPa1atP+PPJ3Pxv
         qyhsB+X3hDQEuQzL2IJLSTY8DAOfXmfsl96rOQExoEQN2DVf2HPMgmgz9inNcjqkYZUb
         DT0hm3OwsURYRc/4mstkcvtKVmGoQzXjmzhXw+odEpY308CGEvwcy6waE07H3TjrmJus
         1H275i7RHm8BJuDhOvaKR5c95mDX4ZPqf8hGPfqy1iVs99zn3LXvR7EefzDqGaoRyYl5
         sSf/wtA+RKIK7xWOOKXDs/1AlbKU0UfAvvC2Kz1sPD85NlXN9TiBmVFDUiJmVsaTbjEu
         tjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iDSm43fdf8jLcDNMuepzzXNnXrf+Cwp4vQFZzGV7m7k=;
        fh=8JGb7tbIr/E/mffosNfvc0nzzRHWqObiu4mJbBJq6XA=;
        b=IIp9WTFQwkJeW4k9f1oPjCcdsUvL2saWZk9F4Ts6Iw9Dq3cjumpuVFiMlukHVEJV/G
         gHeVg3OtHYlBwWGjEfEbX5sYji18Q2JGS/p3C0aUbMI4BV4m6KPWyQDvwF+FwYZ8CZP7
         56vxonMdPWNzx/hynRAbzU3e2N+rFOiscJK/oH0hz72N5Nq4kkvzjqjeAK/yw76R56ST
         RjjxeYJNSvwfCnz5a7glnYfzrVNjqm46azI5gfifaoFyWy7wVosPIGLuV0AYSoKHF8Vv
         8zyv3PICyn/uAy8s+nvMnURIqrLmn38+WvuyI/N856byeRfm/MgaAXl+follmeDh3hZW
         1HOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6JTtC2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1ec2b8si144000221cf.465.2024.11.05.05.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6JTtC2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JFF-0001M8-Dz; Tue, 05 Nov 2024 08:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JF8-0001Hp-BH
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:10 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JF6-0002NZ-Oh
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:10 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so33968085e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811907; x=1731416707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDSm43fdf8jLcDNMuepzzXNnXrf+Cwp4vQFZzGV7m7k=;
 b=E6JTtC2VerCypEMjEv0NrrwmyGtbzYxaYorTGfowQbVQLIK0Vr5Rgt5ExV9Wg31Hl9
 7sAasAYWjnpQBl1lAt4P/oqK4QSUxenfLpbBm+Ak2pj7uRoz4cZoKm13InPt/kGMQSlk
 ODqOLuIvOZqlleQqBTE8vN3D+1CzutbyLsW87X58VFZuOuSOtKMHHyqbn7B//eyGFJSa
 QVaGf2K7LLhxJ3+2rOA5JJJZn5Mrti6fqT0S7wtBG60FDfFbt0PFFTY2im6WUU0dewV0
 Fby0Ere3onUF7amFdR81S4myb+aeykPcXUewlqeA1EG24f3tuECAYXw2QZ7idaujgf6Y
 qAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811907; x=1731416707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDSm43fdf8jLcDNMuepzzXNnXrf+Cwp4vQFZzGV7m7k=;
 b=ohWGlqUX5V3j1T/HrTKHrrzfw0lcAR0dfJifnJwZGlB78d1O24+vpJbZ8DNf1s+wpy
 TSzlnxaIwjtzi10536YXWTwQo+WoVUYbs7h/9oISTRmimmzpiOBbQ3WlBSz4++iyihFq
 4HG76GpyDYbR9FLLlKgecJovDTrE9EdTP6w3DDWsDe5i3WTeCJILleI/TVRIfGfq4pLA
 mPBsnTGtrWVJ6hpailXDHYVPs1sPHx2+Z7hVLBGG266DbWVb5xvSXYrmBOb7Yyn+uS9g
 KwMeMHOICM6uFwLKfu+FXrAtfz0cCcJST7u9P8rrbQ0EdIF19IrJRNDIHb7261RGXYWR
 5YGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHNjsWDdZ5/HMnq2Vd0qHM1Nwn+cBpErZjArdzuzB3cOy6CEDvEQh5M9FNGhMl+nvJ2LJ4QdsPhg==@nongnu.org
X-Gm-Message-State: AOJu0YwHlwjrJnXEj86/6f5hRSgA0044tE2dah8AuYPY9QC23tuphL+9
 g2TM/4igc7t+bo6PwS4iWh53Ws99BIytXPnQWa5+s/A6ObBlqTtcPcqY8UpIFKA=
X-Received: by 2002:a05:600c:4ed4:b0:428:b4a:7001 with SMTP id
 5b1f17b1804b1-43288c32703mr112566525e9.15.1730811906941; 
 Tue, 05 Nov 2024 05:05:06 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e687sm16288378f8f.84.2024.11.05.05.05.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:05:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/19] hw/microblaze/s3adsp1800: Explicit CPU endianness
Date: Tue,  5 Nov 2024 14:04:15 +0100
Message-ID: <20241105130431.22564-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RM/VLX8oBUjb

By default the machine's CPU endianness is 'big' order
('little-endian' property set to %false).

This corresponds to the default when this machine was added;
see commits 6a8b1ae2020 "microblaze: Add petalogix s3a1800dsp
MMU linux ref-design." and 72b675caacf "microblaze: Hook into
the build-system." which added:

  [ "$target_cpu" = "microblaze" ] && target_bigendian=yes

Later commit 877fdc12b1a ("microblaze: Allow targeting
little-endian mb") added little-endian support, forgetting
to set the CPU endianness to little-endian. Not an issue
since this property was never used, but we will use it soon,
so explicit the endianness to get the expected behavior.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index dad46bd7f98..37e9a05a62a 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -71,6 +71,8 @@ petalogix_s3adsp1800_init(MachineState *machine)
 
     cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
     object_property_set_str(OBJECT(cpu), "version", "7.10.d", &error_abort);
+    object_property_set_bool(OBJECT(cpu), "little-endian",
+                             !TARGET_BIG_ENDIAN, &error_abort);
     qdev_realize(DEVICE(cpu), NULL, &error_abort);
 
     /* Attach emulated BRAM through the LMB.  */
-- 
2.45.2

