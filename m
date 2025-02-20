Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp300206njk;
        Thu, 20 Feb 2025 11:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmagaEI5cROmQR1DZ2gHZUUSM52ISoJGnQmThZYVwtZBFBezA/ZYldKzlepcVmdLd0ZOdA4xBAl3g0gQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGInaVx4fCvWSJh4XR+IMKNQG1xhH5//2NnWy6TT8u/sC78G2C5ho+hdpdTnetADBQuNuA8
X-Received: by 2002:a05:620a:2444:b0:7c0:9f12:2b9b with SMTP id af79cd13be357-7c0cef53633mr84158185a.35.1740080412972;
        Thu, 20 Feb 2025 11:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740080412; cv=none;
        d=google.com; s=arc-20240605;
        b=dJOwOvQtQVVm56m5uUZxUPR74D748tFpbr2INX7urgGvNtekFcJFgtMSp2URVKw0tS
         5sZ7SxMx9jZAUfPd68LDjFSQO6idpYnnxqMcO2t4ICXjF7ttcprezB0OO3NCRaWMBJ+M
         dR+ydeCSD1T/wwxZUA8uzKhyhNrp+msiFyayws7Jx0dOKOSJfLvQoz3McwecqHIKmGf8
         dtsCA/UIDxbAJqkcwIPnXL/x4AiULmwCS0MuTVwOEnR6A1MdrlpW3+0fHYqOROcZ28nN
         pKSmZNqcA1nNWXa6xE2CjCAKHQ69iVqNUBXs5FGQIwKadvUwrSIea/ZSLfHJb1QoIXpE
         Qmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xCmbmGEnPivhT04E5H1R7HKWMm3JkdNClqaUPWHdI2s=;
        fh=0JACnU4x0PmvzaBkaPNQGs0VbUbS0mvC4dKJzw1+gGg=;
        b=cGE6cAF91Ta4CVDuGp6o90JJ1rrwujx8Mh7awlgWX6D7auB7fCW+OGSmIyZYb9DeK1
         EF8OpN6HuI9uqYMkuGsSjaJ66sAeyCOhzJv3ZX418chrYmzhdgJynP/+7dd59EnKkMyX
         b5yPnzh9P2STHpRR24M0qObsjUP2iY3pUthDEQNx3JzX7w6qGEELxs1NdbQI1plLr0il
         9rvzvVvlFvyYyJ1tqJAqfzREB0wMayB4YzYbcJq/71KN3e2eEbptfwS9pT0GL/YiZhKK
         KE8rcQaQQTHNG1QQZ8u1ATl8GznFgyNVEBrGrbFFiX2Nx/RKhULcOABRN4YYSvzdDJrD
         iPlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0LEic0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471eb1528afsi87285171cf.663.2025.02.20.11.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 11:40:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0LEic0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlCP1-00027u-4v; Thu, 20 Feb 2025 14:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tlCOz-00026A-Pv
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 14:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tlCOw-00058H-Fr
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 14:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740080399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xCmbmGEnPivhT04E5H1R7HKWMm3JkdNClqaUPWHdI2s=;
 b=P0LEic0p1hjFw3DkzM4SUjMvE7/M/A6HTV/0CKo9aP76y9uwvGSkYUU3aix25SXD6TZ/E+
 xOa/tGMDQmYkxKk8K9vbGpYGCOymCvr4uxV9CZuRDtnC8wF+RKUQ1DT2+io35YcoxkHEai
 jkI1z+goeufxJI4tRgMpdoJy2U/0C/A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-6fB1k1N9Pr6RiMVtA7bMiA-1; Thu, 20 Feb 2025 14:39:58 -0500
X-MC-Unique: 6fB1k1N9Pr6RiMVtA7bMiA-1
X-Mimecast-MFC-AGG-ID: 6fB1k1N9Pr6RiMVtA7bMiA_1740080397
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38f4c0c1738so1126586f8f.1
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 11:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740080397; x=1740685197;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xCmbmGEnPivhT04E5H1R7HKWMm3JkdNClqaUPWHdI2s=;
 b=Mv6yKeZzby5ZWQKkBFyVEOLGuUPHYZIyq2oXWUZntEBSPupAs328Xz6PHNoyehrQrO
 PVcOlwqwT1tiJxCrlTUv23EB/jc5JNJUbf9If3FOqCKB7FCDfnd/QcfMnZYVRPNJz8pZ
 /qp1OWfDel0/fUkK0urwyZqpJHPn8hN3IccaHUnDrYV5qhouG02Ke1LEAOzw6aye/uvu
 V0bEmePDXuweQC6cRD9xSRh0OiMGslNL8+MvD89XbKPbAv2K0IeeloryLBg+utX+oBp4
 FVCxdXGrNdxUVWKMJYTL8Al4oLHowBE65V7Lv7NdYIdDgdAmFcE97e5lTaf23BJ5VYKF
 h2cA==
X-Gm-Message-State: AOJu0YwTgwT1fYYhyRLt5zRNl3nZ2nNftfRRkyJi38JhWvktNm67YLAE
 NI35rgpYrtZbzTIPCsbxKPnR7e55i1kQa5q8HH/fCimz1HyuX8hTDfCyTpGy15OciHszfwNP3WW
 FIWnMIWNBpwFn/CcNOuOTO5A98ncqMCMV/HHOzjCbJxQcde6gxQ==
X-Gm-Gg: ASbGncsMVTS1OZgVv+W/2co/bdGO8d5VbVqCodvjusvvp6lF+P2YaHkOnFV9NxKtZEu
 poOeVdnY4X6eHWtPHPt4r8sk7FOUEDnxFtEHiuSQ+gcCsahv7s5mnf50jjwoJ6KP6rwwYbWJGd0
 orjd3H+P/j2kYrnK7+eYQx3gQQtYWsP3Vh+5x+0NB0OcAd2usDCOo84UBru6ovScbhhqFrLNrxW
 0+/+36M6vmEbElO4fGtGnF0oi8zBNWyPgkaxWXcIfnydb8KyMzOiFQVoozFws6JDY8SXudpY4xj
 IJd6l+hUlHpQVOWoY9JhtivbQb30yr0N7kRZj0EDxuQSSXOPXJnp7untvyM2qVdR64MdCHr9l+U
 u5QbDvWHt1lar2N8w6XP9SmQ+GOIOoA==
X-Received: by 2002:a5d:6d07:0:b0:38d:dc57:855d with SMTP id
 ffacd0b85a97d-38f6f0b0129mr544467f8f.35.1740080397115; 
 Thu, 20 Feb 2025 11:39:57 -0800 (PST)
X-Received: by 2002:a5d:6d07:0:b0:38d:dc57:855d with SMTP id
 ffacd0b85a97d-38f6f0b0129mr544446f8f.35.1740080396700; 
 Thu, 20 Feb 2025 11:39:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:2000:e44c:bc46:d8d3:be5?
 (p200300cbc7062000e44cbc46d8d30be5.dip0.t-ipconnect.de.
 [2003:cb:c706:2000:e44c:bc46:d8d3:be5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5923sm21604078f8f.74.2025.02.20.11.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 11:39:55 -0800 (PST)
Message-ID: <0d761daf-174d-487f-80fe-09b04902006f@redhat.com>
Date: Thu, 20 Feb 2025 20:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] system/memory: Allow creating IOMMU mappings from RAM
 discard populate notifiers
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, philmd@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 Chenyi Qiang <chenyi.qiang@intel.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20250220161320.518450-2-jean-philippe@linaro.org>
 <20250220161320.518450-3-jean-philippe@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250220161320.518450-3-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WS8ibXgPZ-l0H5pubzCRFZ3CBp5eX7QZ9KzUj6PqXhA_1740080397
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.457,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: GJZeA3wjC8YB

On 20.02.25 17:13, Jean-Philippe Brucker wrote:
> For Arm CCA we'd like the guest_memfd discard notifier to call the IOMMU
> notifiers and create e.g. VFIO mappings. The default VFIO discard
> notifier isn't sufficient for CCA because the DMA addresses need a
> translation (even without vIOMMU).
> 
> At the moment:
> * guest_memfd_state_change() calls the populate() notifier
> * the populate notifier() calls IOMMU notifiers
> * the IOMMU notifier handler calls memory_get_xlat_addr() to get a VA
> * it calls ram_discard_manager_is_populated() which fails.
> 
> guest_memfd_state_change() only changes the section's state after
> calling the populate() notifier. We can't easily invert the order of
> operation because it uses the old state bitmap to know which pages need
> the populate() notifier.

I assume we talk about this code: [1]

[1] https://lkml.kernel.org/r/20250217081833.21568-1-chenyi.qiang@intel.com


+static int memory_attribute_state_change(MemoryAttributeManager *mgr, uint64_t offset,
+                                         uint64_t size, bool shared_to_private)
+{
+    int block_size = memory_attribute_manager_get_block_size(mgr);
+    int ret = 0;
+
+    if (!memory_attribute_is_valid_range(mgr, offset, size)) {
+        error_report("%s, invalid range: offset 0x%lx, size 0x%lx",
+                     __func__, offset, size);
+        return -1;
+    }
+
+    if ((shared_to_private && memory_attribute_is_range_discarded(mgr, offset, size)) ||
+        (!shared_to_private && memory_attribute_is_range_populated(mgr, offset, size))) {
+        return 0;
+    }
+
+    if (shared_to_private) {
+        memory_attribute_notify_discard(mgr, offset, size);
+    } else {
+        ret = memory_attribute_notify_populate(mgr, offset, size);
+    }
+
+    if (!ret) {
+        unsigned long first_bit = offset / block_size;
+        unsigned long nbits = size / block_size;
+
+        g_assert((first_bit + nbits) <= mgr->bitmap_size);
+
+        if (shared_to_private) {
+            bitmap_clear(mgr->shared_bitmap, first_bit, nbits);
+        } else {
+            bitmap_set(mgr->shared_bitmap, first_bit, nbits);
+        }
+
+        return 0;
+    }
+
+    return ret;
+}

Then, in memory_attribute_notify_populate(), we walk the bitmap again.

Why?

We just checked that it's all in the expected state, no?


virtio-mem doesn't handle it that way, so I'm curious why we would have to do it here?


> 
> For now add a flag to the IOMMU notifier to tell memory_get_xlat_addr()
> that we're aware of the RAM discard manager state.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> 
> Definitely not the prettiest hack, any idea how to do this cleanly?
> ---
>   include/exec/memory.h | 5 +++++
>   system/memory.c       | 3 ++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 9f73b59867..6fcd98fe58 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -116,6 +116,11 @@ typedef enum {
>       IOMMU_RO   = 1,
>       IOMMU_WO   = 2,
>       IOMMU_RW   = 3,
> +    /*
> +     * Allow mapping a discarded page, because we're in the process of
> +     * populating it.
> +     */
> +    IOMMU_POPULATING = 4,
>   } IOMMUAccessFlags;
>   
>   #define IOMMU_ACCESS_FLAG(r, w) (((r) ? IOMMU_RO : 0) | ((w) ? IOMMU_WO : 0))
> diff --git a/system/memory.c b/system/memory.c
> index 4c829793a0..8e884f9c15 100644
> --- a/system/memory.c
> +++ b/system/memory.c
> @@ -2221,7 +2221,8 @@ bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>            * Disallow that. vmstate priorities make sure any RamDiscardManager
>            * were already restored before IOMMUs are restored.
>            */
> -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> +        if (!(iotlb->perm & IOMMU_POPULATING) &&
> +            !ram_discard_manager_is_populated(rdm, &tmp)) {
>               error_setg(errp, "iommu map to discarded memory (e.g., unplugged"
>                            " via virtio-mem): %" HWADDR_PRIx "",
>                            iotlb->translated_addr);


-- 
Cheers,

David / dhildenb

