Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1016022ejf;
        Sun, 14 Aug 2022 23:33:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6rC11MycEy+Okx5qUtWjyGDXJwGB4KgWxulinQMgAZBaUuCGWN5N5EAy2mhc9BlrJSeyfb
X-Received: by 2002:a05:620a:f89:b0:6ae:d418:f478 with SMTP id b9-20020a05620a0f8900b006aed418f478mr10172822qkn.344.1660545237360;
        Sun, 14 Aug 2022 23:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660545237; cv=none;
        d=google.com; s=arc-20160816;
        b=cJbBB9uQvaSk8lBY4FTT4inaWUXGWeXREh0g9N8hZ/+B0JGXQW4yZr+fLpt6YDWGJs
         1kvrsAoHtcxsHK2X3n6E8dBdNN5nldLccsaOuW4M01D5eKbBXxfHFKuksfoyNZVvelUR
         0dZ5sYiaXb9D+1RrE41jnl/TVOYyzF5x92hvbaq/LQU0VE/zeNVUt/oJDKHvmWisiTD0
         Tf+jaml1vfkzzhAwhL64N6MiYb4/ZXM0JIEG3sFtmELZr/RqYaFsAFqixydTo8YgYZ1A
         i/4ujhkmnwwt5s3Rh2JyKCIVeV3LYzId+rf+oy/4zcMSKOar3cKfUUtT6CttW0aUf076
         th3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pwnd7e8QXID66LzBd8J+loW/aJ3/AJ4BEQX9bXg+q4A=;
        b=YlLt0GnT8FBsnlZ+Q2eI8xjQqnOIHrEtkQ8X7RQXkPG9k9pzWbSvtKniy2AyD8EGSe
         bFRUVydJxn/BDXf31pZY9dcceb/j7r7zB1ij/9NQjePPl7BNaXbJQQS8MWW6qM+t3A9B
         DGsiyLTi/YZPEOfH6EOiYCGLNhFcauuOgiSC7OA/03c0KW2qEj5qjgeja83e03MqlFak
         lcssMrzTFLFZ6p8UgQR1oK1EMzWCmyQZQVWjpemIkkLFFIeLx+JIXNnnuC2DcjlJSjos
         Y1iEYowjNdmZ28cI8GU4Xui2CdI5XbYAQ3+Q7xgNL7FLHlKNEF6ipBOHb3AXpgRZshEN
         r6pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dvAVi6/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15-20020a37ac0f000000b006b8baa517c6si3859073qkm.260.2022.08.14.23.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Aug 2022 23:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dvAVi6/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNTfg-0001ot-SG
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 02:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcc-0000tv-1S
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcS-0000U1-O1
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660545033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwnd7e8QXID66LzBd8J+loW/aJ3/AJ4BEQX9bXg+q4A=;
 b=dvAVi6/WoFK5nIfXki7ABD2T+/ndnYATLyGckjSBP6ddVig9MFLVpg0bJWRYqY+QsT4iQS
 glSQKYftUOLdV6O9W3HootQNMeL4htLmLY4/O8ARsWCxS8+jSGtag3zWDJGX7Uc+ffY7b6
 CF4iPCWTKVyLQATM7NNjzYjrwdRuiWU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-gVxPYvISNeyk7gweXIHdaQ-1; Mon, 15 Aug 2022 02:30:28 -0400
X-MC-Unique: gVxPYvISNeyk7gweXIHdaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCAC01C05EB2;
 Mon, 15 Aug 2022 06:30:27 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 975D82026D64;
 Mon, 15 Aug 2022 06:30:24 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v2 2/4] hw/arm/virt: Introduce variable region_base in
 virt_set_memmap()
Date: Mon, 15 Aug 2022 14:29:56 +0800
Message-Id: <20220815062958.100366-3-gshan@redhat.com>
In-Reply-To: <20220815062958.100366-1-gshan@redhat.com>
References: <20220815062958.100366-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IqNrMwXVtrt4

This introduces variable 'region_base' for the base address of
the specific high memory region. It's the preparatory to improve
the address assignment for high memory region in next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f8e9f3e205..582a8960fc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1744,11 +1744,11 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     vms->highest_gpa = memtop - 1;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        hwaddr region_base = ROUND_UP(base, extended_memmap[i].size);
         hwaddr region_size = extended_memmap[i].size;
         bool fits;
 
-        base = ROUND_UP(base, region_size);
-        vms->memmap[i].base = base;
+        vms->memmap[i].base = region_base;
         vms->memmap[i].size = region_size;
 
         /*
@@ -1757,9 +1757,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + region_size) <= BIT_ULL(pa_bits);
+        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + region_size - 1;
+            vms->highest_gpa = region_base + region_size - 1;
         }
 
         switch (i) {
@@ -1774,7 +1774,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
             break;
         }
 
-        base += region_size;
+        base = region_base + region_size;
     }
 
     if (device_memory_size > 0) {
-- 
2.23.0

