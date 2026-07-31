Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CC6C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmYJ-0002Ez-PX; Fri, 31 Jul 2026 08:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmYF-0002Cg-Mp
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:41:25 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmYB-0001bT-U9
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:41:22 -0400
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so887360f8f.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501678; x=1786106478;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Wfgnax45aICt6Jk7Ro6ypa6BY2EaCT+RRKjj6PSNFs8=;
 b=dI1+NLSMa/4B6QaOiaGeJAGW9RCkHNBmQnKv7UnhxV/ZNEgsmt2Rrnzt3dI+74bIcs
 WOfyV+szUZx0cLeG0OulHN6yfgC+u3f3sfQgExQVw5fXp0a4zYT6hiwH6UVd1cQIhhL1
 oBRd/dMN7dCm4ievfDfv4kw2Dtkesym0k9+e/Irsn+fh7LnQ2LvVUEUHWOPRdRzoVn2h
 8OzlSoPFO4CLPUuwkE/AjL4fX7HkmbLouPe6kLFgmc2Fo5+wUee9ZVU/+R1iUrvVN/OB
 XS1jmCw4zjUlNics/Sla5iw5Rq9TccoDSjl55tuS3Uu2I4Jv20bAiLe4D2rRiFQ6/X/7
 wCYQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqcKhOer+WLBpDzAoPagrMxp5aw13OsO8lJ+854oM5gtSX9wQXRZRdKAjNQuJqoIASCculKsgBXbA==@nongnu.org
X-Gm-Message-State: AOJu0YwJrdjvyDKAojJKC6FmyzCW2WWjcjo1x3f7vla3zu7gkN1g8bVh
 2pr9lkqK/jbAGmliOxsA+xIQK0w/cvN3pmx68/tqSNaAar4tiGxNM+Bl
X-Gm-Gg: AR+sD13vTTTU9wFZ+5DuZW40LBfnwz+QOSZWDGWJfGdtDSypxQDme1eZZtONUZD+o3Z
 WZoYxvKIPYYZks/xP1vghgGfV0rLws37kUduIjz9l2Z8tQfRTMa/Ctyzuv8XuZ2cMj8lCCvb2uF
 opv8sL5URyVfaDG7Vk0eLKg+ZXJdtiWkZrAksco4A6JqqOyK9V7J9Nqtx14A3b2PuxocLiSVNx1
 B+UMqsm/G58jvLbwnbXPx+tRD1yOGXUjqddCPotmq+rjDcMi7oddSsJXQbodwlXQwnM3/+9apGH
 AagYNmAcojKNdLcukoQpOWTbEI8gFDCHv4aEqSFNRN4ns5AtYAxgsZu91E0AqyzwGnxupmZvx3o
 g8s2U3do4wyeRcLminHQh4tv0/bZpPfGH8CYpfffpwIXyS/EJp1k63D7sVW1X+t2XiZBy6gOtP1
 gsVIqP8PWzjwNQFCQvIPPMrgnggrH77ewjqPBAmcnV3jjo/y9HG72EB4t8qRv2LI2SVN+a96owg
 0nog3364es6sO+PpEa1Mv53bmY8ocwvHo35
X-Received: by 2002:a05:6000:4289:b0:47f:9839:a79a with SMTP id
 ffacd0b85a97d-47fd2abab8dmr4431755f8f.10.1785501677626; 
 Fri, 31 Jul 2026 05:41:17 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458bb4esm4890379f8f.30.2026.07.31.05.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:41:17 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:16 +0200
Subject: [PATCH v2 17/25] tests/functional: give the set_machine probe VM
 the test workdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-17-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494708; l=1100;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Z+1yI9ZlM43E+k0NqAp1ImIMvg64cZpfA63qBC1lq6E=;
 b=MbsEmbQIJ8LmTRubmq1OG/na21OSmmK6gSY19UtB3Wl3hNAsdBDV7pI4pMFVcEwBOeZVr7AKF
 mcS+P6DkxGUBvNoDmNuh0F1xGYwgcRs3SoJvVj96FmjBH+zAdvmHMW/
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.45; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f45.google.com
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


