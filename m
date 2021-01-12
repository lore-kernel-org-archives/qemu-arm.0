Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3604672lfq;
        Tue, 12 Jan 2021 06:36:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywmovIMP5hTmwCk8irTjwvNHaPt33l1RxjOkStNqPFsqAOgoGA3e0rfHKRy2fkUN6Fs4Ft
X-Received: by 2002:a25:b296:: with SMTP id k22mr6960880ybj.304.1610462191270;
        Tue, 12 Jan 2021 06:36:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610462191; cv=none;
        d=google.com; s=arc-20160816;
        b=NZIGqitgT+rRQwdOt+Kx3F76j+kWLvTwvqDwtiFRYmOJtCc2U4Qz9JT6Ce1wNDci6a
         fuQ0AS9dRS14HyjKGzvn4n0DrDVjgqhOKFvfwvV59oe79q6IoM7Is5bf1wPicjnB+kvP
         TUwvESImHtu70b5yA9XMeH3w/EPZc5lw1ImghXKaKb7xT+exjoOa4YFW4azESSmr24Pj
         h3cjnGmdA2yZkAm09l+ki3VXb4FYU0Ve9xZAmK8jedyp3xyetRan3SDasT1cUn437Yzr
         vYBXQPWD2bmK70nK5uC7M1pPwfgxloSfz5fjTC10OZfTAWRO1rbAxJbf0/oCIbyp7qU9
         n/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=J0fGFtDB9UaIfo7eTN9dKMiaJiN3lP2/cxg6roRa40k=;
        b=I1AZXO5pRGfeODD/neW2SkKYHtm2h/ZgLy8V8DQksRxvjWV7Y5PaIxAktSZLjwtYw+
         4Hfj8t8kR6SDYFIbjHlAmWWy4Y5YUtT9huFR9Ntng4BjUg8rkRil3PlfXgzE2iYeG+30
         C/8Ly6EenrNjV7mNzUfKJ7vzXKmh99WKNRV9CM6zYofLmcqNFVEyOwiJGsnxddp3Rs89
         pIge79e857yxKKwPi9HipZsy0PAsNJ5PXrEYqZ+a1SX5DO5+LcbqlP3QMUQrDOXfVNzI
         ffOf0AjZVyX3SZBeV9Bokx2Lv7UC1lfVMLQSj8pyn4SwRzU7K0Xco1Lle66CtelsuoG8
         E/tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RUEYX1uw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si2872238ybm.150.2021.01.12.06.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 06:36:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RUEYX1uw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzKmc-0001dz-Ko
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 09:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhP-0006Ch-Ev
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 09:31:08 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:38981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhM-0004ej-M2
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 09:31:07 -0500
Received: by mail-lj1-x233.google.com with SMTP id b10so3055518ljp.6
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J0fGFtDB9UaIfo7eTN9dKMiaJiN3lP2/cxg6roRa40k=;
 b=RUEYX1uw/vJDKloh3uQ3Bemy0fwmQ5BXSxo5MvGfXW5ln3Iax9G2pRGRKlr3lVkdoG
 EVvQyuPMjL9glKWXdDZ9xpmg6f7qRsLsOUmbwwLxSqKkfl0TSrXoftaYf+3QsIrjFt5D
 /6ULaZyaqs4e7jBVqJCrxWGhEHXM48NjwfbuiDLyvLCW4UybfcNT4OzeSFGb2VIoVVwU
 IF7hrS39dI1Rovom2xpaWdIIIhrvRDMechAB0lI4MWVo4Z8cVOvOe16v9n4IdK3x1JDe
 gfTnedz8H492ZkT/YSNm8Fi7O2fVM7S3algmrDoE7pgyw19YHfQYJTjCy8P9ee5zrnNe
 t7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J0fGFtDB9UaIfo7eTN9dKMiaJiN3lP2/cxg6roRa40k=;
 b=C8osSAqVH8gVynqkRjIOnvdb6kK+FNlKtndb7B8yDi6ip6e5sxqIs9V/gf0wi3VaJj
 VDog9CH5a3COB0YFY5tsGoh8YAV0pN9JSEK4c6O1yHWD6jaoNG7ejLDyJzoZFtJWicys
 g4IN9PPxzyOTTia3J3Kq8CbeUmuOBaP6JixQ7S0o4rWd41UvEVxFX4Bbu0AvG+RyYqZ0
 5l5GOmFo5jiz5QPnDT17JqOg+fyiJPjR3cpmL2pUUcHRw0R2/M6n3LY/5o+BNPaYMh8z
 +uI9hg887dH2w0L+g7rofl6K9r3XZn8xY6tmRw9ZAkd/jsjPaRWrcpgrqiifIzS9HRGo
 VIbQ==
X-Gm-Message-State: AOAM532ySfSQhkjMfLfqgLmr7YWRy2tQW2I7aboEZzRs2Ou+d84YMtpj
 zJOt9BThKk5NVtSGZYoZBCgOJePUdOzbtQ==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr2038590ljg.451.1610461861839; 
 Tue, 12 Jan 2021 06:31:01 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c24sm365499ljn.116.2021.01.12.06.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:31:01 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv4 0/2] arm-virt: add secure pl061 for reset/power down
Date: Tue, 12 Jan 2021 17:30:56 +0300
Message-Id: <20210112143058.12159-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Maxim Uvarov <maxim.uvarov@linaro.org>,
 f4bug@amsat.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ML6h0hQGaf4B

 v4: rework patches accodring to Peter Maydells comments:
	- split patches on gpio-pwr driver and arm-virt integration.
	- start secure gpio only from virt-6.0.
	- rework qemu interface for gpio-pwr to use 2 named gpio.
	- put secure gpio to secure name space.
 v3: added missed include qemu/log.h for qemu_log(.. 
 v2: replace printf with qemu_log (Philippe Mathieu-Daudé)

This patch works together with ATF patch:
     https://github.com/muvarov/arm-trusted-firmware/commit/dd4401d8eb8e0f3018b335b81ce7a96d6cb16d0f 

Previus discussion for reboot issue was here:
     https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html

Maxim Uvarov (2):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: add secure pl061 for reset/power down

 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 40 +++++++++++++++++++++++++
 hw/gpio/Kconfig       |  3 ++
 hw/gpio/gpio_pwr.c    | 70 +++++++++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build   |  1 +
 include/hw/arm/virt.h |  3 ++
 6 files changed, 118 insertions(+)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1

