Received: by 10.25.205.13 with SMTP id d13csp10346339lfg;
        Fri, 6 Jan 2017 07:21:22 -0800 (PST)
X-Received: by 10.237.56.163 with SMTP id k32mr12227105qte.232.1483716082396;
        Fri, 06 Jan 2017 07:21:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si50294953qte.14.2017.01.06.07.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 07:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPWKV-0005vv-PO
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 10:21:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPWKN-0005tV-6l
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 10:21:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPWKL-0004It-EL
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 10:21:10 -0500
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:35564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPWKL-0004Id-4v
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 10:21:09 -0500
Received: by mail-ua0-x22f.google.com with SMTP id y9so78184304uae.2
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 07:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bfLnrMJEzm5bqUHDPvaEHQDNxDo+KSrKr20HL49TYQI=;
	b=fXuJrDZCjJp1DaI6hlp3u2+MUXHsaXdOqlGwPXA4VTlYbIebm/yVEUKAblmYmaKGO1
	6Qx0+y2A7q6ZZ3Yy5F/2WdNUj9mKNIst/+5N+G90AO/QICaZCIwpRyZOnmp9pYXV6Sg5
	UDznatvdnjjtqbbO5Qn5i1ZC9OR6idLf2Nl1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bfLnrMJEzm5bqUHDPvaEHQDNxDo+KSrKr20HL49TYQI=;
	b=Pd5E8D5Fp5f1LfPkNN5GP4TJDcWpDc8B3h7lFVBqF0zO5UrFyALSeV/ydNvt+2E5Nr
	Vu2ozkkiRga2u/g0c17U3iAw7VWpKKOL+ooONtW8ITby74novSFvFVoSg0cnC73YPSnQ
	wtAC1yxBAhC6Hk96kktVtOx9SqoPxuBw1pGkC5LT4Exp6S7OxhncxBfJ39I39Oae/lSB
	1prehAdK7PQn6QkxADI2/LtNjxRP8hk6jCXhg7t/FdUgZwmaN3b48oDB9ukB9zDV6/dN
	0xCsDUR4QDXHj+wmbDpl8p/9evfZ5iwYDpBfVaf+nT2v+XLqyxucfqLvldJ69A+iXiup
	reGQ==
X-Gm-Message-State: AIkVDXICtHk4WxWNBqnkKZoN1yFog3ZGY6aQDx0Wxf/d6Nc3Uh8Ee5P0xLdUTUyKbt3IWH+F1BtftSCZdvK2XJnB
X-Received: by 10.176.3.137 with SMTP id 9mr50280365uau.120.1483716068534;
	Fri, 06 Jan 2017 07:21:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 07:20:48 -0800 (PST)
In-Reply-To: <20170106143527.sdto622nm6hflp5b@roojbos.sk>
References: <20170106143527.sdto622nm6hflp5b@roojbos.sk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 15:20:48 +0000
Message-ID: <CAFEAcA_Cjm02WMGCDmsi+0Bv7cnYg9=ePFmBg_1RGJ8Xufr94w@mail.gmail.com>
To: Seraphime Kirkovski <kirkseraph@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [RESEND PATCH] target-arm/abi32: check
 for segfault in do_kernel_trap
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IE+/S1OR7zno

On 6 January 2017 at 14:35, Seraphime Kirkovski <kirkseraph@gmail.com> wrote:
> In terms of implementation, I find it would be better to extract the
> __kernel_cmpxchg code in a separate function. On the one hand, this
> would avoid code duplication or strange gotos and make do_kernel_trap
> more readable. On the other hand, this would clutter a bit git history.
> If it is acceptable, I will send a patch with those changes. If not,
> will try to find a cleaner solution without creating new functions.

Refactoring the code sounds like a good idea to me -- go ahead.

thanks
-- PMM
