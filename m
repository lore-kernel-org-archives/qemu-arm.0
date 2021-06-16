Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp143500lff;
        Wed, 16 Jun 2021 02:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBCfA6xJHvWw4R8vFsOyt9v4Fce09KSqDFULX1tFsi4Rijm2MvoSjd500D3j/fHflRdyIx
X-Received: by 2002:a05:6638:3492:: with SMTP id t18mr3391739jal.3.1623835628944;
        Wed, 16 Jun 2021 02:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623835628; cv=none;
        d=google.com; s=arc-20160816;
        b=DHNs3dF6uaOrzy9MW5Nam1S3LBjoyg+/K1pcOlMt4H1XRa2BI05t25Q89Les3T+9cQ
         Movz58tYG5PQgTFHB+xrNOzdZzo38SO1VzOZ1Z4Zckp4lPK/9Z8/TAYBRQNbE8gqpy4q
         bkKtBqgkQ7PIVfvAz3ONVHtTCrGIb1iGUFsxOUEN2IAdJOlhKFCwCVAt8v4EZ9eXFd9k
         T6zv75a4jqRnWyJ2HwMu9iuuqXR02nivSfOL9VLNsy/Gk3a160gvdkRk37fXuILuGeiY
         z3UD0W29wxxdb6YvUAJC/7qnBhoT3dQ7DcodC/rLtwj3vcElO9dASzooJxABU6feHErM
         XMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8SyBj6xeWKxD1uaPyckWJZ0YfEp3/4EOsSfDw8mmagg=;
        b=yfdBPI4gGLC9Z69I5EkpIfh6YrtXz4SYKlNl68UIJ98sEpjz2WpLvXnlGAlMZeyiOu
         aLFJSevPBFgwFz486SLm1En6FBUMtLRpmP5XFJWsbxcDHj4YTi2crWGD8bOiYixr6bcf
         rp7LK6tHuCC2T2ehIknYyTLDhlhOQa/55kUvUQ30nKMcFqaHeC88YZC3IJZwOAtXsx8v
         J3LwnnFOA2OarUiquz+t0l8PRKrBmUlegyBKLm0n49Xd9W8Z3oTctwcW0mlLlVwFnY2T
         BYCtpARhLxTujOiPZJg49l5F+TxSuqBEo73Kp9YZAbdIt2U0f+KrQixC3h7AzxLaBGvi
         eDXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=XvinKsZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si1937974iow.46.2021.06.16.02.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 02:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=XvinKsZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltRpE-0003hz-6d
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 05:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ltRoe-0003h5-7w; Wed, 16 Jun 2021 05:26:32 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ltRob-0003aN-V4; Wed, 16 Jun 2021 05:26:31 -0400
Received: by mail-qv1-xf35.google.com with SMTP id x6so1194525qvx.4;
 Wed, 16 Jun 2021 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8SyBj6xeWKxD1uaPyckWJZ0YfEp3/4EOsSfDw8mmagg=;
 b=XvinKsZLxYzw7kvUSRO1tGVmwqK5gffLyJNN5S6KSwS88Vf9XRsVT3lKi3liHANDGe
 anVf0RlGkg9h1wwkIKrd7pPxt6clh6zJEMDcbYUWrTXb47AIjeCoqbt2NsZ3pJKwz9wX
 jE00ktujJ0oIzDgWmETMLTStIvcnbvsb0LZtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8SyBj6xeWKxD1uaPyckWJZ0YfEp3/4EOsSfDw8mmagg=;
 b=NSyh6XFYaCNRMHRGnHKH8MEMytJqc775jvtKI1o6og/19Z960dMkxlQ+gG5wvSLriR
 kRDx3RXrndoFK6ruiM3cCK4XVCxbnuC79rSox4GoC2QitAnd/PGy80wo83Hsn+ofeX/j
 7FiM8b2lLpsFterYTAfjMW+NtPJb7jKvCFS8pB/8ThKiB/GhNQxOjy+MCRU4SH1VumtT
 rayCxiuCHH1B8tLQys1/616TqSaH6PpTbv75vCQZ9mzyChMHgrjhtpefyHEHV+B0IKAh
 pz9KA4upIq1hNMP8gs9TIf3BDiwMN7iUMOSuwOstqe+45RSsY8lPR5afH3/lVwd0Ktko
 2WzA==
X-Gm-Message-State: AOAM532M24pYcsI9SxKHMqyUvIYYjiT+oudUa6/IqX/36X64Nj6AbaSd
 QjcKQqVQhW2kds0Dz1C91kIJsoluSinIRFyjhfoJ8HVxCas=
X-Received: by 2002:ad4:4513:: with SMTP id k19mr10123699qvu.10.1623835588369; 
 Wed, 16 Jun 2021 02:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210616073358.750472-1-joel@jms.id.au>
 <20210616073358.750472-2-joel@jms.id.au>
 <5aadfb16-c563-9097-95c6-52f88be20468@kaod.org>
In-Reply-To: <5aadfb16-c563-9097-95c6-52f88be20468@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Jun 2021 09:26:15 +0000
Message-ID: <CACPK8XdCAC7MQH_16UecQ4wPeOA1C4mG4x+FDyWgy5s0ojSSXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/misc: Add Infineon DPS310 sensor model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf35.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KNYo4nEG0a5y

On Wed, 16 Jun 2021 at 09:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 6/16/21 9:33 AM, Joel Stanley wrote:
> > +typedef struct DPS310State {
> > +    /*< private >*/
> > +    I2CSlave i2c;
> > +
> > +    /*< public >*/
> > +    uint8_t regs[NUM_REGISTERS];
> > +
> > +    int16_t pressure, temperature;
>
>
> We don't need those fields anymore. I will remove them if you are ok
> with that.

Yes, go ahead.

Thanks!
