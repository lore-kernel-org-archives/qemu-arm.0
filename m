Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1221023lfr;
        Fri, 9 Apr 2021 00:00:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQyzAjYfmQz8xAnKV5tKFekLswTd/wKsUIS3UJgsqr2BhV99r7oA1/igOCsM7dr2pOTpdH
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr12721334jak.91.1617951618175;
        Fri, 09 Apr 2021 00:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617951618; cv=none;
        d=google.com; s=arc-20160816;
        b=TvWpnJZxnwIwbcSdkwx/Zpkqs5O75Xq0dx2m2d1uRQEKu+M01Mb/m1sEdKG1+8bpL1
         z6YDkSacFNHhaX0Eq1B/FtVp2akR6pbE42LzyiDkcTEHEASAM7kVUx8waVvKgfIvMCSv
         bYLdLLj5cKs6jFjWorGNtAWbGfDsWqHjiYanqHoOxku7ZNWhSVzdH7MS+Wl+78uAc4e4
         A3aDpakfbdJfweu0FKbxwbubivPhy+Yi/M6Bhf5bLKXZeKIFTNbG94EI9HiVFyyJanfg
         uJsi0okvDhdWLTz6/bif+Y44dFBj/A+tBRuKp/RJqdjqwsb8+eMqWoyGHWRolnrjXaVL
         tY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BMIdbb5+q2+8P4LA0fA5kKKjKdwZMjpMAxjD8O+1Igk=;
        b=xDLjhHIPWt61XibChsUtFdsEhILci3Td1IKYO2kbo7rPaSMd0Ud+/GtC3hJHK0eVVZ
         d6X5P/0AmkRW9/1/Fv621tHRAqd87ht0K+ITkaJOUqRwjsFF5uldU6uQMYOpj9QAxlYm
         eWQRv2dVx7Eu8kk41aC52f+5wAXoESv1QAEfN+1hkxE2zgdYhQkmh60Ae7NMpOpKpH1h
         bsufrWajHAJ5m2DYDnA7+OecKi/snpAozg7kH1CQjJdFQjKdaSSZcpoh5epSYEAw4gOR
         8FL8K36Yo+HTrBOIWWU8z54dXnfOCHSXzCgO+0c48n4Is6RNBSmRtksyr+JRUMMcCLr9
         iMhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=iD4t8WAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si1749423jak.13.2021.04.09.00.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 00:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=iD4t8WAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUl7p-0001eA-DH
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 03:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl5V-0000Jk-I0; Fri, 09 Apr 2021 02:57:53 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl5U-000521-6J; Fri, 09 Apr 2021 02:57:53 -0400
Received: by mail-qt1-x836.google.com with SMTP id u8so3452567qtq.12;
 Thu, 08 Apr 2021 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BMIdbb5+q2+8P4LA0fA5kKKjKdwZMjpMAxjD8O+1Igk=;
 b=iD4t8WAbi7Cp2oo21ZNob2gTmHCao8aGQm8Kv3liPjk+Aobg0CtnyH2hsjea6DiEUW
 WizLsAKATCvy+9KXQdCOdv/7rRT9l6wXa6LYkTN/YmNMhqvcCD9cbdRM7H1nc9m3KXgl
 mpiGM+qvctso7nYhlMeXWnFqYeHu7k6WSdDhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BMIdbb5+q2+8P4LA0fA5kKKjKdwZMjpMAxjD8O+1Igk=;
 b=HhJWgs2a09xgnQg1iueAC7Ov4BIT8u6xbf37VybirzCnBHMxRC4TeGj/Y3wuuR6hrs
 xHn7+Ws2CbJQKarQKZJFKmmF6uh7rWFE1jZw1tgIs2IutO1ezmtYbm0yWOJnBo3qB3E5
 1OTrRH9RX2jnoG6gcjkKA278LGz+KlCg5/YkV7eO4AUoAPaX/e3DwLtvY4TMmkGBrirV
 NttPm8fST3iRZZpQOCu3edNh4Qbzriw7lxf8Ce22biU7C1kdWvSM3K1T5GieUB1jbdRP
 BPP/sabYdtrugSFGYIi05oGTlH8nNGciqvd7PV8PCXyQHdkE1EuSHTavFpqsH+p3KoYa
 k28g==
X-Gm-Message-State: AOAM531w12aygsWWq8n8f4dlB2CvpX60/u5PpwzBvHZhW+E0by3wbVnv
 LZ18cQGF02XuHhlI6cc7cZaPifWBo31ZQGEZgdo=
X-Received: by 2002:ac8:7547:: with SMTP id b7mr11831054qtr.176.1617951470971; 
 Thu, 08 Apr 2021 23:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-19-clg@kaod.org>
In-Reply-To: <20210407171637.777743-19-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:57:39 +0000
Message-ID: <CACPK8XfA0zab9EfZ+pT8qxckLR=oUdvQXM6FwoLeBoD+WFAM9Q@mail.gmail.com>
Subject: Re: [PATCH 18/24] aspeed: Add support for the rainier-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3rUPFzbYwZ2G

On Wed, 7 Apr 2021 at 17:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Rainer BMC board is a board for the middle range POWER10 IBM systems.

Rainier

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 97dcca74feb4..19588e17fec8 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -135,6 +135,10 @@ struct AspeedMachineState {
>  #define TACOMA_BMC_HW_STRAP1  0x00000000
>  #define TACOMA_BMC_HW_STRAP2  0x00000040
>
> +/* Rainier hardware value: (QEMU prototype) */

Can we drop the prototype comment?

> +#define RAINIER_BMC_HW_STRAP1 0x00000000
> +#define RAINIER_BMC_HW_STRAP2 0x00000000
