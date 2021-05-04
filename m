Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3999766lfg;
        Tue, 4 May 2021 14:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNaQF8xR3eMHmou1dkofksiO8sNmCqL0yTyhV/764O6xJPjeeNz+MfLbegPyiRXsUtL/SB
X-Received: by 2002:a05:6e02:e0a:: with SMTP id a10mr21623673ilk.271.1620164855150;
        Tue, 04 May 2021 14:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620164855; cv=none;
        d=google.com; s=arc-20160816;
        b=pUM4ET9zRuvGDdYn0nB8S1wUMxh8POUfMQbjnRm59BKHltXdIdEV7wOMuwMzJGLcaM
         bCDrf/GDFZWT6wcQL+H0mt9FSkvGi/yy5/Fds1+F5cMB15tnLYAXfmggEZWZu6SBsQxr
         7Q+QZ31NNs5i7eks1myagT4YC1zwkqWAQi4mUKwUtZeIaeMJHkdVkCBHqP/oYdKFHcio
         mZXjZsLVRriW00roMn5kUU7MJ6F3Yb47q7iLtyKq2xI6/BbPL9njDj4b9Ol1YT3rA+TY
         72JF1PycmxIjV1IhJLIN1LaTY//qaL4737mnGMpSR4gpCwKP+njjcuaQ0gQRQHna5u0w
         bfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0yTKbx2cSGaDgg2iAWCPaELBXgv4X0HBf3vQFhAZRiQ=;
        b=EEQL/0X7MUNWv+lS8L1ICGjlN9hP1R3H26PWiefwjYxH2Y4scMHR9QRNqQLxwNvAOZ
         v/pcLh7INd0oJ03ClqxTJfdOGZ2bpFO7B3UyHVeCseicd6OcgHxxxmK1iBc/ZGPpOTVM
         1L0foKLj5GsAU7ZmzLWbeWvdhDytfYIbSuk1bt5dgbV+m/FeW8WTe1FHevWVsGJU51s9
         DUWwDFCb4v+LKSoyTgJYLSPS/4EWBsvqEmfZUtWhwbr9rGdNucNaYYQhd1Wdy6Chz9/e
         WwFeAWJ0gYNT60yd2T1DuRzJ9SrVQ7DlGKzhVedoerCaoajERk+tbEuVkwT6UvK26g9X
         3BHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="Chw/Fur2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si19533975ilv.72.2021.05.04.14.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 14:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="Chw/Fur2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1le2tC-0000qq-FX
	for alex.bennee@linaro.org; Tue, 04 May 2021 17:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1le2rm-0008Nh-3u
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:46:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1le2rj-0005hb-Ox
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:46:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id y26so12189135eds.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 14:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0yTKbx2cSGaDgg2iAWCPaELBXgv4X0HBf3vQFhAZRiQ=;
 b=Chw/Fur26iM4TU1q98FPdes4c7fEXZQZ2dDnFaZO+45guxXim1sWSIsfXC8VkG7ng4
 xDo/o/QMzG1hFR6qfqNA2iHWAMJTrwEbwFJ45SHwhdqwTT8k2dqI+uwQlrcHUIkkmBe/
 VdI2nKD0M3l0LRTKxistQCHjCRGsR+l8647mZti48zvEE9inIr8h0aTPmCVCJcTThd68
 IH6WiNJNNq7xFfszJFDM3sGcC8tV31pBHnMpDwR43Ckb9OcdN2kq7osJUccYFZ3XfIcZ
 GDvO1SwVb+DH1JrBGftf9T/vJcRFsWCY74XLhngdf9Vo9kFewFBJFFbEt/7OEdgojqXN
 njLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0yTKbx2cSGaDgg2iAWCPaELBXgv4X0HBf3vQFhAZRiQ=;
 b=OQE5okFTTolI2ITpcjNfcuVnwrScx/nAwHD3mvazG7LJO/QMIH2Fbj9sOedoLf5orl
 nXUo+iecY7mNo8cLNdaZawhP8MLPxXuNt4rwTkTZqQwMSCD3mdXT3QUjSQ+SjhFJ4+Gr
 WB9TdGwtEU8ImywE8KEFAU0s8TYjKyPZ/rlRNVSqoX/EDgFRcoPf7NiYLV2Qt3c6MvSk
 oj53WO8FSpEKT5iywKOlCDCaSRuq2hzIz5JHnlpYucdbbvEb7i0qDWgDywW8tOOqQHmN
 kjfW08SYVj0Ukh2b/QcvLr7KH1P9ZoVntjRlGQKSDp5kZLvhVDI3CiJudDkRNgvSLpIs
 uY1g==
X-Gm-Message-State: AOAM533Aipbjgo2zpkj3bZpS+HLYogVIOXyCrsiNr7arHvExgc3WV97B
 njyfJawwleC/BoLe5yslL67xrb1GogHIS3/yq95Tag==
X-Received: by 2002:a50:ec89:: with SMTP id e9mr15673412edr.347.1620164759116; 
 Tue, 04 May 2021 14:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210504162841.2884846-1-titusr@google.com>
 <20210504162841.2884846-2-titusr@google.com>
 <b0e4ed67-d8fd-3902-6a71-144203b9a9da@amsat.org>
In-Reply-To: <b0e4ed67-d8fd-3902-6a71-144203b9a9da@amsat.org>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 4 May 2021 17:45:22 -0400
Message-ID: <CAMvPwGqoeXCCFQusH-gAC+KYnSVSw=yo0RGDDzYNprjkH5m4_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/i2c: add support for PMBus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=titusr@google.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i/haMg8BdHR3

Hi Phil,

It looks big but the bulk of it is simple switch statements and
definitions. Unless you mean you'd like it split despite that.

Regards,
Titus


On Tue, 4 May 2021 at 16:49, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Titus,
>
> On 5/4/21 6:28 PM, Titus Rwantare wrote:
> > QEMU has support for SMBus devices, and PMBus is a more specific
> > implementation of SMBus. The additions made in this commit makes it eas=
ier to
> > add new PMBus devices to QEMU.
> >
> > https://pmbus.org/specification-archives/
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  hw/arm/Kconfig                |    1 +
> >  hw/i2c/Kconfig                |    4 +
> >  hw/i2c/meson.build            |    1 +
> >  hw/i2c/pmbus_device.c         | 1611 +++++++++++++++++++++++++++++++++
> >  include/hw/i2c/pmbus_device.h |  520 +++++++++++
> >  5 files changed, 2137 insertions(+)
>
> TBH this is quite a big patch to digest.
>
> Any chance you could split it?
>
> Thanks,
>
> Phil.
