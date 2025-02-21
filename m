Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp65449njc;
        Thu, 20 Feb 2025 20:57:48 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVzDmvBju3PwP3QST8xj4e7wZ2c1J87pg4VYadM6WrZx2Pz4zpzjH35EGI2JYFvU0AxWxmEVLIbk8wJOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGIuS2F13pCFD91vDsyZLM1oKmLHmjKKyupV7F8v8Z4RpHTSPRFU7DtXvPBms1WHOIUuxL8
X-Received: by 2002:a05:6402:4409:b0:5e0:815d:4e08 with SMTP id 4fb4d7f45d1cf-5e0b70bbf50mr1343274a12.3.1740113868181;
        Thu, 20 Feb 2025 20:57:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740113868; cv=pass;
        d=google.com; s=arc-20240605;
        b=k7HiMwDSwJXcilCKJjorwd3bPryqH8ToSKTwk+G7nqxPnJLKSTR+YG2zx0tCv/AKei
         UM/wM4rFsTaF+u+vddhYR7EkbAZ8wo8asQLDsk2qECIlKAoVvV6xy0D3AHCj1lzpk7Pj
         ZNDm5dFdolAa5qFj7Kd536MRDG/B7ib8ksTaaLsZUkzaQEx2/Fw2Zugz/rl88Zk9gcG1
         9XQncc+KHO1isMbXXAWHdQWIN1VDWiS/oP6mu9+gzuqMdGv4lf/+G3l7Cg0y4HwNvOwy
         AYBLZYcNIc1BUqrCPyLhLemERiAn1PYz6F7kJrwe2HnEEFEJsIlavZ6L0ANiUvgC8L4N
         LqsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jsPKNzt3eZWqtai7MwBuxoJW/WIB/0M4MoDpUoICLEw=;
        fh=uhmEix4oYMwP+v5jhTmFhIMm8k0Vqjz8TQAVpGvM8Ns=;
        b=f5BNdl6paw5Q4VSJHj9+GhOAQ8FGi1AvEdoAqV/nImkp/3ezSK/lT3Ap/+bw/lbS0l
         n+Bid3Jm2lKQ8YOmEZp57/UtsZRUYi7GgrRCR1HtqbRHtUlZfGnHtXonM3Ykxcvy275e
         DFInTdSuVEA9OJNLGjKyFNWj/PjxVnNBaaWuttmUPqm/yjZTaClEebqJr6B7K32PhSHx
         srWM7n1Vmv3l8H/T/+fIV9XDA0nZ43ss8I/rWiG+QEhpe7/rp/H0ivNPHCz52kw4gJqo
         YLWgLp4TYrEieRjCk5ORq06m0NddKbW9SKqg+Kf7x23/ayWA9uPbeQZK86QbIUuCJcF0
         PjQQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Y40I6oRu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525179-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525179-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525179-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5dece262446si13378268a12.488.2025.02.20.20.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 20:57:48 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525179-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Y40I6oRu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525179-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525179-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09A1D19C0420
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 04:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7D91FBE8C;
	Fri, 21 Feb 2025 04:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y40I6oRu"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C30AF9D9
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740113855; cv=none; b=hhAPVmrmzxwxDOnHEeZTlsaebO/L7R9q8920X7eIYW86qotstWWAnAnb7LlJCXN5hNjhNVBjxRQ6qjhe2h1zrbWW4cT0GhfJDTfMKtAl07/Psqrl3aYkXSfvv0bxTSV1CP+MJMZCx80OAkD2xebsu/XaYywtiKWjbSpYukhr4zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740113855; c=relaxed/simple;
	bh=a0SRT1xcLYPZMLZVfUK4U1sanv0c+3i36Oq5Gopf9mE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXj9fwC0i4naATtqVBtBJnt3Cv2eCSyqV94uKU8rc0MvkH4BOZ1p8hIf092JWl93kzAwwx53rFIChzQVuDCbi6qtREEB2i3DGsehvxl2eclob9826LAz2RgdLaKM1QuClod6DmW9IeE+ETJaEGh4K6/BLRYxQLmIWU8yuVj2KWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y40I6oRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FE7C4CEE4;
	Fri, 21 Feb 2025 04:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740113854;
	bh=a0SRT1xcLYPZMLZVfUK4U1sanv0c+3i36Oq5Gopf9mE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y40I6oRuqHoTRQj41+lBW9ZWJrZUON7emuyU3tsiMVJHONZNYs//mAE7+Q3thPSL8
	 7lJOEXrTCFNGzZ3JtwqyVknSRteDG0kgOEhiD3/DZS004c+27Of+I6ygTFfsIso6R3
	 FN5aEW8uQKHNCwcUbk08cY/oHo1iPO4Q4KxPeddSJTTx9FdSTCzrjrdW69rHj2nhVp
	 P/QDG5lk79eFvcOTLMg/qntEHFaF7AhmWXdg7M0Gvfky7uGilqipeJc2ueL+ry6T+f
	 nC7AzyTvS4Wu0ljvq3ymt9E1jkOiFwcLc+WZNXdPqM2d0AKuz/QplarYcMmLp7yE5c
	 1kuWZvOzHb95g==
Date: Fri, 21 Feb 2025 05:57:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju
 Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/14] scripts/ghes_inject: add a script to generate
 GHES error inject
Message-ID: <20250221055728.03289b6c@foz.lan>
In-Reply-To: <87bjvg6c22.fsf@pond.sub.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<80858743b6fd67db3f48ac8cb466bbcde5b11132.1738345063.git.mchehab+huawei@kernel.org>
	<87bjvg6c22.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 2KOmq6AYPFO6

Em Wed, 05 Feb 2025 09:16:53 +0100
Markus Armbruster <armbru@redhat.com> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Using the QMP GHESv2 API requires preparing a raw data array
> > containing a CPER record.
> >
> > Add a helper script with subcommands to prepare such data.
> >
> > Currently, only ARM Processor error CPER record is supported, by
> > using:
> > 	$ ghes_inject.py arm
> >
> > which produces those warnings on Linux:
> >
> > [  705.032426] [Firmware Warn]: GHES: Unhandled processor error type 0x02: cache error
> > [  774.866308] {4}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
> > [  774.866583] {4}[Hardware Error]: event severity: recoverable
> > [  774.866738] {4}[Hardware Error]:  Error 0, type: recoverable
> > [  774.866889] {4}[Hardware Error]:   section_type: ARM processor error
> > [  774.867048] {4}[Hardware Error]:   MIDR: 0x00000000000f0510
> > [  774.867189] {4}[Hardware Error]:   running state: 0x0
> > [  774.867321] {4}[Hardware Error]:   Power State Coordination Interface state: 0
> > [  774.867511] {4}[Hardware Error]:   Error info structure 0:
> > [  774.867679] {4}[Hardware Error]:   num errors: 2
> > [  774.867801] {4}[Hardware Error]:    error_type: 0x02: cache error
> > [  774.867962] {4}[Hardware Error]:    error_info: 0x000000000091000f
> > [  774.868124] {4}[Hardware Error]:     transaction type: Data Access
> > [  774.868280] {4}[Hardware Error]:     cache error, operation type: Data write
> > [  774.868465] {4}[Hardware Error]:     cache level: 2
> > [  774.868592] {4}[Hardware Error]:     processor context not corrupted
> > [  774.868774] [Firmware Warn]: GHES: Unhandled processor error type 0x02: cache error
> >
> > Such script allows customizing the error data, allowing to change
> > all fields at the record. Please use:
> >
> > 	$ ghes_inject.py arm -h
> >
> > For more details about its usage.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> [...]
> 
> > diff --git a/scripts/arm_processor_error.py b/scripts/arm_processor_error.py
> > new file mode 100644
> > index 000000000000..b0e8450e667e
> > --- /dev/null
> > +++ b/scripts/arm_processor_error.py
> > @@ -0,0 +1,476 @@
> > +#!/usr/bin/env python3
> > +#
> > +# pylint: disable=C0301,C0114,R0903,R0912,R0913,R0914,R0915,W0511
> > +# SPDX-License-Identifier: GPL-2.0  
> 
> Sorry if this has been answered already...  why not GPL-2.0-or-later?
> 
> More of the same below.

No particular reason. It is just that GPL-2.0 is my preferred license.

I'll change the license of the three scripts to be GPL-2.0-or-later.

> 
> [...]
> 



Thanks,
Mauro
