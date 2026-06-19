Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32A2CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 15:58:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wabab-0007GB-Jf; Fri, 19 Jun 2026 11:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaZ-0007EM-QX
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:03 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaX-0001Fa-7N
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so18351925e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781884619; x=1782489419; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgIofrY/IYsV4SdimI+anrW5DrHqrPhfx9JbT8ie9Uk=;
 b=BYed7eVQ/UMC6pArMjQc+OOYFLzoGT1pFHP2mD6tec4EC30gEQIX+/+utSpeAvzTnR
 zZuwqH5vQ4deUWCX/MtlLSJDYC/OoU0Bs2H0BcIGBedUEj9pd/6vdS8DLrIoDC9Yzv3H
 taPuVWDRgvIX6XRwJgt1RAtjfyUwks8Et0jYb6C+tcjVDAjXgUu8dv3f/9hHx45IaY3Y
 kNWvcvnDtg2L87tLWtbl9i+RDoR7vxDC/oU+o+JiXvAdCEyn6fFoY9QXjlivmuDU+Rbu
 RVRMOC6bW39Y4LhH9ozWkL1toAD2c+1SxK0Fm0bDPCu01wav6jnfaiYnFtkr5dQ6NbYE
 qHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781884619; x=1782489419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zgIofrY/IYsV4SdimI+anrW5DrHqrPhfx9JbT8ie9Uk=;
 b=AGR+m3SEKBZgQ01U7weNZZ48/yUkrBOmze5rpkjeQ7dTWTAZjNTqsBWsmOs824irdE
 VXPAWZMZkUCJ2OmY3gv7V2BEGMqZTta5M1cBMWUjakh+Uh2E6qbbJH7mSPVQ9pEDAfg2
 hgDsIddHLZNKBTuh7cD5ekbBpENmDQhTo+zSVLjlatYrkfUQi/UwkwtJuXVkNSWu9Mbm
 EDvXrkIjWSU/lximdlot9248cNKhGRlo1GbmDO9/APDgPcSXsPTSs+i2wm34SmfckFK1
 w8vahCkVD9WRFz+w/7POywzo/J+LYSODO5dSG4OkaXzRgY/cA8iayx9SVZyw8xrXPPLa
 kSrg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+PBRaqfF1MrJxvEpGiypNsIrC/DT9fg3HzOwynstv8FpjuLWSZnUgZWHZt29q590850XURd4wPKg==@nongnu.org
X-Gm-Message-State: AOJu0YwZSwkZqtTTewda0+FyoY9I0qWnsK51ISdHE8uNhoqjxgOxaWn1
 NBrm4AtVFQOtJU6J6Ri2eE3kbfA5Vr0X5CdWfaDCEYCVxJ+CqEqtoeafZWPkC6mCaFQ=
X-Gm-Gg: AfdE7cl/9gKyP7Q2aKjCPHzCSDH93i6qZejQfQOGOA9DJzR/ChHuDXZihacZCUXt6SF
 s4isRUspx35zC7d9CiKp4uq1J4HrWZlfYhUEQyOhsXC0zjhmFrivlUcghezYfPJsyzcU/avbYMj
 MUGgOgc9P6diU1F4y43nA2kgerLA53cfotLa5nRDqQeteRAEg4ESk1xylWZH1RrapW1HfSkmXHd
 5YomFOl897kzWdFspcBNMbjqvlfKS7qtibekEkbAR6fxzfZ5C5cgCAsEAPbCZCJjmNei7HGM3ii
 dfzn6DEDWHtWSZ7sAnpH51Xd1u5+oXsHJq3yaiMT89qFwl2lbNj6anbx9zk5f6ap5GTbwe03ghC
 bxaSFYSTUthMbFxmbbciih6VSkwrWvxbjbgbcrNfExg6yjY5yJqZXOYIbr3WxUEG21xe3bB0kAn
 pbEN9KYb5a6DqG
X-Received: by 2002:a05:600d:17:b0:492:4410:ec5a with SMTP id
 5b1f17b1804b1-4924410eec0mr40870885e9.33.1781884619436; 
 Fri, 19 Jun 2026 08:56:59 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5ddbsm58072f8f.12.2026.06.19.08.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 08:56:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6AE275F82F;
 Fri, 19 Jun 2026 16:56:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Cleber Rosa <crosa@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/7] python/qemu: split arg between base and harness lists
Date: Fri, 19 Jun 2026 16:56:50 +0100
Message-ID: <20260619155657.944220-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619155657.944220-1-alex.bennee@linaro.org>
References: <20260619155657.944220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

There are argument we add because we want the test harness to control
QEMU and arguments we default for handling the display and machine
type. Split the obvious ones between base_args and a new list called
harness_args.

We will leave the complexity of the serial ports for now.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20260614100902.885698-2-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 python/qemu/machine/machine.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index ebb58d5b68c..e8973a87394 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -292,8 +292,8 @@ def _load_io_log(self) -> None:
                 self._iolog = iolog.read()
 
     @property
-    def _base_args(self) -> List[str]:
-        args = ['-display', 'none', '-vga', 'none']
+    def _harness_args(self) -> List[str]:
+        args: List[str] = []
 
         if self._qmp_set:
             if self._sock_pair:
@@ -307,8 +307,6 @@ def _base_args(self) -> List[str]:
             args.extend(['-chardev', moncdev, '-mon',
                          'chardev=mon,mode=control'])
 
-        if self._machine is not None:
-            args.extend(['-machine', self._machine])
         for _ in range(self._console_index):
             args.extend(['-serial', 'null'])
         if self._console_set:
@@ -323,6 +321,13 @@ def _base_args(self) -> List[str]:
                 args.extend(['-device', device])
         return args
 
+    @property
+    def _base_args(self) -> List[str]:
+        args: List[str] = ['-display', 'none', '-vga', 'none']
+        if self._machine is not None:
+            args.extend(['-machine', self._machine])
+        return args
+
     @property
     def args(self) -> List[str]:
         """Returns the list of arguments given to the QEMU binary."""
@@ -366,6 +371,7 @@ def _pre_launch(self) -> None:
         self._qemu_full_args = tuple(chain(
             self._wrapper,
             [self._binary],
+            self._harness_args,
             self._base_args,
             self._args
         ))
-- 
2.47.3


