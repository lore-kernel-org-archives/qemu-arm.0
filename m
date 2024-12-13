Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp522221njb;
        Fri, 13 Dec 2024 07:22:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXuXk3CE8E1e5UdTptJkaO03fwxgmVoqUrkFaewx6vGIgYc4DmGTndl6Z6v3m1+g19snqSr7TufFEBZpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEWZaaiNefNW4MrBu+gpjkl6tWaF3FBhGNjcyL98FB9D5jcD1y9j4VyOGButcZcAKIN0MsB
X-Received: by 2002:a05:6102:cd3:b0:4b2:5c4b:5187 with SMTP id ada2fe7eead31-4b25db68ed6mr3099951137.27.1734103378188;
        Fri, 13 Dec 2024 07:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103378; cv=none;
        d=google.com; s=arc-20240605;
        b=SaoyLeJJS0LXo8EwWxgakFjJ6JNbK9t/0An2XZglJByKiuHH2t0XzNoilxf9kuUq7y
         XSM02V8zC3OOgGgbwtBwgF1VrHXv184xzJ4NQbHtl+h5pY3bzoUDe8/eFc5sqq6i1BZU
         t7NKdRSRwI8GZ2Cjd0R2k2Vqc/OPw1ox8suP9IUlpAZhaEhXYM7dQv++xbQlKdrfXSLg
         c/fyyjUumtJDcmbmk4zsRI6a4pY455rdQeFmteBp9DQDFKSNL4PCP6L1e3vSYFSIFQrW
         0Hu0wtgp/cBrEmKJvL5aEydigE9olY8sXGWfjUS30ehlbmc0YZH7CaMM8SUW7SmroiSN
         /O1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BFtkA3me7ERWvnCWoAANDaTDxRV9mdWjmMCXfFKS9JM=;
        fh=J+6DGD612eQ3H44IK2jyBoLPGh0zFxThfSqf6nIYBaI=;
        b=cOSHnE+qM+Q+2CUqIQ+eojT6SnaRt6DalHRacc0EYq44UuiL4qpP3pCtSJaAv/aOJ9
         +dprB209Zu6qxIWuQgpEb8zz192d9EZYtqSPAVTGJldYSARO9QIWvqFvAISRC7Vcl6BF
         IW67pkul/oc5DWRY/bs8fELxy2N4IsM8ykUwG8wecQJa58qGwiVcfaoQGP+Umi4W42uJ
         qr0HXNTijphFQ7D7XhSbFoy6i9NZF0FWfmwcnmHLmnlhaAWU6M+AX7mU7VWb2JKlVzdx
         /H43b9WD1EaYyB1aI5v/uAh3AFRXw5yTttdETwyzIMwqyozPZlbIjiDWYyjipG4zThF9
         3g1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zzzF9LdY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b1107c5f00si3269874137.174.2024.12.13.07.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zzzF9LdY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7T8-0007HL-5L; Fri, 13 Dec 2024 10:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7S3-0004gu-Fy
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:36 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rp-0005LL-9Q
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:33 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa6aee68a57so280013966b.3
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103159; x=1734707959;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFtkA3me7ERWvnCWoAANDaTDxRV9mdWjmMCXfFKS9JM=;
 b=zzzF9LdY1qpj+Kai8ldWANmutIoDQEsRhXmAXWQIcSJu0Cebs2qKJl26rmroQQj6r3
 y1qWgCgcX4vWx6dSZK4yYTuPVUasQmliMXjdbh9Z//bbl/i7Myktn6TlZlZ3IwRFjXAt
 GGrg3YgL70hc9h1MNW9zFAa5l8TcwLOyh8x/YBAiu/RsUECHBfjGSmdCcmHiW9mEnUWL
 z24n7oawiWMOxU5ijFzdGuSIoDmEJnmPlMAzMJSrwHtBbo4M20AyMgDQ7scRYqLHigK+
 5XTrqIYiRddaBJ1qQyMBhiAXAY+MJs8U/CUFjW9Bswxc6lAuu4GUKgxSnl8LfZX4p8jl
 Mvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103159; x=1734707959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BFtkA3me7ERWvnCWoAANDaTDxRV9mdWjmMCXfFKS9JM=;
 b=amlMVq/jhtVFbe8FbDWXec/LeIwzIFP+CEg2IKg8I7sjA5CBbR4VoSvXL19R9neTi5
 LfVy+Po47WGFrz5WkIGgceo4fcc/UmhSLY479dj0j8K2QE6Oxd11Zgplybe3HeJERda7
 1bHzlfScmJUpYqJlIwj1fOqIiuifTe+ZrSxiQUK+kh2jLsmZAEatPTSvKSlGjrGICw3i
 Q4/s1Bjjz7DsKf/ooTiyex3wiMuHiS1sNRDcqYlrpwCX3GMUtO3Imr7m5bc+mHpKwlHV
 CQN9kV0mR9hpBQ6Eykbp/5whZwlq6TOaMQom55uGZsaqFxKq4YdNO7NU+VzKPSYxXCds
 0R5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJe6l2sZuxbFXQMu9eG7vxLNfNbvK+B2z3TScOSlBIEH1d6Q4/hRUkc18z04DqU3PFRceON7ynKw==@nongnu.org
X-Gm-Message-State: AOJu0YwgQhovl4B6BYq32+7/sQ88/JfJmsanBSAF6BLqgDdIYcQSKq2L
 ACGYeN8G93OE5eqtkzsXd1nool925F+tHpSP9wgViups8g1VW44tJJ3NgjAGgQ==
X-Gm-Gg: ASbGncvJXJpJayFnLXj1LP8TUuQUn7JGgk0yUJCn29flM5qq9/RDObHXH9WtMeGpjxW
 wwr5NdqqW1alW1FD4H4DYYcuPhL4Ph7vsPIJE72+moo7ltuuiIcNSL8opCeTFNfJ/ao+N/tQJiW
 ZUNA6brYDyA68VoY4PgVUVRqkd43MKNdxowxvPivT1ddMIuEGOAMN52/Bb11eZOqRO6gmSOW0ur
 ljbQFAgpp4Eq4vROoCgwgaY35UzqgX03o7ab5P+2e2i23zmehBpNd0IufCZyGmpQO5zVSbNkmpG
 /3m+1FTlJw6hhhg+nxMBbwm6cnPUj44u
X-Received: by 2002:a17:907:7707:b0:aa6:7ec4:8bb6 with SMTP id
 a640c23a62f3a-aab778c023cmr242897066b.11.1734103158923; 
 Fri, 13 Dec 2024 07:19:18 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.19.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:19:18 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v14 06/15] hw: Add vmapple subdir
Date: Fri, 13 Dec 2024 16:18:12 +0100
Message-Id: <20241213151821.65748-23-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::632;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x632.google.com
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
X-TUID: w8X9aIgrKOo+

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
index 09899f7407e..692872d7d1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2765,6 +2765,13 @@ F: hw/hyperv/hv-balloon*.h
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
index 1303664e167..bce1d21eec1 100644
--- a/meson.build
+++ b/meson.build
@@ -3592,6 +3592,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.5 (Apple Git-154)

