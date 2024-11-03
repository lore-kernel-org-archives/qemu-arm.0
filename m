Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1601052njc;
        Sun, 3 Nov 2024 07:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWncl+9Roc4anco8PuPgzp4sxbE+WExG4QDHkVchyZa5/FG31wvkO9O1WjQd1ljkmpHty3MQWfeRH9oGw==@linaro.org
X-Google-Smtp-Source: AGHT+IGtn+kuKd2nYVLDQOb1VSAKLkeJLB3+aDb/oKG1Q5ub69iG3KezeQM0FTnKtyAhzd/edCbN
X-Received: by 2002:a05:622a:1b8b:b0:460:b18c:ace8 with SMTP id d75a77b69052e-462ad3074damr213174421cf.21.1730646309062;
        Sun, 03 Nov 2024 07:05:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730646309; cv=none;
        d=google.com; s=arc-20240605;
        b=THJ63XHPv+BosvjyNYyqg4VXlR1u86E76wMwyVCZj0pQlkalfgC6Gx3VBmAy3AUsjW
         WQwKeTKq9KaG3U/gGrq18WHAa+FNRCg1Af9PumyejsmKsT3FRxZ8UeBiyfZA0wZoAj03
         nY0s7gMJHffWU01osrcqHYIp0hQYYl4NWYavAlKAUP7olHMCW4ugqzLOqk96XE7X4jEq
         gataGKa10BXydnYBqLdVb8bc8IUvIAmwx/LPSMavy1oDoXWf3y14LHdqWAwosH5HuCZM
         LZ/KGzdM2aFg4Oquy/+pxQATWgMD9KdBFxqZ4YsutMdmoVzx/SRk2FT2AAyj7hc22dnR
         FL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ISm7gDuJ9v0T+ZU7rvr+a9WepmkkxEpFRMRSCMJ9FmQ=;
        fh=Cz9mr7WFxiYKJBC2Bqqst74qbX4rU+wpTENwEkbsku8=;
        b=eDeLkL2/EcrH3byxEm2BhEqUisb4mRNnExRcuwH8CnYpJmkVAK6jxVUY1oiafdD0EH
         i2s04EgWpk91gIwQidBplFmfmcobVOaOIVBbfzx5oswTqq9cqIIu+WvM2X4p7I/2ySy5
         4bk14iFbCCzc8psoH74Ey6dghXs2flNAo6mXlzrVBcriHoTAzmcigThv8ykCxLyOhI+b
         tuHm7IN+Xfb7IWkD87laSs+UQbqltPBxW7pUnNBCDu2Yw/pIlfsK8vP2AxVSbxgWqqpB
         t80dtAEHmRafD6VFcQwfGheXmxRueGfoVjfZpEPzPUIx2IN/TZOKpYjTWLOfKuDJAhUK
         kzNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ET3ek0li;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0d0ccfsi93868711cf.221.2024.11.03.07.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 07:05:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ET3ek0li;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7c6p-0000Rr-Ro; Sun, 03 Nov 2024 10:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6F-0008Kt-Bj
 for qemu-devel@nongnu.org; Sun, 03 Nov 2024 10:01:08 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6A-0006Y0-5d
 for qemu-devel@nongnu.org; Sun, 03 Nov 2024 10:01:07 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a998a5ca499so450162266b.0
 for <qemu-devel@nongnu.org>; Sun, 03 Nov 2024 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730646061; x=1731250861;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISm7gDuJ9v0T+ZU7rvr+a9WepmkkxEpFRMRSCMJ9FmQ=;
 b=ET3ek0liHPwAA7MbbXvxw1OumMv/qIa9cnLjZp8hNQT8glUE8u2gsgOiiUxx2F4RqU
 pPdBAHO3o1ha18OFBWxVK61t7DkZDKaWUs+Z+9pfFjphmdAtFQwX2ixglRbNKCUTFm9i
 RlMDcQsPHoBqEkOJnfOwHkvLfLLLd+FenEG3wZe4zp8MaFA+sIUPVr4Wq/VllLfYuY0N
 ywif90ddZPrxHu8X1072sNOfxncwJiVx/gnCDjXwx53MSz6j6pG4hBJNVtosNbtI2A7b
 ll7cruj6s5o//E51odONnNEHGJZV/NqxI0hc0BGp/T0pLOl3dFxGbgKMkl+JuGLaxNpY
 0poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730646061; x=1731250861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISm7gDuJ9v0T+ZU7rvr+a9WepmkkxEpFRMRSCMJ9FmQ=;
 b=SUpFxpZkwZGEHx6TK7SoviMiAIMySrmRgiiCml6yBJ7kE0dBqmIvU2QNRUCswuO6lX
 XGTPm773DzRNCGDc3tPgPvOaP1Ax7pCI6XXp2A1PkQYC03Z4lpOBAPioY+CMLJneNgrA
 ZW9Ji1vPSgRbPd2dKveWF+HpRmL1h79c7OyI9G0RT44VZHOAF854i6cD+N9hAQzrBG7b
 VLK54u/VMjQX0OmXk814HT+9zV611pccsYGvqev5c7B4fAnxvFdKwHN9txmvIsjEfCAM
 aFr53mIhNg56LBvxzWbrLPBt/N+ZSaPAEHvsTg5q0VYrYrjnCiOCeXp+BVRwDcXlIDuC
 2z8g==
X-Gm-Message-State: AOJu0Yz1Vx7YKCZb+dbvg5lgIHch39Ykw0rt+qVtpERA2trFx8QHY8Lo
 rYJ7l3Evg2lzFh0+4rDXNfGIeqTJye6/eMSAikegGSsGgf8GHWk2L+ZWWkFzHnktPGyfjXGOJE3
 q2A==
X-Received: by 2002:a17:907:97ce:b0:a99:8a5c:a357 with SMTP id
 a640c23a62f3a-a9e657fd8c3mr944191866b.58.1730646060067; 
 Sun, 03 Nov 2024 07:01:00 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5664350esm431536666b.159.2024.11.03.07.00.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 03 Nov 2024 07:00:59 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v6 06/15] hw: Add vmapple subdir
Date: Sun,  3 Nov 2024 16:00:28 +0100
Message-Id: <20241103150037.48194-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241103150037.48194-1-phil@philjordan.eu>
References: <20241103150037.48194-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::635;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x635.google.com
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
X-TUID: 76sBH5jGYU15

From: Alexander Graf <graf@amazon.com>

We will introduce a number of devices that are specific to the vmapple
target machine. To keep them all tidily together, let's put them into
a single target directory.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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
index fa8b8e858f8..f26024c1835 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2740,6 +2740,13 @@ F: hw/hyperv/hv-balloon*.h
 F: include/hw/hyperv/dynmem-proto.h
 F: include/hw/hyperv/hv-balloon.h
 
+VMapple
+M: Alexander Graf <agraf@csgraf.de>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/vmapple/*
+F: include/hw/vmapple/*
+
 Subsystems
 ----------
 Overall Audio backends
diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f7..2871784cfdc 100644
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
index b827c82c5d7..9c4f6d0d636 100644
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
index 00000000000..8b137891791
--- /dev/null
+++ b/hw/vmapple/Kconfig
@@ -0,0 +1 @@
+
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
new file mode 100644
index 00000000000..9ccc5790487
--- /dev/null
+++ b/hw/vmapple/trace-events
@@ -0,0 +1,2 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
new file mode 100644
index 00000000000..572adbefe04
--- /dev/null
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_vmapple.h"
diff --git a/meson.build b/meson.build
index d286b876d62..1b13ff24fd8 100644
--- a/meson.build
+++ b/meson.build
@@ -3490,6 +3490,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.3 (Apple Git-145)

