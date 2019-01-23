Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1172741wrt;
        Wed, 23 Jan 2019 13:29:15 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6ci9wuFOYHku9evVF1DZxhRodfqasOG4BbB7DZqjQh4T6YuDqGlXSea0u3rorgCJWFRGaB
X-Received: by 2002:adf:fe11:: with SMTP id n17mr4287081wrr.329.1548278955770;
        Wed, 23 Jan 2019 13:29:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548278955; cv=none;
        d=google.com; s=arc-20160816;
        b=RfGNuieP0jjnEWuD80M13of1xiivJbVpjp7ge2qGeY/PH+GH8MJvxNvACfq1ReeeSs
         1fF7cG5YQy58HRyBf4vPejHakGju+cTSEwQJbFO3l0lvqRwX2Nc5FDG5n1YV0kmXa+aF
         U+kpvYDK8aAMFZ8GCZKtIxa9i7E4CLH+vBiv8h0FdXc/oEcHZ+5CTgUYSdIhyJTwgi0F
         rvpoIF81w+DIhh+uKDk6GoJDRAWR25yDTXu0kx0X+rL42JNrIFRpMGN2myUpEJ9C0gOs
         tnCLKmtU6K5mrS5JIbjLHAsFY2s4CyW95Qu7thmLJv5ZTKUECZSXagy/wO3Xm9taHmkT
         RR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YfZ+pMkFhkQkTk/Gqf1BLI5vQAQVXdpjl3mZU5ta5B8=;
        b=LSyGdsm4P8yyJ4ciuwyMIvPHAMyNzHGn0QR0ImuakAILj7YLONKnYX6+XXcqT/sPYq
         rUIPV5OK2kgzqoMwQM2rhGcsK33zxJr/S/4YRXDgyL52sQjPFn+Aeuz2GE5ZN5eKCygw
         RGmAeeELznZTMFUKd01U3dgvQIYGy86ZWX+/s5lF88LGIF3CAOMX1nmrreVZYscsIfDS
         Kmq4PJVSShA+cViTK80MTrYrvwl0QlSeTXejoGDcKupZ9ertC2j7GP6pAR0U9Bn4Pqp3
         OrF1d6R5yA68zVAWBx1s6/IDkIIPqP8TxcO8RRIb2PrCRERQp/Xj7IcQ7S0Sftnpj/ly
         gkXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="P/jxg5PN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si29158432wmg.69.2019.01.23.13.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:29:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="P/jxg5PN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQ5C-0001xs-Q6
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmPyA-00051g-LP
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:21:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmPqE-0006E9-K0
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:13:48 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmPqC-0006CW-KL
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:13:46 -0500
Received: by mail-ot1-x342.google.com with SMTP id v23so3264758otk.9
	for <qemu-devel@nongnu.org>; Wed, 23 Jan 2019 13:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YfZ+pMkFhkQkTk/Gqf1BLI5vQAQVXdpjl3mZU5ta5B8=;
	b=P/jxg5PNStw5qY31Bk+bxZ3vDGasAo83tRI8CZESbF4eITrnsaVxXKPb5wjvoYx2fT
	tSIQa+QQvBnkU56dguBBURcqGkA4G3zoiFeVUjGNd4Aphxcvds8DITtmBK6V0eluc3fF
	uIwE98PmEsP2C4lpe55mHot+KpuMdp/t+uekQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YfZ+pMkFhkQkTk/Gqf1BLI5vQAQVXdpjl3mZU5ta5B8=;
	b=lvtFHdzeO7PVhJaqhakeQeLJq11Jz/pkDIVkzygW9umVuCdm6sdr40NiDaLIWLDCy6
	92KaAMizb1HGxUlfJeb2xTo3eFgu40ozts1ee3Ho6p0dwZ/4FnsA94CHYLDqBT3ataDR
	KIYEevGbyuZAmduF/56asFcJA3JjEktuJvblTnaDIM/eBXqbWOywNRgHJ9dBWkhJ4F2x
	xrwD+RvhnjVDVVNKTiky9jd6ZbFpfgIBGxFAlHyOiQm3CoOpJ80kRPQrkxFDknceU8D9
	duv7johDr4fPQRaRksxkk+c7HvLw22R/A15lwWzaOFZFEN7UjcAySHzfCxLDT10akziY
	BCsg==
X-Gm-Message-State: AJcUukdMJ40fIHOOHTCLdk1SDNLQpshN6ectCFvYhoWpgvmbQ9WuQ3xW
	kz7YHx7aodT4kJ39RKeNRxcbWmKvZ0+fjyWy7Tim0Q==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr2605638oth.317.1548278022076; 
	Wed, 23 Jan 2019 13:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20190120143452.21683-1-stefanha@redhat.com>
	<20190120143452.21683-2-stefanha@redhat.com>
	<CAFEAcA9KkYC7MHquASjoghuDrvkkE_brnM6teLknj1H-waM_0A@mail.gmail.com>
	<20190123210725.GA13509@stefanha-x1.localdomain>
In-Reply-To: <20190123210725.GA13509@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Jan 2019 21:13:30 +0000
Message-ID: <CAFEAcA-be9piRLnh-BOL8PKDpSYwK_aQrWzCoPs3is06kER=DA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 1/4] memory: add
 memory_region_flush_rom_device()
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 10JvKZeQJANg

On Wed, 23 Jan 2019 at 21:07, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, Jan 22, 2019 at 04:36:36PM +0000, Peter Maydell wrote:
> > API and implementation make sense to me, but better that Paolo reviews
> > this I think. I guess we should add calls to this to the pflash device
> > models too...
>
> Okay, will cover pflash in the next revision.

We can do that as a separate patch, since it's not related to
the microbit work. For this lot we just need to make a decision
about whether to do this this way or have as Paolo suggested
"memory_region_invalidate_and_set_dirty()". I don't have a
strong opinion, and it sounded like Paolo didn't either, so
let's go with the code you have here.

I can take this patchset via target-arm.next.

thanks
-- PMM
