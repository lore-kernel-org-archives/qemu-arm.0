Received: by 10.223.161.27 with SMTP id o27csp3942111wro;
        Tue, 31 Oct 2017 10:02:43 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QqmN0/KCTB0T8oYgQXDVFsuYCUvjfacfWoO4HKsWeMRPhF3/Chg8dMTs0ZEnKlIagrHOLH
X-Received: by 10.129.29.5 with SMTP id d5mr1655523ywd.243.1509469363619;
        Tue, 31 Oct 2017 10:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509469363; cv=none;
        d=google.com; s=arc-20160816;
        b=vKu+4W46geqjbBa3Be+8tmlOlgqTkbuUF2bTVHwH0vkDckIK0WlKBVGKt7HM3+2XK/
         Kja3WAGaV8mey92SIb6cdktXKf+ErR6S0bYGtetLeMncj9eVb22ZqiaFTp+4fnq/camp
         bOEnZmryJHccci8xP9mzplLWq2CrjzeizYVI9Vsz+9XxfjTbxkcnxvFMR0xBMTZ4bRPE
         NDidCvc8yAeuSREBsWjVq6THR6BmL1PVw+ulG6lfOxUNtMF00+mC30siRyQfkVrrZH5S
         oOB9V4l4tGba5020b74sLJrJMg7xDqRMV0o+y7c2D256eYMthHzlf1x3vt6mn87LJbUi
         /aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EmhzCKA/z6a5wNfEU44dk0OewAZHM+grCcLGEhsNvXo=;
        b=wruRBJFokU1RgueYYtZ3CdeNVi7qzVz5PpRlLWzed2Uy+hdkGSgYYZyQe4IYJR2uCO
         8PYYqPLOmzFmzbiEvBswI0S/YVMC0FqymfMKi1NmEa94EnWrk4K/4lNyHLUKLUurApf/
         5aaTeFNUsmO8E2Dd4PJptzbV5kbnv155+MkuCUeEdFBWBo91ZxOyU6t35t5jF+CA0aIZ
         1WtH4asHuIwULjI2AshZPe3Ad7q51RLZaQp7VNslX5SnRa0zN6l6enmwlx0KRO3lpFkV
         /uqBFDQmsz/IOxvbPAsR0ZrsWAmMfcQitxn8Iq5U2OFc8o++m953GtPyVAyn6CQTCcSi
         wbSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HS4VBW25;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w128si478717ybw.413.2017.10.31.10.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 10:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HS4VBW25;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9Zw3-0003qd-3i
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 13:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9Zub-00038Y-Ju
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 13:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9ZuW-0004ZH-0d
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 13:01:13 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:44044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9ZuV-0004Xn-PJ
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 13:01:07 -0400
Received: by mail-wr0-x244.google.com with SMTP id z55so16613241wrz.1
	for <qemu-devel@nongnu.org>; Tue, 31 Oct 2017 10:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EmhzCKA/z6a5wNfEU44dk0OewAZHM+grCcLGEhsNvXo=;
	b=HS4VBW259jBj+j8rfJB4J6/yZbc1tf1WBp0X9N80+f0ljIIKkuMLYofrlESWG/aIyd
	6Uy470C8H0C7NPf9p9uTTxLYtrzd2+y5YEfA9F5pxXeUxIYp8+SDFCeN8iI+tQPvzb2T
	VASJBjo7Q3Wthlg/0+a52ogKf4kMAMmFxHcY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EmhzCKA/z6a5wNfEU44dk0OewAZHM+grCcLGEhsNvXo=;
	b=QB8YBWslt+mdn3P64Gp+oO50uu2tqbt/MExcyB0Ien4g/zGlbfe39t4mPe92iJyibw
	5Yx7k+dSXtVhLhhcEB4VGHmDeFBfBs6g3OUvZSX6Inb2IDlnJrpuEOtIgsKI58pvugLd
	HtwCR5RdN08wJTuGUuPcS4qK0EZ5EY+OmGw67vDV4r1fKEXubtKJD1ScCwex4/SUJN+u
	f82RzU2hRBIPkRo7ZGOYiruPhmnbJu49PAqaRc1o60YW2IRj/6ExQISxl6wh4LboNpf/
	2pmTC/P8SY+mtzzP0f6dAdQbA+v9Dbdawe9YVbeMDyTbCkQeePTBhbUrnSqCEvjefHXG
	gjZg==
X-Gm-Message-State: AMCzsaUwaB/zVb94hfgOBomCYtHcD8moCR9Tk9D4wQA9waNhA+7+8QR9
	PlN04YJg7CxJQLqqKIcvuJPhq30W3PjT+Rq3R1eTOA==
X-Received: by 10.223.157.11 with SMTP id k11mr2530531wre.281.1509469266464;
	Tue, 31 Oct 2017 10:01:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 10:00:45 -0700 (PDT)
In-Reply-To: <20171031154407.4184-1-michael.nawrocki@gtri.gatech.edu>
References: <20171031154407.4184-1-michael.nawrocki@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 17:00:45 +0000
Message-ID: <CAFEAcA8Cv1+E9v3dSqPkUDd7s9zp=V+UJ1V7oXJBWzwnQdzFSg@mail.gmail.com>
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-devel] [PATCH 0/2] Add 8-byte wide AMD flash support,
 partial interleaving
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>, Max Reitz <mreitz@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BMlX9d0QTbx8

On 31 October 2017 at 15:44, Mike Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
> This patch set does a few things. First, it switches the AMD CFI flash MMIO
> operations from the old MMIO API to the new one. Second, it enables 8-byte
> wide flash arrays. Finally, it supports rudimentary interleaving of notional
> flash "chips". It is expected that commands will be sent to all "chips"
> simultaneously. See the example in the second patch for more details. This
> behavior is used by drivers for the PPMC7400 PowerPC evaluation board.

I'm confused by the interleaving part. Can you explain how this
differs from the interleaving we already support in pflash_cfi01.c
via setting width, device-width and max-device-width ? (see the comment
in the pflash_cfi01_properties[] array about how those settings
interact). If it is the same thing, we should really implement it
in the same way for both kinds of flash device.

thanks
-- PMM
