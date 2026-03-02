Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCA6EB3624
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 17:53:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx7Sb-0001mV-Nt; Mon, 02 Mar 2026 12:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7SY-0001ko-A2
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:53:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7SW-0004jz-0c
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772474011;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8btxV8nPdxJ+CM3cpxhcU/QVzEUYTpZ6jcDlRHIzDeo=;
 b=EQqc3GoUZV8jQTeMTAP3PnFYCPLm/lLyY3HII8yOCl2t+U4aOpkE/qutud9BG7TViHvsoI
 jd+dy9Qs27WwK/HZtL1KkzSLzcWHD4h5+2Kj+fMbJFf9jsVN/6qchNdkc3x8dcJTEMY680
 M6oOcAwvvAqqoiOa16pllT6cmcTbqmg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-vU7gr21VN0e-VCicQQlrkg-1; Mon, 02 Mar 2026 12:53:30 -0500
X-MC-Unique: vU7gr21VN0e-VCicQQlrkg-1
X-Mimecast-MFC-AGG-ID: vU7gr21VN0e-VCicQQlrkg_1772474009
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-483bcfdaf7dso44764065e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 09:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772474009; x=1773078809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8btxV8nPdxJ+CM3cpxhcU/QVzEUYTpZ6jcDlRHIzDeo=;
 b=C5hIC/Hg4urbqK4ejJ9smHJuukg0OmKqB0BEpLHZ158rmaqE4MdT8LLsJRaTVegQBg
 jBGPDZ5V/qdT2ODzwyRR9irNr0mmmw8VyvBfnmEjqQ9+4mCCyTC8nj6xoT0FMTI9PWrM
 glvaLxhCMgiCKRKP/vRR7ffGzXKB+APwOwv6PtxaLwr/ZHMr3wzLwdFEZYYLEOQwrmd1
 J5ziXC4e4YCsMws9nXjOdUeNwIkAP4WgDl6CToXrqHsl+JjeoYqvN0QRDK8dmfyJxZhI
 RmPRNbIIk/wREMKWsqJKlvi1yra6Bho1boNDUEER4yh/0N3fNHTebkSFOzXSWEd5ChL2
 gTcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf0k2jRRxA4gV8rEqUyqg2fnn9xU7rtzM5ytX+VsI42erBK9eaF8xyFYLH+YCABUIwgSuOvAUkDQ==@nongnu.org
X-Gm-Message-State: AOJu0YyYPTb61HorjyTmaFC3WoBC7BgGrTLfsD+OSRMyqdEl1Fg01QaJ
 G9h+lY4gNeMtMD8J5H0IQQ2uK0YGW0hy0roU5XseBZ7rLxOQmoWhYS9IftO0Y6vRNFR7HXE23Wo
 aQRWF/kjwEnt+S1WqcYFQIIzh/rXjc6rUQ6Pn/9xhJUE9fGATLMJZcg==
X-Gm-Gg: ATEYQzwR3uNISuWHwnVBECp8UpV7uCD6ycjhwvEtN4joh+N4CWYgeMd7cUXYVMfY9OE
 Cfh798AWQtTNdh6dO74LQoipAuLTvkKQEJbr6ZwplaXlBwdVHPYDsX4Gm08zjS3kgmb4RFWRj1X
 ktOrgM2S3rSAoIX2M8W2thdxm+BSKvwqFuwO1IvGKNEu4iU84zSh4SIsKcNdzgoR3TjkTvSaR0b
 Ld21SzCe7uphaZf1x3YgkDI30SdoOTMi+nBfWQSEfarGfjMZxWIlfS9vLEK8k3Job5wSblhz8nw
 CRaPa0/uiLdCoGLedSTnNFx0+llWDV4ofgfHIdMsnKPo6fJvyvq1iEah19dH8MdYo1q779uzXXt
 DYVE+dXX4Til3eyyjkpExkIKsmy5gtpfR1zjtPxzEQ2sSVnbEJUb8ZZYRByesJE49rDO0gQ==
X-Received: by 2002:a05:600c:1f91:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-483c9ba7dffmr222208875e9.1.1772474008933; 
 Mon, 02 Mar 2026 09:53:28 -0800 (PST)
X-Received: by 2002:a05:600c:1f91:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-483c9ba7dffmr222208525e9.1.1772474008452; 
 Mon, 02 Mar 2026 09:53:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b44207sm312457385e9.7.2026.03.02.09.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:53:28 -0800 (PST)
Message-ID: <b6c17396-be09-4497-8dd1-8f66d9c2fe63@redhat.com>
Date: Mon, 2 Mar 2026 18:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 19/31] hw/arm/smmuv3: Fix CFGI_CD handling when stage-1
 is unsupported
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Tao Tang <tangtao1634@phytium.com.cn>, Mostafa Saleh <smostafa@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101733.2995020-1-tangtao1634@phytium.com.cn>
 <aaGu5v0To65M5LkB@google.com>
 <585be3ce-d5f3-455a-a7fb-3181920cfc60@phytium.com.cn>
 <3cff6489-e487-4f7b-b2ea-984fb5379ed9@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <3cff6489-e487-4f7b-b2ea-984fb5379ed9@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QczN41iWxCNfo9oirYDFaaG_FAFIn6rtk6zE4su4uCQ_1772474009
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 3/2/26 6:47 PM, Pierrick Bouvier wrote:
> On 3/1/26 4:33 AM, Tao Tang wrote:
>> Hi Mostafa,
>>
>> On 2026/2/27 PM10:49, Mostafa Saleh wrote:
>>> On Sat, Feb 21, 2026 at 06:17:33PM +0800, Tao Tang wrote:
>>>> Add a STAGE1_SUPPORTED check in the CMD_CFGI_CD and CMD_CFGI_CD_ALL
>>>> path
>>>> and return CERROR_ILL when stage-1 translation is not implemented,
>>>> matching the architecture requirement (IHI 0070G.b, page 176).
>>>>
>>>> Fixes: 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")
>>>> Signed-off-by: Tao Tang<tangtao1634@phytium.com.cn>
>>> This is a separate fix, it can be sent standalone to make this series
>>> smaller, similarly the first patch.
>>
>>
>> For #1, #2 and #19 commit (this one), since I’m not fully sure about
>> the expected process here, should I resend these already Reviewed-by
>> fixes as standalone patch respectively right now,  and try to get
>> them merged first?
>>
>
> If a set of patches is fully ready, you can always put them first in
> next version, and ask the maintainer to pull this one.
> If your current series needs them to build, I usually prefer to keep
> it all together, instead of having two different series, and using a
> Based-on tag. But it's a personal preference, some people prefer to
> see several series. 
Either, either send them in a separate series or put them at the
beginning. We are approaching the soft freeze so maybe a separate series
would be better.

Eric
>
> Regards,
> Pierrick
>


