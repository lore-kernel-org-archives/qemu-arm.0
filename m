Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp618362ejo;
        Fri, 5 Jan 2024 02:13:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQk4dzhFjBsLqKuaCO2EHDix/e5fMZFFEHEOL2D5nJsUCnvPkbtwvCuOgXNY7s3YLNzBE3
X-Received: by 2002:a05:620a:8516:b0:781:7091:b641 with SMTP id pe22-20020a05620a851600b007817091b641mr1805421qkn.121.1704449627257;
        Fri, 05 Jan 2024 02:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704449627; cv=none;
        d=google.com; s=arc-20160816;
        b=IObY7ykTyEB3xJNgLXuLaWEjONdQGIIYVMO2wX6BWG7O4S0//p0V6Oz2mUID/6xaCg
         ejaqgt3UEk/u0cdD3f9OX1TFHZ2KANndvfugPhd7qLic+j+EYiQXWdBIhb2mNzpy4pTj
         s66FrEpISNhubK18aXQRBYLHmwY7EUcS8j03+orIudClx5Rx5j3GCi+NOr/uJLcolru9
         jQChTyxblDx88koI9iGqXVIU+s+EPQdn4BAt2P87zrBFq2fQmHwdHiprvKGGCp8wkL7e
         qDG/JCFTyCOowuZ+OqHYpICCtpnwxJkKfNuXpQ8LzNh0591pMt157XflQebTh+r6Ez2D
         Gurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xjJ+95yF+JJvIZcDqZBEdqJd9NZpOgcervqv2+aiesI=;
        fh=pLk7IlYeOw9gEUp1FsbFqgDAiPe5JHHXs+b90EKpYi8=;
        b=ChzJdduK8KX8NLo3tU4IPSMBGqoWbuO+vjJX33F0a4y1UFFsHg9zLxVvBm3VfWtplB
         Hvsu/1wH8IsuV12wR9O5qC/A08jCLKT53CNg4EPNTv5tz4hK7EYo8OC4lPXVNj2SWSjP
         QKOl8KzSANv4AFwcpwElRPBPZGrrpJzWBI4Y2U3GMjlaUrMHZCK62kFyEgG5Q/EGQtN2
         3ZecYdWNnioJXKB7j1x216vdztMDGhi0/wpD6Z3YZej01+zcoGn70xWedDGIsEuCE60Q
         R6z+wH+kfZzeHuj6mkCXpikeaK9nSzaQTNzmmH7P+7iQZIANXDrDengPMzlUhHDMZZYV
         x+xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dP8NE0xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a05620a121000b0078110391418si1326272qkj.776.2024.01.05.02.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 02:13:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dP8NE0xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLhCu-0004ff-3v; Fri, 05 Jan 2024 05:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLhCs-0004f4-3G
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 05:13:38 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLhCq-00014k-Cu
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 05:13:37 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso77588066b.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704449614; x=1705054414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xjJ+95yF+JJvIZcDqZBEdqJd9NZpOgcervqv2+aiesI=;
 b=dP8NE0xnotjLDmFOb3J4ARNZIFAXVzE+rKEJaYKDFiqRzeTYfzELE0ro+fLc4xH3Et
 kZUfbQg4ztZ3LPP8OLRtk+wZtYixMNYUz/xv7yBvvei4BA0gXy7Y6SQXVzLsUoPO3puk
 K2JmM48CgDLGiJaUytu5/14AGSB3XeJ4x3aqwzjLDh0pd3CHDz9a32fkrNcuiNes2kNr
 FOrLZndFoHwTF5vYrjN/0maLZQzRrSqMtvj64Yi/veH05VUQdRyoe+PnFlyQxV/csMZa
 Nc6/S1u2D6lwsFQmkKsp9kpBlWPzzxiB82ltatqyWAP5S4KFvxFOxdLBQXGUIjpjs7c6
 gu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704449614; x=1705054414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xjJ+95yF+JJvIZcDqZBEdqJd9NZpOgcervqv2+aiesI=;
 b=a0ZVZXgPBk+W6aPyUhiCxAFKfw3XeQ/+AJhIApBqJmJWyMFb4AN77MI9teDA6A9oP+
 vH/CXq/VmSuZaQlLcIIKWglTlLOgLAB4YXaUed6QP0TtPvSMKUthiBJllCXitpWC9Ivo
 nnXGcvtNt0/xqIRCa4Hltk/eU7U6TennNpPh6UeGVsCURfM+8dFE2mS7c3cKlXuyT0YO
 ZHHk3CQDskF36Pw3AsKuBIhv36uSqKQsfpNhBICX2PM1DukeZ0Bt/dBE84hzFVFwaCdj
 o0FDOv6dAtWV0ikBoGzjqANsvdwSiV6G55tD7ifxwAfH3n5QxLZ8Y6xYXtmkOpvfui/y
 xqug==
X-Gm-Message-State: AOJu0YzeqPZrwaGRwupTn+nxBM69R/oLef6rOi9PSaCGPkG7pC80Hsw+
 PW3nyG/ackPKyoPGMYqvRp5HbTW3m3lvNg==
X-Received: by 2002:a17:906:4a4e:b0:a28:26e9:a13d with SMTP id
 a14-20020a1709064a4e00b00a2826e9a13dmr1732495ejv.55.1704449614711; 
 Fri, 05 Jan 2024 02:13:34 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 t13-20020a170906178d00b00a28cf49520asm701067eje.203.2024.01.05.02.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 02:13:34 -0800 (PST)
Message-ID: <5f624a13-0ba0-4d9a-8910-2ef1c784a295@linaro.org>
Date: Fri, 5 Jan 2024 11:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Content-Language: en-US
To: inesvarhol <inesvarhol@proton.me>,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
 <61fd13b3-7cc9-4e27-bf91-bd2b4aedf97b@linaro.org>
 <ZjC6phtwjcDoQP-NDP6GF-dvCVK8Ctk9EeW_JezuNBqnQq4-V6NU6eAhECMqxJzMDRxwjbb-LPcHTvysc6YGuLD7ckWhbtpqD1g9lnklofI=@proton.me>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZjC6phtwjcDoQP-NDP6GF-dvCVK8Ctk9EeW_JezuNBqnQq4-V6NU6eAhECMqxJzMDRxwjbb-LPcHTvysc6YGuLD7ckWhbtpqD1g9lnklofI=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: X5m8vpKsINzF

(+Mark & Eduardo)

On 4/1/24 14:37, inesvarhol wrote:
> 
> Le jeudi 4 janvier 2024 à 14:05, Philippe Mathieu-Daudé <philmd@linaro.org> a écrit :
> 
> Hello,
> 
>>> +static void test_edge_selector(void)
>>> +{
>>> + enable_nvic_irq(EXTI0_IRQ);
>>> +
>>> + / Configure EXTI line 0 irq on rising edge */
>>> + qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
>>
>>
>> Markus, this qtest use seems to expect some stability in QOM path...
>>
>> Inès, Arnaud, having the SoC unattached is dubious, it belongs to
>> the machine.
> 
> Noted, we will fix that.
> Should we be concerned about the "stability in QOM path" ?

Don't worry about this Inès, I wanted to raise Markus attention on this.

You showed a legit use of stable QOM path, and Markus told me recently
there is no contract for QOM paths (it shouldn't be considered as a
stable API). IIRC Markus explanation, "/unattached" container was
added as a temporary hack to allow migrating QDev objects to QOM (see
around commit da57febfed "qdev: give all devices a canonical path",
11 years ago).

I agree anything under "/unattached" can be expected to be stable
(but we need a community consensus). Then the big question remaining
is "can any qom-path out of /unattached be considered stable?"

Regards,

Phil.
