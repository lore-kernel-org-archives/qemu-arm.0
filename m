Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1619C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 09:24:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxLTf-0005Nz-Ax; Fri, 21 Aug 2026 05:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxLTd-0005Np-WD
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 05:23:54 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxLTc-0003OC-7v
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 05:23:53 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66c4e9769bdso906075d50.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 02:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787304230; cv=none;
 d=google.com; s=arc-20260327;
 b=Gr0UnMF6t4wQ4scZ6DZcUuYil2HM/gYn9F/oDZPKCWFDawbgWDUz82N0zTp4/E2dR1
 DYewqbmgnInJNjJ0QoON11EdbqQfGlBUbs2ZKhbRXudzHk1luLOPAtK8D6gL+7uHhq/u
 t8Oc+J7ftIKtzIRUUQXTk7wdyfs66fn8+hjOXWtyDVU01GN9C4MAl42JVkSfKeVg2Naf
 YrWeRF0DtVifTT4ucq4TRoHcnbZDOn1Ks/hu8tsoKkJkXoN3e8of5UU90Yifi2kvAnsL
 h8ExtsdbKkBjPTE/AI+OodIDqNTB16kiSOol9Ke7xG990wx/oU6S1HNsYVYmOpIFVRUV
 W13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=k02/bwYb2C7W9O9X3E/L/K2Wz5vCdCbnOvWA2AOHkkw=;
 fh=BAnpqzA2EkJL5103hJt/7VFZ8RgRdCjig00AiiVXq1A=;
 b=D84EF3qH/15OTrdU/zj/LLOmaLAPn/pe4J1rbpsrHyZuGYqBejC8Qx+UoAUrfBlyVa
 DHxqLTDzyIxr8xlNe11KN+IWoLPjYS5yLCJJiHPOVyjqVlOVMSlulETVkMe4bXmDV/sb
 ndLy9xpTGE2937LtCvkIFHiN8JQhAr6zMskQ9Bx+TJFMvb1o/9A9Y/Opbv9rx6Mzg8ar
 9rKr4ShicYkUrYsePdgwyCoFqcTnYpvDI6En6WFmq6ZyHV/anPHrxBnnDua+G2jyoVsY
 t3XrXagp+WoIXS1qZxzVsLuMYSYJc0SEzvK17pddOrhUWg8/AL2vUB7IApH86OP68xpK
 kl8w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787304230; x=1787909030; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=k02/bwYb2C7W9O9X3E/L/K2Wz5vCdCbnOvWA2AOHkkw=;
 b=lvhjuqIYT4eBTUl/J47kszrfM+dD8e+7QXD4izWMzavjVF1lgtLGg+rgANWyMGf3aR
 r/7vGz3JEBEQLzIQH7388MuSKQLbFnUylZZVDAkV1EJ/x89AoNT80R3NI4b1B3D7yD3z
 rXG0XwGI/zasp8wYYACh3UDCPwj48jza1cRy/bi5OKlFpsYy7vPPTECqFq+So+w7txVj
 O/5Sm6Vtt/ywWDqwBkLZQs0FCN2PsAgp0JxkiJ+xrdcDnkCYJBpg7FUOSjmMQ26nOt5f
 At911nrVHId4X9/silIqOBHuuZuZNoQ//8R4RqJyq7b9MEYTDhEXjjyO0tmTMs0nK4js
 kuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787304230; x=1787909030;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=k02/bwYb2C7W9O9X3E/L/K2Wz5vCdCbnOvWA2AOHkkw=;
 b=pMX6+UnC0oJ+RcMB/4SP5Jyfy1YL017E8yRoypFGYUuAI2LtAB+Q2OPfAr9x3om7JN
 Dg3Yvpds5lgInbOAFzTmkiUpJdJgYt0Y5+yWko+FgqgBi9vNCtSDtRd9uIZYqSUw9ir3
 3f4p36sMa6pD+wy24NWk93/eopqks35QQ00u44jJbNOOVdEbNsmz6Db9ENIZU8ApvZGm
 VlVLU+G7NzkdQGCCHMOlKnPWS9m3cE8/Vv9ve8yJzydtZYu2aphUUrcyvhgdV6d+OC1d
 UgEvpt71dBVlYzJvdIQDdiHXcV2mSlCZiqRlJEdRO64cG9XEtflC5S4KeLxvvjFljMI7
 SHaw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1p9FOA5LeJPAfIXKcgBj8G6pFm+VVaWV28fXFN9MZBvxtJ8SkpsQ/oeCPKH+mrnX5ynR24mFtlQ==@nongnu.org
X-Gm-Message-State: AFuF++l2Up+NtM+ubnfZqfTg4R0VmMZOwKea7eW8gGeTHnv4vJ0e5aXo
 s8CIkFHGe7dJvtciLOspRN31J5SzYn6fdQ5TsxVzXoWrofwBHv+PUzseRCvj8l3cJc0x5WP1qrz
 FAvEqmwDIpyVZ6SALlJRZF+tZk8AB6yDeHE8C0WOxGA==
X-Gm-Gg: AR+sD103rq3uAh6sdiNs/6W+olTm7Weub/slqG2Hhb7UtJVXPeETqbGLH0bXl98oisK
 rnCMrdXTb1gADQ9f1DXS3umIGAOrTzumOXz3bCcCAvcUb8kQh0h69DQL8A5N61YTYRy5Zk6Iu8u
 rGYOfIi3JQGSsej2lYagQ49PGAh6t0W2H8WUfhHuh8QO9W7pspsVgkj7hVQVfD+vc5kzxP6VNqx
 iF3BBg8OaUE0sfj5B/t0Ejw3EtQ5atHdkTZXgxRRAuxeZaN9btGJ30Ru5ecdNgHtexscCAXsnYG
 PhyO3STluSY1ZBfpNUw5gdniuh6THosuZZJW4vjajX0tLqQU+4IWvjRBHI/9mxznlBRT6pGAHLU
 AqGJH7p6vhskWfRRI9KF1md/sNvGE
X-Received: by 2002:a05:690e:2587:b0:669:48b1:d19f with SMTP id
 956f58d0204a3-66ce4b4ace1mr1791102d50.39.1787304230558; Fri, 21 Aug 2026
 02:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260816131300.51799-1-bin.meng@processmission.com>
 <20260816131300.51799-2-bin.meng@processmission.com>
 <da09d1aa-5aed-492d-9afa-01d3a1fcb813@oss.qualcomm.com>
In-Reply-To: <da09d1aa-5aed-492d-9afa-01d3a1fcb813@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2026 10:23:38 +0100
X-Gm-Features: AcwNN1VmNjs9pv03tbrjQRoB1TO9jDIYH5m2pCHQsZdE7OWn4O8qoZ--8hfv2tQ
Message-ID: <CAFEAcA9scKMTHfrGdYRY6i+2rtU26z8ObTx5fOC3iDbDdtpPdA@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] hw/arm: aspeed: Store boot info in the machine
 state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Kane Chen <kane_chen@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 16 Aug 2026 at 15:54, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 16/8/26 15:12, Bin Meng wrote:
> > arm_load_kernel() keeps a pointer to the boot info struct for the
> > lifetime of the VM, so the struct logically belongs to the machine
> > rather than to a file scoped static object.
> >
> > Move the boot info into the existing AspeedMachineState.

> > -    aspeed_board_binfo.ram_size =3D machine->ram_size;
> > -    aspeed_board_binfo.loader_start =3D sc->memmap[ASPEED_DEV_SDRAM];
> > +    bmc->bootinfo.board_id =3D -1; /* device-tree-only board */
>
> Should #define a self-explanatory BOARD_ID_DEVICE_TREE?

> > @@ -42,6 +43,7 @@ struct AspeedMachineState {
> >       char *fmc_model;
> >       char *spi_model;
> >       uint32_t hw_strap1;
> > +    struct arm_boot_info bootinfo;
> >   };
>
> Maybe time to add a typedef to be style-consistent.

Mmm, and if we're adding a typedef then fixing the capitalization
style to ArmBootInfo is what matches our style guide.

I think these are both good ideas but in the interests of not
delaying this touch-lots-of-files patchset too much longer
I think we can do them as separate patches afterwards.

(Interestingly the kernel does not bother to define a
name for the -1 value -- it just hardcodes ~0 in its
DT_MACHINE_START macro.)

thanks
-- PMM

