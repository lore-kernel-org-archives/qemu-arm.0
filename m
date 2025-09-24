Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B21FCAC5A5
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Sep 2025 11:14:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1NRi-0004aj-SO; Wed, 24 Sep 2025 07:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1v1NRg-0004aO-CX
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 07:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1v1NRd-0005uP-47
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 07:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758712432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j2EmDkCImx35XV788vJSIDBoGNSDc9briiINMmIkETQ=;
 b=B9QOQvQwzDpdL8h65Q9vJJ6rSHeTWQYCVXb4ojN2qXAoauAQre1gepoCDSsHI5idjtqbeB
 KCslhu+zhMtY0VCAR5xCvHX6EsuVHEPEVqlsMDRvo7NeDU8OCmIpk9aTyMUASkNM6yU6EN
 bPa7mIn9xmsmX6D54kqhGmU0DLAb4no=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-1y6vnWAcOH6YJUVZY4kcwg-1; Wed, 24 Sep 2025 07:13:51 -0400
X-MC-Unique: 1y6vnWAcOH6YJUVZY4kcwg-1
X-Mimecast-MFC-AGG-ID: 1y6vnWAcOH6YJUVZY4kcwg_1758712430
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46dfd711001so20925045e9.0
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 04:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758712430; x=1759317230;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j2EmDkCImx35XV788vJSIDBoGNSDc9briiINMmIkETQ=;
 b=s6TZZwUz+RN+tIhArrLd9jphEk6P/vOPYmo7rOT/6EMd2xSI78evtcjDm+nuAGnHsO
 IOKPmjp2YOQiyKpwf9iodKxRQulnFY0xn5dqS/sr8mclL6K/KNgAealx939+KiviPu0S
 hAoQM3kJylhOy4t8YzBZR5Qi0URikIWYgK2Wre++/kZRB9Vabw5gMmzMkvLW4UxrK9Im
 DAS9deOtrHAu4JTLiU3JY2ubTT98UWlUyTALrKZVRrw0jdphRy4ur1tHtB5uofXbvJTE
 Ux4/ESkr0E+/shlEOMG3t4wC3yvc6ZzF2nHA2UaLdgfSZWr67Q3L6xNm6jOojyTyvTxk
 1k3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDAbym3232FhGb3PlpgbwNZKYTty765WPf+q0p0uTzCdSc5e8Eb9WPbH5do4R0mJhS/cgFOr3Kmg==@nongnu.org
X-Gm-Message-State: AOJu0YwVCzkYKlyr435+5bqmC+YaJuZ3KYdZr6QhF10K09qV+GE5vnY+
 j4jGwbWr7DzKRq3SFPIMnF//fHFdOUeCO215wzwdPfm8i3VYM+rH1BAKnGzE8e80pM3NJeV7jGV
 XL+hMggTJy1jbk/6LPYz4W5qDfvjGxCdfmHq4uO7JCcPAGdXgxJTjPg==
X-Gm-Gg: ASbGncsAb2cvaDwNzbEo8JEESaVKY5jU7RT5hFfIfXcXqCwpIFVERjOsXUFfGtZ/V6s
 xZ9Y3dcYkMTRoutQMeSixBft/NMDd5x8sxCVjk9E4+/xPqiYaonYIRE96Qz+zEqaHkWxWN+nu7B
 vxzewxJDSDKgGeeFzns2jfVx8UMsArOpitfl62og0FLXWcM+mQbmaF/PeuqPMqDaT3c3PSlTD2O
 +7GTpkfDoGc0rIZ8dlDbe3z9JvZg+6nBQwivPANi8WFKBrzQpIwdyUDXx/SbYSt4U2V+blLO7LC
 pW6w37aAzT+Z3hK4Dd+B2PIcUVpJZOjEO+lHNdlQyzGI02qcj6Am4edHlXwBSoJ4aXFruEQzWj+
 DtkU=
X-Received: by 2002:a05:600c:4595:b0:46c:e3df:529e with SMTP id
 5b1f17b1804b1-46e1dacf719mr50715085e9.19.1758712429944; 
 Wed, 24 Sep 2025 04:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHesjxBgX99igxtnOSLLBO391xh2CSV6A9cUrfscWNrzc3K2rD1rzP+BPZmmMNGVg0wyx0HuA==
X-Received: by 2002:a05:600c:4595:b0:46c:e3df:529e with SMTP id
 5b1f17b1804b1-46e1dacf719mr50714835e9.19.1758712429508; 
 Wed, 24 Sep 2025 04:13:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-407f579c1e9sm4602597f8f.46.2025.09.24.04.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 04:13:49 -0700 (PDT)
Message-ID: <078f252f-774b-47f8-bf94-6b1de8e70359@redhat.com>
Date: Wed, 24 Sep 2025 13:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 08/21] hw/arm/ast27x0: Add SCU alias for SSP and
 ensure correct device realization order
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20250717034054.1903991-1-jamin_lin@aspeedtech.com>
 <20250717034054.1903991-9-jamin_lin@aspeedtech.com>
 <a06379d8-ec0f-4842-87d9-5cecdb1dfd86@kaod.org>
 <SI2PR06MB5041DB54104CB51250E5E110FC1DA@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <5003d6ba-bf7e-4bdc-9c22-7360024536cf@redhat.com>
 <SI2PR06MB504175E8604D90397E631042FC1CA@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <SI2PR06MB504175E8604D90397E631042FC1CA@SI2PR06MB5041.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IpmZA_MPT7v0tG1F6sjA3rD9vhuIovPGul8eSYYU_GQ_1758712430
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hello Jamin,


>>> 3. Migrate all ASPEED coprocessors (e.g. SSP/TSP) to a common
>> AspeedCoprocessorState.
>>
>> Is 'AspeedCoprocessorState' a new model structure minimizing the number of
>> sub controllers ? if so, looks good. Could be merged fairly quickly.
>>
> 
> Yes, I am planning to use the new AspeedCoprocessorState instead of AspeedSoCState for SSP and TSP.
> struct Aspeed27x0SSPSoCState {
>      AspeedSoCState parent;  -------> Change to AspeedCoprocessorState
>      AspeedINTCState intc[2];
>      UnimplementedDeviceState ipc[2];
>      UnimplementedDeviceState scuio;
> 
>      ARMv7MState armv7m;
> };
> 
> struct Aspeed27x0TSPSoCState {
>      AspeedSoCState parent;  -------> Change to AspeedCoprocessorState
>      AspeedINTCState intc[2];
>      UnimplementedDeviceState ipc[2];
>      UnimplementedDeviceState scuio;
> 
>      ARMv7MState armv7m;
> };
> This change consolidates SSP and TSP under a common coprocessor model,
> reducing duplication and aligning them with the new AspeedCoprocessorState abstraction.

Aspeed27x0TSPSoCState and Aspeed27x0SSPSoCState look similar. Could they
be merged ?

Thanks,

C.


