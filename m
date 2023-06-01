Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp394505ejb;
        Thu, 1 Jun 2023 05:18:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MXBzdPZkos98G+Wp5oPUYxAkbfPuN0kRTyAmsmWdgFFyD1zV/nqoSGlKsAh2zcxo8L52E
X-Received: by 2002:a05:6214:21ab:b0:625:a982:857 with SMTP id t11-20020a05621421ab00b00625a9820857mr8619960qvc.50.1685621894431;
        Thu, 01 Jun 2023 05:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685621894; cv=none;
        d=google.com; s=arc-20160816;
        b=yEWwvvdQDEf+qgzllUAob113KUgDqlHdaU67II9sEClPjhE7O4I2yvgPnD6zYkOROz
         1PzJuxY1P2gXVl9rC1j7HBCBirFGbMC7NnDWQD17bEwm/PtJRAi1DEX1Ve1xnIqvnZer
         32bV3bMGNmm4JnL/24qdSgjPPmuDBm5AuOmaU4xWTIKVRuhxzPh0LvHHEOGME7dhBESY
         X3e8hCL8AalfOmoAsPqgx2VeElY3tfaCkju52n7VYqacrHFMLOdsfPHMXqY9nCv1Qlr1
         EI68/aXT70lgHPyPnJ3Rzmyd1I1RLxJjPqW9YG9SWn/wTLFeddjY74MOcS/vcqud3m7S
         pW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=01a1Sd5jMsqlgoeyZ4FfzaCz9q752Xj4qUaXbI+la08=;
        b=AoDNrop64LBbVOAbixz926sAS7cFe90+g+1mMjTrQitCTtho0BFeAqw6xI9QZcT0g3
         3oUb1+oZ4ASWzQj07WbEpnAgI9fsFzMaXYtC0B1MQteJaAFoA7vw6BvXqK8rQ2872g/H
         oKLxmBU+xrylVGWKLrn5JhWEaJDg3neSGopuwaF0EFC+4fdW9n7FLmtSAh98JZptFqWT
         46IlG3rURciIQicGWmeAbgNr1nLXWAUPMONV913BWhP9N4jAVCh2rljGsMcggNp25nqP
         HjJwSnP7zFrdKyayXGY1MHtoTmz8q7GlpTS+5lBTj8jcnt/fh+BkCDTGKK7wiKbbUnkh
         LVRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HB2r0rFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw8-20020a0562140f2800b006261a580d92si7075375qvb.79.2023.06.01.05.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 05:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HB2r0rFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4hFE-0003CE-1S; Thu, 01 Jun 2023 08:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCv-0000iz-DM
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCs-0006T3-Tc
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685621706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01a1Sd5jMsqlgoeyZ4FfzaCz9q752Xj4qUaXbI+la08=;
 b=HB2r0rFT7UZ6rdVh5fZ4Az+J/eAn1GhmFpNLLC7wXe/wUAck38o0vSc4ONRGBnJDdP+s9i
 qsgJ2UiG976m/x1srvQWmcJNaRE1hY1VYMZj+gsTAznmB8xNZSuaAI4EfC/oMrNHrmwdkW
 9WjEa7pFqnk/Yd3nPL1+70u3k0BsWpA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-uzu-Ehg_NgCoanpMPAuJxQ-1; Thu, 01 Jun 2023 08:15:03 -0400
X-MC-Unique: uzu-Ehg_NgCoanpMPAuJxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 970BB811E86;
 Thu,  1 Jun 2023 12:15:02 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.8.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1087B2166B25;
 Thu,  1 Jun 2023 12:15:00 +0000 (UTC)
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
Subject: [PATCH v3 07/10] hw/i386/acpi-build: Rely on machine->device_memory
 when building SRAT
Date: Thu,  1 Jun 2023 14:14:44 +0200
Message-Id: <20230601121447.272487-9-david@redhat.com>
In-Reply-To: <20230601121447.272487-1-david@redhat.com>
References: <20230601121447.272487-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: u42CRrelv5wr

We're already looking at machine->device_memory when calling
build_srat_memory(), so let's simply avoid going via
PC_MACHINE_DEVMEM_REGION_SIZE to get the size and rely on
machine->device_memory directly.

Once machine->device_memory is set, we know that the size > 0. The code now
looks much more similar the hw/arm/virt-acpi-build.c variant.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/acpi-build.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 512162003b..9c74fa17ad 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1950,12 +1950,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
-    PCMachineState *pcms = PC_MACHINE(machine);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     NodeInfo *numa_info = machine->numa_state->nodes;
-    ram_addr_t hotpluggable_address_space_size =
-        object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
-                                NULL);
     AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
@@ -2071,9 +2067,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
-    if (hotpluggable_address_space_size) {
+    if (machine->device_memory) {
         build_srat_memory(table_data, machine->device_memory->base,
-                          hotpluggable_address_space_size, nb_numa_nodes - 1,
+                          memory_region_size(&machine->device_memory->mr),
+                          nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-- 
2.40.1

