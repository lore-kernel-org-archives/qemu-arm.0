Received: by 10.28.91.67 with SMTP id p64csp1740463wmb;
        Thu, 1 Mar 2018 03:58:12 -0800 (PST)
X-Google-Smtp-Source: AG47ELtl+kR1k24I3Dv4ygrU8MpDTqHMef9n728RVdUpPJ4TPlguXJWLfx09SR1/LIdXYneUS4AH
X-Received: by 2002:a25:2e0c:: with SMTP id u12-v6mr799887ybu.369.1519905492318;
        Thu, 01 Mar 2018 03:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519905492; cv=none;
        d=google.com; s=arc-20160816;
        b=qoUoCwkNrNdO/+ugZnLQMAC9OpCX3+ioWSwbXj58F50l11hog8DCrzuyKKcGdwtxnH
         AX2o7z+RB76cvlrxOBTD2w6V8CB/ytQYBEhrqqegv9wgryWNWJ7XRrnI/aVv5w+lQiwn
         7bZw8tlJsIGJ/Nlk9jntJ5rwK/yU0MbeplLQbScdu27VGeCcGzJV7DPv3MEUyf2lh6hf
         TpG3e0Ddv99EtnIMPQKvbzyddQStN3aAYPf2yWdUnoZbjw5BrlKEbBhGnKs+6Fn0BFeL
         Oj0JGd/4BU/4gGUIAzQvnxRsmzjzoQfWMkIPYq0g3Y3zmlU/cCkzjY4w2Is8kierFYsX
         /Prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=79hxiZydiNdNsolmTVLOR1dw5+p4NFoIgsDYmnEAWOA=;
        b=ieTVFqZ5nCUcoh/kuscyD2IKcCjf9OfHZ5l2G+EmiWnPdda0DrMG4XRqArFxZruHFF
         on4yi15ONj97CdlXSgh1pBNTAq4LgIhOjwMxLKM3kPX7mylWAftWsv+IchO3bvspUaML
         TioDrZbZyse8SSRdp7KvtRoXnEXrIz+Tm1cPZpKisVtgE7Pyno827mHeToRQQPvzQkCx
         trn0OtZQVzrGEEHb1uloK2mtVuLGkMALSpHhJuELY2GhaO1H2KpkNP7MS+pgzMeFlHuc
         cK/pQQH+YZIE00lvc1K8qGN6PGQ59hjK3lvcgc+QEUwF+czwkgxrrdKzkCZFQ7goaM5W
         OEnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhJuQk9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127-v6si610580ybq.304.2018.03.01.03.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 03:58:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhJuQk9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erMqh-0004UH-P0
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 06:58:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erMjL-0006Z0-6M
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 06:50:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erMjK-0006zE-F5
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 06:50:35 -0500
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:32950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erMjK-0006yy-9v
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 06:50:34 -0500
Received: by mail-ot0-x22e.google.com with SMTP id y11so5317065otg.0
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 03:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=79hxiZydiNdNsolmTVLOR1dw5+p4NFoIgsDYmnEAWOA=;
	b=GhJuQk9hCDX4dgyGtGNl0qg8NcGdmrbpakNo/5n+GMtULFbIFvJ1vEgX0mnkycYuDH
	TlIix9N81lg8+dU5HgV3ZQZGxvaviYIDQSkd7UEJWHYLEg9gPeRsY9kHQ19J0XaaYp/L
	3QywzUnEfffLO0d5BZGYdXbSVcmMZfGK2hEnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=79hxiZydiNdNsolmTVLOR1dw5+p4NFoIgsDYmnEAWOA=;
	b=TucfgYsuJoQ8Kdz0Nt/cuo55ZMVe9Gw6p+l7byJo1BvK8551yIEfra6t/U3mCi2Dyt
	TRIamgmunZNq9297od7BuzDZY9H7qJAYH6K4gllHJGXxzY2T1tyJmJjBA/bOandwY3Pk
	yNFwZLyv0Qqkgi6GG2kIw/q4E8gNZmFlDvfEYsIaWMiCJ7Nx2FEpvro+/472CDbHL3r6
	d81JoIdpggPeJpRGdevmSYZFc71V9hhOwAAQIO7n6xoFFXznoTP8rbxczZRG1SCeQcfm
	jto91rFFqAPjJ5S+tTH9eJ9nreVGGAHuvglYmjtHRI/NasqouMRNBi+r2V9eTbi5brB3
	QfHA==
X-Gm-Message-State: APf1xPA9fpnp2uC0xDimMNlu3sH1tqGW5g5nyJTBr9Z13M4BBsWD8onD
	J4XBIyPk54H3OTfQjlkdGBMhv786HhMf7XgxxaZUww==
X-Received: by 10.157.27.17 with SMTP id l17mr1069328otl.294.1519905033459;
	Thu, 01 Mar 2018 03:50:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 03:50:13 -0800 (PST)
In-Reply-To: <20180228164816.24110-1-richard.henderson@linaro.org>
References: <20180228164816.24110-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 11:50:13 +0000
Message-ID: <CAFEAcA_--27=va-PEtWporwmF23TueP-j=g0MMbF9ZW4L4K29A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [RISU 0/3] ARM additions for v8.1-simd and
 v8.3-compnum
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mA15Zh8IXZYf

On 28 February 2018 at 16:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I've rebased these onto master.  There don't seem to be any
> consistent examples of how extensions are to be named in this
> new group-enabled world, but it's my opinion that the bike
> shed should be green.
>
> Since fp16 support is not yet present on the AArch32 side,
> I have disabled generation of those instructions here.

Applied to risu master, thanks.

-- PMM
