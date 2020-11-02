Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3986500lfa;
        Mon, 2 Nov 2020 06:44:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxudScBd8dXp12OMVwaAWLvZUFelsaiooFUpA9DdoH11UJB6fIj7OJVrRFlv75r8F5uFDVO
X-Received: by 2002:a37:4f92:: with SMTP id d140mr14478703qkb.402.1604328266654;
        Mon, 02 Nov 2020 06:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604328266; cv=none;
        d=google.com; s=arc-20160816;
        b=qbBsls4EpYRiBZqW7HqNFE9JlWcy5P8XsdVw0tXgfVg7vb0WfHZU7CeIqEYDrYEajI
         QQp5p55eecsmfbbfdFahj9wRyDfC6w71iIrYVdPd6Z9N/4MDIdZDcxp8aeBxd2gJdvuq
         erW7j2Gicv8HJhPrSQs/+JDQQsaSncV2t5I4zn92+fO5vb+fxY70svmghLXc4zgcb8NT
         5ZM5oNMmZjBSA2Df94rVeJfYan0BoZY/usLehfZq9+HJFhBff1Z4FUYE3kXwVqDbbsMs
         1x9C7g/1wq9F2MvH6gdHDIaYzHK+JRUn5SE5DNfEI5xL54ZEh6KO0szDSJIVKXOTatim
         XCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8c2mx9+kUpRT0512oX5fGgjcKQl0QECZq9U12Mhnx9M=;
        b=L/FTOv3FN3yrk3w/RCHR76Qt/fBXWBsdIBTu6scg8fy66VbDKGfOFD0PEcDs1/+Tx/
         HyDgkwGmSptzpHfFkBZ2v6THUjOMmdUFbLrH0Q37k/TC3PdKD4/ZQGtzLUJtlflCB7rC
         QQ6VBMXLSaca4vvGz746GBwGWgRxnfwOtQWS+X6rfbek/FpOpZ7QqXC0aO+yf9sGLmfj
         rtEcD19ipSMO9Z4R+u0clXbR+icu4ijh0DQKljTedIe3gbhYGXn6HOEsRKOYXikUw4cG
         49Al6B7yqqK4uqhhXq6agNC6doII1FIYHkw/TsdTwCV7PfeETqLKH4NOs+RvO3qBHNxp
         anNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CrsdJ+zm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si9033969qkf.306.2020.11.02.06.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 06:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CrsdJ+zm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZb4M-0003K2-2a
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 09:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb3C-0002DT-Mx
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb39-0005Bp-8Z
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604328190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8c2mx9+kUpRT0512oX5fGgjcKQl0QECZq9U12Mhnx9M=;
 b=CrsdJ+zmRACUa4fQSel/W5HZ4iDqDhP+8ejgPU+XvOgcFw0tC2dabYD1soEbpkjobMk4Vh
 CNW6EinZ0dxtEl7vDgV3uNFP96/A17WMDLhoYm/jkm/NzV+E+SeJPCpFLJmG3LVQLiHuKG
 dXPcN+U6WGrNDwephjp9F5nyqC7OAXw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-E1y1roIdNCS1ts_Q7HosnQ-1; Mon, 02 Nov 2020 09:43:07 -0500
X-MC-Unique: E1y1roIdNCS1ts_Q7HosnQ-1
Received: by mail-wr1-f70.google.com with SMTP id b6so6466441wrn.17
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 06:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8c2mx9+kUpRT0512oX5fGgjcKQl0QECZq9U12Mhnx9M=;
 b=W/NgJjIs34hhd2jBzKAKrmpQJKG7YYFV6ubEVi+HCHR+qoBJ5wmw19jKkd1ydTvl2d
 5EsU47ZLUQi7po1Qu1iS8mNzN+Mpv2h28mQR5ymqUQBladAlRgFzDHA0XJSOoM3XsK/J
 ljPX/VGXxkqKeQu8GQnTfIYdvRHfDNJ7e3XMg9fJk3hZsDW3rLJqLGCIA9kId2he61RG
 MxJDWF7Py/vqiuwJdj6lnQOeF8IyHQ3fjJLXqOQOxamuT29fqCIlZW6EF460bgT1Rxma
 FpEDQRg33LpIIbwd+oNfVmmuq4diIlDppgOro6edu9OqI2mmyVmBvfgv9uKlVc14t+m9
 jsMA==
X-Gm-Message-State: AOAM531JhS7v2iXHXfjKdn5RFgLpJoaQ+LDKNt3dTR9esWBEFf2IC7TB
 5GXZ+d22fKnuV2oRuG3fyWtd5D7LZqZlx05gk6NWp6lOolhHMGT39wGhsARH/YbQa+vF6ygnZKn
 qTStPaiGogAoR
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr18876558wmi.140.1604328186113; 
 Mon, 02 Nov 2020 06:43:06 -0800 (PST)
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr18876518wmi.140.1604328185864; 
 Mon, 02 Nov 2020 06:43:05 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id w4sm9067803wrk.28.2020.11.02.06.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:43:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH-for-5.2? 3/5] tests/acceptance: Skip incomplete virtio_version
 tests using '@skip'
Date: Mon,  2 Nov 2020 15:42:43 +0100
Message-Id: <20201102144245.2134077-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102144245.2134077-1-philmd@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O70/KUS/Ea7o

Prefer skipping incomplete tests with the "@skip" keyword,
rather than commenting the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/virtio_version.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/virtio_version.py b/tests/acceptance/virtio_version.py
index 33593c29dd0..187bbfa1f42 100644
--- a/tests/acceptance/virtio_version.py
+++ b/tests/acceptance/virtio_version.py
@@ -140,17 +140,20 @@ def check_all_variants(self, qemu_devtype, virtio_devid):
         self.assertIn('conventional-pci-device', trans_ifaces)
         self.assertNotIn('pci-express-device', trans_ifaces)
 
+    @skip("virtio-blk requires 'driver' parameter")
+    def test_conventional_devs_driver(self):
+        self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
+
+    @skip("virtio-9p requires 'fsdev' parameter")
+    def test_conventional_devs_fsdev(self):
+        self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
 
     def test_conventional_devs(self):
         self.check_all_variants('virtio-net-pci', VIRTIO_NET)
-        # virtio-blk requires 'driver' parameter
-        #self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
         self.check_all_variants('virtio-serial-pci', VIRTIO_CONSOLE)
         self.check_all_variants('virtio-rng-pci', VIRTIO_RNG)
         self.check_all_variants('virtio-balloon-pci', VIRTIO_BALLOON)
         self.check_all_variants('virtio-scsi-pci', VIRTIO_SCSI)
-        # virtio-9p requires 'fsdev' parameter
-        #self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
 
     def check_modern_only(self, qemu_devtype, virtio_devid):
         """Check if a modern-only virtio device type behaves as expected"""
-- 
2.26.2

