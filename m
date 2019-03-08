Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7809842wrx;
        Thu, 7 Mar 2019 17:38:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6oNotbB4/I183V0qxSfTQ5oD/s3zSCbLhPvvlsnD92Bs2svc6qvth/5R/NlaVqOXSQfJe
X-Received: by 2002:a5b:447:: with SMTP id s7mr13479144ybp.168.1552009134683;
        Thu, 07 Mar 2019 17:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009134; cv=none;
        d=google.com; s=arc-20160816;
        b=zRUQHgYLFkgSB7Tt2AVMOo/AZihsz7MPUADJ7nQ+OMzgabotJJKW87imytlzYubr+5
         N86njAoPv0v1RmhiI8yJ+TXjkFOIaygFg6Sm/GEIDNeBLnH0V3f6N+P/KsZFuQKM95a3
         pV5PSGXZVetJRK4gNC/rPyXDdS9peLr0jaosxBw4D91x7JSWoK/zSLnbx1ZL62sHG+w4
         fv+esDDe9hKvve/sfr1KSULWctpvVedPpmcFGKm837yYEfTSZiTgECppSkX9RKWcT7j0
         ITNHOYFmDkt+4NQz//N8g8aUnIRLZAVY54zF4RdLwC/PGmUOVsvQGY/t484yX+ETJaON
         lWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=BnY0cVvkLRySOmxqb2+TLrNitc0rJH4FzayEv8pPOPg=;
        b=XPcIVQuUgUpJJvDMUxSU/oWIvVNM8VG6SNU9+WLsOJdZC1aQpwQkniDMVMO3giU4Ci
         QpWLrXhMKPPgDEm9ihZ1dba2WNYdB7jaP779FcrFh3tEuDBjAe5M68A+kAqmbjVvUAa7
         Q9s4ARBiKdWkmLjcJTb7DQKg1yvlSMpW4oC7D6Se0MhDM2p0dtQpZV26q1neFFlsCXhq
         gAMfyqGvnrDY/TCzvdMLkmO69Xg6TZlItJx2aWazAYjei3v/rDOMeaVx5JYF74wMQ3XS
         YQwAPnEQU37Ya1crTGDKkq+Kvcuts6k3T87RWk9r2zKRINZ9BKs25b9z+5fI9dKwLz9p
         d/+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j126si741536ywe.347.2019.03.07.17.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:38:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24TO-0006Uo-4n
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Ox-00034W-1Y
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:34:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Ov-0001gW-4U
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:34:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Or-0001Z9-7k; Thu, 07 Mar 2019 20:34:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4F9C3082E51;
	Fri,  8 Mar 2019 01:34:10 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A27DC60BE5;
	Fri,  8 Mar 2019 01:33:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:13 +0100
Message-Id: <20190308013222.12524-10-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 08 Mar 2019 01:34:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 09/18] hw/nvram/fw_cfg: Free file_slots in
 common_unrealize()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n6RcDuto01Yv

Called by fw_cfg_common_realize(), fw_cfg_file_slots_allocate()
allocates various buffers.
Free them in fw_cfg_common_unrealize().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index ca58d279a4..b73a591eff 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -971,6 +971,10 @@ static void fw_cfg_common_unrealize(DeviceState *dev=
, Error **errp)
     FWCfgState *s =3D FW_CFG(dev);
=20
     g_free(s->files);
+
+    g_free(s->entries[0]);
+    g_free(s->entries[1]);
+    g_free(s->entry_order);
 }
=20
 FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
--=20
2.20.1

