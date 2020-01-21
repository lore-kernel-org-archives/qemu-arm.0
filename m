Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1329156lfp;
        Tue, 21 Jan 2020 03:04:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQofE+fy4oPv3hZ7kF0dS/9uMg74DSnH//VTCoFzzDJoupNSGy/WItOspCfLHIlN2hkgoA
X-Received: by 2002:a05:6402:c08:: with SMTP id co8mr3381517edb.197.1579604696685;
        Tue, 21 Jan 2020 03:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579604696; cv=none;
        d=google.com; s=arc-20160816;
        b=siqKIaFl91JTw4tC7n2R2T2B4nKY8SL/YMy73Df8II/fd/tQ1nz8tZUejbYyMUDLUv
         jOJQ/kBqr7XC6zYe/6m/W903anQLanaaawwsAF1O4kpNUSOnyKDpHgh9qMhaVM7OspFL
         7me0efevN9EbdIymRclamRk1U51p1gfm8sKhTS00bF/KfKQfUkTC3eVEapuTUokntNBk
         d+vHqEs6Kxo3/v//zG1RsLF2C96HIZ106YITCVHNGvOuxtWPnejs8LUnO8akjK0qZp1T
         Wh00GHJ6+lnTGbKAxicaOmrrBEc0KNMcsXXtOHqSwNHHubZsFMCoEjBuIt1foYObkuK9
         t0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=M9YLZWFuUPGqf31v4qZl1Pp9bDL94NV9XAqJHkBYaeI=;
        b=GESZGvRv1KB2A2S7MERTNsiOjg2vPge51UEKK+GsyyH3yHQGSygch5T3PYS6u14uy7
         D5HbiMJyOBnt685bpR0Gc7l6E1GngbOmsms/JzSF3f1hWOqvEqJOC4mVh34trolHYleJ
         LIZdrvPbWIf5TzKyzdEmeOBpRHzEG6Y/IoZOjdEgMwivN/LveO5UTuyNvYENBMBlj5/a
         wY1M5xvp+DOSsHtcOcg7HJOg7LmQIjJhCV5SkmsX4d7ysRv4jFc2Gaw3K5u31hi1ZO34
         3BLiOcQjaAd2I3Ta29U3CPzNWKELiz1079zRIEh8F5bbItTrcC9AQ0mYyRsCzncGcRw6
         qbeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="AbyyGOv/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si24766130ejb.416.2020.01.21.03.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 03:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="AbyyGOv/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itrL3-00031s-VH
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 06:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itrKZ-0002i5-ET
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 06:04:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itrKW-0002HB-7w
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 06:04:23 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22692
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itrKW-0002GJ-4V
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 06:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579604659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9YLZWFuUPGqf31v4qZl1Pp9bDL94NV9XAqJHkBYaeI=;
 b=AbyyGOv/hSPjJphB9/XKPAa6XxYP68qoqlNnRjpgKVGs2Fbq0iGi9axaRzdksR7rypfZgg
 xHdhc+iaXPoAqQPs/4ajTEvh8ffolPyZuhrCu+DPdT2LTFvTVgFtSkYH+Xd9MRQkZcfSpW
 eVdcFOAKGU0u61f3FWiAznyCyY46uOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-LMl9Q4MAPJu1MdrGURLk5g-1; Tue, 21 Jan 2020 06:04:12 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0497E107ACC7;
 Tue, 21 Jan 2020 11:04:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC2583860;
 Tue, 21 Jan 2020 11:04:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] hw/ppc/spapr_rtas: Use local MachineState variable
Date: Tue, 21 Jan 2020 12:03:40 +0100
Message-Id: <20200121110349.25842-2-philmd@redhat.com>
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: LMl9Q4MAPJu1MdrGURLk5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OamyJWAIXp9b

Since we have the MachineState already available locally,
use it instead of the global current_machine.

Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/spapr_rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8d8d8cdfcb..e88bb1930e 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -281,7 +281,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *c=
pu,
                                           "DesProcs=3D%d,"
                                           "MaxPlatProcs=3D%d",
                                           max_cpus,
-                                          current_machine->ram_size / MiB,
+                                          ms->ram_size / MiB,
                                           ms->smp.cpus,
                                           max_cpus);
         if (pcc->n_host_threads > 0) {
--=20
2.21.1

