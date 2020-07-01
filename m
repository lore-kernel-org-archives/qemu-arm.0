Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4568859lfm;
        Tue, 30 Jun 2020 17:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpcUrMUDdBGEmZuUp4a8jgcVf/W07JayIJFXwgRqTKOyI3f0Oakb/pwKVjfmyBcezmRtgT
X-Received: by 2002:a5b:808:: with SMTP id x8mr37614170ybp.134.1593564868425;
        Tue, 30 Jun 2020 17:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593564868; cv=none;
        d=google.com; s=arc-20160816;
        b=sKxuwQn9/jsJaokTahnt61bjMpy2Ktox9p1yXDkgwLwoc2bufyTqCkVNCpmuZU2g82
         +l4V0nGI3Z+V8y1k6AecXTvshnzg5+rKp9ZlDbzE17BzheRQiXae70YEH+2TMGSjVQq/
         S9xbsslLsjCwfUFW6sOQoJzMTgq/vptN69jVk3BfnsABkZlqf/7pUyZFXbc9L56x4ZKW
         iTEUiePUB09+/lXcYCuR1UlnMEt1HhWVVR29Bzf+seiSzfLoo6V81QIPVSxAuRcE5pYy
         5AkzGwoFtGLwPIe3HN/R8URaXo6GofJOau+2tjrEFAUEPZIGvr3IRw8AaRHF2DRfVgrG
         Ih7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=WEYO5wqn1hXkoO2dj67hwg0f8xHFhIY0ohSiXoO5dTI=;
        b=Prgsu5DYx/LlxhQBYwacTnfCn8pKf2wc4xWPu8BsmP6jDzPBDlKbhCpvCHySTTpof4
         L3PBsYOknbQVOhU5qHmDnZvTOA3WvG6G3qvu5x58hbBGiE7kIhtmRIFJr9SPhTXtSHyk
         eoWF9HmYJOe1vmGsGsc+2kMUoJBTwCmJ6bjvyWPV85ycPqVkzPWX9hEH0/HDb0y/zrh4
         ksSY1JsKY0S/ewygEDNm6v29JPUJsio1dPeBTcFpRSXy+UB6C01UydeZgZ6iB9yhy4mx
         kfPGndSqnfsiA7M1n2f83OV7pJ3fir1q+UVIawjlcYN5YinYMi8PF6rD0EOea4iGKJfA
         Uj6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Iruk2cWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j81si4033549ybg.136.2020.06.30.17.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 17:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Iruk2cWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqR19-0002KC-Mw
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 20:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jqR0n-0002K5-Rj
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 20:54:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jqR0l-0000s1-8q
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 20:54:05 -0400
Received: by mail-ej1-x62d.google.com with SMTP id w6so22649727ejq.6
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 17:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WEYO5wqn1hXkoO2dj67hwg0f8xHFhIY0ohSiXoO5dTI=;
 b=Iruk2cWrCV/eC/+WQurV4xxjv/GV1hFswHQC9qHBRLZUQeK8mhaQ1Y4U+Fv6oqLGNQ
 HFdMfitm6MaI7uKxoVJlCaZrc2k829el5VCnUcHB09rWPndY+QBGgD6Aj5i+PWmNn1/O
 +tyMvD/bLUEf4kXRYs8tCA//1QBGVw/9JDa1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WEYO5wqn1hXkoO2dj67hwg0f8xHFhIY0ohSiXoO5dTI=;
 b=DLNoHBMAspwoMOlJmj2fjLD8JIQzIrR6sFurSWsCENIJqGSIiQ6+L/yd8AmDr3Ni7r
 1RUB47s7VORUEZ8WkOh9UxhoguCkHrXI7R4C1RJKfVvV0FlpxWZ9o6IGl/zJx3QP2Y55
 8ASFWFY3iFysieKXF/GhR+7R4Ysl6NooeYnhzVWIGfpj/69aMnhO/2sqewRxE4JBwhsj
 oVEYIlvSrRQkJ2R6Nn8COTV+rhUv100Pmfr3yjfyhcgv8a4qT9PNYIFXoX2JdbT9WVDl
 wOihMGlbV8Ejxnf7J/hZHf3f7xxqe4jVi3E5K8NUqmqKd2vS0UJtLh1BTVQoeRZa8cC5
 tjOQ==
X-Gm-Message-State: AOAM533+UkmmnEVHz926nj3Nq/u6xk0briAZXZ+KuE2Vz5e9kG7jt+zT
 0IgMwU2R7nGfzyhsIAtAhdubLHrOAcpe7meJQc0=
X-Received: by 2002:a17:906:1455:: with SMTP id
 q21mr4187769ejc.139.1593564841019; 
 Tue, 30 Jun 2020 17:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
In-Reply-To: <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2020 00:53:49 +0000
Message-ID: <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: Erik Smit <erik.lucas.smit@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nk75Znxzt0mx

On Tue, 30 Jun 2020 at 15:32, Erik Smit <erik.lucas.smit@gmail.com> wrote:
>
> Hi Philippe,
>
> On Tue, 30 Jun 2020 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> >
> > Hi Erik,
> >
> > On 6/30/20 5:11 PM, Erik Smit wrote:
> > > Hello,
> > >
> > > 5d971f9e memory: Revert "memory: accept mismatching sizes in
> > > memory_region_access_valid" breaks Supermicro AST2400 u-boot.
> > > Supermicro AST2500 u-boot is fine.
> > >
> > > The u-boot tries to make a 2-byte read from address 0x84, but
> > > aspeed_ast2400_scu_ops has min_access =3D 4. When I change min_access=
 to
> > > 2 or revert above commit, u-boot boots again.
> > >
> > > Is changing min_access to 2 the right way to fix this?

Ryan, do all addresses on the AST2400's APB respond to single byte accesses=
?

> >
> > If you have access to the datasheet and can verify, then yes.
> > Else I suppose C=C3=A9dric, Andrew or Joel can check for you.
>
> I do not have a datasheet. Aspeed seems quite picky about sharing this
> and I'm just a random researcher.

Erik, can you point us to the image you're using?

What is the command line are you testing with?

Happy to fix the model to support random firmwares, as long as the fix
is correct for other (open source) firmwares.

>
> Best regards,
>
> Erik Smit
