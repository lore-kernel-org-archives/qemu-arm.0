Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3222391wrt;
        Mon, 28 Jan 2019 04:33:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbilanCynA0ItlK1tzT8lIvI6ISqEpUJcJBpy4kgv8rJxsWLhxv4SYheBG+IvUyqZoqaCcR
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr356778wru.28.1548678799876;
        Mon, 28 Jan 2019 04:33:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548678799; cv=none;
        d=google.com; s=arc-20160816;
        b=x4D4dF0nKpFz99PlhnWoskVRNIxRVNclznav/sMiYwyt2MyFA61e6xo7A1DRv2+NaZ
         g8A+hKvSnWvRzh1nTTS4Td2W4MabKni8NshpRSnagfol2VJ67lrOigRopQ1CmXG/cg8d
         FDadCmY28TFwgOZuPBSA3lyzP70mPXyY0cb2sq2KEG9f61B9RoQXzGIEwcxmNfzrfnck
         bCraPJ/JqJ4gmtt2T3xm5uOwk5mnEgsZBOCgG1GGPwhQulIP3p2htqSmtef7Ml0PApv/
         CnNxKrTqPS4/8pT2OSVRNLdymdmU5lUhRagNbIRz2OkLrNGnpvA1Zz7IcZmjiXYyO6+K
         oapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Hqn1bFsYECy7m8HbQaooemkCJCNfrR5LIOGF7C9NvfI=;
        b=Vdh/rrn3JLXcXpvdv/ZFl7ab9K/cP2f415eVnLItixOjdW2U9FdcoLDxwXPUPDlc5s
         lv4+bhIlo7hqJX9N7VktxtJRcq1JcGI/EIUbjpwPQwWu1c1xT8Arfqz4K1jPVMK5I+o+
         bTnuyS0SLLl50RDGAC2EDpDjHhbQp3wv5B/Ww+bL3/mmBCT1ym1LnmJFkbJX/PAyU9Ag
         C4cBclc3nvna8T9H2rpiNA/tFjrnHZm9s+ALOYCpmp903XHRxhIebrspSJVZt8f8x6tC
         w12j0oU+ccLBSCVMGzcrSpt8UkWawlWOMM5DBxIYjLloW28B3xPEjcyvQ82zD/ENucow
         0bsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y88d2O8v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si80380149wrn.89.2019.01.28.04.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 04:33:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y88d2O8v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go66J-0003Mq-0U
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 07:33:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go65n-0003KN-2x
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 07:32:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go65l-0006m8-0z
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 07:32:46 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1go65i-0006gg-Bq
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 07:32:43 -0500
Received: by mail-ot1-x343.google.com with SMTP id u16so14442056otk.8
	for <qemu-devel@nongnu.org>; Mon, 28 Jan 2019 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Hqn1bFsYECy7m8HbQaooemkCJCNfrR5LIOGF7C9NvfI=;
	b=Y88d2O8vnjF5h15NId55LRIZMmjGABoi5M0Bj8dayCDnTJVBQrShRlnLcnrgXYGagD
	qhAUw1tk2K4EAnAN9hfbtq9gdutsFERr5W6F1IpWatiK503lCc9j1ZXtFillxVTCw39f
	veS5k+b/GpY6FSRrxT5T/yQnJqKGOSQJqjLIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Hqn1bFsYECy7m8HbQaooemkCJCNfrR5LIOGF7C9NvfI=;
	b=JfpvyZ3kNU8f76H8aSA+Igdtk/LK5LOVCROaalapghCWfn+ZXMKp3vmbEyA7dSLfaV
	l/DkoZA+Pix5ZTxZ8bZAFCfPhO0oR8/eftSpSNitMnkcSSb/q78bBHJutHzLiNpzYWc+
	XyA9HUigmM48jwg9j7rbwY06Q8q/b56HAG6u3VddwxzUl/zf7UB1hszOtwBJxDliNuxJ
	Tosh9lhr2gQsEx1Zs14U4R6yK3NNt1bvIYLguMml5iD7YQ4ZHSkf710cHHRDdmccS79J
	N3Sbaba+larMM8u6U83SFkwPbVnyXDL0HrOcH4VG0UNHR246RttnQoqbXTN8fvgDXAir
	nYFw==
X-Gm-Message-State: AJcUukeV6SEYzuE1eLfD6KzMmQym4gz5T4ulH7BLvKUwS0/4gigOG2o7
	W1GFJNzMlAHEwL/KKaJzSqVL2owOBQmA4mZ+tfzmhQ==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr16342299otc.238.1548678758070;
	Mon, 28 Jan 2019 04:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20190124140519.13838-1-clg@kaod.org>
In-Reply-To: <20190124140519.13838-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jan 2019 12:32:26 +0000
Message-ID: <CAFEAcA8jkXJNGrhm7W8-n3SzJRcAuHRENN_gSsuEyBwCZ53dJg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 0/4] aspeed/smc: add fast read support
 under User command mode.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wEQLeml3vA/h

On Thu, 24 Jan 2019 at 14:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> When in the User command mode, the Aspeed SMC controller driver
> performs the dummy cycles of a fast read command using byte transfers,
> that is ony byte for eight cycles. But, the QEMU m25p80 models one
> dummy cycle with one byte transfer.
>
> To restore the correct number of cycles, this series adds a function
> snooping the SPI transfers to catch commands requiring dummy cycles
> and replaces them with byte transfers compatible with the m25p80 model.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (4):
>   aspeed/smc: fix default read value
>   aspeed/smc: define registers for all possible CS
>   aspeed/smc: Add dummy data register
>   aspeed/smc: snoop transfers to fake dummy cycles


Applied to target-arm.next, thanks.

-- PMM
