Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1303176wrp;
        Thu, 14 Feb 2019 10:31:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZDndZAUy3ZGhFTyqZwFFsBqtIFqdrUOXX4+nqNXZGc2O3Bv6EpQwA9CDgsrsa3ozYhoMqE
X-Received: by 2002:a81:6f05:: with SMTP id k5mr4497653ywc.146.1550169074180;
        Thu, 14 Feb 2019 10:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550169074; cv=none;
        d=google.com; s=arc-20160816;
        b=esWSkiaZmjFJMcCbgEkhxQ3yZdDrv2yp4xT5IKcfGPdRFqx31Vii82yl4T18EGLWiX
         GO+HRG/Qxp2CAfqvS3VahvQ0G2y08zDdx0BorCTHigq7PGB13V6GRoWNMN4o/ZL3/tc3
         Rg8B5vv6dik06ZZ7UzSuB1GT8NpB9IKI7x8ptCHBFp4atWS5C7glZSqUNy1HNE5DAb8v
         Yw28Cg36s8KioBot1jXXs50pVDhWkeYZKCwNGAUFr2LaOQK9JgSN1C99zuyDKxw0/CRK
         YPCVrf7qP0ki3CJ4C7BZSKz1R8CP+rg7n82tnhL322NycY5X7vXh+Is/mz9pCcD5gQay
         KtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9CT2CYSlkBIncIU2dkRLndUB46anNTy+1BiAyEHWaLI=;
        b=M2/hC/ie4G2y4eE7GR2bEcCb7Yv344pCcAwfBsxY6aJZIiRyYw9+V+WHrw4wIVNsCE
         R9Qjw4NoHpjbTknJp4NdsbXkrxnvjgP30SkGPDD3QW8cf7/561kqMKcLjvT9y9jl8hhc
         RCAEyhIcwiJNpb5g34PDHxHIXRE6JlWvFsiG7nRyh3aWAO+NOzzFr8w1okNcn2fE5tS3
         mIEVMIO7E9za8+n0Z85rsrA5i3YcZkUNiI6baX037Uu8zcEJfaTIUqNHE7A4DENj/Uw8
         EeBeGHHBgt4x7gq7tseqCas4glMRAb38mLrmETWbbACgaN6LdyFyUVVq+d5zhmhor+IL
         2wCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tPaRkw5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q185si1867801ywg.16.2019.02.14.10.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 10:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tPaRkw5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guLmz-0001x8-Jf
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 13:31:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guLmm-0001vi-3s
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 13:31:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guLml-00056H-Eq
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 13:31:00 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:46693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guLmk-0004t5-Bz
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 13:30:59 -0500
Received: by mail-ot1-x32c.google.com with SMTP id w25so12108739otm.13
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 10:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9CT2CYSlkBIncIU2dkRLndUB46anNTy+1BiAyEHWaLI=;
	b=tPaRkw5wyVjevUU1Hgw1jfPBVGw55zetEFBgvvQF44jk1O6F709osYHR0C/hyKTppa
	moNwNFmPzfq245g7GqboSg6brWydLiZ7zDSEtMDdYlFgMioauzqhxWv+7/+d34fWG9tZ
	wIfqzgMqrYusdssaz31k64oNIcXe61gHmJo2JGeFrFvNpBS1d7Xt81qo37bkUMZe3u0u
	pLa1n1yHzmm+u4v4O1+WaCLsKxx3QDgkWVCwlACF5Jo83ehysVpMNhG+myWiHZnW3NZV
	Rjg/pNzYzpcNCalxioNOQxRuGJEpxOTN2ivA20olDRPmNRPsYN0Zv3GpcwmUDYPbjWVl
	isqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9CT2CYSlkBIncIU2dkRLndUB46anNTy+1BiAyEHWaLI=;
	b=ZykB5Mp1ChFyN3fap2a0k8yHpfqPRc5W9kVcnAb26L2FNKbeN04wCtHPBquHGD6dgM
	FQ9Jc09qFOU40mkmIaXAlRzGwjI4mUEJQqIoARUjIOkzqMc3u54CTISz0a8XrXy5D+XD
	rqEKAfKfbl1DXc7/PaDbialQw4NGivqlePL2IInWsH30A+EVCAYhjMkJPN/O5Uyo2BBk
	g1tMT36dszuWBGlaXhVi1KIHg+PQD3XFaCSzBpdAa3viFtT0xxwa5H33sAXbIPPqI2AF
	LjoP2X4ef2PYG83r61TjIotDw9i2mxp9xiirCe8IJk2J8iF7SH3UAma9m/3E9guD0vBD
	CVJA==
X-Gm-Message-State: AHQUAub0Za596LCy4p8cm4a46QyWI3k47trl6GupSXUvRwLXfD8Vv2GS
	Alfe6Ch0STAcSMy7IHqil6FqAUJnxunAlbZRlwgDIQ==
X-Received: by 2002:aca:30c2:: with SMTP id w185mr3235130oiw.163.1550169048547;
	Thu, 14 Feb 2019 10:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20190214140714.15738-1-imammedo@redhat.com>
In-Reply-To: <20190214140714.15738-1-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 18:30:37 +0000
Message-ID: <CAFEAcA8Jh6B+aOJMEAgQWhbuun6e5HSVRZ1+k5adO9PcgGua4g@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32c
Subject: Re: [Qemu-arm] [RFC] memory: use memory_region_init_ram() instead
 of memory_region_allocate_system_memory()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wq2qGORhVGWG

On Thu, 14 Feb 2019 at 14:07, Igor Mammedov <imammedo@redhat.com> wrote:
> Also some boards (ab)use memory_region_allocate_system_memory(), calling it several
> times to allocate various fixed sized chunks of RAM and ROMs, which is problematic
> to map to a single initial RAM Machine::memdev backend and is currently broken if
> -mem-path points to a not hugepage pool.

These boards are buggy and we could fix them, if we wanted to
keep the existing API. We should in that case add assertions
that memory_region_allocate_system_memory() is called once and
only once, which would let "make check" enforce the rule.

thanks
- PMM
