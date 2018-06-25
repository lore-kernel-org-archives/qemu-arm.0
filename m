Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3882646wrq;
        Mon, 25 Jun 2018 07:34:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd3MJZBWgMXlt97x9spSMSOPEX5PKdwYpRtVgWo0yfAX6P5iqoLTR9NHgYBH/1Qkweq0wpA
X-Received: by 2002:a0c:b79d:: with SMTP id l29-v6mr11278976qve.110.1529937260013;
        Mon, 25 Jun 2018 07:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529937260; cv=none;
        d=google.com; s=arc-20160816;
        b=Hz8tl1mEusmcd9W962BYNTQ4rnzb21Xn1BE2qm7cnxKE7ViYCmmhodYMZM+oGsNLnh
         v/FdFKSnYY62T9pHjokcT0ccnOoVCP8KfzPCgYgtJaJq7b0wF4tOS2W3evq0HHSzo5Vt
         YgABXnrrLZgRmZuYSWL0+F9EPF/0iwoCXmdK1i6gAvn5dtypLeWKEpuMhuNnEQbjro9B
         DM41u9cceoCRWSdWUkRp39KR4khVwp6X4t2S4ZYCwi+B2t+yMl/eRTBFl+XUYfszc2aA
         TKXOrfGhppPDwsFb3RBc443pyesDA4EjFJpitSKypQIweyw6nW8p3FLoPaeYlNCsQ4Ug
         KFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=t7lfEdbjnVmUsde1sXzKuMazOMYaV6i8Qt03neJN6pk=;
        b=CFvaAaC1P/9c/gzGNozYBuPXO/MalAB30+134lnNw/papPBC/OgYUuaFav46uyKHqJ
         /opOPiqSOa/N65jc4CpCv0wumfEpSjrhO/+jpeD335DjtJPh0ZawmaOqW79DtoXgC4Y3
         TCOb2c3MlswheQw2cCXSLwuAHQ4lueLBfnZvG838XnyuKo3Uz9tAmccfst6KzBarCXnd
         CwZ6joiIDDje6M22H9JhgtarQa6XVBcVbkmIci8tVyLzZWJinzMwMO2rs5CvWekP9xBg
         LXwu+WTEQ271R9ASeyaz7+eTpR/Hq4RBH4kUl/gUshpzi0jVrOFHx1NZ8qxEArU/Jojq
         hC9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NDWd0Lsv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3-v6si3193300qvb.116.2018.06.25.07.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 07:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NDWd0Lsv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXSZP-0005m5-Av
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 10:34:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXSYT-0005Kd-Fi
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:33:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXSYS-0004J9-Qp
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:33:21 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:43869)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXSYS-0004Ix-MH
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:33:20 -0400
Received: by mail-ot0-x243.google.com with SMTP id i19-v6so15271023otk.10
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=t7lfEdbjnVmUsde1sXzKuMazOMYaV6i8Qt03neJN6pk=;
	b=NDWd0Lsvl2N4RVgoVwGPy8aVlcrpkUC5fW3hVJ3xFPhQNbHnEa8eFpMiosElS8DOfw
	iE5KvE3tUsSLb8cRutEVAhLV5zV/mXsV0TAxVP+0rhqphV0Cp86hJgK1x+4LF0yUhazG
	BoO80bzjGk8qa0B6zduJVnq5lFhSVf8OKpkbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t7lfEdbjnVmUsde1sXzKuMazOMYaV6i8Qt03neJN6pk=;
	b=Pa3C6oTMPgTg/l4KSUyv7U21dk97FVoGsVgbFwgBqATHoJdoJQGfEGV9wu3u5FPKmN
	z++fC+JnynoulJivGGRTnuToY6CoRIYrE8zikcedEyRnp/+FxEK3NuIIuDo+rhvC8YFv
	JpWNSKko5UhGFMgPlcHxlPvhI9EKoL+oAVD70lVj/TUbRCwKgjimOHOam0FTeK/CWnFr
	PeSBvybHS3CswWg3UvT6TjEwvjRE20r1L5AJz5Rj3ZxzrLhJTXjKCyMH52GCUVzOo8L/
	Rqz+rYsZR/sI8dUFY9+xcC1d3eNTYaMxoz/wVG0SThKzKrmVfT0AoxmQs7uSsUXcqjly
	iAsQ==
X-Gm-Message-State: APt69E0ckldFNGFg+T/+0MBTo5OUzVCOxW7dQhR8O7MUubP/v2oM9jcw
	UXnk1OyRIDi3pokLMGduK9Vt6Q/4LlpfjrOUv9F6Ow==
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr7098311ote.126.1529937200016; 
	Mon, 25 Jun 2018 07:33:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 07:32:59
	-0700 (PDT)
In-Reply-To: <20180625140055.32223-1-joel@jms.id.au>
References: <20180625140055.32223-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 15:32:59 +0100
Message-ID: <CAFEAcA8yOj6bDE0Lb6F_jmTfk_JaCZojCHTdHD8HqLAGZkh2Qw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v2] MAINTAINERS: Add ASPEED BMCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LyPMdfnRjvOW

On 25 June 2018 at 15:00, Joel Stanley <joel@jms.id.au> wrote:
> This adds Cedric as the maintainer, with Andrew and I as reviewers, for
> the ASPEED boards and the peripherals we have developed.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> --
> v2: fix includes path

Applied to target-arm.next, thanks.

PS: that should be '---' above, to avoid the notes below
it going into the commit message.

thanks
-- PMM
