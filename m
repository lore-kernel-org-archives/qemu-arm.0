Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2010704lfj;
        Mon, 17 Jan 2022 04:13:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG64FeGfrZuq4ECXG2UrQNkQn3S041s6TQcHJ5A/tgZTEdBFBELFO2xr23Ui8LlrP04/zV
X-Received: by 2002:a25:db4a:: with SMTP id g71mr5476298ybf.406.1642421638414;
        Mon, 17 Jan 2022 04:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642421638; cv=none;
        d=google.com; s=arc-20160816;
        b=zWZEl0rQX/dc5gYk8rLPvXukgYxyPwPJBrWsfiDfv0MlVvs5m0Kt4hQMRDeKJh8oWM
         4Ef/bLBOEbrAAtzUeGVdav+O6R2jY/movdAnLonPUJ+WrYqAXH2Zpd+Ebve8QQHuqo8r
         Re4Z/WRnGTHfOM2jCKI8qfbVHYg8BofBPYRPMpGRPmY45coDxKipPVWWMPERJdbZNusX
         IO6xMtYIAWljRO9soVtPYCUnuix5/DjhbnnQ6E3KKkgNOuRm75S6DPILsI1pNK82lY5S
         2CR+Xr1Iw7z8GyXVQ/WE9MVXfJ94nacO+Rq72o8x3vTYfZZd5Kz4gVHaCKsy98+01r1Q
         kogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version;
        bh=OjgM50sSch6qayphxBL/FLdKEOqGt+xu9eOnzYbdYW4=;
        b=WOJeLiXYiHx7ocTesmPqBsYXxV2mNIOx4t5GEAMIP89Le35Fidv9SevkokBp3lMB1M
         ydzQRtGfGran4Wk8bTu2JOpG4j38iXYR/KzsEyfPRH8rbWuh7LShVITr86Z06FLU6uPk
         ZpFrnXRTmV2vw0+9HUYC1MMwGUdgGtf8TAVWJqVUNTNUPyeOlhKslodjhQr0RKw3Rbir
         qTbL/029E4LP7iMienxe35sVN6doAvMPbdJkr/Rr+0lH3KVCAyFkmyyD9DeiV/cmIS+g
         e8iH7D8c2f9eBowZyikWkKabUXeu+OI1jvQ5f9qGZ8gvn6ts/o3tGCItl/yv7i/5qoPo
         s6JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a67si6507321yba.271.2022.01.17.04.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jan 2022 04:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n9QtZ-0001FO-Qq
	for alex.bennee@linaro.org; Mon, 17 Jan 2022 07:13:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9QtC-0001E3-3Q; Mon, 17 Jan 2022 07:13:34 -0500
Received: from mail-yb1-f179.google.com ([209.85.219.179]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9QtA-0005fM-N2; Mon, 17 Jan 2022 07:13:33 -0500
Received: by mail-yb1-f179.google.com with SMTP id c6so45144167ybk.3;
 Mon, 17 Jan 2022 04:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OjgM50sSch6qayphxBL/FLdKEOqGt+xu9eOnzYbdYW4=;
 b=PxvTQEq439gWlQ3MfzmzI0kF2rLvL1GbaQF6tIJM1Kn7O3Bkgyawb98qRWQOg8gDXr
 Uny/RtRoQsMuG7PntOFr5lI/FZJjxz6tV3vmwEioRSijIdFX2RaEsO8xxHLc4nG5Ubxx
 HflJpUgV6BiaquYYEjEe4OWZ+NvU5P0ghm+bBP++ULwWm/uSqfowmYKq2T5WxmAfyJh3
 nz2y62hhgb70BWHEGEIJuE8469xM7G9SBZF6xrDHf3Ra8x5Ka5+83WokX2dM5S006D6n
 2W5nVRcGtvEb4mGTtcN2V6uEvxR9a0fWDfTUNzQcuW1EZiI9saGffYXJwVDRkdzefrmT
 mnhw==
X-Gm-Message-State: AOAM532GTZh3cgJ6HbfDbrIJxfaLT0jniol6PTXUa4kRFRRsUNtCUhwK
 tKWiXZpR5kNAc/V6wQ2pV1w0ibE+662yIa4sRNY=
X-Received: by 2002:a05:6902:1141:: with SMTP id
 p1mr2926356ybu.393.1642421611403; 
 Mon, 17 Jan 2022 04:13:31 -0800 (PST)
MIME-Version: 1.0
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
 <1f74243a-dab2-10c8-b50a-5cafcc182686@amsat.org>
In-Reply-To: <1f74243a-dab2-10c8-b50a-5cafcc182686@amsat.org>
Date: Mon, 17 Jan 2022 13:13:19 +0100
Message-ID: <CAAdtpL6g1LWaWpn_vKPYD2AhZ1y16w630PV+WwkXDRb_9-odoQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.2 1/2] hw/misc/bcm2835_property: Fix framebuffer
 with recent RPi kernels
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.179;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-arm@nongnu.org>
X-TUID: d8XK9WIGFuiT

Hi Peter,

Could you take this patch via your ARM tree?

Thanks!

On Thu, Nov 18, 2021 at 4:05 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
> > The framebuffer driver fails to initialize with recent Raspberry Pi
> > kernels, such as the ones shipped in the current RaspiOS images
> > (with the out of tree bcm2708_fb.c driver)
> >
> > The reason is that this driver uses a new firmware call to query the
> > number of displays, and the fallback when this call fails is broken.
> >
> > So implement the call and claim we have exactly one display
> >
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> >  hw/misc/bcm2835_property.c | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
