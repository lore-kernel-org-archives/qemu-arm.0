Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1154623lfb;
        Fri, 10 Sep 2021 06:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPRx2Ny0opkX8uMeYK1LwpbMSNawPsZAkb+VUMmEFGEamCsJyLwY2oFwmNz5NVNvbr7UHm
X-Received: by 2002:adf:c542:: with SMTP id s2mr9778675wrf.374.1631279335745;
        Fri, 10 Sep 2021 06:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631279335; cv=none;
        d=google.com; s=arc-20160816;
        b=Gf5tM1fcRqp5ClXfxLk8dtc+i55ah7SYwaBYgL6nNg5x8zYf1Kf/gzk6/eLRg0vYpX
         TzeuugUFKV1+V4xfrGlt7yeBA4zO9EbTC2IgicJrdrCe43TsWKVCi9xmD6VX3wUB9c/H
         vmQb9FDm1RtkjysgYExxXNr0WWvq8PRKuTvUpeJ1yxuxJw1wvRFxCKUsoXE6O8Vu2Cli
         NgLvWJIvdsLw6hFCT5Fn474wDWZ/nmZoReq117HrlmlYoq9blQPm9AQE9tkRvwWUhv73
         MlVe2GVIJTR9OJpTEKPBCmGv+oOPygzCewNFiucE++4UHtIbfMtgygu6f33ZfQL632Ex
         Lfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ez6tqNmwGb57FJn0VjdKTnH+PuZoXuf6PYS5nql9ctc=;
        b=X1YEY2OGjYk+p1GAE0LeNsFhy+3JcVa65sRHvrTdVm7TPi23sVhrvTuTdm474SioGE
         OKO6CuuIlz9Eb9mTQzQDKfKHNOsHFKApVcs215+B4/hKsrR85o/PlejpvmA51JhBsb80
         qvZBeHgTXg/BsdsMy4S8ZioTPXWUVIEnRDWqyG2dS+FLRv+aefFAPLikG+DVnMe0I2Qg
         hxsL6t48EghXy1AJ7/yTGATeYUfo5VLfod2u3qm1qlivojVj/YMpapgCx19Y3x7wTTDL
         dy/oJqieR7yTdTzK+VdfiAa1y09UiDCAVTkxOZZdKw1E5CE26FAAWz4T+f5nR5ukBHbQ
         m1gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2SbNsEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si2614798wry.134.2021.09.10.06.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 06:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2SbNsEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOgH0-0007rW-Ra
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 09:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOgGs-0007rO-Ox
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 09:08:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOgGq-0006Bx-Um
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 09:08:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id q26so2553210wrc.7
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ez6tqNmwGb57FJn0VjdKTnH+PuZoXuf6PYS5nql9ctc=;
 b=K2SbNsElGd1pNZkJ2ScFc2qGIA7iQ8vvchCl+z8B6a3XL6m1w4cekHEhYqnU5tlqwx
 VveX7nUiEi7PBmzqL5ihXIpDXvWvAPBMIwQAthe/MgrNJNtBolGJJXaFgAQExF414oTJ
 LTZqHd/63m64QXLt7EeZoQcOeg/q1+o7L7PT/mePITGlQoj3vfbOCVbLuAHalYVJD9/5
 ph2mi+eXaENVIBBSbBwkRIUd36DZmq53yzhcQhedf7cpwcDJXNbovFwMPg3bwDNil3iq
 Uyx3NVswk6Q8q9M0LGkXvZOEZ/ng0HT7iBSmY67hjPb3+5QbFzAnVQIlbBf3cSaj+uHd
 iWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ez6tqNmwGb57FJn0VjdKTnH+PuZoXuf6PYS5nql9ctc=;
 b=y7rH2TF+T67dkA83ird/xsoKpPH7WOAsgkxoRECpcPHdvUWwflvL2s2fx8AJMh4eKL
 CA1xp9HhCLef6pHnw/6TC4KgwUDgwK8phEdpnTBRYi1zuns6eU5+24NvvShiWQpCmc3C
 CExEEFYP2GOOsXjYAB9v3/VJzJvYC7GyzhiJhd/1M+kyRo5awFO4PGtjMa32zIFXEOdp
 H0Kpp5C6ef91l+azIsCmP82ow/YS/l66u9d8HpompAU4l8H5gmhhhy0MBJnOxajd9MqY
 DCJeDYiel7Z1lL2WOL+b8EMBhBfs/OAoIfwdsunjL+RsLTQI+ZmnJmZ/nwr1RPkFaACN
 umuQ==
X-Gm-Message-State: AOAM53207Rur5F9j5JCnEMPR9IQjTONyNQhr3BxmrJkk6jc3g3MT4MdR
 YKac66NLl6JHfrPTlx4l0RQRVg==
X-Received: by 2002:adf:f188:: with SMTP id h8mr9589099wro.269.1631279323289; 
 Fri, 10 Sep 2021 06:08:43 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id f18sm4181333wmc.6.2021.09.10.06.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 06:08:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
 <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
 <CAFEAcA_Swe0LE6m2JocLsyuV1ioDnK3N0y_hJ2QAXW86UxC=dw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9545f1ae-60e9-14dd-b76f-1dccd10520db@linaro.org>
Date: Fri, 10 Sep 2021 15:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Swe0LE6m2JocLsyuV1ioDnK3N0y_hJ2QAXW86UxC=dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kFAyYoejxB+H

On 9/10/21 11:30 AM, Peter Maydell wrote:
> If gen_lookup_tb() and DISAS_UPDATE_EXIT are the same, maybe we
> should get rid of gen_lookup_tb() entirely ?

Yes, I think we should do just that.


r~
