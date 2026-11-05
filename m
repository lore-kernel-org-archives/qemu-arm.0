Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE219606A31B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSJ3glYU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOveo-0006O1-S5; Thu, 05 Nov 2026 06:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOven-0006Nd-KG
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 06:29:25 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOvel-0004FJ-KP
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 06:29:25 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b429f71dbeso1749156a12.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 03:29:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878162; cv=none;
 d=google.com; s=arc-20260327;
 b=QLeWKSnf7nydABN2pRrB5xnjcMFiwSHkxUF5nF2xzbhpA1PVRHob9BRhLRdo+eTjqa
 2Pc/FMp+T2E2y/6Q48hZN0Jo+28JBZ+R/HXja/nmtlbGKUdlSOsQTYuUtidSWU0gJTQh
 3Gys8MpiT0SrQkYOvNsdWtgxoxwV0UJ9knCZ0hzEBrCC0DP3c7ixAiMWrYK6NAMuusHQ
 MJWGa+B6/AQgPtjS3xwhsM62XhGizjJqg/25jOA1xsriCV4S/JDXN52sRDJh3TUde6a7
 wgt4Plnj089C60RMVi3NFcAAULCjBfzDP6pzgcLeVd7vAqHYDes6ZZ/ZRwFSo4Am44GJ
 4sew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
 fh=K37LhL26xURt2M0KIJET+KdPmjdXkaQRIYiWIehNC5M=;
 b=QhnE3LWlefmjpIYp7A38GeNbL8e4QQjVjXq1HRU+KOGLkAvGMeFliLNVwwE9OQDPe5
 W/mjWnrEKdYhMIzbw0eIHAXoPaZgqKV6eZ8E7qaQTyNI34ncZmB3aFXX76tDZcNenTuQ
 haRp1kUdRKcaHGihzT/MN0s5rdFxwDD/vu/uGgQHoqQCDUaweoKWEv03GPW5j9WZVVLo
 aeA2IDORDw4FED4niEEvQcFiorX9tauO/2MkOhJCNEWLXrhGWHFJyHW8uFgAkngLy6aq
 j298SMlY8SjFNimu9no09c0Y5SgISJL94pfxiMuicHBR1kljJkAZfyt2Z36VkTh3OaSY
 jcZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793878162; x=1794482962; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
 b=ZSJ3glYUM07WcP+8ki+tDbs3lXiy1JnuXlmdOy5X9tL0ZvHmB3pCuFtjsqpIp0PG5Y
 ENAdM0zh7tEThXekdrYlBpc9LJ3TnuqUdRtE8s4OX3UJM7EQk3KbeNRBL+5ZKlPKnmeE
 wi8lIn3uiD6gZVVdJlTVIRHOSKIvGvoXxzEihHPX5S6Pa+TSVK0MqIgiSO4S0Cngobyo
 vvzitDhm4lxs9yFMQaJuWq+LfE3rjNwvS+Ea8rUkVnGv7ytXMzEn7IELn6ZuHFt6Cgjz
 8hJttU6R8nGOy1sG+NYsiqatuK0GR4t+4/Tme7jz4nVMrKGn8GNhr/4Ew3ajIcmvf6dU
 0vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793878162; x=1794482962;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
 b=t6+io3C3K1hI9NWSJMckZv1pT33JA88tYnPA4x5f1ySd/qPwoJROvUHJ/d3Z0TNx6I
 NCCtbRXiVvV+oRerWITu5zy8wxD/U3oph/LEcB54VGKGymu3AUq/zgz8oJBrWeoPuq/k
 8HUo4g7yBV3BZMh2Lqv+K4U0xm897ACO7FI1E1yRByvOT+FW1SrF0PovBjMdUqNaBayi
 SYBWbJW0hBKTH3hbH9xBq8A7NAj5Vhp9++7sL91ghlP/G0kXys8/dxHGCYMMdhDquVj6
 ojBYjI8J0oBC7tEmVRLaGmoKzJ1xvTBDSnY2QTMSar4eOwlL5LPg5DtW/14Qi7LsQrod
 /EYQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByXEtNAJVtfzicgjqylv0OBMOzYwo9BUqsbhgnMrPU8yjdz55sR0RUqZpM/X5cq5oHvK+ZI1mjIMw==@nongnu.org
X-Gm-Message-State: APuU4Z/VUctK1msaJJzh6c+bhWfAccGoL/qX/HXP5+oRAH5DuOEpmfSL
 Bafbxbo2bsoQVdSvDbva+QCD94hi9rUQwOS0lNhvqd6WgggFUJfa8KF4kJyJQA3qgpLvmA+cozZ
 Dr0Ge1p254JNXd5X8rTjxCypZJCbB++k=
X-Gm-Gg: AYBFou3gcrztK/8klhfMMpPn8ht6Grias0P/ONwCS1rrYfF1sCzvpCaaNYQp4DnBYCl
 Wz5JTXQ2fQ9n8q2n9C+jAMC6tdufQYhfHhp+uzxl1C7xfqEp5MyC1gV0QerxiZGCUeJSJsX6Htj
 A0tMHpzDRkmu3iaiZna6KIcaqWVP+hntlN6nPysCrPZQXGh23yCtOV5VLrg4f+LfsYtcAaFaDFA
 CgF4G0e9eHt4WIgfKS5L48o54FNhqsgOTHUDN4mjSEmj3NK1fzijrp+JUolIIVNHktjLm4KbdPJ
 d87+HP8bVPBKGpO5GbHc1gUh+SHuWuHicNWQanpU8jH1TMeE7gKrx4q1foJx5SMFWz47LKeY9JL
 XM2lCPqv9RyQ78HYWUiHwvDyy7B/XSrhHeAmE
X-Received: by 2002:a05:6402:1a23:b0:6ac:9a44:d404 with SMTP id
 4fb4d7f45d1cf-6b4d32890a2mr9686232a12.0.1793878161823; Thu, 05 Nov 2026
 03:29:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
 <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
 <aunnuwhsx9ZOOXBX@redhat.com>
 <45433754-3cea-41fc-9f45-65a328d0efca@oss.qualcomm.com>
 <auxaPyRRm3MTBz1f@redhat.com>
In-Reply-To: <auxaPyRRm3MTBz1f@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 5 Nov 2026 19:29:08 +0800
X-Gm-Features: AclHuK-4rXijL_AUOdDONNduLekRdI_s2YHPupRTfowSD0vm5SlSlXiC8G5KfNY
Message-ID: <CAE2XoE_=rb9rKyjVZXmBcAHU11554WTt0BkFoP6EAsDFQPEhiw@mail.gmail.com>
Subject: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anthony PERARD <anthony@xenproject.org>, 
 Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
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
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x531.google.com
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

On Thursday, November 5, 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Nov 05, 2026 at 12:27:18AM -0800, Pierrick Bouvier wrote:
> > On 11/3/2026 5:55 AM, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
> > >> On Tue, Nov 3, 2026 at 9:23=E2=80=AFPM BALATON Zoltan <balaton@eik.b=
me.hu> wrote:
> > >>>
> > >>> On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > >>> That means exposing all the boiler plate for all machines other tha=
n the
> > >>> simplest case. I think it would be better to keep DEFINE_MACHINE_EX=
TENDED
> > >>> but maybe rethink the existing wrappers and drop unused ones and ma=
ybe add
> > >>> new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still=
 keep
> > >>> the boiler plate hidden.
> > >>
> > >> Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACH=
INE_EXTENDED
> > >> and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
> > >> "targets" or "arch_mask" parameter.
> > >
> > > Given that we don't need to do general per-arch type filtering in
> > > QOM, we could just move 'is_available' out of TypeInfo, and into the
> > > MachineClass, so it is a regular class level property, which can be
> > > set in the class_init methods, and thus avoid any changes to the
> > > DEFINE_MACHINE macros.
> > >
> >
> > Some cpus need it also, and it's used for filtering purpose at this tim=
e
> > (to avoid duplication at registration). We already depend on this behav=
ior.
>
> Can you give me more info on the problem with the CPUs ? What cases
> have duplicate class names with CPUs ?



Hi, please take a look at this

https://lore.kernel.org/qemu-devel/20261031164009.2048-1-luoyonggang@gmail.=
com/

Also the single-binary RISC-V patches also faced the same issues,
trying to access
the target_info() in class_init that can be also avoided by this idea,
the bucket TypeImpl .

The patches is at:

https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-0-babc367b6=
0f5@rev.ng/

The riscv machine  need choose different cpu machine according to the
target in class_init =EF=BC=8C

specifically
https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-1-babc367b6=
0f5@rev.ng/

https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-7-babc367b6=
0f5@rev.ng/

By the introduction of TypeBucket idea, these all can be resolved. and
we have no need to rename
The QOM typename at all.



>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>

