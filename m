Received: by 10.28.91.67 with SMTP id p64csp2067684wmb;
        Thu, 1 Mar 2018 09:06:41 -0800 (PST)
X-Google-Smtp-Source: AG47ELt2gO0yBMpXCJ0k8ZKU/c9be5KSdp65Ywq4Xpuc4DFdUv06e0CdaDRyVRPh+D8MTkQO57+I
X-Received: by 10.13.230.10 with SMTP id p10mr1729436ywe.20.1519924001638;
        Thu, 01 Mar 2018 09:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519924001; cv=none;
        d=google.com; s=arc-20160816;
        b=arR97HXE4jg8uUe/7yiwyqyY62ylEaJfbRxff7ciJHcCQRjAt0o7PVYYVmwRWnUtv8
         9WOfzrMhFokUkPwF20uQf/CJXe3D/4oc1SkMNq79KAxJzgCJi8M2hu/I+UilXytjgg11
         meUcsADRauR35y7QwhHuWpP4sHzfIZhKM+rjYl/PeMZKZ0UAGP4j6T5sFY6cBV0wM3P/
         SCrv1dttjnAZmFnDyfe1BUhFW92bUBk6CLPuFrh+t/mIHbCGI4TzOhZcLrRnrOM7JM/V
         e9PGFMWgq1Y8+D5Rcf9lhs6+PuHQvpgD6Cl0TOk7ttvpjhrh3OeC0SypyT4rEeONqEZJ
         TS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tWWWw1q+fGJFElrw3cF4fvarsq0vmdux+C6ZV+0eGxk=;
        b=OKRXn+s2C9SPU+P1QU1FSdLUM9t6URuoe2I82ZJHIvNSdbcmboKwQt5aIdKXjZpIOk
         7KnGrYEBL+fieylV+N5p3IknyRwdXgyYeGFtgjf+qD/c4pMsUBQ1pm9f8m/ex1JiqDK3
         e7o7ACcab3aCJHYZAeJT6vglRLtBABxsw5y62cqDuj3+OeHbb7D3j8AtnzN5xDDxZSTY
         TaZe84Ed1P7FBOyLt3PifU40Z+nE438ZgyHXaAMpuyt0GrvxpzXBhXPCHIFUChiPD14e
         2pNVD2dIKFfVb+Sjf3YWIH/RMUrQWJlQjkOP15JSs44o0M5vIRRh8vHUoI0sZjpoKpgN
         41WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cCvDjYFZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16-v6si717104ybd.610.2018.03.01.09.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 09:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cCvDjYFZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erRfC-0006K3-Mj
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 12:06:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erRMM-0007Bh-37
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:47:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erRML-0001wh-Cp
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:47:10 -0500
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:45188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erRML-0001w5-0a
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:47:09 -0500
Received: by mail-oi0-x235.google.com with SMTP id j79so4936456oib.12
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 08:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tWWWw1q+fGJFElrw3cF4fvarsq0vmdux+C6ZV+0eGxk=;
	b=cCvDjYFZ1JC2kyUdhtGptBz9ZN6KarXbfpeL4Z0++zLBSkl/aA3q6y98sPu2oUmQXn
	0AuTL9II0rnqABi8lqDHNvQUtEFW5Ld8ax0LLZ0JqlCx29b0EnkRwqa0N7etXsnsXOY0
	+d9KhC+VtAT84tfqvemrIn4sFtB1+uWl4BNMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tWWWw1q+fGJFElrw3cF4fvarsq0vmdux+C6ZV+0eGxk=;
	b=qGwlKQ2StAZJuE7e4Ui5HbP1oOcuVytsYGB77gj22k1LneOsMfIbfBtIaTEGhq04Cr
	G/HUMBhN+qBW4REWqUJaLD5qN4Fz/sqlMl3EywdD2eRpRJkyJj7RhrHCtUFAy9htca+r
	pH2SETfAKYFvuWQWy3LyYIm3oU22eOUA843oh30o9dDFccvc9lDawK9rslfx92yHIHXI
	YS6kURipHvAFJlE0d4yyFuneQk/uDgz1uwDPusdDC0gDqe++/Rbs0iZZ9ptTy8o//hHy
	qHVYMx/fo+DqqH0XPefb/qJ+DwVTIU0wiYGIa3Hi6TmYNFTveZ3rG1SWj2Z5J0819yZM
	0nwg==
X-Gm-Message-State: AElRT7FPY4LJ4uNVvl6W807Nq2MtuQsSyOAqAJGFuwydc8B8j10lXZrq
	RMF0FEdDoB/9wkGNixmU6JVDTwtTlvox5ZfOrpaLNg==
X-Received: by 10.202.17.13 with SMTP id 13mr1567936oir.164.1519922828314;
	Thu, 01 Mar 2018 08:47:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 08:46:47 -0800 (PST)
In-Reply-To: <1519815685-29200-4-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1519815685-29200-4-git-send-email-abdallah.bouassida@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 16:46:47 +0000
Message-ID: <CAFEAcA8B6TeDUCSmPxG4YJ_1pZSHVf5KA7tOgsO+Jqnme0bnWQ@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-devel] [PATCH v3 3/4] target/arm: Add the XML dynamic
 generation
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kGXKlC36crBO

On 28 February 2018 at 11:01, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> Generate an XML description for the cp-regs.
> Register these regs with the gdb_register_coprocessor().
> Add arm_gdb_get_sysreg() to use it as a callback to read those regs.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---

> +void arm_register_gdb_regs_for_features(CPUState *cs)
> +{
> +    int n;
> +
> +    n = arm_gen_dynamic_xml(cs);
> +    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, NULL,
> +                             n, "system-registers.xml", 0);
> +
> +}

Have you tried writing to a sysreg from the debugger without
your patch 4 applied? I suspect you'll find it crashes because
of the NULL pointer you're passing here, and you'll need a
dummy write function.

thanks
-- PMM
