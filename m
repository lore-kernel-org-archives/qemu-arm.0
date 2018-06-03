Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2160346wre;
        Sat, 2 Jun 2018 17:49:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK0HCt/zLFF104AtsGJgslnJtZQMVq95Q55hs6vJaC5npVDa7DHpVYnWt6HJNSdS0zRVyGS
X-Received: by 2002:a0c:e354:: with SMTP id a20-v6mr6958845qvm.229.1527986946425;
        Sat, 02 Jun 2018 17:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527986946; cv=none;
        d=google.com; s=arc-20160816;
        b=bn/5miO9YFRlBMfi5ywgPjN8XG8d0GHxNFZb1Pbd0clBjdrS51wOkaaNvEzb0GdDzY
         D5kgPwI5gmEoZdd9MjfSEbQUZ9ZvF5qjGczORNc/QpoJ7AgRQgSzs6jZvgaRq6VZ8EiZ
         PQ0bZ0KB78064grshc/clv58akVeCyL6xcvDEq6BhUD1OwHPJG0RLn+ri/VwMmR70agF
         ujblK7DIt1RLCPPnPgbDbYsGOc+lOBnsTXNgmqzPI22wxwbhyF+Qyu90+DoZt2yIlEyE
         UATeH5PPbyXs2uxoEQD60G9dhkhMzkUpm53Zfd03sBNMCttskX8j8emDUsnelg/Eox9P
         PQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=XMoXl/tly4JlALX/Eo309npZ0XWEiUzl/r8QmcYt9OE=;
        b=k3ll0jaj69nekPLpDUWB8GLfsiWHH/4PDmZ1RXi2C32uhvU8pbsQh78hYFZJu3AGo3
         onYOIOvb4jFfxm0frFE0dRVZY351PuWMk/JsfdTEFElYv9p11j5VGEld4EIWb+/9U4BR
         HZ+CqbJLQxU0Wm3crdlWUrNrX8Wet0K395O5FPpWll77/J2VggCsQB7Es0kiwxEle1am
         86pT0j5nMkTPJim0jgIoltPVFOHyilEk8wqE2xuqHArMmF8Nl6kKoiRkK7GQZdYqOOHC
         c7y8Xj4ggdnl+YlnGE1KNulByFEgLMwHDkgClk2SoRjcyc7z4e5Cf20n00S8r9lpjdYo
         mbwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OBAwBXav;
       dkim=fail header.i=@jms.id.au header.s=google header.b=KF3Xvh6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a26-v6si1175424qtc.37.2018.06.02.17.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:49:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OBAwBXav;
       dkim=fail header.i=@jms.id.au header.s=google header.b=KF3Xvh6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPHCj-0006V6-UN
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:49:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fPHCd-0006Un-Hp
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:49:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fPHCc-00082C-9s
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:48:59 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34640)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fPHCc-0007zc-1b; Sat, 02 Jun 2018 20:48:58 -0400
Received: by mail-qk0-x243.google.com with SMTP id q70-v6so14065271qke.1;
	Sat, 02 Jun 2018 17:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=XMoXl/tly4JlALX/Eo309npZ0XWEiUzl/r8QmcYt9OE=;
	b=OBAwBXavrYemjG4lGoWI5qNvugM98mwrU7nnrdERfyBs9KbBXIOt53Dgv8yfN2PisO
	WAeVtM3KpTyK7LU9lWsecM14OaatrRmjMOJ6pwRFxLSGPkSjrV7A3A+yTCwRJtoC485x
	Y9d6hlqsYkGDz+RGx746LJWHnBYWYyZ+Lvk9PvdhfJZG1AZQwdKJy7+KULBfkDT6sEXr
	YUIRmzt2rArkWpNK1HKrJpqi5cxxknRxzZ2ZYPyAGzTtd0ulgsEx38UeSJLDTnhqNu3G
	YZffWijmr5Rwj8m2ZRtUzkrnhviOXpE43tiB8lr2FZcwHIrwwcHsCOPKAR7bhrHfKW1A
	+P7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=XMoXl/tly4JlALX/Eo309npZ0XWEiUzl/r8QmcYt9OE=;
	b=KF3Xvh6qvc68BApDh4TsFwLmlJPy7v/ZUn153FgjTdQU4/OOM6x8hwxJfa9uqBnCBF
	awqH1O+GvIcHLMQhN+l4FnNMRV7CZeccS5CyHQ6EQm8OHkSblYvVY5PMM74IOc49IRBT
	Z97RydfnCPuH3qOLfxdELVLMw40WgL6j5gdtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=XMoXl/tly4JlALX/Eo309npZ0XWEiUzl/r8QmcYt9OE=;
	b=Ime9Ii3yUjBWsGEGl58g6Drhljj2fOPNv5sUDfGW6GOPv03tvqTs7lNeixbWMmWvBk
	iIoQXvPCXXMkABunn6h1z7Dbg4uZXFFhcmiMDE8384xzafO08fjRCA4yNHBHGcyusJif
	TUJtG05JBHi/Yw+DlKkLidT2EhWxI+a6ADBz6zOU9o/utInrGA1JkSCuu4/AnU22vMXP
	aVBBasgFai4Y0CUXXKt0+1FpK4AtnSCMXyyLwYXRf6lcL0A7/wqiEdK9PySF90k26XYM
	OzB15VXdbVQZFioo/zpSltsTIKsvSz3HcUgJZkWU7XTEiMOg4ci92mY7QnJo6njAlgDB
	/pnw==
X-Gm-Message-State: APt69E0qyp4wETNEAmsKRiyhIzYOhR1q9YVSGJk6OBx3uyiZelt+kh9W
	IcMEFuPmysU6iLvKYCxkSEIOreMrl9hmbBG5S3Y=
X-Received: by 2002:a37:1314:: with SMTP id
	d20-v6mr14882476qkh.422.1527986935883; 
	Sat, 02 Jun 2018 17:48:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP;
	Sat, 2 Jun 2018 17:48:35 -0700 (PDT)
In-Reply-To: <20180601144328.23817-3-peter.maydell@linaro.org>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
	<20180601144328.23817-3-peter.maydell@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 3 Jun 2018 10:18:35 +0930
X-Google-Sender-Auth: OOm5eds3EItH-OTggVBQYJnd-hM
Message-ID: <CACPK8XfOZezMM2fL1aNoPx7Gjc1zeCJf5MNaS4FOPfZ5XABB2w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/armv7m: Remove unused
 armv7m_init() function
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	patches@linaro.org, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VDXG4m2jcPwp

Hi Peter,

On 2 June 2018 at 00:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> Remove the now-unused armv7m_init() function. This was a legacy from
> before we properly QOMified ARMv7M, and it has some flaws:
>
>  * it combines work that needs to be done by an SoC object (creating
>    and initializing the TYPE_ARMV7M object) with work that needs to
>    be done by the board model (setting the system up to load the ELF
>    file specified with -kernel)
>  * TYPE_ARMV7M creation failure is fatal, but an SoC object wants to
>    arrange to propagate the failure outward
>  * it uses allocate-and-create via qdev_create() whereas the current
>    preferred style for SoC objects is to do creation in-place
>
> Board and SoC models can instead do the two jobs this function
> was doing themselves, in the right places and with whatever their
> preferred style/error handling is.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/arm.h |  8 ++------
>  hw/arm/armv7m.c      | 21 ---------------------
>  2 files changed, 2 insertions(+), 27 deletions(-)
>
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index 70fa2287e2..ffed39252d 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -23,9 +23,6 @@ typedef enum {
>      ARM_ENDIANNESS_BE32,
>  } arm_endianness;
>
> -/* armv7m.c */
> -DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
> -                         const char *kernel_filename, const char *cpu_type);
>  /**
>   * armv7m_load_kernel:
>   * @cpu: CPU
> @@ -33,9 +30,8 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>   * @mem_size: mem_size: maximum image size to load
>   *
>   * Load the guest image for an ARMv7M system. This must be called by
> - * any ARMv7M board, either directly or via armv7m_init(). (This is
> - * necessary to ensure that the CPU resets correctly on system reset,
> - * as well as for kernel loading.)
> + * any ARMv7M board. (This is necessary to ensure that the CPU resets
> + * correctly on system reset, as well as for kernel loading.)
>   */
>  void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index f123cc7d3d..a4ab7d2069 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -261,27 +261,6 @@ static void armv7m_reset(void *opaque)
>      cpu_reset(CPU(cpu));
>  }
>
> -/* Init CPU and memory for a v7-M based board.
> -   mem_size is in bytes.
> -   Returns the ARMv7M device.  */
> -
> -DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
> -                         const char *kernel_filename, const char *cpu_type)
> -{
> -    DeviceState *armv7m;
> -
> -    armv7m = qdev_create(NULL, TYPE_ARMV7M);
> -    qdev_prop_set_uint32(armv7m, "num-irq", num_irq);
> -    qdev_prop_set_string(armv7m, "cpu-type", cpu_type);
> -    object_property_set_link(OBJECT(armv7m), OBJECT(get_system_memory()),
> -                                     "memory", &error_abort);

It looks like the snippet above is going to be a cut/paste for all v7m machines.

Would it achieve your goal by instead removing the armv7m_load_kernel
call from this function?

Cheers,

Joel

> -    /* This will exit with an error if the user passed us a bad cpu_type */
> -    qdev_init_nofail(armv7m);
> -
> -    armv7m_load_kernel(ARM_CPU(first_cpu), kernel_filename, mem_size);
> -    return armv7m;
> -}
> -
>  void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>  {
>      int image_size;
> --
> 2.17.1
>
