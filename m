Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp175975wrt;
        Fri, 25 Jan 2019 02:50:33 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4u1csdXrKXUkOtMvVjftt8pv2+DANzWDU68RqYDLiMyNwNIFG6pQznZJek3d2Py+Ep3vYV
X-Received: by 2002:a1c:4955:: with SMTP id w82mr6629344wma.33.1548413432966;
        Fri, 25 Jan 2019 02:50:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548413432; cv=none;
        d=google.com; s=arc-20160816;
        b=xgtwqokmJwLCftbXRDRJQETtXEOedLss9H0PhYiQyWR5Q4mK78poRdCuYxhkIHaXaJ
         Cl/ve3GbwbjSMvMBQcFT5QC3HOUPt6DufBXH9x9w4gB6oj12qHIc8FEqxk9D3NsT51IU
         Wuyl35GynOth7+DR5HXp1z47F/0X+4EVOsmYenZ0pT5jRUNQQxhCVGVJXrCabMS1mhna
         HGjUw5CLfurMFnah8mubI+DEDMT0Xt5YrpiYXFv65XbhG0+sXOVa54sc58541CZhoKT3
         +ba5c8dzb7oVDBRblNIRqmEENbNz1g1uUNZsw5AUHyR3YLpXJ5BkdS4VOMHlDporL7Ur
         au1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Q6XjCC74Khrt39jWOBtbXontHGaEUv+INzCoWlHoFEU=;
        b=0vTKu6kD3IQAnp2nDvA2mH7ak8+2G7YnZQo+1bQB+bdytf2Egvx54ldOt5tNqhCRwX
         XIeJFtAFG2MGcQ6k8PT7G9zD7j39W3flFORpEau6W5W3f2v1/TaqQ0qbvI/oTl69USAC
         puMzmu6ssg2AK+6EMNv6a2dtx4CKryvqXBS23Rvtlt4eQ3K+0SHHOzkE2acTsIYcaaH/
         eX8OtG/OFu6x2p8hbGBN0X9AGv2KE2Jp+PpkBfW0r2+VOpm0+HdVxQ07WO8JtRBPYhkZ
         oC7EuNM87aZurFDXH3P2d7GMfZye2Oi0NolwG4Di1h8EB4gq6XZhWSqkmj9fqjebEt9F
         Derg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ihS/4LjE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si71796848wrv.122.2019.01.25.02.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 02:50:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ihS/4LjE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:41907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmz4C-00005c-2A
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 05:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmyqr-0005pr-G5
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 05:36:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmyqq-00035t-HH
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 05:36:45 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmyqq-00031E-AO
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 05:36:44 -0500
Received: by mail-ot1-x342.google.com with SMTP id s13so8100050otq.4
	for <qemu-devel@nongnu.org>; Fri, 25 Jan 2019 02:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Q6XjCC74Khrt39jWOBtbXontHGaEUv+INzCoWlHoFEU=;
	b=ihS/4LjEL49wNy6KX577Is+eLrOnXzt9xwOS9NkgcbugAA4fcBH5xMJd42mOlyfXIU
	FboEU+p9IAnzbZA4pfhxXeYjlKyh1p8rKuHvzjiF6HZOkvejNZV3Jfxk1BBjkq5bxzfb
	aHVtow/r0ac1nJ3xcKY0GufP4gr3eEn24iM3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Q6XjCC74Khrt39jWOBtbXontHGaEUv+INzCoWlHoFEU=;
	b=NbdXW4h/fN+F3AvivhpI+iaOpDhy0TRisxkTpgudfdDBMJ7I7rFOtNs4j3Qf3tX8YQ
	5sl0oSLxGQQKPgYH69Nld+dYKN3VCQ48W91QpA7JSwij1l9I0NZFyWjPE2ytNkp5wONz
	ZDM67KWcK1YE+FZg/cbM78YfMrPfKOSzYHRedHjOANv6eqw7U8JPNhvCIqi4V96bh6eW
	9TMeWxcoXS7bIlOs5ZOTOkEUBSUmBmsR+TCcVRbhF48Y/5qJ3W7JTBxMw0u48CMd13bu
	RmWWjxo5ALMIBXY67k6BiVZOWw7R+Hv49MkRVQSo6ncScFH6f4hILODjax56c46kCxWq
	LXEg==
X-Gm-Message-State: AJcUukf08X+KpdKVtC4CmfnNDE95quo+35ndW2v/r8Kz0P/4cFS1uBgb
	WeSbIL53ae7vsVllPZ5pD4teczYnPuCGwADpg+m4Sw==
X-Received: by 2002:a9d:7d18:: with SMTP id v24mr7035601otn.352.1548412588272; 
	Fri, 25 Jan 2019 02:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20190123212234.32068-1-stefanha@redhat.com>
	<20190123212234.32068-3-stefanha@redhat.com>
	<f58f9085-c895-1fa5-9fae-afe4ac8de39a@redhat.com>
	<20190125102842.GB28305@stefanha-x1.localdomain>
In-Reply-To: <20190125102842.GB28305@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jan 2019 10:36:17 +0000
Message-ID: <CAFEAcA-Dy0B-qCdojx9j49vF_p7OcAyQAiXYMv-_EZq7CCgT1A@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2 2/5] pflash: flush rom device memory
 region
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Julia Suvorova <jusual@mail.ru>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +14ASg9v1XJ5

On Fri, 25 Jan 2019 at 10:28, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Thu, Jan 24, 2019 at 12:11:55PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > The device realize() is also executed before the guest is started, is
> > this call really necessary?
>
> My rationale was that machine init only happens before the guest is
> started while ->realize() is called by hotplug too.

Yes, but before realize the flash memory can't actually be
visible to the guest, so there's no need to invalidate anything.

> That said, can pflash devices be hotplugged?

I guess you could have one inside a hotplugged device in theory;
they can't be directly hotpluggged. (I bet that in practice
there are leaks though if you did do that, and we don't have
any devices that do so today.)

> If you guys prefer not flushing from pflash ->realize() then I'll drop
> it.

I think it makes more sense not to do a flush in the realize method.

thanks
-- PMM
