Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp199589lfq;
        Thu, 14 Jan 2021 03:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgbuJz4gwATduRLuKQD7HXj5t1vXaTxgpUpo+yNojGKiMGGBF4r8vIsfi3MaLhEnlQ+Nwv
X-Received: by 2002:a25:cf05:: with SMTP id f5mr10172467ybg.42.1610623615650;
        Thu, 14 Jan 2021 03:26:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610623615; cv=none;
        d=google.com; s=arc-20160816;
        b=NTLtEt48jCURMqC9Zb9nO2jQNAIhArOcuYpjcJ0aDb0lh5F879WprIK6S1uWc3YM7s
         ATbtGEMmdTpNK8Akr7q9Jls8JJVTm3LecJwkuNZMVmohXjgqdmmvs3AuIKpYDQ2MbDE3
         24/V4bAz/kVuC3gItnRaYrhwzEPtFDj0zPovbsWKRWiTTUlSrZ87fzu/RzDoK0OOoh4C
         DNdw1sIS6qSCuzrf53xAN4279mJ21qG3dbRZi1HNSECrqzh1teLVnILxlpJIle1MjlvK
         6Q8FAMrLj24eb6IDYFxvCiCgyeDpJuVyu5OK74TYjT+uhb2SK4Dxm1O9lqeXJTCBKUw5
         zmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FB/a3IGlr2mNnBlsMB0LqU5ZoTWWDZ0tGkAmh0w7jB0=;
        b=VGQwxK/K4SOM6rLnNfhE9xTmaZ9nosF+iMtnrRzes2H7khh8HlQvx3T0neKndgMgrc
         UapGBtnC58DFiGvqGwm3UD74cOHCM6nUeRXgVmlJDKk+sED7B3uKWExz7q0up/pkMHrb
         zsxLVOs0OohDbXQ9M0fP81/xcM8mL0yLLXqcUH1hbv84uoPZ4egOgNnCt+bT7n3MqTTS
         F9lyHKwNMJcq8WoHDg/FKek+F636lK4IhKBytFhRrV/WEFsbOOMB3p3WihbakNMGXdYS
         yX0CjqX2VstxDAk02BCPCmL29KLzHWkZ+w+xVZEHrzjPyDsE51oHX4tQnbrX1J1HUaBf
         xcaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0B32szN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si4934701ybg.18.2021.01.14.03.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 03:26:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0B32szN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l00mE-0004K5-Uo
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 06:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l00kU-0004Io-IK
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 06:25:06 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l00kK-0005dm-T5
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 06:25:04 -0500
Received: by mail-pj1-x1036.google.com with SMTP id v1so2920507pjr.2
 for <qemu-arm@nongnu.org>; Thu, 14 Jan 2021 03:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FB/a3IGlr2mNnBlsMB0LqU5ZoTWWDZ0tGkAmh0w7jB0=;
 b=n0B32szN6HO9QDzs8+Evr59u69+wPH8TbgEnzBAypFtRPmp2Cv44Iz1EtTfCFnJS8x
 wbaRSa5YvG2lZ89eOZ6inMukwuGoS3Mt05IwVppU7TEmZrQzg1sDP5yiyJRVlqBe8Voe
 xBxDeMotTz8DW+Yyc1VWZNRFYWFgOf8n2GyEpx/dyUca41xuPrHybR91wycqY7+cN0If
 oz8T7MmLQjhf91bd22aua8djTzg6I7mnY98h2Sg2aD2D9iLF3XyQlENAkud++Bvl8+++
 tDwHlklbvnqZwjujRwj3nYUAPWqU4idGpgXhpt+6xDpbG1CHli/BSj7IhDBKI7zTPGa1
 kAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FB/a3IGlr2mNnBlsMB0LqU5ZoTWWDZ0tGkAmh0w7jB0=;
 b=CYLOkSA9ZQBLgbYebxvVIo8hTgYLmuuVrxmlir48Gon5kBVnYvItvwS4j4BzKDcdz1
 fSXh/LG0WI4BZ+dYAXpnZqcEnvxsI9cbkwFDpQMq66EVbIcL8QXywtmSQmykuk9vCy3E
 URn7/pjA8gT32OmW0XNwv856WV10us3AfFD1v8F/sOwDEM+2w5PEE6r1OWCM5oPjvbQz
 wJYvd+sOwoeEH8N2+hTwWxLi1dtSpCZ0/FcdTEB8bVY/bchdsQeC7DNWlJGuoBB7bRrU
 iEVe67MFqJHS0XSlGg4GfyRmvUsgujrSnXJYrfYEcGfmj+yfGS8cUYQnDXDmvjnrtXye
 bRBQ==
X-Gm-Message-State: AOAM530deN/bo5faphcUQhtrqe5twBT3ygbTTBGH6ZmcIjQcT8rPGMDq
 Olhc5rm6U3oifd5/BMpQeAsDuAmPa87CNUc71CuJXg==
X-Received: by 2002:a17:90a:ba88:: with SMTP id
 t8mr4489161pjr.229.1610623493993; 
 Thu, 14 Jan 2021 03:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
 <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
 <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
In-Reply-To: <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 14 Jan 2021 14:24:43 +0300
Message-ID: <CAD8XO3YCJjTZBZaP1MOwUzcMQ9t+tbjOAwMT4STqYmp=Lmvdmw@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZpjBsJ7TdsGj

On Thu, 14 Jan 2021 at 14:22, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Thu, 14 Jan 2021 at 12:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 14 Jan 2021 at 00:04, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 10:30:47AM +0300, Maxim Uvarov wrote:
> > > > - the same size for secure and non secure gpio. Arm doc says that
> > > > secure memory is also split on 4k pages. So one page here has to be
> > > > ok.
> > >
> > > To be clear, does that means 4k pages must be used? I'm not concerned
> > > with the size, but the alignment. If it's possible to use larger page
> > > sizes with secure memory, then we need to align to the maximum page
> > > size that may be used.
> >
> > I think we should just align on 64K, to be more future-proof.
> > Even if secure software today uses 4K pages, it doesn't hurt
> > to align the device such that some hypothetical future 64K
> > page using secure software can use it.
> >
> > thanks
> > -- PMM
>
> Does that mean that in that case you need all regions to be 64k
> aligned? I mean secure and non-secure.
> Has anybody tested 64k pages under qemu?
>     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 }
>     [VIRT_UART] =               { 0x09000000, 0x00001000 },
>     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>     [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
>     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>    [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>
> Maxim.

I.e. I see comment:
 * Note that devices should generally be placed at multiples of 0x10000,
 * to accommodate guests using 64K pages.
 */

but it's not clear why UART, RTC and GPIO is not aligned to 64k.
