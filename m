Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4583244lff;
        Mon, 16 Dec 2019 06:04:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkh7szlsvhCY1it7QXvYSJkGCEJY9rlZJqF5MMVKRVybEXQn0D4tU4dmEjHxde2yJEQaGY
X-Received: by 2002:aca:d6d2:: with SMTP id n201mr9874574oig.112.1576505056954;
        Mon, 16 Dec 2019 06:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505056; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHw/XuwtGoJIQjvm2JXAsldjzW1fHsoKMJtaM1aoESDePHl3rIneFEt2KpsM3RevaS
         n8GbfDieh7laS6O1H/eFpUpAXogekYA4p3uCgPvNKSIkHbcHRanvahWtiS4C4xvj2r6n
         0+qmXpzS3rCHHj3k8OQPhv/UlwpSMNUAEqzETK+fgQRZihAI4Ep3TC0xgJNkI1lGe9On
         F2qb9R44ywyY91tC9ATuyd5Lqq0vY02SRQLzuLBpBzM0egJj7YoCfliHVPHR3rmNnoSl
         DZnhJd0ceLCFSlxRp7qGlklwxJwEOofWmnog3E85MVmfpOc/VmnJ5SII1+BzJfQL2JeH
         DyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=go7p3wwISfVA0pTnz3FCaoN35+Sj/LsY9kHumr5FQBc=;
        b=nZHWGjyhOGU4q5MeoxsbfcdhXXPMl8hs0cpZGe2joTMv1QNjImm202hmys0kt2LCEA
         p8AHx40njx/5fMZqTaLfdjxIxkmicUPBuf0+hgZiXXWV36GQ+SbJI5k+KBGQ6JElo8jL
         GgI/tvCUsKDH9dinLzEEsMgDhLqU/YUFGXeC4t7ojEKoDHkFr6pI3wj9BWE50RTdhXSv
         d2TSMVJCbJqz/TFvoto+p09XPM3V9MBauM0Sq04x6iqzQZlToAFaqVeFDf6imFLYWy6U
         QvBMpDwGE0puzY+ud1on61KLFYxFjb/DYJyS78uScb+oP9UiIsqDlDMgnHSCDV6ccpXy
         nHyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NngFZxQT;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d5si10196620oij.139.2019.12.16.06.04.16;
        Mon, 16 Dec 2019 06:04:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NngFZxQT;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfLPOEP (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 09:04:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58583 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728094AbfLPOEO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 09:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=go7p3wwISfVA0pTnz3FCaoN35+Sj/LsY9kHumr5FQBc=;
        b=NngFZxQTzCi0dy/V0rHpIqF4ivGvco6IoqTDiD4sdmSYHDAvyxXBcCi0tmQ7LCpESO283N
        ynhLF+KCwDZ9WhXsSfMzY+B28IH4PDMUvHVoINsL66qVLKYzdUZgkVnrh1nHkKyPDW/Y8M
        CL2AWeEQ92zp3vv95hvMBH0t+0Z2LbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-rtoyeNZEPGCPQmzAG2EvCg-1; Mon, 16 Dec 2019 09:04:08 -0500
X-MC-Unique: rtoyeNZEPGCPQmzAG2EvCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 199D38024E6;
        Mon, 16 Dec 2019 14:04:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F0B68675B8;
        Mon, 16 Dec 2019 14:04:03 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH 08/16] arm/arm64: ITS: Init the command queue
Date:   Mon, 16 Dec 2019 15:02:27 +0100
Message-Id: <20191216140235.10751-9-eric.auger@redhat.com>
In-Reply-To: <20191216140235.10751-1-eric.auger@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: YVsyYWIjXzMl

Allocate the command queue and initialize related registers:
CBASER, CREADR, CWRITER.

The command queue is 64kB. This aims at not bothing with fullness.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h |  7 +++++++
 lib/arm/gic-v3-its.c     | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 0d11aed..ed42707 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -113,10 +113,17 @@ struct its_baser {
 	int esz;
 };
=20
+struct its_cmd_block {
+	u64     raw_cmd[4];
+};
+
 struct its_data {
 	void *base;
 	struct its_typer typer;
 	struct its_baser baser[GITS_BASER_NR_REGS];
+	struct its_cmd_block *cmd_base;
+	struct its_cmd_block *cmd_write;
+	struct its_cmd_block *cmd_readr;
 };
=20
 extern struct its_data its_data;
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 0b5a700..8b6a095 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -188,3 +188,40 @@ void set_pending_table_bit(int rdist, int n, bool se=
t)
 		byte &=3D ~mask;
 	*ptr =3D byte;
 }
+
+/**
+ * init_cmd_queue: Allocate the command queue and initialize
+ * CBASER, CREADR, CWRITER
+ */
+void init_cmd_queue(void);
+void init_cmd_queue(void)
+{
+	unsigned long n =3D SZ_64K >> PAGE_SHIFT;
+	unsigned long order =3D fls(n);
+	u64 cbaser, tmp;
+
+	its_data.cmd_base =3D (void *)virt_to_phys(alloc_pages(order));
+
+	cbaser =3D ((u64)its_data.cmd_base	|
+		 GITS_CBASER_WaWb               |
+		 GITS_CBASER_InnerShareable     |
+		 (SZ_64K / SZ_4K - 1) |
+		 GITS_CBASER_VALID);
+
+	writeq(cbaser, its_data.base + GITS_CBASER);
+	tmp =3D readq(its_data.base + GITS_CBASER);
+
+	if ((tmp ^ cbaser) & GITS_CBASER_SHAREABILITY_MASK) {
+		if (!(tmp & GITS_CBASER_SHAREABILITY_MASK)) {
+			cbaser &=3D ~(GITS_CBASER_SHAREABILITY_MASK |
+				GITS_CBASER_CACHEABILITY_MASK);
+			cbaser |=3D GITS_CBASER_nC;
+			writeq(cbaser, its_data.base + GITS_CBASER);
+		}
+	}
+
+	its_data.cmd_write =3D its_data.cmd_base;
+	its_data.cmd_readr =3D its_data.cmd_base;
+	writeq(0, its_data.base + GITS_CWRITER);
+	writeq(0, its_data.base + GITS_CREADR);
+}
--=20
2.20.1
