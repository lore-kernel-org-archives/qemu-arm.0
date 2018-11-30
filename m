Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3716181wrt;
        Fri, 30 Nov 2018 07:38:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W0fd3Tn/Z94QPmex0z2jUc6HuEYmUell9h7o3PHn6rFPS77FFFljtuxMWKb9ZqkqOch+Pi
X-Received: by 2002:a25:ade0:: with SMTP id d32-v6mr1750216ybe.513.1543592329255;
        Fri, 30 Nov 2018 07:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543592329; cv=none;
        d=google.com; s=arc-20160816;
        b=hZ5IM2PELWUPmKnPxsvmM4C1ivNOR8/Pt/HjBkJCLw4FGDQAqry9V8IWuKdg4tRIbz
         ZtTPfjIxGj5f4l41y0TVkBY+F5XbufGiQPxpEEP+RC2VtrorKAV4HIRPJpA7fyAuOFD5
         8tJ02QQMh1x2VJM4xZwWWMJpsSm+bj27Sxgoph51tqZ4uMO1pN5XtufkA9ctUPrRNCDe
         Fda0f3Or6VKLvjtOlvGzqtDnUgO2M3qjDazBmuEO8CQ+bsOBYNaTUP267El7LKK+MUw+
         /Lyis8VCjZzv5lTgKU2wp/n+i4vITisworuF6j/4+Tw1juQwDuDIgd5ja5zDIFzxc36q
         cs3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=exbH5/eUROKiQs8hFqPM/Np8DGNhtBhogB+P3TMTAl0=;
        b=KKl0GcpBVA5s3X1i2XIbIZaZB9FWItd9Q8mE01XopbEyvbTE1H1inrpSkphLhSpMbw
         nLd16nNk431VkW1xOdmBsWk9qNRx2EpVVsVlRlBxGYNM1lcgbQfarYd0oyLI+iV2pctC
         4I7Y6fzfZvynXHzrKeawGJsAkPt4aMaB0973DnrkIhIpKpFBhNPCd1Jh4kDfh2evoceB
         BR8V0cevghNSU7+kfW/RkP2IlJ2YS20k6yjEvu4w2wcvcoBX0kMH2wKEx/EYXVogLmAy
         8nV1HYlKYa3fKKKa/y0L4wvOew+CTiNcZ/+7k5mxl43+UoNVYlt9czjIvTuvAQxi84f8
         DxvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DyFbey5n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d128-v6si3111440ybb.73.2018.11.30.07.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:38:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DyFbey5n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSksS-0002h3-Ae
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:38:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSkoZ-0007j7-6Y
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:34:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSkoX-0003Ov-VD
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:34:47 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSkoX-0003Fb-K2
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:34:45 -0500
Received: by mail-ot1-x342.google.com with SMTP id f18so5413058otl.11
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 07:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=exbH5/eUROKiQs8hFqPM/Np8DGNhtBhogB+P3TMTAl0=;
	b=DyFbey5n+YKpeEWUId8uHIaWZG8QZ6CWDUVKSe0qYnb3BXdLTZpY9Ag27Jbct+wXJG
	d/eKCDs2DuoDk411kTAcxmvhKexeNvBu6vdkylJq0hsX9/Lvb8Q88q1BT23VLFik5UnN
	zZ49ddlGRhidQafecYRrd+cYQ8+bB8XoK+cYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=exbH5/eUROKiQs8hFqPM/Np8DGNhtBhogB+P3TMTAl0=;
	b=VY/41xDSUfT20qhFsGOapP/f/eYVuoM/ESO8OM4g87BALxMMuBMLA784hd3HdCEphG
	77Klh/V4tTwJ3RXF1tcwq/QgeknS2CcSozTWyt+CIl2krt6cKKTTEeMEiy4ecN/olrcl
	vOE0YzJM9VncBEkXaAeI1QPGgrKpHfZsmr/i59RkGr58atEmq51nJpa29eWMX0LTzhrI
	olnceOY6oMg0dOuobheJC1QI+0mcp00PU9NKy1ykDR6VTybWjO6jgMTBMnTwFa3+ukNB
	L4+JFcyNPhPNzzhNrmmEUOwm2GF1Sh0tnb0ELWMRJlD0Pt9YyUc1/TEDl6yU5GXMt/lY
	Vg4g==
X-Gm-Message-State: AA+aEWZ2ECA+Ia8Uip+3deXz+xIOQvO5/eO349yWOIULGVEgkbO/Wgre
	hVpiJfBoB2d+297wNIkp8JAd4NHCdhiQRS0KKluolQ==
X-Received: by 2002:a9d:3d44:: with SMTP id a62mr3513617otc.363.1543592083476; 
	Fri, 30 Nov 2018 07:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
	<20181127202422.32745-1-ricardo.perez_blanco@nokia.com>
In-Reply-To: <20181127202422.32745-1-ricardo.perez_blanco@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:34:32 +0000
Message-ID: <CAFEAcA9hyWEYZWX7OJ=tGDBt7DRMP=kngHcuvT63GOYPm_MbgQ@mail.gmail.com>
To: ricardo.perez_blanco@nokia.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2] Allow AArch64 processors to boot from a
 kernel placed over 4GB.
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
Cc: =?UTF-8?Q?Ricardo_P=C3=A9rez?= <ricardoperezblanco@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E1lxu4qNl7tS

On Tue, 27 Nov 2018 at 20:25, Perez Blanco, Ricardo (Nokia -
BE/Antwerp) <ricardo.perez_blanco@nokia.com> wrote:
>
> Some machine based on AArch64 can have its main memory over 4GBs. With
> the current path, these machines can support "-kernel" in qemu.
>
> Note that, currently, none of the QEMU machines have their main memory over
> 4GBs.
>
> Signed-off-by: Ricardo Perez Blanco <ricardo.perez_blanco@nokia.com>
> ---

Thanks for the respin; I've added it to target-arm.next for the
4.0 release. (I rephrased the commit message a bit and fixed up
the overlong lines.)

-- PMM
