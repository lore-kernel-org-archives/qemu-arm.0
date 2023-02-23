Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp789904ejc;
        Thu, 23 Feb 2023 06:52:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+16rUmDn53msY/VkVEJts9ZpCdc/rzTm1QlGwq0odvGEl2ScVOqwnAeYo163wjNHLA/Xmx
X-Received: by 2002:ac8:594b:0:b0:3b4:79f8:26c3 with SMTP id 11-20020ac8594b000000b003b479f826c3mr24235990qtz.33.1677163964525;
        Thu, 23 Feb 2023 06:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677163964; cv=none;
        d=google.com; s=arc-20160816;
        b=CGrE2RNkwm24ZJTfOnhR7QH79GpE3MOCVm0i4v1/px4W4L++dMGXdUVOMWD7B4CelY
         /p1oh+U+xQ9/+4nwP4lJtPiG5BbrVv/mP0VXQYtFdrYj1lxoUPk26d9lmbM22v9kr4lB
         D1Tt5zmgJYXg5q3rDgQs++A6hCHUvrILjywkot8IHq77CUu68p/kgMnImtaIixR0afMH
         46NqeOrj58v0nRG3dr30f9oRW38DZT+gzQf+j96hViw9gTSRoRCmOHRPeEFZYOyNG4x3
         bXuIDvRINYNKTCWmTVmnluTGCNORytIayW3lHSTrghaYGaOFy+ORBt/EUkRnSotGK2/x
         6z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=G/Sf883dWVSEBJipFQyu9Fv3W3c/y/uap0xiXdGssr8=;
        b=C7G7sHxTDpkFxZe+RaAQquzVc/zQUXvCuf71T0zegnj0qHHAzBr0ChvvEiRPB796I2
         /agmEvWU8hQsEUEO0hcDmF8Haz2ieG659Vv9cXl6hkJ+jCzISylVPgz7Kz6jJyBo8vCn
         dxzb7mnbxAQkvbzGGr2nhcjiasSkN8oPgyk2GuDhyF/vfpjr2x+dRrZaFR6ndKcgYXWx
         zunl37zuspT2t317hGojQoh0fAOC4FQcKMIUk6WAUWti2dwH8UYibTZx+TMzF6zfuwiB
         EiUYrsDFUV+8w1KMvA4XH1rE2gNNoxlrt6U58yTWE+NDRnQ0o7iB858A8CypA6hKswYG
         3CQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CUjdxRc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05622a01c600b003b9b20e3117si8254599qtw.213.2023.02.23.06.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 06:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CUjdxRc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVCwy-0002Ux-AV; Thu, 23 Feb 2023 09:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCwu-0002Tu-PT
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 09:51:56 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCws-0002w7-3A
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 09:51:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id bw19so255498wrb.13
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G/Sf883dWVSEBJipFQyu9Fv3W3c/y/uap0xiXdGssr8=;
 b=CUjdxRc3k0Rhh121suaO2M568wXCwugzuVvVybCT6iykhXljA7hHHLGL1Y7rGF+eou
 +dlyMBC6fBbfdKhKMeTq9CCL70iQo8Pxge5/qeK9kdrMBJSK8trbjeHP93Oxoujqzhko
 qOGPjSfzeDAtsbBCbpYn2rWG25DqRgZdb0SZZJtgU100ezdt3o0lD9DPeSsWj+fkDVod
 4mLufvAgEYYGYZbX72yeCUXA3mwujxA630qClEDH6cwjmozjnb2qJSdNadau+id3yFWB
 3wqq2Oy6vJwr0rfa+6WuJss/KrkkzngmivfBZDpvEpR2Dk79VjBJkL6wiwsP8wHpYYgB
 y9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/Sf883dWVSEBJipFQyu9Fv3W3c/y/uap0xiXdGssr8=;
 b=iClfC15d8RJQCnH4KxKDM+GeGGKAxb0ttvzYWvKtFQFJxEcm3GnbRDMjTr8p6m0Np8
 X8ddclyuKrxF9rjveaKHl4kZ0hPonTlVSuAe8RRmMs5z/wnr6+Y4idiOCusJomo9fPya
 IPsZUn87D/RaRvIQiYeQxWNQuC5RnhwjR6EOwjkGVjck6mr2F3QaSIBG19oK/GDoE7Wv
 RrkqWQcmShMciQcVvu2LZOSYJTWdTMpL92VnRR3vSQYQSNSzcODBAVqoY1a5+YmpRPSQ
 Nnp0tyonmp7gCp7kFKIzZmMK7BWVFKweW5kO6S1KxpFIAKtpb1b+7kx0aFW0iSwb9Kua
 yixA==
X-Gm-Message-State: AO0yUKUrOyVXqVGC6SvDoMeeLnGL5Izoj70IT3BpNKao+KMzPFrLcO4C
 D91SFkf55Iru/OpfFiU6gqg/8g==
X-Received: by 2002:a05:6000:98c:b0:2c5:5ee9:6b27 with SMTP id
 by12-20020a056000098c00b002c55ee96b27mr9945878wrb.13.1677163912151; 
 Thu, 23 Feb 2023 06:51:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b002c559def236sm8483439wro.57.2023.02.23.06.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 06:51:51 -0800 (PST)
Message-ID: <1936bc67-0d87-14f9-452f-60c9d56dfda4@linaro.org>
Date: Thu, 23 Feb 2023 15:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/5] scripts/checkpatch.pl: Do not allow assert(0)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-3-philmd@linaro.org>
 <2352caa0-ae10-1807-d055-6bd7757113e8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2352caa0-ae10-1807-d055-6bd7757113e8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tBxk8a2xn9Cf

On 22/2/23 04:53, Thomas Huth wrote:
> On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
>> Since commit 262a69f428 ("osdep.h: Prohibit disabling assert()
>> in supported builds") we can not build QEMU with NDEBUG (or
>> G_DISABLE_ASSERT) defined, thus 'assert(0)' always aborts QEMU.
>>
>> However some static analyzers / compilers doesn't notice NDEBUG
>> can't be defined and emit warnings if code is used after an
>> 'assert(0)' call. See for example commit c0a6665c3c ("target/i386:
>> Remove compilation errors when -Werror=maybe-uninitialized").
> 
> commit c0a6665c3c only uses g_assert_not_reached(), so that looks like a 
> bad example for your asset(0) case?

Oh right. I'll simply remove [See for example commit xxx ("xxx")].

