Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5588187wro;
        Tue, 30 Oct 2018 06:32:43 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eVkOCV9G/wmGX9dhrj3mV3d9TmiV9/eRUql0S/rF9e2n2lgX8s60TTuj8ozmgh/bZlvW1h
X-Received: by 2002:aed:2867:: with SMTP id r94-v6mr2279140qtd.112.1540906363453;
        Tue, 30 Oct 2018 06:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540906363; cv=none;
        d=google.com; s=arc-20160816;
        b=Uv4zQ9Nc0Ht2f27GCoIbhtEd2+YzbPjdb3/Uc8QsQHF6ybBhCDuLK5KJCKBYaJF9vk
         +RtCwGU8ygUl0Rxm/agNGp6Fq5CqKrn3DruvniD/M7UMqUpSjddHHLsU9x9DnwLtfbCO
         6l34896k6wOjex9aoivGe3z7h2gaykg5MWtlyJ5XEYkshxXyGhAWjjM67JEFLd1K9gLv
         Df5HMJ4nE7SXmDQcMQDcqOkFU6MpiBGiD1LY/jKrmGPYfb/frlGi6HcJWTTGx8F0Sdpo
         tInHw2C+XJekzJTY0iDoU3PzUoKRWoQX+7a341ySKoMdEbpW3VEGSxwAck4T7nXX7xJ3
         29Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Dl7raQEEhwKje+N80Pxwd4IDIQTTRAafiRJOMieGPHU=;
        b=BKICACd9jn8D6fm8YcfZDqYgxY0UqvZXpAlt85EORJlxyO1vgQEuNXPnRBZkYrEBEB
         gCh7kcdgMJ8zDHe1OATBm0HT6Ab19yj1RXI5I4AEVRCg5SfrDeyGFH7ox4B6VUZsqz+M
         +YUCmtlO4LH9IKkNK3Q1SsAXItyfehEIjuEJX9ZzMmov3r5Eh6CqBWyNIMdYXbqT3gCI
         xl0BTsqEWcQNRcvsqbmYA/6KPcOK1l4pBvd5s7ApJAbpJkW/y807es/io8jSEcOjmp02
         IoDCa8QaM91HU0g8lmov6M85jjpCFo6bHNNzXg0KopmXHv9DIiFr5k+n+t5Jt15UpAoK
         kPfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UI6S/j/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2-v6si5299121qtc.224.2018.10.30.06.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 06:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UI6S/j/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHU8Q-0003eo-V0
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 09:32:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHU85-0003aH-Ru
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 09:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHU83-0004HF-Sa
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 09:32:21 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46017)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHU7y-0003vg-A2
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 09:32:14 -0400
Received: by mail-oi1-x242.google.com with SMTP id p144-v6so6472098oic.12
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dl7raQEEhwKje+N80Pxwd4IDIQTTRAafiRJOMieGPHU=;
	b=UI6S/j/7RJ/B69lslhO3u70NrKOfjDw3HbK5+ihMvR+J5hEFVgDRanz+nRD8a3cKsM
	nKLffEqV3fVo69AKRUdvs5+zss8590aDFb2wTfOf2QlVmVJ92KkUM1vtLVzk+YQ3l0kc
	5hkSuclMtqF7SUSsHdoJ2sESKr3YAbsQl867E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dl7raQEEhwKje+N80Pxwd4IDIQTTRAafiRJOMieGPHU=;
	b=kngyKd1ddsiKqJJupmw+KwWPHzF5C2ac1YDaMrreY/4HuD1C+kRB28x1CQZc0zubmM
	x3k3O8ZgbfyPyFnrE6AsyVdsEl49ykLZ0mVj1qQZSWPQTjH5McEgIAPrs+lD36ijo19b
	2DBBJCVYSopEBufGJrmtRDG5Xkr8sKmzMpR+TuUEpbtwhoIp65pQl08R21QRw6rEaUud
	wCHM/p3ZRmL1WK3Wd3hXa1H6zQlxqEuX9SVjaa+b9aSYj9jOaoj1twuc+KP9UXTMXFs0
	jTFhLR2wJY156suiNtE9f61oRR3Vqik2rHxAZ7/j5E5HfdKkVn2ZyPdAIBmZrW4gZpiv
	jPUg==
X-Gm-Message-State: AGRZ1gKjnvMaMq8KOsOk6EG06RtZ4OiVnwZ4PoHaLpS7M0IlwWeSl8GF
	CWK0wH7tYhctf7FBCB0aMo9bAWWmmE/bTmEF96CJ1g==
X-Received: by 2002:aca:ed51:: with SMTP id
	l78-v6mr10401379oih.112.1540906325398; 
	Tue, 30 Oct 2018 06:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 06:31:44
	-0700 (PDT)
In-Reply-To: <20181022173559.17111-5-edgar.iglesias@gmail.com>
References: <20181022173559.17111-1-edgar.iglesias@gmail.com>
	<20181022173559.17111-5-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 13:31:44 +0000
Message-ID: <CAFEAcA_BGhqMiQGgF3TSXBXHacQf31emVTZv2tcr0Qo77bKcvA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v4 4/4] hw/arm: versal: Add a virtual Xilinx
 Versal board
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EVRDHFGYFymb

On 22 October 2018 at 18:35, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a virtual Xilinx Versal board.
>
> This board is based on the Xilinx Versal SoC. The exact
> details of what peripherals are attached to this board
> will remain in control of QEMU. QEMU will generate an
> FDT on the fly for Linux and other software to auto-discover
> peripherals.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

> +static void fdt_add_fixed_link_nodes(VersalVirt *s, char *gemname,
> +                                     uint32_t phandle)
> +{
> +    char *name = g_strdup_printf("%s/fixed-link", gemname);
> +
> +    qemu_fdt_add_subnode(s->fdt, name);
> +    qemu_fdt_setprop_cell(s->fdt, name, "phandle", phandle);
> +    qemu_fdt_setprop_cells(s->fdt, name, "full-duplex");

Hi. This fails to compile in a non-debug build:

In file included from /home/peter.maydell/qemu/hw/arm/xlnx-versal-virt.c:16:0:
/home/peter.maydell/qemu/hw/arm/xlnx-versal-virt.c: In function
'fdt_add_fixed_link_nodes':
/home/peter.maydell/qemu/include/sysemu/device_tree.h:110:23: error:
comparison of unsigned expression < 0 is always false
[-Werror=type-limits]
         for (i = 0; i < ARRAY_SIZE(qdt_tmp); i++) {                           \
                       ^
/home/peter.maydell/qemu/hw/arm/xlnx-versal-virt.c:191:5: note: in
expansion of macro 'qemu_fdt_setprop_cells'
     qemu_fdt_setprop_cells(s->fdt, name, "full-duplex");
     ^

because qemu_fdt_setprop_cells() requires you to provide
at least one cell value for the property being set.
What was the intention here ?


> +    qemu_fdt_setprop_cell(s->fdt, name, "speed", 1000);
> +    g_free(name);
> +}

In the meantime, I'm dropping the versal patches from
target-arm.next.

thanks
-- PMM
