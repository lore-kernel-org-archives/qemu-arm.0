Received: by 10.223.197.9 with SMTP id q9csp2447092wrf;
        Mon, 9 Oct 2017 06:24:11 -0700 (PDT)
X-Received: by 10.237.60.148 with SMTP id d20mr13690408qtf.118.1507555451271;
        Mon, 09 Oct 2017 06:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507555451; cv=none;
        d=google.com; s=arc-20160816;
        b=Hwg8p36fPBWaKc9eLhj6GsWRhYF4tQ1I0s8ZVzhoJPh37wsWNd/oJGCX2LzreINNJA
         Wyw/poMTmOxKijJyisMV1ylY5k6Dz1o1mNjjHDTqB7DW/To/r+VOzoJmifPalOblMrvs
         62btzgQxr+Ptv5TQblI6szWN3lamkwTuVizcLu6rGcIgnSNnqsKDzZnZWisfBdCnN+my
         IlAwgemzqSZbYqbmKyz0NwnjpYW2lxqoOQMLWgyXlDDR4j3H+xDhbx3HJsGT/5u9t1Xv
         uRHVT2Q2ADLvZXbJWI7yxm2ejhvXUlCRT3341PgRjl3fXyUtCzLLroYjAD338ovg/tGx
         IrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=tSTQsvho8YuMKssfAFYpM3zeO0l4x2Q0IJa08iMwAOg=;
        b=KcOOUKsU//nLssbnLwTnBkoRv8C3f0vCW4ef7a31rz5NIiQEBzu6wmkvgBTnF6EEsS
         obTJ8/PV1jHVrnH+HoYMsc4ILpWC2T8ni3ighdy8+XcmCnnPmgOfLvN6VJHd9UyX4Ni1
         re8f0FpgmdDizKyo+5O4ghwlpwAWVv2zD47h+5k73dWNHWI+tEWT45nYZeiinmdmx1Xd
         IQfkwjA1MKxXjcoceyJanRo3ynUbszPYMiPwdbZ48U1F0PiOkEl/3HU8IqzRKJcWExum
         AreoySonGDiShBG4hyhMDCiwMqwKC2I50/h4Iwm+fB/JCAqerPZ+WXN8BFbfO69pRVIC
         rPYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iHDGGozx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t34si6425995qth.47.2017.10.09.06.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iHDGGozx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1Y2U-00043H-QB
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:24:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1e1Xzj-0002Eo-Kg
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 09:21:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1e1Xzf-0001ga-M3
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 09:21:19 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:57192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1e1Xzf-0001fl-Dw; Mon, 09 Oct 2017 09:21:15 -0400
Received: by mail-lf0-x244.google.com with SMTP id 90so19121500lfs.13;
	Mon, 09 Oct 2017 06:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=tSTQsvho8YuMKssfAFYpM3zeO0l4x2Q0IJa08iMwAOg=;
	b=iHDGGozxCXjPdKnOIl+rBm7Xy10pgQqZHlGforaAC9jdeHVvRUVdmfzo05RJTFbe87
	fUiLIFsnlVhJ/Qjeb/mjoW+qdzI2STDGzvvhsbr0D9w6XQvc8oNhWETwn5zqdPYCYz0i
	MdvyREvcOYl4c6YoGQhzOybzczFu51rcnkaQ/JtOrIKgqciIqhHlpKCzZKdXpQsgYWPF
	0slWt0O8WQxuiszmpB69wXuhzy3AAo8vGC9AuSQ5oawz9/i5/4AX+ctpsaUAyjNyXD0P
	32eQYkhHS2YuW6wdIn9wL7TdhleVU/BTVJAhIA/igumnkyU43BmHq29fGrvMasx00feQ
	erxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=tSTQsvho8YuMKssfAFYpM3zeO0l4x2Q0IJa08iMwAOg=;
	b=K+kJCnI6qRdLuNaDvxJ2PypARZ00zd6CzfSemf+Lym8A3k+ehfO7pLpGeT0qNtqTNU
	AkfYRLjkr3rw8vN0rea3bT3aPSeFTBBlMyXxFiYVQSw8A4EZeAG6mVbdL1kSWwfBaJHQ
	d9h6g984kvIjC10DO+6dmMEcoDEAjuqN51Y1CzJ7dg9617VrahBsxvOdypC9DYKRKRSV
	Mrzvr3XCtKqox2A41DI3hPrabE4jZMC35VmL0AbY0mo5xbXGzX7yC3F3nNJSRo2/YCnM
	zCx0AjKvlYiaN+h2B7385p/QkpGqF2qYSNSfCRcxo3ZCkrDMkKLIOYBdPHxlhSCC4+1h
	brJg==
X-Gm-Message-State: AMCzsaUBpL3c96Ut2NopCGfDHnvD3wPdIPo2wRdv9Ty9LVVBCSGVUUBa
	C1bsdY+W1PEqCNd1jXzr5tM=
X-Google-Smtp-Source: AOwi7QDq4D4qGXFSkIPB2bRa7TbwrV8Sh2dXxpLnHF2cpI4fm9feRWdx135+DJ+uY5vjBFUW2ZN5XA==
X-Received: by 10.25.83.78 with SMTP id h75mr2351806lfb.134.1507555273779;
	Mon, 09 Oct 2017 06:21:13 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	q70sm1942744lje.58.2017.10.09.06.21.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Oct 2017 06:21:12 -0700 (PDT)
Date: Mon, 9 Oct 2017 15:21:12 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171009132112.GA5553@toto>
References: <20170922171323.10348-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170922171323.10348-1-f4bug@amsat.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-devel] [PATCH v5 0/7] Generalize MDIO framework
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Grant Likely <grant.likely@arm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdsU6RgEyDXX

On Fri, Sep 22, 2017 at 02:13:16PM -0300, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I have a follow up series using multiples PHY on the MDIO bus based on this
> series.

Hi Philippe!

I think this is a good improvement compared to todays state.
It may make sense to have the generic mdio bus functions in mdio.c
and specific phy models in separate files, thoughts?

Cheers,
Edgar


> 
> Regards,
> 
> Phil.
> 
> Grant's previous work:
> http://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg00257.html
> 
> "There is more work to be done, particularly in moving to the common GPIO api,
>  but that work can be done as a follow on patch series."
> 
> Grant Likely (7):
>   hw/mdio: Generalize etraxfs MDIO bitbanging emulation
>   hw/mdio: Add PHY register definition
>   hw/mdio: Generalize phy initialization routine
>   hw/mdio: Mask out read-only bits.
>   hw/mdio: Refactor bitbanging state machine
>   hw/mdio: Add VMState support
>   hw/mdio: Use bitbang core for smc91c111 network device
> 
>  include/hw/net/mdio.h   | 124 +++++++++++++++++++++
>  hw/net/etraxfs_eth.c    | 291 +-----------------------------------------------
>  hw/net/mdio.c           | 280 ++++++++++++++++++++++++++++++++++++++++++++++
>  hw/net/smc91c111.c      |  27 ++++-
>  hw/net/xilinx_axienet.c | 189 +------------------------------
>  hw/net/Makefile.objs    |   2 +
>  6 files changed, 438 insertions(+), 475 deletions(-)
>  create mode 100644 include/hw/net/mdio.h
>  create mode 100644 hw/net/mdio.c
> 
> -- 
> 2.14.1
> 
