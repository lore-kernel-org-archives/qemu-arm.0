Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp868859lfm;
        Tue, 18 May 2021 16:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcZ1ECs8PHnWGAhcZ0KmILHLO7Ux7N3RXUJdopJmTOYtCdmBghyBT+tVFyxguKdshVdET8
X-Received: by 2002:a5d:804f:: with SMTP id b15mr6578401ior.187.1621380239962;
        Tue, 18 May 2021 16:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621380239; cv=none;
        d=google.com; s=arc-20160816;
        b=csYvJbHJgXnMOCzgt+NjXbGTZtYpAQ4RDgkaucz537twrN2TovJA6GtMPY3/mlBB7S
         rQ8N4TT2Mgx2UxpJ5InYlgnif2Gcs+rp7oQIfQbJMIm9qXdgKNoKO7kUPAUuligzSnPp
         4GF+f7UKY4fVwBYHb8wlK+5TgGRbDr4VgrcJSUrAnk4eHYMC03u1tFKk0uHKGITPZrVZ
         H8K0d1jHPA5IHradTHx1wwdhJ5EYQdijZw6pkDW7MuxsPb1V7sgDIYA/GrePlLYoiTYF
         CsC501GKs1gJye4JVzVBOcT4BXdGFjciepmObjWFvvTaFMSKUyBLfe1JD7BxOb0aTkkA
         Dehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ch2PEDYS47s/svipQ+lUWEWTHqvMyVQmbWAOmYZYLic=;
        b=GNXj5oCVJOyAHkpSgHVWFhnHZIhxwX6GRtNz8zArvcpkePOCn9zL2xkFpP9G1+68Uf
         dUBseEn/H7FGZI/tDjgt/04T3RJQzOfrxK1zyvTPB0TINmnv6n3xO1HqdJVp3ky3ei1f
         sWNDX3cOvTQW3K24JYLQgqSa5y1sEGS0cCe4QeU0aumAWdxCem2DR947x6ZYa8ajGHti
         1hUqbRyjrD4z5V2uf9Fu7QAaxN+FRbzBWOL4f3M8N1NaEye+SrG9MBsPplGlfzthawav
         BbrhJOGvqiehq0qwQ5gVs4RmdGIMCOSKkWKxecqaOBAghSzzKRlaSAsxUACbcgxAYhC6
         8How==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=bSJyu5Mr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si8491574iol.49.2021.05.18.16.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 16:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=bSJyu5Mr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj949-00051P-EU
	for alex.bennee@linaro.org; Tue, 18 May 2021 19:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj93O-00050U-3k; Tue, 18 May 2021 19:23:10 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj93M-0008WT-PE; Tue, 18 May 2021 19:23:09 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id e8so2630007qvp.7;
 Tue, 18 May 2021 16:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ch2PEDYS47s/svipQ+lUWEWTHqvMyVQmbWAOmYZYLic=;
 b=bSJyu5MrlawXGYVYqimkP3iSfUNPrjUQYPDrD6ALE60qw9k5wZZEF/MI2JAXROOqUO
 cpccpd2EvVX/mxx4ifusB/4jXRFQ+EXoL/qNn+sByNk3Y3SW3Q2gaGO8p7i4dhsxC2kA
 YkSIXbwWy/pzE30DgYO0DPNx7w7p1Kb16//jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch2PEDYS47s/svipQ+lUWEWTHqvMyVQmbWAOmYZYLic=;
 b=XMqfQP0WMBw5s/20fXHRx57sF+vuZiQggVb06DY1ElPm7gkvtnXy949AQ6X81f1uzf
 t2CheoUNJ9NM8fe9/FUKYLyY+jLvFJGsSlk81aVBhy1ft4/BR0jiPAYcfNiEbLkjdJqv
 4RVaMuapyzIQm5NdAv36O9WkuBRFXqJVX8WIgXExydWC8SRxOHTj1/ZG4WMiCXOMF90A
 vnaKH86HnCvzXqfjv812fYFq7HPL2muyhEUb5yviTC+mC7dkdbbUZtVxNkE9BwtWqOSL
 hSzMe2y4HOjx2H2R37wu6byjblTGqVQtQcSSMO2sXuhvtkcj4XJUYL/OhiSHIJWjSd3/
 mYbg==
X-Gm-Message-State: AOAM533So7LhsyndyQMgdJRu25WqZTHMvLfXGwlH+ra1DblgfQ9JEiVY
 b7WIGWveFbhMFUYSJni4e3/9FrGeaR+dSasKVsc=
X-Received: by 2002:ad4:57b0:: with SMTP id g16mr8788637qvx.16.1621380187602; 
 Tue, 18 May 2021 16:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-3-venture@google.com>
In-Reply-To: <20210518194118.755410-3-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 May 2021 23:22:55 +0000
Message-ID: <CACPK8XcHLxqcsTX=j8QRQv8UrtaBREGKADmQxYuCYdFcTyF5-Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/arm: gsj add pca9548
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PLCo+z6GguiS

On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
>
> Tested: Quanta-gsj firmware booted.
>
> i2c /dev entries driver
> I2C init bus 1 freq 100000
> I2C init bus 2 freq 100000
> I2C init bus 3 freq 100000
> I2C init bus 4 freq 100000
> I2C init bus 8 freq 100000
> I2C init bus 9 freq 100000
> at24 9-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> I2C init bus 10 freq 100000
> at24 10-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> I2C init bus 12 freq 100000
> I2C init bus 15 freq 100000
> i2c i2c-15: Added multiplexed i2c bus 16
> i2c i2c-15: Added multiplexed i2c bus 17
> i2c i2c-15: Added multiplexed i2c bus 18
> i2c i2c-15: Added multiplexed i2c bus 19
> i2c i2c-15: Added multiplexed i2c bus 20
> i2c i2c-15: Added multiplexed i2c bus 21
> i2c i2c-15: Added multiplexed i2c bus 22
> i2c i2c-15: Added multiplexed i2c bus 23
> pca954x 15-0075: registered 8 multiplexed busses for I2C switch pca9548
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
