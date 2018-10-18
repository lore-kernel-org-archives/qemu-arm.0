Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2823930wrt;
        Thu, 18 Oct 2018 13:24:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62vgWrWg17vGt9YSHNBFO3I+IBjFQtw3Vp6cA4z0eivLpFzfe4tWBLpftZnZ5NjzJx0/+g2
X-Received: by 2002:ac8:765a:: with SMTP id i26-v6mr30266973qtr.250.1539894285664;
        Thu, 18 Oct 2018 13:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894285; cv=none;
        d=google.com; s=arc-20160816;
        b=y958/mNoE3dlyBh2tCwaBc08tJftqAUpwNrcmn11+ZvAlOcgxDV0TE2J8M3nKTDCng
         6/BiS2q7gbKXaRbchSGEvvJ1nhXuLCjf/vW6zMMYetG+YHHajXKl8mIrM11r3hsHm1SM
         7XMzSWgmqdQZPHT7Q2vfl5oQGuHdP3XfcF+oH68pwsy5Ajt3tB2M1AkdJOGiNkTcgJu+
         Cxw2X57WJ+nEswOS4vREnlis2H6x+g9gfVZUg2Drx7MryLT/WiJ0EB6bAMiHimNb9zva
         B1qaVm33dz2S/QzuvN09tPlcM79rRVmLF56xUA9R3i7VCwxk8UPSKyrxkOkPgkW42z7L
         aJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=8roFk/BMZvaGQTyq4soTwTRwjtIDbDiy8olIZO4tmvU=;
        b=Fj1lQkDReG2b8LrSV2vVVpvV0FRSiz9e1GbYqVpLsB2M4xnx82HhVAbsIUDhn9jT3w
         hi7bcTghsowQIzGSf0XsFbKzR9y56ZUoO5K8zwIZJbd9IH9kGJTKe8DdTn/xRQvHuddp
         pcJkBFrIJtNsAOUELcPsciXPLlcG9FopkLhx1PWWPDHukAdFh2xALlF45yWyQxM2IXgL
         yk9rMST2bZ55qHjIdHWKreY1hHAMCN9JhFtXi1Jzytnx5FsKrP4UnVjJofRcc1DDWRUI
         DMRmx+VUn9miaMD/0OxTnrSxtwPUL2x0wBmA9k+ozfD5L/o8HshAidXmcGYGS32A1onJ
         PXjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i22si15827394qvg.194.2018.10.18.13.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEqb-0008CH-4O
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:24:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZw-0001Hi-Nh
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZt-0002AW-KR
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:07:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEZr-00029c-Eu; Thu, 18 Oct 2018 16:07:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83A03307D943;
	Thu, 18 Oct 2018 20:07:26 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5888163BBE;
	Thu, 18 Oct 2018 20:07:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:59 -0300
Message-Id: <20181018200422.4358-23-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 18 Oct 2018 20:07:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 22/45] memory-device: use memory device
 terminology in error messages
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, David Hildenbrand <david@redhat.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ue2iKzxhjUlP

From: David Hildenbrand <david@redhat.com>

While we rephrased most error messages, we missed these.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-6-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mem/memory-device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 0624184c40..87369ef2e1 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -87,7 +87,7 @@ static void memory_device_check_addable(MachineState *ms, uint64_t size,
     memory_device_used_region_size(OBJECT(ms), &used_region_size);
     if (used_region_size + size > ms->maxram_size - ms->ram_size) {
         error_setg(errp, "not enough space, currently 0x%" PRIx64
-                   " in use of total hot pluggable 0x" RAM_ADDR_FMT,
+                   " in use of total space for memory devices 0x" RAM_ADDR_FMT,
                    used_region_size, ms->maxram_size - ms->ram_size);
         return;
     }
@@ -145,12 +145,12 @@ uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
     if (hint) {
         new_addr = *hint;
         if (new_addr < address_space_start) {
-            error_setg(errp, "can't add memory [0x%" PRIx64 ":0x%" PRIx64
+            error_setg(errp, "can't add memory device [0x%" PRIx64 ":0x%" PRIx64
                        "] before 0x%" PRIx64, new_addr, size,
                        address_space_start);
             return 0;
         } else if ((new_addr + size) > address_space_end) {
-            error_setg(errp, "can't add memory [0x%" PRIx64 ":0x%" PRIx64
+            error_setg(errp, "can't add memory device [0x%" PRIx64 ":0x%" PRIx64
                        "] beyond 0x%" PRIx64, new_addr, size,
                        address_space_end);
             return 0;
-- 
2.18.0.rc1.1.g3f1ff2140

