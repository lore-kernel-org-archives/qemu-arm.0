Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp483745njb;
        Thu, 17 Oct 2024 15:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcH/66KHeCImyteEhLgDBVPNbfnXVwlDSBQG0CbeqXp7t1e7gdzUZaAIkOwv3fZ1JiNoR58brEwUjd/g==@linaro.org
X-Google-Smtp-Source: AGHT+IFSpVuwSTu56O0eZkBVhF+AxeOYVKoVbWwCTeN23EHRkMMzwvbUHmVh+BnFmx94y5K0p3gE
X-Received: by 2002:ac8:7f8c:0:b0:460:ad83:96f3 with SMTP id d75a77b69052e-460aedffc33mr5764131cf.59.1729204461042;
        Thu, 17 Oct 2024 15:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729204461; cv=none;
        d=google.com; s=arc-20240605;
        b=eqREU19mtmxIZEWUa0+LAHJVLXW3+X4VhV/zckvTjyEOEsNMwaDOObtynyAVzNf6Mx
         BJSXreXh9+UjR8K8G3Nqq99O3DHOgjq5AiqINvu+LsR+NrY5PryO0GU9qrdCqGz6xTSt
         lHAdAkLMa9W3RdjFC7nk1BobBqQqxvPCYuWMfkfjMoPoyKv4RKIndZmu31mXObXQalmq
         +FUON133hPAEHUVQ53Wb2BLUYcVE3FW+Pcriz3yyKKlfeR/lijEKu1FWxxmCwQGnpSlI
         hKbnMziQcM2f3XkKIP89j+a98UNN4u6DO6RzPAgB/mNzsGPCLjGxM6kO6Wd20VjB+EII
         Kl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Czuq5TZLUM6h/fTZNMGw9xt2q/K9IRxXHkX5gz7HDEA=;
        fh=IIers6Tsdt9NdDeXEf7BFv3Zs0k8l5mJe8RbgC9bzGM=;
        b=YcsVZbwe9TXn2Y1tYzXPSFhNhAC5RS3InXWPFjA66mlVtrXeDzoShxp1iy99iKnX6P
         U1LTCOL58TPjZGs/ayDz8svHDU3oPhBpAclmv9zEmPMfVYlHyYCfpDtS64Qo/Yfh3RVS
         ICdRlAt2HIxooaKWIRst0pt3S9wrZXiTmew6ZINflPMU+RI0irmDE/5clOBS/5VsZNRE
         NnilaWniAyePDKlNpKNas39v1kmIrUzKf86GJXYOwS0B7Irwx20RvDipi2C2DMBZLyvz
         dQoJoBGYdIvVKxX/prT+iZESW0rbp2oBJfz+tjQ0kqthkOaUewb1mdtStwSFMysfAGqV
         NksQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MMPoMFKz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460aeae4adbsi2959921cf.788.2024.10.17.15.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 15:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MMPoMFKz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1Z41-0001Nc-13; Thu, 17 Oct 2024 18:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t1Z3z-0001N0-HB
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 18:33:47 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t1Z3y-0001ub-3z
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 18:33:47 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-71e74900866so933657b3a.1
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729204425; x=1729809225; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Czuq5TZLUM6h/fTZNMGw9xt2q/K9IRxXHkX5gz7HDEA=;
 b=MMPoMFKz8PuipWasOqNmzyXEmWk7UKs/3OtXgmZGMfzZTHqN7CxHVNndgBifxUMRnB
 Vd0BJ2qOrYcajS0BnJoftQEx2pkqVwIuhNqvtRYZQLpauMVqpoFa9xG6loXrIuzmNZbc
 EPL/8kk//p7kZVRhvAJK5PTyR9To0WzKvNhxP60s78AjgTWIc6PM81zzfwiYljZD7OEm
 fGa8Ev1i0U9OzBWHE43UQOH+QD0DD/O3MNb+1G657WuNrCnfPI9jYPxRPtOhuA2kPW8I
 wIzdlBap8GbM/bbEXGOCZ/oIycTWWGxg7GIKO3cz4apwjRyLSX4QL894O5GiOfEq1JHV
 Y1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729204425; x=1729809225;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Czuq5TZLUM6h/fTZNMGw9xt2q/K9IRxXHkX5gz7HDEA=;
 b=mkwSiP704YUSp+07fTR/kG4lXzS2maWShmy4/kwKn2qAl/F/LNBOAtTXID1us2oGgJ
 zjvoQI3ETyWuFq6lnqa6MFJOF0s+TqFXwpv3m0T7lgtLdFv5D3n10MHbC7cI8vnZI4RU
 c5CwQy/NITSbjd+RkAjM+JRl9UR5PAKXPB2Ps+bxMNNFCLi4FhfNgu+dhQibvPyABt0p
 /ln0P4AksfNmQeTi9CmYrZvHU6ANMZiiKEhvMq1/7PqUjqv0MzOuAwSUg3JKDZBq06UV
 lAySn/wkgKne/1yS5nKMhXx76DOm95RUjHi7OIiGSb92BOaqng3c9uzUw+/aTi7q2fFt
 7Twg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUghOp7VXUrhqc0/14w9bqBEckRpYstEyoVCAvtOvaQuKygNnmTqaMCpo15xw1Jho5DyGCjXWZYQA==@nongnu.org
X-Gm-Message-State: AOJu0YyQDL8w5soNv4GZ+mzf9vS+WQ/bY7+UU0mrFTLw2lQnzCcHRc8x
 LpdvXWdlbc1xBwby2e/9X3YDMRK6dD1w/R62lAwjUHbifdnDuwqVxAfaEs2AIVrQqhs71YCQoqm
 v
X-Received: by 2002:a05:6a21:58d:b0:1d9:29fe:1de0 with SMTP id
 adf61e73a8af0-1d92c5ae136mr447469637.50.1729204424685; 
 Thu, 17 Oct 2024 15:33:44 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7eacc25249esm118600a12.55.2024.10.17.15.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 15:33:44 -0700 (PDT)
Message-ID: <64d36e10-aee5-4752-b075-2bfcf9e74bf1@linaro.org>
Date: Thu, 17 Oct 2024 19:33:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/omap_mmc: Don't use sd_cmd_type_t
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>
References: <20241017162755.710698-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241017162755.710698-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: gxKzfnefZgig

On 17/10/24 13:27, Peter Maydell wrote:
> In commit 1ab08790bb75e4 we did some refactoring of the SD card
> implementation, which included a rearrangement of the sd_cmd_type_t
> enum values.  Unfortunately we didn't notice that this enum is not
> used solely inside the SD card model itself, but is also used by the
> OMAP MMC controller device.  In the OMAP MMC controller, it is used
> to implement the handling of the Type field of the MMC_CMD register,
> so changing the enum values so that they no longer lined up with the
> bit definitions for that register field broke the controller model.
> The effect is that Linux fails to boot from an SD card on the "sx1"
> machine.
> 
> Give omap-mmc its own enum which we can document as needing to match
> the encoding used in this device's register, so it isn't sharing
> sd_cmd_type_t with the SD card model any more.  We can then move
> sd_cmd_type_t's definition out of sd.h and into sd.c, which is the
> only place that uses it.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 1ab08790bb75 ("hw/sd/sdcard: Store command type in SDProto")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/sd/sd.h |  8 --------
>   hw/sd/omap_mmc.c   | 22 ++++++++++++++++------
>   hw/sd/sd.c         |  8 ++++++++
>   3 files changed, 24 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!
