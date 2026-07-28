Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C392C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojiO-0004x1-0R; Tue, 28 Jul 2026 11:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wojiM-0004wG-A4
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wojiK-0000uL-EP
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785252447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=buhYI0R3oVtLJLP0f6X47Zi7oAniHBGW4yWK95xa23U=;
 b=Zaur37qDbS00PfRyOfxlCA8/NSU855xIhL6i3OWFPLz35TqrvoiusfnzvxY1hPpQUvP67U
 Lf7zm38SJ1QsVB3o3YSAAsnSdNwZYoFMr5DoEbn/YoAwsCRuzdWExzUZb7DFq1VqjGilTe
 fLTbqiU6M7HGvKqnfZGyrC8O1FzsJBE=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642--Qr5D4t-NxmZbp3AaNAiuA-1; Tue, 28 Jul 2026 11:27:24 -0400
X-MC-Unique: -Qr5D4t-NxmZbp3AaNAiuA-1
X-Mimecast-MFC-AGG-ID: -Qr5D4t-NxmZbp3AaNAiuA_1785252444
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-6ab4aec4a14so2066699eaf.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252444; x=1785857244;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=buhYI0R3oVtLJLP0f6X47Zi7oAniHBGW4yWK95xa23U=;
 b=L3XXLuG5er8YJjh13FcJUHXpZ8H4/NTqi9HaNJm21JVOg/t3IbfazBrDkQFluO5OET
 PnrzHDhXQ0lD3x1j/H7BAgxUfhM6FhfYjG7a9a9j02tZv+Bsac7WfdhQIDFw9jmpZyAj
 VwMa5CZomIA3HhvFGALEBchZ4USP2cs2KUxdmz4fvdCSUFVcl54VZMUtwWOK9j5Kum8u
 TeA6F9d8zIU34qxcNkGc2RpCXBRt0kGBp2UEzvVoRA4fjHnIZ6dPnsVTJNbWfWx9K6Ec
 iAuuIzPEgYiSTB+vz1kuEnO2Yg9sfy7VF1wa3IcrQGvjcgxWCe/p0W6OhRhrCgZtimpJ
 2gSg==
X-Gm-Message-State: AOJu0YwoRJXiGiORS4IBm1VLHkMTxJXM4c91wmDnP9d5dZnNAI6uIAdH
 HqzYjnUGvrnj0MMPajPNHa5PaKScaS25MnotY1nlSiCpaesLDPRnBTpDLiEDWpmfNPCx7PZw6xb
 HqCqAAgCGo6rezG+NHIK6IVU/dr31HQQnZMHVJY7u3DzFZ1eCqOHQyholQ2oiJQ==
X-Gm-Gg: AR+sD10ntaGttZIUSHIm8Lxvii0tiW4Ay2+nz8wTCEXNtWRIfcPcEmpTh7/41VYoS6i
 UD7/d04P2xoJuu/bwdKX8w6HG2ECpOriBDvz+4BFkSmbsi+D0mUDBQvZ1A9SsoEa4VnT3ISNnYX
 OD08nGQdc32/12n/hH3FMFbp4a2ZhkbSZE7MW3wjjHYtmx9qOun7DmGZmmch9CT7kiEF6XBkK3W
 RuXz8wR3LNjkcNwcDPGAOYJfqadjASnkhHpXu1h4vbWGo/sKzzg2VVRMriozRgaGJ/Ww4/2TrBp
 1bSBvbbQwiZv54xFhnVxYy4RiTWSax36NSCtjfzsu+M+47GVjoMHHCsXjK+Tgg36Y3rx
X-Received: by 2002:a05:6820:811a:b0:6a3:8667:dc7f with SMTP id
 006d021491bc7-6ac96ce086bmr1457641eaf.60.1785252444071; 
 Tue, 28 Jul 2026 08:27:24 -0700 (PDT)
X-Received: by 2002:a05:622a:6097:b0:516:d83c:edb6 with SMTP id
 d75a77b69052e-529d70557ebmr23726611cf.12.1785251976617; 
 Tue, 28 Jul 2026 08:19:36 -0700 (PDT)
Received: from x1.local ([174.91.117.74]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9081dd3a7b9sm1233436d6.27.2026.07.28.08.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 08:19:35 -0700 (PDT)
Date: Tue, 28 Jul 2026 11:19:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 philmd@oss.qualcomm.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex@shazbot.org, berrange@redhat.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v5 0/3] system/memory: Make ram device region directly
 accessible
Message-ID: <amjIfGLjRpYACr6M@x1.local>
References: <20260728031731.286666-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260728031731.286666-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p6O92DyAlBo4FPVmRqT1qmX5zWZEDBbFX2lLAYHfzyk_1785252444
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jul 28, 2026 at 01:17:28PM +1000, Gavin Shan wrote:
> All ram device regions was turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> to a frozen guest where a NVidia GH100 GPU is passed from host. The memory
> in its PCI BAR#4 can be allocated as DMA target buffer. qemu has to take
> DMA bounce buffer in address_space_map() to cover the DMA request. However,
> the bounce buffer size is 4096 bytes only and it's exhaused very quickly
> when the guest has significant disk activities on compiling 'cuda-samples'.
> The full log and problem description can be found from PATCH[2/3]'s commit
> log.
> 
> Fix the issue handled in commit 4a2e242bbb by replacing memmove() with newly
> added qemu_ram_move() where the aligned and small-sized accesses are handled
> by qatomics, and fall back to memmove() otherwise, for the directly accessible
> regions. With this, we can revert 4a2e242bbb to make ram device region directly
> accessible again and bypass the bounce buffer in address_space_map() where the
> guest hang happens.
> 
> PATCH[1] replaces memcpy() with memomve() for directly accessible regions
> PATCH[2] uses qemu_ram_move() for directly accessible regions
> PATCH[3] makes ram device region directly accessible again

Queued for 11.2, with fixups suggested by PeterM in v4 discussions:

https://lore.kernel.org/qemu-devel/CAFEAcA-y+vNK2u-rSq+SVjNZrhO2=BsUysEw2PtCdCZ=qYx2bw@mail.gmail.com/

Fixup:

diff --git a/include/system/memory.h b/include/system/memory.h
index d5fca96cea..16bf04ef07 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -2677,9 +2677,9 @@ void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
  * Move @n bytes from @src to @dst, the memory areas may overlap. This
  * provides the same semantics as memmove(), plus an additional stronger
  * guarantee: if @n is 1, 2 or 4 or 8 bytes, and @src and @dst are both
- * naturally aligned for that access size, and the memory areas do not
- * overlap, then both the load and the store will be done as a single
- * atomic access (with the semantics of qatomic_read() and qatomic_set()).
+ * naturally aligned for that access size, then both the load and the store
+ * will be done as a single atomic access (with the semantics of
+ * qatomic_read() and qatomic_set()).
  *
  * This is the underlying function that we use to implement accesses by
  * a guest vCPU or a device DMA operation to a ram block. The atomic
diff --git a/system/physmem.c b/system/physmem.c
index fbe7df2391..2f37cbeb07 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3162,13 +3162,18 @@ void qemu_ram_move(void *dst, const void *src, size_t n)
 {
     uintptr_t test, len;
 
-    if (src == dst || n == 0) {
+    if (n == 0) {
         return;
     }
 
     /*
-     * Maximal length of aligned access that are determined by @src,
-     * @dst and @n
+     * Calculate "the lowest set bit" over @src, @dst and @n, result put
+     * into @len (which guarantees a power-of-two).  With that and the
+     * later check (len!=n), it makes sure that we will only do the atomic
+     * ops when:
+     *
+     * (1) @n is a power-of-two
+     * (2) @src and @dst addresses are both aligned to @n
      */
     test = (uintptr_t)src | (uintptr_t)dst | n;
     len = test & -test;

-- 
Peter Xu


