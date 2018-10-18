Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2801660wrt;
        Thu, 18 Oct 2018 13:05:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60aNV/RFP9yWlH+lx1TgY/rM/tT7MmZ4kfUUIpClXk8MPK0uqBbzzGwjlYrTvSaGVm9O24S
X-Received: by 2002:aed:2601:: with SMTP id z1-v6mr30459893qtc.123.1539893148475;
        Thu, 18 Oct 2018 13:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893148; cv=none;
        d=google.com; s=arc-20160816;
        b=COdcY9Z3HjnBmjN//d8giOJziV97hLx+EcxexzkdctzlWPbG9yzqvmVECfdZZpdOVv
         hPsaChaO15lAmFIuefOxHYg58L0mPaeXUeSgCB8qYyPkHEY1rfgsUyjowloj8vRvZ1xp
         MI2Aq+FWoAlBfB8nthVP1AoajeQqfJZSF5HlMFX1p4IGdbMNhcWl0/Bqi2q0i2Tmn2/E
         7RM1fvFCBbY4HGq2yt9OE5qte05ey1zA93LonKfs0dVvs60nnga1l7hgx/FOLtjCY33c
         OTSqSVd316qg4k15r4yqs9mMXg+1CbHvCQNsdhXO4cYq2I0kp+9XZro1S9tsKo8VtbxT
         B8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EH/Uk1TWJ0BoPPGcBtM0jFZXGIrdO0VMW6yh5DzSkYY=;
        b=MelhI2B6nSkNiSIlq+6/9c1TJuIpJi/8BlENDEIYNCnkME9oPneoi+AUE6yZ+uedSP
         W9gtn4saPibxO61p2cgiDQ7xmGdqI0EzlNI9NsF4nIvIAykrG6e+ZHM2b+HShgUgZO4O
         YK3S0+0P5YMhNNqa1kDNzu3QNPtK/um8K44BNq2I5OfIk/UIx5qIIGGj+WuVE9kQm65N
         x8perr1AL5SXjyy02VKLvCrZnv6XeK7Oj2O8j51jEP99oh+vGpk0qQhGIxO6lIbK4m9y
         3FaQ+lWoZjml4hP/8eRnC7Upjs2Tj4e5ewwOQuT3F5BQaLKb77W8t4NWI57FiEkKRV1Y
         9qjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13-v6si2426912qth.310.2018.10.18.13.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEYF-00082W-Ht
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:05:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXc-0007hi-TE
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXc-0007Ra-36
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEXb-0007QU-Tj; Thu, 18 Oct 2018 16:05:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD0DF30F8BE5;
	Thu, 18 Oct 2018 20:05:06 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8A515D75C;
	Thu, 18 Oct 2018 20:04:59 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:42 -0300
Message-Id: <20181018200422.4358-6-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Oct 2018 20:05:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 05/45] trace-events: Fix copy/paste typo
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
X-TUID: jBLuPJhyLW4I

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

