Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1569334njb;
        Thu, 6 Feb 2025 06:23:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMYT4xFPKC6wgNSoLhkwt6OK4vpAZMTLJcrnSqio//CQzx8p8LSiaf+H+aL4OMGLRw+MJtjdhis3NRCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFP2XO4C4MZ7LWovgfoNqxrWrLBWFg859Atbjusspe0QGtXXGopOf/DNOs3Jsx5BFM1ivz8
X-Received: by 2002:a05:622a:6101:b0:46c:79c3:5cbe with SMTP id d75a77b69052e-47033612befmr50871571cf.2.1738851827689;
        Thu, 06 Feb 2025 06:23:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738851827; cv=none;
        d=google.com; s=arc-20240605;
        b=dea+5jczEGgw/YOjXecy4q0y/dHUQJgMVmHUPNnSHsrUfxTJBy2fMw7xhOoStbJbPB
         5MeGw0qu1nC3eLpHWxHpsvy2cZZtFm398QDQsGZH0rAERpgaMfL7FH6i0RSLBcIEEydg
         UDmhjdhb2i9ZV6jEqoDhnaltNjqF2fa9pTxeBlqQPot1E0qpA/nhWK2Dt2rGC17487lV
         IygaWG6BzbCgX76MIkKcRkrC6uv11jmUwjfN9twRNnS2sm97HoQDUMsj4adw2of0UlPN
         XxHqTSieswUqYUEIn8r1ZA57VlpmGUKbvoTjiR91vg5RbFWKTGJ/jLNFFdpsep3gAOBZ
         B+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3wXndAjmflDyaWZVw2Zlcb+pij53mML3vSJZl17gfVA=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=gSkNc9gKApai6SQnDwhERkrayM+rkl/2Nva66/z43FRHFkolm6lWP88G+SdnhvlS2c
         kzQKsfdJ/j1qwP7e34/0FLm0c2H0lC3TzMOtmOLcaqDL/pvAA8KphbYRTlse06QvaHGl
         NWxPxCw8nQof+HgXLnEUvvxmu99RGJkuH8xQPb2q6wk6LSFKXCpvdtjt96/OAwpiiShr
         pf6OggGnzD0qoidvb9gfEVwMvX98m4pdfYE9CtU+Ads/HxpOupCN9Wo8VPA23zAECX6J
         TKMXvTo98sS+EdRpBQ7sZ519bqiTmJwUExJccUzyg2zLSGmJTL6wHY44k/c6bDtyCIqD
         vhEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lj3o5EwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bea6b3si11412341cf.664.2025.02.06.06.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 06:23:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lj3o5EwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg2n6-0002DD-6z; Thu, 06 Feb 2025 09:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2n1-0002Cg-LK
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2mz-0006li-Qk
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738851812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wXndAjmflDyaWZVw2Zlcb+pij53mML3vSJZl17gfVA=;
 b=Lj3o5EwHMqURmMZLxCxwmHNTL60gxZiEEuB8inUD+U38INKEelkdcPb09OrVA3WBKp8SHI
 cqsLvZrTGaEnmQaesD19Ed54UBJvedckyFS6Rh3IiSESVB5fjBF62uwqXN9RmSEaGobXVX
 /+zweN6MrBDoNfD3BNgxo+m9SdF0c7k=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-VrOgwxDEN2SpyiCJb6l-6Q-1; Thu,
 06 Feb 2025 09:23:29 -0500
X-MC-Unique: VrOgwxDEN2SpyiCJb6l-6Q-1
X-Mimecast-MFC-AGG-ID: VrOgwxDEN2SpyiCJb6l-6Q
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 042D219560B2; Thu,  6 Feb 2025 14:23:28 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8FFAB1800360; Thu,  6 Feb 2025 14:23:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH 2/5] hw/i386/intel-iommu: Migrate to 3-phase reset
Date: Thu,  6 Feb 2025 15:21:53 +0100
Message-ID: <20250206142307.921070-3-eric.auger@redhat.com>
In-Reply-To: <20250206142307.921070-1-eric.auger@redhat.com>
References: <20250206142307.921070-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gJ5ki4PzPJtF

Currently the IOMMU may be reset before the devices
it protects. For example this happens with virtio-net.

Let's use 3-phase reset mechanism and reset the IOMMU on
exit phase instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/intel_iommu.c | 8 +++++---
 hw/i386/trace-events  | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f366c223d0..21a8bf45f8 100644
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
@@ -4864,8 +4865,9 @@ static void vtd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     X86IOMMUClass *x86_class = X86_IOMMU_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
-    device_class_set_legacy_reset(dc, vtd_reset);
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

