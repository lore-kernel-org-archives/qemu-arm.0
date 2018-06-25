Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3713263wrq;
        Mon, 25 Jun 2018 04:52:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIChSep+Fpe6XlcU7reBTzAR4ZFT7oSSffSc07VwqteOdN+RKa66xEsODYQOp6abe9Slt3F
X-Received: by 2002:aed:3ec9:: with SMTP id o9-v6mr9965558qtf.242.1529927578940;
        Mon, 25 Jun 2018 04:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529927578; cv=none;
        d=google.com; s=arc-20160816;
        b=wGmc+JzDsEw1lGPmPJu2Op2pzoVNVXRdzPxv3YVaH8fnMrp9SeDOnYfDXWMPoW7znu
         5r9j/cQZKN/qfaTuCU5Ij2rLAm2G/JTW/FKJU68TmG+YYt+pzZ96DmGhGL1FJkISsv6R
         zbhHLZfPo3JqmHpDcvreuRxsecKYLGNJopCf6VMGDrRaEM0u6sASiC8MFGymiOHlG3iR
         mLrz8kLEIXxl4q8aHOjYkbNN9LbVuRbHIELY84ga4eT0hh9bFbF2StsqOlfH8ttolUU4
         f6mBtSDTqVAo1PHS5yAE/wXFgTPMr6PNiM+7Z6w0ZN31emjAyn6rDyBm45Aa1lcVH30a
         e4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=9RQHKiiywEBcgNBw3n64HhQrr9+VQUGjdVdSD0Wul/4=;
        b=M5pF7pLRTeywLDB3R3ApuuwvIaDzElqIclZL1LRzYFgTzLMQqvJXicaTv8Dz7TP/i8
         BMkxULdpwq93PF5Yb+GtevuzS0IQ+WcW7koRqLp71fLTv+/umUhwYoWX09ykEQKab9DL
         KSe0dOk6CQeuaWjhA6BQfFN/G9bQLz8Up299PI8FhIv9/PcNjGq/xGLvo+YdbnT3lUxf
         bbNaLP5+z59g3vJiLfH4OGRnJxngIC3IlNqRZD4dJgMiH7bMHabZ3PO13O/sVpzSh/KR
         9jzN6JqCXTB3NXR2JtAvk7uAMn93Y0IawnxV41vVq5Mf3VU+tbcfHzDmF/ihEbZqPEOD
         htJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UgJjGOPc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i71-v6si341788qka.242.2018.06.25.04.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 04:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UgJjGOPc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXQ3G-0006hb-GY
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 07:52:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXQ1Y-00061I-4M
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXQ1X-0000Kt-Ak
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:51:12 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:44305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXQ1X-0000Jl-5f
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:51:11 -0400
Received: by mail-oi0-x242.google.com with SMTP id b5-v6so3051716oiy.11
	for <qemu-devel@nongnu.org>; Mon, 25 Jun 2018 04:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9RQHKiiywEBcgNBw3n64HhQrr9+VQUGjdVdSD0Wul/4=;
	b=UgJjGOPcZBgon6qLf7Moh9pk5qq0ZLGFBk09Pu8mum5xYLzFMc8Rv4zAjzONZaxVat
	ezCSv1ieCShOKZHczBFynY3lllsRW1zJ4JA2jLX2/zgYqu/EzxoXROLmSn/lz+tOGhUK
	1t9EZsgl7qSAhO13h9PxgFg1ny0pnl46DjBqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9RQHKiiywEBcgNBw3n64HhQrr9+VQUGjdVdSD0Wul/4=;
	b=nazmkYXjXTS+QWrurG2zP2gK1sPkklVdTVex4e0RBVElGipuTtKWlzISzhiV/CW6Zv
	Mhiz4eJM88lTVTW0fm9bSmT5sag/h6ovu7EKpiudKjZazGTjFfsDz3z8ocN2dg+2+Evg
	tM4kZNtDg6b+6PuHqVz6NrOCWOx3QLG9ZotrnC0yh0alYc+LKIwyhMgqHlL2VOU+bBxB
	+O1viKsT2IZ3QSkWYrmEDLl+bgnO3+KylMhMfxsP9/z3hsUtdf/jO1D7vKhQLW21xql+
	slGqaa5aMj8KdtWfCiaLULPfOiyAsh3aFYSpRDkuDDtmSVM4g0xwQijkr16cxI3ZD38v
	zmuQ==
X-Gm-Message-State: APt69E15AvnXiJpMhrLsV9hNvgvnp89h5Zm+d3258t8LDmCDfJvru+om
	cnJoaelVH9+wkQ+4WCx7tPUyenWGfVlEDv5LtqSfLA==
X-Received: by 2002:aca:743:: with SMTP id 64-v6mr6275627oih.164.1529927470501;
	Mon, 25 Jun 2018 04:51:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 04:50:50
	-0700 (PDT)
In-Reply-To: <20180619093124.24011-7-luc.michel@greensocs.com>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<20180619093124.24011-7-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 12:50:50 +0100
Message-ID: <CAFEAcA-fRaddayn+RQyd-Hix4gmuhrvA8s90pRrhvE=0a3hStg@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v2 6/7] intc/arm_gic: Improve traces
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aFaO9+3dr2N3

On 19 June 2018 at 10:31,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
>
> Add some traces to the ARM GIC to catch register accesses (distributor,
> (v)cpu interface and virtual interface), and to take into account
> virtualization extensions (print `vcpu` instead of `cpu` when needed).
>
> Also add some virtualization extensions specific traces: LR updating
> and maintenance IRQ generation.
>
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
