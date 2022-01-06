Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1072917lfb;
        Thu, 6 Jan 2022 07:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXHJqzkq4rcrRwhMsK0IgPDH+G0r7t6kIJqCFqPOh82juRdbIukrvPRJsu53WVhi4MUXW4
X-Received: by 2002:a02:c6a3:: with SMTP id o3mr27931799jan.14.1641482949624;
        Thu, 06 Jan 2022 07:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641482949; cv=none;
        d=google.com; s=arc-20160816;
        b=DEQzIuLOig2a5y+MZYMPo/jyE6/XZ56VZNPRb9ZpNO6pro+xxh32bgsmknwa8hL8gx
         Yqs9MIZZ0vMhvj6xC5hEP3+hidjTxTmujZyIBVTIdFkqaozMl/tTNMBm1k65a6URKdDM
         clLpsJuYWW7qmC48E/jiXokjcSmK9rBUBXLJLJGibnWEe8zGb0kAJUUM/hNTEdVPPejw
         WA/7lICxCvTNhDapxG4ITGVDDmssJJQEwN4W2qvV21P/fmTdNMaxb/9Ajb7W6cbLMdWo
         r3MWRRJrBjxYrVCawcAP287LizfxEZ73qkW9Dbwwt+gj9wkcOF1M401V7PqvPvkaAaGV
         2ZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=l2W6TvkIBXYjzjMw0jKIb7sjXWrdc899GHWC7UX5GUI=;
        b=qBbQ/l+emIu0Dq+j+RNT5OouIRQUVi2uRkWW+3hm4eLqGKMr0V/fGEgPnqMB4MLlr1
         XOTFo7UUfIUxvB4VM06Yc3hGahPTM4tUAOW9svbSeK+5TjYTNwvGGLFieJneWc5aTYWh
         Q10rZp5RLLY2IJWb9MHRuO0WKz5zDsCCHyeant8I4fpPdVEGEpaE336o7zOoFru8IlZL
         jREKauyqBhYB9xTuyeRgnSEom7NmA1HWQeqFSEQlcKjlS3R12NrcS4Y0zU5jJ/8w4nmH
         cTj+ZHj8Z7VaVXQQhA56lSbQrGBi1ZwaDZaz5puaIHHgZoKxNN4VSnTulreGPMEzfPvK
         JPIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=trES+DIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si1029847jai.65.2022.01.06.07.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 07:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=trES+DIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5UhR-0002Ei-2k
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 10:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UgN-0000hP-Qz
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 10:28:03 -0500
Received: from [2a00:1450:4864:20::42d] (port=44632
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UgL-0007Tx-0T
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 10:28:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id k18so5437974wrg.11
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l2W6TvkIBXYjzjMw0jKIb7sjXWrdc899GHWC7UX5GUI=;
 b=trES+DILDMWOfknTz264RJ0OW2UauTIbNoqOKGYiqPv01I72SFtpCQyyCF2Z3Y2IXQ
 ywA7l/bPUpfCwtcHyd8I9GAAIK1YUl6fAd10/n/jTpXTmmHPFmr5FV+z++NPAlOJoC1B
 ILJyG7ontTR42Ib5tyh9d/JYkmaVJMoqLzpoY5Oori0/bo+OJOls/GSU9D7xKfITIIqz
 EbWcPt/COgS+Y765oVx299b5N1of/bZYeRF1sPTVyExjqEOVOt/2quRqICMzvzOVXezN
 qx5adNZNSeunTjh76OQ6dE5G+87IP5m4huletmKqdtZ99XOaSTR37npW4LmXxbkkbeCa
 BXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l2W6TvkIBXYjzjMw0jKIb7sjXWrdc899GHWC7UX5GUI=;
 b=K3EVAgvJg49Jzs2Y5/xdd2C/Tu804glzqX+r/MT0tCRAOU0aT7lKpnZMU/kKy9fvrJ
 haqIu0zxXb+WQdTmFWLXS0h0dDCiJhh5i6idj2VU7Oy7WH574rZKaQtN2xaY3x96HvXA
 OAHDatBCT1pBZHE2SbKidMhHDa8yoyKIIOxDQLbISL4uKQq1V5tfBB/3FKENafp0+TRf
 eIEnt2S0Szr18AStkEeelH/NhohPBfHP3ZKSC+uKpnQDADgq0dUCXAzURG8t3hIwWhWp
 TKSOWQEZD2gs+aRLF7AbhvEDbiJrbXoCjJDNTkbQkcB+SIbbFJBL/0pPKvSZeojs0ahw
 pLpQ==
X-Gm-Message-State: AOAM531ovLytgboHIpvZ5t73hwCI9RfAiHp4E3A6wn7ISx4zsvJASCmw
 t16y6TswKgsaD7q50cEqXiaaSZO8nOm0K/tG7FjVEQ==
X-Received: by 2002:a5d:6986:: with SMTP id g6mr48842wru.172.1641482878790;
 Thu, 06 Jan 2022 07:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20211222022231.231575-1-troy_lee@aspeedtech.com>
 <8df385c9-b25c-80bb-fb27-88f774eb44c6@kaod.org>
 <CAJOFXWgEqYTAL59Z2CPzQTedYqN9pWuyiEt7jbG1ENZinNj=2w@mail.gmail.com>
 <CAN9Jwz3gv5V2jPvW0mp7f_XKW=d3UtE9ROMcg4wLBR7D67+KiQ@mail.gmail.com>
In-Reply-To: <CAN9Jwz3gv5V2jPvW0mp7f_XKW=d3UtE9ROMcg4wLBR7D67+KiQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 15:27:47 +0000
Message-ID: <CAFEAcA9b-JBPRt4oQkb-=ewcHY9TWJ46_xtRuW1qk6mnq-cBMw@mail.gmail.com>
Subject: Re: [PATCH] Supporting AST2600 HACE engine accumulative mode
To: Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 qemu-devel@nongnu.org, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Klaus Heinrich Kiwi <klaus@klauskiwi.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ZepALpoCFwP

On Tue, 28 Dec 2021 at 03:34, Troy Lee <leetroy@gmail.com> wrote:
>
> Hi Klaus,
>
> On Thu, Dec 23, 2021 at 11:57 PM Klaus Heinrich Kiwi
> <klaus@klauskiwi.com> wrote:
> >
> > Em qui., 23 de dez. de 2021 =C3=A0s 09:54, C=C3=A9dric Le Goater <clg@k=
aod.org> escreveu:
> > >
> > > [ Adding Klaus ]
> >
> > Thanks Cedric. It's been a while since I've looked at this but I'll do =
my best..
> >
> > >
> > > On 12/22/21 03:22, Troy Lee wrote:


> > > > +                /*
> > > > +                 * Read the message length in bit from last 64/128=
 bits
> > > > +                 * and tear the padding bits from iov
> > > > +                 */
> > > > +                uint64_t stream_len;
> > > > +
> > > > +                memcpy(&stream_len, iov[i].iov_base + iov[i].iov_l=
en - 8, 8);
> > > > +                stream_len =3D __bswap_64(stream_len) / 8;
> > > > +
> >
> > I no longer have access to the aspeed workbook I guess, but what is
> > the actual specification here? is the message length 64 or 128 bits?
> > and bswap seems arch-dependent - you probably want to be explicit if
> > this is big or little-endian and use the appropriate conversion
> > function.
> The message length is described in RFC4634:
> - SHA224 or SHA256 should be 64-bit.
> - SHA384 or SHA512 should be 128-bit.
> And it should be in big-endian.

You can read a 64-bit BE value with
 uint64_t val =3D ldq_be_p(iov[i].iov_base + iov[i].iov_len - 8);
or similar. (We don't have a similar function for 128 bits because
there's no fully-portable native C data type for that.)

-- PMM
