Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp104962wrq;
        Thu, 7 Feb 2019 09:42:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYglOuFKqSEUWqnI3y5rmgqXAQCgP8NLoW5meTtiRXgau/YQXOeuV4iN/D9+sPFmj5KJii+
X-Received: by 2002:a5b:388:: with SMTP id k8mr13959734ybp.122.1549561321281;
        Thu, 07 Feb 2019 09:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549561321; cv=none;
        d=google.com; s=arc-20160816;
        b=KjhRgkg7mzpiXWdoJ4zDGcIP8sA2FAd6XGfCQmO754VcUS36Bmyk5YWDkLKsOTfWfU
         m3PckttVqV6rOXw4kGle6iZjD30/wq8pk3Xrgrrn7sjHtWe5+tv2U/zHI7QCADOGR68B
         7y41m4y0F7EX0teZxVRSdBReffXo5mumMsEpLC78DhtgPRfebgDLkqHPKXxNkJacOuAk
         NQ6b+UMLlLy/gTCcqrOKADCBTc/jTVoxWa2tky1++FPi/MvR+AHJEQ9kGs+Kz8+ZyEz0
         EP2YExXmm6TMcQ9+tt14k92hM3dwiKi3ugSby7RRZOuifYteENkCGHuOJ5N3Xnhh28Zy
         A5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jY/73xJRkSD72m4AhqnJ7KhX0wyqbT/uiYjVEfWFV7Q=;
        b=DQG2SxCZnKz8wv3Pt9qhjPzgPuIybk85hEa8P0WsCs0W/zicH1bYwLh2vmxhdEMVCb
         nlYtj66mfdD3D/yWQMVcumvsYbvGy7M24y5tebPXBVIzAFM4Kps/IWqrzd0vwtik4KDq
         2Qx4pNHewhtZB9mPBnmXwjnB4tz3fuEzc0I5jAs4G11Xda+4f1aiYkLZ9EW657oj4G+5
         sirqYMnYpYXZQ6WNJcThwWBfAMkLeS5ulE6ujtY42MkKcYj0vmttNx/ZSE+b1mMnfm8D
         vTKAABOmd29nSm2ayEm1Okeg9+KVuBFcyRyYLajkAlZkL14lwgpMKLirStMeZu4+UtDo
         bqJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I20eCPbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si2272848ybb.486.2019.02.07.09.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:42:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I20eCPbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grngW-000223-PZ
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:42:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grngN-000201-Dp
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grngM-0003DW-Jv
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:41:51 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grngM-00034N-EY
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:41:50 -0500
Received: by mail-ot1-x341.google.com with SMTP id e24so1141227otp.11
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jY/73xJRkSD72m4AhqnJ7KhX0wyqbT/uiYjVEfWFV7Q=;
	b=I20eCPbf4d17r1aiOOcBDLp2IO7/m3LLuKMZ1TsqF6wwK7mPxKohgbT+NY7QDBk1KE
	ew9C66zYqROZhYiucm8+pLw9nZ1GTS17+GoIepgwD6nmrsJmSSd22Xnb58hyNuwcMU72
	5/Rq/z6V5uaFnJ06xchzxDsF+QFoMKrpudAKKN5tv301wBGU5PZjU977zjWYXXqeKGKV
	pMuB8Z5PrmuRvB+lrWEURwoUQ/0aJI1TqzZV/rqdgFOaV16xhlZCdRjmlhAWccM15dGE
	9+/HTergMnUVBeFNmtJryJzcROege0OYDqEic+tl3+Psh1lmo364tc+Io5kpd0AGwO0M
	cu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jY/73xJRkSD72m4AhqnJ7KhX0wyqbT/uiYjVEfWFV7Q=;
	b=Y6KAPemAWr3PLkEARAQ1z+853LW0QMAUEOPP04/jHW4UWdXWqRVAs+BumVx6KpOSzV
	LaS5hcYN6yKaptfq3OLn9yNxsD/maVw8yfX+5TLIdCJIWujqTSfEsr1fbB3FHRqM601v
	Fo2ONyoZJmqP5pMNkiEbPFTrUT5MclkS7Mp4jDbeHOUAU+P/UgvgoYfYLxH37GK0x89t
	m4lIL4gPkBOj01hvOMEn4oUZJRAguBep7TLbd00h9AoYyM5KmyaGoZd91vE8doFZjTa8
	RSUllvzuCxgzbNkIhwNhRO5y82eDCpSx6O8HrrH3e+OoCW6ueyYOk8dB8zxRHLfPLWns
	i+HQ==
X-Gm-Message-State: AHQUAuZDSQK/yKwBAWT9+aLVqx0t77fxQFnjahq8MI9q1SnhsHADi7v0
	6CeBqOTGSbEhIgmjQUo3tFknj+UA18F97HqI4pQR2Q==
X-Received: by 2002:aca:915:: with SMTP id 21mr949750oij.163.1549561285786;
	Thu, 07 Feb 2019 09:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-11-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:41:14 +0000
Message-ID: <CAFEAcA-mZ01Za4SA92ZABGsfHJ+C=zZgLbDYMMxVoTWqUEaiQQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 10/17] target/arm: Implement LDG, STG,
 ST2G instructions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: puiKnjpq0Feq

On Mon, 14 Jan 2019 at 01:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |   3 ++
>  target/arm/mte_helper.c    |  53 +++++++++++++++++++
>  target/arm/translate-a64.c | 106 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 162 insertions(+)
>

I'm going to skip review of this one, since it will need
updating for the STG/LDG spec change.

thanks
-- PMM
