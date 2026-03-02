Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCA2EB3625
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 17:22:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx6xt-0002Ni-JI; Mon, 02 Mar 2026 12:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6xo-0002MK-KC
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6xj-0008My-LF
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772472102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYuQaBQKmKpptShZmttOMxP6leM89UxHwHwhaRw/ylI=;
 b=BnMwGtHP/afXgvHsA1pYF4QyOLZ/Yl1qW3bxvoN4aBJyZv7vNisoFe+jP8Nf4nZLMEoAsv
 32Zygmp5NANZDtBxOITs7jyKR+vF2hU8fLsNd6aw0gD4wNCg86Oz7EgtAn3BoMTuAjaWMa
 XyaW5o9cAiPSmvFOUbdD/mKqwC3QKxk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-el8eZQALMzibA9ABqmzF5Q-1; Mon, 02 Mar 2026 12:21:41 -0500
X-MC-Unique: el8eZQALMzibA9ABqmzF5Q-1
X-Mimecast-MFC-AGG-ID: el8eZQALMzibA9ABqmzF5Q_1772472100
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-389ff6e5b5cso37285661fa.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 09:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772472100; x=1773076900;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MYuQaBQKmKpptShZmttOMxP6leM89UxHwHwhaRw/ylI=;
 b=H7RPDVDTllgxIwvEtHP4aMOEcTr0KbJ8AEnAo9VM0R8kJy6d68/fXH4H/nAMJszRMg
 pFPGmpPYtdV7CpO1WF7oF1bS4BGRWA4JvXV7DQkwYBzdVrU7DohatMx0EXHw9mhNXnPq
 sqMj2lkZ0CbEGqgOQKepi8pvF/25l5a7eu8++aduUpP+L8Nrw/ru4wgx6tXYyrX0fRMr
 B2m8G5BQNUiDS64yk0cyXu7AId5pzG9Qcj4Kd+VdJWgnCIN/Vrdvj20yMx3v71qmPlHf
 Qlso3iJ12kfnJdFjmsllEVZ56ZvMgmEn2D9y/6+xZdhAw3uzAtHhz1q5lcUAXxHkBIfu
 E7ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5d3Lro+cupk6YQywFn34YDU8+Z2Sex+Yap+QkaaHWlXhgrdCDIdcZXyf1tWOmLQHk5+BdVu2ZBg==@nongnu.org
X-Gm-Message-State: AOJu0YwXNq6Gu4LHl2jSY8qExxKDdTgQWmBptqQlLYnt6tqLIfc0Rna/
 RSJr9O/6AStqZxTDCSWIBH5oYZvtipCS5i5OfxssV9YViDEfFYbt9OZvICFRkGl1OevdPwX90YM
 83T9kWjKf6FG3lvDAR7sl2EJ32bhWKMP4jAAP1nqdbWfSadyMqZRWLw==
X-Gm-Gg: ATEYQzx8sSEuwR2ImLZ7NBPniybz6oxB7Y+Wpz4+Pl11jr+x4Lxi0oc/ihhxIMCDrqb
 Ar7L1kLxAT3K+5q/5rDGqnpMfk27ADKI1baXDSuxhrcT48gZ8dZbXLX9xI7Zi7OyRmZXkRd6/jf
 yIuBoFBH7D81sir72uw1FUWUTfT3MUpIEUmNnDA+lokLHBkl010/z8cut24N6s0lDwhi3WxKcfY
 tmzRAVloh+tF7KgfFXoKdtHI4qKvUlZUo71Y8foBrUNYf06BWsP8vJMEwUn4axJ0SNnQgzXsAvi
 kdsrauoKb1UzYjWmygr34zsFCZSPY7+lkfU8nVT5Vd0V2y6p1eEi8zNhXgOL/kZf3V/cF/JiJvQ
 3dhLalQNJZ9eskguRt/UZs3X4+DF4+CdSGK2smwaF45jabIBWlSncS/CcrdBAD2MZJRDT8Q==
X-Received: by 2002:a05:651c:4413:20b0:37b:a30e:fe1e with SMTP id
 38308e7fff4ca-389ff1456c9mr75766501fa.18.1772472100045; 
 Mon, 02 Mar 2026 09:21:40 -0800 (PST)
X-Received: by 2002:a05:651c:4413:20b0:37b:a30e:fe1e with SMTP id
 38308e7fff4ca-389ff1456c9mr75766241fa.18.1772472099559; 
 Mon, 02 Mar 2026 09:21:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12356ffa5sm23262e87.82.2026.03.02.09.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:21:39 -0800 (PST)
Message-ID: <b3a39d4a-566e-44a4-9831-fa7169f69b33@redhat.com>
Date: Mon, 2 Mar 2026 18:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 12/31] hw/arm/smmuv3: Store CD NSCFG in TT info
To: Mostafa Saleh <smostafa@google.com>, Tao Tang <tangtao1634@phytium.com.cn>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101632.2993305-1-tangtao1634@phytium.com.cn>
 <aaGtANCP87L-_gtp@google.com>
 <2c1c08fe-ddd2-47a9-9e9a-4a900df60bae@phytium.com.cn>
 <aaVk0PuTAUkryPLb@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aaVk0PuTAUkryPLb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P6YA8p2h_PH6xgQpbyHeLX8TPsJmvK33_P1MB-tNTBY_1772472100
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/2/26 11:22 AM, Mostafa Saleh wrote:
> On Sun, Mar 01, 2026 at 10:21:55PM +0800, Tao Tang wrote:
>> Hi Mostafa,
>>
>> On 2026/2/27 PM10:41, Mostafa Saleh wrote:
>>> On Sat, Feb 21, 2026 at 06:16:32PM +0800, Tao Tang wrote:
>>>> With NSCFG definitions in place, record the per-table NSCFG bits
>>>> in SMMUTransTableInfo during CD decode for later use.
>>>>
>>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> I feel this patch would be better squashed with how it’s used,
>>> but no strong opinion.
>>
>> I split "definition" vs "usage" here because Eric suggested keeping plumbing
>> changes separate in previous series.
>>
> I don't have a strong opinion, you can keep it, if Eric is ok with it.
> I was just looking for ways to keep this series shorter.
No strong opinion either. assuming this nscfg field is used in
subsequent patches, I find it easy to review it separately.

I prefer to have a big series with simple logical and functional changes
(that better fits my mind) rather than a small one with intricate patches. 

Thanks

Eric
>
> Thanks,
> Mostafa
>
>> That said, I don’t mind squashing this into "hw/arm/smmu-common: Implement
>> secure state handling in ptw" in V5, since it’s effectively a one-liner and
>> will make the series smaller.
>>
>>
>>> Thanks,
>>> Mostafa
>>
>> Best regards,
>>
>> Tao
>>


