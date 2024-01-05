Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp988157ejo;
        Fri, 5 Jan 2024 14:17:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1KowTpa9FNh9u08jbGasbuzrHTe8GlUNaywDwUa5103fLOipAi7QVSgWGOp9JwOu0ZTHb
X-Received: by 2002:a5b:18c:0:b0:dbe:ace5:c054 with SMTP id r12-20020a5b018c000000b00dbeace5c054mr45485ybl.5.1704493044869;
        Fri, 05 Jan 2024 14:17:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704493044; cv=none;
        d=google.com; s=arc-20160816;
        b=NipOUrQ7PkFGzew6z+j0AGHGwzwhlhaslSDmIKuO+7Tu4w5427+uQhsRSTbOW1Vf3M
         rIua7ILr3AGYCEVxGosCfE+6uMgINntEewZDTNbA1F8KRvOX4rDyGNed+Pe2FSegLIPr
         WekVm1XsSiexi5xx/1vApbFL7XryQrvIvaKRvuCgHQnjR1ixLZ/vNU/ggk9J7CghKYG7
         uT+jgTj0BgnAkEeZwV2KoUEA4mFpeXQDVzXU83pd/S6uYKw3Yjt5OLdTi6ZB8MefloIF
         cnm+Zj5MdpQ7ZsmIO/0qMgVwIg3M1vFXHv607U9d2UeQkqAYjGYsaLWbfJDa+kPV36Ri
         Z3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4r9F1ve4tri+fejC8d02n5r3ZdvwikIuY6dGBcXdBSI=;
        fh=ENFfhUolrpukLS+jFgss4uWru+LNyj3ihV3aQDhUm+Q=;
        b=nLdk9gJww3QIa1ZyVbuflGQwSp3D1IzT9U6wTdAkwFz+qE8/+fV06gsYntZ9tjO49G
         oKgKZC1RqnaSgDEfd77GHOI0frbQAnwpxn5Af/wS8TorEFaOR62jSwfINSAF35EZV1qJ
         n0ggNk64TGrfhJ+aaW9ZjgD8n/M3kofG83mEWdKmGxg+FlW2WOxEEB8XCX/q3NOfRTGB
         9J06tTxBzkCt0dQkEb0oxsxinS0uMFqyKHFmD+rRF4bbG+FsMDHXZS0xEorVAsgqcmIz
         HkPvuw5BJu3FZcKNRNSiDP3V21/oNWt8b5rwKkcVTBl4kWyW5NPZ987AaQIjWxOdkKrJ
         OcUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiZudMrm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp12-20020a05622a1b8c00b0042806f41efcsi2656451qtb.805.2024.01.05.14.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 14:17:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiZudMrm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLsV4-0003OP-SO; Fri, 05 Jan 2024 17:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLsUr-0003Kf-3B
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 17:17:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLsUm-0002to-Q6
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 17:16:54 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d60ad5f0bso613035e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 14:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704493011; x=1705097811; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4r9F1ve4tri+fejC8d02n5r3ZdvwikIuY6dGBcXdBSI=;
 b=GiZudMrm4qIKvdCdOaEydHTZPwSQfBhF4PkNwZsFwmeuf4VooZ8E0LOKbYiG8nY9Y7
 WRRx841Fdxz2WxjuYzp5phesuCuI//ik+Tu7IQ6LgK09/17CMvveKY3bpj1I5U0Zy9s2
 EVU9V4jIP40T/t08X8q+c3/og30ttTBOvflzJlf8Xm7sbktYwIjY9Of0lyvzNhox2yP3
 lZXof+4W0S6suGmj0kydJkl3MNySeGZsyrzO77JHd+oqt6USx3SpKONqiJ2zn4LmpBZw
 85g5Zl5ZdJ8Kc7KO2yO4Vl1JhS8maEj0K+GbJh93y2EFhLzs3w0HbBjkVk+q8pCI3tEK
 wNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704493011; x=1705097811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4r9F1ve4tri+fejC8d02n5r3ZdvwikIuY6dGBcXdBSI=;
 b=kgPXV66m6a5ANnaGapANF9WegKomMtyTG5BQXUUS0YSWjNrf0HHZAoA8GGa8omuRT0
 F6Td+7f7uAYin4dFUKzhBuG8rUUxpxdDPJnWzCrg1cfLuegpuoW40Og6FppB0FagsECK
 gJ3Qt8clXPV6D3ClAHVN+Qs3MKhlQdWpHNLHeXYIKOpOKZrvcNzRPHJYHwdGw61ZdPkO
 iscKR6TmVoYsFVc2yKuJk2TOREpv0QYRdgJ9eQD7fbdhY02bjl8bDqqBoAXJhSq2lpZQ
 4bwg2hevZ44suLvLHwTGpzgUSt7yWmoZk3Q0K2bZUq84y9KIBH0E7EjVhh/VmrhOTAzs
 qgFA==
X-Gm-Message-State: AOJu0Yx9v0HynlojTfL9p1zSOoFl7tnVhbYXGm5YnIrzov99+3xyIiIb
 4EaFSCfBJUGZ3m+iqimHsfVc3iKUBq+hhw==
X-Received: by 2002:a05:600c:84cf:b0:40d:9377:d988 with SMTP id
 er15-20020a05600c84cf00b0040d9377d988mr103684wmb.60.1704493011345; 
 Fri, 05 Jan 2024 14:16:51 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b0040d79907acasm2768995wmq.26.2024.01.05.14.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 14:16:50 -0800 (PST)
Message-ID: <4eb7a7f5-8cb5-41a3-ac26-9b9a77a34b09@linaro.org>
Date: Fri, 5 Jan 2024 23:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 inesvarhol <inesvarhol@proton.me>
Cc: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
 <61fd13b3-7cc9-4e27-bf91-bd2b4aedf97b@linaro.org>
 <ZjC6phtwjcDoQP-NDP6GF-dvCVK8Ctk9EeW_JezuNBqnQq4-V6NU6eAhECMqxJzMDRxwjbb-LPcHTvysc6YGuLD7ckWhbtpqD1g9lnklofI=@proton.me>
 <ZZfYvlmcxBCiaeWE@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZZfYvlmcxBCiaeWE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pati+NgEUt5c

On 5/1/24 11:24, Daniel P. Berrangé wrote:
> On Thu, Jan 04, 2024 at 01:37:22PM +0000, inesvarhol wrote:
>>
>> Le jeudi 4 janvier 2024 à 14:05, Philippe Mathieu-Daudé <philmd@linaro.org> a écrit :
>>
>> Hello,
>>
>>>> +static void test_edge_selector(void)
>>>> +{
>>>> + enable_nvic_irq(EXTI0_IRQ);
>>>> +
>>>> + / Configure EXTI line 0 irq on rising edge */
>>>> + qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
>>>
>>>
>>> Markus, this qtest use seems to expect some stability in QOM path...
>>>
>>> Inès, Arnaud, having the SoC unattached is dubious, it belongs to
>>> the machine.
>>
>> Noted, we will fix that.
>> Should we be concerned about the "stability in QOM path" ?
> 
> QTest is a functional test harness that intentionally has knowledge
> about QEMU internals.
> 
> IOW, usage of particular QOM path in qtest does *not* imply that
> QOM path needs to be stable.  If QEMU internals change for whatever
> reason, it is expected that QTests may need some updates to match.

Good point.

> QOM path stability only matters if there's a mgmt app facing use
> case, which requires the app to have hardcoded knowledge of the
> path.
> 
> Even a mgmt app can use unstable QOM paths, provided it has a way
> to dynamically detect the path to be used, instead of hardcoding
> it.

I can understand this use to lookup "on which CDROM tray is
inserted the blkdrv named FOO", but to find a component on a
well specified system on chip, this is overkill.

> None the less, you may still choose to move it out of /unattached
> at your discretion.

Yeah we should clean those...

Thanks for clarifying,

Phil.

