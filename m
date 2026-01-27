Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F83D2FECE
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 18:19:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkne0-0006yh-AO; Tue, 27 Jan 2026 13:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkndy-0006y3-Ok
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 13:18:26 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkndx-0000st-2O
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 13:18:26 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6581327d6baso9253529a12.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 10:18:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769537903; cv=none;
 d=google.com; s=arc-20240605;
 b=RUvIK51kstSOnczTTgrHsgVV2uTDk0AkFgIQAfYo1UVTNs6Ju6ZNC8kqYHWDiK8+SH
 EhujpNUU7KuKk44hui0ycaLsrF89dAJpb109SsUFDvC+TVptarkmdxmPGwSLH1Uw98+i
 U1wTfnxmaAg0WTS0q8fi2DMouHQyhg655X4N8XJRpjf1p9e4Vg2p2fvpkwsSwjc1z+qA
 ygndyHvBndCCVZlsBRxAe3gjFNlrg00SjysLRd5O68039R76vW8gp/++yoenAa8UGQeE
 fBCu4yw1LxkP+IznURyPJGu0XoBekK+XsHnok6Z2R0KiM2TZLpLrFfg7V4eTE4GQpVx9
 y0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Y4TAlzdd7rvwsch6CulBm7lpt7hAKOxigoaihNeKqsI=;
 fh=7ecycb6E/v0YW6Oazw70ToTxH5tmkqndyeWggaMlZ4w=;
 b=cJtdqh1KxRCv6toPJdWVp9bazk0MGXTHDJceG0CLIrOncy1tDvYcctf6b+zfK5oB1e
 8manzedzyrVTDOqbASVfoBjsvr9ohSUuqbFmbfjUnxACk5P3X7zFo4TMH1tZCPuZ/9DQ
 AMpecX8Z/ysx6lqr4KGMOO5OZaZEN1KE7AJ3wPkAz9CYQfB8qlU0tbOZVO7msuTck9/N
 Zu255/VlHywZMplEQGcQ8VnEFCwtotMNHtlfjdZc3nGa6lJ5NuMZwpDSQopuySI4iwUI
 Bi1j8TgkvXK3hw3Q0/Z4JwQvRM1l54mt+7gS0FH6JELicdeL8wyDN8NAGPuJw6m8YUL/
 bQeQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769537903; x=1770142703; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4TAlzdd7rvwsch6CulBm7lpt7hAKOxigoaihNeKqsI=;
 b=E+EHQBcyciUHxS37TXV4zz/YGzuwB0NbLhcw1LcDtmSPGgxYFPsHOpbBpXO/iAruK1
 D2ekKicQJcq69GcIE8SreEvF3EH0QcTbLgcGPYkbu4F7qxPKZdqDAcbL/LejhOQEt92I
 iRl/FLJGshAa6iZ3TkJLYQprnnWVKGp+eY0Phop/Btj6CxXL4MvITi3MJX8NddMop1hk
 IRVXcuaz6O8ycb9LQ9AmNvK+y4zxhlO1PIP9tOGXb3hnrw6q5SNj92wopFrGFsvwEwjf
 Dp6mBThHBgNdFDLzkysjzXg+RFZGTonVFgIPD1ZKuc862h7IHbKoZZQXAJ3Rm+GdHFmd
 JtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769537903; x=1770142703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y4TAlzdd7rvwsch6CulBm7lpt7hAKOxigoaihNeKqsI=;
 b=USFxFbJ5BFQwYTFyxAvmZUZuU1UjEQEearK/uItV59iaFYCXfilbfleSNbYPUFzQfl
 X03dh+I0Bakoo7QzFlyZLH5ISpC5kSAzQtcJhCc/+9gpj2FRlcdYskxqDAPJNmg3R5oH
 wgPDJ+uRaC77hOr2lYYw5FEtBAzljOwlXQ8XJM1XfOa8PwV7ccwEJCOrsE59AgZ2odWf
 c2I/8Ktqz94r78QM60MC4+iaZ1/rT+JHt9/gWRYXCzBqVr0AmToXs3KPj4iYNK5GcKgT
 wf571dBd7gtObUM39JO6ObnbitLUW7Wd0cKScGXSi1QTr7XAEajI+y/WUrlhEeoOFDKP
 BWog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqkubzY06ku23oHuvL8j23Qni1hnT75TKzWNspLkg/7iuDhJzOnXjrKT5xUrDLX6qI+CSuuOid3Q==@nongnu.org
X-Gm-Message-State: AOJu0YziUvCPxA6eOfqW149jzRrehOci0A25lK+yJWOBFUkyQ0QCbxRe
 2T7LdFCx9M9J9Hirw5j0eehYxVBJo9lDFyu8E+cXtXXmnoF9AxEqadb0hgl5WuStZ7d39cniL3h
 KA6AdfqrmeVBrWOS+ujbRqZuA2it2oh8=
X-Gm-Gg: AZuq6aKUFYD1+hU4gVRTZRASLT1fJiDZqtbefRtwYwnuT00W8dOTHSgfNicNzxwoPD2
 kFt1OgrF2OKv1RWEnCFIHXR5AU3ymrkrnCbJgLdxuD8tGLDrhEXM1AvGFPY9ypcT5/gwIuEPx81
 G04bK4TqQlgwI0P5fwcj/qVJvjcebx15i3V9Wdiezd97zL+UvDYOOovQ8vQz8FmDykw3vZQNS5V
 QF4ElRKhM5xhpBMG7p4a7mOsYHDLUqDtmG3T0mv+UERhv5cQ7XtVDZ3E87kSru4s6lzfvgj
X-Received: by 2002:a17:906:c116:b0:b88:73ea:a1d5 with SMTP id
 a640c23a62f3a-b8dab45dfcamr202671166b.51.1769537902937; Tue, 27 Jan 2026
 10:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
 <CAFEAcA9NEjaUBX19sdw9TRCKcKn8CQfvoVNZ+VaXOcNZ8kf24g@mail.gmail.com>
In-Reply-To: <CAFEAcA9NEjaUBX19sdw9TRCKcKn8CQfvoVNZ+VaXOcNZ8kf24g@mail.gmail.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Tue, 27 Jan 2026 19:18:10 +0100
X-Gm-Features: AZwV_QhgsPS3k1UViGYc904zjHHQN9WcH2oc_E4-HDEBnl8NLgfggLHy5DbiCMI
Message-ID: <CAN-aV1EjYwSRfV87YQdtfqU5CH8Bsssr3EvStPWL2_VFOs4N4w@mail.gmail.com>
Subject: Re: [PATCH 00/27] hw/arm: Add generic FDT-based machine and
 infrastructure
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Ruslan_Ruslichenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Jan 27, 2026 at 11:03=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>
> On Mon, 26 Jan 2026 at 17:43, Ruslan Ruslichenko
> <ruslichenko.r@gmail.com> wrote:
> >
> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >
> > This patch series introduces new ARM machine model, arm-generic-fdt, an=
d the underlying infrastructure required to instantiate a QEMU machine from=
 a Device Tree.
>
> I'm afraid this has been a feature that has been suggested from
> time to time, but which I don't think is workable in general.
>
> Device tree files are designed to provide enough information to
> the guest kernel to allow it to find non-probeable hardware. They
> are not designed to provide enough information to QEMU to allow
> it to create and wire up all the hardware present on the system.
>
> There are specific niches where it can be made to work -- I think
> Xilinx have or had a setup where they were generating an FPGA
> model and a device tree and a guest kernel all from the same
> single data source, so they could put everything necessary into
> the dtb, for example -- but I don't think it works in the
> general case. As one simple example, the DTB doesn't generally
> have any information about how the Secure world works in an Arm
> system, because Linux doesn't care about the Secure world. It
> also doesn't usually have information that the guest OS can
> probe for itself at runtime.
>
> There has been periodic discussion of more flexible user-driven
> board creation, but that has generally been with the idea of using
> the QMP monitor to orchestrate creation and connection of device
> models.
>
I agree that a guest Device Tree is insufficient for describing a
complete QEMU machine model.
However, we separate the guest configuration from the machine
definition. The -hw-dtb option allows the user to provide a
QEMU-specific system description.
Those hw-dtb would not be passed to Linux Guest VM.

The fact that this workflow has been successfully used in production
by AMD/Xilinx demonstrates that FDT is a feasible format.

In contrast, QMP usage may end up even more complex and less
maintainable for the task of full system modeling.
To my understanding, this would need to generate too long configs,
which may eventually require some intermediate format by itself.

I am proposing to use FDT as a serialization format to describe a
machine configuration. Theoretically we can use other formats, like
XML, but in my opinion FDT perfectly matches the requirements.

BR,
Ruslan Ruslichenko


> thanks
> -- PMM

