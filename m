Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1484960ejv;
        Fri, 22 Mar 2024 15:45:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxnew0NtmhRN7jOf3n8LzIKOGd+x6HPxLidkKCAZXJ2XLh2inb3TmmjXXqKUVDR4ilxk7jkvq5odA9sObPyJvOKMXyj8vP
X-Google-Smtp-Source: AGHT+IFrNwsL2agXsufY0AqEf3yY4XKp3Kf/s5ImvtAqD42Fq/knb6cz9D8TtykqrR/q61ov1NEN
X-Received: by 2002:ae9:e418:0:b0:789:ea39:51e3 with SMTP id q24-20020ae9e418000000b00789ea3951e3mr955384qkc.18.1711147523593;
        Fri, 22 Mar 2024 15:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711147523; cv=none;
        d=google.com; s=arc-20160816;
        b=zagPlkI/Cg3QpP3AQP7QMIy7jAMnWiVO6WWX1BJ2KAZScmBV3CUxqojWxlbQ0NWk/w
         9t9BQsrn9KxmrjL1uMjrBqnb1BpXeyn4VrJh4o9AGTgSJP/+wivMeYSYXCp3cywHX0TA
         V9B7i2SZmmU1ECKrTdnxcEjmIC9f1WqWVSBVsGqr99//DTxCcgRZyq7zBzKySeKuCAXb
         +0D/aV7cROaeD3RcoI9ccDkrSr88s9BKBSYpm+jhiYuEO1qyywSTB8B4dSTW1CFnOM80
         r+pMMJvTvZTpyzeWvKWOh7PGnpz92cQWwZkGtCZFuGmB9HQ9CDLBTQAEO2FAhaHMWhE2
         XJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=gVo4vuYThVrKb1Muw9cZOVr3/HHBkWHsD4WaPLPUGP8=;
        fh=EA0qhZ5VhefJ96VR0j9ye17D9CsXM+2QbzK/15Vffpw=;
        b=u0patfFJXR22iVxJ5jlaG3z86xm8rhs+eTvor7v+UtahBYG6nMDbKh1DRNSgUG4mac
         i0jebJUfbjoFyQs4SFyMV/JhLWvhqxPSV/OWcIerjrIfl3buqcRQushWpHlPxXi6vpnT
         215kVrSah7kZJDXxnwGEgNiKrOXw6ORLu8U/QaYyKTteUJGTjGK/A+KNDATt1KvCZftN
         NlX8DRj0X8/HcLZtXSiDRMRb+nN3Zc4hPm4GfIx+ice5fTNJPv2Usep+Uwsmqa9Abz2b
         Aqw6NK+gmAv9cQrTj/II7H1+6PPLK4W9hoWdgtK6wx+qYnw8FD9dqJJhLFxEhuYbruEr
         5rYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qzm0TCRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ye3-20020a05620a3b8300b00789e6f7f6d6si574702qkn.745.2024.03.22.15.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 15:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qzm0TCRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnndD-0006id-3b; Fri, 22 Mar 2024 18:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rnndB-0006i8-3l
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 18:44:57 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rnnd9-0005Sv-7K
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 18:44:56 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d4360ab3daso43025301fa.3
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 15:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711147493; x=1711752293; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gVo4vuYThVrKb1Muw9cZOVr3/HHBkWHsD4WaPLPUGP8=;
 b=Qzm0TCRjHVIUZxGrIBPDdXh5Ctm/6B9Win1W0Ks9QgY1Ose3gfEpFRxnNd2hexnNyg
 k6Aid+Ylu+d2fF7NokOGWwIqRDn4Q/kmpSZtYbTuL2DHTmqoesyMDJQWWQ/R3i9EG1rw
 i/veFpF9wGoAN868uZzacsPXyk/1oFoYjppxwZ44+auzRmTGPDyr4SLIctZrAQ1GqZl3
 INTPX6Vr4a+i8LB8M+1on3CifKDB0/5X6NC4BsZR+D2uU8M9z70a/+xdO5Ldfz5rDXYL
 TCExWvE8YNWnvEDUd6surR1gdSWSXwVsi8hbJl6LnhKu6sbrWYdnZPmY/0EFQW+CYZGF
 m38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711147493; x=1711752293;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gVo4vuYThVrKb1Muw9cZOVr3/HHBkWHsD4WaPLPUGP8=;
 b=vrbrgW53A1eSEcEZWdPD31Zq754wj6h3+8BTUBi7lV09W9evS5sBx4hk3BJupaV3VG
 BWqLyLPQtok1HT2fn6OD+MWfNZkVk7hMS780Yb4CTlX6jX0+FY8v7cdzr8PLtNY8F5lq
 I+nwIvmN0pf74We6TRosETi+upp5NDB+Sq/pPcIUh3XlnosBTodhOldOBBzrmM57tkUR
 yRW3nJ1Vdqy2vBE8OdJZ7drtIuRbi/LxA1Cqm2xESZeTqqJXHWuWdcGai5n7K6P0kJZO
 ehJfi05YGh0zki6k04VXzpEKzEwRI44wzoIM25svLqPtYKaOse33HH903mjavhTnVvSA
 xNXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQIAMVnbcMBehHvY4dO1WxGT8Jz8EYHT2qBRl5iHAomJB24FwQeabxd0BEi8p20eab+sgfb7hg42iFN80KP6sFj6zC
X-Gm-Message-State: AOJu0Yx4g27o4b341VFjj2sgBz2Zjin2Ef0Fi9sDCaSgLUMeq8+jCHMo
 oEYhKfUp/SVZoh0r6NbGJbMKzrnRwid3EzWR+rKZP4I0238Yyh72BVYWGYk7heM=
X-Received: by 2002:a05:6512:e93:b0:515:a257:cbd with SMTP id
 bi19-20020a0565120e9300b00515a2570cbdmr6595lfb.24.1711147492753; 
 Fri, 22 Mar 2024 15:44:52 -0700 (PDT)
Received: from [192.168.200.106] (83.11.22.169.ipv4.supernova.orange.pl.
 [83.11.22.169]) by smtp.gmail.com with ESMTPSA id
 cx10-20020a05640222aa00b0056bb1b017besm277778edb.23.2024.03.22.15.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 15:44:52 -0700 (PDT)
Message-ID: <c0478bc2-73bb-4048-988b-a05df30cdbd4@linaro.org>
Date: Fri, 22 Mar 2024 23:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ARM Sbsa-ref: Enable CPU cluster topology
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiong Yining <xiongyining1480@phytium.com.cn>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, rad@semihalf.com,
 quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn
References: <20240312083049.3412522-1-xiongyining1480@phytium.com.cn>
 <CAFEAcA8sQnBzFq3b_WscYY1o+J2CutFrEcTGHXvbi8YVn6vorg@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA8sQnBzFq3b_WscYY1o+J2CutFrEcTGHXvbi8YVn6vorg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VTfciLY3+ete

W dniu 22.03.2024 o 19:51, Peter Maydell pisze:
> On Tue, 12 Mar 2024 at 08:32, Xiong Yining

>> xiongyining1480 (2):
>>    hw/arm/sbsa-ref:Enable CPU cluster on ARM sbsa machine
>>    hw/arm/sbsa-ref: Add cpu-map to device tree
> 
> Thanks for these patches. I think we should squash the two
> patches together into one, because the first patch is only
> a single line, and also because we shouldn't say that the
> machine supports cluster topology until it actually does
> by putting the information into the device tree.
> 
> There's no rush, because we're  now in softfreeze for 9.0, so these
> will have to wait until 9.0 is released (in about a month's time).

> I'm also a bit confused by the Reviewed-by: tag from Marcin on patch 2,
> because I can't see that in my mail archives of the discussion on version
> 1 of this patchset, only a Tested-by.
> Marcin, are you OK with these patches?

I only tested them. They are fine, will check on Monday.

> Also, is this change to the DTB something that would require an
> increase in the sbsa-ref platform version number, or not?

TF-A will check for "/cpus/cpu-map" node and if it is missing then will 
not provide it to EDK2. So far I did not saw patches for firmware side.

I would add bump of platform version to 0.4 one. It is cheap operation 
and so far (from firmware side) we check for >= 0.3 only.

 > Should we adjust the documentation in docs/system/arm/sbsa.rst to
 > mention that the DTB might have cluster topology information?

Yes. I will send an update to mention that NUMA configuration can be 
there too (we already export it from TF-A to EDK2 via SMC calls).
