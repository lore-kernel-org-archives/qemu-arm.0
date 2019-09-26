Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2450783wrp;
        Thu, 26 Sep 2019 10:59:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyb1d0YZEBVr+UAa15hgI6xt4gmlIgBVS3woxG58wnManAO3yGpx/OFihKVllYnih1bQ3e3
X-Received: by 2002:a37:a012:: with SMTP id j18mr66401qke.146.1569520796933;
        Thu, 26 Sep 2019 10:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569520796; cv=none;
        d=google.com; s=arc-20160816;
        b=lXsYfc900oYsq/H4IiiBbtEsuN94gGCIWA5T79dfm3Cpzs6oNAes4QJ4/R+HUVEIh2
         d1YMdKXzL2vVayo2pJ0n5KK1w6zTRv2X1TYyIcBRP/X3FKSH2ECcdxQi6ShI7PqbPq6b
         /uKinv5jmAd2im7OhqeDe6KtA1FjuyO6sb9nRXrZQFBlVkeB9yUOXXQkxjPDHF4c8llR
         cUdH5cVYjk3mnKosO9mQ5pfAzc1jtKRJJSsHU3++5zkVDq1+gY2IiqYdPDK3s6DlMU1M
         C1dkwp4H8xkPPaU2lVSu4+02owjb1lEW2EabwKLd5ybuZHGBCsbiaMaa56uixmN2F5wI
         YhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cygAIn+NuvbvRK0dqFc+XGYOmNQ092Yut2eORQ2IB/E=;
        b=SaWN5lt1QxOOmZg9D0JhMzfJVbfQVu/caUzeE2CzCgzFTJxnkB7Msq4mDoPqWH6dpe
         xbkDU3bqh+s1VVCZXclnYNj5UvEGlNLo+SXN1UIsIi/8W2+HYabIahW8hehEQkXOLX6w
         +cLlhrxYjBBjy9Q7Tbv4Wwxtld7k5eidK5eiR2sSuJfzXdKCwDkwk9v89YNQrZrRM9wp
         fYjK8CQnhVTZK7zjGb1G+AgT/KUpnRi2eJTc58IftURUT6YJ9t9ka2pFyJZq/VQngosS
         x1QYZE0WK+WifuKpi+J477N2oHkJww+RbHGDv3ml7l2exGN2vm0inO0H8Sj4edwUyoQf
         Qrsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GQIbIbV9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o65si2238234qtd.63.2019.09.26.10.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 10:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GQIbIbV9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDY3X-0000h9-8Z
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 13:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgT-0004jm-Mp
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:36:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgS-00035k-Fv
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:36:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35069)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgS-00034b-9i; Thu, 26 Sep 2019 13:36:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id v8so3736777wrt.2;
 Thu, 26 Sep 2019 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cygAIn+NuvbvRK0dqFc+XGYOmNQ092Yut2eORQ2IB/E=;
 b=GQIbIbV9fySy4FLDxvt+JEgMFNVpmd1ccC7GT6b21MZWKp4WbYw20LIM7pgz0NVE+y
 hlTlUlr0k2tdGuiUbFoh8MopOPLEOyWysoq8tmL1AipVsVRm5HU2DP3orh4HgR2sLr6a
 J5uR6z7mE5gYiobYBpWg/0Slz6nrF0L2Pp2egTsd/sbvz8pGpp8kuOEam5MhBuDCestT
 lpAobfjhz8b7WqlUHZrJ/qA5SiQhHONtAcFPLjKRdJ2OMygky/dcts4VuOIFe/VhXWvJ
 QOhiz/B2dYU2VpPQWcsLiJWQrFCmpjXDExwu41ZDmhNQwIU6tiyoLoROSZ35ctFG2ABt
 2ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cygAIn+NuvbvRK0dqFc+XGYOmNQ092Yut2eORQ2IB/E=;
 b=YcNtuW7nITuqYCG8Gvx65ZXF67GZ78InlfS2IXYe9mdLgzxXjxgJGHqA7ehZzbm6zK
 oAWB9cfo3MLZcI6TWzeChrfLTAiDoLOPZIHc/nk/FSQHFYk0SM5jDdn+kiX1zD6bXhEr
 VYBHuFeXPA9S7q2PL4wbyWBGQCBJbrM98B8zn04MlzFqEnjjaNI3L4iyx+7Wud9Y2mDt
 KPyIgkDclstVnMHDQ7uOWeqLRXL6130f1VB23wXQsaot3iG9pIcEYEC/QdA9jvBqwXhg
 l0Gfye+YC2A3sLtlY7t/784m+LybXyuUZ72lauLes78KZBJ+oIVJa/Z1INOtkUgLG9d1
 TsRg==
X-Gm-Message-State: APjAAAVY648nTZ3fuHYfHhb0/e/hhl0KYIKNamayY+6f7Hm6ewljqooR
 JhWZggrji8d9gLygXuKAzi7F306HbJM=
X-Received: by 2002:adf:f212:: with SMTP id p18mr4215158wro.340.1569519303075; 
 Thu, 26 Sep 2019 10:35:03 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:35:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/19] python/qemu/machine: Allow to use other serial consoles
 than default
Date: Thu, 26 Sep 2019 19:34:22 +0200
Message-Id: <20190926173428.10713-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: enE+RUe0jaAl

Currently we are limited to use the first serial console available.
Some machines/guest might use another console than the first one as
the 'boot console'.

To be able to use the N console as default, we simply need to connect
all the N - 1 consoles to the null chardev.

Add an index argument, so we can use a specific serial console as
default.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 python/qemu/machine.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 128a3d1dc2..302b158a18 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -235,6 +235,8 @@ class QEMUMachine(object):
                 '-display', 'none', '-vga', 'none']
         if self._machine is not None:
             args.extend(['-machine', self._machine])
+        for i in range(self._console_id):
+            args.extend(['-serial', 'null'])
         if self._console_set:
             self._console_address = os.path.join(self._temp_dir,
                                                  self._name + "-console.sock")
@@ -495,7 +497,7 @@ class QEMUMachine(object):
         """
         self._machine = machine_type
 
-    def set_console(self, device_type=None):
+    def set_console(self, device_type=None, console_id=0):
         """
         Sets the device type for a console device
 
@@ -519,6 +521,7 @@ class QEMUMachine(object):
         """
         self._console_set = True
         self._console_device_type = device_type
+        self._console_id = console_id
 
     @property
     def console_socket(self):
-- 
2.20.1

