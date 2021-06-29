Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp788528qvs;
        Tue, 29 Jun 2021 08:29:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+OMnB+la1fyeyH+b3JqW1U0AIxtRaG3iFTdBWS0sDXOr7lZxbAhuWbNXoLMt9I2Iy6i8E
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr41190281eds.40.1624980596110;
        Tue, 29 Jun 2021 08:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624980596; cv=none;
        d=google.com; s=arc-20160816;
        b=B0HsVXMLJMX5+k8EPUYQtS4/xYskyVN/h8iijwZAxvNhHWmmQc2J5D1tgN+Mr1HM2D
         GWW69gpTsODSLzDSM96FzBFMIRK/UCrXz2Lfon53dUwl9n4S2sTdKLsGUHKfwk6rcd45
         DtVuEp7Krtt2LBYj3VYuYnGwhCZxAcvuIyGW8sHrtGwVbKVeq+OEiVIoRjcX6WjZT6ex
         P4p0XECF8pSeP8+BBd9yLwJ7vs9IBjW7/qAMgGAY8fGfyJ59MITFkoUSrolEoUUrMY2k
         WWA8cDRgJoJActAjp/X8ilAdaJ7W9qAAwhEfBZZ1MOhMSd5eVAxYTCw4bvdhvvu4b7K6
         RWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MdfKbITDCX6m8sRlWNWLycTq5IZIdSqG13zXlc0UuMQ=;
        b=O1uwb/r4/PyH+c7IZriazGnmxbFOn28a8JnRN6K7TURfSCQNh/lfSPXhL70/vYuCZi
         5D8eZxH/bZcHzD5yHZPJG0Q+z2+WnldCbo9lpQ287W6rNm54D54xxm/BrmbODedJhR3K
         504boRmeFMkTx4gbJVm3HXvM4LkSBrLzpfb5JsLFucWnMl/tuEEcV4RZ0ZjBt5PC6pJp
         JAYMys6eWlCfHUsYT6VUotTYbqpAiF6IMalsKvzAwSguMQ6JzQuqDDQmPp+M2Gv9S1a6
         VOwUCeKJjd2Hf5nc/Bf6NiildV9miRnBLEWNbrPslKYmRFPszuj/7J20pOXMN8i8NQVR
         sArA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTUNQ7N4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga41si10671397ejc.571.2021.06.29.08.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 08:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTUNQ7N4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyFgR-0002w8-3V
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 11:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFgG-0002vd-Ce
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 11:29:44 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFgE-0006PX-RQ
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 11:29:44 -0400
Received: by mail-ej1-x62d.google.com with SMTP id nd37so37102108ejc.3
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MdfKbITDCX6m8sRlWNWLycTq5IZIdSqG13zXlc0UuMQ=;
 b=KTUNQ7N4PZAX0ipo861fgx64MDG8Em0/7aoPKA5CeOEfElhNkK7CyhcR1Ku+WxUlPY
 uNVuRFh5H+MKZdX0HR6aE3AGOLSWaA40Ruk98lxfXTil9ZqL8JrlcMXBR7B7VNbjzABl
 SMK7h0AOdGjPBFAThmx/ZG5e0gQ8ezPJvaTJ0+5npePywEYhGw7usw/7w/x12x+8cTQg
 POn3VPhF4qdOM5KYbjylEW5d/5f8d+RNCFpdoYZvHMnPDAfHJ9hat8OLCyvnFgzNYy7l
 AUDdUC+CpYLhrZve/cGI69M1Np3Hz5xZx90wnQbnHyaiFQOphDx4jMOnVAVdSII0Y7dS
 ZuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MdfKbITDCX6m8sRlWNWLycTq5IZIdSqG13zXlc0UuMQ=;
 b=cuKHpYYUBs1bT+PtP1825M8B7kMhTqxVMKh3Dzpwk7KruXH5rDT02Q82L8JECX1a+0
 8JZ+yw3G6NFtUTfr8NEpix4F5OI1p5ZL9IZ66VYQ1+01y9ojcmcHVYs/NoJqjwLNaHzk
 Tvexe1C+RMuB7ynICN0Jk2tovPpsUgOC6B2o7gvyndxgM7gSQltg958PwkxtoiWEZruv
 NJaXyfjuQQVHZLPAzZ822tKUkrJSSaEzaAdXzNO/a+uWRkYeaG5CfbfnEigE4CbSmbaZ
 uRIP2tOC6oGum0xoXdBcKYLlZpdJwZ+gLM5P49w/SS8wIHAfO7BkRLLggrvRTmHykaV8
 SnnA==
X-Gm-Message-State: AOAM5325Is6AeQXeRr8E0MfpsTtFCEFsI2POPPFBzZ0T4X5V0wmpyaLd
 iFJ6Xw82N4clKnKGNT/BaQfMhgy9BZF0IQdYGIpAXQ==
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr30298496ejs.4.1624980580400; 
 Tue, 29 Jun 2021 08:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
 <20210625111842.3790-3-maxim.uvarov@linaro.org>
 <CAFEAcA9K642UHLF5D5wzS0sN8fVurcs4-TN0x6EaT=xBRB0Fkg@mail.gmail.com>
In-Reply-To: <CAFEAcA9K642UHLF5D5wzS0sN8fVurcs4-TN0x6EaT=xBRB0Fkg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 16:29:03 +0100
Message-ID: <CAFEAcA9oxUu13yHT0yzsAg57uOWH4opNUzhg7EwGJcb=_sicQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio_pwr: use shutdown function for reboot
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r7Jpxrxqkh/F

On Fri, 25 Jun 2021 at 12:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 25 Jun 2021 at 12:18, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > qemu has 2 type of functions: shutdown and reboot. Shutdown
> > function has to be used for machine shutdown.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  hw/gpio/gpio_pwr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
> > index 7714fa0dc4..dbaf1c70c8 100644
> > --- a/hw/gpio/gpio_pwr.c
> > +++ b/hw/gpio/gpio_pwr.c
> > @@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
> >  static void gpio_pwr_shutdown(void *opaque, int n, int level)
> >  {
> >      if (level) {
> > -        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> >      }
> >  }
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

There are clearly more problems with this GPIO setup that we need
to get to the bottom of. But in the meantime this patch 2 is an
obvious bug fix, so I'm going to to apply it to target-arm.next.

thanks
-- PMM
