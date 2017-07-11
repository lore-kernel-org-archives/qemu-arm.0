Received: by 10.25.44.15 with SMTP id s15csp4975698lfs;
        Tue, 11 Jul 2017 08:20:59 -0700 (PDT)
X-Received: by 10.237.62.132 with SMTP id n4mr626909qtf.0.1499786459528;
        Tue, 11 Jul 2017 08:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499786459; cv=none;
        d=google.com; s=arc-20160816;
        b=K8IY1pJ9W4dNSOCLBV1Y+elkDfTHmQYUlOn0WnBoKH/Pxstfqts8r2linvhM0wvUqJ
         F3lbSXLiLBaogYoQaiArXAJ1NB5WK/JSDsiiin4XQjwlAC/1vXOsgoDT2SgrxqsJ7mZd
         ODiOqUaj6Qw05/Zaz+WVp9B3ViFpW7qTfwqyA8EoP9jB1kWAWlkhK5P6h+i0Yf6wDO+R
         y+AKY2RtGKgQdPyHMctJuN3WxVgmvJYk4sS/SyhkTTnYqN2HIaDXDl93OwBpPqaXAx9P
         elWFMMwtOwy+lqkIJp6R4gXJxDQxlGvv1a9ogEhtgA0CqbLLxrhr56Syt0NsELT3SAmo
         5f4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XS/N8zWWgPOBt4HDSuotXU4HRnHbuISVAmRqdldE43M=;
        b=Pip0MVKt7lOFT/WtvSZYektfw20AxalstZwBdv+G6jD1rOXuXD0cZy8D/m14G9/J8Q
         5c2dCB9oToIvzxpmMbeh0LkXHMpgSx1ZPcERhXayIUvWhyRyARWzXKLFGj0sbQBqFWFE
         kGk5lFUEQqLB9i0kidmauXfcXrMlKfkWQ1BUPQeTzTYD7Dyp3p9AtTSt2D2izMMJrPsL
         WHJ76og2frkwYYj2SAYbd2umi7dYiSMtKLkIjFw8sLkY1mwdG4IdyltpSDc0sPZ955DU
         0yowL1Nnp4kF1ywlXJyYmSSL436HYrvq/MeFXkijW16sC3SJA2UreuYB58TlNbaGrK9h
         pT8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=aph2Foao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a124si197883qke.16.2017.07.11.08.20.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=aph2Foao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUwy8-0000iH-Kc
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUwwr-0008Aj-RX
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUwwr-0007Bg-2j
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:19:37 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:34031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUwwq-0007BF-Rb
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:19:37 -0400
Received: by mail-wr0-x229.google.com with SMTP id 77so3571321wrb.1
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XS/N8zWWgPOBt4HDSuotXU4HRnHbuISVAmRqdldE43M=;
	b=aph2FoaovbVgiNCH9CAaEX0FwmdMO+UTgbu2VLxC8dbk0AmNctGeNzD3U0CmgMA4GK
	WKRZRWEhC+NNt8SeNK5LQlKWxHoEVN7UAEE962FqXwmNgol4S8QcE62Iiv6sVi3PS+yd
	AYkzmGiv905GRStbLWxOly+w+OfzTtxSBymPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XS/N8zWWgPOBt4HDSuotXU4HRnHbuISVAmRqdldE43M=;
	b=CBX0hZvDYcI0UBGXPFUloMrlSMO2j32tVvm7oO2NLP0P90y6Bi95Q5o1OksOVOa+c9
	UwVgb3B47lUN/jVCGAArk7kJ5z3DM0X+k3fccycZ+XJiE9X2gZwYqu532wbx0QPf+hwd
	JEkMygaDmYXOpMC2905qLEmhZhqQjdiBJHHK7IS8lYGgzZpVE6oUjYnvAmS5AhvBLIjb
	PFn1N8Bkh5bhAg9Zy8SW3xHZPNbB0WKvMHKGrjud945PY1dElTluRCIqd6HwZ2++SG/t
	8tbu0mpRDBSGmLjbSA8A/YRr3wDnuNfYJGV5C9vA/sil4jJU1nmifS2Ti44FVunK/fx3
	lmbw==
X-Gm-Message-State: AIVw111G1797zNQoJNVvYtMT9YgzxEGHZDY1c9xkQLlNB2nzwE2k2P4R
	/AgJMM04XlPvyyDrovk1/Ts/VZEewpC/
X-Received: by 10.28.217.207 with SMTP id q198mr2801564wmg.45.1499786375411;
	Tue, 11 Jul 2017 08:19:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 08:19:14 -0700 (PDT)
In-Reply-To: <149978163979.30.9098193331451925339@5d477a5b5989>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<149978163979.30.9098193331451925339@5d477a5b5989>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 16:19:14 +0100
Message-ID: <CAFEAcA_gih-_j87j5KzEN1NuDiLUexjJi9Ks-AjnFAx9+4Z6ow@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/7] ARM: implement MPS2 board
 (with 2 FPGA flavours)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <famz@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ym1L66Usv/Xv

On 11 July 2017 at 15:00,  <no-reply@patchew.org> wrote:

> === OUTPUT BEGIN ===
> Checking PATCH 1/7: hw/arm/mps2: Implement skeleton mps2-an385 and mps2-an511 board models...
> ERROR: line over 90 characters
> #72: FILE: hw/arm/mps2.c:22:
> + *   https://developer.arm.com/products/system-design/development-boards/cortex-m-prototyping-system

Six complaints about long lines that are unbreakable URLs
(in theory we could make checkpatch ignore the longline
issue for the case of "line is in a comment and there
is no space in the line where it could be broken before
the 80 column point", but that's a lot of effort)...

> ERROR: spaces required around that '*' (ctx:WxV)
> #104: FILE: hw/misc/mps2-scc.c:51:
> +static bool scc_cfg_write(MPS2SCC *s, unsigned function,
>                                    ^

...and one straight-up false positive (this isn't operator *).

thanks
-- PMM
