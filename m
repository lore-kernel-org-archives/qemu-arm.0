Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4275724lfq;
        Mon, 28 Sep 2020 22:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCZoa/KvrWcUwrqagUUu8lUuOnivRiXLY9OP93XLcC5CIMML/77ImXPreucsle+UaNv/Fy
X-Received: by 2002:a25:cbc4:: with SMTP id b187mr4183035ybg.260.1601358689932;
        Mon, 28 Sep 2020 22:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601358689; cv=none;
        d=google.com; s=arc-20160816;
        b=YBCuU9QWTWIO9FyTGiItu4jcmKK9bqQ1sa0PL9KWwkkDj8fn42dF2uPfsMXHCMh4MT
         TGKu4o0O3YNV28ufRuP2VD1skdVJL5vEw5sOs8yHSYkRUbPTa2lJ2nwP3ZdtrvJMVDaP
         9g27iUdaW9cfvDODBbszn0deqP418MJAhcYF+55HNPyN/dQH9pDJDTtBwBSON4hEY9XW
         T56bONbwjKfVQ2rWFWO9EEHODzZdD4pLYzJHufeNoKjmQkn9DfipNUhMjaHA0pVi9tfi
         kaw39NTB5Oju04rAo0MusOr1sTWZ2ONr9bCjRE9W/0B0RDDBitqbYSeOaIG0uFP6+vtx
         uN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=n9p5HKRqH3lWpcbVXdHz7U4jk6m8NJ0bELLmpYlme7I=;
        b=FSxKAzTKhlKviUiHgACprI73AaZ5QFIethJ+LerGylZoaxHnA7DZHctC7gw1XYJ0YL
         GoQ8yKhLTeXGcMaWIoG0L6VxGLlK/qf+yCie0tEGqqDtwYI3Yaq8sfsJnR5jwtdSCUc5
         b0gEs7cEGd3jm2AN4JcFV6vqxIKnpnItg+EjnCP2gbT7xy23DAerQeZgMPmHHTD1mT9Z
         g3ziJ5aluizkPdEBuak5+At1h7BE3ptFvixzrPWChTbLP64Xi+WTtIC3RVAeIVb3Qng1
         rgsuS4RpERQqW2W2MlEXt2i72KOCq60xAS6IHIaTtdD5T/kzCWf9yhlVdYcF+8QDs9/f
         EtGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=uBJdh4En;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si3032535yby.169.2020.09.28.22.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 22:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=uBJdh4En;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kN8Xx-0002rW-92
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 01:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kN8XP-0002Tk-C9
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 01:50:55 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kN8XK-0005Y0-6J
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 01:50:53 -0400
Received: by mail-oi1-x243.google.com with SMTP id n2so4167978oij.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2020 22:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n9p5HKRqH3lWpcbVXdHz7U4jk6m8NJ0bELLmpYlme7I=;
 b=uBJdh4En8UbsL7dBLhID5N2+AqAyr+oYrfQVZCparL/ER8h2gGW7vhC5u6nN6tX16G
 1U0y5RUm72sQV72wqPJnpnZ5fAPChwq1NrWSEUZI9+gDJQH5SmzjV4CCyWtKb6Vge3zY
 66P9js4DOhN1QvbM1YOTZwSvIKlYGVFqYme2bjs6flEhbKZAxcbCtRXm8FZuN4qSwDQK
 ruQ11122ETbj9lfP865qHyJ3jmw3maMA2LUhsyEmDk4qCOJkFm8dmkQq5qpjOBlPohtB
 qJcHSJgzyFDv2dlAZZ212K4ZtfKQXYm8KkB04olW1zH5WqlUkwXFvYvOFlr5AP5l14G/
 sN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n9p5HKRqH3lWpcbVXdHz7U4jk6m8NJ0bELLmpYlme7I=;
 b=OlGnTqdVYMXHi9mme6E4Z/yAGNMn4dMvWPd6NuR7kcoSCDCPhFofZyQJ7NcwAqhmyK
 0a0jMpeHE5dRudDmXy0bd6G1l9L4LlvfccpiwfNhZCKOWEEbuJWaZaGForcvhDT87zu7
 vA7v/Uxny+s5D328Sf397Nd1CJTny06NikhVZzSj0SQx/NTLihRkZeiyxvhi819IaWVz
 aPnzZrAEGbYzrjBSgagewG2N9JPLOwYCps9nYBQ/BcXMlmf/tZn+1YeX8/sAUoqvW9H5
 Q1DnmMYJIPrVF81LwGbMO5eHS01PfbUBxvke3NG9hkjggCvrCWgR1ZAqvZmNw55+OEOa
 U7wg==
X-Gm-Message-State: AOAM533zmhtk4vbv+nwLabDYiWSRiYYYuvGn3m5ZpCRY5ThUNFB02KMw
 yYKT4awvTzbPll+YJqQ+H0qsgWVDhLlDDc4+l12uSg==
X-Received: by 2002:aca:bd8a:: with SMTP id n132mr1525724oif.100.1601358648123; 
 Mon, 28 Sep 2020 22:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200928061201.1601-1-wangzhiqiang.bj@bytedance.com>
 <d6cf7464-a0bf-2748-7e4c-732208881711@kaod.org>
 <CAH0XSJtDEPnf8qLNuT_Ev3TkGQw_68cZ5KGgY_aLBThMQwU9sQ@mail.gmail.com>
 <a4371d4f-0df1-fedb-4f1b-3a29dbeac465@kaod.org>
In-Reply-To: <a4371d4f-0df1-fedb-4f1b-3a29dbeac465@kaod.org>
From: John Wang <wangzhiqiang.bj@bytedance.com>
Date: Tue, 29 Sep 2020 13:50:37 +0800
Message-ID: <CAH0XSJs4kMiVMNzFZTYJseDjDO1PuwRs=FzAxMzAAs0SSJBeUQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] aspeed: Add support for the g220a-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Lotus Xu <xuxiaohan@bytedance.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t9UC9etCZQvB

On Mon, Sep 28, 2020 at 6:11 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> >> Isn't it possible to add some default I2C devices ? temperature sensor=
s ?
> >
> > hmm, G220A BMC uses emc1413 as the temperature sensor. I can not find
> > it in qemu.
>
> Could it be compatible with the tm105 or TM421 ?

It isn't, I think. but I try to model an emc1413, so I will send a patchset=
 :)

>
> > I can't find an i2c chip that qemu has and that the g220a uses. :(
>
> Try to model them ! :)

Yes!

>
> Thanks,
>
> C.
