Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1331459lfp;
        Tue, 21 Jan 2020 03:06:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzEadyG9wBXqVk1zsOL31L5UoTQY+utQvx8ZLoa/7Za+IAtXc4XBoX6QB/E2lHR3gO1zUK
X-Received: by 2002:a17:906:90c3:: with SMTP id v3mr3879470ejw.30.1579604819372;
        Tue, 21 Jan 2020 03:06:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579604819; cv=none;
        d=google.com; s=arc-20160816;
        b=SgfQUDeVnl1sMwZ+mz7kUb9jHBsU4CLO++Kt1TN9ZVtao/f2p+8Pvvef8/sztVX7no
         nh1Vk+cQftLaq+3WwQLSasT74aBoq2Ne3M55XgIUBdfUixzeX9szupViu4BKvQwhVug/
         YeqJBGVqlVgfsesC2M2mmoPjCMZ88oyP5RmV4n9Bd9qQh7Z7+kpfnZPndgV7/hm9npPJ
         UMwCDUzxrtQv7z+ilTFh8CeOYM+O0Gb2cgKZ7oxiSljpzEOnmZV7HX6zNCOg/Ohvjkt3
         lDmFF6UlewNZMaKq2VOO6IGZtzfxV6jq/onEK8enovfYnQ47d9/+3nEAoIxkc6S7epcw
         zdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ugM9iIFSDeSVcz1r2AmzyjCdAlqSyh7orSAZpE2fwRQ=;
        b=XX9XCUFr2HkVU8BTydMted+MyfdsEh2AsTr74p+4Uj7H8Dq85aPk7pbYAReKmVAd2q
         1Uxm2MdShvi2PFV+snH+R2b6MWp0X9jLi+KFAdjkvk8gFC0J8SS7W7fxrRBYSbDFTBpi
         FpA11EmIWfSalgFX3c15TygeeSMlNJc1qIRIwGMIOzgoCFwfQLK61DILBhN+HIkQf5YD
         AG6VJHCGAof/fwUwUhS0sHetLu7zSFYLpr4ogxXSvMupe8WkQj6cWZmr7KlNhrXX/Mb5
         U50m8h4QpidRgOkgoslH5JoNgShQm+zK4OKH5YEkwhiURgHn30qeicH6kl/qoGrOmuZ1
         ykKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jWYEql/l";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o27si23619425ejc.108.2020.01.21.03.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 03:06:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jWYEql/l";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itrN4-0005DI-5j
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 06:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itrKg-0002rm-Ro
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:04:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itrKd-0002Mn-A4
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:04:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59873
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itrKd-0002ML-4A
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579604666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugM9iIFSDeSVcz1r2AmzyjCdAlqSyh7orSAZpE2fwRQ=;
 b=jWYEql/l1UrYdHo7j+WZrhTbhtMO+3g+Kj1iSSMCVlIGKvttJrXGDPVpXe8Ahmnh12rab1
 dPurqVLPODa5k9fBj41yalcFS9MOK2JCwsux3iOHNNIdsgj2nhl6pbiLYGU8RpP4Fli13e
 qjgcBrO2PVVnkWXACj6Pz74m0bBjyAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-03CrOVL0Nxaaees-369O2Q-1; Tue, 21 Jan 2020 06:04:25 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E55848010DE;
 Tue, 21 Jan 2020 11:04:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 916F483860;
 Tue, 21 Jan 2020 11:04:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/10] hw/ppc/spapr_rtas: Access MachineState via
 SpaprMachineState argument
Date: Tue, 21 Jan 2020 12:03:41 +0100
Message-Id: <20200121110349.25842-3-philmd@redhat.com>
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 03CrOVL0Nxaaees-369O2Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5902fBl9iAHt

We received a SpaprMachineState argument. Since SpaprMachineState
inherits of MachineState, use it instead of calling qdev_get_machine.

Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/spapr_rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index e88bb1930e..6f06e9d7fe 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -267,7 +267,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *c=
pu,
                                           uint32_t nret, target_ulong rets=
)
 {
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
-    MachineState *ms =3D MACHINE(qdev_get_machine());
+    MachineState *ms =3D MACHINE(spapr);
     unsigned int max_cpus =3D ms->smp.max_cpus;
     target_ulong parameter =3D rtas_ld(args, 0);
     target_ulong buffer =3D rtas_ld(args, 1);
--=20
2.21.1

