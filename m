Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp645123njc;
        Wed, 22 Jan 2025 01:06:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5csEke3+jzrJtPObpWoR6Meet7pUJyqFKa7m58rTmBAHZXL56wAGGZcrtDsxC20IqcPZ8BN9quYF8Yw==@linaro.org
X-Google-Smtp-Source: AGHT+IGzvtAV9azS7VON24w+wxC0i06Hp1kbAR/Vk8WcHI0guO69kNFQduBpIWDJB9yw76K+6QvH
X-Received: by 2002:a05:620a:44d3:b0:79d:76c3:5309 with SMTP id af79cd13be357-7be6320f1b5mr3397573785a.4.1737536762613;
        Wed, 22 Jan 2025 01:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737536762; cv=none;
        d=google.com; s=arc-20240605;
        b=Oz5iy/N97vCiYe7vbFQ3XEsjRp6+j8QtBCXtAziz89ScGMdZo987owRlBFJW/sJAyV
         7U0vRLUlzVTGJsQ3veU3UZDkAL+wsglS30cAS0Q43IS/Iz0zYi4f5hbqt/slAERpC1jH
         cAi6XRbq0yxx5CTlAc0QBtLGFZYCkqmkKAyXrs11jo68yswLwuxHWqbSVJjlUeihBndA
         xMGy7QcXYzfEtl8ICEMs1onDnMs75o+tgHATkj/wQl8nzSq9J9G5lybzAmsYy9LodzOn
         o/bKdvWckhs7KbWhHCsz/ooP0dNRYCPQOgG7Z25B12CelmtPjHN0Qc7c1JTB0kJxFMln
         /XgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=77/1Bz7P9AdJWLHOi9IRZtlPTzWr+Gq8S8Ogq1MdxEo=;
        fh=MiHd99RDo/ciUCVoCMmp3l/YcDSDNC6oy/lAbDjhNJg=;
        b=Z8tMjGL2SnmPSWnOE/k265e8fwVf3kgsGXl8IkniYtqq/gMjCFQGTOWgOcjKF4k+T6
         N1UjYuX4BSiJ8MkKuwFW54rIvCpy5eOoaQ6bCTdiTAlIKuFMNGkDwbTnJ6tJ3+6EfjTv
         kXhs0ytO/eWrepL5I4z+5AoxGtge7QZkljH31QO5sYi5WRBayxmAZEzRTjuwaB1Ut17n
         ZUhonrhurptssW1YzMGbVvhGOnGyFJKUj8FQSaaFhz7p2l0uorpM6zEmTIvX0Vp2FVm4
         6jSFG4ftTqcy0i3fBdZ7PBq4rDn2l7Kz3H52WQsAJjpJ5ItWM1NOwRAgn+WIt8x1ooxs
         yXBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=maMOZtEp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614f0ac2si1415343285a.588.2025.01.22.01.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2025 01:06:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=maMOZtEp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taWgJ-0004r7-I6; Wed, 22 Jan 2025 04:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taWgI-0004ql-LV
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 04:05:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taWgH-0000oR-3I
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 04:05:50 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43635796b48so3934765e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Jan 2025 01:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737536747; x=1738141547; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=77/1Bz7P9AdJWLHOi9IRZtlPTzWr+Gq8S8Ogq1MdxEo=;
 b=maMOZtEp9Nr5HKpKErRbiST0BCsJcKEW0pjFZKwAlCzONxftmUXxOuz50MBIMCGBqZ
 yaTm0LPZwI5qBvYwK3VmFEYQmBQvJHKuHvjRDVzOCH0jFmOA+v4QaVu5J+oWLW6Lk6/m
 GFC8XNsvKXgbckVyaoTyJfIDy0x43XGLDZ8pZCcuYp98UraND3RaRFFwztX8Wu7Iwyal
 eyrX0RZhDpoZRVGqRTZUtsH4B5S7KyMayobRhc12CoiqHfIoJ06SRg1RuC3afglIZ5ej
 Ubbnprp2PuWJKDfZXPcKBNAoetYA6OZ73g0QbasZBgHKYzuzeOOizmObCE0V2wrPwP8K
 OcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737536747; x=1738141547;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=77/1Bz7P9AdJWLHOi9IRZtlPTzWr+Gq8S8Ogq1MdxEo=;
 b=A42Xs8ZrGLCXjCSlUz3yTP+UXMHaKXbg6gPnAqnUc/fm5kcJDL/BjS+V0jW6rkLZhE
 Sn7sIkk5EG/EI9cXfM7OEzumIn5s4lYIWDhasco/bwmnjdeMZPzJ8jkRZqpIqfo9XNKq
 ow9tnsIU6k/BFnC5+fm0BpWww5iwcJTPrDrapz3e2jvOu8XoAGuKrh1mpURawUa46SR4
 4GMA5/e+2O7iFpaMMUZhGN8+D9Aw5GdreVajt2hTNzmWEROZLer5RE4ycYcHNmid3uNp
 LXkw5qFsn0aQr2k9PJnCGaqFiJ9QPosAtLKMl/qZKiPWmxZ0F0xhfXc0S4t0wsM0nuSP
 +FEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy2Yd9SXdyuXJT2+n2LhxzdYlSFyL1lHGS9AUxM2OA02OJayrFxxwNSScBkwQI2EmEV5JRkl0AdQ==@nongnu.org
X-Gm-Message-State: AOJu0YwA6AyfZJbes1wHd2Mj5MbcrdspEasPX++6+MHTowMc+Cg9iwQd
 V+fv76zjT82QVBfYRvMpo7UfSV/aa/t6q02EoFIEKJhowXMWwncUImg17NgPf+Y=
X-Gm-Gg: ASbGncuJ2omx7M5okh8zQE8UT22UFqxL3eXNFtCt7sAdDpcl7EpwPmZ4ZkTqKeZOaOG
 ZVxo1jctHy1qRZCy5BR1MIm4KSHzyERqHCwRQfmX9O5SpFI9yKDSpZj/aU05DlMW7tiCfVrAlKQ
 cPJnAg6u4akJJ6W/j4aS05soo/e4Q/sPHuNyavqZOzOuqavEza1S3ubm7EIGEEk1xSbVLPKsbPl
 SD6TPiMO46Ls3W0n7r3tmXc9eLiCwefghSr6RyP4u+xOiDiGJuA/6BXrWPodGfIPd+8lYrR40BB
 xq+eesNd5IW6s2xsDf3q8irMjlmQpH47qniIvA==
X-Received: by 2002:a05:600c:4e0c:b0:436:e69a:7341 with SMTP id
 5b1f17b1804b1-438918b966emr181292175e9.3.1737536747305; 
 Wed, 22 Jan 2025 01:05:47 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31b7655sm16204585e9.30.2025.01.22.01.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 01:05:46 -0800 (PST)
Message-ID: <012e9d08-883e-490d-b591-feea8ade9d86@linaro.org>
Date: Wed, 22 Jan 2025 10:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] aspeed: Create sd devices only when defaults are
 enabled
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250122070909.1138598-1-clg@redhat.com>
 <20250122070909.1138598-10-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250122070909.1138598-10-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: Ousd0cSvVJmN

On 22/1/25 08:09, Cédric Le Goater wrote:
> When the -nodefaults option is set, sd devices should not be
> automatically created by the machine. Instead they should be defined
> on the command line.
> 
> Note that it is not currently possible to define which bus an
> "sd-card" device is attached to:
> 
>    -blockdev node-name=drive0,driver=file,filename=/path/to/file.img \
>    -device sd-card,drive=drive0,id=sd0
> 
> and the first bus named "sd-bus" will be used.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

For SDHCI:
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

