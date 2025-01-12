Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1413647njn;
        Sun, 12 Jan 2025 13:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWT4EHr7Y7tmLY81dnbAI1bdbSO6ZqmZArmTc8JfLLHx00qUqsrKyPgq6N1ydn+nwRxzY6gH8Jp4V5eWA==@linaro.org
X-Google-Smtp-Source: AGHT+IEj2YGGLt/V2gCRXa/pGZDd4DrUMABgc4q43ItIGSc1eeclFIc/FrrI9BP7urKtCUikrifH
X-Received: by 2002:a05:622a:1a19:b0:467:53c8:7570 with SMTP id d75a77b69052e-46c71003b70mr334800431cf.13.1736715748560;
        Sun, 12 Jan 2025 13:02:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715748; cv=none;
        d=google.com; s=arc-20240605;
        b=XMasNx3Nws70UjxwJ9aMFNpPMuAo4anlJsVKGQG2OM/guZ+g6fhBcx8U0rla+wAwp8
         iRxfQ62o2kQi9Q/myBFXxARgLVJ6CXUTkb19iW6h0BUrC/fhJnyrxf/BQXV/4GpDcme0
         YRXHFuAEXhxeEhB9UonwKpoedjCR93y6hn6azmUjgwLZ+PU6sKt62TRvr/0LS/qya3dQ
         YiGKMmzIMnA1hQEZQ8CQ5NqjRgAm4ppg8Y629hlZSGpCybzPgs++dRsvhao95OpSHSCz
         NKt3KLH1Pk/1LKqbZltKyaUS5DpvhZ2qfqCGbCZVrGLwOcEDyyFmEPcP7DBwbWL7FeQ/
         hRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PED+OkjeNa2COzbeigOKtDA5aSMGopzRCwYcuxwx6AQ=;
        fh=XQErGGBWv/dSUcqwwNs1IunvIn81Ok1+gwLnqXfiRb8=;
        b=MThKiU7v9QUWdbE40f/kkpKz2hf/qxLYVzMir0ikJ0MXKVSYCCLPSFWBSzaj/XI4yl
         f47dGO77Rf7xYrcWFImNki0hPHn2WCIusy1KzVj+cTlGLJgxQLW7yyXK3HS67ZTqJL4x
         PcZ++NpJOXqDGr1QbpWcRXCPWbUZjQtogr+YjlLGFcFr2lZ3oF7G0vJf3mNmMkhfDhoF
         CCFuYPBvTmeet24s1IsCcsYRddlGQvy8zYC8j9xguU3HKlyADSWoHVDaAgNT54hod6FZ
         NhW8lKfSLzfDr5fHNhFaAfRwbCU646EjnuyTYdBTh7nMW4g9OjfrkunHDRApuTGnUEXA
         WbZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ll9Zzqnx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c87331bdcsi83066761cf.41.2025.01.12.13.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:02:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ll9Zzqnx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX55m-0004Xo-K1; Sun, 12 Jan 2025 16:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55U-0004Sv-2m
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:36 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55Q-0006NA-Pb
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:35 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso6650117a12.0
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715691; x=1737320491;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PED+OkjeNa2COzbeigOKtDA5aSMGopzRCwYcuxwx6AQ=;
 b=ll9ZzqnxSrcntQUptpkvVO5lyp9kllRUC4t1oGwi5RkoYvxopTWpZVfuHxl/85DiNj
 5y9z9WFnOO9q1tZUfpDShTCPS2HkCgmym/eABFYyShY7e9ZVO3dnAMrKCtJWBYKNF8pI
 tAl9Q0t1jTxnSQFvAp+oGGK/lg6YfGFat5cWCMQqAGaAOYtTEHdd25QixSZyQnAZACW/
 YDSKOODnsI8Po1DE29+8YO1vqSe96L8s92M3Fctie/dBIzM4zOH25QfoKs5bdqBdKwdA
 9f2vVkfpoXU20PfywfzA2jPTVrxaEkHaa+Pa3MvyUbCNii9lsDTtcOj4Jl92S9GVN1rx
 XSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715691; x=1737320491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PED+OkjeNa2COzbeigOKtDA5aSMGopzRCwYcuxwx6AQ=;
 b=JgujrGX5P0lu1gGxKkuy3950CHINLTBTBSJ0Zo3aCWXNqbaLYp3GmwBlJpLqyy9OXY
 Z5Sf3nkwXOdjHbbVYxq1nHhiuVHW0ftwfG2x3QuhkIXs4Dm+kMJkyRxALynA53qIfSuD
 BSKYufeIM+qtc6neimEeCpFc9LocyaCGi8SR+avKljP8ieTp11hpm3h/RPxeYLsDc93i
 od+zpPjx//VhH7p344EQK9mRND4Zt1p11U7b4b0A4hlgbBopkzqoehmYgn0D1KjqGQ/V
 Kf1ztWpnJjHJnnhPuO1dotJGhPyZJ8mRmFazbW+j3JD8tg1P1n7MWB1pQjtCoqvXa8xX
 yEBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxfzYBURYtN5vnxkW60dPKaVFRy0GzhnDSZyaxS7DjN1ElJfF+8loGQyDYz6spG8j++v2K+N8BLw==@nongnu.org
X-Gm-Message-State: AOJu0YxcFIHqoXxROIeo68tG6qzl5Iudr5R1Vx776FyifPJXy5cUSfDa
 MnsTu5XfejY4R2Vz0dt6xUJIZ8uMnRcLanDOE6GYyiN2dOPCB5OczspbJv/82w==
X-Gm-Gg: ASbGncuca2XVxpRr+5xD8+/p/ERLZqEVCnWYsqMlU5gr2QBPF34x9ztpFBDY5MBoUsZ
 umUbWs61zZ0wpMIa6y9BOWOVFAzdDaPT92gK18BHwlgwCE/+P5qpYULKrlBDpQS3CirYQiSKQaN
 WoOIzmMas6l20XZ8q4mZkXdcuzJAS59zd/fqVdsdib0r0PRHyOkt+rKQ7Q74cH+QXDjRuDxLx42
 owkn4IOYJfo7ae+FlWCpJHAZnqIG5K4/mh+C52Uxu9I3L6QueH/4i26mw900ATQryCTnk4s1nMk
 PHIdqfqvWNn85yGb+tjM2TgtB6qaAk6U
X-Received: by 2002:a17:907:6d1e:b0:aa5:53d4:8876 with SMTP id
 a640c23a62f3a-ab2c3d4d2afmr1289102666b.20.1736715690182; 
 Sun, 12 Jan 2025 13:01:30 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:29 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Alexander Graf <graf@amazon.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v17 03/11] hw: Add vmapple subdir
Date: Sun, 12 Jan 2025 22:00:48 +0100
Message-Id: <20250112210056.16658-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::52e;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: ZV/2IH42Kzrl

From: Alexander Graf <graf@amazon.com>

We will introduce a number of devices that are specific to the vmapple
target machine. To keep them all tidily together, let's put them into
a single target directory.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS             | 7 +++++++
 hw/Kconfig              | 1 +
 hw/meson.build          | 1 +
 hw/vmapple/Kconfig      | 1 +
 hw/vmapple/meson.build  | 0
 hw/vmapple/trace-events | 2 ++
 hw/vmapple/trace.h      | 1 +
 meson.build             | 1 +
 8 files changed, 14 insertions(+)
 create mode 100644 hw/vmapple/Kconfig
 create mode 100644 hw/vmapple/meson.build
 create mode 100644 hw/vmapple/trace-events
 create mode 100644 hw/vmapple/trace.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2101b51217..e220744abf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2785,6 +2785,13 @@ F: hw/hyperv/hv-balloon*.h
 F: include/hw/hyperv/dynmem-proto.h
 F: include/hw/hyperv/hv-balloon.h
 
+VMapple
+M: Alexander Graf <agraf@csgraf.de>
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/vmapple/*
+F: include/hw/vmapple/*
+
 Subsystems
 ----------
 Overall Audio backends
diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f..2871784cfd 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source ufs/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
+source vmapple/Kconfig
 source xen/Kconfig
 source watchdog/Kconfig
 
diff --git a/hw/meson.build b/hw/meson.build
index b827c82c5d..9c4f6d0d63 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -39,6 +39,7 @@ subdir('ufs')
 subdir('usb')
 subdir('vfio')
 subdir('virtio')
+subdir('vmapple')
 subdir('watchdog')
 subdir('xen')
 subdir('xenpv')
diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
new file mode 100644
index 0000000000..8b13789179
--- /dev/null
+++ b/hw/vmapple/Kconfig
@@ -0,0 +1 @@
+
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
new file mode 100644
index 0000000000..9ccc579048
--- /dev/null
+++ b/hw/vmapple/trace-events
@@ -0,0 +1,2 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
new file mode 100644
index 0000000000..572adbefe0
--- /dev/null
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_vmapple.h"
diff --git a/meson.build b/meson.build
index d06f59095c..812ef33550 100644
--- a/meson.build
+++ b/meson.build
@@ -3588,6 +3588,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.5 (Apple Git-154)

