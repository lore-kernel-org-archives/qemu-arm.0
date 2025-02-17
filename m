Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp38699njb;
        Mon, 17 Feb 2025 05:39:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVl+/pZEse5j0tvkqsjEgxpzl1EGwWfYNHVFi5iRR5N/Os4UsdZMuPAqbtkIuaYEqnJOHyzgcFglItxFA==@linaro.org
X-Google-Smtp-Source: AGHT+IGp3oDptytv87mP/EpgE2Q4la1haYGid4RcdVkPZdFYL8Tz1pXkk7ShvdIhjpE9b+6ch7GA
X-Received: by 2002:a05:620a:4686:b0:7c0:88a4:277e with SMTP id af79cd13be357-7c08aa38a54mr1760451785a.36.1739799559021;
        Mon, 17 Feb 2025 05:39:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739799559; cv=none;
        d=google.com; s=arc-20240605;
        b=DxoHA8uCj0kKNsZ1+m34DuaqUGRBLAv/gEyr/zbOn57hde+KSYkNMx7L5xYhGvbusZ
         wArmyx8Fjsz/QpQCNbUB10KA+8VlwmJi55vrlZste2HbBXj78c7lzcSlzUefIjyPS+oZ
         VmxxJVAKFDRzkUrT5RTMpn5zPz2VsRTYT8VqB6SxmpP3CP3fTNQ7Xepk0HYGkfG9V4DA
         veP5jUeQvGY+kGAzDZnrXlrJuQ/qJPqgBMFgLxlXEh5OCB3X03c5UhHire8aNmwR4M0c
         0Nuux6tMdiQXbaPe82eUj0wagGDSeQD7wbp31kTA++j9i9lNIJWeSwF+/JdZC8VHqKw/
         2d0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SqmpLSsgNSlXhP1+0ZYyHtU/bNBN0ToNwclfZZPKnzw=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=Cl3Kgsh3r3K8VkWu17YVtOn6ydaS8TpDAEsAQr6VrFfyIYATM/95f3KkdUodKaAMaj
         uAPjwkCTI7YU3e2WnoYxT/WJBjIGIdZlBj9b2At9T3/UKJyHoTCvh7s7KUyHKM4tPgy8
         bzOU3H1ZU7fgifJrlsob42zfDww7XdBweqqmGNEekRnhKbf0ifp5WRFbBUiYTW+AErIy
         Dl3W7l/2Hz2LubGF/Qwyq1KCkijPHGJEwssZuHRE2zMXBWIePWxzJ8B8vvYjio2Kr0xi
         irrfGYMpfTAWe97TnmkVn6cLTPWrVAh6/xjXXw7HclivVHON6dHxxQPHPzPdYdSj9peF
         RM0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UUIdVNSa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c873509si864610385a.324.2025.02.17.05.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UUIdVNSa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tk1KO-0007aS-OW; Mon, 17 Feb 2025 08:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1KB-0007YD-7Y
 for qemu-devel@nongnu.org; Mon, 17 Feb 2025 08:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1K9-0002A0-I7
 for qemu-devel@nongnu.org; Mon, 17 Feb 2025 08:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739799492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqmpLSsgNSlXhP1+0ZYyHtU/bNBN0ToNwclfZZPKnzw=;
 b=UUIdVNSa3gTPEjU8EmVFwkwL6pe4iDuFJlNZk/wVEm/KwvS/Lb4rMN4ewPytGbfxcg+CpO
 rtYNltkE5c5ZS43Eck3JCGSg0AhEx0Vmtq7VdrkyyvyDvY3C1lYqp0gY9NzH+LvF6+U4uU
 HRgv0CJaMynaIak9ZHHkUef3SMWOR9c=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-kubiD_y9NQq8RiH8UEYVIQ-1; Mon,
 17 Feb 2025 08:38:08 -0500
X-MC-Unique: kubiD_y9NQq8RiH8UEYVIQ-1
X-Mimecast-MFC-AGG-ID: kubiD_y9NQq8RiH8UEYVIQ_1739799487
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F187C18EAB39; Mon, 17 Feb 2025 13:38:05 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.254])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3DC8A1800265; Mon, 17 Feb 2025 13:38:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH v2 2/5] hw/i386/intel-iommu: Migrate to 3-phase reset
Date: Mon, 17 Feb 2025 14:36:46 +0100
Message-ID: <20250217133746.6801-3-eric.auger@redhat.com>
In-Reply-To: <20250217133746.6801-1-eric.auger@redhat.com>
References: <20250217133746.6801-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jyG4zWcEA6zH

Currently the IOMMU may be reset before the devices
it protects. For example this happens with virtio devices
but also with VFIO devices. In this latter case this
produces spurious translation faults on host.

Let's use 3-phase reset mechanism and reset the IOMMU on
exit phase after all DMA capable devices have been reset
on 'enter' or 'hold' phase.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>

---

v1 -> v2:
- add a comment emphasizing the importance of using an 'exit reset
---
 hw/i386/intel_iommu.c | 12 +++++++++---
 hw/i386/trace-events  |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f366c223d0..a5cf2d0e81 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -4697,10 +4697,11 @@ static void vtd_init(IntelIOMMUState *s)
 /* Should not reset address_spaces when reset because devices will still use
  * the address space they got at first (won't ask the bus again).
  */
-static void vtd_reset(DeviceState *dev)
+static void vtd_reset_exit(Object *obj, ResetType type)
 {
-    IntelIOMMUState *s = INTEL_IOMMU_DEVICE(dev);
+    IntelIOMMUState *s = INTEL_IOMMU_DEVICE(obj);
 
+    trace_vtd_reset_exit();
     vtd_init(s);
     vtd_address_space_refresh_all(s);
 }
@@ -4864,8 +4865,13 @@ static void vtd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     X86IOMMUClass *x86_class = X86_IOMMU_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
-    device_class_set_legacy_reset(dc, vtd_reset);
+    /*
+     * Use 'exit' reset phase to make sure all DMA requests
+     * have been quiesced during 'enter' or 'hold' phase
+     */
+    rc->phases.exit = vtd_reset_exit;
     dc->vmsd = &vtd_vmstate;
     device_class_set_props(dc, vtd_properties);
     dc->hotpluggable = false;
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index 53c02d7ac8..ac9e1a10aa 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -68,6 +68,7 @@ vtd_frr_new(int index, uint64_t hi, uint64_t lo) "index %d high 0x%"PRIx64" low
 vtd_warn_invalid_qi_tail(uint16_t tail) "tail 0x%"PRIx16
 vtd_warn_ir_vector(uint16_t sid, int index, int vec, int target) "sid 0x%"PRIx16" index %d vec %d (should be: %d)"
 vtd_warn_ir_trigger(uint16_t sid, int index, int trig, int target) "sid 0x%"PRIx16" index %d trigger %d (should be: %d)"
+vtd_reset_exit(void) ""
 
 # amd_iommu.c
 amdvi_evntlog_fail(uint64_t addr, uint32_t head) "error: fail to write at addr 0x%"PRIx64" +  offset 0x%"PRIx32
-- 
2.47.1

