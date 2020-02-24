Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp802257lfg;
        Mon, 24 Feb 2020 13:32:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3Ir7tiFfwcN2BwDQsEIjwjskH+clw2KKsEWO+ISbQNsNhUikVkBv9/Np1Do4meFkTQn+9
X-Received: by 2002:ac8:10d:: with SMTP id e13mr48966815qtg.294.1582579946472;
        Mon, 24 Feb 2020 13:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579946; cv=none;
        d=google.com; s=arc-20160816;
        b=NiWrgcnXXOkyDoxKDVesxcQknpeHp/s3D7NGb9IimD3u2YVIAoJzWVhLeB6C7sjT1A
         OzLgZqEKz1k6AvJfInEKOvMe9AE0EPrz3CxUh0hyw7XlXlU+rcHnR+WuzwbbphxcXh7P
         eroz7ylypyEb+V73+l5dQ+XoRhvTwxf8ugkLG8GvX/w27+F2ikUPhZN/62Mcfme0mA6F
         2DbJL4yKX2hIyevETtL5frEAU1NP2SI8o7Q4GlZ0syZwHD1TggvxF03ohkdIqS63BFob
         dB6EQyJ5mbEzNRbqiSJ7X+pNYsqsfgevPy7LvQ738Hn8Zp/idcZZepOVu5qeOTPKXllc
         wK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/3GrB8c7DkAm0kiddLZXfSUHCAUPp481BLnEWDg9hQc=;
        b=bRhJlLAzINYyDHOaRry0p7lQqnmETh2cTVRRsvp5ctvmR0bztidgYlYJ0+pd4jdoBH
         +DLKYLW3CZqBRIJLlMOKHF4Q6+DOppwOMvlkRd3O7m53m9oCRjlKVemRFhzra60H0M6l
         vkK5ek9wQ8+2BEMCMuJjZJgZovizoyXW2vHHzRaziHBmt8K+kC4md+iTfmjf1GdgcqaO
         jueNn+dFYap4KSdkn/cHuHhk+8fy6+7yE00RQ142oIlEZet7510Om0Ysxd5GaqzhZ10W
         +HQ/d788pXbJOTH20JaNb4CLYJVGycQDzwfwyLCVMB35UxWPKHicWMvyn1FI+BlhJKxV
         6rDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eNnSDm7d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si6080158qth.54.2020.02.24.13.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:32:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eNnSDm7d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LKz-0000k9-Rd
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KsC-00006l-3n
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:02:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KsA-00088t-V2
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:02:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45616
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KsA-000884-Q4
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3GrB8c7DkAm0kiddLZXfSUHCAUPp481BLnEWDg9hQc=;
 b=eNnSDm7dOBYjZ3RzC15l4tC9H5qFFFMxXi9GfKlqku0QM6ns2tAaPNAsaReqYdsb+Z1aDW
 IGqCFBoRZbTf0FyizwuQoM6d37x9xi12yNsfmk54aGPrdbUM/XlYdVSHY5ti2OVieu5cAB
 A4NdN5UGkVIx87X8uAwnlO5WxP7HUXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-DYwcZOF1Pre-MduPNxcMaA-1; Mon, 24 Feb 2020 16:02:36 -0500
X-MC-Unique: DYwcZOF1Pre-MduPNxcMaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8C11005512;
 Mon, 24 Feb 2020 21:02:31 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C435C651;
 Mon, 24 Feb 2020 21:02:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 29/32] hw/input/milkymist-softusb: Remove unused
 'pmem_ptr' field
Date: Mon, 24 Feb 2020 21:55:30 +0100
Message-Id: <20200224205533.23798-30-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bY8/RNt2Oq5r

In commit 029ad4bcf3 we removed softusb_{read, write}_pmem(),
we can also remove the 'pmem_ptr' field.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: qemu-trivial@nongnu.org

 hw/input/milkymist-softusb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 3e0a7eb0bd..7deeb1294f 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -64,7 +64,6 @@ struct MilkymistSoftUsbState {
     MemoryRegion dmem;
     qemu_irq irq;
=20
-    void *pmem_ptr;
     void *dmem_ptr;
=20
     /* device properties */
@@ -263,7 +262,6 @@ static void milkymist_softusb_realize(DeviceState *dev,=
 Error **errp)
     memory_region_init_ram_nomigrate(&s->pmem, OBJECT(s), "milkymist-softu=
sb.pmem",
                            s->pmem_size, &error_fatal);
     vmstate_register_ram_global(&s->pmem);
-    s->pmem_ptr =3D memory_region_get_ram_ptr(&s->pmem);
     sysbus_init_mmio(sbd, &s->pmem);
     memory_region_init_ram_nomigrate(&s->dmem, OBJECT(s), "milkymist-softu=
sb.dmem",
                            s->dmem_size, &error_fatal);
--=20
2.21.1

