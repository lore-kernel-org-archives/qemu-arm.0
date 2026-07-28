Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A38CC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:30:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonTf-0004SE-VL; Tue, 28 Jul 2026 15:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSR-0003Tj-P1
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSQ-0001c8-7n
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:19 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38e071ed6aeso174629a91.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266837; x=1785871637; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=k1OKTxouEu3ExdbBGp8MAamXpMFfZiX+8/wuyJN0otc=;
 b=kDUuU7EYJKbvlcrKC1Pitug/tRwnvkvU/+zGRFviXmL6qgqAixaLkZbSLsGOh3vQ8u
 W7AJX2TsrDN/rIVSJaDDvNN7JawIo+2zlElJpAhn4n8m7fRLbR2AySactO9Yg5oCZLT8
 vvvNvphfosvVOo/qtyW7Wx0fSUNf/+fBwW6IOSGvCd0NkrewpbrrSqPB8o4HB+n7lcZK
 Jlg6ZazstsPYd0qXKbo1zhR62Cn6RiR5wEi07DvoIxtbEQquJ+CaPNSZMasdLkKxAxnh
 FjWn48YxRM6iH1c8fvypPUbN0tlxQsNPevV28VPQPKjVh+vlhDIneEWSFL3qx2Wg0au5
 1oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266837; x=1785871637;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=k1OKTxouEu3ExdbBGp8MAamXpMFfZiX+8/wuyJN0otc=;
 b=FebfEX+Px+jjC94JWEbg5QudVBKDEYQ8Kd++BiqcbLl4s3aHrj2/lTiED/0JbRgrQl
 /mrBeO/SpHZ+KjwTMmgqDCr/nxcmJf2hnRFnrczNTUae4VYowA0BnZcm4PO29KdPF8ki
 KqHB181eEkY04haibpGzM36grjONod89nbl1Tgc+cYSXOFBY7Wv658ayVhoYIqszV+IM
 czE3UKkSkdF5qNsr2C4BCMW3dOA4pxJcQFYLawVGdvXXxezj8N3wn0S0RafAE/bS//Cn
 0X16OSjYzm66cRvwwtPbi6kSaEez1n88qx2APBtwjJXxZNlIvU1NHZ8DCIzbc3Y+Gmfy
 ZHYA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpe33xD3juD+bkr3pHcrDnLYbb4uWqgOTojVVVa3Idnrh9V5wOzRmYyGJN5Iv6xk3cGxL1Afj5Adg==@nongnu.org
X-Gm-Message-State: AOJu0YyPfEGx41RV0BdKbGss/8kVNQbGUNuxX4xWldR7FTxciD46KbGC
 jR/Gkve/2Xu+/XQZ9ldE8Nu+j/1JGhsdYA06jTekRAdCZuc2nHTp839iKcTNfSl6ZXM=
X-Gm-Gg: AR+sD12fXteUKIvqZGbxSuayza8aZR5jp1+eyJPQ4Ik3fbWrOBqoAmFnWjx02Z0DRB1
 4xiIRPBMpqbW18H0ML/68b6KxroEOiNTtjKka2gwdzIrIz2G/Uv5vRVo0E5VxnHHO+OJEiY4JqL
 E6tn09guiA1nhcHwtSzo1TtURV5Sdnm2unf+el849yQZAFmxYFKprtI5Bd3lFzXOCxpn0w3tB1S
 APZpcN20y4B/zB7BcCB+rneGUlNdWe6JA6nL0yHg5ipHSDhK6ajM4SL/dU8GG9kujWa3sl49+Dz
 91CrD/VCXihmjLh91K/5OJlDWMxyh6+NySFqJk8KzVAh6DqnNDTdYCQJZAznSJFYheSDhU4bSHv
 MaOa7fBz/UoUzAXfc4QAoBdYu5sioN2UuBOne8bBFvcvoNOV/FOXQGNsPzhsVIxJ9ArNW5Dx7Wj
 UaQsuWBPpp272kQHy17+lZe1+qp55S
X-Received: by 2002:a17:90b:57cd:b0:38f:23d6:b4a9 with SMTP id
 98e67ed59e1d1-38f6a518021mr4060765a91.21.1785266836872; 
 Tue, 28 Jul 2026 12:27:16 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:27:16 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 19/24] hw/arm/virt: Move virt_flash_create() to
 machvirt_init()
Date: Tue, 28 Jul 2026 13:26:25 -0600
Message-ID: <20260728192630.240375-20-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

For confidential VMs we'll want to skip flash device creation.
Unfortunately, in virt_instance_init() the machine->cgs member has not
yet been initialized, so we cannot check whether confidential guest is
enabled. Move virt_flash_create() to machvirt_init(), where we can
access the machine->cgs member.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 65ed8573f8b1..74fe21712d4f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2911,6 +2911,8 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    virt_flash_create(vms);
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -4433,8 +4435,6 @@ static void virt_instance_init(Object *obj)
 
     vms->virtio_transports = NUM_VIRTIO_TRANSPORTS;
 
-    virt_flash_create(vms);
-
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     cxl_machine_init(obj, &vms->cxl_devices_state);
-- 
2.43.0


