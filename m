Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2401139njk;
        Mon, 27 Jan 2025 04:32:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWc4rrVirj63a0dUQxvAonU4tcMrFtwIr7bYqNK03sxA3CyPgYxO4PROEizQY0knUHr3fqJHBkrA5fzmA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4RyFccaFPPNkkaKmlmmo2ApM9yeOweRMpILB9M8u0819dunWrtsoW3x5xW702qJ90q0Iz
X-Received: by 2002:a05:620a:3947:b0:7b6:c540:9530 with SMTP id af79cd13be357-7be6320c460mr7108858785a.25.1737981159620;
        Mon, 27 Jan 2025 04:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737981159; cv=none;
        d=google.com; s=arc-20240605;
        b=Tn+wiQE/AIsaBZ1pmovcuEYB8yTgH5WEiDx62JEntXi+CcQzirGCUkH8XPBLnWid2o
         HVQPC7BmU9lubbTte24ca0ulwuOpIB1Ifthdg5Mqsb3E/xHa7cV8y5vXEsev3tyBnxfj
         PRPwESChOmKrxFXcg/tQoTL+WRIPnP4p1a5ZGbqzcUpxBUwgth8SCSXZnnvl5OCBE5UP
         aspHW6d4b/KZ4XhULUYWeT3nK9mndHZBzr2lY4AfVxMJlPyhP8ffNrr01z0NA+CkFv1r
         g+n7GFIWlAOMhzEm2L7/0u9t55oPjMx1WMphyjqcaHmjpmJuX4xliGOG5uOjAAm/MlCe
         2/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=KSwYm9Ifvrp3w/cECG9Gy3rSjhlrv0zcjhWArVvCSig=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gVTaS3vu/Cbr81NzJx9IxMiqf4rpWWftX/4lATtOTm7HCM1CG4gzQGr68sWm4oTYyT
         XotWKdTn/kAfIHJNSP35OaI/tRHp/JoXYf/RpKctdCxqXgvnQcPf9X43/WwvzRsGvSr8
         eNu5AvvCeAR8fDvq/uSMFIX1oIqPz40V6UnaTTqGZ/1OhtLrg8TsKj5EE4+UhFjqR5NM
         l0YsIXNlkgO/vq8mgOAYUIbBKMh8tvuOv50tvy8XbisSXmQR3Et/kiNbjHtjh82frgab
         RiHAOV2P4lAzEmnwPIgMmB4KzNXCB9U+iDf50sSlx2+bLWEedwglxWrBiQqSoDXew94w
         INtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EfUFLFQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee1447si970172385a.258.2025.01.27.04.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 04:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EfUFLFQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcOH8-00045N-6U; Mon, 27 Jan 2025 07:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOGt-00041Y-4u
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 07:31:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOGr-0003MP-7r
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 07:31:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361c705434so30546205e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 04:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737981075; x=1738585875; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KSwYm9Ifvrp3w/cECG9Gy3rSjhlrv0zcjhWArVvCSig=;
 b=EfUFLFQ2TC9YW1K/ijIvCWWl0pUxa7X5P5DpAT9xuN4y5G5Ys1wEd3Tq7XZVRBS3Ow
 eEa6pFt391O5PvoCM9KGf2Vb1/FBqKUtoUsYqBzUMJOfVAr6EBkEb/ZweyJCMCyWh6V2
 ncDHvHoET0TSOXbOxwzhs31/g5Q9EM8Eowfw5R3clXo1O3RSAMwbffdyBh+LO2O2nnxl
 G+gJr/rq0+uqHnCvu+DHHIvTchLAbmi6XhziuF3XKATW82slSWk54OFKmeBqmqqZwsVt
 /+gNWGB2vt/Qx37FFx8fLVEyzjpIWgcKJ/i/p8IIQ91ZfwhRdzPPQSjCrqtOS+E+2Pc8
 VOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737981075; x=1738585875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSwYm9Ifvrp3w/cECG9Gy3rSjhlrv0zcjhWArVvCSig=;
 b=HqBhcpEtlOypMD2vAem2a34GYNIHhLeHRj8y1aZkuk02LuQjnJ8IH5bxazgjQQ5A0k
 16s09L9Urimudgk9pSL1lzmmFccJRiJoJG3WZ2xBiyM21AJlf62GR5fTwgQV+nOPj1a4
 bQWzUh3Is01i86JTmWDXpdrcs48PzkFj4l8Gv5Ol+bGOvoT0mH4np+0RMh7fG/biHbOy
 ED6qwjH0P5NbOpGFmB4RB9cunj/g4vT9kXn+z/YvKef9/6xHq8mtt3J2M7BWLMlwYaxD
 lOrpgRwJSMvaJju4S2CAc4AGHpBnj60OAeuL9mgAwZnk0HiUnjIt9G9QvXT7o9rwPPa4
 PjvA==
X-Gm-Message-State: AOJu0Yw8fbNjfX/VzSxSYazNzyfxeROjT7qXfcWC/tHQS+m7mJOwPMu9
 EiTJ8roYNwemETqDWWNBrhrWDwf5MEQi8jQBUfTpXBpbS7VYvZ+4o4wziIIxdgLQGpGbRmiTSkk
 0
X-Gm-Gg: ASbGncvsLB06T1gB+1WQRXJeGowlcA0+qJcgzDGrwkS9lYQUuZMazcQGZn9UjhVqEqO
 d9AdWgPbmDVeMGQlkIctr+fX2WsnJXLzsfwK1R6ABvCjo6FFlXQqjGf4ekd6g/m9i4envCr9REy
 f5x6vs2/s8kvHv7nyfTBwcs6ILaY80WS60wfQ4OrE8ytdNCakf9H3b/fQQ2DCG4dP9mL3s2oHv2
 1Ax4lJF7r9y+IESrNoBe2cOpwr0OdN2WHFyReK8mdL0JVzfCrjOJJs8d/jMdCS1Z1YcS9f10d0u
 AJqYGQVUuw==
X-Received: by 2002:a05:600c:1e8b:b0:434:f609:1af7 with SMTP id
 5b1f17b1804b1-438913bf885mr386127875e9.4.1737981075421; 
 Mon, 27 Jan 2025 04:31:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4857b8sm129052505e9.15.2025.01.27.04.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 04:31:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] qemu-options: Deprecate -old-param command line option
Date: Mon, 27 Jan 2025 12:31:13 +0000
Message-Id: <20250127123113.2947620-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: cTPs0uGm8Xyz

The '-old-param' command line option is specific to Arm targets; it
is very briefly documented as "old param mode".  What this option
actually does is change the behaviour when directly booting a guest
kernel, so that command line arguments are passed to the kernel using
the extremely old "param_struct" ABI, rather than the newer ATAGS or
even newer DTB mechanisms.

This support was added back in 2007 to support an old vendor kernel
on the akita/terrier board types:
 https://mail.gnu.org/archive/html/qemu-devel/2007-07/msg00344.html
Even then, it was an out-of-date mechanism from the kernel's
point of view -- the kernel has had a comment since 2001 marking
it as deprecated. As of mid-2024, the kernel only retained
param_struct support for the RiscPC and Footbridge platforms:
 https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/

None of the board types QEMU supports need param_struct support;
mark this option as deprecated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/deprecated.rst | 13 +++++++++++++
 system/vl.c               |  1 +
 2 files changed, 14 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 29de49351d1..a4c7d642236 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -68,6 +68,19 @@ configurations (e.g. -smp drawers=1,books=1,clusters=1 for x86 PC machine) is
 marked deprecated since 9.0, users have to ensure that all the topology members
 described with -smp are supported by the target machine.
 
+``-old-param`` option for booting Arm kernels via param_struct (since 10.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``-old-param`` command line option is specific to Arm targets:
+it is used when directly booting a guest kernel to pass it the
+command line and other information via the old ``param_struct`` ABI,
+rather than the newer ATAGS or DTB mechanisms. This option was only
+ever needed to support ancient kernels on some old board types
+like the ``akita`` or ``terrier``; it has been deprecated in the
+kernel since 2001. None of the board types QEMU supports need
+``param_struct`` support, so this option has been deprecated and will
+be removed in a future QEMU version.
+
 User-mode emulator command line arguments
 -----------------------------------------
 
diff --git a/system/vl.c b/system/vl.c
index c5678267182..32ee1ce7041 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -3438,6 +3438,7 @@ void qemu_init(int argc, char **argv)
                 nb_prom_envs++;
                 break;
             case QEMU_OPTION_old_param:
+                warn_report("-old-param is deprecated");
                 old_param = 1;
                 break;
             case QEMU_OPTION_rtc:
-- 
2.34.1

