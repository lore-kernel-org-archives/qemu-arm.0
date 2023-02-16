Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp676938ejb;
        Thu, 16 Feb 2023 08:51:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8n2GIXU8Ny2hf8rhL9/1zra7EuQ05CkGWY0UNxAd7RcMJ9qmoKTxV4rz2qNQNXh4chD2MO
X-Received: by 2002:a5d:5191:0:b0:2c5:a6c4:7fd3 with SMTP id k17-20020a5d5191000000b002c5a6c47fd3mr217387wrv.8.1676566302997;
        Thu, 16 Feb 2023 08:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676566302; cv=none;
        d=google.com; s=arc-20160816;
        b=1GFMZDo/GWnXObwZQp6ViUqd5NAMzOa+oYqGKOv5HlimMEt9ih15QrMmfWhDFirjsv
         S+Q3uOo3PVR728NvJxJ79X3mKT/HcoDGbKdgbNTJSchglD60M88a4q7pkwH8sKxpc/5I
         GQvazwbJ1x4ub6ffkdydV4f/kLkEfpIOtRwG1UXSKXOXJ9gujFkN7aev3ZaMid3lFNdX
         27hjECrPgzaJei0dsdCHrvKdB68EbmrZ+nkybvYoIiuadZZ3Sij9i/SOzIOylxtwx13Q
         5NWM0zNPnUFv57XuiD8WsmFCg3T7+/Giq6Ghc6VnaA02jaZywDKzF5fLznrLbays3A0e
         um6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n8KsWrEz7/lDVeWmi5VtQequBjBFbkqoGjfsEL1wfrY=;
        b=N2o20s8Fix929pchT7EaP39ulGPip37cgKm4DrDXMk2m1wU70+I72HR+cafMLZ3OuG
         E7gbCnIOFg68PJGjz5lkRTtNYGq4y+A0uoUnaR4UcbhBT+mPkKlwUFtLTGdnUxIilk2l
         yTLsbE42EoOffjs/f/8p1AowfnTdB2hrsfbgV5Hz2LcYK6ZU0eJu9C1pUxvx6ebPjssP
         1Ufa9Uz7YmKjo7NF7FYhC1Py4o+3ADlRCG1rseLsbS5fPUhx6CdL3FU5l5i6REl6dBig
         XMlGG7SbD4wFriVLilWflIJrPXFfe/i6CEPgGoxZzLEn471C9wk4yLWxGzT3QPWh8kEN
         OWRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RL9hMimX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020adfef43000000b002c54dbb8a0asi2057516wrp.48.2023.02.16.08.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 08:51:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RL9hMimX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pShTS-0001Ti-5K; Thu, 16 Feb 2023 11:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShTQ-0001Rv-LP
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShTM-0005ji-Ck
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566263;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8KsWrEz7/lDVeWmi5VtQequBjBFbkqoGjfsEL1wfrY=;
 b=RL9hMimXSFI5/JEfafK9IvXWfsZcceH/v6wLrQnc+ymiLUJi0bFuryU0gm9SSB7pc4NKtH
 7UoOUQdDy01A7RlGjvo+FEfSffNI6AKekxIp6FbCAO/5mslxfrPEovmTIEj/0DW77/eZt9
 Kx062dT14wKol24cT5n9CdhZUI/VGOs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-2scsZi74NEGpDT2Sha1wOA-1; Thu, 16 Feb 2023 11:51:01 -0500
X-MC-Unique: 2scsZi74NEGpDT2Sha1wOA-1
Received: by mail-qv1-f72.google.com with SMTP id
 gu10-20020a056214260a00b0056c2005684aso1385418qvb.23
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 08:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8KsWrEz7/lDVeWmi5VtQequBjBFbkqoGjfsEL1wfrY=;
 b=375dy4aruJO2PzKLALFFVBSMH0ryXr85ZfQe8d7VLxbIGG5yXez//5kDDFp/n6ZzYY
 SwHU0tzXwsBUrEnoL3pU8gGb+s9g7+QC8fqC0nb6P3HctfkQHerNcYBHc+UBWfvXK//3
 5cFKfHwPkqqy4XpoRi0rRRTX5bLjBBJEwQ+7UFAXl5obg4NAWMwrTgY0aYhE5crQ2YFV
 UJREcglHp/sbCi4e3xOBveeh9i14x9ToBcgsSSlfI2mnU7pbB++TBjpy/2BsWPyWZSn0
 tLR4D9Iiy6WC5+R2NrSyvziLSv+uTe3x7T9EnzrBqEu9SCWdlR0fENQYiGtuU1zKR2q0
 JM7w==
X-Gm-Message-State: AO0yUKUtd3zIWQhBBlaeQnJKhgQVIblFFjBJvxBMGq2otnUruY9gCe8L
 mI++jdXZaJpbhJYiNKH8XFJJlwxO+FYDqqmaT8fe5X5OPyxKzYdG1ObrLXnidmDT9JIKiU+UV9e
 METugxoGoUINC
X-Received: by 2002:a05:622a:1911:b0:3b9:bf43:fccd with SMTP id
 w17-20020a05622a191100b003b9bf43fccdmr11300125qtc.10.1676566261449; 
 Thu, 16 Feb 2023 08:51:01 -0800 (PST)
X-Received: by 2002:a05:622a:1911:b0:3b9:bf43:fccd with SMTP id
 w17-20020a05622a191100b003b9bf43fccdmr11300104qtc.10.1676566261180; 
 Thu, 16 Feb 2023 08:51:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d17-20020ac800d1000000b003b9b8ec742csm1560040qtg.14.2023.02.16.08.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:51:00 -0800 (PST)
Message-ID: <bb8081f2-d816-c198-02cf-cf00d3b54fcd@redhat.com>
Date: Thu, 16 Feb 2023 17:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 05/16] hw/arm/smmuv3: Add page table walk for stage-2
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-6-smostafa@google.com>
 <4e248ff8-3032-0697-d50c-d3b62b072a82@redhat.com>
 <Y+4rDVGJdhnN+p9z@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+4rDVGJdhnN+p9z@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1dfjQdPFsjKN



On 2/16/23 14:09, Mostafa Saleh wrote:
> Hi Eric,
>
> On Wed, Feb 15, 2023 at 05:52:39PM +0100, Eric Auger wrote:
>>> In preparation for adding stage-2 support. Add Stage-2 PTW code.
>>> Only Aarch64 fromat is supported as stage-1.
>> format
> I will update it.
>
>>> +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
>>> +        uint64_t mask = subpage_size - 1;
>>> +        uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
>>> +        uint64_t pte, gpa;
>>> +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>>> +        uint8_t ap;
>>> +
>>> +        if (get_pte(baseaddr, offset, &pte, info)) {
>>> +                goto error;
>>> +        }
>>> +        trace_smmu_ptw_level(level, iova, subpage_size,
>>> +                             baseaddr, offset, pte);
>> I can the trace point names should be updated as well (and
>> differentiated between S1/S2)
> I was thinking we could leave those with stage argument, and only
> update trace_smmu_ptw_level to have stage argument as the others.
yes as far as the stage is properly populated that's fine.
>
>>> +        if (is_permission_fault_s2(ap, perm)) {
>>> +            info->type = SMMU_PTW_ERR_PERMISSION;
>> don't we have to different S1 versus S2 faults?
> Yes, I missed that, I see setting info->u.f_walk_eabt.s2 should be
> enough, this will set the S2 field in the fault event.
>
>>>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>>               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>>>  {
>>> -    if (!cfg->aa64) {
>>> -        /*
>>> -         * This code path is not entered as we check this while decoding
>>> -         * the configuration data in the derived SMMU model.
>>> -         */
>>> -        g_assert_not_reached();
>> if that's still true for S2, maybe keep that check here upfront?
> Stage-2 is checked in STE parsing and throws BAD_STE if not aa64,
> which I believe is not correct, however I think we can just call
> g_assert_not_reached() during STE parsing, I don’t see added value for
> saving this field in SMMUTransCfg if we don’t use it.
I agree. I guess we provisionned for this field in the prospect of
completing the emulation but I don't think we care.
> I am not sure why this check exists for stage-1 as it is hardcoded in
> decode_cd anyway.
>
>>> +{
>>> +    uint64_t ret;
>>> +    /*
>>> +     * Get the number of bits handled by next levels, then any extra bits in
>>> +     * the address should index the concatenated tables. This relation can
>>> +     * deduced from tables in ARM ARM: D8.2.7-9
>>> +     */
>>> +    int shift = (SMMU_MAX_LEVELS - start_level) * (granule - 3) + granule;
>> can't we factorize anything with the S1 PTW?
>> indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
> Yes, I think we can refactor some of these in common functions/macros, I
> will do that in v2.
I guess that's a trade-off between beeing close enough to the spec and
maybe its pseudo-code and having both S1/S2 codes looking similar.

Eric
>
>
>>> @@ -28,6 +28,7 @@
>>>  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>>>  
>>>  #define SMMU_MAX_VA_BITS      48
>>> +#define SMMU_MAX_LEVELS       4
>> can't this be reused as well with S1 PTW?
> I believe yes, I will update it.
>
> Thanks,
> Mostafa
>

