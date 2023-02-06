Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4238238ejb;
        Mon, 6 Feb 2023 06:22:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9V/u8+Ped8L9D8QULx3X2xJfPV+reBSE6bQGBpSGsQm6VnoqGcIaclRzSOQXItEtqrHZg/
X-Received: by 2002:a05:622a:120e:b0:3b8:6075:5d16 with SMTP id y14-20020a05622a120e00b003b860755d16mr39296976qtx.56.1675693375518;
        Mon, 06 Feb 2023 06:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675693375; cv=none;
        d=google.com; s=arc-20160816;
        b=xF2WIG5Ts/cG6i8LmnAcLs0trOVGu9Ue0bQSG+sDVuYyYSbcKOuqBXhI7kuqn0hLRp
         U7oMj7TSYVm+6y0dhgho9u0y0qcNNfjIyhaQyCewRXo5AEJtaYHbo6K9VTXi3lmyF0wW
         E1fi+xOYHAg6MPxcvPvwku9vlNmUv3vPVZf64kOYRCVpl9v0X4IRZ2hkoTFcmC7v+WVg
         SZBMcEd0NhPbNva/eQntOyr+DOUbuwUY2WhHg8NKc+3mvl1x6xSyhDFjy5ybakBOL+WV
         3aZDKN+FiNAGKqZZLvS+irUERIbIGgF2Xmx8puJJvPOG4zFsPA3N2LQDqcYsaM5/o20j
         UL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Sd14rTUiBsZlxxfi75qQEG0NCtQZBHRFgoSruOseJIs=;
        b=brJxBzKq7e27d2i/aYkcXG5XLcJXXhO9k3MZV7IdyiW9R7q6kMcEU/BZ3G11uqjZcb
         0Yj+b+xcrNejM4R+g3XWmki7Gh/2Jp0oTVXsB0rLsy0j93z6eozBjRLkwMWaxPXOfLGP
         y/saQrT/d616OE/Yjw/1FoXOKRv6yBkxc0jZAQx5/So7ASYcU2JNLpXmQUavarEr+0st
         tfogPM/CXZ4TQBAeOv7DDQF+NTympwU8C8tX/ChgXXxT91M9CYraLHwZ6rb/JEb6BpkG
         /c6Sw1VhHGidpAuJneB0VlbGBEyoCBtY7/g/eSLIQSGLOs7VTm9Oqv7b719FwOhZ/ZIN
         Avig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlbnOOz7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020ac8578a000000b003a7d892d7f6si8584627qta.361.2023.02.06.06.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:22:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlbnOOz7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP2OO-0006U5-G5; Mon, 06 Feb 2023 09:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2NX-0005jT-1e
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 09:22:03 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2NS-0006UX-OL
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 09:21:53 -0500
Received: by mail-pf1-x42d.google.com with SMTP id g9so8474777pfo.5
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 06:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sd14rTUiBsZlxxfi75qQEG0NCtQZBHRFgoSruOseJIs=;
 b=XlbnOOz700kul6SPydThmsgAlFmFiFPHtBYZstTF3H9zDZSQUXZu1D5zoYtlAVecg4
 oBzKSmhrhH33GrV7mOX/bV/EDO1Fnwi9hi9ZKl1d5aNT4X/O9cVrbsKHHVtn40iGy9VR
 zFXMWUM2eFPdy5Dj6cLf+45zR8o9LPU42bt63IC5AhhLlShKIDOJYatOrexYFR+f7xZT
 dbGnQI25BiNqyPJKApuMyChW1FfmnOxHcJYqFEG7wjJ1hR6oISPCdvB7+dNEYuvNKgD8
 mmArnDw6a89D+oECqAgZ45y+iWJPSc0QjmuQRdDZkGzUYsgXkueZiFLe/em2wtJnxQm6
 7Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sd14rTUiBsZlxxfi75qQEG0NCtQZBHRFgoSruOseJIs=;
 b=woKNT2lEmqKK/7ihDivouWNSClvsQw3TbNAv6X5F6IfyoHxHXInLmooGpvNyTqqNvm
 BlT9xmGphm5hOMOsxrE8j+4IDlvIHMU5or2z8j5P1cLpI3Aeed7kr5pxOmWS8kw2f4VV
 eqXaj9bvQNcKVBRUAYB7bWW8rN823Sp1kzbqrzLlDmQ496Fpqc2Hi1nY3dXMPQM7piS0
 JO07ZXX83PuaZWSKvdtCcFKLl2aL/4yvx9jeuN8OCuyVvDd2aewiYu57lniOsHWag4P3
 Hhkk3FeUD2Ih7WWjzJpiT3X7mlKU2QrJZmMSxNHqVgW8761hCXSv24l26GyKDf18zbrf
 avPw==
X-Gm-Message-State: AO0yUKUyD0l+e2MVcleIp1Ff89BAT5QXb7zObWAG1rZqNFo0GpU/mXfX
 stxWpRp10HUyF22JeQBeg53YeV9xtEaz7M3WtC6K/g==
X-Received: by 2002:a63:6cd:0:b0:4db:3747:ff55 with SMTP id
 196-20020a6306cd000000b004db3747ff55mr3124942pgg.110.1675693309407; Mon, 06
 Feb 2023 06:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-9-farosas@suse.de>
In-Reply-To: <20230206140809.26028-9-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 14:21:38 +0000
Message-ID: <CAFEAcA83T5v0f0FkVh5k_91m1jkyYAybBYLSvYXrM3-J=NAz=A@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/arm: Select GICV3_TCG for sbsa-ref machine
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: ZmzWwIThLm7E

On Mon, 6 Feb 2023 at 14:10, Fabiano Rosas <farosas@suse.de> wrote:
>
> This machine hardcodes the creation of the interrupt controller, so
> make sure the dependency is explicitly described in the Kconfig.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 552e3d04ee..823f8b11f1 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -232,6 +232,7 @@ config SBSA_REF
>      select PL061 # GPIO
>      select USB_EHCI_SYSBUS
>      select WDT_SBSA
> +    select ARM_GICV3_TCG
>
>  config SABRELITE
>      bool
> --
> 2.35.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
