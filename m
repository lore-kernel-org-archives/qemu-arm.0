Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp59029lfp;
        Fri, 15 Jul 2022 01:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vNK0ALVCAVLTugiNOYgkIqZG+5z3PNQ0ky6yHneN86cmwsFh9/WkCRM1T33MUYFq8wv9OQ
X-Received: by 2002:a05:620a:2796:b0:6b5:a453:3740 with SMTP id g22-20020a05620a279600b006b5a4533740mr8543267qkp.717.1657873618505;
        Fri, 15 Jul 2022 01:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657873618; cv=none;
        d=google.com; s=arc-20160816;
        b=lV3i0egxMA6N+903ZJACrEaGgCLInPsW2U5PfvFQbvVW3t9MHNNVEjvyyb/Yl7tteW
         nws6SHl0Be28Dki+8FXcCJ2FBwZTzoNxIAhfdVo+zTpnE5YKs6PDtzyWytdb/6QtyQDq
         mBs+nkyuiw7CFPnZkjq30DgiGEWG3tfSK7vadLjj7jhD5ttgmf3zG3H5xwN8IrmKTJaK
         yLjAG8jVvkzP2YuUDF5ZGx1j3bco5oKkwMnuOG1a9gO/RrqU3Av7HBVNRVqvgAhihW/i
         CH36XmpwmC988/jNSPoXafsaJn8cib4ZX7wVOOaIyDIHAdiqCEk9jWt/ay9+rMmPkNpF
         gdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4+e4JROKuz771w3kwRmCoJ57xO3bV3Zq7zUo8kQs2h4=;
        b=NN5tqcQW8NX/ch3InrJ7yew1KH+jcPNUE/KrFcNOBeijjFi/zmCkg8OJY/xYsmOVY+
         1oJ9AUZMY9JmmRhSdtc74KCuO6byy0PjtHR56OULKKG1hxda+QTXYiq26Oa8F5YjKtwC
         xpu1NALEact3cNPmtQwZ6y6Pk6xpXq4tu3jNiTOxMODrwapouSW4k+4ssisKtIsVk9cC
         cK+DiuYZk1H9DPzg3SdJv3oCv31A5yIz/3kG9bkkhY4dDQzGv6UAlX9B8g8HwyHF8x/N
         KriMxk5rQCAbaCZegww6xVd79hcFq2EyK6SpQLY7Ym+RFr7/AVUGuKSXjA6eVMru7N7K
         IRSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XyvdHgZq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a0562140c8500b004736fab5617si1943401qvr.488.2022.07.15.01.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 01:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XyvdHgZq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCGf3-0007kh-VB
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 04:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCGeO-0007jf-6h
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:26:17 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCGeL-0001r3-U0
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:26:15 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso40301737b3.9
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 01:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+e4JROKuz771w3kwRmCoJ57xO3bV3Zq7zUo8kQs2h4=;
 b=XyvdHgZqLVoATNkid/bYH2QAphwCFxoUsbChypsWkkVirdk0STmidtbG1r+4P9P3g7
 DXdt8NFOW8FVz1697WpLeFH28rxgs5qzlxRYAPqAyLOnZoF00hCdTeI+MIAnXZUKJeHU
 +CHHNdRC4gWAZIWpFRaHIT0HJEr0qV3RYHyUgcbresXwK2krwX0JcD7pzSg6G83Yn/8E
 IdCb0ysFcbckiMs57NMr32BehqWIV526Z7aYOMp0AlQLAHa0EwDnWwsIw+r+5JHFChfs
 FTyXlUAfK2MQ7lipd1atEYPneiEIINTgJ5jAnKvo8Z05CC9aQW7OrwpnNJTBkeFbQCoF
 aEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+e4JROKuz771w3kwRmCoJ57xO3bV3Zq7zUo8kQs2h4=;
 b=cjFzN7et+DhYVkH9XwUIlk9HO/5Ku9Y83CJBGiGPRVvsnv65q2D1BQ/hZ00db9Ifwh
 JNxIbmQ63G3vwSkf/o3ym9bUUACkOBnYzP0EnjMAvC1teg67Fq5XKYx1Tt4BB8tR6U72
 gAGNq5CSbICiYIjX9c1CA93YtvG+FUfpGgDvWeuIHuq+HyW9H6nEx9gU7IK7TQwnix5P
 dJQ+HnR7qIGhiZ48mTtiBhEl+70nIpLYzYcY9AXKC9Db/mXhUnNNajAaGJSBhjdotRCg
 l6pHS34Dqcqa6XF4qlpLCkq89/+Aex6YwcybGFTpfahGlKW2vo0auI4YXjWEzFqqBo7A
 u58Q==
X-Gm-Message-State: AJIora9qKOtFk1d66hYZqXPFpgdbyrxxLAfXgpu47kc3xCjEC/CvS6AI
 bTWd7zZMInn0i6Imlie3nYXJpVolWZYJBBxNxOZJ2g==
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr14859270ywe.455.1657873568146; Fri, 15
 Jul 2022 01:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
 <20220714015637.817066-3-quic_mkurapat@quicinc.com>
 <CAFEAcA9MZ-yNSY0c7MiXex1U-t3XNzQRUwXiMhJg84tYVMeyiA@mail.gmail.com>
 <a285e9f6-9ae6-7abc-eedd-22ec1919ba99@quicinc.com>
In-Reply-To: <a285e9f6-9ae6-7abc-eedd-22ec1919ba99@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 09:25:28 +0100
Message-ID: <CAFEAcA9Yt1nEJU+C+H4OajKrSb8rBMLoVmfrUzR-xjc6qx8yfw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/sensor: max31785 : add fan status, tach target,
 and tach input object properties
To: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Graeme Gregory <quic_ggregory@quicinc.com>, 
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AwIlhp0og12X

On Thu, 14 Jul 2022 at 22:14, Maheswara Kurapati
<quic_mkurapat@quicinc.com> wrote:
> On 7/14/22 8:10 AM, Peter Maydell wrote:
> > On Thu, 14 Jul 2022 at 14:04, Maheswara Kurapati
> > <quic_mkurapat@quicinc.com> wrote:
> >> This fix adds object properties for the FAN_COMMAND_1 (3Bh), STATUS_FANS_1_2 (81h),
> >> READ_FAN_SPEED_1 (90h) registers for the MAX31785 instrumentation. An additional
> >> property tach_margin_percent updates the tachs for a configured percent of
> >> FAN_COMMAND_1 value.
> >>
> >> Register                property
> >> --------------------------------------
> >> FAN_COMMAND_1 (3Bh)     fan_target
> >> STATUS_FANS_1_2 (81h)   status_fans_1_2
> >> READ_FAN_SPEED_1 (90h)  fan_input
> > This commit message is missing the rationale -- why do we need this?
> The STATUS_FANS_1_2, and READ_FAN_SPEED_1 registers are read-only. I
> added these properties to simulate the error device faults.

I'm not entirely sure what you have in mind here, but
QEMU doesn't generally simulate device error injection.

> > I am also not sure that we should be defining properties that are
> > just straight 1:1 with the device registers. Compare the way we
> > handle temperature-sensor values, where the property values are
> > defined in a generic manner (same units representation) regardless
> > of the underlying device and the device's property-set-get implementation
> > then handles converting that to and from whatever internal implementation
> > representation the device happens to use.

> I am not sure I understood your comment.  I checked hw/sensors/tmp105.c,
> in which a "temperature" property is added for the tmp_input field in
> almost the similar way what I did, except that the registers in the
> MAX31785 are in direct format.

Yes, that is my point. My impression is that you've provided
properties that directly match the register format of this
device because that's easy. I think that instead we should
consider what the properties are intended to do, and perhaps
have a standard convention for what format to use for particular
kinds of data, as we do for temperature already.

-- PMM
