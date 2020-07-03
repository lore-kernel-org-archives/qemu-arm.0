Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2801719lfm;
        Fri, 3 Jul 2020 13:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBamRjNA6DCAhhMmAEDNKyrFLrS+d+PJli/sGZ2CRuw1aDb3AGdRbKIYhCiAK6lbfGY7Sy
X-Received: by 2002:a25:dfd2:: with SMTP id w201mr53411133ybg.230.1593809803172;
        Fri, 03 Jul 2020 13:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593809803; cv=none;
        d=google.com; s=arc-20160816;
        b=P7Xc5/moOuZj0wCvtlFSlqEeGqeUbT7tBGB4bAnugcWApjlwVU9A5pCYHGhLFoiAai
         1p8XkwMLuStBKTRPIo/d4cSSJyS1dhs9zLCPogXTfkmWQnKIjvunriVdYJWo10XHHpVd
         leHUbCF6facxs5yrsz0DRuksEQ8tyPVOvh835T0d200bPGRCs5cdhcTTMuI6v6hpnvpL
         zUpALZ0aJV0ouqid1paig6oyYw/PovrI9BvLkkQR3GurNrLzjJ/1vUqtQHSs07f8u+Tz
         wnyRlty9N2strI/090UYfRte6Si5CsnfatobAPJLRMPI221l/m9JlpBWgPkTZao9IzO+
         TrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=URtNUD6GSTAQ7SAD3xbfDjQDrrOchuNcrcx+xI4NSVE=;
        b=dE7Dy1c0eHsTTyxkZJB5zZ4Ow/l5lyoieOOP2yiBsIlpt01HaCiL3bUahATX1LEPli
         tvYwQZPErEJ8+vFHuTVmomO3f72Hn2u55O7C4JEhqU7DpWy4RvsfvcnNNPHWECrJ8BoF
         89urMmyuek9CtiMOyZp5pgBNNa89kjyKi3Ub048FVKlkEFHN9DMavWP3cqamID3n8rmR
         2T0+yGH3vJu5LkVRR+2m1Tk3ofZzi9QpY2KVGVv6B3q2K81xA2VCoGtr8UUoDIScOmOC
         ljx09n+H2kAInpoTlxGYQy6lyhThvgPUQrl41xxTvPHGsubBz71Zc11mhvOKzTpxjH+2
         AwRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=LpjOlT0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si6493646ybp.293.2020.07.03.13.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:56:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=LpjOlT0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSji-0007q7-HJ
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSja-0007o7-AQ
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 16:56:34 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSjY-0002Gk-DS
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 16:56:34 -0400
Received: by mail-vk1-xa41.google.com with SMTP id 66so3949461vka.13
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 13:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=URtNUD6GSTAQ7SAD3xbfDjQDrrOchuNcrcx+xI4NSVE=;
 b=LpjOlT0UFhP+SidGvZSXO+FB7vrfIlT9OCWkrGyCza0bwCdS1lSrEhpanXfpdxHuyb
 E7sbXs3Xaif6cp7Ri/ywqjfzxqLFYmsc6fm5joK6Ub9eUR2oExeIJU3M/syRMS+XT0uI
 4DBt3w48SykIUP4RcFYNfYvmcABVqzMwTTn3V4Up48Gqdmr6n21gEDegdIGM4IAxQXbi
 tyN3eAsz4H5gFfm3wkw0vyKbxLs2tmpdOfFTtomVE+MwwV3ygOOF3B5VMna02o7orsjQ
 kMFXQLvraOJS2Gr3o01wAMPaS4c9uTAolXQYoYn/Av3zMAwBoY1+a0tqaQvyWD49NMkc
 WRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=URtNUD6GSTAQ7SAD3xbfDjQDrrOchuNcrcx+xI4NSVE=;
 b=UK8XlHasDgJcM1FANN/i1rp7RW3sRdNOQL9MPOP17APcTBmjPQ7LVCPHR6TQdd2MT5
 W6aiNzqwjxxgY84Dag8TNFOB8TDZLmKQtFoIQG/7meQpODeXO1+N+6tYDRguFCMiP2w7
 fHdLNgDCORw5XXvjS9zVd+qitrydE9pAam+IFbAtxX3l0lyhr2dKjFNfjupJWia6di7o
 rP9U8h2iaxVbf7xKH3K2zSPprbbPNb/PaEE5U84q5hwBLjntqpf5r4Z/7i2IFPvaZ2QX
 eTl8oReebON6inI60qIawXrxlfbB2IdJx4kknQdNLz5uMOrQaK19m80O7bZzlmaqaakL
 4itw==
X-Gm-Message-State: AOAM532f/tSsrZ8IOH68khnnvtf+SxTQUGFw8TZTl/bb6ebomSxRlWeK
 YDCXEtEeuq5CcLeftesK6tJHOILAGb/YHuNaNTyo9w==
X-Received: by 2002:a05:6122:130b:: with SMTP id
 e11mr29630373vkp.20.1593809790964; 
 Fri, 03 Jul 2020 13:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <20200626235519.591734-6-hskinnemoen@google.com>
 <001d2d27-dfe2-b03b-9996-ca69ba81a542@amsat.org>
In-Reply-To: <001d2d27-dfe2-b03b-9996-ca69ba81a542@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 3 Jul 2020 13:56:19 -0700
Message-ID: <CAFQmdRZ4o9hs57kGU6WWHuBw4X+F55WyEsrhqiDTnSb3iftxTA@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] hw/arm: Add NPCM730 and NPCM750 SoC models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a41;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2H3khQAnBy9a

On Fri, Jul 3, 2020 at 6:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 6/27/20 1:55 AM, Havard Skinnemoen wrote:
> > +/*
> > + * This covers the whole MMIO space. We'll use this to catch any MMIO =
accesses
> > + * that aren't handled by any device.
> > + */
> > +#define NPCM7XX_MMIO_BA         (0x80000000)
> > +#define NPCM7XX_MMIO_SZ         (0x7FFD0000)
>
> Could be 0x80000000 since UNIMP_DEVICE is created with low
> priority.

Good point, I'll do that.

> > +    /* I/O space -- unimplemented unless overridden below. */
> > +    create_unimplemented_device("npcm7xx.io", NPCM7XX_MMIO_BA, NPCM7XX=
_MMIO_SZ);
>
> Note by doing that you won't get transaction failures when accessing
> unassigned regions. This not incorrect, but a bit overkill (this covers
> almost 2GiB...).

A lot of that 2GiB space is used by six 128 MiB flash memory
apertures. But there are some holes that probably should generate
transaction failures instead of a default response.

Would it be OK if I send a patch to tighten up the unimplemented space
once a few more of the peripherals have been implemented?

Havard
