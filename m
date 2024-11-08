Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4966354njc;
        Fri, 8 Nov 2024 06:49:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLQFBL8i2lz6Bi1J3Il68urW0W19GEYAwdMvxi4n4kkXfvBdgfFzSesvv5Li9yy0RPR8/ecLh/fhB3jA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdmMX1aqaiJtvtITXw0kPtGwKijDOLp2APj449rHo/dqSAwi4KAc0CzmrOyXUxZ45lspRd
X-Received: by 2002:ac8:58d6:0:b0:460:e89d:897e with SMTP id d75a77b69052e-46309326052mr38888581cf.18.1731077371482;
        Fri, 08 Nov 2024 06:49:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731077371; cv=none;
        d=google.com; s=arc-20240605;
        b=inpB66t+7Y0zEpVwG2pOT5mDy8b3NshcWMOOSuNT3cVTPOVerDH6/NgtolVwMC6snS
         F7hW5V4XOcADyU2Imqm+InYxEGYsEpAZkNE8kHkandNDGf3D0K9/yldv0ZZjiveKTUsv
         jhOBDYebUPiq3jwrh5N8sLcNEs8EZvTpbCtsFOu6WWHQFzMQd89ydEJyzVT01czaXkRi
         RMKEvZhcLtyU9rd2Jn8h+zQpPzjMJyjnEIu0ax4L/gDgS7evO1lLr83Evc3VDf+7XwGt
         IwVVnzs2asBd/7dvuIIpYboO51gMzdvpAaUed0vMFW6wmBmjTbcntAtkRc2vzH8KKWRy
         5pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZZ8buFGNGDVzIwaiKgReCm9PHRcVjEFBh4AjmHdE9sc=;
        fh=RVFGD45LcOP+yl3Gd5XXnJUca7DbMDuX7JZeYPmF3n0=;
        b=JfoqQYA5jL5qzZA8Rn2ikjeTZskq9T/ZOTvwA1PYLmBSMxfSICai2BL8cLmmk3+3qL
         HIzPP8yavI0QYr6qwzfSCItHB9xmqROcPW6KzpztcpTkbBFOQi0bIsVWnoCT27oeahds
         I6edrQ7zR8c57HFbGwsxoxFYvfjuA1z155uFljLKqSgJNxQlhxuAFOphGTf6xnA/YGgo
         7i+6U40L6B+mYazxgaKe9gXtYzTWKj3WfVhvGN2cBUvCHs6F0KMgeE1ZY6uWlA0q7dbN
         h185bwyLDrZI6GreK3YMuDYpYGedARbRD5rD41jZWzZ8x0ws8ntfIrmKiArBHqAVfkBE
         0k8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="F/80URn2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff62813dsi40403471cf.486.2024.11.08.06.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:49:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="F/80URn2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QHh-0005Rf-S9; Fri, 08 Nov 2024 09:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGo-0004FX-Fn
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:30 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGm-0005IA-7r
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:30 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso2764805a12.2
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731077247; x=1731682047;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ8buFGNGDVzIwaiKgReCm9PHRcVjEFBh4AjmHdE9sc=;
 b=F/80URn2Hu5AVDBiDrKrt1dkcysJPBxwsuK1yC2UA056oVB5sJt0zc4iE4GjtXK0aF
 EzLUJQSod5yCLqfHTiyG8NVpq5PMKzVxye+rIWt2rT7+AA2njyzsLm+hMe9ne9WPNiLA
 WOLmnf0dfRAVMAXHcNudiNfDmxhGyHh9l3qVOOdlUZEtQyppXjOBOPYdOr47Sk+zCb4O
 wU5/g2gvhH+e6UJEQ0z5aFwbLqag0MEpRaI9yihtF/ARKA94E0YImVNbXiASpSHQDBg9
 Kl/PDxbI1/igNH8wdjvbzWzNNHOE0TnobszdUtbXxvMOfJT9/o+jlvgpcp5vJUrhX/H3
 R/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731077247; x=1731682047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZ8buFGNGDVzIwaiKgReCm9PHRcVjEFBh4AjmHdE9sc=;
 b=UQXzwxUzOwPC20qLsv5/+SQyJ+P/eguMk+jhySf5d9zdt+AAme9qfxu3YTkO1xqg48
 W3EmKMrKPhR5DRWn5Qpz1Jti3ae1FB7aBg/yzXsKt8DZ9o7EpGFfpMAxY+vQ3mFwn73a
 hI9DQGq35wL0p6zALdUEmxAN+NRd2Dvkx/zE/9YoeyXaltnDCrD2kKb0S7R6NS1Fn46E
 SpZHqNUq8WNnjy2p1l0fwdnAT9r6gqX8ss5BxZDrjCifr0f0djwce3HNiAxMm77mZLke
 ebhoXRt0df3vBR0/fIOaKJCHTINuTLqRjjNp9JGvC8YxVB3u0HdXfe+fMRxuFc3Tz05v
 PtbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFuhkF2iat/4+1HYxbdDx+NAKIy4zUFf+i77hRvAPxz1wIaTEija5g57qGl/cQAsgtiHajJDmhVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzrtsxcnv+LPzUDPs7L8cw/MW3fKe9lfihNS0XsWUqBsit33yaT
 5R7MG4vS2MWv8GuIbfbCKXRLaiUUKHixMmfPQvnO17CUlWY6RbaZRqD5uRXKmw==
X-Received: by 2002:a17:906:f595:b0:a9a:17fb:4c40 with SMTP id
 a640c23a62f3a-a9eeff25c5emr277977166b.26.1731077246610; 
 Fri, 08 Nov 2024 06:47:26 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a9b1sm240534066b.52.2024.11.08.06.47.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 06:47:26 -0800 (PST)
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
Subject: [PATCH v8 06/15] hw: Add vmapple subdir
Date: Fri,  8 Nov 2024 15:47:00 +0100
Message-Id: <20241108144709.95498-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241108144709.95498-1-phil@philjordan.eu>
References: <20241108144709.95498-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::532;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x532.google.com
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
X-TUID: 3oWdmiv1G1Cl

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
index 427e3f61190..f363771f802 100644
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
2.39.3 (Apple Git-145)

