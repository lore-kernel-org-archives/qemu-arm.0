Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp599989ejb;
        Thu, 1 Jun 2023 10:12:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5r6dZYpnFVNTUSNQJ791u1BrAiyBEIKRYjx8wRj065eCxeOpg39Jwhhf01QR2L+AH2UKJ5
X-Received: by 2002:a05:6214:5010:b0:626:eb7:5820 with SMTP id jo16-20020a056214501000b006260eb75820mr13573864qvb.50.1685639538264;
        Thu, 01 Jun 2023 10:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685639538; cv=none;
        d=google.com; s=arc-20160816;
        b=qY4AI5AQqaL/yH+b/GPh3WbYFpz9B9OL+U0OzFiIRdmAwvmxbj0dVpV5NRkI4Lx5Ph
         BnS8UXmarqu39mgNgXDROBhArjbpEGdlZ3xelFb3l9heHUR5EIPO9HjcGjQHlQuuBNdQ
         kJqIPLOpTmJBzd8UjqohHwZR70KscY1LfxYzaQOCG4FlGf7v71qO2BguaPsYDoxRP3TR
         JVUR2EbjgTHPfMpfc9vf86lS0a/4riBJDXzkRA4qulZj+BYINO9aPQIS+2GyQyXAi9n8
         ECGWfxja/UF0r2S5q38EZHTe1dOITFiAU9HDpb6IdXvsgwuab1JM4s04PQt4l3ZrajF5
         lC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=bpnIYG1WWrR3cGpvPSFYxbTCsws385yfGazSCMdwV5k=;
        b=o5tZbDgUBIfmDLOKfWyt4f8yftT4JONfHJHPFhvVJOiKZMAkBeWS+dE9zFgE6R952q
         25lCXJ9pV0VrYXQfuTMSU5UM8kGnGsexVEs6xqqN+T4i6KQCmVey6iE6r5gzSfwf+C+Q
         usxk+fpWq3UX/UWOyIIG1dnA8qxQQdgOCmv/CR2l7dMh0AgPY4kjIkCDkKhwHDxL3FgN
         mr7L+8HTlOnSqOB9XlIhxwPnRJB40TOf+VUMkccAxyzPCVIYYGwQIRi731lS3N+/4adU
         o4hfoRvgBRHqsqikjEYAU5UEearKZAGqnnSeNfQIOdL77zK6/U5DT0ROAIqMUBaLHpeS
         IDyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejA6UQjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz15-20020a0562140e6f00b00623a1e9460asi9807134qvb.612.2023.06.01.10.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 10:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejA6UQjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4lqF-0001Fr-Jn; Thu, 01 Jun 2023 13:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4lqD-0001Db-DW
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 13:12:01 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4lq7-0005xa-Tz
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 13:12:01 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-96fe2a1db26so149955866b.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685639514; x=1688231514;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bpnIYG1WWrR3cGpvPSFYxbTCsws385yfGazSCMdwV5k=;
 b=ejA6UQjjuULohvP5tXw1yX+2C4AejYpha67Ph4ugiGBldl28/eWRUfNl5itd6V/ypQ
 ww6m50xFoXxgMFgh/kIs6dK7mmgshuPPeNT8zaKvUZvX53Qknh1CT1hha4ZIhoSO40zx
 Enzdx+FdfE3AUgcyAhg7NosuPBg6CSyd+dEQDqgtmmSEJDgKr6iz+x83AYIBXCJDPYVk
 EG7faqO4fsWLF4zkGTCUgqcDVSoZ5p/RjAn6tfKDAJ4Ux5NEx4QwDGQXVthRd52yG2uX
 JlIvzvyD8sXnIlyyzZjmm3iNyRguy8P02So2RI9Ww+1VyFKZtAjEZYXpZm24YlTqKy8P
 3CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639514; x=1688231514;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpnIYG1WWrR3cGpvPSFYxbTCsws385yfGazSCMdwV5k=;
 b=IxqbVldlmCWxTp2fP3aMFpnaVyDhSgZyGSzHXGq8v9wXhL4yNtMDhIW1kT7xLD/sKw
 MvSXsuhlk9ZqLGgMYHQrbkMP5jFnJA5L5MVlJGyrKpszd0EuBLCKGXqySEck+Gs5m1vc
 B9k34kxe0pMrFs8gXjqddXxSUNLQEd7zZAaIVhUYftIs7mG6SERnssOcUZ0SQ26Fbcvt
 +rNGrAXjfw6IBtcWpqIdA5CqxB49VArCwvN5Zee99KPu6NfVpH5CQaB6Spa76LktXfKJ
 pb0VELYlnb4S4sgJYn2sGFGyZYdHAQQ3rjynFERjky7QBBToqP3pQ8koQGG/ldKAFcZL
 +/kA==
X-Gm-Message-State: AC+VfDz+lAyqaw6YLJ4ms0GWcB0s3vi/sLdbdVFjeG9gq0xAE7Z/1Mk7
 cAYHpLUVzecpx1y+Z4hVX+RBng==
X-Received: by 2002:a17:907:1c86:b0:96f:2b40:4503 with SMTP id
 nb6-20020a1709071c8600b0096f2b404503mr8238528ejc.74.1685639514019; 
 Thu, 01 Jun 2023 10:11:54 -0700 (PDT)
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl.
 [83.21.93.182]) by smtp.gmail.com with ESMTPSA id
 gz15-20020a170906f2cf00b00965ac8f8a3dsm10935839ejb.173.2023.06.01.10.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 10:11:53 -0700 (PDT)
Message-ID: <5b8e5ca1-2fba-6edd-6fa7-14b003ec2ff8@linaro.org>
Date: Thu, 1 Jun 2023 19:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Graeme Gregory <graeme@xora.org.uk>, wangyuquan1236@phytium.com.cn,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
 <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
 <b663fb55-dc8e-9fd8-9d82-7e693c3c4ad3@quicinc.com>
 <CAFEAcA_9Prr1xV2s1q2+GpWEnrsEEFT57bbLDnop5Hw3MaxM0A@mail.gmail.com>
 <da42c1fc-4adc-5eaa-2d72-6747b74f8ae8@linaro.org>
 <CAFEAcA9pUGUa4ev_y3U1z1BdU+AaGGKtRMcQjC5prvWvT9AWEg@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA9pUGUa4ev_y3U1z1BdU+AaGGKtRMcQjC5prvWvT9AWEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
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
X-TUID: k5NUane1+kGu

W dniu 1.06.2023 o 18:39, Peter Maydell pisze:
>> So something like below? I only tested does system boot into Debian.
>> To make it work also changes to EDK2 would be needed to list XHCI
>> controller in DSDT.

> Yes, and you also want to drop the useless EHCI controller,
> and (as you note) both these things mean firmware changes
> so presumably that's a version-bump event?

First we need to get two patches through TF-A to get current information 
from QEMU. And it takes time.

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/20871

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/20953
