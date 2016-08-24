Received: by 10.37.206.4 with SMTP id x4csp119254ybe;
        Tue, 23 Aug 2016 21:39:22 -0700 (PDT)
X-Received: by 10.55.126.194 with SMTP id z185mr1123275qkc.140.1472013562542;
        Tue, 23 Aug 2016 21:39:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f90si5119423qtb.57.2016.08.23.21.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPyE-00027J-7t
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:39:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bcPy9-000270-Jr
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bcPy5-00015r-JK
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:39:17 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:33235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bcPy5-00015n-FI; Wed, 24 Aug 2016 00:39:13 -0400
Received: by mail-it0-f66.google.com with SMTP id d65so946605ith.0;
	Tue, 23 Aug 2016 21:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=/F5j/JUchj8gHQwTEvyLo/xLsq17lD/e3rJVfkzipX0=;
	b=yfu88ksBByoXD1CiAhBMDYwhT8msFIPlnr6kMSiA0jOHmd8moJRM8MkiLglmutnb1q
	eYr8jjvPrDP06pK1sd4aBDVfq+0C/i6exlfedN2T50lbG+JBt6zN2aE8ewGMpyQeBAp4
	jGVmuxTAFq95teAHjjhhLOMjxRelPYPOpSdCabm8KtXvef35tXDNHdNeD3C9VV3W7Msc
	FEqOJKzQalx023ZZJoG9f443uNwD1b6R2WnaSqupEqQztS3LKzekGvvD8hZlL8wt3a9h
	FeEKbSt8MtJLJRFoE0s2eRc0NMiLflR4SzsDoFOxTH1oknsn+pvn2+xE1VYHJ3Lb81xv
	f3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/F5j/JUchj8gHQwTEvyLo/xLsq17lD/e3rJVfkzipX0=;
	b=kN0XGzLlqs0fb2Cth+AgspU1ZSRms5/6nPPVobJt/XRAgYiAu2WpcS8CT1f5ytjeRt
	dKrnTtvZlhLIlWs5vxp6LmgyUTgASpI1a4X+ZRvGHfu3G0ztizU4O2mMwr0ukvYkqMMs
	DkvllyNS0bUIbAh45ILNBVoSV/FZsEqlJ9tfsDuroogf+m0o+CCQ0fWf/KOfiz4QvLf3
	TvFwY5G/3XJHeXgeMNek1D+iaKEelFhNULyHxwgriLI7rWP1SxhZmvSUd5vxz9YcMrBb
	Wq9I948ORNV/8tzKXIzEfeXqg1zV45vVLAnjksN/M3R7i8w8IO7wmbDKk68mYl7A4/rQ
	rCkg==
X-Gm-Message-State: AE9vXwPBnnaKkJsRR42NX0j/9e7RHLagTie9MnXIZNsvgwSp0r6zG/iQm5kXruU8A4cdaA==
X-Received: by 10.107.18.32 with SMTP id a32mr1875860ioj.12.1472013492682;
	Tue, 23 Aug 2016 21:38:12 -0700 (PDT)
Received: from [10.0.0.102] ([173.243.43.10])
	by smtp.googlemail.com with ESMTPSA id
	o15sm14693843ith.2.2016.08.23.21.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:38:11 -0700 (PDT)
To: qemu-devel@nongnu.org, rth@twiddle.net
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<20160824043048.109542.39014@ex-std-node742.prod.rhcloud.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <535318f1-8178-714d-7487-5aeb0661280b@redhat.com>
Date: Wed, 24 Aug 2016 06:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160824043048.109542.39014@ex-std-node742.prod.rhcloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.66
Subject: Re: [Qemu-arm] [PATCH 0/7] Improve buffer_is_zero
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27RlnF+/m511



On 24/08/2016 06:30, no-reply@patchew.org wrote:
> ERROR: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
> #44: FILE: util/cutils.c:289:
> +        __asm volatile("vmovdqu -0x80(%1),%0\n\t"

Other errors can be ignored, but please use __asm__ __volatile__ here or
just __asm__ (I don't think volatile is useful).

Also, perhaps move this function to its own file since you're rewriting
it anyway?

Thanks,

Paolo

> ERROR: externs should be avoided in .c files
> #44: FILE: util/cutils.c:289:
> +        __asm volatile("vmovdqu -0x80(%1),%0\n\t"
> 
> ERROR: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
> #72: FILE: util/cutils.c:317:
> +        __asm volatile("vmovdqu -0x40(%1),%0\n\t"
> 
> ERROR: externs should be avoided in .c files
> #72: FILE: util/cutils.c:317:
> +        __asm volatile("vmovdqu -0x40(%1),%0\n\t"
> 
> ERROR: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
> #98: FILE: util/cutils.c:343:
> +        __asm volatile("movdqu -0x40(%4),%0\n\t"
> 
> ERROR: externs should be avoided in .c files
> #98: FILE: util/cutils.c:343:
> +        __asm volatile("movdqu -0x40(%4),%0\n\t"
> 
> ERROR: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
> #132: FILE: util/cutils.c:374:
> +        __asm volatile("movdqu -0x40(%4),%0\n\t"
> 
> ERROR: externs should be avoided in .c files
> #132: FILE: util/cutils.c:374:
> +        __asm volatile("movdqu -0x40(%4),%0\n\t"
