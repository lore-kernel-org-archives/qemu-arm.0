Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1397935lfb;
        Fri, 20 Nov 2020 07:24:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzFt8/nyz33dfJj2S+BjvUhQm4wvTft6so13j6FYH1FiD09AE2rv/eclnI02Q2s6wIv/jp
X-Received: by 2002:a25:ac55:: with SMTP id r21mr19178525ybd.23.1605885865050;
        Fri, 20 Nov 2020 07:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605885865; cv=none;
        d=google.com; s=arc-20160816;
        b=PeUmmx1aVZTOGcyVIxhLitswhyEJCsDXi/E+oq02Cvi5S0D2O6uzQLuEV6s83qB7yV
         pm6eS2KjS35mbbwbS5xF0YkIbt1DdqFWoCTaYssrJf+O/z3NpwvZqJEwGL1n6xS9Yq2h
         InT2eAfXKYDUWDaVAcVz6RjTdav1Eg4JkujTVVby7vHswXjOP5jAWhHYInXFp+DrBFQk
         GB4ZdXrfeR3ErqiyjOgDaRz6NY/7LxNx0Ux2SuPOpJlOvEPp8Kz4tu2zEkkev3MwRvze
         18pBU2Nj6JN/6yh1k2pBmiQLxGe2t/bWZAq2/ctZoo0SfShlnu4xtXSTRjujXvbbeyow
         NWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fxh0sHKcZ3r3wqRWmXHGbWTRHZxGehlsHVLLwOw47rY=;
        b=awPHjq0fgypi0aCH6GFwYyZwvOami0vPHc5pLum3t8LYfJxK6p379Mc+PfkU3o6t34
         NWQ0zwbpxTZCnKBZQ5Uuhp46aF6alTK2znB2mgFWSnl1FkKKnvR6ug/ZaeTWEcU0JksY
         qnLTY+eKwhkGYBVUeDZlLbxYiYhwf3dnXx2QVWdrcBBC206SQr53X2g+ktrLH1utgYFE
         AIfUx8KkkZIEpCrKcYuHDfgxx1zaP6A23S/rdDgGUcZJT6mJuAQojI5oHsAmL8mQ9s6D
         NTh75LjDsCq4VoqTi4OoaCXmx5U6GtnUrYIyQ7HydmSmZIMG0Uh8MRfZT1cJV2mH3Uto
         0EyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NONwvJ9F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si3637661ybc.379.2020.11.20.07.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:24:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NONwvJ9F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8Gu-000789-Bm
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8EX-00057l-DN; Fri, 20 Nov 2020 10:21:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8EV-0001vG-Vo; Fri, 20 Nov 2020 10:21:57 -0500
Received: by mail-wm1-x32d.google.com with SMTP id d142so10688814wmd.4;
 Fri, 20 Nov 2020 07:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxh0sHKcZ3r3wqRWmXHGbWTRHZxGehlsHVLLwOw47rY=;
 b=NONwvJ9FlrDFVMTcGHtr5l1J1bNkU0empsH/zuDRoXZXr9hTGmxwLjTwTVA93Qj1ss
 N2aCt6/CyvlAFpjS7cUzpr5bc8XsaZngzciJyi60+m0F8NpKwLFRPjlgR0Nk63AMSbuE
 DoSszFQsHigOdSFQP9Ay++wPCjef/RXSNNzWctA95wfAXEZpydn4u3inve692Db4xW3j
 n4OynOmUPcJeM1GDhzB60mGfWozFZAxh6tJdcju2/IvjeZL+QMXNl/OmDlYJgqRHdzXA
 HQEPILupAoiQtkKUMWZl1R2NKV8g8P9IH8TVxneSeg+/MExPlArAHYuripxE8/UQr7HC
 n60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fxh0sHKcZ3r3wqRWmXHGbWTRHZxGehlsHVLLwOw47rY=;
 b=C4UpQ4VdMM6299D6ChCvrSqB0E8L1L06wlPgJEqFifmNXwGVyfqghivJajemRMXncn
 N6QQ+WIT1DN7O2Sbi40io82+cQUtStKzSYG4OPa8JfpfOvHWML2fdWAXUIA8kJhCq4za
 on6nnHF9oFXyb/7QJYDUZi2KGUWjWTNmeanyPHTa9E7uv6R3L4QiNSlQGOa3oDqOzasC
 CK+fktYFU2tp75OwiDE0v7clMWCvxf4YZkB32ggHwjfn+wcn7zafmiX81zJj4cMmq+4H
 y8ucARjgGxMurcfLav3HOlQqa0QCRZdEYaPLmDKC23LRuHWAVYIpSzU1nJqHfv4MF3AY
 IL6g==
X-Gm-Message-State: AOAM530H6ZvDcWiHH9nWqOWaVnd3l2pp4Huu8b2rdUa1617y5UENdqyJ
 NOTiJSiAboI+eoTWfQGcqSyt6Ykn5RA=
X-Received: by 2002:a1c:bd05:: with SMTP id n5mr10933463wmf.171.1605885713617; 
 Fri, 20 Nov 2020 07:21:53 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p12sm5189760wrw.28.2020.11.20.07.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:21:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 2/4] docs/system/arm: Document the various raspi boards
Date: Fri, 20 Nov 2020 16:21:38 +0100
Message-Id: <20201120152140.2493197-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120152140.2493197-1-f4bug@amsat.org>
References: <20201120152140.2493197-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FWBOaoyz+hAf

Document the following Raspberry Pi models:

 - raspi0               Raspberry Pi Zero (revision 1.2)
 - raspi1ap             Raspberry Pi A+ (revision 1.1)
 - raspi2b              Raspberry Pi 2B (revision 1.1)
 - raspi3ap             Raspberry Pi 3A+ (revision 1.0)
 - raspi3b              Raspberry Pi 3B (revision 1.2)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/arm/raspi.rst  | 44 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 docs/system/arm/raspi.rst

diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
new file mode 100644
index 00000000000..b19284e4481
--- /dev/null
+++ b/docs/system/arm/raspi.rst
@@ -0,0 +1,44 @@
+Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
+======================================================================================
+
+
+QEMU provides models the following Raspberry Pi boards:
+
+``raspi0`` and ``raspi1ap``
+  ARM1176JZF-S core, 512 MiB of RAM
+``raspi2b``
+  Cortex-A7 (4 cores), 1 GiB of RAM
+``raspi3ap``
+  Cortex-A53 (4 cores), 512 MiB of RAM
+``raspi3b``
+  Cortex-A53 (4 cores), 1 GiB of RAM
+
+
+Implemented devices
+-------------------
+
+ * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
+ * Interrupt controller
+ * DMA controller
+ * Clock and reset controller (CPRMAN)
+ * System Timer
+ * GPIO controller
+ * Serial ports (BCM2835 AUX - 16550 based - and PL011)
+ * Random Number Generator (RNG)
+ * Frame Buffer
+ * USB host (USBH)
+ * GPIO controller
+ * SD/MMC host controller
+ * SoC thermal sensor
+ * USB2 host controller (DWC2 and MPHI)
+ * MailBox controller (MBOX)
+ * VideoCore firmware (property)
+
+
+Missing devices
+---------------
+
+ * Peripheral SPI controller (SPI)
+ * Analog to Digital Converter (ADC)
+ * Pulse Width Modulation (PWM)
+ * Security features
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index a0d5c57799c..bde4b8e044e 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -90,6 +90,7 @@ undocumented; you can get a complete list by running
    arm/nuvoton
    arm/orangepi
    arm/palm
+   arm/raspi
    arm/xscale
    arm/collie
    arm/sx1
-- 
2.26.2

