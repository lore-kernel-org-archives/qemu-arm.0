Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2773786lfq;
        Mon, 11 Jan 2021 07:34:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1WeXeXLw0JXnkCrQLYDOtyJD4Ao0Kaa1FU+afSxyPUrzorBWwd5bzhz9vldawj///bNQd
X-Received: by 2002:a25:6405:: with SMTP id y5mr467351ybb.328.1610379263433;
        Mon, 11 Jan 2021 07:34:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610379263; cv=none;
        d=google.com; s=arc-20160816;
        b=p5cJf1FiVrZhKorCFAHz4Sj1/erEwkJmYOt7GU+w8Tf3GYMFNPXRSkmclL6fV23ZRn
         SerZkIeERCC7yiSKgisKOfNBHWZvxnYY1OG6YMW2lCUhjpMZt1qG0qR6B9nH/RpXNFU+
         gYjtCFdefhFEQZpU8XS2gnLLADuwekSN8ZvDDda2ejyGCv5TG+DU6CkrmDgYcADHbnXP
         +7U3j/z+juPCHG0QpV0FWHGMUfa0YtC+p34oxMTHcAME45kU3/HScdZqvipt76D2DXMb
         /F4VI66s4gcMiIBxf1NauS4ttFYmnaqbUQ+w8+1i38Pu+6r/ttuHfRAfFhfWROThe8EN
         dBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=lM+jdFO86j9foXQsJJLV0yH/AxIpWuravSnIwRVQSIM=;
        b=UEBr6KIJCtNF0qL4Wk+7V/g1SbMgAv8ftn3izlg7s1yM6kvJL6+1rWZgEtEbo1y5id
         AtxBlOh7YAT1KdYVHDY0d0HKDXnpqdNHkF0whXrUP7AJfamCeseTOGffDfbcCPmzHmi0
         poAfUBCGNVSJxSBmLZuQftr6hTMVBrEwuL91ym7rzvcD1VDG8oO4+fUyWLUgMHilpcsj
         00ouevG/pt3Lzi8v6cLK/lsjdlYXDKghnMGyOPBnvsKsLSV6kIVm6x9ri7sI8W5d1sU3
         VZs0hqdd0q8wfF8kA/Kz67ejC5ghWosYE+EueuFNVWZlPbNZ+nL7b0nLaAUcYCXEb8xf
         h00w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fjZTBvvO;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id 85si116391ybc.447.2021.01.11.07.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:34:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fjZTBvvO;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610379262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lM+jdFO86j9foXQsJJLV0yH/AxIpWuravSnIwRVQSIM=;
	b=fjZTBvvOPuAeqW5ACxRXhh9Y29gSFhI9faXacAUELe19w0geJO4YQkVe/oyQ+Ox9Jqnz9d
	4tkw+MZsaC8u3/Y1lbt6IkSzECc3WdNIocdPfSApiwBeeokx8t6wNjzJCiU9OjtUHRFMZN
	jQhEaibb1xCXDTIxCdIJTxu3VuGJ40M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-kRPwsnNEPZWQmk-MpOlCgA-1; Mon, 11 Jan 2021 10:34:20 -0500
X-MC-Unique: kRPwsnNEPZWQmk-MpOlCgA-1
Received: by mail-ed1-f72.google.com with SMTP id g6so8395762edw.13
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2021 07:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lM+jdFO86j9foXQsJJLV0yH/AxIpWuravSnIwRVQSIM=;
        b=U781EiNtHhEfYdlBxUTavP3hX/5xA0gQRdA27GKnEhjnHQNm1upf6XFfUbMnAuk4Eo
         Q7JIZtC9fbQZc+RsHAisCjHvTCCR3u2JJQIkkheTj9XI5oYhX2ebxJ7HbXd5e2pnN8/Q
         L5WIHd0PQ0CCuvQJ1+o0VzUGy8W8VDOEDbfqbqwe+El6O9qa17mUOGOrgSvWtm9dt2P8
         +FPpAcnLuhcldebsW9DGZcWEEfjr5VeXf85uP6gwVSL6sAUwmY2VZqkBeHuMNfpSIsai
         uuiwhowbrL105UV2drIWhxo1gSvCKKBR+VnmxLsBUY+gW/QCTjFpxkfeJ1Yc9Unizwnn
         QmKg==
X-Gm-Message-State: AOAM530CasD0nREyrBAAIXSwYJZzY6zGt2sYIgunIsbfGtL/jWvJpwrh
	GP+oQIkHRJC0I163K0kK/rbeAGdP81NlKKBb5P9yNaBmAr9G5TwvHQ/3bOqWjkzAjDRMj0KEU4D
	LNu56zPECUdVrHNCs
X-Received: by 2002:a05:6402:a5b:: with SMTP id bt27mr14731977edb.222.1610379258749;
        Mon, 11 Jan 2021 07:34:18 -0800 (PST)
X-Received: by 2002:a05:6402:a5b:: with SMTP id bt27mr14731958edb.222.1610379258539;
        Mon, 11 Jan 2021 07:34:18 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net. [88.21.205.129])
        by smtp.gmail.com with ESMTPSA id d4sm99773edq.36.2021.01.11.07.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:34:17 -0800 (PST)
Subject: Re: [PATCH v1 13/20] semihosting: Change common-semi API to be
 architecture-independent
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Keith Packard <keithp@keithp.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3e3340c7-7eac-9385-1fb4-707be4a1f598@redhat.com>
Date: Mon, 11 Jan 2021 16:34:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-14-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: dq5OO++/3KVl

On 1/8/21 11:42 PM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> The public API is now defined in
> hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
> instead of CPUARMState *. All internal functions have been renamed
> common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
> there are no functional changes in this patch.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20210107170717.2098982-3-keithp@keithp.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/semihosting/common-semi.h  | 36 +++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h              |  8 --------
>  hw/semihosting/common-semi.c  | 16 ++++++++++------
>  linux-user/aarch64/cpu_loop.c |  3 ++-
>  linux-user/arm/cpu_loop.c     |  3 ++-
>  target/arm/helper.c           |  5 +++--
>  target/arm/m_helper.c         |  7 ++++++-
>  7 files changed, 59 insertions(+), 19 deletions(-)
>  create mode 100644 hw/semihosting/common-semi.h
> 
> diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
> new file mode 100644
> index 0000000000..bc53e92c79
> --- /dev/null
> +++ b/hw/semihosting/common-semi.h
> @@ -0,0 +1,36 @@
> +/*
> + *  Semihosting support for systems modeled on the Arm "Angel"
> + *  semihosting syscalls design.
> + *
> + *  Copyright (c) 2005, 2007 CodeSourcery.
> + *  Copyright (c) 2019 Linaro
> + *  Written by Paul Brook.
> + *
> + *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
> + *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + *  ARM Semihosting is documented in:
> + *     Semihosting for AArch32 and AArch64 Release 2.0
> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf
> + *
> + */
> +
> +#ifndef COMMON_SEMI_H
> +#define COMMON_SEMI_H
> +
> +target_ulong do_common_semihosting(CPUState *cs);

Can we name this do_arm_compat_semihosting(CPUState *cs)?
