Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2107767ejb;
        Tue, 30 May 2023 04:39:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5P1gju6lr9cfnOOkICrNu+Dd19kN2ZRpGBu4ng9MmruZTwpdfo6EGGmQ2WOuPJ65rCnYDh
X-Received: by 2002:a05:620a:2cc3:b0:75b:23a1:47d with SMTP id tc3-20020a05620a2cc300b0075b23a1047dmr1307848qkn.67.1685446779310;
        Tue, 30 May 2023 04:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685446779; cv=none;
        d=google.com; s=arc-20160816;
        b=ud6mRuj4zGgxq/zavmtdNNkqus0GuJ0fEGlBu1OEETjuwm9H9YqqGJXbf/RNv7X4Lm
         +cSuLKnveLvEz8vJzLPxUNu4NrwtPYU4lr6LoSDYJTEyoH6Tp/p9VWxfOqFL470za5ve
         xv4I4WnfclLLzBWM/noSiWccvrxLcilNPBoZtTSuVLZX0swZh5nlqH7hShkcrX1jLWZ9
         oHqXCjhCf/jJfClLtjqf5OY7UbO/BMLCs5ljMG3jOiF9hEzTohW0vqZdfbpuXgPgT8f5
         n0svf3RgtiMDfZnC1QZ7VfBRFUlkxRDxTtNVNy6BmjNoRott8dnSsfO0lh9pdksrlpfF
         RpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XinK48gMtdhK2Jrt5yYTeK2A0TRIxNMgvQ0AqBqN7hY=;
        b=aZ4D9aA/blbTfFamawpAeZaOx5Q2WlBMGC+TaJ/qhzTo4mkISbbYeuTVMRzweNe+bA
         pi0gsCO1CUul4ZCXGRl1us8Q4oldwH9efoq0EauRuKiScmLfYU82KTZQsf4me5cJa0LL
         MoA/VrVt2taULL8Rrb1YmCLuyd0vGgUUsNd7Nvm99qorkbhvehnXivFuSov21eex60Tz
         EkvL+dZW104Up+5CU6rX5JoilLrTF7o90FjVjt7H38fADKgymU4B0oTMwLf/IpEII7iO
         NVj9JvapsHJmWYOrX80dTTj6SqUbx/YaUAeQPAS6qNYnK/LCYl72YnRFaoIblwFlBalU
         t/7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SHDmgWfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27-20020a05620a151b00b007590b629354si6117810qkk.477.2023.05.30.04.39.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:39:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SHDmgWfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3xh9-0007w3-8f; Tue, 30 May 2023 07:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgs-0007sW-Qr
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgr-00041Z-AL
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XinK48gMtdhK2Jrt5yYTeK2A0TRIxNMgvQ0AqBqN7hY=;
 b=SHDmgWfDcflZ3LDjsOzfNJYEZXbwTpJK1lR/rnkmTGgfSvnVRZV9JEwlljaPmUPIJeAso8
 DL6RfFYh6N8WiF5LE6L4GaFApNbVKUXLf8B8HAV2og8Bsn73Uj+xkv3PfnbIB1SBFlNLJH
 OTJMSfmgFAt4GdaN9GTWKA+HEK6o0/E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-AFB7OFj6NDWyUCmKhbY5Cw-1; Tue, 30 May 2023 07:38:57 -0400
X-MC-Unique: AFB7OFj6NDWyUCmKhbY5Cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F5AD185A791;
 Tue, 30 May 2023 11:38:56 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD1840CFD45;
 Tue, 30 May 2023 11:38:52 +0000 (UTC)
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
Subject: [PATCH 03/10] hw/arm/virt: Use memory_devices_init()
Date: Tue, 30 May 2023 13:38:31 +0200
Message-Id: <20230530113838.257755-4-david@redhat.com>
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
References: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
X-TUID: H/4m6ExrEXP3

Let's use our new helper. We'll add the subregion to system RAM now
earlier. That shouldn't matter, because the system RAM memory region should
already be alive at that point.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/arm/virt.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9b9f7d9c68..49bc8378ec 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1817,10 +1817,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     virt_set_high_memmap(vms, base, pa_bits);
 
     if (device_memory_size > 0) {
-        ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
-        ms->device_memory->base = device_memory_base;
-        memory_region_init(&ms->device_memory->mr, OBJECT(vms),
-                           "device-memory", device_memory_size);
+        memory_devices_init(ms, device_memory_base, device_memory_size);
     }
 }
 
@@ -2261,10 +2258,6 @@ static void machvirt_init(MachineState *machine)
 
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
                                 machine->ram);
-    if (machine->device_memory) {
-        memory_region_add_subregion(sysmem, machine->device_memory->base,
-                                    &machine->device_memory->mr);
-    }
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-- 
2.40.1

