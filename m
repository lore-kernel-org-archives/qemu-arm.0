Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp845549njb;
        Fri, 18 Oct 2024 07:14:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYdK+ehe54dygi4LW7jmY3ICteEykIaJS6eUExsKn0aW1fVMLUbpFZXYVB1Xgx3zcU13fanuw8l0inXg==@linaro.org
X-Google-Smtp-Source: AGHT+IHJnlYaRW70fjMQkhgLppJIzdms2BJrCJ4u2sjfmtYu2ETPDqAat1ts7wcwiWeAkKvfquW/
X-Received: by 2002:a05:6870:b628:b0:277:e1e8:a085 with SMTP id 586e51a60fabf-2892c330c99mr2742556fac.23.1729260850022;
        Fri, 18 Oct 2024 07:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729260849; cv=none;
        d=google.com; s=arc-20240605;
        b=Ewl5w2gaCNXbbIFxC3vBgDKuhArfJBkpL1cYMXdQaHhzJk/P05+UOm5WCwhg6LUOES
         9r8OPUmGd2WXAtAjaS7ctkWZyIC85vXsEChkRTp+3mfttGEKZJ6XH1R6KrMMy65+pMqD
         4MstBDMsjEXW5tEtlcnJXJVtaNrsp948O0CUwhX9J2QbdHwfmYX1l3fcLikifefO/kyH
         rabWmNATmt6rJhH2p7BtWe3/J6z6F034JftG490Xi3xwBH7ZxsN2yCSj/hGg3OUwhDdE
         +kUc4iX8nwre398xHWoCVgZfjIHuixwry3qRiIHA+OW6ttMHM8BAb5sqeYWA5w1IE8bu
         TYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N4Yot1tudtAAArP4Zjr4rYhpGE+rTwWWEjyjmd9wPl4=;
        fh=JROX7yrvKMYU9BbmMyfGDG7C+H2YgCvn4aRmWAEICOc=;
        b=PfxIgjb77e4LlPcDSAhP8rqNRaZt6nXTv3YhnJJm/DwcG821Shou3TA14FwKrxvS9Z
         Md7E6gqYF+rnDSxGwdntQmQ828zSNqSzMQ9rfhEFISV4WCLchudw2FC6mGBlsw5LX9M1
         v51Ervhaf46V6zn/ieSgCPWAqzzFpMdGQY/1VJhATp6/QPfFlSGWkCxVz4qR1ci5Togd
         qcvcQxp90V+Vq+gCgoqCUvBE0RXTI7h6C+KpI1culax1GvYvhP2a9VmFEygdWrbYooIS
         CKdBPHwcKoRwRQcxkva09SLGkXyUhpF7JhxJ8OgQEZ8N42KkpsABfmPbBu+yPahClG9Y
         0zRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z0rAhZrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460aea8be3csi17370781cf.582.2024.10.18.07.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 07:14:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z0rAhZrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1njb-0000yJ-Ai; Fri, 18 Oct 2024 10:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1njZ-0000wZ-3q
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1njX-0006xq-4B
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so1925926f8f.3
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729260818; x=1729865618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4Yot1tudtAAArP4Zjr4rYhpGE+rTwWWEjyjmd9wPl4=;
 b=z0rAhZrY45VWzrz0Gqp02uZR1rf4f0XIrNPBUWN8ykz40OOx+ZHnyuu05IAk2zvGJa
 0748m4tjAuzHnbSL3QZ19VDS/ABbw5G+hh4PiNP0OhPjvWWeb/o7oaX+CydFKtVpFeoK
 JQiPoLTV1LoySzBfVP7z4hIPw9I4BJpjEDgkS87fh8GYDirrwKoWKxhH1d8NVzagQdKB
 0o/onCoowykQhazThsMtUxpZnNyfpYFewTH+DAsiX31uw8wPVTjKf23zc3SCzfDzD6Nk
 fqs/eOeuEpaW72+UATjH39A7ll9f4JRawYk5xGeAyxfC8O0jOjLNl/ywPGtqCkBl/sEu
 uH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729260818; x=1729865618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N4Yot1tudtAAArP4Zjr4rYhpGE+rTwWWEjyjmd9wPl4=;
 b=UQs05ZAHOg4kXD2FWYssMhSAuHTRWq3j9X+NhbQeMpuNFWs9GxzUkd3UuYLA3ok4OE
 UpFfkM0vo34M37aIHPBvrmA5j5VlfnGlEM82PBoRznisAL1QazlsVbedj3M3//8NlEli
 f6okb6W2Pi2r1omjvgvKXRLwxelMFoQvuGjTpUDhCcVm9Nef7Vzv6ruaOnKIOnr3eJdu
 lAMxB887luzY/f/kmAWbthgbUcONN/xchKoXkdkvFiTjVNUpMK6gFGV1P+rekpzA17Ae
 b0xxgL+NOTFnEtbmVheAtuARvUwbZWyhgljT6DXNrQ4h1OXiUFZVvJTLmsvjfs3KAzOR
 33WA==
X-Gm-Message-State: AOJu0YzWCXDylAklbhPUVbWgp4HPnHB9+wauYitIpARBVVQgWr42q24A
 hUciDABj8V9j3AovaCeH4SC6Rq9TBSyFyWgJOHQb4T6eoU8yo5w8b3QgJTV3wAMJDRQWS7ov3vB
 d
X-Received: by 2002:adf:f251:0:b0:37c:cfdc:19ba with SMTP id
 ffacd0b85a97d-37eab4cc04bmr2783674f8f.28.1729260817644; 
 Fri, 18 Oct 2024 07:13:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf0ecd89sm2040086f8f.78.2024.10.18.07.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 07:13:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 5/7] docs/system/arm: Add placeholder doc for xlnx-zcu102 board
Date: Fri, 18 Oct 2024 15:13:30 +0100
Message-Id: <20241018141332.942844-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018141332.942844-1-peter.maydell@linaro.org>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
X-TUID: EXjsMY7vbw9t

Add a placeholder doc for the xlnx-zcu102 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS                     |  1 +
 docs/system/arm/xlnx-zcu102.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst      |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/xlnx-zcu102.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 031b117a3a0..7c3325628c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1016,6 +1016,7 @@ F: include/hw/ssi/xilinx_spips.h
 F: hw/display/dpcd.c
 F: include/hw/display/dpcd.h
 F: docs/system/arm/xlnx-versal-virt.rst
+F: docs/system/arm/xlnx-zcu102.rst
 
 Xilinx Versal OSPI
 M: Francisco Iglesias <francisco.iglesias@amd.com>
diff --git a/docs/system/arm/xlnx-zcu102.rst b/docs/system/arm/xlnx-zcu102.rst
new file mode 100644
index 00000000000..534cd1dc887
--- /dev/null
+++ b/docs/system/arm/xlnx-zcu102.rst
@@ -0,0 +1,19 @@
+Xilinx ZynqMP ZCU102 (``xlnx-zcu102``)
+======================================
+
+The ``xlnx-zcu102`` board models the Xilinx ZynqMP ZCU102 board.
+This board has 4 Cortex-A53 CPUs and 2 Cortex-R5F CPUs.
+
+Machine-specific options
+""""""""""""""""""""""""
+
+The following machine-specific options are supported:
+
+secure
+  Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
+  Arm Security Extensions (TrustZone). The default is ``off``.
+
+virtualization
+  Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
+  Arm Virtualization Extensions. The default is ``off``.
+
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index a7f88c8f317..ace36d1b17d 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -107,6 +107,7 @@ undocumented; you can get a complete list by running
    arm/xenpvh
    arm/xlnx-versal-virt
    arm/xlnx-zynq
+   arm/xlnx-zcu102
 
 Emulated CPU architecture support
 =================================
-- 
2.34.1

