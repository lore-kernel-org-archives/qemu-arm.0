Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2923997lfm;
        Mon, 29 Jun 2020 05:08:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/BjXz39VqIOWWrr+WSUULHoE/v09Zw7HCpAK4xxelKe1g59De/b+aHjUcMF7XU/tYvugd
X-Received: by 2002:a25:cacc:: with SMTP id a195mr22964375ybg.340.1593432509711;
        Mon, 29 Jun 2020 05:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593432509; cv=none;
        d=google.com; s=arc-20160816;
        b=JaBzH4+5cEj+0VL4JsovZFjzCyvl6wvves6IBqoYD7Gn9h9SHO8MfZ+Tzw/5hr0yq5
         H1zP5Z16R2q+nR45dLisArvwLcMo2GmZHprHEyeLKzfCJ3lE4jHSVcznU75UqAvvhU+L
         xVGPaYkltNf6srpHeMlshw+9l8hhzQCQsYGvBAF1cG+zkqFeM07kRax/LwkfhxdpcvBK
         SoxHWt6hXEfAiVmWpP5xLg55YkgNxp/1j/OnG4UUYVzLoLVJJ3/WxSwr8avZ0Bl3hV3M
         OMJFe1332hHmQXl0YIjwolbiAVT7kXKLOLAf4v8mpzzLGIKi7VGO/OVPR6XzI6Cuvl3H
         BBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VcYrc9BM+14ubllFN6lBohIFrdUgNpRBpa4HQ3+JCxM=;
        b=vsp1mPj1ND83aLTCoDUuWIvJ9HHaAASYwRx9pRx2bdjxTby5GPR6e+Yn618zdG+fLA
         6W41M5Ytsj08rp3gHPm6CSW/dh/eg76QQsRz4iFi7CfVB1rrNFq1XxlyYb+bfS/AHPsU
         J27M9qId9DQoJsm2Ob3PNVno/rGnv33hw83PB3AO0bzwy2PEyMFzD51BWYWOumFH7Rj2
         ss2Tm3q7oZr2/TzgEMySs15qJb4Zb+Mo+qUi4rIjPcVqM9caQEP+91ov8DhaitN90p+/
         eaP00lYVIGhY+yUwGiA9W50b42jYBz5J3aibU/vos7kYVxXzI5piXP39V7fooxRf0Z7g
         P4hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lTH3PFoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y130si34064648yby.271.2020.06.29.05.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 05:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lTH3PFoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpsaL-0004OO-3p
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 08:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpsa7-0004Mt-2q
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 08:08:15 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpsa2-0001Ce-SA
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 08:08:14 -0400
Received: by mail-ot1-x342.google.com with SMTP id n5so15254225otj.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2020 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VcYrc9BM+14ubllFN6lBohIFrdUgNpRBpa4HQ3+JCxM=;
 b=lTH3PFoNVpMih1c2lz7VBIGfmCCrKfXTHLpjAryejkW/yoG8Qcd0Gzr25XLujboc8H
 +Y0lrD7+BxyQ2UmGH/1+/RxXhHIuXrPmVLHtUYKQHr4rdxUuej2Fn7ADLfL0ZjfDGwi9
 +EF4k/oUe6Cth1LbzQQc1eDwkNUMFNIHjzP8/mSV7WXDI9uHApp24SUuFhWwT0JVd0Rm
 0MnyFmIVCLk2bKXL5ZQnqBzETpD5hYoM0htpLZ6PcIWBRgm7byZHFvuW1uYSAGezIvBP
 iqA80QXypQmWLJjiKyl0F04W278yjRMPOjJ4iEHM9lwT2lfoMZz4i76OgJOt7b3ZXQv2
 S5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VcYrc9BM+14ubllFN6lBohIFrdUgNpRBpa4HQ3+JCxM=;
 b=TkI74aAJwP9GRd0YPyY48VO7Jckks4xJtAF2SHXQj6uMXRTwxC29+nzZvkM1Rw6EWb
 g27YvoNIszSQpGgkvOv0bqCNHHB3ccWIr8OB0Ozc/OJTOXFBt1udb1M4q35TcnYtuo91
 w4SBFKR95NSXkdM4TDt2VHurxwqWinuyD6NfQY6dUKdY/BXsTkG173GEBdaT4ODMS/us
 A+PxzHSdQYwNOEeVPlWu71nrZyE7uDjuKSQ6RHRUf2ON8PFO9o1f8t7DUVijxYeqHQas
 vETHWtfqdSMbNJP/JT+wzauIYA0qt8g3ds1C8BZIZyFpTPjNN8AoCEAtkpuhyR1lqo3A
 JkOg==
X-Gm-Message-State: AOAM531bzOrKFau13JN6jE4wFbdrGe0JASKF2nZPEa74Hny3DyRll6Wf
 deU1TErHxO5C87BGXe5Df+4y+uGZ9bP2nSuhx9LzEg==
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr10425650ota.91.1593432488810; 
 Mon, 29 Jun 2020 05:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-12-peter.maydell@linaro.org>
 <b1a56ac5-f2a7-ec88-0191-5324821f4916@amsat.org>
In-Reply-To: <b1a56ac5-f2a7-ec88-0191-5324821f4916@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2020 13:07:57 +0100
Message-ID: <CAFEAcA83LqH0dUZfk-yjmdEX_o4VNuDqAgSxe2hj9nGmAxs9Xw@mail.gmail.com>
Subject: Re: [PATCH 11/17] hw/misc/max111x: Create header file for
 documentation, TYPE_ macros
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y4pkmntj64v2

On Mon, 29 Jun 2020 at 09:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 6/28/20 4:24 PM, Peter Maydell wrote:
> > Create a header file for the hw/misc/max111x device, in the
> > usual modern style for QOM devices:
> >  * definition of the TYPE_ constants and macros
> >  * definition of the device's state struct so that it can
> >    be embedded in other structs if desired
> >  * documentation of the interface
> >
> > This allows us to use TYPE_MAX_1111 in the spitz.c code rather
> > than the string "max1111".
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---

> Nitpick, we can keep MAX_111X() + MAX111xState in "hw/misc/max111x.c"
> until we get a consumer.

This is deliberate, as noted in the commit message.

thanks
-- PMM
