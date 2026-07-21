Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E404C44529
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 05:38:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wm3BM-0007J6-65; Tue, 21 Jul 2026 01:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wm3BF-0007Hx-9t
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 01:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wm3BA-0004S1-1a
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 01:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784612286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RDQgbWjPhObyv4PmR2GPuEBf2QWmtRpPo5OKrp5L04Y=;
 b=Almw+mhOi3MSZk2tRlY7km1JPnODxCeTzSvZHb9v1fN50uknwKm9soumUlYs7Xy/hoN9eW
 /4nSUGfp2oLOpl4cBNb5iWYvuisJyrdDgQupDF0KF5yNaX74l5VSQ6YJrPxZo8Czcz1/Uv
 AajJIpMznO3P7ys8tOz0i4jy7kXzEno=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-cS2RJ4AoP1iGruiF41jZyA-1; Tue, 21 Jul 2026 01:38:04 -0400
X-MC-Unique: cS2RJ4AoP1iGruiF41jZyA-1
X-Mimecast-MFC-AGG-ID: cS2RJ4AoP1iGruiF41jZyA_1784612284
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cca3673560so192100245ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 22:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784612284; x=1785217084;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RDQgbWjPhObyv4PmR2GPuEBf2QWmtRpPo5OKrp5L04Y=;
 b=ihYDNDPAp8saT3RGPayTFkY05J6+uKVXrRli7bwuLtZLqP7QB847upp6THDpUZbPRd
 IzsGGNUpJ9AX/W8S4GEKxM4cmtAUR7pjVx4RH8rYxkNcAajky7lJE6gLxM3e4WCW+3Rc
 e5ZWjf4KYUWoIrDlMMhYvamvOHopOevlVKati131kP/O9NF49YaBrjXLpzo04nbz+E9X
 sGiP2EXAEEyY+zESFTJHQNohZZ4QeNzktaloHn84pgSEnWb5i7LqOuQqHuJ5F2btb3xI
 jglIJrw09xKAf7WkYQymBxaINgFgZFJE3EepRIAEA223eu7re5fqHTHk/8L6jy1/jdVT
 2FTw==
X-Gm-Message-State: AOJu0YxklKFfH8laxWh8AmehCRTMHLospWVPeekAiqMgOZzPQA8QJcKC
 40pQnDr6tWnHpFUNV15kO4BF3wPMW+UI5TfCRsL8J5UV8OOFEZBwoAziMHz+SqnXoyfwndE3NDQ
 HaH4s2ZZ1K3eCDsMr0V/HtcU9Kx0eN3TAQPleYCssfPK9NlhIl4mCqQ==
X-Gm-Gg: AR+sD10HgyWp+I6vshqjxp3HWBjo5SxiHuMpH7he9DZFcVq2FO8RvzjDo1IN8Moukrj
 oiGYDqhd8GvCthjY2PVNotAyztB1GPh7Q4mk9afAbO/BlnjiCaG8gHro/eolcaLC/9LqIazbVVb
 9bMGPYKPlsQ55xPHZXW2URvWgTSNFr0+nVSsfn1M3BEw77LYe4HvVC4pa7fYMmMEx5UE3mAwOYj
 Yoq5SLk1mVqkjF5nHqtZg40c1fKYvepJrvrSAyQKrN1IvnjW4yZgarc3I/nqqzIeT9LukJtcYmg
 izyqRXhoUaY8J1avUP7XVn9uaJkuYJM44O8YONK6cujl5Ky0tMMLKrWnA/OGiUpyQv+CL3fE1Is
 qo1dlO0BHct8DFl0OMjubNl/p14nLyy2RSBv26emuy8s=
X-Received: by 2002:a17:903:2c47:b0:2c9:cf41:adf9 with SMTP id
 d9443c01a7336-2cf34a822c8mr181831405ad.47.1784612283559; 
 Mon, 20 Jul 2026 22:38:03 -0700 (PDT)
X-Received: by 2002:a17:903:2c47:b0:2c9:cf41:adf9 with SMTP id
 d9443c01a7336-2cf34a822c8mr181831065ad.47.1784612283062; 
 Mon, 20 Jul 2026 22:38:03 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf345111d5sm68144975ad.37.2026.07.20.22.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 22:38:02 -0700 (PDT)
Message-ID: <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com>
Date: Tue, 21 Jul 2026 15:37:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org, berrange@redhat.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l4wq34KoMStnvHIbJbHNxZ_Ni1QfUrjRtp7OQ5xLfUs_1784612284
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=gshan@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/20/26 7:12 PM, Philippe Mathieu-Daudé wrote:
> On 17/7/26 15:55, Michael S. Tsirkin wrote:
>> On Fri, Jul 17, 2026 at 02:49:53PM +0100, Peter Maydell wrote:
>>> On Fri, 17 Jul 2026 at 14:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>> On Thu, Jul 09, 2026 at 07:52:12PM +1000, Gavin Shan wrote:
>>>>> Could you help to confirm if the conclusion is to have unified qemu_ram_{copy, move}()
>>>>> for all architectures? In qemu_ram_{copy, move}(), the fixed sized accesses like
>>>>> 1/2/4/8 bytes are handled by __builtin_{memcpy, memmove}() and fall back to
>>>>> memcpy/memmove() for other sized accesses. It's basically what was proposed by
>>>>> Michael :-)
>>>>
>>>> No. __builtin_ and  memcpy/memmove are same on modern linuxes.
>>>>
>>>> I'd say as a 1st step, on x86 hosts we can do a fixed size
>>>> memmove for 1/2/4/8, on other hosts
>>>> *aligned* 1/2/4/8 bytes can do
>>>>   __atomic_store ... __ATOMIC_RELAXED
>>>> and the rest can hobble along on memmove
>>>> and hope for the best.
>>>
>>> I don't think we should be doing something that's x86-host specific,
>>> as I've mentioned previously.
>>>
>>> -- PMM
>>
>> Shrug. Of course we already have arch specific code in asm.
>> But we can make the unaligned 1/2/4/8 for x86 host a separate
>> optimization on top. They are unlikely to be common.
> 
> Note we have include/qemu/host-pci-mmio.h with s390x specific
> optimizations in util/s390x_pci_mmio.c ...
> 

Philippe, Thanks for pointing it out that s390x already had private PCI
MMIO accessors.

If Peter is fine with two variants for x86 and non-x86 architectures.
I can post (v4) for further review. That will be something like below
and let me know if there are any other improvements are needed.

----- include/system/memory.h

+/**
+ * qemu_ram_copy: copy data to ramblock
+ *
+ * @dst: destination where the data is copied to
+ * @src: source where the data is copied from
+ * @n: length of data to be copied
+ *
+ * Copy @n bytes from @src to @dst with the assumption that @src and @dst
+ * do not overlap. For x86, the fixed sized accesses like 1/2/4/8 bytes are
+ * handled by __builtin_memcpy() no matter whether @src or @dst is aligned
+ * to the access size, and fall back to memcpy() for other access sizes. For
+ * other architectures, data is copied from @src to @dst in units of 1/2/4/8
+ * bytes, ensuring proper alignment in each unit and order among the units.
+ */
+void qemu_ram_copy(void *dest, const void *src, size_t n);
+
+/**
+ * qemu_ram_move: move data to ramblock
+ *
+ * @dst: destination where the data is moved to
+ * @src: source where the data is moved from
+ * @n: length of data to be moved
+ *
+ * Move @n bytes from @src to @dst with the assumption that @src and @dst
+ * can overlap. For x86, the fixed sized accesses like 1/2/4/8 bytes are
+ * handled by __builtin_memmove() no matter whether @src or @dst is aligned
+ * to the access size, and fall back to memmove() for other access sizes.
+ * For other architectures, data is moved from @src to @dst in units of
+ * 1/2/4/8 bytes, ensuring proper alignment in each unit and order among
+ * the units.
+ */
+void qemu_ram_move(void *dest, const void *src, size_t n);
+

----- system/physmem.c

+static void qemu_ram_unsafe_copy(void *dst, const void *src, size_t n)
+{
+    switch (n) {
+    case 1:
+        __builtin_memcpy(dst, src, 1);
+        break;
+    case 2:
+        __builtin_memcpy(dst, src, 2);
+        break;
+    case 4:
+        __builtin_memcpy(dst, src, 4);
+        break;
+    case 8:
+        __builtin_memcpy(dst, src, 8);
+        break;
+    default:
+        memcpy(dst, src, n);
+    }
+}
+
+static void qemu_ram_unsafe_move(void *dst, const void *src, size_t n)
+{
+    switch (n) {
+    case 1:
+        __builtin_memmove(dst, src, 1);
+        break;
+    case 2:
+        __builtin_memmove(dst, src, 2);
+        break;
+    case 4:
+        __builtin_memmove(dst, src, 4);
+        break;
+    case 8:
+        __builtin_memmove(dst, src, 8);
+        break;
+    default:
+        memmove(dst, src, n);
+    }
+}
+
+static void qemu_ram_safe_copy(void *dst, const void *src,
+                               size_t n, size_t max_step)
+{
+    uintptr_t test, step;
+
+    /* Aligned maximal step */
+    max_step = pow2floor(max_step);
+
+    while (n) {
+        test = (uintptr_t)src | (uintptr_t)dst | n | max_step;
+        step = test & -test;
+
+        switch (step) {
+        case 1:
+            qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src));
+            src += 1;
+            dst += 1;
+            n -= 1;
+            break;
+        case 2:
+            qatomic_set((uint16_t *)dst, qatomic_read((uint16_t *)src));
+            src += 2;
+            dst += 2;
+            n -= 2;
+            break;
+        case 4:
+            qatomic_set((uint32_t *)dst, qatomic_read((uint32_t *)src));
+            src += 4;
+            dst += 4;
+            n -= 4;
+            break;
+        case 8:
+        default:
+            qatomic_set((uint64_t *)dst, qatomic_read((uint64_t *)src));
+            src += 8;
+            dst += 8;
+            n -= 8;
+        }
+    }
+}
+
+static void qemu_ram_safe_copy_backwards(void *dst, const void *src,
+                                         size_t n, size_t max_step)
+{
+    uintptr_t test, step;
+
+    /* Aligned maximal step */
+    max_step = pow2floor(max_step);
+
+    /* End of the blocks */
+    src += n;
+    dst += n;
+
+    while (n) {
+        test = (uintptr_t)src | (uintptr_t)dst | n | max_step;
+        step = test & -test;
+
+        switch (step) {
+        case 1:
+            src -= 1;
+            dst -= 1;
+            n -= 1;
+            qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src));
+            break;
+        case 2:
+            src -= 2;
+            dst -= 2;
+            n -= 2;
+            qatomic_set((uint16_t *)dst, qatomic_read((uint16_t *)src));
+            break;
+        case 4:
+            src -= 4;
+            dst -= 4;
+            n -= 4;
+            qatomic_set((uint32_t *)dst, qatomic_read((uint32_t *)src));
+            break;
+        case 8:
+        default:
+            src -= 8;
+            dst -= 8;
+            n -= 8;
+            qatomic_set((uint64_t *)dst, qatomic_read((uint64_t *)src));
+        }
+    }
+}
+
+/* x86 should work with __builtin_{memcpy, memmove}() for IO access */
+#if defined(__i386__) || defined(__x86_64__)
+#define HOST_UNALIGNED_VECTOR_MMIO_OK 1
+#else
+#define HOST_UNALIGNED_VECTOR_MMIO_OK 0
+#endif
+
+void qemu_ram_copy(void *dst, const void *src, size_t n)
+{
+    if (src == dst || n == 0) {
+        return;
+    }
+
+    if (HOST_UNALIGNED_VECTOR_MMIO_OK) {
+        qemu_ram_unsafe_copy(dst, src, n);
+    } else {
+        qemu_ram_safe_copy(dst, src, n, 8);
+    }
+}
+void qemu_ram_move(void *dst, const void *src, size_t n)
+{
+    if (src == dst || n == 0) {
+        return;
+    }
+
+    if (HOST_UNALIGNED_VECTOR_MMIO_OK) {
+        qemu_ram_unsafe_move(dst, src, n);
+    } else if (dst < src) {
+        qemu_ram_safe_copy(dst, src, n, src - dst);
+    } else {
+        qemu_ram_safe_copy_backwards(dst, src, n, dst - src);
+    }
+}


Thanks,
Gavin




