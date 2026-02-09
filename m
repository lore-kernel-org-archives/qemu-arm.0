Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D62BE94622
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 23:46:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpax2-0005K7-B4; Mon, 09 Feb 2026 18:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpaww-0005JR-Hv
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 18:45:52 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpawu-0000en-Oj
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 18:45:50 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-81dab89f286so110567b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Feb 2026 15:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770680746; x=1771285546; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g+uxnFemVoYdAu1YcNSi/SW1k2+9fgdDNw1Nf4DNxbs=;
 b=sDHxPc9hkIygIwhlOJhcP8L3pKNxXuOBjlf+Kxp+bEKA+zsSPOCQX3tpyWIJkLtQbI
 WY5g2e/bWAcFsx2erMtSHXd4dZMufZuGOjFvNcgeWXXv95wQTsx5EKbjwAlQkvd8ekrW
 OWezmGYlSngf6VLv9hZOtneRPhHsqSWhjUTSRJEkEV6XCeNj1Sech/HtPfiEijArpw7Q
 hfXvNZaEQKL453U/aC5uKjK8V2ZB6XnFJyXNoAzljfyU5D6odO+hcIl1DEHle3StInfv
 oA6R+aG6VgJ+mv8xiikmQtoHs5TzS07Ae4hmyT00uQIAHhHU5gHMOSMdeMD1uOmUIgZo
 HOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770680746; x=1771285546;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+uxnFemVoYdAu1YcNSi/SW1k2+9fgdDNw1Nf4DNxbs=;
 b=Cwj3Po8zT02ewZ2oaA0/NfznbYO35lkuVvZ1IVO5hg6+Lq/FaEtwkKRIh8+XTxIrLp
 97j15CPOWRnLbOmBGIetxcshQ6M+CFaY2Dp+gytw99YJFZ8gULTuCmNQwnEmb4CeLlaT
 3pkjRqpQqnLmGkoiz5NyXbaQc7p63rX0ZwwsyH80Ysju+qjlOJEkA2b6MY+mhdurGQO2
 Tu/H14MODNxnmT+Ny+YOUJndyrfo7Mhuga3NXvwj7YoRas3OZ+71b3f4pzhze8rJ/xcN
 o3iM20hb4PvGZwHObekOhQk7MU99iAZZQK/Twgc8It0xqIb2vcM89UFOrqCwrf/0tZeB
 UxFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyU1O4Spdqv9z9RQ9vLALVPBiEZZn0tTfv0xUhsMsdFGxud6P0fUmZY8JFW7wC4XZhUWDIN4Y5Lg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8YMKmnvSctZuczkHun2afHVEc+OSG9dGAyUWsgRnX8lC5+KpX
 utw13JundbVwaoc9IEWgbHg96TdK7WJ6oBB9aSC1gPAXB2ZK/hhrog8k3bsRwQ70ALo=
X-Gm-Gg: AZuq6aKW/wRxeCNwK9GB+Vv8Umvkgai9DDYfmeRZMg+M5eprxrwP/0QSlxdAlF4eCEl
 Qj9jaxvTBEU/OgYy6tOjIQH0Bi+P43H82CTfQ8N70OCUXNeJ0kJDgj8dgp3uzBStIdTUsmWt1V+
 xcS0xTcEnJ3qlWMBOkhd1iQUewPBXKE19t58h10Wn34c9e1ldTPmOaEa7Bc9iqeJ/i+FP6ddt29
 VhLdGiWp40v2LFTkw73Mly1YZPVmnlyr9SMcCeMwohIBAgTJGHQaIRx2QqcFia9WsciF25dZsCN
 aZJDZAVlihwPt60smUBlGBeS2+AaLjie8wH6lDpKYQfIh1pT3Z81WXIFr96yjUiNG1wpuXeEhZ5
 C9umlpIhfoIyzQmNDVaqXt/HjN+qwwW3jBQCTAZJ7eh8Dzj5EbDCVX2vRMkRAhDn1qODecFptsr
 dlWQXBiKg0sHrxODWmVfdabClJr86QOWxvzUwwtX4vL3xKzsMW0yiqU6+0xMg3OIatYtHQCgC1R
 vhXEKcpqbKr
X-Received: by 2002:a05:6a20:ac43:b0:36b:e81e:386 with SMTP id
 adf61e73a8af0-393ad46351emr11070220637.80.1770680746450; 
 Mon, 09 Feb 2026 15:45:46 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:bc29:21c6:e150:bc42?
 ([2001:8003:e109:dd00:bc29:21c6:e150:bc42])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6dcb5249a0sm9921804a12.11.2026.02.09.15.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 15:45:46 -0800 (PST)
Message-ID: <11a09f7d-5274-4ac5-b6f2-90d9490751a4@linaro.org>
Date: Tue, 10 Feb 2026 09:45:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] target/arm/tcg: duplicate tcg/arith_helper.c and
 tcg/crypto_helper.c between user/system
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-7-pierrick.bouvier@linaro.org>
 <6c5eb308-56e6-487a-ad7b-8f0da70ab7cd@linaro.org>
 <e291f290-a188-4106-8648-48d4c464dfed@linaro.org>
 <a6320ab4-7ece-4618-8d73-549df7a34886@linaro.org>
 <c0b0691b-3cef-4ec7-8d68-227420167481@linaro.org>
 <b23e5d00-19cd-4eca-9cff-38ec78f87929@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <b23e5d00-19cd-4eca-9cff-38ec78f87929@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/10/26 04:09, Pierrick Bouvier wrote:
> Does a simple #define tcg_use_softmmu false/true is enough for you, or do you expect to 
> see proper ifdef blocks in all tcg-target.c.inc?

Just the #define, so that both paths are always compiled, even if dead-code eliminated.


r~

