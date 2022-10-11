Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2785976ejn;
        Tue, 11 Oct 2022 16:23:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vL6z2jnI4SMMThMOpOEkYDjdixuQN0efcq0DF9oAbETQXkGB6owm0y30slbgsEHiAzW8j
X-Received: by 2002:ac8:5f88:0:b0:399:ebb0:1979 with SMTP id j8-20020ac85f88000000b00399ebb01979mr11158961qta.290.1665530610940;
        Tue, 11 Oct 2022 16:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665530610; cv=none;
        d=google.com; s=arc-20160816;
        b=wtMWw6qhlilacOOmQYI5A91O/Rq31YBu4f3a9FVobRKHV7R+5Hx156Zh1wz4WQ0gsL
         1FpCBTelN5yQ0DdlkH5pTSxJ0QxwPsh6fBKjDc2cTtskZ66l2t9Gioh2wfU7ZmUxVydx
         TRduHmHc0WtLafU66HG1hCDSOKiLMVeHDoE1OPANfivpI2Bitz8GjhY8pHDNFaaUraK7
         TcKAff5Yh+I6B2Ny+DQW/1Oz3MrPJ/v0gMtVxxP2ObmvZHZbbZtcH+vZ0RDccBFL9IjJ
         dEFImy/CXVwwF6Sz3hG3G+8NNrNP7TnZvbIu3AcbUYsiziXiSSDolMBEOzjjC0I0mT3C
         xfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LOq+HVjhUQxDTPFDjzkI2RAtF911hqXuAEHfkgpFk5A=;
        b=HxZoxyI5iJKX2qrjCED2JACWKuHBxzMi29nO2Jtldsn8xETkmNBqXvyfR/IFlgQ0UQ
         I+gft31MYResomcJQxzXE+hS1AMJftk8v4BgAvhHmk7nNojsTedoXsORsZZKRU/rLD3w
         /LI5WhMVdDKMatnKg1CaQ2ORLf1jl1eo0yodRG0+H3O6VTP1rLBWWv+5J9JR2aCocWsi
         9lUZNwKIAyodEyNCuyLgARq1VoqBshnNGq3hNyJ0awSglPkvSLSMW1SGR+tQM7xgx4BZ
         6R+IABv/YGE6XoS89sDn6c4B9dX4NjND6PxlTKbb88DAeRpHIwAoa5E+ynIcMwwTVMh1
         QBQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WRJ/UbbH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05620a25cf00b006ce4071eec5si8227863qko.639.2022.10.11.16.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 16:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WRJ/UbbH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiOaw-0005Y5-Ek
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 19:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOX1-0005Hb-DW
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWz-0006Ra-Or
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665530365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOq+HVjhUQxDTPFDjzkI2RAtF911hqXuAEHfkgpFk5A=;
 b=WRJ/UbbHKTVcXTw9VqAYOwzFSFkyWCTh+b580yA9Yqsh7L9mSvd7+wexzwsrq/OTwUlbW2
 WzuoM7YpqTgs9seu84YpXZ/8sInxIvt3uy+B1L8rBdkTO6aCvXpzhcN+JfyY6GYSlJ5iDD
 vcGoDY+0IrKypotMrvkitOtNbNuYAzY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-rbmTOo0tOyCmgU9XZSGMmQ-1; Tue, 11 Oct 2022 19:19:19 -0400
X-MC-Unique: rbmTOo0tOyCmgU9XZSGMmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 070411C09040;
 Tue, 11 Oct 2022 23:19:19 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-52.bne.redhat.com [10.64.54.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3FF42166B2F;
 Tue, 11 Oct 2022 23:19:15 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v5 5/6] hw/arm/virt: Improve high memory region address
 assignment
Date: Wed, 12 Oct 2022 07:18:31 +0800
Message-Id: <20221011231832.149839-6-gshan@redhat.com>
In-Reply-To: <20221011231832.149839-1-gshan@redhat.com>
References: <20221011231832.149839-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N4Fg6Kq4c3PX

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is disabled by developer by
    toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_memmap() isn't comprehensive
because the space for one specific high memory region is always
reserved from the PA space for case (1), (2) and (3). In the code,
'base' and 'vms->highest_gpa' are always increased for those three
cases. It's unnecessary since the assigned space of the disabled
high memory region won't be used afterwards.

This improves the address assignment for those three high memory
region by skipping the address assignment for one specific high
memory region if it has been disabled in case (1), (2) and (3).
'vms->high_compact' is false for now, meaning that we don't have
any behavior changes until it becomes configurable through property
'compact-highmem' in next patch.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++--------
 include/hw/arm/virt.h |  1 +
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ee98a8a3b6..c05cfb5314 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1717,22 +1717,29 @@ static void virt_set_high_memmap(VirtMachineState *vms,
         region_base = ROUND_UP(base, extended_memmap[i].size);
         region_size = extended_memmap[i].size;
 
-        vms->memmap[i].base = region_base;
-        vms->memmap[i].size = region_size;
-
         /*
          * Check each device to see if they fit in the PA space,
-         * moving highest_gpa as we go.
+         * moving highest_gpa as we go. For compatibility, move
+         * highest_gpa for disabled fitting devices as well, if
+         * the compact layout has been disabled.
          *
          * For each device that doesn't fit, disable it.
          */
         fits = (region_base + region_size) <= BIT_ULL(pa_bits);
-        if (fits) {
+        if (*region_enabled && fits) {
+            vms->memmap[i].base = region_base;
+            vms->memmap[i].size = region_size;
             vms->highest_gpa = region_base + region_size - 1;
+            base = region_base + region_size;
+        } else {
+            *region_enabled = false;
+            if (!vms->highmem_compact) {
+                base = region_base + region_size;
+                if (fits) {
+                    vms->highest_gpa = region_base + region_size - 1;
+                }
+            }
         }
-
-        *region_enabled &= fits;
-        base = region_base + region_size;
     }
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6ec479ca2b..709f623741 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -144,6 +144,7 @@ struct VirtMachineState {
     PFlashCFI01 *flash[2];
     bool secure;
     bool highmem;
+    bool highmem_compact;
     bool highmem_ecam;
     bool highmem_mmio;
     bool highmem_redists;
-- 
2.23.0

