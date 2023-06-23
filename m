Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp124390ejn;
        Fri, 23 Jun 2023 05:46:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4fu+oo8PwbNJ20oAeV4WQIBBPoUQnkG2rSB6hH65up1o/phfRa7B0tfl0y+RAsp0idjA9J
X-Received: by 2002:a05:600c:861a:b0:3fa:77b0:263d with SMTP id ha26-20020a05600c861a00b003fa77b0263dmr3901558wmb.14.1687524415470;
        Fri, 23 Jun 2023 05:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687524415; cv=none;
        d=google.com; s=arc-20160816;
        b=c799OVyBPpqusU+l/X/eA8MO/A81CLpTd5QkeAgvGgdVFgufe9Vnk0dyXavkxIcc0O
         GDwumS44dUNPbqw/T49azlnU9grY1/7nNz575iGQkGaAwA6EFESExhI5kCpIBwcPzhfD
         kwtuBpPxhI+8EroN8bIfEx+tDkmmNf9PQcOwRKAX776RQYbAjaxpdSHYUo+Hpa6DaBJL
         6i7PfppcbM6DHalwaT8ZdXCPS1i2TtfBcOK+yIg088ul15MeLjKQ7EiveSAXl7x9aK2P
         pmETWxJRNCBjsy3uWcVuAg1fyGP0/M8O2kKi6g9EWBmoFqDmDQ+vU4ZElZJ3O5Rv6UOA
         dqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4/VjV4Ehnq9V+Qr7lMovEi6GKY2Z5BCQx1wXui6RiEQ=;
        fh=A9dberkKHvMEIfvnBSMS9eI1/T3F9+D1NPYJ5LXdrO8=;
        b=SrI3EN2QeCQUr/hT56eehz1hjZwLSwzoqK7eTcuKLxLmuEPxOhFiK3gb7SaRK7Ndux
         yndmTTiRl9VsBMTrVlpzzR9nPp2ELowJ1jQy0+k1eiCqBIgqrigpRG3c1El2SL+nn7PY
         omvupVsBIsqjZgKk1a4Z+PpRoZEYwIfU6gCFbZ1ilFXfRrSTVYYj0x0s6o/3rLOARyNW
         uZXlZFiHRfAnbrAvZi3eA3EHZjlc4pc5/JwOEmn/MIIHMmu/Uu6jpLXPPW98Ou4nxMFw
         MjEJhWNfTYbnl4vDRB2hwNeyFybBViBa5HldP7QAD6UrZfB3dBDAqwYjBCY2b4dhASPq
         pA8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QvMC4zpB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020a05600c464f00b003f7eeec8287si1226721wmo.228.2023.06.23.05.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QvMC4zpB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qCgBJ-0001kG-8W; Fri, 23 Jun 2023 08:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgBI-0001jY-2b
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgBG-0000ph-Ae
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687524385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/VjV4Ehnq9V+Qr7lMovEi6GKY2Z5BCQx1wXui6RiEQ=;
 b=QvMC4zpBg0Rst5+ri8ziuEsMbGkm4wchQi9eAXbKmPULOKVRqmKhUKzkzenUdpStT3CC3U
 5NQjeqnZ13dwEB1WFLcTNTe084wyABHqY89s4hwr9bnrxMJUwFb0VUr/uSTdDWgqu2b3ws
 3UXDnCS1yWF0kMq5koPk7nzit52024k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-SymYy_hNNT2dx7TnjxJ0SA-1; Fri, 23 Jun 2023 08:46:21 -0400
X-MC-Unique: SymYy_hNNT2dx7TnjxJ0SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3CC1185A794;
 Fri, 23 Jun 2023 12:46:18 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB8EA1121315;
 Fri, 23 Jun 2023 12:46:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v4 05/10] hw/loongarch/virt: Use machine_memory_devices_init()
Date: Fri, 23 Jun 2023 14:45:48 +0200
Message-Id: <20230623124553.400585-6-david@redhat.com>
In-Reply-To: <20230623124553.400585-1-david@redhat.com>
References: <20230623124553.400585-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XE6vuos8w9og

Let's use our new helper. While at it, use VIRT_HIGHMEM_BASE.

Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/loongarch/virt.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index ca8824b6ef..4a42a8119a 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -863,8 +863,8 @@ static void loongarch_init(MachineState *machine)
 
     /* initialize device memory address space */
     if (machine->ram_size < machine->maxram_size) {
-        machine->device_memory = g_malloc0(sizeof(*machine->device_memory));
         ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        hwaddr device_mem_base;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -879,14 +879,8 @@ static void loongarch_init(MachineState *machine)
             exit(EXIT_FAILURE);
         }
         /* device memory base is the top of high memory address. */
-        machine->device_memory->base = 0x90000000 + highram_size;
-        machine->device_memory->base =
-            ROUND_UP(machine->device_memory->base, 1 * GiB);
-
-        memory_region_init(&machine->device_memory->mr, OBJECT(lams),
-                           "device-memory", device_mem_size);
-        memory_region_add_subregion(address_space_mem, machine->device_memory->base,
-                                    &machine->device_memory->mr);
+        device_mem_base = ROUND_UP(VIRT_HIGHMEM_BASE + highram_size, 1 * GiB);
+        machine_memory_devices_init(machine, device_mem_base, device_mem_size);
     }
 
     /* Add isa io region */
-- 
2.40.1

