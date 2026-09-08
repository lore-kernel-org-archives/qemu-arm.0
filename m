Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DC1C79FA0
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 06:19:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3pAo-0007s3-3p; Tue, 08 Sep 2026 02:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x3pAm-0007rC-Mg
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 02:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x3pAk-0001GJ-Mg
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 02:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788848349;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0T3xijVwPeIofuPLfUEfHiuVMWntumGFt1iH7RkloA=;
 b=T8SYxEibrRTKu0jjMfYjwycd1vgYAqpxRR6cGWWB09p2K1ak8dcOvK6rtNZ4KDLrJ/hTct
 8us7Tpufu32Vipl7AuT9NgwQBLcYVsxbbFYnmCyvcrQgw7Jv6PTrCcotZTOQyAKZZo0Nk+
 B9gMGBI2yXuTyaEh4yO81bmpjNjBVKI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-gG2BNyW3P0aTsDzeu_LMkA-1; Tue, 08 Sep 2026 02:19:08 -0400
X-MC-Unique: gG2BNyW3P0aTsDzeu_LMkA-1
X-Mimecast-MFC-AGG-ID: gG2BNyW3P0aTsDzeu_LMkA_1788848347
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49d1a778b9dso4282895e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 23:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788848347; x=1789453147;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F0T3xijVwPeIofuPLfUEfHiuVMWntumGFt1iH7RkloA=;
 b=ciKgCUqQtGj4GrvFbMgjA+j76aJ73NG5ZcwZwy/4xZh/J7j5r49qvsHcuRTGzFe2RQ
 07myGgzA5cHeLoJdnUxJ6mVuArxX/CjiKYtJt8Hw4wr/PAEazE/r1xv9pDxLBeOXVFxw
 e8uLkAZaKg/lx4LGWBSUHnJX8gtGBX7pFYVA0/vz5Uxha9w8AYEDGhLmXo6Yabw9zPcJ
 cSPD0YbJulOmQ1megJVUr8cuRDwkFnx1TYW4vJxd0x2xa6LtVVyPDIUvOJWApAhkBvAn
 wY54zLf9V/nu7tMgqSfdCAfHdAyjZ4IXMrvpXsOQZk0ryb8aIga3ZoKBigOOD7BVkFY9
 M1bA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtNGOtYqcwcGdxoL08/6XL3q/xyktN+wneFCcYZtjlurscGyDefRtRIGfdIumwnYb6k5BbeyhVcg==@nongnu.org
X-Gm-Message-State: AFuF++kWjRGD5x+3V4VIDo9ENc0AfBtGDmbt9utGiwXRH6UInxajOtRa
 4MAehBOOeZnRF7pcyK5S9jtCV1Y2AYsFNrP32LUPTdGJjJJTnz1gpv7iGPUNENaFbWa9JE2OfOx
 M7wczU56FRMc6m7JrM0brWzEwDbs4ech5MQvBTjNFqym1TQqHRLGL7w==
X-Gm-Gg: AYBFou2cGIakRn+rNpr+5zbZ2XSZW8DdfLEGnvuonpaful4Q7qiWqi5XAQFV1eXzqa8
 b0A6CBwKwfKAOzptlKioNHJQ1/mS44XnHFg9gYqQ7u6JF++5gC3WNeb83+cXgCfkQgtVEl12Alh
 ZtTzaOIzoc/5Gl1sxup2E+CVQjr9u2g/qMFYRQTeaQk4ttSZE4Gn3YWAcIMauTVCbVeahZZbGak
 hDRqXYR+hhKq+VuKY1yO/doAjV4KaYQjzcThAYjNBLEir7Rc/DRba2W+j11+nUJXqpBR1rn5xmm
 eD1y3GkKJjOIu4ivdckFcdFJ2ICUMGnBEn7IiEonVO8xWpxUtw0EqRMLfnL8If1e0Q9/Mlqv/gm
 O+FFFZi2jJZQgPSXHveg4nPgtFxPsjkE97dlgZXhGyZJkxlW6
X-Received: by 2002:a05:6000:4b11:b0:485:8313:9f47 with SMTP id
 ffacd0b85a97d-48587055d09mr57076650f8f.10.1788848347129; 
 Mon, 07 Sep 2026 23:19:07 -0700 (PDT)
X-Received: by 2002:a05:6000:4b11:b0:485:8313:9f47 with SMTP id
 ffacd0b85a97d-48587055d09mr57076586f8f.10.1788848346760; 
 Mon, 07 Sep 2026 23:19:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bbb51sm35441045f8f.30.2026.09.07.23.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 23:19:05 -0700 (PDT)
Message-ID: <ead3ab07-cb29-4389-9a09-01ecdb6a46e3@redhat.com>
Date: Tue, 8 Sep 2026 08:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 07/28] hw/arm/smmuv3: Reject secure STEs with stage-2
 enabled
To: Tao Tang <tangtao1634@phytium.com.cn>, Mostafa Saleh <smostafa@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-2-tangtao1634@phytium.com.cn>
 <apbanfZIyTlA5fvk@google.com>
 <95e020f7-cb10-47d1-82b8-4bef59959141@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <95e020f7-cb10-47d1-82b8-4bef59959141@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2G-jU9axhWLCYTiD7n60AB_XwfGIU-_nj2uv3nJdFSA_1788848347
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/7/26 12:25 PM, Tao Tang wrote:
> Hi Mostafa, Eric,
>
> On 2026/9/1 22:01, Mostafa Saleh wrote:
>> On Fri, Aug 14, 2026 at 12:24:43AM +0800, Tao Tang wrote:
>>> Pass sec_sid into decode_ste() and treat a secure STE that enables
>>> stage-2
>>> translation as an illegal STE.
>>>
>>> The current model does not implement Secure stage-2 translation, so
>>> reject
>>> Secure STE configurations that enable stage 2 and report BAD_STE. This
>>> restriction can be relaxed when SEL2 and Secure stage-2 support are
>>> implemented.
>>>
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> ---
>>>   hw/arm/smmuv3.c | 12 ++++++++++--
>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index b5dc67dcb01..3ff2f498a3b 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -597,7 +597,7 @@ static void decode_ste_config(SMMUTransCfg *cfg,
>>> uint32_t config)
>>>     /* Returns < 0 in case of invalid STE, 0 otherwise */
>>>   static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>>> -                      STE *ste, SMMUEventInfo *event)
>>> +                      STE *ste, SMMUEventInfo *event, SMMUSecSID
>>> sec_sid)
>>>   {
>>>       uint32_t config;
>>>       /* OAS field only presents on NS-IDR5 so we use hardcoded
>>> SMMU_SEC_SID_NS */
>>> @@ -651,6 +651,14 @@ static int decode_ste(SMMUv3State *s,
>>> SMMUTransCfg *cfg,
>>>           if (ret) {
>>>               goto bad_ste;
>>>           }
>>> +
>>> +        /*
>>> +         * It is ILLEGAL to set STE.Config == 0b11x according to
>>> (IHI 0070G.b)
>>> +         * 5.2 STE, Stream Table Entry, Page 218.
>>> +         */
>> This is not the latest spec, and there is no need to mention the page.
>> It might be more clear to mention that Qemu doesn’t support secure
>> stage-2 rather than say it is ILLEGAL.
>
> Agreed. I'll change the comment to say that the model does not support
> Secure stage 2 translation, and remove the spec version/page
> reference. I'll also clarify SMMU_S_IDR1.SEL2 in the commit message.
>
> @Eric, I've replied to your questions about the S2 plumbing and the
> temporary SEL2 override in the threads for patches 6 [1] and 28 [2].
>
> [1]
> https://lore.kernel.org/qemu-devel/2a6ae5cc-9e6e-4d5b-93f7-c2ecc0faa25c@phytium.com.cn/
> [2]
> https://lore.kernel.org/qemu-devel/ba9005ea-5616-495f-b817-5d90b4ce1ca0@phytium.com.cn/ 

OK thanks!

Eric
>
> Best regards,
> Tao
>


