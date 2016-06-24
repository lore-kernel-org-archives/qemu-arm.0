Received: by 10.25.21.96 with SMTP id l93csp1119083lfi;
        Fri, 24 Jun 2016 09:01:36 -0700 (PDT)
X-Received: by 10.55.45.134 with SMTP id t128mr5767165qkh.197.1466784095906;
        Fri, 24 Jun 2016 09:01:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t40si5391347qtc.2.2016.06.24.09.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 09:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTXz-00063z-8k
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 12:01:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1bGTVD-0002kF-37
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1bGTVC-0006FH-7n
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:58:43 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1bGTVC-0006Eh-3O; Fri, 24 Jun 2016 11:58:42 -0400
Received: by mail-oi0-x241.google.com with SMTP id x6so19019508oif.3;
	Fri, 24 Jun 2016 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wZ4GqkFHyveD6BcQI99e203oYhW6HipRwdaElhMXGTA=;
	b=F2rk0W6UHiQfbf7uHxGn2HhHPIScQqFnGQg9aPdHHXBkhQUW8VKhSzTFtpxHVRxvW4
	JtY3DmPdipxky6BpSqQ2Ni2lfr4u4YJcn9wj/WMZaRsKLCCbisX50ldKSQf4LsMGadxo
	VaLb4A25xvius4Mtj46VioV/0SHNdVV20lZi0P710oiaJsCp9ge9rvP9jNck8sXM+/l9
	2tKe1pcxM/vtz+5e16pdDuMu6IrPwY5Tooyr7BZ28kTl787U5pcYGH+ZcmmfRprzac6B
	R6YAnQxqbORASL8wTrBMOAdi4J+lfZrgkHgL2JWMNd06JDE+8sGqjbTQAENqe0RqH3f6
	vyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wZ4GqkFHyveD6BcQI99e203oYhW6HipRwdaElhMXGTA=;
	b=K6+IyPmxNeylT5pBOSttRonzjX0qBQZ9IT/I404Ue2BDtFLGvQ+oTorZ3NkBFfg/hb
	BYY8wvFBKYdUHQiv/PjVwKwHoRhSSi7uo/wg3mOLugzo8SYvSwUMrHLt7WvsYw2dE5XS
	1U9YsWuCBE2uHmDN+bFdIkdFvGbFsO+3/hEAwjLVJVPaMNQ9sQ5qLrYxkmuqhuvt3iT3
	l1V5E6/5m9iXjBVf6DGxI63wb1j8jNa1i41d1R88nGodoV62mWizvB61Lk2Uc4F13sIH
	IbznN/07x1fJ7/wRknbiz4dAvRHA50ep9EEH/gZufheZ6GIz37I3fd/kTHK8ogPWlqv2
	CWRQ==
X-Gm-Message-State: ALyK8tL2Tu+1CegUo0pMUoqDcAg6AbShQAqKxomidl6eCO4vljKwiKVxeDNCkiZUxPw81U5c976qE3VM4REAqQ==
X-Received: by 10.202.214.21 with SMTP id n21mr3320570oig.70.1466783921146;
	Fri, 24 Jun 2016 08:58:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.161 with HTTP; Fri, 24 Jun 2016 08:58:40 -0700 (PDT)
In-Reply-To: <1466783381-29506-2-git-send-email-peter.maydell@linaro.org>
References: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
	<1466783381-29506-2-git-send-email-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Fri, 24 Jun 2016 17:58:40 +0200
Message-ID: <CABoDooNswMhhfQbgan=xEntiQqy-JExn6TSnVBe=5exkrhs48Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 1/2] linux-user: Make semihosting heap/stack
 fields abi_ulongs
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
Cc: Tsung-Han Lin <tsunghan.tw@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SNna1tpToM+s

On Fri, Jun 24, 2016 at 5:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The fields in the TaskState heap_base, heap_limit and stack_base
> are all guest addresses (representing the locations of the heap
> and stack for the guest binary), so they should be abi_ulong
> rather than uint32_t. (This only in practice affects ARM AArch64
> since all the other semihosting implementations are 32-bit.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  linux-user/qemu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 56f29c3..1b3b03b 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -111,10 +111,10 @@ typedef struct TaskState {
>  #endif
>  #if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_UNICORE32)
>      /* Extra fields for semihosted binaries.  */
> -    uint32_t heap_base;
> -    uint32_t heap_limit;
> +    abi_ulong heap_base;
> +    abi_ulong heap_limit;
>  #endif
> -    uint32_t stack_base;
> +    abi_ulong stack_base;
>      int used; /* non zero if used */
>      struct image_info *info;
>      struct linux_binprm *bprm;
> --
> 1.9.1
>
