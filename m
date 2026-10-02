Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C733DCA5FD4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 02:01:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCSZv-0006NR-JJ; Thu, 01 Oct 2026 22:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCSZm-0006IL-9O
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 22:00:43 -0400
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCSZj-0006ve-3E
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 22:00:42 -0400
Received: by mail-ed2-x0c.google.com with SMTP id
 4fb4d7f45d1cf-6acb88abebdso4388939a12.1
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 19:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790906437; cv=none;
 d=google.com; s=arc-20260327;
 b=g1YXF0QkEReXxU2FyuDVpzacgmYgsDYHD9+6cXrkF/goQdX9vrPFqwKTYIIwVgGpqd
 6iXyKbM++lBl/PjBRCUGS9KzcR3eGkqBo3slQ7SHSDoa+rcwgjQ7FQNs78VwAtUD3ioZ
 0EtLFcVDGDIs/BpB4Tjn2mQPpygB/tgL+M+Mfz53atm70mlJDhKulzaFTtKcztsBk+7O
 Aswp/WorImwO/LuGQWdyxiLiz2vuuXdpF+YsNFQJNwtCpyd5Mnf9q2WZAVMB45+5Nh7m
 QaR1l40bz3zsmLpfvsj0MJ6irQaOA77WCb3VZJd8STrgxWBAmqx3en38uLH7EtV6n2Ra
 QlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=u88E11qTRaeeS727pFq8p9FtYRDn2Bk8HMldpnLKr58=;
 fh=S8yiSp1PcZTmhK43kccoX1BLv2Vv1Uh+PDj5lUVA/aU=;
 b=dFg0wBY0IY7XJDpbnK3ip8AOKmwOvZeUI3c8Xa0DzNBN+qO5L1PCPd9GpjYjSD0iwF
 LU2OsBhuMyl0mFJeCfD1BfsVHtQezI/JQLrqXFsiFwTzUhOUHLpS4klMB47zZECBbO0n
 41O8ZGCSCtU0gdh3yEZ9yyFclpoyZW6gol0tAiNKA95PQAL+i1RKOvteLBgXJMbY8Odb
 NEzlXahV2exXGM6b26/o/8YJt/mkOcc80LAmdUHPdcN3SfeRn4dVzAxGjPB3Uufj+8la
 4OV1sCtrdiGiUWHtyVRX88klSGNTH0j2qypmEUibeRBy/GNTDlncQX5tK3u4WG0jnzKQ
 KBpA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790906437; x=1791511237; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=u88E11qTRaeeS727pFq8p9FtYRDn2Bk8HMldpnLKr58=;
 b=MjPTVi5QS2IznUhm92Kdep0IxHXMn1Yzi9vGInbVClvxjtxC5FG2XlaR0yNwrE+M8+
 C6dEMKniOYRpYlXTzG8YGQzAvZkrQcVJ8lvFdud3vnxsuYGiqJJT8sQCW7pUN70hLLw8
 KU8A1Uu9Ss+vszCKJ+R4bG2cAdN/6jqkpHwOWWdbldfXaHXFG9LSeaGCwkdSI2LhgY3C
 ruNEnAOVpt0r4jI58ZiaYXK0MGqXYVUptrPhy8sIVNNZjW57p+9nhmUHqRkIgK2ArrdB
 3O9OZ+/O5KsGS4NyNyghITw2G8uSKcJfcwvMTb5l4iOOi1gpdDhtoj0y07gxjKQJ9Hcv
 xI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790906437; x=1791511237;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=u88E11qTRaeeS727pFq8p9FtYRDn2Bk8HMldpnLKr58=;
 b=dPJd+vROEQ1ikEJA+SEr1jTiZgjlWD+6YfhgvnmC/cemMy6mmfL9WaYDYVMkUb+gsh
 NR/5FC1QQY8jmwrhBnBTMxqeRxNhETWZd/GNcays4k0w8sMnX1egV54623OHgLTFVLel
 abwpqY5ebZzmmzu1NxUt9YKNf8Z71OGZm+7KvRMP97aTk95VZ5XQQRtAHCqFCgpAESQr
 BxP3r1rgNu/o3Gs+OgrVSlvuRu02wFl2NceQ5r2rj3uvyM4Td6335IWKNPS2p0MKnzLq
 2dejMss9VhLZcy6W72xnnhqxCohrjJ3mRa0xvYKpQd25ehg/oILyNz4EWRcE+Wy8ED3L
 zRsQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBypRuTojQwMzfW0ymigQ+Y7tsf8gw65OxAOiavnBpg1G5H9qA1/dTNs+W9b/05KHF7SE6O1bF+Fpw==@nongnu.org
X-Gm-Message-State: AFq9FYI8/D1YQiBV8fdBKSe0zNRF8oaPkQu8BR0Ao7jolIPzzuxasL7a
 J62KsP4x6WnbDS8LV8FlSyid1UUMEsPdrFmuqjC7tkaf+vPWZM85EJuedJp7W8FABkc1V7DiTXN
 urLVYpQqDsYReiMLbAzvbaDF74kEg0Nc=
X-Gm-Gg: AYBFou0tXGQhwgUiORz7K+3YGIzRJClccPtrxidPzd2uRuHW1c01tpJ3mqO2kxj1Tvs
 Rn2q80UyerdC/wTj8mDm99q3yITWxcWHbTXgeoWIGMHy1uUkqgc/LfTtTN7i0qieumpxRNTzJQU
 cQiUQJWQ/mHNOl+PQb4Zj1KCnRBo3JwKuYN2+CEwjfgXiahp/BpJnqhxCgjkspNs23XnkHgFW6i
 jnWpnFlTuq4X3GJbfhRIeiqGxapxcqfcqHfcUEqWBxu/Rgo3Yhxw1xwTc12ZF/soMQOoiyu8QO0
 QA1YkAkEtls2Ib8NZdbljrNK5yMDopJGo+O4fZFaXg771MhEitL0mI4=
X-Received: by 2002:a05:6402:4028:b0:6aa:734b:1a29 with SMTP id
 4fb4d7f45d1cf-6af9e2ed59dmr693020a12.35.1790906437153; Thu, 01 Oct 2026
 19:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
 <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
 <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
 <ar4TQtKqfXX5Ul9O@redhat.com>
 <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
In-Reply-To: <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 2 Oct 2026 10:00:24 +0800
X-Gm-Features: AclHuK9zVq5fqZobgdjec2b2SubQy6bPhQDnvZ3JpPQ7RESILqU0zrrpRL9CTNY
Message-ID: <CAE2XoE8MriyEEeRF3uDwWgnJWPHBieK_-pD1+k0tUjROWjDpWg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
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
Received-SPF: pass client-ip=2a00:1450:4864:33::c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0c.google.com
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

On Fri, Oct 2, 2026 at 2:56=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/1/2026 11:26 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Oct 01, 2026 at 11:08:17AM -0700, Pierrick Bouvier wrote:
> >> On 10/1/2026 10:40 AM, Daniel P. Berrang=C3=A9 wrote:
> >>> Even with the current per-target binaries there are countless
> >>> devices linked in which are incompatible / not usable with
> >>> certain machine types. A new multi-target binary with a union
> >>> of all devices will just be a bigger example of a scenario that
> >>> already has to be dealt with for today's binaries.
> >>>
> >>> So if we have that assumption that we don't need to do device
> >>> filtering, at that point, a --target option doesn't have as
> >>> big of a role to play. The machine type code knows what target(s)
> >>> it wants (1 or 2 targets depending on if there are 32 + 64 bit
> >>> varaints. The CPU model the user requests (if the CPU is not
> >>> hardcoded by the machine), determines 32 bit vs 64 bit.
> >>>
> >>
> >> How can we deduce this information (bitness or target for existing
> >> machines/cpus)?
> >
> > It would require that we introduce a new field in MachineClass
> > that returned that information about what target a machine is
> > associated with.
> >
> > I note the SysEmuTarget covers both 32-bit and 64-bit variants.
> >
> > It might be better use QEMU_ARCH which correlates directly to
> > the TCG targets, rather than the traditional binary target
> > names ?
> >
> > Likely the CPU class would also want to declare its list of
> > supported targets.
> >
>
> QEMU_ARCH only represents base architectures, and not variant, so
> SysEmuTarget is the right choice.
>
> So, we would need a list of SysEmuTarget for every cpu/machine that is
> target specific, since one could be available for variants of base arch?

For this, adding TargetInfo parameter to is_avaible callback will let us ge=
t the
list of SysEmuTarget for every cpu/machine. As we can iterate on all Target=
Info
then check if that TargetInfo is present for every cpu/machine.
And indeed for devices if you want. That's what my patches are already done=
.

And also I have an idea about the set is_avaiable in an easy way. As
QOM basically
is a TREE, so for example x86_32 and x86_64 can share a same "i386"
base, all children's
is_avaiable inherent from parents is_avaiable, we can ensure every QOM
object have a
is_avaiable by update children is_avaiable from parents one.

>
> @Yonggang: can you try to provide a RFC based on this, to see what it
> could look like? No need to cover all machines/cpus, just select one of
> machine+cpu, ideally with multiple SysEmuTarget (like virt and max cpu
> for aarch64), and let's iterate from this.
>
> @Daniel: how do we deal with machines available for all targets like
> null? We would need a way to ensure all machines/cpus are tagged
> correctly, in an independent way from "available for all", without
> having to repeat all existing SysEmuTarget.
>
> >> Also, how to deal with devices that are only available for some target=
s,
> >> but not others, depending on various Kconfig knobs?
> >
> > IMHO just leave devices to raise an error when passed to '-device'
> > if not compatible with the requested machine.
> >
> > eg this example from x86 world:
> >
> >   $ qemu-system-x86_64 -M microvm -device xen-disk
> >   qemu-system-x86_64: -device xen-disk: No 'xen-bus' bus found for devi=
ce 'xen-disk'
> >
> >   $ qemu-system-x86_64 -M isapc -device virtio-net-pci
> >   qemu-system-x86_64: -device virtio-net-pci: No 'PCI' bus found for de=
vice 'virtio-net-pci'
> >
> > Hopefully most devices have sane error reporting when they
> > find a dependancy they have is not satisfied by the machine,
> > but if some end up asserting with crashes that's not a
> > blocker. Those asserts can be turned into pretty error
> > messages at our leisure by whomever cares about improving
> > error diagnosis.
> >
>
> Fine for me. I am a bit skeptical this will be possible to catch all
> issues, but let's try!
>
> So, for existing binary: -M virt works as before.
>
> For new multi binary:
> $ qemu-system -M virt:
> Multiple machines were found, select one among:
> - aarch64-virt
> - riscv64-virt

This would be very hard, that means QOM must be initialized. but we need
ensure the target is selected before the QOM init. it's the current
qemu_init workflow
A possible solution with add TargetInfo parameter on is_avaible is
that we can listing
all machines that named with virt, and listing which targets support
"virt". For example

$qemu-system -M virt:
Multiple machines were found, select one among:
-target aarch64 -M virt
-target riscv64 -M virt

As for qemu-system -M virt:, default to none target. That means all
machines are registered
into QOM, so we can list all machines. to help us identify which
targets that those
machines belongs to

>
> Does it matches what you would expect?
>
> Also, for compatibility with existing binaries, should we accept -M
> $arch-virt also? I feel like it does not hurt and would make thing
> simpler to switch between existing and new binary.

Same reason -M $arch-virt, indeed like -M $arch:virt,  but $arch-virt
would be even harder.
Because "-" is a valid separator in machine names, ":" is not a valid
machine name.
So without init QOM, we can not reliably identify "$arch-virt" belongs
to which target.

>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

