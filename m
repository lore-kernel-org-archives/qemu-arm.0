Received: by 10.223.159.74 with SMTP id f10csp719848wrg;
        Fri, 8 Dec 2017 07:10:53 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbMiFp/oEz/d4t7dR2Lrx7oQBaKZqLsj7cc1q6dndbuTXcqxu261yE3IXchX7116JqPx6/e
X-Received: by 10.37.59.2 with SMTP id i2mr19968360yba.489.1512745853244;
        Fri, 08 Dec 2017 07:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512745853; cv=none;
        d=google.com; s=arc-20160816;
        b=hrqw1NJCs5TlGNzpkh240IF1f370cVpH5eMfbIyBiHlFaSL7reaN8LnaVAN8eCYEuE
         bwT8YSjPCorQ27B9frGVI1M1u5xiIv0AFf6tYfQSpgz4n1RzTXi3/QCuPLSgUR4jWgKc
         NSHyDAK9e8nLwtkPIYyHp+GKR7yEr9moY9gRH1+g3t6A1Nif7VuNjXwNNzjEQgOWDfGw
         X4Ljea9QE3ogQzyt3fGO1NXbbaHZmJMMPDSQIX5tYk7gfhjhYQ5qMhJiwuNgT4/L/fUf
         d2IX8HnNknQA1Mon+1DGREsU7KWT/4iNXSz+iYoSHmnwmTYJZY2jN9L1JkimnhF27iiV
         CnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=32pfDatc7kKkFfYi/rE/abzjbmgn73yaO9pUcFJd6Hk=;
        b=pNCqWUq1zWcuwPh5iB6lZ4Euiywmu860wjT95fCCGZNrrNAO2SVmtftU+j9muRWwBX
         naWmQFj8K7VBpKbxj+uFuCZGeiXM12k+C3UYEfaPbw3L31jYaqHLbqx6tZAyq6Jx1YX+
         agp0t1wHG9JXtoELkKtVIqnhuE4AM3kMPguQwzw+KYbbjrgaJNtJ7IUdYJkB/+P34Mk4
         UOgMCwfw+IYQ8lzgQ31bdbndgTfcoLpm4Yu7hfjnFkTd4WOgK6JnBY9uEzopM5Nv76GS
         5VyDS1f09/A78XLBGe/Jujgt48lWcA5vtekZQHB7ziCeYZZq36Wr/DfHfP1091U6sd9o
         027w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDNkgak9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si1298372yba.9.2017.12.08.07.10.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 07:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDNkgak9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNKIe-0006J9-LJ
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 10:10:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eNKIS-0006Fd-D0
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:10:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eNKIR-0005iQ-Fr
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:10:40 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:33545)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eNKIR-0005h1-BH
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:10:39 -0500
Received: by mail-ot0-x235.google.com with SMTP id h9so9408956oti.0
	for <qemu-arm@nongnu.org>; Fri, 08 Dec 2017 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=32pfDatc7kKkFfYi/rE/abzjbmgn73yaO9pUcFJd6Hk=;
	b=RDNkgak9Y4QoTXh7o57DV8V0Je6pTE7YDp9VETLkHFdVxbgWChFCseLMmgrH+3Qlsh
	GxwUk2Tht8SXRGxnTssANzpKDTnHIj/F2vGe5M75N4dKFEWVE1cbSGwhocoKc5yi1kFC
	aH+u5s6y1OF7BW0Y7CdGFJy/7e8QtxDVuB/BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=32pfDatc7kKkFfYi/rE/abzjbmgn73yaO9pUcFJd6Hk=;
	b=iaGXCH4FCemEIrditcOF9XQx7sp3GCzC7WVDrI0bchyl0CqroV3Ln0RbaBM25Oji3Y
	MAR06G9+6DTL24YzCSKwnfdatYl5xnbq3UaSSRPbqHPxvyfYyVUgivrnKjN9f5Xs5ZMg
	0mNKNyI7+c5cxlBGvy1je3qrldZFeXufiamnHHT91HB02vDTHaiuTiPtYw9yAa02Gb32
	zJzs8ienSfY9Zt1LPQ1wKZjwDslxETR7cNLZfJwdM9VPmk06oB2Ef3gIlKPPSPzUGOeD
	J9Ol994xhlfjMuPj/Uer7keDNIDYJUD1IPxaYZscZNnp8NudDuQiX0FAqJGjg6QUOuiC
	beAA==
X-Gm-Message-State: AJaThX49p2xUerGiy6khImO2zpanF4y90VGJ/zozZC3l1ZBjP5OfTFTm
	qc2cPDyHYZ0b5oVnOrWrZDaQNXIx50AHG3Hh2zIFMcr4
X-Received: by 10.157.13.168 with SMTP id 37mr29233591ots.197.1512745838491;
	Fri, 08 Dec 2017 07:10:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 8 Dec 2017 07:10:18 -0800 (PST)
In-Reply-To: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Dec 2017 15:10:18 +0000
Message-ID: <CAFEAcA9RmXV_Q4VML51422n2VGDewDqsi4BVe+Jb9YE9dCTf2A@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH 0/3] hw/arm/virt: Add another UART
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s2z6sFKO4o9r

On 8 December 2017 at 15:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset adds a second UART to the ARM virt board, which
> can be useful in some cases where you'd like a second comms
> channel but don't want have to deal with PCI to get it.
>
> Patch 3 attempts to add it to the ACPI tables, but this is
> entirely untested and pure guesswork, since I don't really
> know anything about ACPI. That patch needs review from
> somebody who does know ACPI :-)
>
> thanks
> -- PMM
>
> Peter Maydell (3):
>   hw/arm/virt: Add virt-2.12 machine type
>   hw/arm/virt: Add another UART to the virt board
>   hw/arm/virt-acpi-build: Add second UART to ACPI tables

Oops, Shannon's linaro email in MAINTAINERS bounces; re-cc'ing
with the huawei one.

thanks
-- PMM
