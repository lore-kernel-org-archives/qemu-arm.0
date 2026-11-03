Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFDB606A338
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYKGDzUH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOAcZ-0003v6-Cz; Tue, 03 Nov 2026 04:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOAcX-0003uU-S9
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 04:15:57 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOAcT-0000EY-Qm
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 04:15:57 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6ae305e3bd9so6784514a12.0
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 01:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793697351; cv=none;
 d=google.com; s=arc-20260327;
 b=j9mFkUeiir+xO0Au8YNXkxsStMq/vkQh/MeataoYt2Y8fY5YxqFajgiMUbpwNhhAc8
 +Ao5a/gBupYi7HYM3zGTE/xZlhEL2LEdXqe05BiFYAZVhc8ZrtjOn8lhhpQN7AjMnrV0
 j0dgAkZtw+Q6O2i+BzmJA7FUEcCANIqdpySDHMuDoj8Z8C3QxhLGAfZiCep/iZ5uVZmW
 RtHtoIkF8T+hqCShsr59sG0W/p96ZJ/bcGfbRy2uUNWGiJdoiNe80kcMP1i1RJ/VXiEO
 H6AT/GyOF3SQYTukmPn5X3v+c6vqsP3PPFQC80aSF9e4/c6t78qHzfhHz7dNpuBk4GhU
 OcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
 fh=3VTD4X0ozoL7g7cqaOrwUWMbvzDkklsjezF/T5gn7p4=;
 b=PsrNV5ihRSNbsqiFs3a7vRIpV9sr0zTvRDun2TJiqxQqmghgCJ/j9DPVe5DV23Kdkr
 5PhSmZwyTrW4FMvFGetEe/h+JqJf+3Qbb1MWdJ4RGqDO7VPzd51577kH2vRb+LgQtsfq
 +5/wIhEofoic7dES71/AGSgqIGYERESEogeZvCrmwwoi0cZ/pHnKquSj54ZSwYyz3DVk
 V7Rbr/N8w+PpY8W1dv4jtbydAy81ch1jFAZoOlN1ogtRQeKbY6C6uHxvS2U8MahMKtRY
 FbHCadawaOchKf7Ud6hQvdAKkN4kvNGDPHGdK6QPyVsOlBLvSlNwqLSNab1pkIS0njZH
 zcPA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793697351; x=1794302151; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
 b=uYKGDzUHc8CKPW5yTYQeEHzxj0Qhu4KcFYnSD4BGQ+TQ+1G3EmsHGB8Y/ScS+fdsey
 WlM6+Sw+Y494nZWZ2BkjJhHL8t5g5tMpBQ0lL1FtTNDCOCyQVT4C8KYcyQ1Y4aJKweez
 veu1c8BshwSkoH57a71iM0H5MuLTEfBChyowTrE0j1NtyEEMeXTzG5/+2T+28l1pfCpg
 kErc5u3BRJ/3cV6b8TEWZ/fZx5o5XfQvOVZp3oD9kMIHEqKb852/ujEGFqntPzPHp/TI
 BNW2ljLzXZV3fH3YlpQH/DYZPNoKDfJqhRpa8QzjD4AwiLMXrDgVmTSYhZHlMoPjtilu
 gYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793697351; x=1794302151;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
 b=r/f/7v5v5/haVQK+okmfgj436wmU2Wxaaqu1lkmiEDDj2sE10lrjPcr1aoJdyXlh0C
 Aoacpqf8nzTvyuH0RbI5NHjnar9hPUn+6J6694SnXIBjpsLJAMxYF/rDKs4WJhGvooGU
 6n/kZYfbfIXVVvJbvpYboFeCTO1OxlW6H5HC+n4dJ94GmfxrN+Rm2J1+7K/l7eFwCQL3
 jtns0MbATSBwo3bXc/u/ehoIHgq1wYwdjugwGtXMkwRz4b+/EtVJY/Z882gLiQsA/1Z6
 gH5xTvZypnOifBLweMPXGQ/V7BYXrnn5uyU4oIidWI6mHsoK62MxkWlWV5zEyWLTexdJ
 83lA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxopH3MR2bymaPbgiR3tqonKpxfG9P41uYzurWtvIXcGyqHrSfAltmYT1yJKHvOHB+FNfA7zr54Kw==@nongnu.org
X-Gm-Message-State: APuU4Z+sumRknoyxbHLLO2KKA3RagnJzr36x5M2WjLFR7BdJbETESPsb
 uTBC0tXpAT9/PKP15Ot1Hvn/vzwH36pkRKPxXVqO5uGoEDz9bA4sN1uB0Q/kWawRS4lDPygt+Ip
 yfRgyK0DOv/klDB90mKU1C3MiGD5ABRM=
X-Gm-Gg: AYBFou0yOsby5xPERMW9H+/bPpQS576tnKxHHP7vehTu/zR2RpnYjF5/D3dZYCOxHYV
 gcETOzfVpiv72c+8t6NQyH4NO2sPNkUCB+yZRyJM+QdxdQb9fzJXA/FAdFfCVDZzi8TcCNi2Ubv
 hPQyumcL10u4hIJWKBPiYrLZWX/toAD4T5ZIKSBIB2q1qlmXn7IKKnqb6Ae8HFuvnlWo8BMu4hm
 A/mJxEuF7ELcJyCWALkKxgsADadY8kYKFizJsG6JVd+2RcJLK0HOsmUryAPfnngqzBwrHB06A0g
 sncwo42KMCYWFe+RODbUmGjRdj+6rfgHLEBg7swZIyBi2scDDlidw96GPRWxhVIGGfVWsfJYHop
 pfHw9k5vkY8rKYSXe/juaciAaH9r0ZHxrRqRD
X-Received: by 2002:a05:6402:2355:b0:6b4:20bc:fa3 with SMTP id
 4fb4d7f45d1cf-6b4d467bb11mr9345520a12.22.1793697351217; Tue, 03 Nov 2026
 01:15:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
In-Reply-To: <aumYOBw-nKQAWdYK@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 3 Nov 2026 17:15:38 +0800
X-Gm-Features: AclHuK9NUtlMJehxCaFT4QHnxh-0yBZ0hPP8kK9uDqXwDHrUyauf19YUe8SC3VE
Message-ID: <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, 
 qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
 Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> > On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > > On Fri, 30 Oct 2026, Yonggang Luo wrote:
> > >> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> > >> type_init
> > >> function that calls type_register_static(). A later change needs to
> > >> pass a
> > >
> > > That's the point of the macro to hide the boiler plate code.
> > >
> > >> target mask into that registration, and the macros have no parameter
> > >> for it.
> > >
> > > Couldn't you just change the macros to take that parameter instead of
> > > expanding it everywhere?
> > >
> >
> > Problem of macros is that they don't have default parameters, so you
> > need variants for everything:
> >
> > DEFINE_MACHINE
> > DEFINE_MACHINE_EXTENDED
> > DEFINE_MACHINE_WITH_INTERFACES
> > DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> > and now would need a new variant, with variant for other existing ones.
> >
> > In the end, it's just simpler to remove this and add the boilerplate.
> > It's written once and never modified, so using a macro just save typing
> > those lines once.
>
> For each machine, it is only written once, but we add machines
> over time, and every time a new machine is added the code style
> is slightly different. We introduced all the variuos DEFINE_*
> macros for QOM to better ensure consistent style and usage as
> new code is added over time.

I understand that the DEFINE_* macros are bloating because of this.
Indeed currently the only two macros used are "DEFINE_MACHINE" and
"DEFINE_MACHINE_EXTENDED"
; each time people want to add a new attribute, the macros is twiced.
And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
with DEFINE_TYPES or TypeInfo
and be more explicit. When we used as macro parameter, we need think
what's that parameter means, and for
TypeInfo, we can directly know what that member is about(because we
are assigned with the member name).
That's why I suggest keeping a single DEFINE_MACHINE, just like
DEFINE_TYPES; as they are the most
used macros(and simple enough), and won't suffer from changes much.

>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

