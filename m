Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1011006lff;
        Fri, 10 Jan 2020 09:59:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFnue2NCvzpfSrCY/uoz4lOGLrm8omq4I2vGhw/IA/dpGYe5O6wR+dU8H7Enr/weUPEPDh
X-Received: by 2002:a37:a5d7:: with SMTP id o206mr4362436qke.227.1578679184191;
        Fri, 10 Jan 2020 09:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578679184; cv=none;
        d=google.com; s=arc-20160816;
        b=muUeFVo0PJ+2JkrUbWyKlcxYkzZJhvsr4kSD0PFQy8OyZFZ2xqNC/aKiScb3t0ipcW
         Ax56nAo9ha9rGdAcDBRT85QxTBtfVkOHh+0TM8EXKxmytj3otzT2ZwvFMrTHJTD/4S4Y
         FqLAiA+w3OztouQ4YLll/MD/Ao2mbSI0VWCLC1/SuHxY+ZZ6+4tGk0p9nlN8KkVUwYi6
         TnRILh9STJahCJxwvbfW7W2dg9+fG6RzuizFVv7WUObABc2BXqAs5PwqbW3Viey7ObTl
         wk9bjcJkF7mSmP5J4Zcj9hYR1GjHX3b/zREOkKaItEpPnthtWpPBPaUFwZqRLkDcvY21
         dFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/qRvnKikU/zZW4H4BQbW8b5TjzE8O1lK0e+sh7nSqVM=;
        b=we7QdDfaSIFx/hPCVjSYS/FIi3eN1lIpb0SQ/i1WlafShQI1/1cW0U8qZ7Z05tsHYg
         LDvg/emxQ5oNCiLxEZolZ9yjrwdiXMOno1BqNqWO+93yJ8mcKgap9WySzKVk+5w3vsaS
         4ROLeW4qxd8CADxCy83TNjoQ1pfG3A3Vhg3wx0rAHH+KYtU1Iyfmjzrkhj+Q62XkBw4i
         wgqdlZ5rqIBcEsJ2NRGUaq8cs4nmfND2usYgdQVnsnm2fyvBqnBvHkqUhY69Mv2vXx17
         VwBZe8sjW2cfYfYj/xOPAxYymVz2APFy+RFub3mEDh1LyDLhVBQmhwBYDb/yCIaQlv/2
         TPjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cwYWD5ny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si1572921qvr.61.2020.01.10.09.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:59:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cwYWD5ny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipyZT-00059I-MI
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyD5-00086N-OM
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipyD4-00017s-JU
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:36:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51140
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipyD4-00014S-D5
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qRvnKikU/zZW4H4BQbW8b5TjzE8O1lK0e+sh7nSqVM=;
 b=cwYWD5nygWlETyxS7QdZiKBeZ/G0XiAj73KLzN5RyxzAdL2arPnR33f/nq31rKoDpmvSl0
 RkbN2wD3qsW1Fzv37Xci/8VRwb9ulNY4iCPSyiHR904MXjH12WpmG6y7EDO2Rz3hgzpU+Y
 +x6dGF7ilKmcrJOO2HOuZv0chXwcZqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-nm_WpXYhM7-VA3mzNGbqJA-1; Fri, 10 Jan 2020 12:36:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EB25593A1;
 Fri, 10 Jan 2020 17:36:27 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DAA919C4F;
 Fri, 10 Jan 2020 17:36:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] apic: Use 32bit APIC ID for migration instance ID
Date: Fri, 10 Jan 2020 18:32:15 +0100
Message-Id: <20200110173215.3865-29-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: nm_WpXYhM7-VA3mzNGbqJA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BcdSmR+viYHV

From: Peter Xu <peterx@redhat.com>

Migration is silently broken now with x2apic config like this:

     -smp 200,maxcpus=3D288,sockets=3D2,cores=3D72,threads=3D2 \
     -device intel-iommu,intremap=3Don,eim=3Don

After migration, the guest kernel could hang at anything, due to
x2apic bit not migrated correctly in IA32_APIC_BASE on some vcpus, so
any operations related to x2apic could be broken then (e.g., RDMSR on
x2apic MSRs could fail because KVM would think that the vcpu hasn't
enabled x2apic at all).

The issue is that the x2apic bit was never applied correctly for vcpus
whose ID > 255 when migrate completes, and that's because when we
migrate APIC we use the APICCommonState.id as instance ID of the
migration stream, while that's too short for x2apic.

Let's use the newly introduced initial_apic_id for that.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/intc/apic_common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 54b8731fca..b5dbeb6206 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -268,7 +268,10 @@ static void apic_common_realize(DeviceState *dev, Erro=
r **errp)
     APICCommonState *s =3D APIC_COMMON(dev);
     APICCommonClass *info;
     static DeviceState *vapic;
-    uint32_t instance_id =3D s->id;
+    uint32_t instance_id =3D s->initial_apic_id;
+
+    /* Normally initial APIC ID should be no more than hundreds */
+    assert(instance_id !=3D VMSTATE_INSTANCE_ID_ANY);
=20
     info =3D APIC_COMMON_GET_CLASS(s);
     info->realize(dev, errp);
--=20
2.24.1

