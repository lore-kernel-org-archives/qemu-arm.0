Received: by 10.223.197.9 with SMTP id q9csp6892172wrf;
        Thu, 19 Oct 2017 07:48:20 -0700 (PDT)
X-Received: by 10.200.3.205 with SMTP id z13mr2581253qtg.25.1508424500052;
        Thu, 19 Oct 2017 07:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508424500; cv=none;
        d=google.com; s=arc-20160816;
        b=XCFEnGRY7Ha0hXsvX3lVsS/XhmJp2uRMJM09tgpTVI3TrUHsmrXJQsETSHmDlg7Qx4
         w8mrs0P78NwTDoAZ1nVdYGpONGLdZaMl7OXbwWUpa4GitOTAEsxrqyJUJGHyw9U73H1y
         eDNTqkeeYYAv1pOr/PgkvjYlYcPNBLdXfLrrZ4DUg/t/eNioy/ZdaD1UCY/o8PmOBpd8
         hYp9R2/N2q5hGIe8ljmbt3Gvq34CZnU6UDGvEVzFt37Aabp0x76Bx+v5npvA+P8DX+Y3
         +Ga9k7sn3iMqlVh24bRTf54p9uBpeULrtQS89oKGp2CNs8r3iqzOagY2xtvyKD0ooZZM
         bJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uS3L1FfnzE8k9v9ELpIdsb2ktBQfv9baDEfJmemnf+E=;
        b=XfKSG3tucJZJGm7OQQWDKm81rmeaQACkAg9zTPb+ZjMLZYKoWQhsSxatMWRaMkRjUy
         FY4yNuvk9YrsjIML8S6b+Hr3QAnGrR6iXnm2PayADdDekHGUIf3iA1q4vC4hSJce94KR
         PetLzTBkE0DyG1IpjqCeCct+fmlCkpG+RWfPDZE8Y8k+irYMhndAdIHtRMIdDV2BYikX
         /E24KKKfXRq1NWQpNINdtD/lpSwZ26OCdYHAPuzj8WlQgyYi2nrhvwzKJK0Jbc3J8lf5
         BcmLX1Ir/dEXel5LMY15OhW/7H/Mo6CkzP79+JCvr7INLksqYTymwKM9dXZfu3Y1TSKA
         TDLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WKjifwG+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l22si7121992qtk.180.2017.10.19.07.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 07:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WKjifwG+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5C7N-0004Jc-RI
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 10:48:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5C5u-0003Sf-G7
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 10:46:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5C5t-0001UP-JP
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 10:46:46 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:53959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5C5t-0001Tw-C5
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 10:46:45 -0400
Received: by mail-wm0-x243.google.com with SMTP id q132so16902782wmd.2
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uS3L1FfnzE8k9v9ELpIdsb2ktBQfv9baDEfJmemnf+E=;
	b=WKjifwG+dSaTKms8rzDcujj1jb5z1dW4pziJ5ezFfepV3JHf6lSSQBlHzvMPYb8uDH
	ZY8R7v0WDbJKscHZXafdtysF0IcaSaxnRqlPEV54ljWcu0kCUUn5mL63/nm08YYtNFSY
	Alva5/q4g2InNUy6NlttTgsYNXfEF61GG5Yyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uS3L1FfnzE8k9v9ELpIdsb2ktBQfv9baDEfJmemnf+E=;
	b=PEmW4KnCgdWvM6VWc1Yv//GYlJe4hbAhD5q4qumwBkE79lyd0misoP4yUhwzIYmH4J
	Cw2FXmkgQtWm/f1k/H47q1D9OVONkLN30JaWIuKvPlxNygy725MGBFK64F7D1smzmIMD
	nhNcjSd3qzBLxnSG/Noj+K1r3KU4zTcs8vZW8rNzBrdpHIqFHkAUChSG9kLHnnOGx0KS
	GZfotmp+7yZatzVtYiEQ2pME6PvdoDCMWOTmfrf7Ufx17cWSgI8WetzYuLEPOOMDboag
	drbNltSp1P1gKDVear0BM7sI9HYju8WBgt4/80KHmoKClmMoiWen6q0rw5Zq8JOn67XH
	scIw==
X-Gm-Message-State: AMCzsaUvM0L6SDeFg9EhGs3ok0YfM7BWjnk/BlgPHjOflP8PjW/uGIqo
	LCQvPRjbuhUd9oq4zJXvmH2nsB3Nnw6Fx42OSopfGQ==
X-Google-Smtp-Source: ABhQp+QqSV6s9yQ/IRKBvTBOEuMYEXH5l5S/e7+jaND0+P/kSVf1WVJtP97pJLx21C+08OqrD3kTGC2BhwocaoKGJV4=
X-Received: by 10.28.145.197 with SMTP id t188mr1831956wmd.136.1508424404269; 
	Thu, 19 Oct 2017 07:46:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 07:46:23 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 15:46:23 +0100
Message-ID: <CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [PATCH] aarch64: advertise the GIC system register
 interface
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
Cc: julien.grall@arm.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9tvZf9v3H5lB

On 18 October 2017 at 01:10, Stefano Stabellini <sstabellini@kernel.org> wrote:
> Advertise the presence of the GIC system register interface (1<<24)
> according to H9.248 of the ARM ARM.
>
> This patch allows Xen to boot on QEMU aarch64.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 670c07a..a451763 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -136,7 +136,7 @@ static void aarch64_a57_initfn(Object *obj)
>      cpu->id_isar3 = 0x01112131;
>      cpu->id_isar4 = 0x00011142;
>      cpu->id_isar5 = 0x00011121;
> -    cpu->id_aa64pfr0 = 0x00002222;
> +    cpu->id_aa64pfr0 = 0x01002222;
>      cpu->id_aa64dfr0 = 0x10305106;
>      cpu->pmceid0 = 0x00000000;
>      cpu->pmceid1 = 0x00000000;
> @@ -196,7 +196,7 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->id_isar3 = 0x01112131;
>      cpu->id_isar4 = 0x00011142;
>      cpu->id_isar5 = 0x00011121;
> -    cpu->id_aa64pfr0 = 0x00002222;
> +    cpu->id_aa64pfr0 = 0x01002222;
>      cpu->id_aa64dfr0 = 0x10305106;
>      cpu->id_aa64isar0 = 0x00011120;
>      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */

Whoops -- we missed this when we added the GICv3 support, because
Linux doesn't check it.

Applied to target-arm.next, thanks.

-- PMM
