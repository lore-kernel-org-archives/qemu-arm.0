Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC25C53200
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:41:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6PM-0006il-Di; Wed, 29 Jul 2026 11:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6PI-0006i7-9L
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:41:20 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6PD-00024X-HE
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:41:16 -0400
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so891805f8f.3
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785339674; x=1785944474;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Wfgnax45aICt6Jk7Ro6ypa6BY2EaCT+RRKjj6PSNFs8=;
 b=RlZE/ogiBgQiA6FpzEmShO4bhSmQ1rVWbRwZIfAk69DEQT6jv0vcKa68o24PtcaSTi
 xEQPwxBLaBUcEYE/upWPZLACA82QawLPZBlj/AhmtTS3Idh49MnQVth6o14uftemsolv
 TfbwywJpIBOXfWEZZU/pRvU1/9Q8hM4TJhHoXqt1B/EgSsa1cFurI6PA85X06YSn+Hwt
 xM7u6cQ2G4/bomIyv0TrZs52KUgyAdUQma5rIDTNNQ7Pj/uTTypsyTk7JMExu1k/R7yj
 Yiiiatqsj4eQ34PCMy8uNdFOHDnUz/YKEV2FvjINLESLnHmM5xUaeRSY+O8tCtdaOTLS
 pDyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoYEgxfGBHjxOryeV+U/gKf8eZOuaHmLzuWs81ZyyzHFuROwZgpT8pm6a9aOBUtN3eWXfPbNgn+cg==@nongnu.org
X-Gm-Message-State: AOJu0YyPdru+AOlqeUXas1eNGNT9t2U4Vl0C52Kayz/bgDXa5+R/rXQp
 WVQW9wFD8oVaqRAWCsXmZOa6jWFlBatHWeLPOyqjNjMWxBjibTBKkcvT
X-Gm-Gg: AR+sD13njNJbiEFNSB+Cv1sqCFDQ7e3CfdB83bgc1Hyt7lSvsBnq+cNsVUpfIdfmdml
 dphSXH7Iz85gGX3iG8Ml95Qb6y32hmF6JLAXUHMuDq+wvWcDwm6kGHspDwskFCi6Tz6JE+m20vb
 077iVEZeUiZanvT+vQO6HmSrxAdPpWqXPs1xOqQGgj/KUL4qsSETQ1Mz0qkgOyjB4jIy62JO9y0
 GN3T4xhNwR7iEulXZTYsG0jUFWq+I8JWvabwlLuGj/hhlXG9TUHEfQhz3PvDZdnBtGmdAnMaztV
 eBQRbfAYoxACjWZDnehA7oQhGSdPwW/8KFU9mVgHUNQftla2HKlDbmufXeRjVy3O7EbeeWn6mrs
 /YU4AzicHrqvzMDVzdOKZcu1YJyCsc9fSKMymFTC273zGh3M8f/4CYc73R56CO02D9gKd5tRRPk
 jDyygHnrOcIPZL0oPjzWQR9b5BbC3FhNOH48tCH5g49lbrFKSpip2lMr4QbVUCDCoyvcbZjCxVU
 Es+v0YO56lCy35HXBz3cQmIlp+upDZBbBw7
X-Received: by 2002:a05:6000:4902:b0:47f:9096:3c57 with SMTP id
 ffacd0b85a97d-47fb1eab364mr9370179f8f.40.1785339674061; 
 Wed, 29 Jul 2026 08:41:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6b0ef88sm9908108f8f.23.2026.07.29.08.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:41:13 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:53 +0200
Subject: [PATCH 17/25] tests/functional: give the set_machine probe VM the
 test workdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-17-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337964; l=1100;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Z+1yI9ZlM43E+k0NqAp1ImIMvg64cZpfA63qBC1lq6E=;
 b=p3ZPoaVQaMoUhqcwXzxowFOcrqom/B2Cp0ujOdgH6gbdM+Zxbt3P9FzbwLrV6TlMqb5yG/W/g
 8hz+FG8ZFUKAyWKhBcoEq5yUDoj871e1agFAVXejpUyQyLBWcF2pT4a
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f44.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

set_machine() launches a throwaway QEMUMachine to query the available
machine types, but constructs it without base_temp_dir, so it falls back
to the hardcoded "/var/tmp" default instead of the writable per-test
workdir that the actual test VM already uses. Pass base_temp_dir=
self.workdir for consistency; this also fixes VM launch on hosts where
/var/tmp is not writable.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/qemu_test/testcase.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index e4179d165c..ed861709e1 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -317,7 +317,7 @@ def set_machine(self, machinename):
         cls = type(self)
 
         if not hasattr(cls, "_machines"):
-            tmp_vm = QEMUMachine(self.qemu_bin)
+            tmp_vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir)
             tmp_vm.set_machine('none')
 
             try:

-- 
2.50.1


