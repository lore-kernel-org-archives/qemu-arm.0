Received: by 10.223.172.38 with SMTP id v35csp180614wrc;
        Thu, 7 Sep 2017 05:52:09 -0700 (PDT)
X-Received: by 10.55.39.22 with SMTP id n22mr3691443qkn.293.1504788729352;
        Thu, 07 Sep 2017 05:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504788729; cv=none;
        d=google.com; s=arc-20160816;
        b=LWmAWZfhFa9IG1K4Oh4sMTgW0Y5s9FMkHzULKMxh4CkeFxFLLhySFr7nNWNShkbTKm
         Yl5JqS4MScVyiaXVHx+WknrrdUcoEazZovpzFfaidxaWROl9N1kJneX2OK+7xEP2zJxf
         8uyDC+GPgvCjfNV1czPM3/VpiB1PZ+d+mFf3QjhMJX6XfyRQYNyXK+AvYzcJ3RrBEzKw
         UvSeilZHQ8ro/K/4v+1qkq3LkkpvUUtngodBImaoEjouWIaIHZgx5ylTmqO9VyB5BRuD
         z63EzOKfP1ZH2PPb/Z6C3XvDD1MYt9ZguRXeRyi3TLIOUxBUMR+vkrIxU9B3A6cy5Bls
         74Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YKtmmBDLzBsIN6UWQBeRd7i5XXiJvBdBh2RSuBKzXUI=;
        b=XPZ12woyaWY7tPND/juR0khWYElN/JJexFHFjrBrWaf13VjKONyHXl4OxPSKsJdE3Y
         VzRbjP8JR88YF6evq96aMPGJTgsqFXMz3/yxHJ1PmEsoaMA1h/93pE1IG+i053vEduZO
         AihC3cbgiQ+3rdUDOTchVSbE8pq3/1G1YQHPTV4rGGO3nAt1mg7QDZRm0P28YWJbqoq0
         fcKhCtPgpnEF9EWTnK8pkaDgGeQm3g3X2GXeSvlj9y5/Zc8mgLyaQwollN+cc8DgX/ao
         hEpx311d8HMBczqyNCmNvFHTyXAJ3cd1Lwt0A+++xZEgIR1qNXGnlxIqXjqMKokxVuB1
         2Ojg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I3gTWrak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7si2730743qkb.175.2017.09.07.05.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 05:52:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I3gTWrak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpwHv-0004LG-2u
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 08:52:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpwHm-0004Hu-Ls
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 08:52:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpwHi-0007Fj-55
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 08:51:58 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:38321)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpwHh-0007DN-Tf
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 08:51:54 -0400
Received: by mail-wr0-x22d.google.com with SMTP id 108so19167749wra.5
	for <qemu-arm@nongnu.org>; Thu, 07 Sep 2017 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YKtmmBDLzBsIN6UWQBeRd7i5XXiJvBdBh2RSuBKzXUI=;
	b=I3gTWrakDGUDycCu51HQcnhUpAx0R9nkh8NJ6kj6f/uvMWEvUkI5GMfnj1HT4Aw1Bm
	WgHTwKr9qEFUZfa3dVcAsNClX2DUEWrUUwl1U5r6fEOt6Pt/V04qUEaafWGtJjXmUB8A
	jH0ztYPVZKLGJTGbyeAdhB7YhKnUXOlNL85gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YKtmmBDLzBsIN6UWQBeRd7i5XXiJvBdBh2RSuBKzXUI=;
	b=QFs58OR2s7EVZYxyz5QL87BPF1WHkOnL5sIFSqxX5G242cCz3tj52XJ0UkHVpMmt6G
	sC2VElSOtMrykkam8mKNWoSvK0boAy1e5xE56DPNKpn2iQOI2/1Fj1357bPnP1nlwF1F
	/rTfHfE8EEoR97y0BxG80e34PHc69h1SJrpSEFUiabNbrzrrPegsiVfc2e5Y1iaCK+rJ
	G5I1wRuu+c2OP3HT9LKUcEoZfCih4enLsZaV8DyLZP8+IqeiyZfYLZX20Sgr6tXmAOuB
	WLaHsxgrIHndntMCjgTuBYkybBashVE3z/W6ZVJUPL4NbdqbT4tUdQEE9iRwxkleR+ky
	O1dQ==
X-Gm-Message-State: AHPjjUjWvBXHH0iieAw7nWW6+ByS+/h6IgFyICXQGhHzsZub4hXtWPGS
	pekDulTd5v77sIfLHkXEmaUR6VL4zysJ
X-Google-Smtp-Source: ADKCNb6rg0nAeIfMpcDwyP2nEmnHKzkOOmll0YQVDtewGCo1yRjD1ifLrdhlM8MtsKBhUfR8r4xSFDv8HIN038sphho=
X-Received: by 10.223.187.211 with SMTP id z19mr1723797wrg.97.1504788712618;
	Thu, 07 Sep 2017 05:51:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Thu, 7 Sep 2017 05:51:32 -0700 (PDT)
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 13:51:32 +0100
Message-ID: <CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH v2 0/5] Expose the secure and virt properties
 to the
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vIEuTiYm2Fjc

On 1 September 2017 at 00:34, Alistair Francis
<alistair.francis@xilinx.com> wrote:
>
> The EL2 and EL3 work is working well now and interanlly we now have
> tests that expect to start in EL3 and transition through EL2 to EL1. To
> make this easy to run let's expose the secure property to the machine
> and also add a virt property that can enable EL2.
>
> This series also does some machine/name tidying up and makes the first
> move to deprecating the EP108 machine, which was just an early access
> development board.
>
> V2:
>  - Add a virt option for setting EL2

It looks like only patches 4 5 and the cover letter got through the
mailing list server, so patches and patchwork don't have the whole
thing. Could I ask you to try a resend?

thanks
-- PMM
