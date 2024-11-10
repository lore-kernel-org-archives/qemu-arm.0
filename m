Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6254921njc;
        Sun, 10 Nov 2024 13:56:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVu6d8ycFLFoDYRL6D/LY7GIdRNxFZIxliMfOpUZD1DQqh76AKbMUMyE7BU3JcR5LBR+QF/SsTy+MCrug==@linaro.org
X-Google-Smtp-Source: AGHT+IGZqpg88EzbI60pm21dkuctpeZuDddKQ14knaLkPErf8+btLqTc95YrKf4F+y3FO6xU3jnW
X-Received: by 2002:a05:6214:e84:b0:6d3:b332:1d53 with SMTP id 6a1803df08f44-6d3b3321d9amr82001786d6.16.1731275784831;
        Sun, 10 Nov 2024 13:56:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731275784; cv=none;
        d=google.com; s=arc-20240605;
        b=P08C4UQU/XvhXq4gYolvxXhWkAXYAg92G5LyN2P7vSAseG5CxnlzTOBhA82WylQz33
         7bzey/2Mm4YrcYA7JTFMnIZoREUiYujUauX8scYboGP2lt0aWiHQWtTMdfcD2/iO+zbY
         XDjJMcPApzK2gR2U0T3bCLTozBVvu4MsVSRe1ToE0tYzLKeHDiF1qoJHHAW22/uyUs+W
         8wcHVTr3xAbmpLs1XIUcVZY+uJAL7QADAfBl4Hc7RfPEZjXeYcX9nKxZjaA1/7grQRql
         8u8UC1L5bdeRbnLcE9m2pPa/66YRRjEcS3mX4cWTowO/Duw7u/bzo/TOYRq5Jf7xzPGY
         KqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=53M7q/KCCq1ggHz687B43AxmIYF0Vy+KeccRiVeYQD0=;
        fh=OzCpU3nVDse2ebTJlk/MbZl9ZmVOiUU2oEDuCZHQl6Y=;
        b=ALl1gWc26ry9//pVIAModuVdjLwkZok4z/pjqhv+T3l4KnAOeOFAGp/BCFvqNWZ4mj
         Zqkofvk4+XqFF0EOq75vPxPqB+BOhpI5EzjlO2GleaxXfouR7UX21HuImDdt66q+/RVH
         WWZ/Wx5ALmVHx/t5r7fUPNreyWcsJYACDzh/9/+yeh14ac4t0A/kcPgC1fPVUqIAxqwP
         IRP/yJ72Mc32xKyGlA1WEYpHBn0xwQebZ46BFo00wchdROF6zdBslUb8HRx2bkEPD1aI
         YbFW6iRdMFNffdYMKUr6GHvpalMYq8gnlp1NmNCd5J+2MrXcgtnCn7dZtLbqx6QnnrU2
         Crvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="FzUQt/ve";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966b0a31si94889446d6.435.2024.11.10.13.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 13:56:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="FzUQt/ve";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAFuL-0003lj-NN; Sun, 10 Nov 2024 16:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuI-0003i5-Ef
 for qemu-devel@nongnu.org; Sun, 10 Nov 2024 16:55:42 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuF-0003y2-2y
 for qemu-devel@nongnu.org; Sun, 10 Nov 2024 16:55:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d495d217bso3641515f8f.0
 for <qemu-devel@nongnu.org>; Sun, 10 Nov 2024 13:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731275737; x=1731880537;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53M7q/KCCq1ggHz687B43AxmIYF0Vy+KeccRiVeYQD0=;
 b=FzUQt/ve4XikyTGcAS2ewO6UcfRQVGXaK64YEDLtWtsya32KWnTGm/v0srXw2oPuie
 LEAS0IFSB93NZ02MokIqdf2lI20Q/6mUffoscqIcQXAbunYsB437iYH5CO+HQLnZZRGX
 Aho7PHcak6qUU48wD+AdN2py2B3U4dXjgFqa7ACbxKq4YApNWWsitB+Vfm/+ZSGGohMV
 1whvXd6EdJnjJsJyB4J2rHYbGoQScbOt99/FbXLQ2sojf5E2lg1USyRWlO9TgyK/8RQs
 PuCLtHqHWAoVz0YBxVvlvrqbO/Q4H9qhHQa7AUSFDnR2Jh9gQdWCeyXaSFZ1ZGXala3c
 QUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731275737; x=1731880537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=53M7q/KCCq1ggHz687B43AxmIYF0Vy+KeccRiVeYQD0=;
 b=B+M+GRtG/cRrJ7C1BsnYSwUgeWRvPFF129pTwb9VX+K4FsiWnqA3aMSwM3TVEaCqvM
 GvxE5P0ScScH9/SUFG6Ag07S/emFaYdv2zlmKt6QNFiu6ZLPNrnyOdDSY7aRYHqSiua2
 /iddtY56vKi/cL+wYef/39BJ3sfLrNCdl2jpzosdbVbW4PjYttSBa9hb03cHYk6iUSeR
 971c+gP4ghcWNHoGTvBgklz1rvyciPCjDY9DQOZQ1pLgkwzMZZDK6r/QYoCufsNB+6MD
 UNaznY35FkWE/yoTOjgo2b5rc3RXQ3b5weNY9b0+v8FWVJUpJwBfJGlhlSNO7wpnGsbf
 kWbA==
X-Gm-Message-State: AOJu0YyP8ihcBKmsYB56CLjvxm0gyhLo7lo5v33dVTmbjxRzxPc1A7Uu
 ohgVG07O521kQgWocqmqhmsY/qKXoSZd+E/jNCUCX0PACPcB2U3nG+XFqsL6YaiEhSvM1Mt40as
 2wQ==
X-Received: by 2002:a05:6000:385:b0:37d:4a16:81d7 with SMTP id
 ffacd0b85a97d-381f1866abfmr10416599f8f.8.1731275737472; 
 Sun, 10 Nov 2024 13:55:37 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2f731sm523715566b.189.2024.11.10.13.55.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 10 Nov 2024 13:55:37 -0800 (PST)
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
Subject: [PATCH v9 06/16] hw: Add vmapple subdir
Date: Sun, 10 Nov 2024 22:55:09 +0100
Message-Id: <20241110215519.49150-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241110215519.49150-1-phil@philjordan.eu>
References: <20241110215519.49150-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::430;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x430.google.com
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
X-TUID: O1005Yk3kUXX

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
index b28267b6286..c6b41b983bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2762,6 +2762,13 @@ F: hw/hyperv/hv-balloon*.h
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

