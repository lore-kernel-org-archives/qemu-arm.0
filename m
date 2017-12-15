Received: by 10.223.159.74 with SMTP id f10csp744168wrg;
        Fri, 15 Dec 2017 10:25:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBotCq4oBlOTXkVWL2WpzqQQ5lOGiYfSk7KSCEo5x8X0lMQg/XGGPBZrO74DtxEBvkgAv6Cp3
X-Received: by 10.129.236.20 with SMTP id j20mr7754183ywm.301.1513362324370;
        Fri, 15 Dec 2017 10:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513362324; cv=none;
        d=google.com; s=arc-20160816;
        b=XEjh9FdZzJ7eKgk4XesJRrREOPgEm6WCNMgHclg3W8B0mZMViAT0rWlJgrq/+J/EeK
         09x2Zl2sEUCvwc90sAozL/E32zON3Vwmypv5WBvYtVwK5ZOJnLphH3skqa7QYohQ/hSL
         D9D4HY4FWrZkqgqjL52xMdwEVCxmTWQ/vo3YM3/njgyg6jQbNj09TX31DL26LW86KBCK
         MOnpMi2kXHmx9y9uFnikvAp0KF6nrP8zY/PqxUzGFdpEeEfSQm8h0zEDrKHT4R7ZHoKh
         Goxio7rb3wtjgaKx9cOOvunMQcX3H0p8luXQXLOzln5En/xQMMe4zOQwbNUDKeL9bOCG
         WJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VTtXcsO//EGPd/DOLjFB9ahoJ1iaChE6FShCj2X53EU=;
        b=NO1KDvwGAL1DB1w9Hu5RfOTNxxdNu8/uKnbvxMHR471qk9khfpQ2j5J4jbT0UZoKLA
         6AYy0pzbS0/v8sUs2b/F5MbBQ5Y4NJm+CQAmZV/zdWCHgVzjX2UPt55VNc15xkW7cez4
         L2A/R75pBxdznLgT8NhtUmhWjBBfVyRkR4as5NFXU/+p92rvkQgXlei8EyZAyDKifsvi
         TPba4ghFFIIIsTuBwgms6nSvIwUo2bMy2aX2/LLLMQbyEd1FZPf5kdNR75R8iN2qlkAl
         MKS5KVuJgMyMyNWFDAJ5jHsYUQCJIjBf8t0XI9IfDfB9M1/TwFmYcc1ywq/0seEOyq8U
         bH1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFQ2Q+YB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c190si1399872ybh.532.2017.12.15.10.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 10:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFQ2Q+YB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePufj-0005iv-RM
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 13:25:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePufb-0005hQ-N9
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 13:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePufa-0004sn-P1
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 13:25:15 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:34254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ePufa-0004rx-Ia
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 13:25:14 -0500
Received: by mail-ot0-x235.google.com with SMTP id o23so8548733otd.1
	for <qemu-arm@nongnu.org>; Fri, 15 Dec 2017 10:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VTtXcsO//EGPd/DOLjFB9ahoJ1iaChE6FShCj2X53EU=;
	b=YFQ2Q+YBgaizRnIvK4gdI9n7nMfFfU7A5agf7Vq2AMCbz5btrrR7QngfzNz+OV+/io
	3L4DJX98U1PtrvBxIFx72/TsSv+NVMkHv/AkJly9G3boz0nC1kYN/77c1ZW4XwbC4XPK
	LflMDKIeIL2L1BRtXJKhsR/IaIp8pUcspxFGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VTtXcsO//EGPd/DOLjFB9ahoJ1iaChE6FShCj2X53EU=;
	b=Xslijll9O6xbcEWWEqKPQndvIaK7q/pQgDPSQT5fY0eyJN5dpaFfYAO1C+ulFHkPtV
	GGdxwnqxogwwoATqAxbVjRGCFk1QRurFCAtxQFEyAZPZi9KlRURz0bjFEDsp9um0ZQMn
	DbDKN0D88Mn4a3hfwkNgvfqu8zutBUbpzarCUYl/Ml/1ayfZOVJCp8R2/ZgJqMmHdc+Q
	n3Qbvrz+0O5/UbUZV3CXhieQ+4dl/bhYmN2eER6hv3gj7xAFlApspQRWtG0H3nCNYKFi
	vVSEFcciUCr9BcaADxO6jySftEgLS42EUUp2RGFnlhJ8ouS2XpdWN8o8Ox4KnQjs1L1f
	UACQ==
X-Gm-Message-State: AKGB3mIpeOVFB3jbOoYkIzXCn0ZdL6Fc3kxFn49h6B7CMPkdIF0uFtrR
	K0huHAcassPEOlRJhDAgygj6zn9mmixNmk/On6KYW12v
X-Received: by 10.157.49.54 with SMTP id e51mr8121594otc.24.1513362313601;
	Fri, 15 Dec 2017 10:25:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 15 Dec 2017 10:24:53 -0800 (PST)
In-Reply-To: <1513355076-5075-1-git-send-email-peter.maydell@linaro.org>
References: <1513355076-5075-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Dec 2017 18:24:53 +0000
Message-ID: <CAFEAcA-0AxnDEnr6YcRGPMkNE5smgU3Rt+V5_jex9Z_vkFuWPA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH] target/arm: Handle page table walk load
 failures correctly
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /bjLsn7i4p45

On 15 December 2017 at 16:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> Instead of ignoring the response from address_space_ld*()
> (indicating an attempt to read a page table descriptor from
> an invalid physical address), use it to report the failure
> correctly.
>
> Since this is another couple of locations where we need to
> decide the value of the ARMMMUFaultInfo ea bit based on a
> MemTxResult, we factor out that operation into a helper
> function.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Now we've fixed the get-phys-addr functions to always report
> errors via the ARMMMUFaultInfo struct, it's pretty easy to
> detect and report external aborts on translation table walks.

Reading through the Arm ARM for an unrelated reason, I discovered
that this patch is necessary but not sufficient, because
external aborts on translation table walks for ATS instructions
are supposed to be reported as Data Aborts (unlike other
kinds of translation fault) -- see DDI0487B.a section D4.2.11.
So this patch is OK (reporting the abort in the PAR is no
worse than ignoring it completely and using a zero descriptor
value) but we should add another one after it that makes
do_ats_write() special-case fi->type == ARMFault_SyncExternal
and generate an exception.

I won't get to that until next year, though. (Need to
look up the various architecture versions to check whether
they all behave the same here.)

thanks
-- PMM
