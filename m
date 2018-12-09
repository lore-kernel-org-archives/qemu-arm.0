Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2938488wrt;
        Sun, 9 Dec 2018 13:59:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UB0aTWuokahuh0oVxSYaZiCKu7/tp36iPqk0txRt5jYvK9XENepKLco3XoA4UQALWwH91x
X-Received: by 2002:aed:39e8:: with SMTP id m95mr9710571qte.317.1544392748797;
        Sun, 09 Dec 2018 13:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544392748; cv=none;
        d=google.com; s=arc-20160816;
        b=lS7uLqm/slE0tx5rRXqPkpAh1xHRK6jKvRtbYiHLV0S+irDbBtK3tOJKuoKPk9ylXY
         1YDiDpWlkb5qJtSW4MT9YWHj4lT1utS6coFHP8MnZOkHkvhqRlFXTlzVcihCM7iEXQp+
         V9yxvBdT55MO2521iKwxxEUb2UmInFhv7RImhVmuq4Scd3hoAoXlnd/NE8LTqtNjLfDf
         BwLN/uUoJGjMRDYg51gMH26bwg5LuyDvyHL+BmTfYIs410deugMvDIvjO8sgXrCRJ4/d
         RRzQuzScPTHw4T8Nb4BZ4iK5mareYsbfNAe3aZVZNXkdNaWHdlcGRPDsUWRiSx9BrimO
         oWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3/VL+D3rbcnw8ao7JCQRE/o8i6thNM6sGIf5B1zmHBM=;
        b=jJh5+ggK8TY9IdRaUf2lW8VaeaEWKkpolm22VNsDdtMm8Rz3btYa4HYToHC1CL5kKX
         pZDfJuUm4EIDxQxBsI6mGT8f3kfgHtWXQiH/4SuJqLZj0tLCcw7cJSiPQUu4NX1pSm+2
         Z+qBnKZHAgRbh3rm/Ub0DEfjYf8hV/XrEaPe3sGkVf8ifYUjdRmH/A91dg7Wh27kTAS7
         RaFRHSt+EIPdVd1ws7GSCPSnJra/PLc6s3BJvqUVfW0WF07XD18r9TY1GcCaK5f/zfQT
         HspN8aJAPWyE3GaMMx0yvGzP4oMtXHhtGNWHlLoGtOSJpB6lepoSgfwQUU15q4dzoNW4
         TgTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TGPezSlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si817151qvl.174.2018.12.09.13.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Dec 2018 13:59:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TGPezSlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gW76S-0002Hn-Au
	for alex.bennee@linaro.org; Sun, 09 Dec 2018 16:59:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gW76J-0002Ha-E6
	for qemu-arm@nongnu.org; Sun, 09 Dec 2018 16:59:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gW76I-0002Td-Nd
	for qemu-arm@nongnu.org; Sun, 09 Dec 2018 16:58:59 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gW76I-0002TA-Gt
	for qemu-arm@nongnu.org; Sun, 09 Dec 2018 16:58:58 -0500
Received: by mail-ot1-x343.google.com with SMTP id e12so8643880otl.5
	for <qemu-arm@nongnu.org>; Sun, 09 Dec 2018 13:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3/VL+D3rbcnw8ao7JCQRE/o8i6thNM6sGIf5B1zmHBM=;
	b=TGPezSlblolpmc6frtjxvQIYYvVJPCqW5TvK7iTXSqv0RQMXOYs+DCaqQ1sjidBtp+
	fX7sI3jmzEpgD/QCk5nqd1scWSv2UbXP29aU8OO/zKwG8Cs+RrBre70Nk0okfA/RnU0y
	cZGnoY0UnD+N22RSGe7dEDZdG/PstAuegDFIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3/VL+D3rbcnw8ao7JCQRE/o8i6thNM6sGIf5B1zmHBM=;
	b=p4+1fiYeNGyBHtJiFw5aeCkuo0YKWcHzE5U7slICmspEWbzuNXDJ9uiqFxcjqSwQJn
	m7aTuL8V+wSVhG0hYL1wAGt8k4EE7058HVLE3zH9c/7+WItVif4n9sdHXWFpoDVjJzAQ
	kpTctoqY0gymMH1hPsuu182pLu2eNn4pozISg89JqWgh5KuoyI5Ywo0yGaRXi21EFiJM
	zep6KrGRYRnHjwevw1z6QzxytuWshu+hyZKUPp3Sw3ZJruar5F0oRLS9hkAUNJAHZj6+
	lMU50wSo2f/MRJeHNR5YjHS54YVBBed/EhVzZbIKXYkNBGybZjWcrGKIaPT4/f5LbJD+
	BaTw==
X-Gm-Message-State: AA+aEWbxjTaVF0vPrDazsjClMKrtxyFjnXvq8EFo8Zp0XtK9IcCuGOHn
	lW6HX0b42udWHNQDENiueRpwMWvDeBXImc7WI/b6Ww==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr6858796otq.316.1544392737558; 
	Sun, 09 Dec 2018 13:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
	<20181205134243.4791-9-aaron@os.amperecomputing.com>
	<20181205153242.GE5549@quinoa.localdomain>
	<75ec3369-0f1c-0ea7-1fc5-9e2263f6f86e@linaro.org>
In-Reply-To: <75ec3369-0f1c-0ea7-1fc5-9e2263f6f86e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 9 Dec 2018 21:58:46 +0000
Message-ID: <CAFEAcA9O3BtCSDuiHFEEbX2dbWWvV-oUtmPAhbG-on14oOtfJw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v9 08/14] target/arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /jwyF9n6DRrv

On Fri, 7 Dec 2018 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/5/18 9:32 AM, Aaron Lindsay wrote:
> > On Dec 05 08:43, Aaron Lindsay wrote:
> >> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> >> +    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4) {
> >
> > After further discussion on my last version, this should be
> >
> > if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
> >       FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) != 0xf) {
> >
> > to guard against defining these registers for implementation-defined
> > PMUs.
>
> When id fields define values like 0b1111, that is a hint that the field should
> be interpreted as signed, and you should still use a >= comparison.  (See
> D12.1.4, Principles of the ID scheme for fields in ID registers.)

That section calls out these PMU ID registers as exceptions
which do not follow the scheme and specifically notes that
the "not 0xf and greater than or equal to 4" is the kind of
comparison required here...

thanks
-- PMM
