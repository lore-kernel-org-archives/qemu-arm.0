Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1107033wrd;
        Fri, 31 Aug 2018 15:48:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda2XRswOB0HBXgJMJ3pf+XWb+4WLe1GgEuXYhvetJqprx0svTxCHit08V6+1O4iLgYYdQtA
X-Received: by 2002:a37:ad03:: with SMTP id f3-v6mr9320322qkm.140.1535755728249;
        Fri, 31 Aug 2018 15:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535755728; cv=none;
        d=google.com; s=arc-20160816;
        b=IseAMK4kNT3c7WnzbecSG1IjFchUD44PeyLd9Y9+xz/Pzzl3RpeEjOEE1YuE05WQNN
         CVPfrpFn8DmC1X3z8ustmi28kvxgT1MkGHVg5LKAj2EK1iLNf4JnygwLLdVJwxx2tKe+
         O5y5lQCj+YOg4jnrR5NhMI4MLtgK13dJRm9/f4+WQ++IDtQTYU2B2cEaTDvywyoO+kfd
         pKQrMQtvU7b7+FSbd1a6dLDFPM/B8ctVdsr3Ipf8RGAEs3PGTqFd6R14lIES7HkzVh1o
         elNvaGvz1xOKdbe51HVxF5zvtAcLd4guD9T+kGSnjPWdXgaEeY9cjksfucovn/xU7P/9
         R2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:arc-authentication-results;
        bh=JjcBgnhTVSKYHqT96YJwXeR3ZX7LvcjalmmThqYI564=;
        b=q5pnyk2/hNR8CEEw6pBPhQhJYO7xZMLlMo3N+ZEHOwNdKw0wGtkVfTAl6/ApxAiQ2v
         +oKGOltCarLvk+7uMhAidyBiFNPa8Qs4N/BLCxuvesLbFj2uNg4MlxAt+WKDtAQHg5L5
         0SDZ/+GUjh54DVMRbzcLN28BfR/0E8hnfI4aMqxipUk64ySTuuLmfSXXqGoHziDMjPGV
         BmNlVgLosq6FEfPGGErpeDOPTK+0P/1z1SUARpMz2LAMMq8jwgjR+JtIsUaGOrUDl48X
         2t0SMBHU8pXWoWhozU78+SipI4PbebloxZLUSHbikJAn0tjSNZuQt+ZEJ3hUK3Zn+6/e
         U+vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=gZnSXMUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24-v6si3292447qtm.92.2018.08.31.15.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 15:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=gZnSXMUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvsDd-0001VX-OP
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 18:48:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvs0q-0002Ew-S1
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrie-0002Co-Kv
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:16:45 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:41753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fvrid-0002Bi-II; Fri, 31 Aug 2018 18:16:43 -0400
Received: by mail-qk1-x741.google.com with SMTP id h138-v6so2397927qke.8;
	Fri, 31 Aug 2018 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JjcBgnhTVSKYHqT96YJwXeR3ZX7LvcjalmmThqYI564=;
	b=gZnSXMUxjpM/pA9QObgLdkrPSPmtdeKykX2YhXLk9ptlAEvqSdCb/k9QqYogTkinA9
	SvXlOLX9hmKGZTRx43CTrEUbQbH/1JM5eLqMnwqNMTzLKqXf6on9d79BKpczhEhJhSVm
	e4y0Hz9+EbPif3Q4iNpHI/Y0KlGl/3Wxtz47M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JjcBgnhTVSKYHqT96YJwXeR3ZX7LvcjalmmThqYI564=;
	b=hQTReg7nRKBFrhrxjaq7qJLmJ9X1hzc7d8uwsHQ+YIYp9w1VkFwSln5AzXDfl6uhJo
	HN1uDjxMp/J/7FsAf4NMOOCCcnWm3RdCQ6+OY/JHvgHVnDMYNSJ6Otgbf4sHH/u35rWz
	jciykvL4grvO5BB/WHdRKVi+583syFZJTSsyG/pRaplGpsTR9TDfLilnDon97yapc7oM
	3IhwWdyrxSuGviBPD/lPEBpMTVt9GohIq07fPF4/FXdt5+2a2pnqPaNm5F5aukMlE4LY
	f477vBIbuxOOkzFHv1zxBt0iIXrfh2RC74Qu6/ULs4GEw7Jji9BPT2V5Hnb+wJYbnojR
	RH+w==
X-Gm-Message-State: APzg51Ad/cEU/MJp8T66DhtKZe2+pgcdI2xhS39hC/2sHYwXev1KKobj
	TPWnrhIUatcjY3MRZvUYUHs6fA/tcRfB3A0J1X4=
X-Received: by 2002:a37:9bc9:: with SMTP id
	d192-v6mr17546913qke.127.1535753802997; 
	Fri, 31 Aug 2018 15:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180831103816.13479-1-clg@kaod.org>
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Aug 2018 15:16:31 -0700
Message-ID: <CACPK8Xdgq4ToH7yOh-v=bqLb6uhqTKeEt9DXOrXx8SaA6UV57A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-arm] [PATCH 00/11] aspeed: misc fixes and enhancements
 (SMC)
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
	alistair@alistair23.me, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5xbbvM4Omblf

On Fri, 31 Aug 2018 at 03:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> This series adds a couple of cleanups and two main features to the
> Aspeed machines :
>
>  - a 'mmio-exec' property to boot directly from a memory region alias
>    of the FMC flash module using MMIO execution. This is not activated
>    by default because boot time needs to be improved on recent
>    firmwares.
>
>  - support for DMA to access the flash modules. Our primary need is
>    the checksum calculation which is used to evaluate the best clock
>    settings for reads.

I gave this series a number of tests and it looked good.

 Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
