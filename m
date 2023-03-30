Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp80215ejb;
        Thu, 30 Mar 2023 10:16:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZXZVX7JAMG6V8dTKvQJ8Yt+yL0vM67yiBxbFBu3w3o0O1xzmvNBOYl+RgMaXaR89XbC6Br
X-Received: by 2002:a05:622a:11c1:b0:3e4:e2f3:3776 with SMTP id n1-20020a05622a11c100b003e4e2f33776mr31182254qtk.16.1680196564768;
        Thu, 30 Mar 2023 10:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680196564; cv=none;
        d=google.com; s=arc-20160816;
        b=sYdbuqJpj6+sMm8VYIywJ6HOw0irOtdFc8j2Q5RhT9HUk+fJarYcWJOMr50tV+lLNj
         NjlTmL6PJXMxF+J+1Zf4+332sdrPG8ZmEwkW49UUw7J3dvjXV7vZzy1wlIb1NhupvtU0
         ztZtfqYghMBHgW/W39B7nM0494JmfIue9nFHARBL+FfPlvMV9QKpkGdg9+Db9mWvaxng
         9CWmXVSt4kkw+6SzZTt1OUm8/itfBcyuQd0g+j0p6EsWOlMAWQ7RptaYffQfMHjmEoM1
         vy2VXQwLNAvOdbKlsr5f6gKuhpXoVVzPbTzrU+V4Me522w53BcmnScJUqcoHFH14q/bq
         xDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=RmnUNt2fv7zIJyYexWKIRPZpeYxc2O4UwrnTDCVAxl0=;
        b=kMmsOkptxI8fHIIqZb7sDh9+jVDOtcDvm/RCwoO8QePRMtEKKTRT9i9k3dSQZdMQkJ
         G3eP9Ai7JvDNn3066Vp9jLXlnSgwHzqjjlDJrgpgLIeAbFkmSTnGdYP+iaAT5kWh+SM1
         XPwEIpHzmrfMRILeiOy9oVeiKZ4IwkHg8qYYJsphE2g1aiG6jwnTLL+V5++e0/wvOMzh
         gMhbq/GUox0HQ8IabmDbT6Gw89X7rsSd7Mq4ppM4tuhoMGEMQHwONXOPNbzQNvJzVVnA
         FAUpaGXaksaNGokFWtOecLYeVjhNDRJMfM0U2MomL2wLt0Q2awApmX7YzMHlvJBxoq00
         PI1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=VgGqgcb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ac85901000000b003e49520052esi12085903qty.805.2023.03.30.10.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 10:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=VgGqgcb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phvsU-0007Jv-Rv; Thu, 30 Mar 2023 13:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1phvsT-0007HS-7q; Thu, 30 Mar 2023 13:15:57 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1phvsR-0007Wp-9X; Thu, 30 Mar 2023 13:15:57 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-54601d90118so211174187b3.12; 
 Thu, 30 Mar 2023 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680196553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=RmnUNt2fv7zIJyYexWKIRPZpeYxc2O4UwrnTDCVAxl0=;
 b=VgGqgcb57SAtqW3kYkGNf/JsLUtNoltHuDZRKIl9hWHUazYU2Lg/zYiSjfTemMrs9G
 /QZX9sOnLd3iGJhPzUFVYKB2+vVc1WcJNtOSaEIlxstfLwyoVwUEkzHAdYjcBAKqDJsq
 Uw1qaWATlLYkSu1Q0FmGaDtliZJnhM9Tuo3al+aZ2jUA6n0R3zKAJau+ndN8lunQPJEx
 fzlG9cUFELMIvAlntf/RVnWqnMZIwXFCLsSVXGh9CaIAzq8+t6Pu5AmVW8ATNo70OjSN
 rZunoU8taj8CCGado+wgRbDl6paWjcSTh8dhzu99Drf+Lq9PrHywblL+aVDUtbpTIq+u
 qsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680196553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmnUNt2fv7zIJyYexWKIRPZpeYxc2O4UwrnTDCVAxl0=;
 b=qHgwG1oeDPemg6OXo41k9ngtlUsMQ6yutIBpHO4HVMKHtV57U6+cCRziAX6SueW2a9
 PT88U8B1wVHAZ+4trSvhlgdYys/irn+7+1ERtIBNL698jxp2M87/Hd2Eh1oLIYpcGvuY
 3puqOYtdOhQ6ss9YbrSRUa7mOMGblnqZ892X1f2im5ETguxkdQrEj2yOr+kp7vqw8lSX
 75affR05VGnndFR8Q0PYsmi5ylzl0vxlol+SmfWnju4u5cPvojluDSX3WgnGmneTldgl
 FY2EibA5LhI9XVi/2G/rKCZOxdne7XtYpruHyGW/IlEcxUQhqWZlLaS8q5l7w4CJewmX
 n0Gw==
X-Gm-Message-State: AAQBX9cWBPZ1osVhcbheELIrdkCgNaK74upb1oM2xTFpRicXTWsh9Fv/
 uvFI7btW7q6wqzI3SGvyWI8=
X-Received: by 2002:a0d:f7c1:0:b0:544:c7e0:9706 with SMTP id
 h184-20020a0df7c1000000b00544c7e09706mr20607110ywf.42.1680196553040; 
 Thu, 30 Mar 2023 10:15:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a81bc42000000b00545a08184a7sm3610966ywl.55.2023.03.30.10.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 10:15:52 -0700 (PDT)
Date: Thu, 30 Mar 2023 10:15:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] hw/net/imx_fec: Support two Ethernet interfaces
 connected to single MDIO bus
Message-ID: <a1824028-7aba-4b17-910b-6845834d73f7@roeck-us.net>
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <20230315145248.1639364-2-linux@roeck-us.net>
 <CAFEAcA8=0m-UFj9noTa+J69sEMP5cqTvaMoVoqHVd4V2JF3Oxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8=0m-UFj9noTa+J69sEMP5cqTvaMoVoqHVd4V2JF3Oxw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=groeck7@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: M/8QjJCP4gsq

On Thu, Mar 30, 2023 at 05:31:13PM +0100, Peter Maydell wrote:
> On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
> > be connected to separate MDIO busses, or both may be connected on the same
> > MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
> > property to the i.MX FEC emulator") added support for specifying PHY
> > addresses, but it did not provide support for linking the second PHY on
> > a given MDIO bus to the other Ethernet interface.
> >
> > To be able to support two PHY instances on a single MDIO bus, two properties
> > are needed: First, there needs to be a flag indicating if the MDIO bus on
> > a given Ethernet interface is connected. If not, attempts to read from this
> > bus must always return 0xffff. Implement this property as phy-connected.
> > Second, if the MDIO bus on an interface is active, it needs a link to the
> > consumer interface to be able to provide PHY access for it. Implement this
> > property as phy-consumer.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> > @@ -282,11 +282,19 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
> >      uint32_t val;
> >      uint32_t phy = reg / 32;
> >
> > -    if (phy != s->phy_num) {
> > -        trace_imx_phy_read_num(phy, s->phy_num);
> > +    if (!s->phy_connected) {
> >          return 0xffff;
> >      }
> >
> > +    if (phy != s->phy_num) {
> > +        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
> > +            s = s->phy_consumer;
> 
> This does work, but it leaves me wondering if we should really
> be modelling the phy as a separate device object, so that we
> can use link properties to connect the right phy to the right
> IMXFECState rather than having this odd "actually use the pointer
> to this other instance of the device"... A quick glance through

Possibly, but I don't understand well enough how this would work
to be able to implement it. I'll be happy to test patches from others,
of course.

Thanks,
Guenter

> the code suggests that the phy and the ethernet controller
> proper don't really care about each others' internals.
> (imx_phy_update_irq() does call imx_eth_update() but AFAICT
> that is unnecessary because imx_eth_update() doesn't care about
> any of the phy state...)
> 
> thanks
> -- PMM
