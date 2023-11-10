Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1178089ejq;
        Fri, 10 Nov 2023 05:05:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbsV3Cja9SqxBQ1/GylW9VyqlOtwBYzLCUCkHTnJ0ei6miNAmbMSlagWKDiM8llR/W+yWo
X-Received: by 2002:a05:620a:4095:b0:779:ab34:abdc with SMTP id f21-20020a05620a409500b00779ab34abdcmr7891360qko.51.1699621515583;
        Fri, 10 Nov 2023 05:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699621515; cv=none;
        d=google.com; s=arc-20160816;
        b=gxJPt62uGICcPaqMDa6TcJA370Syc3c2EKjFDmO2acJ8CCPFhf0nAOJfmn3tEtdvGU
         HnePcAh5MZtRdCnOaT3ZLTIeEVgSUYnM2WzcpDnhWXRu/awyoa1Uk41sciGtM2/9T/oW
         EJ/brPZ1oSjIepjwbsSg02uI4Shdb0h1TnV38OWUC1a0bt8DKxhZXUZuHiuDrYipRNhE
         z6aSlZZeB4BG80ZiG52Ff+1wU1Nuch1L3/kIhQ8gHEn5FWAX5rLqX9yUzn/U1VPtbdmK
         /HjmPiOxvKmXqdawDDvgn8cguNr4y/ryMmbb3xeadYQlDvpXrxG8UCrkGuHJJV8Mi7f1
         pO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kFE6piEAzvntZ78R/2iIWj1xKTM+Tp0jua0lcHR33+k=;
        fh=bj8ejWp6WXxAwhKDX3Ve2eNrx/u1Gd7l5pQi0Oneq6g=;
        b=rkCrPAg14H1n/b3xQHDJMIVWsva2UZ4AC4oXIEToHYEEJjTsddEygt9x22/yzyKCij
         uzmcOCQ5/71am+2G38DOykoZ2KM+/TtYthDzDgQsZiffX+fLVd9lAsc9wpyqAmZH6lVh
         x6HP+dN4XeM0+/J7NTJ/Vwm+SRabL9Xurpd2eVH7R3AbWqL+SFS49gFfPZHAms5bp7c/
         98UWUKVWUboH0q5tJWUO2B4SwypOcPmP9/ORTWzDG9WUePE6NqHHEnT7nEmSyYeXlP7F
         Rv+UO9si8aLba06mrbO6w8oaxLhFrNVFNba0je6yU006q1dVQl38zAdSPH0vne/6S8Wb
         I+KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1wPAYvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020a05620a11a100b0077593f71496si4095001qkk.720.2023.11.10.05.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 05:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1wPAYvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1RBe-0002WC-Sr; Fri, 10 Nov 2023 08:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1RBX-0002Uo-OX
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 08:04:32 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1RBU-0005qn-Vf
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 08:04:31 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40a48775c58so1862045e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 05:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699621466; x=1700226266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kFE6piEAzvntZ78R/2iIWj1xKTM+Tp0jua0lcHR33+k=;
 b=M1wPAYvu3xW6VkFfUw557wDUGhrC0XSKkcmOt/MIS1P5VkhPPw2fiT1ohxr1h+bnea
 ssGogCA4FbfOsmkOsY+E3bk38EnPMWL5i34+9NLGJrc6xwS4BUJABGV2UhC8m8J3I/2W
 FBvVV17JkkoGS4uy4WFoM2FdqWBbCwZWN3YH8kZiQEdsJ+5URX8+qFvorcu/bA4pibd0
 PlQaXpFgISyV8RYSfMoz6MIaZI6NI86POQZnuRoJ+3ry6B9K8jaGMj2gpdLxFYKN6Axg
 JRsF5da9cRftWNC6rB0SgJOLqy1SPWP4f5Ngc6O08q8wPY+WDPpt9SqdBK+f43lxv0BD
 gF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699621466; x=1700226266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFE6piEAzvntZ78R/2iIWj1xKTM+Tp0jua0lcHR33+k=;
 b=b1aj4TzhKYU8FXw4rKEqoTODkCWwQTdghoyQ7L9wBhne31ztRyPDRbctgkLAC5sjU0
 WFi0R7CVQos5fI2erSfgmOY8bHtDci1qH8dZI8ETBCABByLOt7pwNUnLSsN5G2o0Y3xK
 g+S3Dvykl2WP5wxoKiKar0UPVXYS8RiK2+Q59mojI4a8v252s5IR/9c/zBBoBvWOr5YX
 VxBFkFXJPeU0JS06TjObmI4Yiy95a6fHOSWhasRPtpVXcim176H3JNSHUo3BTuUonrhF
 z92l1ssFKQHuftJMSDSZIHin57yahpdIr9DxX9Ta1KjvpyXYcAfU83M0gOxc8S0dWDwH
 kgUQ==
X-Gm-Message-State: AOJu0Ywyt7MOKQi25zJ5P9u0/9jXzoBytE0MAtJsJMo+FdS5xWVO+KG4
 y4UzTNUg/Yh19zl+CnGTezF7XQ==
X-Received: by 2002:a05:600c:5102:b0:408:57bb:ef96 with SMTP id
 o2-20020a05600c510200b0040857bbef96mr6616006wms.30.1699621465991; 
 Fri, 10 Nov 2023 05:04:25 -0800 (PST)
Received: from [192.168.69.115] ([176.187.194.109])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b004077219aed5sm5201900wms.6.2023.11.10.05.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 05:04:25 -0800 (PST)
Message-ID: <f0a2b52e-9dca-436f-8422-ff0c69e98ffc@linaro.org>
Date: Fri, 10 Nov 2023 14:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
 <3wmne.fhuf28sb5yfg@linaro.org> <ZU4R+08zuo8xvlg8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZU4R+08zuo8xvlg8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CcPBI5/JxzK3

On 10/11/23 12:20, Daniel P. Berrangé wrote:
> On Fri, Nov 10, 2023 at 12:44:56PM +0200, Manos Pitsidianakis wrote:
>> On Fri, 10 Nov 2023 12:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> This kind of thing is why Coverity's unused-result warning has a
>>> lot of false positives. We shouldn't introduce extra code like
>>> this to work around the fact that the tooling doesn't understand
>>> our error-handling convention (i.e. error_fatal, and the way
>>> that some functions report errors both via the return value and
>>> also via the Error** argument).
>>
>> I respect that :). But I personally believe that clinging to C's
>> inadequacies, instead of preventing bugs statically just because it adds
>> some lines of code, is misguided. Proper code should strive to make bugs
>> impossible in the first place. At least that is my perspective and I would
>> like there to be constructive discussions about different approaches in the
>> mailing list. Perhaps something good might come out of it!
> 
> Your approach to the problem:
> 
>    if (!AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal)) {
>      exit(1);

Rather:

        g_assert_not_reached();

>    }
> 
> is adding dead-code because the exit(1) will never be reachable. So while
> it lets you squelch the unused result warning, it is verbose and misleading
> to anyone who sees it.

