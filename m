Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp883522njb;
        Tue, 18 Feb 2025 10:28:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZs2IMIhJlnnl85lc2LRxNQdXR2dyW0Tkqexy2FUbfWxnTbHavPMBaPxgKEz0CebD9k8vZAa3GLmvj0g==@linaro.org
X-Google-Smtp-Source: AGHT+IEHBjKInOlFuwXtiGDo9GyxFO6iDrmn/kWnom/rZ9e/8IhkTQi8gjNwciPSfQ1EYLNkntt5
X-Received: by 2002:a05:620a:1a84:b0:7c0:a531:fe45 with SMTP id af79cd13be357-7c0b5347f24mr64567785a.38.1739903291022;
        Tue, 18 Feb 2025 10:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739903291; cv=none;
        d=google.com; s=arc-20240605;
        b=b97hwKc0O3SJ9rrhD3dOXiSrXJtYd3JFAh5DQBKZLAfWs83dqFAavS/tikC2VJf1Rw
         LAB2wxRiUR67MxeglLB6dxuSOW9cOA9+/Xu//4RYI0F7Hr3CDBgkfCUloz0L9CEu2vvC
         8BSuOI7JoLghi3MJR6i7jPUpp4Yp+oxX1rFzw3MpP5KcJBgISArvX1mbCUyl9/N6c8hM
         BbD45YqWCvaUPVhpH7KG2mGVZKgBpPpebH8Qrf7oCoJwIWxdkucNaPm7oUb+Lf2RCLXJ
         F1YUJMWEuWsn8lsYO8kw/llvdLmTG2igzanPlpSjYKthgn905SyakKqJzeginB+Y58dx
         Kz2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pi+Spm/qanV6kshrLHo1osO/ATlRDNQ5mELb742HSRQ=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=VCNvirUqHS2TNTTrhaK5JYOOHP4MXjq6NPHqBLKnkiKwhD+coiGlR72CeOUauhkG8u
         PcOib5kKME9a6Ktw0sknO33owoVnTLIUbwzNyNZFA0IymMwvhVJob5ipBhvC0rkCg8wx
         Cu+2Gl14msuuExARAXX1cy0DShDPCsCfCOHKDjmLxrb7WS8dU+bAKBixdwdv1GLA1uLP
         21eACFHV83sgFXHRRzF5cmdm/0pMP8IrwCN53hDP1TeekHyMbWJAbPNcvG4JqwPqRlpz
         YoS8qe1oo+CGFD3NTU7zZSCVbVpxNgGdToCcB9bhGsiXtruaFs14ORJemP7k6eoKQuvj
         7JHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fWDZrwPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c892854si1078167585a.409.2025.02.18.10.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 10:28:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fWDZrwPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkSKE-0006Ln-Vw; Tue, 18 Feb 2025 13:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkSKD-0006LQ-Vc
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 13:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkSKC-0008OU-DH
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 13:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739903282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pi+Spm/qanV6kshrLHo1osO/ATlRDNQ5mELb742HSRQ=;
 b=fWDZrwPo1xk6chjTslehutCByLA5Dz1RGbOSzELDOV45wQDiTZEMo7RGWkdh1YNsJKaa/6
 ztEH2KSTqIGeh4GUqvCpHJ5aXyA5EkrXsgbjYkxbNFkT6s9U3FNgKREx62ANhBqj6LEXwf
 0ivKAIODGH3slIfYMnrlPgw4dcoQswg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-CT47ictfNEaJHdx1X-8JUw-1; Tue,
 18 Feb 2025 13:27:58 -0500
X-MC-Unique: CT47ictfNEaJHdx1X-8JUw-1
X-Mimecast-MFC-AGG-ID: CT47ictfNEaJHdx1X-8JUw_1739903276
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C1D2C18D95DC; Tue, 18 Feb 2025 18:27:56 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.254])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 018FD1800373; Tue, 18 Feb 2025 18:27:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH v3 2/5] hw/i386/intel-iommu: Migrate to 3-phase reset
Date: Tue, 18 Feb 2025 19:25:32 +0100
Message-ID: <20250218182737.76722-3-eric.auger@redhat.com>
In-Reply-To: <20250218182737.76722-1-eric.auger@redhat.com>
References: <20250218182737.76722-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
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
X-TUID: sGd0aV0GrbeR

Currently the IOMMU may be reset before the devices
it protects. For example this happens with virtio devices
but also with VFIO devices. In this latter case this
produces spurious translation faults on host.

Let's use 3-phase reset mechanism and reset the IOMMU on
exit phase after all DMA capable devices have been reset
on 'enter' or 'hold' phase.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Zhenzhong Duan <zhenzhong.duan@intel.com>

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

