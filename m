Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp717921wro;
        Thu, 25 Oct 2018 06:39:31 -0700 (PDT)
X-Google-Smtp-Source: AJdET5deEvkVY0BeSNdH34g8PSlz4i8wU92mV1yeQkHkmslvaUIK6ZivLLsh2m4T3c/atavvCfXK
X-Received: by 2002:ac8:33ad:: with SMTP id c42-v6mr1537487qtb.190.1540474771419;
        Thu, 25 Oct 2018 06:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474771; cv=none;
        d=google.com; s=arc-20160816;
        b=UYwAcQyzsSPJ2C9cOUMO7jX4RQj7JSPVMbipPE83WHVxwq+zrqXWDzkyZ6WI/YOOj8
         EiteNJLMO2FAyHBhS14T3W8kJVJA39Q9PF/FaXM2+MOLYy3csF74uNBNoGKViaDcTQrv
         C1KCkYgDRbKPrJk6qTSzfPoib0sEtzz60EwHPQgVvpoER9zmS+JWDRCPDGYiqnN8SVcG
         VLB2ZtTp5PhuFEttVc1W3pm5GLwMTE4HpTkLdM1DT/uAPA5c7DO7VMofrR5+7XL4mZZ1
         ACMR0Wv6F5f1PLmqdUoo2Elvqo3xJ8MVLDJCLUq70/nkGdw3Cp0RTapwkFGRtPLGc8Cj
         jKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EH/Uk1TWJ0BoPPGcBtM0jFZXGIrdO0VMW6yh5DzSkYY=;
        b=oIKBRKKb0m7VYKUjZC8XJn2jzfrPtdqt1qWscAk053jXWcG7GvIQI/qzSLiB3P3RVI
         S8tuJB5w+iNQ2cTBNvPn/OukSCzUKmNFHy+exxc80kec/6P6+emS6CPx91mZ7208D6ni
         U2Ty5hSjBJzd/5ZL3nX8T46Wfty/Op1JUrkn/JK7OFEuhbTt5PbB+tTGCNmnKtYDFHfd
         O8bAXg5Nei0H2aohSQE+pBWk2M7zDljncBkX6nCM6RkauvUhObz6m+jlgQAm+/+tF+xI
         hEfesiVOEwga+SCGf3uSZLByHIj8tKT2nivdrUPeY4glLTPCGEVvy07a6Z2k3BOG8I2x
         ZEPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r23-v6si1107324qtm.319.2018.10.25.06.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfrG-0006r8-QU
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:39:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmt-00028V-Ck
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfld-0006rE-Kp
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:33:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50286)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfld-0006nq-AU; Thu, 25 Oct 2018 09:33:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B693B30012D7;
	Thu, 25 Oct 2018 13:33:37 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02F125E1B4;
	Thu, 25 Oct 2018 13:33:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:22 -0300
Message-Id: <20181025133301.16578-5-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 25 Oct 2018 13:33:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 04/43] trace-events: Fix copy/paste typo
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tsZ4aEZHQKMO

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Missed while reviewing 5dd85b4b486.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181002212522.23303-2-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/timer/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index fa4213df5b..ca9ad6321a 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -56,7 +56,7 @@ systick_timer_tick(void) "systick reload"
 systick_read(uint64_t addr, uint32_t value, unsigned size) "systick read=
 addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 systick_write(uint64_t addr, uint32_t value, unsigned size) "systick wri=
te addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
=20
-# hw/char/cmsdk_apb_timer.c
+# hw/timer/cmsdk_apb_timer.c
 cmsdk_apb_timer_read(uint64_t offset, uint64_t data, unsigned size) "CMS=
DK APB timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_write(uint64_t offset, uint64_t data, unsigned size) "CM=
SDK APB timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_reset(void) "CMSDK APB timer: reset"
--=20
2.18.0.rc1.1.g3f1ff2140

