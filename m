Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB580CA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 16:44:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCgMD-0007V2-OL; Fri, 02 Oct 2026 12:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCgMC-0007Un-KR
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 12:43:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCgMA-0007hO-O0
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 12:43:36 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c2e36c3478aso2475666b.0
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 09:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790959413; cv=none;
 d=google.com; s=arc-20260327;
 b=b6WwP5dEH3xBukKTotm+WnmDkZobkpulqO/5qL7lhxV79kvjmZm7e0OKIzkZAZdYzN
 x4p07rGMxmo9Jxs240jT/LQHYD+e0q0yevYzXjg2um6cfHLqQuQcRy0Y5CzUMoxs0Qsk
 9RHKl+Tp+SUaMS3NhsI7wTzhaTPWmJ24hByNulkIVX6ovy4oJrxlZ5/818jMZXzm2gXj
 pQkhjjHDDgA6ehO4QOT8r5bskrrYkagFi1QIGIoh+zisLZlUJzMlebLhAxeGH8elLzk0
 akAylNUCg/ckU6N73YsUgwbYvOOK75rXgq/eNaXqZBRQWlBV/nN3dpWfc97cx9XqlZKh
 w/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ciq6ioagLvGVtduSTjIpkMRSg/H6W0iYwuNShnlnLLI=;
 fh=SyZG40UfXSSm2WZWbfb6w9Nj41hx54PfZDxoAI4QOog=;
 b=XDRISCGyEfuDSp0PezDvLH7z9tP1BNCUFTblRRAs4leBIVNMr0Xl+I+Rl+93HkM4On
 YD/B3BvgWyAlyxSwpea9hgNNLkCTnJ88JYeNvrcAXP7+0kV3ctcFouPVFQY0EvJfsC0/
 FUzRYxe2gYm+giMa03+85Re+gA/HqAD/r6WdfSob2xUV3dywa+btl24oReFWDZFfcF6j
 ZeE3EL8KX9N3Dhyrphx/GlqywtqjEyvGiAbHHDkHbPM8Z6to9UHRpEylpraNjB7efRBC
 eLZrr9A6WjtYQQrHNUDl+/P/SSdRKD628S8HskHp4Q4Nd85A+x6+Ei3+cHDxmR1zoYik
 ZtAg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790959413; x=1791564213; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ciq6ioagLvGVtduSTjIpkMRSg/H6W0iYwuNShnlnLLI=;
 b=GeUMYtitBj0ndWEw6ibwMYDSBEzdVfcifwfshugNXOtDFVZ/cT3q46Y/AhPoUXhhYC
 oPvGWApHsFmS4oroonx6U3W9c3RN8xp6J/kipW3kqnASXVjIDBlv42CzUOgO7AscdP2n
 VQfrDzTFLLAAxRMbueuj4JaEfPLjJx1Sw/pBAtbgd089L33VzQZn7wmUQjfcZOzyW4Cg
 q38sbrrhAeyxUHq4ET9cKtSs+h4lfCbZ7XuhtJLMexOzWYsemCaam+XwtNOEBk26wskl
 FG9MBq7SDYrtf1E/qCncsTw3+cKNv2L3opxWdc722NJTRi/Q4V0dWoP5RssqeRgZdNht
 Y0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790959413; x=1791564213;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ciq6ioagLvGVtduSTjIpkMRSg/H6W0iYwuNShnlnLLI=;
 b=eBD10I5dg4ShhMUaQDcOFbQmwbQl9anSeJZTvSESeIso7TDQHX5iQ3kxsihiQ4thSJ
 TkntgNXvnmcIE+3729Lh0NJGNHI71RdVHIQx0Kncrd7ECHt7Celv0mTANjRPjJ4l6DhB
 VsVIhufvSeVtVRprLOWCMYuSwMKBnrKwxUjGIKbTs1IyCktImb1877FDi1BTvpcBvrCX
 J4kVqKAr3fJb6VN7FyKfl6b2YCGGWM2HBbzmj2K0og8JiACikyYYXiw5de7gx2HJGSeI
 n1V/NKHI+mxOb1GBKNDD/A1aqjjUKf9j2V26+E22h+qTGpFnngQpwHMJ6vD4/iDbKnLK
 OVJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByvMn8bYzfuPCfmko6A4cuV2wPcTn/NWWbrQEsJHtQDmg2teMUQNb5XdcvK+dQYORo02VRUZIv3dw==@nongnu.org
X-Gm-Message-State: AFq9FYJBMy5JryNkztftyurW2gQQ7IKXQ80c50ZXQbvpByqs6t3OWewj
 0cuLv2ya1tjlxokxFbQ2+elxpvIzSRlVDi6QoxzED56dVV0464ErCte1awx08FMP/Qh2m2ViRO6
 cUPBjsk3WNsnslngi5jJeyVfDJzd2Qks=
X-Gm-Gg: AYBFou3KvAfoo1ZszTHnRlkMrhgZ8YjOFjwZYWJ+r5hwLXVjB9wD8V5tlrKLGDv70mg
 H6XMYhcRQpQ5aDhA/O4EERBnSuSyAbakv2nIltewYTSEELD0iR0GwBczEKLonfUe9YICVozDAMU
 SlpQ5PgtM8IVM77aRWpR6Kbsshf3Zq9oS81a83KbaimPZZpKW016X6rQLfGvNvX86iQpJ+STQ73
 ida6nkP4WtCwRMrIYhECL4CY1NTyBvdu+M2kfgrTFg6kXLQ2HDTeK+tIX5OvgmCdHEGaXpBCo8A
 7X+Qo2cwotq9uCZntIK56z5ChlLmXZjLVVCj5PElH5bOBAK8ayccDVQ=
X-Received: by 2002:a05:6402:27cf:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6afada112e9mr62964a12.31.1790959412772; Fri, 02 Oct 2026
 09:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
 <CAE2XoE8MriyEEeRF3uDwWgnJWPHBieK_-pD1+k0tUjROWjDpWg@mail.gmail.com>
 <a9cba466-f442-4bbf-9154-3674b5f10882@oss.qualcomm.com>
 <ar_coT44h5-zJPVV@redhat.com>
In-Reply-To: <ar_coT44h5-zJPVV@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 3 Oct 2026 00:43:19 +0800
X-Gm-Features: AclHuK8m_qVx9TWXeFIs_zQQIaSXtVcRCVfzkmDq_etOtUdmQMUUpBDu4hJ8myQ
Message-ID: <CAE2XoE8Jg=WHDF1_pQ-K-Y6f_aE2N8y5_=aJSeC4A52HWFwEkA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x635.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, Oct 3, 2026 at 12:32=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> "is_available" is probably a bit overkill as a mechanism for
> introspecting, when we just need to return a list of targets,
> Since we have that already we might as well use it initially
> though.

I have experimented with x86_64/i386 arm/aarch64 riscv32/riscv64 so
that I can tell:
using is_available will be a better option. As we can use inherent the
is_available from
parent, if we just use a bit set like QEMU_ARCH_ARM, then that means we nee=
d
specify it for every single machine. And if any customization is
needed, for example, depends
on KVM config or other accel config or any condition not just
QEMU_ARCH_*, then is_available
still needed, so I would insist is_available with a TargetInfo*
parameter, then all concern
will be addressed.



>
> > >> Does it matches what you would expect?
> > >>
> > >> Also, for compatibility with existing binaries, should we accept -M
> > >> $arch-virt also? I feel like it does not hurt and would make thing
> > >> simpler to switch between existing and new binary.
> > >
> > > Same reason -M $arch-virt, indeed like -M $arch:virt,  but $arch-virt
> > > would be even harder.
> > > Because "-" is a valid separator in machine names, ":" is not a valid
> > > machine name.
> > > So without init QOM, we can not reliably identify "$arch-virt" belong=
s
> > > to which target.
> > >
> >
> > From the conversation above, Daniel and I are not in favor to have any
> > kind of parsing based on this string. So either we'll pick virt, or the
> > real qom name, but not anything else.
>
> Yeah, I'm leaning more towards always exposing the $arch-virt names
> in all binaries, and also exposing 'virt' in the traditional
> binaries only.

I have a question, do we expose the "$arch-virt" as a machine "name"
and expose "$arch-virt" as machine qom "typename";
or expose "virt" as a machine "name" and expose "$arch-virt" as
machine qom "typename".

>
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

