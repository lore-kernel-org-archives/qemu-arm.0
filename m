Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1223882ejg;
        Fri, 19 Jan 2024 14:07:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFySyiU7ead2cXRyyzFhgRB1NFPCbfnwPaO/Djs9+UrzlyUV3awCSoUH1RsqRzUwzwSJoIc
X-Received: by 2002:a37:e219:0:b0:783:902:bcad with SMTP id g25-20020a37e219000000b007830902bcadmr535360qki.56.1705702032866;
        Fri, 19 Jan 2024 14:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705702032; cv=none;
        d=google.com; s=arc-20160816;
        b=xnVti9xKE77Ay2Fym/WEGBYHJJ0Wb1gQS7C7f03x3BeFk54OlLtR8dq2tlapxHYaX5
         iRWM4o9EOZ2MbzA90USoZ5pcNwtGraKhW6wSDDyYVoF3oPrR5abk41K90O4C3pcwwsIG
         ly3xWTsLb/7GQOS8DteSrDWHpiqq6kLD64kpaKHv0+lx9Wj65Kv7klkj99gBDrjm4SiK
         z26oDvqxJVohwkSJcDuOKusITBpslYfWbdLKlbNGVSUBWP/pY90u96LRLRe5OiTon6jT
         V3HqM+t9+zTfF7wRa52WMlzlGd/wUGGZOyHa1cnmgfTVw2g3xw7ESWkJU+d9hq58yk6z
         unFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Svj6rBdujdVK5IvwDYFsEMyWWvimTiYPtbnJDAnh4to=;
        fh=vX91rBrX1T+WoWfC+oC9QTQxj2qHAzPpXr2sUG1odx8=;
        b=bFIUpYQPq7uAOmnfJovwThu2k6Ap/D+MS4tboEQizPPKbMHaKhhbK+TIy1KmKY2d56
         u70TDU3bPtlag5fWiVoZx48ZNsH6f+DCXV4EJ4opm3jXndQf9QRfxbu+x74nsOdQYXAD
         mhG3qDVFVFg6ZaZF1tKpazyHPgPratwjN7ruEbsGFDKaKrUkTwIkD/+143mdQVI9BytR
         hmMgFq4Dl855wdC3bPD5kA1GZrGifmrR2X4mn7mk2SmFeWml9k8/1t1mKdgw+iEtiVj/
         /Kghp6UldE07jL+VqS38PzrMHNKqx9BohfqalghLUXXDvxPefDZgLhNAZbZFJ2ERLKKM
         SXFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z+RwWy40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a37c24c000000b0078320568c0esi153146qkm.743.2024.01.19.14.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 14:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z+RwWy40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQx0w-0004PP-Rb; Fri, 19 Jan 2024 17:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQx0v-0004P5-5w
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 17:07:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQx0s-0003lE-Oa
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 17:07:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e80046264so14573025e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 14:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705702016; x=1706306816; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Svj6rBdujdVK5IvwDYFsEMyWWvimTiYPtbnJDAnh4to=;
 b=Z+RwWy40KK85synkstM+YnAtEIn4HmfnP0+8z2zqOs3QtATBHX9LiHaIUY1XVnPAEG
 jv4zZUxzqm600mk1SDpml8UO2pAXDqCuzn8TTto6CALnsDwUvTVwggq1IumPE2wpNZGa
 NJKWTNvXQ065We3HJT9085OVg9I6k60HR6BKNFmdhXCeEUdFgf7/pSVuoWVVmLx1vJ/u
 ZCrskVU+XqgeNngCAosprnqYTaiEh/10/8ise358hwovVGoT545MDvBhCNAnk9AB7sfK
 yCQovmHRJXBVrKQey/f5NBct4kSY+VyvHHFQGcsib7OfNKT3v/v2qAZo2o6MjPlpxWju
 GrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705702016; x=1706306816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Svj6rBdujdVK5IvwDYFsEMyWWvimTiYPtbnJDAnh4to=;
 b=QpqjCDirXYwov7jM9IzZOwVD48tp/piVqjEpr/PwEPLdZrs7D8xtjazFFKYaAB3Jc/
 6CsdHtVSTfQg0Brf7zHrsnyovR/E+huzUGvOqVlAFLW/DLKeiHG9SibMKnYIlUXKrMDr
 jcyMTV6baXc2/tRmwVRkQ1xQqgTT9Jm2JHzc8fgonqbvL41iUPaSDfHykHCmkYH+iyTN
 z8Vzhh/aqXpjZS8RuoKNZznBRXzuC0f3noufXVrvgE8xqGBBxjG+Xlokx9HuGmL7j6hv
 pUaNR7SVfAvros1W9KS6znE9NdDZj8R/keZm3UgnJzS50z9ak5bpMWo9JLVSKXquZ5aR
 PF9w==
X-Gm-Message-State: AOJu0YyQwE6crbPvPGZjmv/dzdEk79SYJefFZpwMN8adGtUDyYi5nvKN
 1X1iqGrgZd2gj0aoC1f9k/E/L+lBTbgVbkX4SLO3vjeAy4VmBIUvG2LNthmDHCc=
X-Received: by 2002:a05:600c:4ecc:b0:40e:779f:416 with SMTP id
 g12-20020a05600c4ecc00b0040e779f0416mr292750wmq.2.1705702016520; 
 Fri, 19 Jan 2024 14:06:56 -0800 (PST)
Received: from [192.168.1.67] (91-163-26-170.subs.proxad.net. [91.163.26.170])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adffec7000000b0033926505eafsm350322wrs.32.2024.01.19.14.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 14:06:56 -0800 (PST)
Message-ID: <ae955912-8a77-4c96-8525-500dc6e7c357@linaro.org>
Date: Fri, 19 Jan 2024 23:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hw/arm: Unconditionally map MMIO-based USB host
 controllers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20240115165615.78323-1-philmd@linaro.org>
 <CAFEAcA9abVk_BvWYE6ctcsLrk0CP=aqy38ncgxNrooNroe_1mA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9abVk_BvWYE6ctcsLrk0CP=aqy38ncgxNrooNroe_1mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: HfgpTHplOI36

On 19/1/24 17:51, Peter Maydell wrote:
> On Mon, 15 Jan 2024 at 16:56, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> When a chipset contain a USB controller, we can not simply
>> remove it. We could disable it, but that requires more changes
>> this series isn't aiming for. For more context:
>> https://lore.kernel.org/qemu-devel/56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@roeck-us.net/
>>
>> Philippe Mathieu-Daudé (2):
>>    hw/arm/allwinner-a10: Unconditionally map the USB Host controllers
>>    hw/arm/nseries: Unconditionally map the TUSB6010 USB Host controller
>>
> 
> 
> 
> Applied to target-arm.next, thanks.

Thanks! I posted a v2 with the requested changes (mention
migration compat break):
https://lore.kernel.org/qemu-devel/20240119215106.45776-1-philmd@linaro.org/

