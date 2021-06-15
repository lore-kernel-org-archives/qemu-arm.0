Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3102511lff;
        Tue, 15 Jun 2021 09:14:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGRqPIXzRacDiSN6CGgZFCSs6k72oc0kgyZRVFvX8bVipV324zFgvY3EoPEAxRMY4Zey9B
X-Received: by 2002:a17:906:ae91:: with SMTP id md17mr289811ejb.433.1623773668245;
        Tue, 15 Jun 2021 09:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623773668; cv=none;
        d=google.com; s=arc-20160816;
        b=QyD8V+XU9DIt7+YTfm5T7HWdaKDqzxS299Ll4hXdIjPyklZjIwiTtu87vkHYO7GjRJ
         FMl3pgCP1PHDdVs317G3HpeCXU5c8Y7lNlnP8L/8qFjq+YWGAFJQ9Rw4yivK+AuKY+eU
         GugFBUsPbeYIGWsbq9IgVO/QzcfdJVx0TJH+tsl4e+8BjQtKnSEXVpD4yuQjx0b0chkR
         OM3MwoAYFMHAz4RzZ0g+NXltbty4r9kfYjD3S9kQrGNSP0UYyiRON2KyE4/IkWkw3cf6
         b3tuZXMTP85hWNHE9ZfjjDG6oUmW/wUsmrFPE5MuxVWAYHl7aRGhqsF6ebe3OzKUtQL2
         k9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bV7c96rHNe2WmjgcB3+xFNRZavyNgVjiMdEmpMT00Nc=;
        b=MA8c6sqx1+yAyl4+xsuhPVtugPWxQnqWRn/0neUFmMYX7Mzaqolzod8O+sc00rbIG7
         i8i7llKOOQq+Gppbh5Hlr31YsWUuvXi6jkjrj4+a0wn49Udy62ogoEylWYQofak7teez
         LsDECIAWXMXR1t7pF5mJKIwAM6k4wgnH16XmK21d4LlD+zYCt4cl/YQgnlwiNNvYYP8j
         rUhjOPiSDksXnIekQqPXmirZQqDFOlPKG4hFNn0I2yTJhHuopBxQ/yaYGUjVEIHoV/VM
         e+4XmPJ1s/8uH4FM8rUuHrh6yTpnbGNSOBL+O1yDL3Lj/pZABpoDjkgTZ9zdm+MXtyBG
         L19A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QVI4x4rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si15631267ejl.253.2021.06.15.09.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 09:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QVI4x4rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltBhr-0004t2-9i
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 12:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBH2-0000M5-2t
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 11:46:45 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBGt-00028Q-JH
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 11:46:43 -0400
Received: by mail-ej1-x634.google.com with SMTP id my49so23383181ejc.7
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bV7c96rHNe2WmjgcB3+xFNRZavyNgVjiMdEmpMT00Nc=;
 b=QVI4x4rnM5Sswa6UDuJOTiBkfbVXRon5e0BkNRrVN3WHNCR6kMXIof6JOdPKqMoGLm
 VKNyzSOFdAlO6JQS+mgzJVy3uvb73gKiWafnGgHmgL7BQeAe8AsVJHFamES9AgJJjXXe
 iLNKDPAdqv8sVtgNVt1Zo3v6+6gtY1/AU2+tuYT7UVp9T/u5+nxsDInf+I0QpRWuzY7V
 mbQcxLYbsJFdHpYUFrz5q9os+zu84HScQl6MHiwOQjBSUslFCM7DLEhvZYUMHN+SZzAL
 EQ4ZYDpaw1FDsg9AVHhgsrylycNHCa9X7bDKZA4bz8Z+pFoJg4/znZQBED6jcflw5R4n
 biqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bV7c96rHNe2WmjgcB3+xFNRZavyNgVjiMdEmpMT00Nc=;
 b=LJ6Gixqy1dQE0O6mbopp2ByHABCPRF4X7gCH9tfO/7tBre4jM78RCbBAFiSMb775pi
 HCMcjxMs/lQCGa2KXtvj5UwVEDOloHTKtBtxRiyKSSSvuftaUrHaw3bxflpAvC7gNlGa
 wiPl+3IXqqMxF84AAyNRtyJt2rRMJDhi34xtb66qj1f5FEShQHm1xt6ZpdbPLseBMjPh
 82Ut1EyFhllC6IFmP/amKb1jS3CvJQglV0EhrU9ymPqfwbbXRknBdCyIAQbztXffTSBM
 xbclwWuug/SaTa690iVufUgeYDc3OWZrgl01uscM2bou5VsSVX4/8UqQbFWysJzxFrLN
 5L4g==
X-Gm-Message-State: AOAM532mh17ACYbrVeMD7ferwJgpGpLHmo0lYDL8tIJTc7ME7Rq8/zxe
 LJ0y+1IVkHvzvtaJsihFKcQiN9Rnmn8A1TscIMFK/0vxHbw=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr144058ejy.407.1623771993240; 
 Tue, 15 Jun 2021 08:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
In-Reply-To: <20210608193605.2611114-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 16:45:58 +0100
Message-ID: <CAFEAcA_gbkwwZw36UuA5VC3dTn345bxcHGBiJrnunytrphq7Jg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DbLfGUp0mia5

On Tue, 8 Jun 2021 at 20:36, Patrick Venture <venture@google.com> wrote:
>
> This is a board supported by OpenBmc.
>
> v2:
> - Fixed missing hyphen in Cortex name and dropped TODO on hardware
> strap value.
>
> Patrick Venture (2):
>   hw/arm: add quanta-gbs-bmc machine
>   hw/arm: quanta-gbs-bmc add i2c comments

Forgot to ask for this earlier, but could you send a followup
patch that adds documentation for this new machine to
docs/system/arm/nuvoton.rst please ?

thanks
-- PMM
