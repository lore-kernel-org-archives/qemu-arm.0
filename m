Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1131940njc;
        Mon, 9 Jun 2025 06:48:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUA/S503IgiRmW6Ncu2xyWMMk822e8DSd5wptvifRT3y5ZAFZ8fWREiuT6iBB4kdOULUuoZvGIhgfBCKw==@linaro.org
X-Google-Smtp-Source: AGHT+IE8F+OuO5wgUMbiJOQeKUXq5lD/Okx4A/5xxhhECAn9dGsd0OK7n5ITymcTiYYBkt5mB7QW
X-Received: by 2002:a05:622a:5145:b0:494:ac1b:51aa with SMTP id d75a77b69052e-4a5b9a49b4emr233478361cf.26.1749476917458;
        Mon, 09 Jun 2025 06:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749476917; cv=none;
        d=google.com; s=arc-20240605;
        b=HErI+U63NYR6mMKBCi8vWGijUo8f+dIeQ9B93sBEeGFEH6DLvfIt7JcpB11ASxngCr
         8KIQ66VT7LpCtvljiU/eTH/4Zsl6mRwvfHem8hey56BF+ynmBYLc8B3yLEDYLxV77TYB
         pKZcXBJrthICA0z9yLPLj16wMVePcVn8UQztsqJMaJsWzTqtp9SdgbVe1H42QTqD89jQ
         xfLM+tC4V5Sx0ZyUUICJbAO3jA8SOBq8RERczFmK/TDAo73pK+/khx7lqqnOJ7OxdS5I
         UEDCgnBNssNcLzBZtrll42sCS2uH4bsDiyHacIjx6QIh0VcjX9ldkZp3eBSwIWreTeDM
         +rrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lOSZrvfgJd9riTfUFV+Ro6aNaGSy/IkCeAcZS0qVoa0=;
        fh=NCOZ3RaVxbBgnf2MsbJKks3/Ijy/r+n2eADGNDhN4GE=;
        b=C4O2At9S3bdS+dkhbVMctgvQ7nP8XLQidOeYoPLsfbB8Ns9YuwGOulgrY8wueaWxH+
         j3eBnX1ppQsXJtSxhz1hz24dGAsO2FOpCQNZo6/jLxBx2CSDLBFvGYksSGWcUG2O1XEz
         PS6e4BmWOlqz55PTiQdMJQQADyum2b7dh2gT7ARBVXMoEJPOGbHHtjjV5x+/BU1y5gqF
         +205p4I5rXAHgeOCqygGfTPizV0XL2pSlfAS+B514gKdabaEQ8hIdOS8eXH/rBs2G68B
         l/T7LJptPYt9nghEukbQ+Pn/nerqItS6nOID4GcLHASg2tqjMvGGcgG3GHbGHqvMk/a8
         UNVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g9/0sgLO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61116b1c5si78448291cf.118.2025.06.09.06.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 06:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g9/0sgLO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOcrN-0003T9-0R; Mon, 09 Jun 2025 09:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOcrD-0003Pd-VL
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 09:48:13 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOcrB-00028H-UW
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 09:48:11 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-710f39f5cb9so30720097b3.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jun 2025 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749476887; x=1750081687; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lOSZrvfgJd9riTfUFV+Ro6aNaGSy/IkCeAcZS0qVoa0=;
 b=g9/0sgLOQRNcdslC+55G5EXEONgDs7NCTQvkWPxsdtd4PcQiPVADCkxyWapWXg97b5
 0dMuEt9ZbUdPLOSCeMHAllreR2xsg4Ux/9eLK1ldFB2vTrRDwgt/i0Mx1ubnFdfAFNRr
 64bp33EbUMMYcdh/xxRvirnJkEVTJ1dVlERLxaeCW3BoJm3Ypw7LJy1XFeaZ0R4k7PWL
 pUEsdTH3Y2wUuuoJmVSqP3cFBm+9TLnOwtsGb9/AZ+6Bj2YhJoJt/4i72wB9xVHByFYT
 ZdhAc/JO+dxLd/S1wSzvu8c6DJMNeWSGpjPEqKgJQUN90G+cBZ3xJZch8ujodVxPpFWg
 LoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749476887; x=1750081687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOSZrvfgJd9riTfUFV+Ro6aNaGSy/IkCeAcZS0qVoa0=;
 b=jjxkOuglO+UymSH+yBafw65yJrqXQiRvse13WEnjnEHxZlS+ndXEtfuUBc+n4aiDzs
 YHHz4YgIe0kc5bPzGCPwKGo1nJfJm9Nqv1emRJjpxDrJ/yqDLVyWlFIXZdrlmMPyx8YK
 PcCDGAWU7kJHvXIscseYlerxW47tCVDnSpcs46VhsPHBHP3Bfk4WuEvl4OPHCqIvK4lU
 V9G8LIlT4ZjaWf6dfUH5C1LKsmtzsAKim+dmCRtmhWR3f+hTYO98HBRf3Tuw4wjDFUBV
 3ZQh8mmdnp59Xs3HMi0jw+DDFG2bPv/vFuB1XYRk/rlzHLwSjm9GwBvusg/u+quk7Ulo
 0Caw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3wermI+wJozWwlkYBt0Pt+d7gtktszyYmFkiOZvP88Iv6DxTZQRCvCknpwAM0Wkwlk7r6neQneg==@nongnu.org
X-Gm-Message-State: AOJu0YwmDEO9MrdvJLvWxfCfGthlX5qjC2jsrUMBUcv7sG6GqIg1qDKJ
 6dMBhoKEt46nyIqY7GX5E04MlyBqHi8AIBAn0lCzXJPtSFz5pLilAi9aA1+g2SBISeQLnqREcbR
 CPAvxU8tlk5DH9lX6zIW2HmtYNi/9LJ4QQhgr52COfw==
X-Gm-Gg: ASbGnctIq7nhUMo/imDBmOlVkTyxJzU+g28Fg0/c3RP8170hzKUwNFeA8aka23ugkpw
 mrjgoiqAdX/JCklGW3Q+ZxNziINtsONpn3HHZfomb92/2uxloTzBUMQrNOtrv1xbnR8Vf+F9uUT
 j7+gOkZroYG2qB4zNGdt0q+fl5GC8aM0wDEQ==
X-Received: by 2002:a05:690c:6904:b0:70d:f237:6a6a with SMTP id
 00721157ae682-710f76e77demr198382917b3.11.1749476887503; Mon, 09 Jun 2025
 06:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250602114655.42920-1-shameerali.kolothum.thodi@huawei.com>
 <ba4ac9e4-f8ca-4885-b2ab-6acdca51175b@redhat.com>
In-Reply-To: <ba4ac9e4-f8ca-4885-b2ab-6acdca51175b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jun 2025 14:47:55 +0100
X-Gm-Features: AX0GCFsKl-Lx1CJCKQBEEGz54q1AHFyL_tfCaXG8LI3cVh7LD1JwGu1ji1pKT-o
Message-ID: <CAFEAcA_PLOkpk4zVJ7YFgturG1ToxR4k=uRhOeQxA_NQu+TFCw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Check bypass iommu is not set for iommu-map
 DT property
To: eric.auger@redhat.com
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, nicolinc@nvidia.com, ddutile@redhat.com, 
 linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-TUID: ncQROUzIrr5x

On Tue, 3 Jun 2025 at 10:50, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Shameer,
>
> On 6/2/25 1:46 PM, Shameer Kolothum wrote:
> > default_bus_bypass_iommu tells us whether the bypass_iommu is set
> > for the default PCIe root bus. Make sure we check that before adding
> > the "iommu-map" DT property.
> >
> > Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> > Suggested-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>

I guess we should cc stable as a bugfix?

Applied to target-arm.next, thanks.

-- PMM
