Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3921778wrt;
        Fri, 19 Oct 2018 07:45:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60jHYPqWOW1d6B9OIoY6LpLIgtpM+8hsnOSKNq2Ch2Y64efK2X0q3e4i6K53JASKocsHVco
X-Received: by 2002:a37:8706:: with SMTP id j6-v6mr32903987qkd.216.1539960341043;
        Fri, 19 Oct 2018 07:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539960341; cv=none;
        d=google.com; s=arc-20160816;
        b=L4VTQxTRCUOUStfjsBg6lH+J2poAKOsIkCMWF9NlP2CD27jyQu5xkjG5Oy1aakjswC
         1zt5GWaADvPzLGT5XP3cpY6F+j7Lwv7YUZY3x+Ejs1ti+t2Ed/8MlDAFLZQoTVoHGIY+
         Ngzboe2nNB6qZuMuDpGbfbLZ5WAeVryf1mcFJuaai8x+dAOoNo+7Vn61YgMQCSATZAy7
         laaO3u1tmePpZZJJrk1DvV02uZqDO6peKijUUB76+mhz7DutAnDqZYvBOr2aa/eulI9u
         vCB02pqncdzGlpQVUHzk/27hSnkhZxr9zLQ6PeyT9cgUbqkxOKPh5/ClhF9yXE1yM81F
         SlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=qwCoAaw8ohs5IJv0rxx7L3pxYW0MgWb8EiCU96XplaU=;
        b=UGHHu22g2qHSz3TC0ne1PGBSL6ZFNmC4avBJK3lirlQaia5o/smCa1eSapWop5aA4p
         Qr05sGCIAffCvjz+wloyg8UiSMJWno72a4FvbGzBs/lJfbQharI5KnIg1Tv7/kgT0rMK
         QFKyz/9kzrmad4tlltNSmI9mNpRg8JGGti1mKK9WvdlKw1/I9Y5pxDmUB5QuSG6HDKjV
         jm6d54qqmf5IU8FLC/4fdZBn+4jaK67qgpR/8iJito5ydWFvCzmuYnIgHbw70Hp48AoN
         N6wHVoUBCM0QfpSGqXoLQOoZaps9QW21Zy03n0KWwcUFoIAK9er9X1mGqPNL6oWgGYwU
         9trw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="al+/X5UA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si508818qvt.42.2018.10.19.07.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:45:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="al+/X5UA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDW20-0007EF-GU
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:45:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW1I-0007DB-TR
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 10:44:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW1I-0000ON-2P
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 10:44:56 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDW1H-0000Nk-Ii
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 10:44:55 -0400
Received: by mail-oi1-x242.google.com with SMTP id w81-v6so26997503oiw.9
	for <qemu-devel@nongnu.org>; Fri, 19 Oct 2018 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qwCoAaw8ohs5IJv0rxx7L3pxYW0MgWb8EiCU96XplaU=;
	b=al+/X5UADfcIbC+MuGkqFTJ0m5G8YtajpjlVluTxSi7Cf4vSOoP1xHZzFp/7zmrkaN
	wGDu1RDazMWOjppp5b9WXjQPLxVGTvZlJudvp/OHyfM3+qxcnMiviZvp+vZ3ISfm2wyk
	BA3Z7hO5UMYFOxEeeBozfN3w8ru8hzsrHgWtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qwCoAaw8ohs5IJv0rxx7L3pxYW0MgWb8EiCU96XplaU=;
	b=c5OTXsD+iIBSZijrilQ83PZ5NTXJvAg/hmVk/47F23Gww2Ba+pIN3Y8CGFqajIsqfd
	97P6Emtl149S9tYjE+7sX4ldRnBOwHeKY0BUT/LYKOTJyxq2UfGoemd6qWmJTem/hsJP
	N/TSQgy70jjwTmBlYPSPL4OwyAlbL87QA9NX5KAh9dBlEZcq2lZsx4w7AG/g0qejCSlu
	qcHZq4IM5T0XAx51Q5KseS0Ven8bcrfQyOsrmhkorhPUm09SxrVSuA/+POxfZ//e+edE
	gHsATUe0ZlDXyGSt+h3589iT4hUqAiFJfHOnG/9nDIRnGFKOEDvqENBI0HfpJiOQ1QKz
	YCQA==
X-Gm-Message-State: ABuFfogOS/F8mISeVCn3l2Os9D4dctrk/ztkyqh69muCAMmRgDIaFSP4
	BDpKfjQPfSLxwItao927QeGwyRb0ZIKDXrfgAbmoSA==
X-Received: by 2002:aca:b504:: with SMTP id
	e4-v6mr19282191oif.25.1539960294000; 
	Fri, 19 Oct 2018 07:44:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 07:44:33
	-0700 (PDT)
In-Reply-To: <1539954845-26716-4-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-4-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:44:33 +0100
Message-ID: <CAFEAcA974ZrtCG7pPHXNq8EDsd5t0STJ6s9p-qGtGQf49Rk-bQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 3/5] configs: Add a CONFIG_REGISTER switch
 for the "register" device
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F4AEGeYad8dQ

On 19 October 2018 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
> If the user only wants to compile targets that do not require the
> "register" device, we should also not compile register.c. Add a proper
> CONFIG_REGISTER switch to be able to choose this more flexibly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak        | 1 +
>  default-configs/microblaze-softmmu.mak | 1 +
>  hw/core/Makefile.objs                  | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index a3a3b66..6f2ffc1 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -6,6 +6,7 @@ CONFIG_VGA=y
>  CONFIG_NAND=y
>  CONFIG_OR_IRQ=y
>  CONFIG_SPLIT_IRQ=y
> +CONFIG_REGISTER=y
>  CONFIG_ECC=y
>  CONFIG_SERIAL=y
>  CONFIG_SERIAL_ISA=y
> diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/microblaze-softmmu.mak
> index 7fca8e4..b5c5659 100644
> --- a/default-configs/microblaze-softmmu.mak
> +++ b/default-configs/microblaze-softmmu.mak
> @@ -10,3 +10,4 @@ CONFIG_XILINX_ETHLITE=y
>  CONFIG_SSI=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_XLNX_ZYNQMP=y
> +CONFIG_REGISTER=y
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index cafbe01..cb7c149 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -16,7 +16,7 @@ common-obj-$(CONFIG_SOFTMMU) += machine.o
>  common-obj-$(CONFIG_SOFTMMU) += loader.o
>  common-obj-$(CONFIG_FITLOADER) += loader-fit.o
>  common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
> -common-obj-$(CONFIG_SOFTMMU) += register.o
> +common-obj-$(CONFIG_REGISTER) += register.o
>  common-obj-$(CONFIG_OR_IRQ) += or-irq.o
>  common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o

Another generic facility.

thanks
-- PMM
