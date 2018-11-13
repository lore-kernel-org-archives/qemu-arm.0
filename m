Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4618293wrw;
        Tue, 13 Nov 2018 09:10:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5dJybGTysNyGtAlgkWTMIE9/Xl/NyGIrGZurL9PXglzq+t55BnaK9b1mPERfzs1g8WYWO5D
X-Received: by 2002:a37:8541:: with SMTP id h62mr5522094qkd.213.1542129008691;
        Tue, 13 Nov 2018 09:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129008; cv=none;
        d=google.com; s=arc-20160816;
        b=AENEy5x86OG8kLzvN6Gv1+0Ynxt0lS/bb0A0rY4KnRBeg0WV7j0sQAkXXSvTE7qQ+N
         LYsOPAN7l00GLr7e5c52f70GThLJt+MHg1cjb6/8+PHIgzb4BPh3+enf7ZzhmMiw2rcj
         7Ha2PcdongJ8HYezwHO86jx/YwDP4LPZ2shWfjDQ34HK4RmgOl/tjhkyKPD11vFwAxNP
         Ex1sq96ungldcqXEyX7DL0+86cRka77VHtOv6xMHkOJqokUw7DkOBh6Fe8XL4dudWGlw
         w/W93iVBYmHU4QUBwih9SxtNC3cazeV6sORsvre8sno8Y7lgjUK35YDUv6MRr3ZQjUTx
         HfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=iKa68JpuUKsbx/m/GdG74lzvTWA4XMJSXLAeTSd97hg=;
        b=B0KERd4WMNbKpcLmwxHpOCVmw0K3dPAQNkYlRMm+luFEuijb4z+oobhyDT9Y7oUSQ2
         odSnNx5QK7Mqaq9Uwc9tpMh7VmXKTks4nQ8ZiDbnxqJb7avoTqogPL26VJIQWJVTFX/m
         p90ISixtb3KGzolDxWfbD45k7QCiaIlOalIYiHNWwqEAzOZWqTGVc+fcg+YweTF9Tbm0
         F0D6X9J4+Qt672XSokr/V9CW8XFf+Q3/9ufL/hYMnde+yicbmDd2ZB42GipkM53RSQD3
         /dtG8W/oib61Q60qxoMO5uJ2k/AV8YarbsslmH2xn+/N9Jro8rJ924Emuibd8cqBcEj7
         WwGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W88pfunS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m93si10722908qtd.270.2018.11.13.09.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:10:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W88pfunS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcCW-00020P-29
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:10:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMc9m-0006P5-76
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:07:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMc1m-0000BY-9s
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:59:03 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMc1l-0000Ad-Tn
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:59:02 -0500
Received: by mail-oi1-x244.google.com with SMTP id g188-v6so10918958oif.8
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 08:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iKa68JpuUKsbx/m/GdG74lzvTWA4XMJSXLAeTSd97hg=;
	b=W88pfunSXeJDS4FaXw5lqMb5mV0pNAuFCSeODrPF0fgkF50WChHqfDoUok4WLUIMSi
	AHRG90lUO14JotChU3i8KAc47CiMBQXTFMAQ/x6dPMm6QOOdbXr4X3BvRbSa6Zlr92zM
	idm3GzIBvmmfGADFdb8JLOtYb57lHozYv7G5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iKa68JpuUKsbx/m/GdG74lzvTWA4XMJSXLAeTSd97hg=;
	b=sdglPK/AZOXikDfIJQedvqkT49wdjsA8bWz3b8AXPKjhBZpF41LiG03OhsmIslvtAy
	WAFUuiwJ+IJJp0Fw2b8PulevywPTvM+4qXYeI6c5HydslSy2m07xjm+xGLXMmpysa1M6
	j5mooE5FCMAeKedyGbOmNmwMsISzCWtHIG2eW7Czf1Kc57zhr/FZQK7YSEQxNYwlHgKj
	uSKlBYqzzN5KYpnrVHIC8pZ0CTGMRWZRsFMYvvy+9af6B6bs2F+CqIxrblrxb4YLsJPN
	Ou9TbR6YoMrnkG9E/WLsDAqC5r03rzC3Ioq1eyFCntrrfwEC+7k0vzswJHWbcm4BZc7a
	zLMQ==
X-Gm-Message-State: AGRZ1gK7mkkQ9PEGqifro+srsv/SIm7a5cj5CBH+enUC0nhmkcB11aHo
	rM0gLWCZdYX+OnxjiXOP9sh+WYlRtdp6sz0VZFuzkg==
X-Received: by 2002:aca:5ac5:: with SMTP id
	o188-v6mr3222614oib.146.1542128340837; 
	Tue, 13 Nov 2018 08:59:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 13 Nov 2018 08:58:40
	-0800 (PST)
In-Reply-To: <20181113165247.4806-2-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-2-sameo@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Nov 2018 16:58:40 +0000
Message-ID: <CAFEAcA-npVS1Q0=or=p-kjP0Nf4h1n+qUL7y8+yYCdtuHa7Fxg@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 01/13] target: arm: Add copyright boilerplate
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zuBFVk/zIDSn

On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  target/arm/helper.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0da1424f72..3d4e9c5c8a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1,3 +1,10 @@
> +/*
> + * ARM generic helpers.
> + *
> + * This code is licensed under the GNU GPL v2.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */

The human readable text says "v2", but the SPDX tag says
"v2 or later". Which is right? (The top level LICENSE file says
source files with no specific license are 2-or-later).

thanks
-- PMM
