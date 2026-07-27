Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702ECC531F9
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 03:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woCAv-0003kV-Pp; Sun, 26 Jul 2026 23:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1woCAu-0003kA-LU
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 23:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1woCAs-0007gq-Sh
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 23:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785123522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jndRUkDoyH4ei88MUf2FDkYiemr+D9R56UoNodJWPjM=;
 b=P+VRvNMEOu4/2SmrtXAci7QUbOwqJkpeD5SvAxHZe295SFWWHspgj2pvLT6ucyNSTdBBlD
 wpGeqhzR9sCuhC2Dv3KYRtbC5jRrcfB/YR119bebfwc6Lre6BQXcdSM1aFXk+YRHrLCAVo
 RS9vpv1zjPoNprOv3oHeOwTvVykoQho=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-MoiU2mvpNYio0cli-4Lyow-1; Sun, 26 Jul 2026 23:38:40 -0400
X-MC-Unique: MoiU2mvpNYio0cli-4Lyow-1
X-Mimecast-MFC-AGG-ID: MoiU2mvpNYio0cli-4Lyow_1785123520
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38edd45cbc4so2616086a91.3
 for <qemu-arm@nongnu.org>; Sun, 26 Jul 2026 20:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785123519; x=1785728319;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jndRUkDoyH4ei88MUf2FDkYiemr+D9R56UoNodJWPjM=;
 b=Mxlub9H629kz9mXX8aDmYplgGBctQNkY4b1XfmoeNWJ4z5niQAfF3bLa3Lu6Ym4Bka
 zLTUHicGKWofVW1Lha1PbfjFwM5dt69zW/j7L4Vl3mYhupj1ktBcWOhVfRJH/9GLJPgU
 E9VEw+Qh9RwoBOd9nGvk3Ey24i6GcvwHVVpyTwxWQi7SacBoW6Ktc069zYBT2QNO/y6R
 Jq5sIIRcLkwVUm5O+77+snrSv/9tebdnvg3m1SzjKE6NGRqi9qeXWm9c8X7XFic3hY2l
 3TuEYuC0a9RivJ96jkPtPXjbEeXGj9Rnrn8l/JT/5NL/V3CJQIROmfUFv1sYDZ/3qdZm
 wp1A==
X-Forwarded-Encrypted: i=1;
 AHgh+RplOGFG6+a8gbwUKb7RDnvd1AnwdU1LVf+iMYNwON9djXzSjxTmKGt8EU7zvIaAJrMki/wCKkF1yA==@nongnu.org
X-Gm-Message-State: AOJu0Yy3f05nPwmjxEvHL42rFK0Jv1GaQLVjulJTT378nP1qXb3zrfBV
 bpZdqnUWzjaNqaYnlH7s/07bBaJK/vGGB3kTJMnOyepjna3lQRLZcr8Mq5vGOlUOEVpxUVqZxUb
 6L2vAUpIRXuEic6c2YFV9EEsiAvPF7JAy7rlA+KHQDEOsxueI91j6xA==
X-Gm-Gg: AR+sD12tzLkr1lkbZdWNGW14Fy/sd8OKN7fWpmEpb1rwbVg7Fr9g5WyqvYuO+sPry8Y
 mBCos2aObSOI+dO5C05uXxKBzsmrKpDJgsAPItuc64dnp0AXBOKRigRVPL1ARMu2NVHb72RkqHy
 vfi5nZepWLkaDPGfDtvkyY/zCCN55FhDAcqD/Av31W7CfUB6L2UkY4nRKmur0dyqIlY1dI1d39r
 ZFQp7oWRAG6mgV4bPsNMt+DhsP0m/umsLR8PlN9F20JmvP6DSax4+JbB5fKewATCnSzXahYbgkq
 vvsHRTYVO88aAznDgeIlPVi+bAZGQ8ZJE3Kh9C3RABGFb0Wx3xp2+2AuRmhc/OoYq10nopVyjHI
 Jlcd4MoNJt79LoyCtnYVLDik56k57zBcSJy26J6CscOo=
X-Received: by 2002:a17:90b:4d0c:b0:38e:11ba:992c with SMTP id
 98e67ed59e1d1-38f293cd1dbmr6678634a91.12.1785123519552; 
 Sun, 26 Jul 2026 20:38:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0c:b0:38e:11ba:992c with SMTP id
 98e67ed59e1d1-38f293cd1dbmr6678618a91.12.1785123519083; 
 Sun, 26 Jul 2026 20:38:39 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f0563c369sm2768251a91.0.2026.07.26.20.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2026 20:38:38 -0700 (PDT)
Message-ID: <c69250a2-e461-4484-ae66-80767744e6fb@redhat.com>
Date: Mon, 27 Jul 2026 13:38:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org, richard.henderson@linaro.org,
 berrange@redhat.com, philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
 <20260722015422-mutt-send-email-mst@kernel.org> <amDyvgR09OJssENX@x1.local>
 <20260723015708-mutt-send-email-mst@kernel.org>
 <71d88d00-5b41-49d2-b649-8a6ea47abc4d@oss.qualcomm.com>
 <20260723045428-mutt-send-email-mst@kernel.org> <amIbUYN3teCLXTh-@x1.local>
 <b05b40b1-fffd-4be5-9289-b5bc92c16cd2@redhat.com> <amNvIMizFp7Au2c3@x1.local>
 <20260724122956-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260724122956-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XnxGqI-jxSfLG_o_3hNhBBIqqyzV5g8lq8CG051tids_1785123520
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

On 7/25/26 2:31 AM, Michael S. Tsirkin wrote:
> On Fri, Jul 24, 2026 at 09:56:48AM -0400, Peter Xu wrote:
>> On Fri, Jul 24, 2026 at 11:42:09AM +1000, Gavin Shan wrote:
>>> On 7/23/26 11:46 PM, Peter Xu wrote:
>>>> On Thu, Jul 23, 2026 at 05:05:08AM -0400, Michael S. Tsirkin wrote:

[...]

>>>> We should have another option that is not arch-dependent but keep the
>>>> unaligned behavior.
>>>>
>>>> For current master, AFAIU we do unaligned access for both ram_device and
>>>> rest. Say, even with ram_device_mem_ops, it has both .unaligned=true for
>>>> both .valid & .impl.  I think it means indeed we have unaligned behavior
>>>> even for ram_device.  It also means what matters in regards to the Realtek
>>>> bug was only about aligned access (with subpage presence).
>>>>
>>>> I think it means we can always keep unaligned to stick with
>>>> memcpy()/memmove(), but only use atomic ops for the aligned cases of
>>>> 1/2/4/8.  With that, I think we can also remove ram_device_mem_ops and fix
>>>> the bounce buffer issue.
>>>>
>>>> I think it means we'll stick with memcpy()/memmove() for all archs for
>>>> unaligned, which is again not safe... but that can be an existing but
>>>> separate problem to solve too.
>>>>
>>>
>>> Lets see if Peter Maydell and Michael are happy with this option. At least,
>>> we will have unified qemu_ram_move() for all architectures with this option.
>>> Note that qemu_ram_copy() won't be needed.
>>>
>>> I'm putting note on what's to be done in (v4) if this option is to be picked
>>> up. Let me know if there are missed points. It's basically combing what's done
>>> by ram_device_mem_ops to upper layer (e.g. in qemu_ram_move()).
>>>
>>>    address_space_write
>>>      address_space_to_flatview
>>>      flatview_write
>>>        flatview_translate
>>>        flatview_write_continue
>>>          flatview_write_continue_step
>>>            memmove                     // (A) to replace it with qemu_ram_move()
>>>
>>> /**
>>>   * qemu_ram_move: move data to ramblock
>>>   *
>>>   * @dst: destination where the data is moved to
>>>   * @src: source where the data is moved from
>>>   * @n: length of data to be moved
>>>   *
>>>   * Move @n bytes from @src to @dst with the assumption that @src and @dst
>>>   * can overlap. The access is atomic if the source and destination buffer
>>>   * aren't overlapped for a well aligned and small-sized access. Otherwise,
>>>   * fall back to the standard memmove().
>>>   */
>>> static void qemu_ram_move(void *dst, const void *src, size_t n)
>>> {
>>>      uintptr_t test, len;
>>>
>>>      if (src == dst || n == 0) {
>>>          return;
>>>      }
>>>
>>>      /* Overlapped buffers */
> 
> 
> overlapping
> 

Corrected in v4.

https://lore.kernel.org/qemu-arm/20260727032649.145381-1-gshan@redhat.com/

>>>      if (src < (dst + n) && dst < (src + n)) {
>>
>> s/&&/||/?
>>
>> It's a bit weird to request memmove() for overlapped, e.g. I don't know if
>> P2P can overlap too when some fuzzer fills in some MMIO address shifted for
>> src/dst.. but I think I get what you want to simplify and it looks fine.
>>
>> Otherwise it looks good.
> 
> Why do we bother special casing overlapping buffers though?
> I do not get it, looks like rest of logic works exactly
> the same for overlapping and non.
> 

Indeed. The explicit check if src/dst are overlapping has been dropped in v4.

>>>          memmove(dst, src, n);
>>>          return;
>>>      }
>>>
>>>      test = (uintptr_t)src | (uintptr_t)dst | n;
>>>      len = test & -test;
>>>
>>>      /* Unaligned or oversized access */
>>>      if (n > 8 || len != n) {
>>>          memmove(dst, src, n);
>>>          return;
>>>      }
>>>
>>>      switch (len) {
>>>      case 1:
>>>          qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src));
>>>          break;
>>>      case 2:
>>>          qatomic_set((uint16_t *)dst, qatomic_read((uint16_t *)src));
>>>          break;
>>>      case 4:
>>>          qatomic_set((uint32_t *)dst, qatomic_read((uint32_t *)src));
>>>          break;
>>>      case 8:
>>>          qatomic_set((uint64_t *)dst, qatomic_read((uint64_t *)src));
>>>          break;
>>>      default:
>>>          g_assert_not_reached();
>>>      }
>>> }
>>

[...]

Thanks,
Gavin


