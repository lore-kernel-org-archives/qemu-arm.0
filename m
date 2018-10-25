Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp715226wro;
        Thu, 25 Oct 2018 06:37:08 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cVydVX3bYiGS0kwBnbM1AhaR+rqUwVO38asIntxnM86AnPQAE5s52zv8u+IbnWt8LxMQuj
X-Received: by 2002:a37:7907:: with SMTP id u7-v6mr1381370qkc.283.1540474628546;
        Thu, 25 Oct 2018 06:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474628; cv=none;
        d=google.com; s=arc-20160816;
        b=gXjq558XgJkt2xCT76K7Wrdzqs9PSzygYvhGc/yXoRy71WrVTV/n8Tf/nOkkdErKDd
         smzJmr2AscBWKX39/fC6tdAJTuFkkVB7opL/r1bTAYHRfAGzqESn/a7R80h9M1QpVmzy
         N1Lk4x9K5C3SFHdn5qZiliAjXnrjn2jH1x0GspLxJR7C76y34LwAO6hn3wJXSvi3yK/O
         22PbkIf/EhLvPjV+A0aCJb7xnVmN9Zer7yZ1nj5WGqEJcpnPdhBJo8sW7pnlC0rYNMyL
         FyBzhggfgUmKs+2p+TpIEMTdX2+Wkw04lkSeyVTxHWKGS24gmWjv638R00NGsyrrLof3
         8/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=xxCXjLqIv7LOj8ClqDnwazq5Bg8/We4ifSNPku3cTew=;
        b=fqdsSnOEomzs2+kkz6sY0nYIPbGSD51vAv7IAOYFDxlYuzlleH44GBfVPCwZ90VRxp
         uPFQVBBfYbMZBpnXzgBMYpjw+b1Vyu10EsZV+MRexXLI5rezK1tTBwPvP84ed0NJhYUI
         ho7ZWF6b74V6S8eoO60j7p0IM0J3EgH8ERy3OdStOzNWgL3aDfANIdkYI8MbA2YkAtv5
         LuUiNJLdbRJ8wyr/oIZzso7T4eBtbrJl7Yc+jEHp8v3NAKnftuSSmADiY0RMSCAtSI/i
         +XTtzpJL1WNId021O6U12R2sGE+FrrW9r79jC+dHSkb1en5DcJf0Bz5AM1zcms5e8VSk
         T4IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189-v6si2841898qkb.40.2018.10.25.06.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfox-0003uR-K4
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnZ-0002vX-8d
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnV-0008Pg-2p
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfnT-0008KG-0U; Thu, 25 Oct 2018 09:35:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F89B3003C4B;
	Thu, 25 Oct 2018 13:35:28 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A25160BA6;
	Thu, 25 Oct 2018 13:35:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:37 -0300
Message-Id: <20181025133301.16578-20-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 25 Oct 2018 13:35:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 19/43] memory-device: improve "range conflicts"
 error message
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
	David Hildenbrand <david@redhat.com>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nmqiaeGkDSLN

From: David Hildenbrand <david@redhat.com>

Handle id=3D=3DNULL better and indicate that we are dealing with memory
devices.

Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-4-david@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mem/memory-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 7c706fadfc..0624184c40 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -175,7 +175,8 @@ uint64_t memory_device_get_free_addr(MachineState *ms=
, const uint64_t *hint,
         if (ranges_overlap(md_addr, md_size, new_addr, size)) {
             if (hint) {
                 const DeviceState *d =3D DEVICE(md);
-                error_setg(errp, "address range conflicts with '%s'", d-=
>id);
+                error_setg(errp, "address range conflicts with memory de=
vice"
+                           " id=3D'%s'", d->id ? d->id : "(unnamed)");
                 goto out;
             }
             new_addr =3D QEMU_ALIGN_UP(md_addr + md_size, align);
--=20
2.18.0.rc1.1.g3f1ff2140

