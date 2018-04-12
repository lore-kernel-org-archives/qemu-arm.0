Received: by 10.28.71.155 with SMTP id m27csp2221845wmi;
        Thu, 12 Apr 2018 11:30:05 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49pvr5smCF45mzyfqrxhUWyfuGF7HbVlWmMdjyZbWxTZPKvWr2j0a4J9YV2qemISWWnqj2g
X-Received: by 2002:a25:254f:: with SMTP id l76-v6mr1160192ybl.384.1523557804927;
        Thu, 12 Apr 2018 11:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523557804; cv=none;
        d=google.com; s=arc-20160816;
        b=MDMB0xOC4VV4QtLVaSOqfk1A3p/s/zxcFnRyuoHRC/4Z+35CGksRczBkixUj1/qDSd
         6j6qWw0xl1a2mlt50ld9qO8o9WqlT/7hiZaX+9qdqXZXMJ5I4Vn/+h1CjOCfkB6QXuq/
         XO+MaqrSK08idr6j6hLVSaIbY7KUqBRIJYGC25Cdi9vj04tLDzrc1duXBJcn/eX1fM3n
         LLd94fVZjg8Ur0qhmNV5+obL5u/pBbZiVtXxR0P9l14+J7dSGc+9RUpkB/o1rHiOGOYu
         dpljwG9wzmBr3U7vWKNmwaplIURiRGRNsNQXwGYCuuxK70c5MRxq661MKTzRV4bVv7Fm
         vtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mc1ixBgKLbXkdKL+5mzkrpqPlikSqvDW7/NhjqukyY0=;
        b=hKTgezj4wgAmrTcS5KVczbZqJ1VQjUDhs6EEqBmkrY4CpMdTVz2Uv+GdHXHdx1Mtl3
         6L3qmDzcYX93F06V6kNBStGUaThyqNhuGpn5b5Tj5aOwvupD/HIUsOK/ZKaRqT4H+NUh
         9f1kVyDUDvicqJRY3k+599hlEDYr+7iR6yKXwMqN+/+vdQ6l79h//kWqYTEzChyBWVHJ
         ZGvN6o5lvcnnX2Tk7diyqN1IkBHhj6yUxX8z4V4A5VphDG1ll58JBNjq6M33WUnJ0MC4
         XuPYx6gctiX9+hlnOEF+qhA9hCNdutO6VtVC23PeY/jacUS0WhygzD7BYPEdV8yowfpA
         qCQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fYYqV0QW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s78si2005058qkl.240.2018.04.12.11.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 11:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fYYqV0QW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6gyy-0000vs-CF
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 14:30:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6gyk-0000u5-Ra
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 14:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6gyk-0003gv-1x
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 14:29:50 -0400
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:36773)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6gyj-0003gg-TO
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 14:29:49 -0400
Received: by mail-ot0-x22f.google.com with SMTP id n40-v6so7110559otd.3
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mc1ixBgKLbXkdKL+5mzkrpqPlikSqvDW7/NhjqukyY0=;
	b=fYYqV0QWnRWB2On7q1sOfoJSLJIqVK3IoV+xCNeG96O0W9cO2xWBe7Ptome8iLc+92
	4uKa2Tq7S8AX8euv4/2WY+IG7YbxCToo29qbzLJbjs0ok+VWpeMF3L5b6bW4CW/JXHQu
	EX6or/c0T0XjRP50bLabgABkMixhWYUAVzIbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mc1ixBgKLbXkdKL+5mzkrpqPlikSqvDW7/NhjqukyY0=;
	b=ueq/PTDl0/jJGjzUyiXJPDlwuttPJVHnqZsV2zBbHmyhJBOd+5ffv00WFZsmogvJcL
	gDfmv0XWv0PihH6VCPERTUIHIgholmUhHpIFFTy94KG1tyHWXgVm4b5eTVvLS9lylCY9
	M5EHv1YEaKnVex5f1plRUc8KXPYEWsSBvHHrrRupTbj+c5vOkFohkbENar8FrczX/jOh
	HM+j2/rFL2p/ZksVLUUNkpPNfzSun03Cdy1/MdsP/UEh7CppEKb+fFduHYan5oVMZvKP
	nYCVBGd2HTS3FG3xveoaf+zASiy0ESz3yPLq5AXXjWQSkkpe8hxp2dj7IQ+KvijZdfNa
	oZHw==
X-Gm-Message-State: ALQs6tBhkejYBPduy6x74Clg4yOqWK+3BBL/Ij1ntcE3zsyOtirJh/ZP
	0O9c5NJf9fMVDcDnbrQ5OCu9Oh+szJ9v8nPurrFbpQ==
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr1513502otj.294.1523557789270; 
	Thu, 12 Apr 2018 11:29:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 11:29:28
	-0700 (PDT)
In-Reply-To: <1523551221-11612-4-git-send-email-imammedo@redhat.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-4-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 19:29:28 +0100
Message-ID: <CAFEAcA-AVuHMao5kQUrfEYWpGL0y-CwbuqCA_8ZSZrVbqz9nCg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] [PATCH for-2.13 3/4] arm: always start from
 first_cpu when registering loader cpu reset callback
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1S2vGL1JOZCP

On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:
> if arm_load_kernel() were passed non first_cpu, QEMU would end up
> with partially set do_cpu_reset() callback leaving some CPUs without it.
>
> Make sure that do_cpu_reset() is registered for all CPUs by enumerating
> CPUs from first_cpu.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 2f464ca..2591fee 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -1188,7 +1188,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>       * actually loading a kernel, the handler is also responsible for
>       * arranging that we start it correctly.
>       */
> -    for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
> +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
>          qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
>      }
>  }

Definitely a bug fix, so:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I think though that in at least some cases we'll still mishandle
being passed anything other than first_cpu as the CPU pointer,
because in do_cpu_reset() we do some checks for "do this if
cs == first_cpu", on the assumption that first_cpu is the
primary CPU that we're booting. We should instead I suppose
be checking against the CPU pointer we're given as the
arm_load_kernel() argument (which I think do_cpu_reset() can
get at via info->load_kernel_notifier.cpu).

We should probably analyse which boards actually pass anything
other than first_cpu -- I suspect it will end up just being
the xilinx board which has both A and R profile cores...

thanks
-- PMM
