Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3708955dly;
        Tue, 28 Jan 2025 23:19:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1bGVhXAEqnQ5Hk0u1tc24oLlQSn07MgQqWIFKDq9VCK/MvI1UicrnQgs/MEGyKNrEApZW+tKgZ+Obsw==@linaro.org
X-Google-Smtp-Source: AGHT+IFY3HrEj99e8Y5h+dhuM3B3s+Tiy+EspcdvahOO7uHRkt6V2tBESTbz1d5srupjeK8TQpab
X-Received: by 2002:a05:620a:258a:b0:7b6:c6f8:1d25 with SMTP id af79cd13be357-7bffcd9d92amr302144285a.55.1738135181032;
        Tue, 28 Jan 2025 23:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738135181; cv=none;
        d=google.com; s=arc-20240605;
        b=OKXEI+Lf0JvZIqlISiYwcNEgoxnyVoSWU+22xc+U+vH0y7JNUBFRYo5bxMMmuxNx+O
         alRABQpOhWOtvYN0RC7CeXBzOyhVJizANmR4nZbN/D8TYISOnxeqcKbtrNkfGro3fJDM
         K1BL78jJBpoLNc+HP4EU65kn13LHlGPuUW1hhAiEQmOzVvqJ7fOdlbfPqf1i8fky21f+
         uaKHrC8rWyZdXcimqc2yQB20W+mCr3J65raLuX9os9OUGUzIi0mHeW11vMTon654AeNS
         B7fzxtz0QBD4l/uDeHB8PyXpCooA9yPiyXTOuWUkNgrzoAxF8xdCeJ6er7cS/aODiVyL
         Ua0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fJPPoNJ7SpyFkFdr/l2WpSEIekNft76cqRNMSyWjLMI=;
        fh=XEUWnmNUzgDVltOtMw+UmOaRtoK2L8C0I2oKK3mImI4=;
        b=ONW4NtIYsA0ARUwlsUoYnIn6ERayQ3YN9PLXRAYhwfOAXs1sPI+hoWqLPyfbKcU7dI
         3SXtt9hzsZhJPR0T6qw4le4VAomcAd/lyGX7YK78AtLXwzDDsZiY1xPjKh3xp80e4GpJ
         j1IN1nU+qkiev9G5Tm4bEIt7uzkQBJRy7LqIATz3nyw5HQfZU0hYkHQNDwwa5NrkeMCU
         WHeqB2qqffjhIa1H6MEsoy17cwVXBGPVKuAfFmTvOhhse21PBhk5AC2HOqskJjGscuvY
         ApMefip126AjUObjqR5/E5cP8cscUjGdpzUXk/0icTyI3TQRzbYVvRqLyEOyiMtE+H8t
         KHRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bpFKwfED;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81cafsi1427871985a.81.2025.01.28.23.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 23:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bpFKwfED;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1td2Lq-00025V-3l; Wed, 29 Jan 2025 02:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Lf-0001xl-HJ
 for qemu-devel@nongnu.org; Wed, 29 Jan 2025 02:19:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Lb-0003dS-Ju
 for qemu-devel@nongnu.org; Wed, 29 Jan 2025 02:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738135130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJPPoNJ7SpyFkFdr/l2WpSEIekNft76cqRNMSyWjLMI=;
 b=bpFKwfEDvsB3r1t8HpuCdZwt9M+G0CifJJqDzl49B7CC0DotG9Gs1IGwpWlIQuLVUle4i0
 +VG1OQHV2FxoYxrhHqB2VG1Sr4pZt1pOZMkz98qBrljO5c3SBx/SW3P5YDzdz6YhunV3xC
 eQvcFThJS/fxuJgOujRuCsk3abeLEWQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-I--pYQRaMjSfOB9JWu5QSw-1; Wed,
 29 Jan 2025 02:18:46 -0500
X-MC-Unique: I--pYQRaMjSfOB9JWu5QSw-1
X-Mimecast-MFC-AGG-ID: I--pYQRaMjSfOB9JWu5QSw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D90F81956048; Wed, 29 Jan 2025 07:18:43 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.105])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DE96819560AA; Wed, 29 Jan 2025 07:18:40 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 2/5] tests/functional: Update OpenBMC image of palmetto machine
Date: Wed, 29 Jan 2025 08:18:17 +0100
Message-ID: <20250129071820.1258133-3-clg@redhat.com>
In-Reply-To: <20250129071820.1258133-1-clg@redhat.com>
References: <20250129071820.1258133-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YeQ1bB55yVOE

Use the new do_test_arm_aspeed_openbmc() routine to run the latest
OpenBMC firmware build of the palmetto BMC.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_arm_aspeed_palmetto.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/functional/test_arm_aspeed_palmetto.py b/tests/functional/test_arm_aspeed_palmetto.py
index 6588c02aad79..815d05a0e5c9 100755
--- a/tests/functional/test_arm_aspeed_palmetto.py
+++ b/tests/functional/test_arm_aspeed_palmetto.py
@@ -10,15 +10,15 @@
 class PalmettoMachine(AspeedTest):
 
     ASSET_PALMETTO_FLASH = Asset(
-        ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
-         'obmc-phosphor-image-palmetto.static.mtd'),
-        '3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d');
+        'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/palmetto-bmc/openbmc-20250128071432/obmc-phosphor-image-palmetto-20250128071432.static.mtd',
+        'bce7c392eec75c707a91cfc8fad7ca9a69d7e4f10df936930d65c1cb9897ac81');
 
-    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
+    def test_arm_ast2400_palmetto_openbmc(self):
         image_path = self.ASSET_PALMETTO_FLASH.fetch()
 
-        self.do_test_arm_aspeed('palmetto-bmc', image_path)
-
+        self.do_test_arm_aspeed_openbmc('palmetto-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0x0',
+                                        soc='AST2400 rev A1');
 
 if __name__ == '__main__':
     AspeedTest.main()
-- 
2.48.1

