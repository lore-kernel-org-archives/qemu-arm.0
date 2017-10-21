Received: by 10.223.197.9 with SMTP id q9csp8759381wrf;
        Sat, 21 Oct 2017 03:38:56 -0700 (PDT)
X-Received: by 10.200.44.9 with SMTP id d9mr11215686qta.173.1508582336394;
        Sat, 21 Oct 2017 03:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508582336; cv=none;
        d=google.com; s=arc-20160816;
        b=YtUXa4QOJLVAWFI+Hi/0gimg6Io+J81NGR1RXHQG3wrz8kkgwii793ZzXw1ooAi9/M
         0qgjJz/GDthfg+X0y4UE3omfRz3k2KPqBPRJnD+2b6t1VScgeVTctP2robnCURLqdmrZ
         zgN3zYc8oy4QWjwv52C5v/NrZWZ9aMTy/BVOM0wfBi2wbu/o9V3fdDMgeDqtm8E4PjLz
         SHaVxNvdvircVOCaRelPkdyKo1EPLzpt/7K5uZsUUE2Uv5bXqsYJ/eW2TSMjJdzu5RFM
         uJ3loaZ+x+EqOw1kF7PfQyOfREkdipxNGdaDA7wfgdl9ltMgQ34VBPqIcwG9BRdXHzPo
         ylOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wWAzeP9kmc70vMPhTA0sAgXwHlM8GvM/cxxhCRAX3MA=;
        b=KdSTAALe3PR7tYuHEK0Ok1VgkRI8yPX6rn8vbnsC4E+0yKcc62NgVVaoy2wlXw+yRv
         xhE4SxJ53F2xa7Sdn72H2H7zrjsORA916RsPO5PO2wrWcKlko/sI2qPJXyIUkBFTppS0
         qm+2aD/IMvTICFC+3xJXpuWF15xqIW/ejUSvOxeKF++OPlRzcUSGPj2dAJk58PfmmuAs
         aXwD5bq8u5VbYlcyVax6733d3mFU/LxW1tXSdkUTlvG1TFLjw/gkF0ye4IdoTdiKA4Ev
         Eya/AiIwPpz2EydTVtno3cvj0wr7rVykBmO+88t2MFPQF9n4nwMsrTtmNaHmim5V81jG
         kxEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R3WLj053;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si2530009qty.20.2017.10.21.03.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 03:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R3WLj053;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5rB8-0006s2-7P
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 06:38:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5rB0-0006rv-FN
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 06:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5rAy-0007Oo-Vb
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 06:38:46 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:46966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5rAy-0007NA-OA
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 06:38:44 -0400
Received: by mail-wr0-x230.google.com with SMTP id l1so13243660wrc.3
	for <qemu-arm@nongnu.org>; Sat, 21 Oct 2017 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wWAzeP9kmc70vMPhTA0sAgXwHlM8GvM/cxxhCRAX3MA=;
	b=R3WLj053UPYssKo50fzkviGRA4VWLiEtoGI9yMW5JBPJf0vfNzyVA/bwJAiFaBtld/
	gQrNFJhgcCoewpfr4luqef2pmP82K8V/Bd1ybIIe9WGOceaYhN5yPK5VH10ATk/RTGN9
	AjsI/SdA9MLy22yNRxOeLwwH5j6cT33bH3dbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wWAzeP9kmc70vMPhTA0sAgXwHlM8GvM/cxxhCRAX3MA=;
	b=ZuE8S25z0S2Y6U9LhyXgVu2GUYffRtHUDOwSMAUMVv3shTWLXTmTTZ6pGPcZ5aY7L2
	PQr5368sqC2I3tzw4Wv86C/d2w2x/nXzRF5xnMCfve5GHHw062odF6GCpRNReYUXZer6
	iwGv2fEP2+46HKMqpYNStppnb7/iUtwLR655OecI6D1u5uEaDzEvww7KK2orOS8Rn5EM
	SPrJn1BRgxPQV0BalVlHkGUNkZQjJlASD1T1rjVdRdpBDoOD9Ui+ejTt9HIdndTLvdXl
	rpGROD7s/K9ZJm3HWRF330ThG43Vf04fCFsxNDnZhJIe5ESy6BnAgrr8PPl2Jk2yR4WM
	2Mwg==
X-Gm-Message-State: AMCzsaUybDkukMUUC7y9T5mjuy98DwpYtTDGjvN9UwHYSWn2y6OSuklk
	02DljaLY2JOVkF+4pyFvEd5ja0mms9nUS0ISIz3ItIEp
X-Google-Smtp-Source: ABhQp+TGUgjBa7D7pYQho8pm9M1h7Oan+0sYd8R42CA1rfz9PQLIK4SjUtkIkbW2LjIV8uf3msb0Ibd7cmgXQj5dC+s=
X-Received: by 10.223.151.198 with SMTP id t6mr6944761wrb.2.1508582323604;
	Sat, 21 Oct 2017 03:38:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Sat, 21 Oct 2017 03:38:22 -0700 (PDT)
In-Reply-To: <CAPLZ2xMgcbiJr+rbQwZxbP6chMzZ7fBcJ1q35tEbjhccQHPsow@mail.gmail.com>
References: <CAPLZ2xMgcbiJr+rbQwZxbP6chMzZ7fBcJ1q35tEbjhccQHPsow@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Oct 2017 11:38:22 +0100
Message-ID: <CAFEAcA8TfRzsP2TuK9_MeP=puPV-+3ivL=R8F3LkGcnMCDLEQA@mail.gmail.com>
To: Hui Yie Teh <hteh703@aucklanduni.ac.nz>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] .bss more than LM3S6965evb RAM size
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o8cYXm14sV5M

On 21 October 2017 at 08:31, Hui Yie Teh <hteh703@aucklanduni.ac.nz> wrote:
> Hi,
>
> As far as I'm aware, the LM3S6965evb board on qemu has 64kB of RAM. However,
> my application has the following sizes:
>
>>    text        data       bss         dec         hex     filename
>>  77540      1544     64032  143116   22f0c   o-optimize/test.exe
>
>
> The bss and part of the data, I believe, will be located in the RAM.
> However, that is more than 64kB, but my program still runs fine on the
> emulated board. Is there a reason why? Or am I missing something here?

If the data runs off the end of the RAM, the image write will silently
write the data into nothingness, and reads will read as zeroes. If
your program doesn't actually use the data that's got lost it won't
notice, or maybe it behaves wrongly but not in ways you've noticed.
In this case it looks like your data+bss is 65576 bytes, which is only
40 bytes off the end, so it depends what the linker has put in those
last 40 bytes.

thanks
-- PMM
