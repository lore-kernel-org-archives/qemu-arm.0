Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2817796wrt;
        Thu, 18 Oct 2018 13:19:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62FbYv8YPBAOLnmdR+TQL3PNOpf+SIfUmWh7rpKRIwxmg8c7zAP9bZ+obbialrpEP4oNYwS
X-Received: by 2002:a37:4e49:: with SMTP id c70-v6mr30854939qkb.27.1539893951658;
        Thu, 18 Oct 2018 13:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893951; cv=none;
        d=google.com; s=arc-20160816;
        b=FJaf8L/Ms6WKK81x3doM0M+Fy7ldUeGTD4LxIAGA1S5YngxqMBdNa7/zRb0wYC6vdH
         RN0ti5Wr9O5WXlzsh5iMjcY2qF+6kDUYpnqxwSTrovFOEHMNAUIVE1kFllqS+6W/00Sr
         hxWb6OiCX0eOE41ABnrft5BO8PtVkfrA47xwHivbJf+H/iSuugHcirsIr+yetaBaFjKq
         dfEQZIH4fGjmrWdUer3PE2tgqBFc6HL6z4vmoTTDZPDi3UKDmy3w5LlmEZWHCl1oSEpf
         W5S7rMWkaoDzQl6qZVceRCcZmz6Jwzu9VQAbM615iPBBEp5XlTJrrDJaM1lEp3TC7WMU
         3AcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=xxCXjLqIv7LOj8ClqDnwazq5Bg8/We4ifSNPku3cTew=;
        b=yJ04DSS0k+GFEyJ9z63DvovaDAT2sHyJ3V2bOUMOCYA9rMxdWysUueICDVTTnmTnBE
         4FzUh+Z14s+HJizuTHoL+qbNqrxkh86NguCkZsQDizxcWzNUAFaITYmY1QEP+0hjDc4S
         w4v5mwDMY6fUwmLg+uE8WpS58PLLBfWfNGjmr7CPfM9hDY3peuhTrthYjA/v1Oc71TQX
         rx+6tcavin5Xcbo2rXaokOYmTytee7iHLJrqTrVwRYAP+rb5sC3L+UEwFieXk9PLckgd
         QrQfNCD3dsuAZHKx8KHQ3fe99IHGC90AFSScQH9p5mpo9lEV6pR3rKUfr3rRzeEuoAz6
         O0EA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22-v6si3088028qtb.19.2018.10.18.13.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDElD-0003tR-4a
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:19:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZO-0000oH-Hs
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:07:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZN-0001wC-Q7
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56712)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEZN-0001t7-Hr; Thu, 18 Oct 2018 16:06:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EFD461470;
	Thu, 18 Oct 2018 20:06:56 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97FE352FA0;
	Thu, 18 Oct 2018 20:06:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:57 -0300
Message-Id: <20181018200422.4358-21-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Oct 2018 20:06:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 20/45] memory-device: improve "range conflicts"
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
X-TUID: 06FAut3AKeBp

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

