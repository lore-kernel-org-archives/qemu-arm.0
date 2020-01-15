Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7056657lff;
        Wed, 15 Jan 2020 07:23:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiuTKLSFChH7Sm+UoLpq90s3Lohma4bUgd3kvP+mboww6DdXKP/5CdBX+v0nPO93+sWOsY
X-Received: by 2002:a37:8e45:: with SMTP id q66mr28169670qkd.129.1579101818132;
        Wed, 15 Jan 2020 07:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101818; cv=none;
        d=google.com; s=arc-20160816;
        b=EmMP2viDIdRL/RS6OZAy8qfQmbJae9IREcC/TveG3Hrm+mMPn74P31MJl+hULDTTwO
         vnNuckdYz32CgI9j7z6iNTk44Rt/Hjawsa5dFYRJEuJxzQPHgSxkv/bTAoc5m0LEUhTP
         DPzlO5tdxJawjJCY7HATCfDRzZf3bvE3XihDwK4bbVSzPsTfPqDO077lS5eA/nhIO4el
         kEze1n9sJBPzmbbJB4NdWw9IGoJx4sOTf2qJbef7da0SrT5VLaVYPsnvXoYbnwANtV5Z
         usXfdHw7gXIG/3gijgajuKZyNEp+S1dzBDYeLs13L1eVy5o97/xEM9OGUdAA/RC1RuGt
         DMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9newHvuNm8DeXxWJUTUvNrq3H8FImYe37gPRJ/mRcgc=;
        b=tWLJ7ZZicjbiOIqXcIwCjXJjOyQYKoo3R/V95UuB5J2SqLUwe/eVAiL+u2qT6i5VD2
         ga7N6AuK4Iqq6xqfnNKgua/BLHOv6Aj8WLbNoyIqyCQwlgxASCXl8Q4J9S8oOxl1e8X2
         BkFwKza53Nxk5jwU+yPblde7oE1kTWmO6DEZdiIvDwg6lTaZX7dxTvIFZO7NIp/411ww
         kMKBFzgodgENy7a7Wu0fkiFr0tF+u1gOG4BryoYfw62NV2FQ9tRveHQ4qtiG/krmNdSH
         VMvY6dsRk10EqH1ugCnbTObk4edIVWF0+pXe/1KZDCJ/nKzq+eVmFej8c5zfr0R+eNIz
         lGkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aB1xvuXK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v58si10158552qtk.84.2020.01.15.07.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:23:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aB1xvuXK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkW9-0000Nj-1K
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkK0-0007bs-W6
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJz-00088Z-Rr
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37899
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJz-000875-NN
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9newHvuNm8DeXxWJUTUvNrq3H8FImYe37gPRJ/mRcgc=;
 b=aB1xvuXKAfiHW1vzHt9nNpd+Mjfa3Yql7tlwZflyVk9vDKJu9f0Z5L2GXmwUCCAabu5LTA
 qvglaTyiiST2or17486KcuEFeDvr8UG1UDreRcZaZ7LbAgAIcdn32nm2b8GJxqi4eF1JcJ
 BwR9zanrwU/CUSPDMUz0G/Ax1M7nMgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-UPJw8DPdOM6L2n3kmHqsug-1; Wed, 15 Jan 2020 10:11:00 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4DF88E7D20;
 Wed, 15 Jan 2020 15:10:58 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D66E6194B2;
 Wed, 15 Jan 2020 15:10:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/86] arm:kzm: drop RAM size fixup
Date: Wed, 15 Jan 2020 16:06:33 +0100
Message-Id: <1579100861-73692-19-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: UPJw8DPdOM6L2n3kmHqsug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WpkIq9hI1Ehy

If user provided non-sense RAM size, board will complain and
continue running with max RAM size supported.
Also RAM is going to be allocated by generic code, so it won't be
possible for board to fix things up for user.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.chubb@nicta.com.au
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/kzm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 1d5ef28..27800c5 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -78,10 +78,10 @@ static void kzm_init(MachineState *machine)
=20
     /* Check the amount of memory is compatible with the SOC */
     if (machine->ram_size > (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE=
)) {
-        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
+        error_report("RAM size " RAM_ADDR_FMT " above max supported, "
                     "reduced to %x", machine->ram_size,
                     FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE);
-        machine->ram_size =3D FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZ=
E;
+        exit(EXIT_FAILURE);
     }
=20
     memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
--=20
2.7.4

