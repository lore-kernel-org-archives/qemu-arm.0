Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp397063ejb;
        Thu, 1 Jun 2023 05:21:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55J6+ko37DsPeqSx+WVjdl3v8JuokhmFCk6obQYy86pmqz75Hxkm7s+8AhL9lM9znacrM8
X-Received: by 2002:a05:600c:214e:b0:3f6:c7b:d3b7 with SMTP id v14-20020a05600c214e00b003f60c7bd3b7mr1954901wml.37.1685622101549;
        Thu, 01 Jun 2023 05:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685622101; cv=none;
        d=google.com; s=arc-20160816;
        b=siafonMs4kQu5IM7BEUpTX6lZffWjWp2rAn0L/BkpUHnUUW4SRRAu0K3NZyQOU6JGF
         L4kB011Lnv5xCaK+zuMOScdgiKZuqsTVKiJouv6Lg0Lr7ofDCz9fEnKR3DysS1rQZlYE
         Sy91SHgsn25Ftm2Wh0ms2TUTfmdtK0+3cbLxDCZVHZsZ6KEwyLosFRU5G92p0Q+tcg0I
         w/zUzsWphgt1amJ5zlOR5MbVQrvFTd4/FvuNBH7x1twYzxZ8QAuchDp/TeuBYptB0hCP
         duwqabmgdICA8qeqb6vuxKSuJdoJCoUH9Ulz9rWuzRNxYIPzE9KBaUGfjsk+nNlDcUKT
         86yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yehrE93M3yAQr44seHHUNRYFwQ0vHkBDtc47PxgT0+w=;
        b=lLiF0JvJJfmrjbYgnb/9mBb49pXTK0YOt+wx9ESIW+SK3AbfnysMw+/J7h8hAKyhtR
         NGuXqxywqMsZ/zWvtvpiOlwC0rPNuzC8GX9cmTFVL35i8tzEqXMBMcXOurkb49wjzLl5
         1rSZDk/G4Y4XpEGT9VB3hiJbV95HF0XFWUcsg2Uuw3aK+3NfLbU1e5FwDVTFuJLLE7Xg
         ExDz8yq5KwWAc1QbXM7OSZHnP87jRRgeWPSLtCrbndgoNI/gA7ICCkXesih5nC2tKqF1
         AUZ1kuZGbFw18FHpl0ERGr51jzWqUULjxE9Nw9HTXEKvGCt1LZaW2dnI3Sr8UFjzgPcy
         8UXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATYiTvfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22-20020a7bcc96000000b003f4fb6a4407si831358wma.55.2023.06.01.05.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 05:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATYiTvfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4hFM-0003ai-3r; Thu, 01 Jun 2023 08:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCu-0000fz-GS
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCs-0006Sk-2A
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685621705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yehrE93M3yAQr44seHHUNRYFwQ0vHkBDtc47PxgT0+w=;
 b=ATYiTvfL9QhTw5qulacfYjU9ZPqYLlv53tAYS2Pv2vrw4rSscaiT/C5iMmGjVDzlsZfHlA
 razECgNQuAVC9Pjq3QaEfdGZlOMNNqibgvObmjQDP/gc3Rv5qEjseoH/ny/Dnz4riA+6J7
 nvFrzLrxyiJwixYdF8DOs/DfRs0grwc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-ToAwSEtsN6OCPyKGnk5bnA-1; Thu, 01 Jun 2023 08:15:01 -0400
X-MC-Unique: ToAwSEtsN6OCPyKGnk5bnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D17871C02D31;
 Thu,  1 Jun 2023 12:15:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.8.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7152166B25;
 Thu,  1 Jun 2023 12:14:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 06/10] hw/i386/pc: Use machine_memory_devices_init()
Date: Thu,  1 Jun 2023 14:14:43 +0200
Message-Id: <20230601121447.272487-8-david@redhat.com>
In-Reply-To: <20230601121447.272487-1-david@redhat.com>
References: <20230601121447.272487-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yBXTkkF2py5s

Let's use our new helper and stop always allocating ms->device_memory.
Once allcoated, we're sure that the size > 0 and that the base was
initialized.

Adjust the code in pc_memory_init() to check for machine->device_memory
instead of pcmc->has_reserved_memory and machine->device_memory->base.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/pc.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index bb62c994fa..3d7f991368 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1039,13 +1039,11 @@ void pc_memory_init(PCMachineState *pcms,
         exit(EXIT_FAILURE);
     }
 
-    /* always allocate the device memory information */
-    machine->device_memory = g_malloc0(sizeof(*machine->device_memory));
-
     /* initialize device memory address space */
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
         ram_addr_t device_mem_size;
+        hwaddr device_mem_base;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -1060,19 +1058,14 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
-        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
+        pc_get_device_memory_range(pcms, &device_mem_base, &device_mem_size);
 
-        if ((machine->device_memory->base + device_mem_size) <
-            device_mem_size) {
+        if (device_mem_base + device_mem_size < device_mem_size) {
             error_report("unsupported amount of maximum memory: " RAM_ADDR_FMT,
                          machine->maxram_size);
             exit(EXIT_FAILURE);
         }
-
-        memory_region_init(&machine->device_memory->mr, OBJECT(pcms),
-                           "device-memory", device_mem_size);
-        memory_region_add_subregion(system_memory, machine->device_memory->base,
-                                    &machine->device_memory->mr);
+        machine_memory_devices_init(machine, device_mem_base, device_mem_size);
     }
 
     if (pcms->cxl_devices_state.is_enabled) {
@@ -1120,7 +1113,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     rom_set_fw(fw_cfg);
 
-    if (pcmc->has_reserved_memory && machine->device_memory->base) {
+    if (machine->device_memory) {
         uint64_t *val = g_malloc(sizeof(*val));
         PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
         uint64_t res_mem_end = machine->device_memory->base;
-- 
2.40.1

