Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2339474wrt;
        Thu, 24 Jan 2019 12:09:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN73giIM+MdHIr8JNQ6yR7R1O1EYnw5G+ardpDIshd2Lr1czhEsYiqmd1xZIHwYLl6wgq1hc
X-Received: by 2002:adf:9083:: with SMTP id i3mr8475862wri.124.1548360547217;
        Thu, 24 Jan 2019 12:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548360547; cv=none;
        d=google.com; s=arc-20160816;
        b=lWnWAKpVWOe2ldLc0KOKcM5Y6AZxz8SWJApWpivpLovvyNW3woZyUIwM5TI+y8S2Ih
         ZJPdcRTULzcaitBuewxdpWKnRsjkvpEiU7OAks2PmHQ7ey2quCOTIt7TK4zBwASG5Kvo
         Slq0sSyc8rE8X9ogC1JRSeDKWQ8N/IJAk01UBFen5XJ14xe1n5RqvPVZrCeVSqLkMsf/
         IeC666KBaTpnhwE2SX8GOpdOnlARQcCBs8Az0Smt+U3tMMR40UllfsXl5v0Oz+lbmxRU
         c2bmiwEx5n1vbAaXW21qqfwDjs8Z03lxVWgxVHWWgDtsCyNPpEFnVKvz/2wPtHlzATE7
         5HKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=8ib0DCpJ9LLM8wZ+z7ZAwV04p9XBfpNfr76lcdCbSjQ=;
        b=pmond90R4RqxurGYwUVvL/KvfmBSTw6zQhf/z2eBDH9Zk5olvRIMlcnp1X8p4bBzQh
         ZjxDAbdvRHelz5Ys+PQVLiqvTFiuOOToYxmJU/ITSJI6WyvThGYbOSCeijvzrDi4ssdL
         EwkXXD+KKyGQ1r8RAeQTyMLOQI+UYVIwTa5kKkaNVdvj4LJESyFm9OC8Ry23AVCQaibB
         4YbGR0PxRl4/A19qgeTArq9j/1+BL28VK6vJw1s0eruhtDKq//DII68+jJX4pzHVjP76
         8HGcjU3GbFvYBS7oci+I4j9B7q8kzQ5jHEKGFvrADbaC5o755vBZG2nXEs04efMmxeJR
         74FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="EK0q//pp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si45519567wrp.81.2019.01.24.12.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 12:09:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="EK0q//pp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:60287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmlJC-0004OG-AZ
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 15:09:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlIz-0004Ki-9G
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 15:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlIy-0007Ho-KC
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 15:08:53 -0500
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:40542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1gmlIw-0007Fg-OI; Thu, 24 Jan 2019 15:08:50 -0500
Received: by mail-qt1-x842.google.com with SMTP id k12so8163022qtf.7;
	Thu, 24 Jan 2019 12:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8ib0DCpJ9LLM8wZ+z7ZAwV04p9XBfpNfr76lcdCbSjQ=;
	b=EK0q//pp8RKIwZMbPSZawZksiFvp0nsZxj8D2gadoBDjoeRzl+p36eytrhDl7O0eH/
	u/v+EsrNA+a5GtPgYZDhHeVc3KekP/sBcSY3HeKANKcKefkn6NqndFY84gN9KGqEjnz1
	T4a90IjsXdrYq9AjdK8mzgw+wMm8aCJKtMCo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8ib0DCpJ9LLM8wZ+z7ZAwV04p9XBfpNfr76lcdCbSjQ=;
	b=t2k5j/wCxFhMxKYZbYpl6krkqYD0IOSh7neaW2NGKtsh5DodPbZ9qUIkxAn0p+6Y3m
	eoDo/rpxNTSdDI/jsB+d8IloFLgVHT68gciopb6yGNo2Zs8ulYhuFtS+RISzAh5jLxKS
	La4ifR7Z7As3/RqFkdZ9CrVWiNuWuvdu5P2i5NTL6S14Sh4iQ2DFynF9IBbq1nnbFNjV
	UvuBl1PxYIYQ0LhUrGYcUbxm72NqRzY0OwQf0qjEcGxe6Pwh39TyiaBaf6XpYtJ+Nkq2
	8kMw2HKLILQUr0rrzb29jxxybHhupv6BjNB6q1+u2mGIJWtGfMvBcfdgvzoWMHQklHl7
	q7DA==
X-Gm-Message-State: AJcUukeoJYVjHlBahbxCD7Hiu4pl2u/bWhoxFZeZyV11M/fXBObhHwl/
	tcEHhWWshKoplNhB3nDNQBGrifhdYWyMVk8pdjw=
X-Received: by 2002:a0c:89b4:: with SMTP id 49mr7502543qvr.85.1548360529599;
	Thu, 24 Jan 2019 12:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20190124140519.13838-1-clg@kaod.org>
	<20190124140519.13838-3-clg@kaod.org>
In-Reply-To: <20190124140519.13838-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Jan 2019 07:08:37 +1100
Message-ID: <CACPK8Xf26pXnP2uosEKAovjNuO7pqNz76j1GCtedsjR1cheKsg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-arm] [PATCH 2/4] aspeed/smc: define registers for all
 possible CS
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qcGIeAzeNGAi

On Fri, 25 Jan 2019 at 01:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The model should expose one control register per possible CS. When
> testing the validity of the register number in the read operation,
> replace 's->num_cs' by 'ctrl->max_slaves' which represents the maximum
> number of flash devices a controller can handle.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
