Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp288609lfk;
        Tue, 8 Feb 2022 09:55:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEaw5gC4MY9vdfsQnKBdE/SR8KbYaQm4AepHKCXsNumhYp36uaV/6ualT3bBDd0MNlJznF
X-Received: by 2002:a25:9c02:: with SMTP id c2mr1591059ybo.685.1644342925489;
        Tue, 08 Feb 2022 09:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644342925; cv=none;
        d=google.com; s=arc-20160816;
        b=u5my2tc5E6JxRznISheRW3thJjO+Q//bi+byHzDrVEIIS8QCHtfCWPyoS/qI00pmQF
         s4h4I6Fkx0CuwGDJyj6scETf8qlTaD5V/33eA1cv6IqMJLAiIySuApXQJsKbO8PvZIrQ
         Hbj6fsySVFlfcc0DJcLMnixZ9OO1KymcvYazPJH65HvJP6g9XNiaEmjhNs3cbLl7hPUm
         CKHTcoXSlEEefRdNUoupUAGzeNHc6kf0AXF7wvC7ReSAtxZngN2RU1lkbwPCVdc7smZK
         H6TIeuyXt4L+GKFQAkj6WNjahd9KPzGxx+2xZgpCjOPzW22d8WAZM94P/uhqf3fGBpY9
         4LNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TeGZ3fztF9Kc3mfAQS9k9SzN001AUn+r3TkwGe9HSwM=;
        b=FH6Udv8W1K3QSffakjIK+TA4DtFCMQ7ZmUVwkUzqEGUUr5DxHJA6e3QK0Y7nMI6xY7
         XUB5mMR1sMguEmryMzAv7hXPy4bqdIYnyxfNaAay/Y0ixCtxsUygkppHo4wc03I3SOod
         qe6KY1jLsRrkEoREzVs2C6bMUB2YbgRH3AJgzdY0PsuowtqFIr1Ca2rDL67BwV5EK2d5
         kpyI8wJA7TzFU1LkEpP30lVNNRzWNlt9fvxez6FI0HvDBXnZVU6uUqgdyN/dfiwcy2Ca
         81UIp7MI3YKoJ4qxuNR6aygnlVN1DVUdJ2BTF4skNCgzXf7sLa3+tDP6e2/5SGrO8ebP
         dT8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5mBnwxt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si4347398ybf.813.2022.02.08.09.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Feb 2022 09:55:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5mBnwxt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHUi4-0007iH-Ri
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 12:55:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHStq-0008JP-B8
 for qemu-arm@nongnu.org; Tue, 08 Feb 2022 10:59:26 -0500
Received: from [2a00:1450:4864:20::430] (port=41951
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSto-0006D4-5D
 for qemu-arm@nongnu.org; Tue, 08 Feb 2022 10:59:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id k1so15067004wrd.8
 for <qemu-arm@nongnu.org>; Tue, 08 Feb 2022 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TeGZ3fztF9Kc3mfAQS9k9SzN001AUn+r3TkwGe9HSwM=;
 b=y5mBnwxtsdEc/etd5FFlV7OqB6PdtHZ2xkQgAEFIdA6mfDVUnQLQdIJiFSQEqDClJw
 9kYUlf9qj7FdbQL9NAQsx4k3Z0151D5GmyXwyHZ2fufz67lgWmFfVO6uYfxX0+1RKznu
 +Hx4NQjsqRb9EAfRPWIka5xZYvu3fzW/WoiasMq552FGXpIhv+8A+KgVNKRRkgSkeU6q
 kvawiMBwnVQdi+CeB3FoXhF+T07K8LYstOeV05MCrFzW/dGi21BTSfrFcLbhzHkyP4Vr
 FynouAHWFxYWstFyCtl03Pw/+i7XnqFLwBMStwNY8vQFYJEbPPj9pkxQS5V6srNzJeSl
 xXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TeGZ3fztF9Kc3mfAQS9k9SzN001AUn+r3TkwGe9HSwM=;
 b=p0zPLc8A3hX9mgarUj5+90z9wnzbxmUS/P9DZCLw4RZ6kymCFq2x0bes8jOlWz/Jbt
 Tbkb5LuAAshyNHJinU4MlM5mNl5iG5rwoJVNX9m7KepFpJcoyitSm1FbqpVuI05FBc8z
 0EVGO3ItuTdOBig8RZYACy7szGoxx+wfuI8IEgFOxqwPocDx4yrdnoM4MBuiSYiWXhVQ
 xQji4WyvVj1s21ltpRvMvTazUkHtBBUCTOrOlPpzJQPGnYSD9898cdZ3mzN/Y6XWqo+O
 50dvXOduoTpffPzpfQYMlKuEEVEF4CDotL6GSiP89W07A9Xkf2F+/W/rhIYRmzZzdMjE
 vtWw==
X-Gm-Message-State: AOAM530cbMH2LvYmos+zq6no4xNNwka1omUv/IGIaUs/dCq/FX7tnBd3
 m6l1Rqey2NXJ30NQov6hagH5WOXaxRioUA==
X-Received: by 2002:a5d:4528:: with SMTP id j8mr4167273wra.544.1644335954279; 
 Tue, 08 Feb 2022 07:59:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f5sm14805125wry.64.2022.02.08.07.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:59:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] Kconfig: Add I2C_DEVICES device group
Date: Tue,  8 Feb 2022 15:59:10 +0000
Message-Id: <20220208155911.3408455-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208155911.3408455-1-peter.maydell@linaro.org>
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EilNu8mKwcUu

Currently there is no way for a board model's Kconfig stanza to
say "I have an i2c bus which the user can plug an i2c device into,
build all the free-standing i2c devices". The Kconfig mechanism
for this is the "device group". Add an I2C_DEVICES group along
the same lines as the existing PCI_DEVICES. Simple free-standing
i2c devices which a user might plausibly want to be able to
plug in on the QEMU commandline should have
   default y if I2C_DEVICES
and board models which have an i2c bus that is user-accessible
should use
   imply I2C_DEVICES
to cause those pluggable devices to be built.

In this commit we mark only a fairly conservative set of i2c devices
as belonging to the I2C_DEVICES group: the simple sensors and RTCs
(not including PMBus devices or devices which need GPIO lines to be
connected).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Feel free to suggest other i2c devices that should be marked
as in the group; as I say, I erred on the side of not putting
devices in the group.
---
 docs/devel/kconfig.rst | 8 ++++++--
 hw/i2c/Kconfig         | 5 +++++
 hw/rtc/Kconfig         | 2 ++
 hw/sensor/Kconfig      | 5 +++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index a1cdbec7512..aa5042f1569 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -192,11 +192,15 @@ declares its dependencies in different ways:
   no directive and are not used in the Makefile either; they only appear
   as conditions for ``default y`` directives.
 
-  QEMU currently has two device groups, ``PCI_DEVICES`` and
-  ``TEST_DEVICES``.  PCI devices usually have a ``default y if
+  QEMU currently has three device groups, ``PCI_DEVICES``, ``I2C_DEVICES``,
+  and ``TEST_DEVICES``.  PCI devices usually have a ``default y if
   PCI_DEVICES`` directive rather than just ``default y``.  This lets
   some boards (notably s390) easily support a subset of PCI devices,
   for example only VFIO (passthrough) and virtio-pci devices.
+  ``I2C_DEVICES`` is similar to ``PCI_DEVICES``. It contains i2c devices
+  that users might reasonably want to plug in to an i2c bus on any
+  board (and not ones which are very board-specific or that need
+  to be wired up in a way that can't be done on the command line).
   ``TEST_DEVICES`` instead is used for devices that are rarely used on
   production virtual machines, but provide useful hooks to test QEMU
   or KVM.
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 8217cb50411..9bb8870517f 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -1,6 +1,11 @@
 config I2C
     bool
 
+config I2C_DEVICES
+    # Device group for i2c devices which can reasonably be user-plugged
+    # to any board's i2c bus
+    bool
+
 config SMBUS
     bool
     select I2C
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index f06e133b8a2..730c272bc54 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -1,10 +1,12 @@
 config DS1338
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config M41T80
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config M48T59
     bool
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index b317f91b7b4..215944decc7 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -1,18 +1,22 @@
 config TMP105
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config TMP421
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config DPS310
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config EMC141X
     bool
     depends on I2C
+    default y if I2C_DEVICES
 
 config ADM1272
     bool
@@ -25,3 +29,4 @@ config MAX34451
 config LSM303DLHC_MAG
     bool
     depends on I2C
+    default y if I2C_DEVICES
-- 
2.25.1

