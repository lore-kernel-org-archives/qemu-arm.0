Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp743612wro;
        Thu, 25 Oct 2018 07:02:38 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e2vWImw8EL5Ztdxnef++KGVLHBX10S3hnrYyE70EzwkZWVLNM8NMCwM+GboqUU+hC4RVVd
X-Received: by 2002:ac8:2a79:: with SMTP id l54-v6mr1566591qtl.95.1540476158061;
        Thu, 25 Oct 2018 07:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540476158; cv=none;
        d=google.com; s=arc-20160816;
        b=sTooPgUNlYjqO6C8ucYp6+yOxolEHRY9mWP37wZj0X8lMIrXhTqzjeD/sN8ACQWedz
         TePYSnnKYzBSpDlxodvqyNIaZFvIULuUET50XB7rOAmIBqNoMcDLMDTf4KPgPRmv8lzR
         b1MpGVhn5bdwGqeC08jM89jr3kZdg3FaCSczSWjBdkIpsuqCsFc10pTbdTQVD35Q5SJM
         2VKfks6krG+QtiTwkpzjKXP3tpg0qgmCPdN79KTjtVFzm+wMrvi5DPxR/GOHHt4B7au+
         18snw/rfNaqO0lDu2Wgi5ffo3YszidAtmRAw+Zx+HuxsqAA3JszRcP7ZWv1fiyBOlO4x
         ps6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=8roFk/BMZvaGQTyq4soTwTRwjtIDbDiy8olIZO4tmvU=;
        b=FxMl8hYuiEXfi54qxkISzqXIdEFaRQbnuO5fa6EDA/pr9JvNYIgmWC+FdUGQCRWC+Z
         tjXHgsUXW21GsqNI8hwyMnNflibi9xAY/fC0wUbLU5TWB5mhwUMhFZTvsCMqW1pmCBue
         TDDCXn9jDfqxbEvw6K4GNzHVzkReuBPsKO4fryTuND/tsR3crzSTFOifQX/Nh5/YeIwg
         rq8dJQ+gnZkUSiJf4toZo6ZoVvvNGfIsrzbIKOdh5FvnkEW+UqV3rlZE5FrcDxPnornz
         gWzGv9N37JnSMIBKG/KJx6fWR2VSJKC1ERLVgDdMakqi5lGtcs44kJEX/0BJlcus7U6N
         JyAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e81-v6si6679731qkj.146.2018.10.25.07.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 07:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFgDd-0002sY-J1
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 10:02:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfo6-0003Qk-6c
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:36:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfo2-0000Ro-Um
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:36:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfnp-0000Ev-Qn; Thu, 25 Oct 2018 09:35:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36EF530821F6;
	Thu, 25 Oct 2018 13:35:54 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 210CA605E2;
	Thu, 25 Oct 2018 13:35:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:39 -0300
Message-Id: <20181025133301.16578-22-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 25 Oct 2018 13:35:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 21/43] memory-device: use memory device
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
X-TUID: 5Q9j9t719jnY

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

