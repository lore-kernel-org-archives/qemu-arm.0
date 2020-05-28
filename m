Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp279638lfc;
        Thu, 28 May 2020 00:26:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzq0OqsqKxcHXfjOdVRdV/zWKtxwHduefjRs2xDZ8i/vDUK0wznfAewMlDkFtqGKsWq3uq
X-Received: by 2002:ac8:465a:: with SMTP id f26mr1740630qto.324.1590650785946;
        Thu, 28 May 2020 00:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590650785; cv=none;
        d=google.com; s=arc-20160816;
        b=aegWqtxFd8jHPUCnjVc6BFiE63eL+4Dg5bPfvMgS5gs7qEBhuHn8r606md1Gc0wt+0
         r2/MPV5L51v36OYmEkvWDdHTn9t6Ssjc1PfjPuklkMSBxxHoMC2lUltXZieckhdsUAnh
         AOqxT+H6JhLwq313K/QhWQ4pWfjcEMq0gaM6cOo6Bu++RDKhSbA8mxZi/xFC5nD0iyje
         MWdbhKzoGZyPQwYr0DbmrApreSnXUPOuFOlfE/cetsEBVyMUVjlHVJEGD+aTuUXaTrNw
         f0OqbU5JfHyv8qTNJ8NDtQA8bzWexF5duYvAqiYtWgEnKAqJ02EwzHdOtWjZibHOW/zP
         aPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UyKF229qgjHG717Dm40mZ4mp6YV3xxxM/oUcFKIsZ30=;
        b=l+U8jUbMd6AuZrE2dry4yrwh70i9gKOxobWceXwTyAU7iwL+k1xn85R6JbxwP+yTo/
         d0/YStNN78+f3GMUVKuFZ+fJbQORV86Td3G7jA29/KRieLEb6/Zd4OnzuL7f4e6TTVYx
         NEqsQf4qIETA4u2ezMcMDl1Tjg6ojjRK9qYwgBn+n7DKEB08CSQZHxEY9PGTYHymkFAi
         GAB5XYcPjrbPmETeDb20ZSAMYdIthHCGxLE46xuHgbvQ0fy60/tYmR/995ugsQly0vhl
         kH1G4ORljnIqXLhlTBVfB+/fmqeyxOTG5I8sISbQ5fiC4t3B9oXQJ0FmTyWTClQnNvYD
         g/Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=gtJlR3TF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si3070322qkh.81.2020.05.28.00.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 00:26:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=gtJlR3TF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeCvp-0004Df-Bu
	for alex.bennee@linaro.org; Thu, 28 May 2020 03:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jeCvT-0004DS-5g; Thu, 28 May 2020 03:26:03 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jeCvR-0000RG-FU; Thu, 28 May 2020 03:26:02 -0400
Received: by mail-ed1-x542.google.com with SMTP id c35so6034529edf.5;
 Thu, 28 May 2020 00:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UyKF229qgjHG717Dm40mZ4mp6YV3xxxM/oUcFKIsZ30=;
 b=gtJlR3TFpbCXwPCQ/mHvnXQy+yNU55dciiB+iywBKJBUWbiBqK5LqrJRmq0F853DIh
 bwzws1yLnibNb7Gy5maEmWegbv7edOGWDrIsd4gxGsR4ZTu9de8up/el81LeSttC/DFG
 8Dx8aW9QMKhrHaTcnLvZgBdIRKLrYj/BEkDiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UyKF229qgjHG717Dm40mZ4mp6YV3xxxM/oUcFKIsZ30=;
 b=ZQZdvIYu1+THooVJW4zC2V51K4DDxdq+kTvn5kVLWyUl+b4YxmnqgRon74X3oqrMpP
 gBtGccJLY0VNyiLrGnpgFTCYNQYv1vd0yh5/tGEChihQkimy1iVcScWNCAfOnUb5LO7s
 ifjhTEnZ0Uda16WiGrYNKbf/pk5khmX7JGT8Rs0PwGfwI+Q6wc9QPZf/TjqU9+qV8RW2
 ONL8xXPHe5ljpWKBuNrb82ftYIS1E/Hxm1jReDWgz93baDiN+U5/ktmK8XIsVBZCGaQ9
 6jaCB0ONkOqk9xwEHtVsOtOiXEmnu6bwBPNPRWfKXf35mHQXdaR3uMKt3/MHdLztq18p
 cbAQ==
X-Gm-Message-State: AOAM531nA8qohvE6O6z/krNdqBeo10y1SZFBKgK8DSKayvEpy6lD0U6f
 H5CMuWXbN4ucGdqqxzcPDArTC7DOkf6ibDsOc4M=
X-Received: by 2002:a50:e08c:: with SMTP id f12mr1667557edl.233.1590650758836; 
 Thu, 28 May 2020 00:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200527124406.329503-1-clg@kaod.org>
In-Reply-To: <20200527124406.329503-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 May 2020 07:25:47 +0000
Message-ID: <CACPK8Xd5TXG1iBV=Ygi_B3hJKNPRz=dhSuqMUHvLopjKAEi-tw@mail.gmail.com>
Subject: Re: [PATCH v3] arm/aspeed: Rework NIC attachment
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oKscOzFKWpVC

On Wed, 27 May 2020 at 12:44, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The number of MACs supported by an Aspeed SoC is defined by "macs_num"
> under the SoC model, that is two for the AST2400 and AST2500 and four
> for the AST2600. The model initializes the maximum number of supported
> MACs but the number of realized devices is capped by the number of
> network device back-ends defined on the command line. This can leave
> unrealized devices hanging around in the QOM composition tree.
>
> Modify the machine initialization to define which MACs are attached to
> a network device back-end using a bit-field property "macs-mask" and
> let the SoC realize all network devices.
>
> The default setting of "macs-mask" is "use MAC0" only, which works for
> all our AST2400 and AST2500 machines. The AST2600 machines have
> different configurations. The AST2600 EVB machine activates MAC1, MAC2
> and MAC3 and the Tacoma BMC machine activates MAC2.
>
> Inactive MACs will have no peer and QEMU may warn the user with :
>
>     qemu-system-arm: warning: nic ftgmac100.0 has no peer
>     qemu-system-arm: warning: nic ftgmac100.1 has no peer
>     qemu-system-arm: warning: nic ftgmac100.3 has no peer
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

This is a good usability improvement, thanks C=C3=A9dric.

> @@ -680,6 +691,7 @@ static void aspeed_machine_ast2600_evb_class_init(Obj=
ectClass *oc, void *data)
>      amc->fmc_model =3D "w25q512jv";
>      amc->spi_model =3D "mx66u51235f";
>      amc->num_cs    =3D 1;
> +    amc->macs_mask  =3D ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON=
;

In the future we could enable all four. The A0 silicon had a broken
MAC4 but it is working on A1.
