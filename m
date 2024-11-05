Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2911216njc;
        Tue, 5 Nov 2024 07:35:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVZh7EpMzc7lYywIq//YlrXm+u3hRx8b5iwDWz4GDhdeqt81k6uF0ZvJyjJmLXwvKehHPn4Hq7cUeq6A==@linaro.org
X-Google-Smtp-Source: AGHT+IFgYf5MNBR4Tc8aLnzcIdUdW1hnNtGRNogq8mZZR/GgWxvEc9T3WrunRLBH3DDmGfl7FkAP
X-Received: by 2002:a05:6122:1786:b0:50d:4285:1409 with SMTP id 71dfb90a1353d-5106b116f15mr18679356e0c.6.1730820906228;
        Tue, 05 Nov 2024 07:35:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730820906; cv=none;
        d=google.com; s=arc-20240605;
        b=H/yeM3+OCLiH+kFbx6VHbVpd7plqAev2K9R0Yw3L2ygIW2nOE6+hI0qrifp+wvTVGy
         3qr++sb6AGi0BY37z85cZu8isJMozwsDPx8KattfEToAhPVZaLemcGwifSnpv2qdkp6K
         4Wf5TJb5CFfmhwfZyP64j1M4JPTvekp4ZYoVegLwvZsECOD7IJLaZk3qtAsuIsFdb/dw
         XAna1CjGI3SgzGOANl1DGUx3/mTsvyARUJPxFLBfevEkh6vwzdg+XZOgav61yofixX2I
         WLrdX+rpP7f4mpjILSzOnFRv+1126Ag2wjYMhrzffSQrysNUesGIbsMkKAhHEG66h4K0
         CP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aOPBNKYGGxA1zXsRwcjvRB/Hc7v1RvZEzYV74UA0S34=;
        fh=8qkWiJgA5TmVwYZO0ZVJA+nhABuY9t5mEs4yOq328wM=;
        b=QEiw05nEJauxLcn7POPeAQhvQIWY4Qqmvya/mY+7rswvVavDDCYpkFUF06R+g1mGlL
         YWreJM5UmZbujUIeBUa0tpzvynT7cojaOvBfHpzotZGy43upbFdDt7rejphna6H5WhBi
         froi86h5b8TThSXgOqe4cv2byqA+Y4unSPVYA0l18G02yWpWjVYI/OWrmOFTxUA3TpEV
         gQ3U0611shHbLSltW6smKThgfQNVKjGyV2QJpVZj+nQ50vxeQSKZACZbEmUHvb+VPNDc
         ekoNYQ2VHqETfiMeQD9j2DX54RJ4/QGazcX0Qe2lTgX4OTsRzSWEnPAyfP/8YcNZNQDj
         fuGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=nOsiLQmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5106f282575si2731115e0c.11.2024.11.05.07.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 07:35:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=nOsiLQmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8LWL-0005dx-Pa; Tue, 05 Nov 2024 10:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LWE-0005ZT-49
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:31:01 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LWB-00042n-Ab
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:30:57 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cb74434bc5so6711682a12.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 07:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730820654; x=1731425454;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOPBNKYGGxA1zXsRwcjvRB/Hc7v1RvZEzYV74UA0S34=;
 b=nOsiLQmK1TBVnw0MI7ri+mDGwYVbXr4/+nsnzQ8yf93PJzggsgU+fIxvQoPtmzw5Th
 Z+BcTrC+DlntYA2b/6aBrixBnGCyulCOC7cDODswu2fPspXPjIy0Y6PTAHfO+x7tocW+
 CHhmJvVdMpCzfEy44LYoMgJto9eZWDo231clYz2e5j9SsIS4r6ANiK0UUS2UmT53lxdU
 FStLoZUajxsuBO4/qnNcfR0TRkLy+wBA7Vu5eYRjOm54pUJd6WeoZbRosNjzIJKMU7xX
 3tjCNXoBmtVmaRju6AHjdp+aNRUAuFv6tkRw1rLT7370yEZhko/uGf4wBIUgqce5dYmJ
 V+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730820654; x=1731425454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aOPBNKYGGxA1zXsRwcjvRB/Hc7v1RvZEzYV74UA0S34=;
 b=Dr6x+4LgXqT4NGpnReyq4dx601c3aB85iadCky4xwqLAnQu0pvXzV520k2tqV/+qeb
 jzZKqd7OcgpzauSxnd5bqqirOiTW5m/VnY9iPubXlD4OiGXYsJ89vzRu9aE67sy+1rVy
 IYcu04saPql4VLlYfxznT7CsZj0QSKcxaheppZQwD4AKW6rmq1HUDhmZ7YRFpX3CKMWQ
 FkMUWn+8cB7LSB5YQ5S9pFLuxFxnne/+JQ0QX83szcZWKxF4UdWJvUDptq+NrsVbb2b3
 dw2ZCyyvnrnOF2eerNkxeur4JPx10n4nPIefKL5k8Bv4keboV1MDhRMjD0+15TLT+fZf
 Kr6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp3H4VKm8b7+Pszk99jvvFl7QHT20WcBjtGD7BwAtTwgygoV84xguI6rMHv0m6cyK6GZBqSDsX0g==@nongnu.org
X-Gm-Message-State: AOJu0YzV4Mteey/ku8pixIr1HD1NAypmyI2Od73tr6tZCvmJmlmM+Zwj
 ++sk1GDHXxM3rROim78iMN7f4EiF+nehZOAFvrBBynOOrAa1ZkpUIpo+pfS7UA==
X-Received: by 2002:a05:6402:27c8:b0:5ce:dec1:9aa9 with SMTP id
 4fb4d7f45d1cf-5cedec19addmr4022241a12.7.1730820653604; 
 Tue, 05 Nov 2024 07:30:53 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6aae3fcsm1419415a12.21.2024.11.05.07.30.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 07:30:52 -0800 (PST)
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
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v7 06/15] hw: Add vmapple subdir
Date: Tue,  5 Nov 2024 16:30:13 +0100
Message-Id: <20241105153022.91101-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241105153022.91101-1-phil@philjordan.eu>
References: <20241105153022.91101-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::52f;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x52f.google.com
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
X-TUID: gFfJFXAyn/Mq

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
index c7964ab784b..9d0d26cb65f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2761,6 +2761,13 @@ F: hw/hyperv/hv-balloon*.h
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
index b1770ee39ff..7c631ea2e8c 100644
--- a/meson.build
+++ b/meson.build
@@ -3498,6 +3498,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.3 (Apple Git-145)

