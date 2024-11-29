Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp810774njk;
        Fri, 29 Nov 2024 07:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2EgC8+CTfRHugLTubEC4EhkjHeRZB9EB2mP/UsfG13zBWBtw00Cr3Z6eCO1ctUNx57wZfLYA4ZRvNzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEciwJwuSN4C3ypzhr3i103H730xAcvhu+nJXCZiMyhCyKP9xDdty2wAsB3/pxryCkanKjj
X-Received: by 2002:a05:690c:6c87:b0:6ee:7f37:7109 with SMTP id 00721157ae682-6ef37273654mr126304587b3.27.1732893951802;
        Fri, 29 Nov 2024 07:25:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732893951; cv=none;
        d=google.com; s=arc-20240605;
        b=frYI0AlIT5iqGWdHdAQB0oM5lE1u2CGpxa4g5p/WgwAdU0bbnyA4fzSA4VjpcXxhlj
         daltswR1Qnq3unYBwtLEeC81YDNZUoLgvALks88pTNuqH5LcPzTWEuACWouh9iCw/UCd
         ulpVAGH7YMKCvxAvsT3IM35/+unSbbM2hzcoR17un3C9L5UuKeKD2Lcw9VFBQIRo15PR
         UW7qRUWSMQae1aOcT+GzC+NoOxWwzxhSCT+iP5iaQTWQWyiEXUTh5cYw31liOpchivZg
         XkmDHRf6BO9CSu87Xco/U5JuM2hMpEpbLTYJR6J4N7zN3mScFuNgctLmfuOm4lXWzfpo
         ZJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ok/yEO/gGUTeG6NUYNOLxdO1P3nDxIlqx8Wu3BE+nrY=;
        fh=ExBA2j9Qc8C8AqaGBHq2jX+baz+uSMtRVwjnPw/8PZk=;
        b=fmPrGRVHxuKSlNhecZJTZoileXhWu5l6AsdJAeuz2L6FyOIVsCWNp3o9+Oaj6A82P9
         OpuCWJTwqHbbWaMKU4WrYxe73N4IVKFG9vQyyB+fZ7rHR4G4AvlBLkIbO7p+G9+ASmE5
         ZIXiKU5hY5Ek8/4NEMesB/pvl/mhYdqsK7H2gna+zAy+gS1W5s40NMeG2KoZ7XgDhLyw
         JVKHR7ncoI/ZCcKt2lj3+nJ3K+22WKow7o+pL5hlcAh93ZTK0pJkEZpPLzeGtezKNg/R
         epoaMKOEOZGtHIzUaAVsJEbBCNTvFaF8y1KrEnwX3mFUuICJmOtgsPNbXt7/GzVOjq2c
         XOsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=EActY1ns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6ef4ddc4723si39928917b3.422.2024.11.29.07.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 07:25:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=EActY1ns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tH2s9-0008WE-QV; Fri, 29 Nov 2024 10:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2s2-0008Q3-IY
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2s0-00026C-3c
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso284526f8f.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732893922; x=1733498722;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ok/yEO/gGUTeG6NUYNOLxdO1P3nDxIlqx8Wu3BE+nrY=;
 b=EActY1ns+GlmpC0zbpzGrR3Pozi/Kud0jlo7A5Q84Wy+QVFxCZ/AJCuzgefwgVBNIV
 8cQ5ntkrDCU9/RLFrnuFYSuKLTtCmXWpr+cHS5MTDBBtjAckrby3cvXrD78LgQpSI/vI
 IuklzwTy4Il9vObYi7i3nQEBdf6a0BHN5rVitOUzpeZ/ChU772dsG5w3pG4rpJPScxM5
 O1mnVo3H18QH736rsZrk6g1TE12qAAGAtgM87qntrD3wip7mWdWEZBCiNwhw8BKOOYlV
 ZIhZb9MQCwY9UZ57gXuFZIIOIurgLHppV47j06jD1s48qSi8R9z9gNwf/AM5O1tAZ8M7
 OIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732893922; x=1733498722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ok/yEO/gGUTeG6NUYNOLxdO1P3nDxIlqx8Wu3BE+nrY=;
 b=TTI4rHuNDmJKxNVa+/bHxnfNbeCJFc27V/cpxB+3lMJG3SeGGCBP5Ndyw/6u/pNYo+
 6zDwy0T7JfsvjJ2UcdLaw5v4yWB0j1CVNO2biDia/Fw7BJTpebfnSnosL3wOoPPeoAB8
 7TZ7PqJe69acgIcC8mVWcYVyW8iS5FEB8h2qe9yxEB898WEJ7/lm4qDVeef+C/Atb/O8
 QS96+I3uz8d5B/2IB9Q1XP8h14tC42e7AIHRL/OcVhffGuWu1aftSh8Kpr4pcyqUiKl+
 ApYavTN+0nd3VoBuE77XmladevKWe1iQIz6W/1ZjFd9998TU6+6ovnmRzUZTIIXSHal4
 /Fog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhEhed/3AZlDtxNvp8luwYHNnnbuxRgnbfNipWtK6bMDP47NKenvzEBqYigAnkGLZul5okpv/hqg==@nongnu.org
X-Gm-Message-State: AOJu0YyhdmZjnAOc3TEuxopDBY/c+HWPhwFxj5v/9rOkLcVELPlHE9sW
 8T0/vtTke/EmiFUyfkFm6ICqqAm+Nixx5T5nTyudTtEe0ME4NJhgsrmrrEIjag==
X-Gm-Gg: ASbGncsT5YP5dX6Xu7G5P2ZDo3WAxtNLXGlMHmAnX9kJm6o+fl0QWZs5sfMV34rIZrA
 BNL5eE51D/EjY42gNwtUlkZ4T0wM9/looY5x3WhYoAnG/mSRve4DJ0QYqD1nC/qO2yI3IHuSaN6
 sqTLZ7rgjC/E5O6kItCI0QncLnknxifj66J9oB0KO2REJxbOyskAWQjfls8C+pY5fRMkmfvClaa
 RqJlHfA6rHPe6zp6sLEX4yCdSGTMYONACG7v2pZJjRuUxQG4KdbejANUKj+Vlb9R9Z+LMzMzwMj
 QuA8xHZF8QaVFopJlbNqGsinaw==
X-Received: by 2002:a05:6000:184d:b0:382:462f:c5e5 with SMTP id
 ffacd0b85a97d-385c6ed74bemr10786413f8f.45.1732893922165; 
 Fri, 29 Nov 2024 07:25:22 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db2dsm4685119f8f.14.2024.11.29.07.25.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 Nov 2024 07:25:21 -0800 (PST)
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
Subject: [PATCH v12 06/15] hw: Add vmapple subdir
Date: Fri, 29 Nov 2024 16:24:57 +0100
Message-Id: <20241129152506.59390-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241129152506.59390-1-phil@philjordan.eu>
References: <20241129152506.59390-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::432;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x432.google.com
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
X-TUID: 3XPAvPhOi2MQ

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
index 08780eca5d1..9e7fc6c050a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2763,6 +2763,13 @@ F: hw/hyperv/hv-balloon*.h
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
index 48215a06cd5..4a4a033ab40 100644
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

