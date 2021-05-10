Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3272541lfg;
        Mon, 10 May 2021 12:29:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz8Y0yE6lFvdn7HeqhurOf8GHnzRVber2S9bi0ks3XdqYB4SJk8WavLPF9Qhc6i4KdADBg
X-Received: by 2002:a05:6e02:1cac:: with SMTP id x12mr21317170ill.43.1620674984445;
        Mon, 10 May 2021 12:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620674984; cv=none;
        d=google.com; s=arc-20160816;
        b=F9rNF2X8yWNJR01Zul2N9yqqCyR+qqoYIacA4XeQaFqdH/i/xH01CPcrTuo9wBB4je
         BaHP6Sp81A0RPtu5DgaGCYzqG+s79ScbGJnmx0WVSJwk3767iiGBpbbuZUfkVTKvohxe
         pJsn4ydyAjaqQBO+8OQEI4jo65Qcj/J0yjbhmHxyryvJIW0wg/7XIecje+0uBLBP5EdT
         B7oJp5alMBEN08zlDnPT/+KbkYAeTddga44ZHKkjSc3ZouBHsfB+IPc1Mvv9+bXQokpU
         GUHgpH9T3KFS80+fPnjZ61pjMG8q5fGGmUMTXKEcbXk/2zfYyQkGxp8QPqokMTKINvsZ
         VWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aF7rRpkbFYSep6PHA1Q6QugsLYRXOSBCm8bjMJ++VKw=;
        b=rUD/2OFEAfh3J0rsuGqP8QsTdyGSVXAtsYDSIhbLXjfzgSubqSQEr0600Pma5/3+ed
         eZNGFpYOcPDzmDy+PHwNuNqKmXC8dbnj9co1Kwx03G/afj+pMiR5cACRyDGoPxxVxOuQ
         3PH8Efx/ahjRrfTthSRUwX1KPbzU8AObF6kT2wO3OXy3A8cuXv+xm4Fvk8sscYu2yQ1A
         HVg7Zch694rX2IAzsRp0H3PUJM32csR1sAKTygf/+dhP1k4XGbkq2bZmtxs1GInUMDIc
         GgKM3R3msmIVZeGiTYiwMVe4/mWVHA9vnjMyAvxxfOWfQzgcGmGnQhmIUfhSoWhtCabW
         rbGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHJr59E+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si18973647ilo.83.2021.05.10.12.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 12:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHJr59E+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgBb5-0004gF-N7
	for alex.bennee@linaro.org; Mon, 10 May 2021 15:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBV5-0004Vn-Pr
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:23:33 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBV2-0004Jw-Qs
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:23:31 -0400
Received: by mail-ed1-x52c.google.com with SMTP id bf4so20038145edb.11
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aF7rRpkbFYSep6PHA1Q6QugsLYRXOSBCm8bjMJ++VKw=;
 b=fHJr59E+noPtALF4NEe1XCvG3S/PZUa3ATkrJyOsevX0v4rh+rCrzdq2oCRjVPT7aQ
 e6nUh2yjf1FKkLfNWGhCDvjkDE9gnqiXxdMAlBqlbp7vhwrQIWNFnczf1x8lHTeejBsU
 lJDNMPvDovJhaF16kSIm/eOqY7Uj1Pz28IrGjCEgJhpeYW0K7l1EeBCaDEqlvXAVK5SI
 Sw12K/pMEhzzzOomaFTpRCNRHrq5vvww1wh3AYZdEVbK6KsLOfxSHPEqnHegnsNz4kNF
 VIPBm44dpGscSrXE2/XyB32Z9g7MMxkazWASjBb9A2gW+iyeGOY/Ce+0uc87x/GCRuvD
 kM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aF7rRpkbFYSep6PHA1Q6QugsLYRXOSBCm8bjMJ++VKw=;
 b=gKU/McY+r/uNq4BgQqEkGoPDRnAOUTToJFMFJumbWolj4qgzuQnXWkfSESexBNR+/q
 RL9Z2iHKYXGzLo+D0955GhIoJi0eG/afAbJTYslMUh7mQN737MVLs0pADwFrQCYrL/uR
 3oxv6bHJijsi19KA8eTZe3ZrII1oiLsyd2RNWpW1TJGReOeDZcxmBDXY+U0D9QR5KYeO
 uhg8bIVKKK0p6gyiwk+33LqBPm0iWWbj9F3cCuqbyDIxloTCqvp2xCo9P05SsKeBLS7E
 +SNMso27+1KGBq4VoFe9Fr5MKp3OYbwwToi8B47YhaLR2vM5prVlKHa8hdC+QXjw4Qhc
 lmWA==
X-Gm-Message-State: AOAM531zroVmXHmt/ttArC465quGYLPiWoFaky1TF/lulpuwBJg+T5YV
 U7UPlKqqo8+U/E514s2al6m97UTSB/2GWD4ynNCgGQ==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr30955212edv.44.1620674607193; 
 Mon, 10 May 2021 12:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <71d9367e-efbf-5051-68ac-df1dc7f53531@amsat.org>
In-Reply-To: <71d9367e-efbf-5051-68ac-df1dc7f53531@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 20:22:15 +0100
Message-ID: <CAFEAcA8L=iPhyxuJo49eNHuy+0zPAuKeHxxhMJRwoxcFhptuQQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] hw/arm: Fix modelling of SSE-300 TCMs and SRAM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kumar Gala <kumar.gala@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pXp/oz8UY95J

On Mon, 10 May 2021 at 20:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 5/10/21 9:08 PM, Peter Maydell wrote:
> > This patchset fixes some bugs in how we were modelling the
> > TCMs and the SRAM in the SSE-300 which were preventing
> > Arm TF-M from booting on our AN547 model; there are also
> > some fixes to things I noticed while I was in the code.
> >
> > The specific bugs preventing boot were:
> >  * SRAM_ADDR_WIDTH for the AN547 is 21, not 15, so the SRAM
> >    area was too small
> >  * we were putting the SRAMs at the wrong address (0x2100_0000
> >    for SSE-300, not 0x2000_0000 as for SSE-200)
>
> How can we test it?

I tested using a binary that Devaraj provided me. As usual,
I don't know if there's anything that would be a sufficiently
"publicly hosted, with associated source for licensing purposes"
binary that we could put into tests/acceptance.

-- PMM
