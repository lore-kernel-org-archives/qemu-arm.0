Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3729460lfa;
        Tue, 27 Oct 2020 04:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPoQx+wwqT3CMowb8b6FS0WkotRfv+L9iWTbgVVuxR7AY3zxKcG5wChvbLZUYljwU33LBK
X-Received: by 2002:ac8:5956:: with SMTP id 22mr1517003qtz.311.1603798630275;
        Tue, 27 Oct 2020 04:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603798630; cv=none;
        d=google.com; s=arc-20160816;
        b=xreEIMLzLwc0Er0B3OE9DajwgEK93tUD8xbjC56s260mDoJjE3dc7LFnl5+YwKdPTv
         Yt3rRraGAarI3TDRANffW1/XRpwsa1l0/i+oO+qBzsEXv83h0SMyDPm+hJPKQg/xRP5k
         e/xEmlvH9z8Qdv8bjoN8IhKolBlq0u8W/V5cJuvp4Z4BokGEY391b+wQKhGmB94x4OXk
         oL5QMmFqCoRkp0voeGwZQCO2nVkSeVEqwUdfGt0Rp3YkY85I+03aSTDIkD6Q9uFwNHjD
         yTbppGTtdX3scG5jELolL/F2j7n1tWt6MiQ8489bh9MiJOw9i3e7ReuIxjtVmii5EDd4
         kkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=z0Sn1/klbwmGrH4EiwRl2FFYWHdN0vE5o4xE27RcLts=;
        b=MGg4ExoCgmzgsUL/TrdAWgPFmFXBIH89WPwj2XqTMITVYrueIDXvvHnXIF8Z0irWnl
         q7cx1BX9tzQhHfIJPr7AM9zoOca6hdk5lJmATr0QK0HgqYyTTfj75Tx0kJPLwJyIMfqw
         6LXqPxvR0c/5UkzHCEnVI8l7knq9V747DIxeiJVO2Y/eslIAVH/n8njf9i98UyT6D7SD
         01yEZIqIx3yOexMRA3duRbIttHph8mCcQ1Ak3Ict+srVkfLvuBgbdBfGN7pPU5YW2OBF
         PiS6/mG1tAUIju86lH2D3nLin4OmOHEGscde3x1ZIeEAfdzCzj2r8NXVKqlP6g7bl/Hq
         eEyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GCKpQyTA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x66si634505qkb.361.2020.10.27.04.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 04:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GCKpQyTA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXNHV-0004Td-99
	for alex.bennee@linaro.org; Tue, 27 Oct 2020 07:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXMsu-0005XC-Bq
 for qemu-arm@nongnu.org; Tue, 27 Oct 2020 07:11:24 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXMsq-0001GZ-M3
 for qemu-arm@nongnu.org; Tue, 27 Oct 2020 07:11:23 -0400
Received: by mail-ed1-x544.google.com with SMTP id bc23so994704edb.5
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2020 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z0Sn1/klbwmGrH4EiwRl2FFYWHdN0vE5o4xE27RcLts=;
 b=GCKpQyTAmNshAwD6cw9uZDv88lOJMqdzzXTdX/hFzeLbvbqzbVAz3r742/4JYqbnYV
 jBdDvK5mfVRDNWIUJ9pHgEzyy7NrYfMk/e8Zij75c+CkZthrNpHB6kkaUBcZ5mkloodu
 myITSCrPQ+AzcRW9cZj8rzjN2m1CXRH4I7kYrp7wxrQuCjw3gks/lUHw41zK862UBwfs
 0G7l0r/t7mfx/bCLw/F3uY9g2YUZ6xrFo+Lbe4kY+QUF6tpIefTUTGGS0b8BJ/h+az1+
 VxuHugxkghqjuO1UM6MHKBRp4Zjkw62hO46xnGXYh3I01k9/HHjIB83oS0OgZ0qC7ZnW
 7hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z0Sn1/klbwmGrH4EiwRl2FFYWHdN0vE5o4xE27RcLts=;
 b=j8DHI13G3zrmPxcSlo0adbdaYhqJPSt7IMCwvi0JTm1q9abi5h+X5wpHg8VZaLp4LS
 MYz+/0C4nk9N5XU5j3XlheTXyrB4Skuvb8YKOxeVr4Q7VbLOumh+ld4TsuRrD/zQNJrT
 uZxkieUFrr6r/196HkINTUct2oK64bPJxBsC9DbwUmxHaqFaG5IIFTJFoyvr8aMj60yS
 87AfCNukgPFuz7SYjtZozBJ3t312hoQhLa1nlqaMPs8rgAmvj3mnNvSI0tfqxP6/KWVA
 Hup7gX8EwO1YsqJLMHV6DqNqOyJAOTYM7M/UvxkWx1srwvsCfnGiYrEIjN0Zhr01jLoX
 ZvAw==
X-Gm-Message-State: AOAM5304kZX+mnDa/AW/oa2hnscmjUGbzHD8sZ/5VpSHG/SoHwMpei/E
 pac+DJrkl4z/1HCfWh8hwwCrI8Ef+e+uAViKbZHRAA==
X-Received: by 2002:aa7:c683:: with SMTP id n3mr1611636edq.146.1603797078712; 
 Tue, 27 Oct 2020 04:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201010135759.437903-1-luc@lmichel.fr>
 <CAFEAcA-F5WCv6We3V=kCV8vH79ko=KGHYWKLaxNVEd9HjFES3Q@mail.gmail.com>
 <CAFEAcA9fHTO2f_KdCnFvqhEOwTzOwtMf=EhKY=9S_5twpabaCg@mail.gmail.com>
 <63d302c6-5cd8-e321-090f-7b1a5979788a@amsat.org>
In-Reply-To: <63d302c6-5cd8-e321-090f-7b1a5979788a@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 11:11:07 +0000
Message-ID: <CAFEAcA8whOBFTqEeOO_S9+G0O_dafQitvQxeghSfQT7ME8o-Ow@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPVrbxuA4CNr

On Tue, 27 Oct 2020 at 08:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 10/19/20 9:31 PM, Peter Maydell wrote:
> > On Mon, 19 Oct 2020 at 16:45, Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >>
> >> On Sat, 10 Oct 2020 at 14:57, Luc Michel <luc@lmichel.fr> wrote:
> >>>
> >>> v2 -> v3:
> >>>   - patch 03: moved clock_new definition to hw/core/clock.c [Phil]
> >>>   - patch 03: commit message typo [Clement]
> >>>   - patch 10: clarifications around the CM_CTL/CM_DIBV mux registers.
> >>>               reg_cm replaced with reg_ctl and reg_div. Add some
> >>>               comments for clarity. [Phil]
> >>>   - patch 10: fixed update_mux_from_cm not matching the CM_DIV offset
> >>>               correctly. [Phil]
> >>>   - patch 11: replaced manual bitfield extraction with extract32 [Phi=
l]
> >>>   - patch 11: added a visual representation of CM_DIV for clarity [Ph=
il]
> >>>   - patch 11: added a missing return in clock_mux_update.
> >>
> >>
> >>
> >> Applied to target-arm.next, thanks.
> >
> > Dropped again due to segv in 'make check' when running with
> > clang sanitizer, which I gather from irc that you're looking
> > into.
>
> The fix has been merged as commit a6e9b9123e7
> ("hw/core/qdev-clock: add a reference on aliased clocks")
> and the series also got:
> Tested-by: Guenter Roeck <linux@roeck-us.net>
>
> Hopefully it will make it for 5.2 :)



Applied to target-arm.next, thanks.

-- PMM
