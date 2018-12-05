Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9836326wrt;
        Wed, 5 Dec 2018 13:03:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W0WkRfH7S1drZTbUZjP9IHwgDpzbuCh0zhbihM01CBQTfSS2WV5/jXh1R4M5webwnIbjPe
X-Received: by 2002:a37:358d:: with SMTP id c135mr22973387qka.232.1544043805368;
        Wed, 05 Dec 2018 13:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544043805; cv=none;
        d=google.com; s=arc-20160816;
        b=AFhLdGm19tQepZC2ZEYl5klhXWHjvxIgVUWQP5OiTiVBpabsCLl6VGjlql4Ph/4BmO
         C8FgpPjkFlh7rFZPLgQUkRF6CMX7oCZTWKocbmo4cJpCpYuaFOxA8ggAx7TqGMZmq/P1
         PXQB0lScRxwFJ1Iu6WDNcZoxhc9c9akL6KIzUjNKKXoOdW0lWPFJQNwX5FoGYeFUd1dP
         NZ/PAlaDDKBCJbMBfIoQF9bD+9TTy64Yo9WJEhiQ/ORiRuA9fy/xEeuihszMZQwcTOmf
         co6wiceKSlQOTkFIrRm34iMJDsdmBys+sMhae/DJbbN+kou85VLuUPCmr9AZgY4mG3i2
         6RcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=8tmlFAztHoVlk+RCztbB+rAypOYU40iJYWv9V7Q8SVM=;
        b=ZQu32PzBRJ8nau82McNb5VIQ4s0R4UrkSc4sCxXhi+4LQ3DrwF07t0b+ZWOvbKmwm8
         f+zcjW0yF784f0dDugbWtjzOG+nINlvYPrOvtrsD1HQTZqfBL7KRA7yy0k08fIyIfOml
         EFNw5RPFr2h5taRlV6k/XuDXu0TxwkaBMyU31lzZWbZLM84cd4oYmfTRKBoJInbHl9Nl
         NTZAqZ9aVZrsJotCdSLXViIFzVOf0NxDXLXbd41N9evUMZv6banEfGbIU5IGe/bJ+xDT
         P/3Y9ikYEBeBH07HydywUT7e9zMDlU2yl7MskrBZqDIRLtRuuZU4Wn7fIXnCe0JM0+aX
         BWJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g14si12359397qti.392.2018.12.05.13.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 13:03:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUeKK-0003V2-Qj
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 16:03:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeGS-0008Jv-7a
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 15:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeGN-0003ap-MF
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 15:59:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:24211)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUeGJ-0003Ft-Up; Wed, 05 Dec 2018 15:59:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C25C372D8A;
	Wed,  5 Dec 2018 20:59:11 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41F415C548;
	Wed,  5 Dec 2018 20:59:11 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Dec 2018 18:58:27 -0200
Message-Id: <20181205205827.19387-6-ehabkost@redhat.com>
In-Reply-To: <20181205205827.19387-1-ehabkost@redhat.com>
References: <20181205205827.19387-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 05 Dec 2018 20:59:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.0 5/5] pc: Use default_machine_opts to
 set suppress_vmdesc
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9YhajsbF3RWe

Instead of setting suppress_vmdesc at instance_init time, set
default_machine_opts on pc_i440fx_2_2_machine_options() to
implement equivalent behavior.

This will let us eliminate the need for pc_compat_*() functions
for PC machine-types.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/i386/pc_piix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index cfaa83ee2f..c1f6f3dfda 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -320,7 +320,6 @@ static void pc_compat_2_3(MachineState *machine)
 static void pc_compat_2_2(MachineState *machine)
 {
     pc_compat_2_3(machine);
-    machine->suppress_vmdesc = true;
 }
 
 static void pc_compat_2_1(MachineState *machine)
@@ -571,6 +570,7 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_2_3_machine_options(m);
     m->hw_version = "2.2.0";
+    m->default_machine_opts = "firmware=bios-256k.bin,suppress-vmdesc=on";
     SET_MACHINE_COMPAT(m, PC_COMPAT_2_2);
     pcmc->rsdp_in_ram = false;
 }
-- 
2.18.0.rc1.1.g3f1ff2140

