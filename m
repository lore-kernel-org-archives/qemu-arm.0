Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84DED4660A
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 17:49:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgRS7-0001h9-AR; Thu, 15 Jan 2026 12:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgRRf-0001St-L5
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgRRb-0007Ni-DM
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768499258;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oIPbPyKo0LM7b/44liJmIiPppv77sNpTIw2vKZtNUw=;
 b=hUPLC1H6prx97AEavuync7gs18dLB6PnU5EwWlLplRu9FIU3jV5iusdtUSEO//6mNtr3tC
 M9WZA1LEQ+gsAGC+sk50dGsOJeOmQQx1sGGPmNdsqDdxh1Ta+HgUdJtfStFAdZzAffxXM1
 YhLf3DmZ+sBEKzs955XNGDPn1t3Af2Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-AeCUJdCfNyuhu357-4cUhw-1; Thu, 15 Jan 2026 12:47:35 -0500
X-MC-Unique: AeCUJdCfNyuhu357-4cUhw-1
X-Mimecast-MFC-AGG-ID: AeCUJdCfNyuhu357-4cUhw_1768499254
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42fdbba545fso1358447f8f.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 09:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768499254; x=1769104054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oIPbPyKo0LM7b/44liJmIiPppv77sNpTIw2vKZtNUw=;
 b=RV2IKr0wPwtZYGsST0SkqrYEuBPzbLp1A+xE96vvQpymZozaEEBKgtZmnX7ZKspsoT
 MGg+LVRwuJeUYW1yOrsfhEnQOAsDBYUrZk2APGvsmM+LPt88tlO1UHerMRC3HBX8XLVN
 72//u49O0A+x98kWANdCThA2UmOLyE01wOH/wx9Vkrt5hVou8j6eqw3PldKKDV2+0YcZ
 fqwJ191ZVPnuclbSe8tvGETHnCOp3MlcjefR0kutO+eik9UEc2EZd+pSObxeRs7yWNWF
 EbPoUqtco6X7Fxwri97CEMPMQc1lkyD2Ty9jkw46sbLOyt5bDULYdTvvMKJ5Jx5d15w4
 ACKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYlcW2n3skw7w/gy0A2vzcaoSB97IU1wdjhLeQHHBBTlQNN+8vOCer8OiHUHy/c3/I7J6IzncQbQ==@nongnu.org
X-Gm-Message-State: AOJu0YxrYtlPI3tzdTD860AEd3ORmYuUNF48SFQ7TeZD4f5Nt3kud9ur
 mFcU+izQYmWENN3G25ScpwT2BZnrYnBCGf8keneXogCHeh1oAsEhSXUNaUe2izOYGIJoWVU7VWS
 LslnaqwlHc2t2SfdHKr9NQl2adx1Q2Kvk4yHqicoiBYC0hbWNbae9Tw==
X-Gm-Gg: AY/fxX5s1m6kzMAmNHzgLVlGtNP4ccgERT8plLHEvBshyiuk6zHqO9SpPWRJPowhIyA
 TrL5MUXnafZK9F2jkh5Xeni2sZSIwZcdZobPmRMEawvlqmNrd+C3ZLNJlO8cgb+4TagZYO1VGZg
 dMIZVSslIz0JKZ7hE8njtIerVY6gvmstHlme/Ky1YRcradbQvTUi6QrtzJQKm+ZB5HcNQDtGrIG
 RB+jIguxo/xo9B33oOpQzzt5q9h/gxAHigsXzw1RbA9XqFbHICNi4IEQq2QAwXQdbnU1Q70ZJXx
 64qhyixb5n+5MKOMig+S/gk9bKXwaLBtKH5y2996vZAODFFiHPOOyf1ujx+ciiBXAscLoHVvnA2
 fwCeyCkA2MBjs/MGeGmvja82JLpQ0mw0NgqJVI0N1wvxGjVALjuyVDIonKA==
X-Received: by 2002:a05:6000:40df:b0:432:da7c:5750 with SMTP id
 ffacd0b85a97d-435695651aamr405020f8f.20.1768499253700; 
 Thu, 15 Jan 2026 09:47:33 -0800 (PST)
X-Received: by 2002:a05:6000:40df:b0:432:da7c:5750 with SMTP id
 ffacd0b85a97d-435695651aamr404993f8f.20.1768499253308; 
 Thu, 15 Jan 2026 09:47:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992681esm303138f8f.11.2026.01.15.09.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 09:47:32 -0800 (PST)
Message-ID: <10e1b40c-2edd-400f-8c8e-e0f3ad4c6f75@redhat.com>
Date: Thu, 15 Jan 2026 18:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 0/7] hw/misc: Introduce a generalized IOMMU test framework
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <6d50c3fe-e235-48e8-b461-fe0689f12070@phytium.com.cn>
 <9fba7ded-d31d-4789-b83d-efcc96f5448e@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <9fba7ded-d31d-4789-b83d-efcc96f5448e@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QY1QqjBCLilRyQd6ipuam6govAAhU96b7lDJiea1qec_1768499254
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Pierrick,

On 1/15/26 12:39 AM, Pierrick Bouvier wrote:
> On 1/14/26 5:30 AM, Tao Tang wrote:
>>
>> A gentle ping on this series. Any further suggestions would be greatly
>> appreciated.
>>
>>
>> Link:
>>
>> https://lore.kernel.org/qemu-devel/20251224034647.2596434-1-tangtao1634@phytium.com.cn/
>>
>>
>>
>> Best regards,
>>
>> Tao
>>
> This version is in good shape and is ready to be merged.
> Eric, do you feel like merging it, or would you prefer someone else to
> pick it up? 

Peter generally sends the PRs for the vSMMU. Maybe this can also be
taken by qtests maintainers too.

Thanks

Eric
>
> Regards,
> Pierrick
>


