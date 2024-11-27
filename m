Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp848976njb;
        Wed, 27 Nov 2024 07:05:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdcHztp/OX1rQuP/kL4GroLfwJO0sMOf4mSUUBgAr62f45x7pRFW2EvT1KV7ECE6j4WqUNNq1sXVITLg==@linaro.org
X-Google-Smtp-Source: AGHT+IEcwkB97GzpJigELrlTgQiCaNxig3GLAL9qQJfziGE93RHLf1aZ3V3X2lL9XvXi9KzPUsWp
X-Received: by 2002:a5d:5f86:0:b0:382:4a6c:fdd4 with SMTP id ffacd0b85a97d-385c6cca1edmr2462666f8f.9.1732719952177;
        Wed, 27 Nov 2024 07:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732719952; cv=none;
        d=google.com; s=arc-20240605;
        b=bq5kSvSU9b+eDDvUwfbEAKNPHJV1LvNbyARoRP1uMFNiwZSHQHEc1h1kzOyixf9XKd
         Fozw7jeHHVm6MLF0/lAPA27oJzKmbObMaC5LW8InkGpZMqlArHreIiVMbG8cQLSw7WTN
         r68o7ZXflWbDMOgZirpPjliqN8qb7P2CcfrBPxq2kXxuSerq653yoDwxw+fG7u3FsUyA
         x0SsTfJhqP8jTrgPIc3Rp5gJxHFL7ThbjbfdFET4uCdF2etwSMdbuUsuo5WwW8ydMaoj
         hMki0RMhPL0mKTzX+C9ZjLldyY9+wNyZ7woa4eC6YBZXlabl8fAYaTaJEh/QX9qPXvO1
         ilVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T+1N1WNsO1ozJ1n5opD5J6tWjylgLKYonMfqmT6MS/c=;
        fh=+VjnrGvjeQQD7yexb7VCprNpWRZMsTpIL8oodPazyOY=;
        b=K0OebfqEYF7JYq6qZ70fvxvn+/Gh5mP1bbtsyhm8l6z761Gl/pgFRSnCG1jcmb4nLM
         T3kwIkqf2hzqZgRRvzvVwBRgaA4eFZDHyXwmCCVdc3IN4/VAVWFAzX26LnFkf9QDrJ1F
         q4HBruKE7HGQz+LZIYKVTjmya2LaKBljlwl3AI4LaJ/bmXno/pHdyUVBXaYeJ5r7R1GK
         CjfnWFztcGlYPBwZzZQg1klR7oXrsk40c+DXNHdai2FKzR0fM3XNLmrFeSMJy2b04Nai
         gCk2o9ydoQP2Bm3th8hZXFdXHOBO5hFebwUsLL7dKi7UC1CpNXQ2XeII4Ugt8DfyBeM2
         tdIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=KmWTsEaA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385be965393si3069790f8f.125.2024.11.27.07.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 07:05:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=KmWTsEaA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tGJbt-0000Hj-4t; Wed, 27 Nov 2024 10:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJbG-0007dl-Jc
 for qemu-devel@nongnu.org; Wed, 27 Nov 2024 10:05:08 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJbD-0007kP-TK
 for qemu-devel@nongnu.org; Wed, 27 Nov 2024 10:05:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a9f2da82so8304045e9.2
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2024 07:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719902; x=1733324702;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+1N1WNsO1ozJ1n5opD5J6tWjylgLKYonMfqmT6MS/c=;
 b=KmWTsEaAnFGY0S06YQxmgFtkXqT/XjR5MHjkWbwpz16LpTgcrC94DpS2jvhligLrgO
 DddQNzq1gmpBtcZUdfnynEs8nYqnk5lIl40QqCEFmWOQDxayREFzW5/uhVjskp9/D3AL
 dWBrDLf+rkQLFejBAwNjfVJoJjMQGYYr37P5GPLf6UOr8wi+/KRNtu3onXEczHk/gsat
 ucyZHakqeAx/OyitYWjeiryIAvPEm8PTMGk9mNR94RGCIwaGqyT4v1HpXIDZ2ZFuZpw6
 K5Vby989Dtz50a/4JL0gNxcRVZ4eCWAAiGRX3wI6s/EE29/l1scqPOZz56CbN0Tp+A9p
 MqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719902; x=1733324702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T+1N1WNsO1ozJ1n5opD5J6tWjylgLKYonMfqmT6MS/c=;
 b=vJdKPbKulLi5dkCoeCRGyXnKFfI5bxXhSn44PrOfvltQ9r7BnRvaWWSC6WGixCej79
 PPgr6Z1TwRlqhqYHsPEzviAS5NJRro1l+rJk9+sJJeqAJToSsy7o07A4o8weqoiUYUgH
 Y252xJlam+CWB6bEywNE3yWD8QACiXVNIjXP8TqfqYVIaOYo/PC34K78DxcHAp6u3tGx
 hrXgj8T9oLNqWgLZzp15meLTFfGQYBCWAHE3n3UWItIjtJNPcrhsNYNzoHPwYoxw0yZ2
 xjBTUu33xbbT0Ov7T5Da65oFkQjN2bQnBg/ehpT1JR+1w7qJHCIbd73FJQ1MPStHihZG
 zA2w==
X-Gm-Message-State: AOJu0YwOZUYKKfq9ukV44Ix3kOERG3y6e2/jVeZf9z3wxx6EYaowVuP5
 0U4HW5E8KWvtPzg2u0qmlx/MS49Eu0JL2z3lShYM/fdVe/5SUWP8exB/U6UXcf/EsUXb5Wx//xl
 tEw==
X-Gm-Gg: ASbGncsvjMqG++fVNo8zpXxnuQGFDjPpcm0pbxL3+KYXvjJ6g7QvWPakDlqfpPWA9+L
 +EqORjjpmLJmOIYj4DqOF89tM5+o9bUxd6DwrFKPzxewEEL3Rcg8bz/WNeU1KZ1/AMsKMloPMoO
 Y8VMQsAoDhlSKDAJImgMgY92cAZp8CylLvOVn3IaWAB7FLGhEG46+GinTcNdrYXzJdMHtQAqo/o
 2YLs9w4mPG1Ti0cAFaxy0KF3jsb1j0C0g/0W7EfSVq85wpOXi6UmOy9uGKl2boWu6S82MnCypyC
 2HOuMRJkIfwipWB9ST2cqZKg8w==
X-Received: by 2002:a05:600c:4587:b0:434:9e17:18e4 with SMTP id
 5b1f17b1804b1-434a9d4926dmr33202175e9.0.1732719887324; 
 Wed, 27 Nov 2024 07:04:47 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.04.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:04:46 -0800 (PST)
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
Subject: [PATCH v11 06/15] hw: Add vmapple subdir
Date: Wed, 27 Nov 2024 16:02:40 +0100
Message-Id: <20241127150249.50767-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::331;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x331.google.com
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
X-TUID: MzJGFsP+9KoW

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
index 3c61238bc77..a5f76f27c12 100644
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

