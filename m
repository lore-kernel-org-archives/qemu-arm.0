Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EA3CA5FC4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 16:28:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCg7L-0003MG-DN; Fri, 02 Oct 2026 12:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCg6Z-0003JN-Jq
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 12:27:30 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCg6W-00066P-55
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 12:27:27 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a9984f9adcso196884a12.0
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 09:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790958442; cv=none;
 d=google.com; s=arc-20260327;
 b=S/cJ9NY6ezqH2eJqJd8C6G5t+z2Fv0LxdxH/LekP9Bfjo9qerj3Yy6KlbtSb3GJenL
 QgMOujk2WZarPc8nvtws8jzxghCXpaQ81V/OLZWBfGP9FcLRq9djMkYJLI6XbWRdP4+z
 eHQLu/Tr7zTlavzwaQEyme0jdMyn2P4B7hK3K9egeZuyYXNZAcXEIhzTs0+I3fYyxb5T
 uXGzQ7p0jCYFPZ2eAggZczBL+rDL4QGf/MHCJRB2sAYYdIK6b+Mx4LVqafyaIZrHI82z
 T+vnDf0/UCLwz4/fm/0CVviMtmHo1dZP9E9RiDf2IBqideeFTvnKmqklFIhtWX/S+TMH
 sx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=peMKe2H+kWnPsXGNlX5mN1i85vEZd8GSwE4Yub6BjpA=;
 fh=P7y1OoNNsfbP5beyXJ07Kk9T4QmkiWZvpJzfX1vb+SM=;
 b=BhDvVgMk8gh+HQz4/Oyz65U2WrO9UI1wqaDtqifSjqGKfGo+m3jiv6iI1stqRsSI5C
 ntlZBuWdOM9gDfpByb47apzslNhkrSHGUVTqAqLei/Qtm53/YsfmjFMCupLVnhpRIJXt
 wAH8L7VhgPChPcrAr4xHGxMlisvdGkQgQIVX1MwIX/aJgbsp441DDRZZxSoSrrqMSwFl
 VrW0Nhf9ixe/02b+xCLAZ50OmEuU1YBZ/WkeTpvrQmjvnILtv4xTCc2bOmeFniI97HRH
 kGWFXzeX30KtAfJasDqedBfgDYjdonO6bsEibJF18vleIz5gHgaemF7Hd3wUqRa3l3v0
 yq/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790958442; x=1791563242; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=peMKe2H+kWnPsXGNlX5mN1i85vEZd8GSwE4Yub6BjpA=;
 b=jnHCniX27E/CVyW9wxHOnOu44LVRMH8OuapQkBzjrO+sGUTNstg5BN3eNr80svkj7O
 gtjL0ICzf7IisfuSPFhoWNxJf3d7XgvMZFP+Vwwvuq8tqZl8VRttvS8u9hpF23KacaFM
 IjMflONkc81grL2xmrDPHlqplPjvkN72I2GFRdUb3ZMsSCNTO+0aN3yDX4fLjJpenGsU
 hfcYYxhTlbrB75sEh3ZF3l+nc7/94BkLX6C2FQLKso5lE1iQ7qVX8ZleFFwdRf0620LS
 ++fRB9UKfff6opCPES92zr5X0MxeonoGLT8PaE4ZrW1nEzhPvQXKcVQHYTjSVXPyiYe6
 mThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790958442; x=1791563242;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=peMKe2H+kWnPsXGNlX5mN1i85vEZd8GSwE4Yub6BjpA=;
 b=IFkk5YdUkLc2v8V/gJBDIY7tTV1UrSFWk23brzZbUV9vzR2LF9mQU/Xd18wjoE2t9a
 ZmWX3qRY2tW/0vr1dB2RPuiDTCFFYFhsLHDS8BrvXp3+2LqJfqN0r2xLwG0p3iMW5lJL
 W1+IfJ+/IJ5al7qRxa8UmrNIAqbcH5xp1VBy83utuuLv7Ulalf7BoxlWZtCpPYesusSV
 ececELMZRGCbYC3Px+ZjnygbsftgPCWj5XwB6wIyuj9qz7UyaaE8qb1WymmplzJt1ESE
 hk/Dt9ajBWriqY20U7OkA9pCdI4fDqpOgXWJyC0ZWAte9g1sO7lQHaSHPllZBpsvn800
 REqw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxqZpvudjI6ebLPtyBsq6q+G60dwUNHQd/WN81HoClnczx+D6Uwok9WDcW81XDuDQy8UGogN0YHSw==@nongnu.org
X-Gm-Message-State: AFq9FYJWrKLDwRJmgr7Mpw07XJVbPULrEGlYBTK8gkI3ALyQq1BycI1S
 Ubx9NJrYW7ZMKIaRvqLZr+dITZE2e24cs9TaYLD8Ix+h8kN2dxVNeHMn1Y0AEcmKl+w0Mgbz/SG
 Zb2P9VkBG8DBxmgaTcaqre6fI7FvGrAY=
X-Gm-Gg: AYBFou3UYUcz8E8xAzwoPoU5NA0ghDyXuI9fcCAglJl0j7sgA7at3UFK6OL6g0UfZbe
 kxK8nidbALxVz5l2X46QnqfyxFAKhSWMYR4Wu/E+BoCjRcWxEKosoGMADidNSuwfeWKMbicwnkQ
 6KhklmOW/Vc/+fBOCLkpC5VP/K0QMy4skX+ac1mGff1nDEZj26fq6q//gSUpcAyRJZRpq2bass/
 IN0YlWs+qS6nfuBj/bkw6zQp5KrJzZLg1hZDF4+ibuBed0U0tmF546ZKMwiJaRhqFUqlYOENUdr
 ++pZ/DGblMDfHknGeNW0QURz7Lguazuua+JaLyfYbkKDtMekzyZVCOI=
X-Received: by 2002:a05:6402:5489:b0:6ae:1504:5ba with SMTP id
 4fb4d7f45d1cf-6af9e3494e8mr1993474a12.30.1790958441563; Fri, 02 Oct 2026
 09:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
 <ar4TQtKqfXX5Ul9O@redhat.com>
 <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
 <ar_YVfWv9EWHKVD6@redhat.com>
In-Reply-To: <ar_YVfWv9EWHKVD6@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 3 Oct 2026 00:27:08 +0800
X-Gm-Features: AclHuK8c8OAASzjAb1EqWfCxmwT4dQBHnfXnOggKEv3DA61aXMgQhI_-9CyiivA
Message-ID: <CAE2XoE9o3o6KUZyvBgSqEL14ahVp1SmFAVp1j_C5K8pVE9dRog@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x10.google.com
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

On Sat, Oct 3, 2026 at 12:14=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Thu, Oct 01, 2026 at 11:56:13AM -0700, Pierrick Bouvier wrote:
> > On 10/1/2026 11:26 AM, Daniel P. Berrang=C3=A9 wrote:
> > > On Thu, Oct 01, 2026 at 11:08:17AM -0700, Pierrick Bouvier wrote:
> > >> On 10/1/2026 10:40 AM, Daniel P. Berrang=C3=A9 wrote:
> > >>> Even with the current per-target binaries there are countless
> > >>> devices linked in which are incompatible / not usable with
> > >>> certain machine types. A new multi-target binary with a union
> > >>> of all devices will just be a bigger example of a scenario that
> > >>> already has to be dealt with for today's binaries.
> > >>>
> > >>> So if we have that assumption that we don't need to do device
> > >>> filtering, at that point, a --target option doesn't have as
> > >>> big of a role to play. The machine type code knows what target(s)
> > >>> it wants (1 or 2 targets depending on if there are 32 + 64 bit
> > >>> varaints. The CPU model the user requests (if the CPU is not
> > >>> hardcoded by the machine), determines 32 bit vs 64 bit.
> > >>>
> > >>
> > >> How can we deduce this information (bitness or target for existing
> > >> machines/cpus)?
> > >
> > > It would require that we introduce a new field in MachineClass
> > > that returned that information about what target a machine is
> > > associated with.
> > >
> > > I note the SysEmuTarget covers both 32-bit and 64-bit variants.
> > >
> > > It might be better use QEMU_ARCH which correlates directly to
> > > the TCG targets, rather than the traditional binary target
> > > names ?
> > >
> > > Likely the CPU class would also want to declare its list of
> > > supported targets.
> > >
> >
> > QEMU_ARCH only represents base architectures, and not variant, so
> > SysEmuTarget is the right choice.
> >
> > So, we would need a list of SysEmuTarget for every cpu/machine that is
> > target specific, since one could be available for variants of base arch=
?
>
> Ok
>
> > @Daniel: how do we deal with machines available for all targets like
> > null? We would need a way to ensure all machines/cpus are tagged
> > correctly, in an independent way from "available for all", without
> > having to repeat all existing SysEmuTarget.
>
> Or could the 'none' machine simply report '0xffffffff' for the
> list of targets so it includes everything today & in the future,
> or specialize "0" to mean everything ?
I think for is_avaible give a
bool target_is_any(const TargetInfo *ti)
{
    (void)ti;
    return true;
}
is enough. then we iterate the target list we will found every target
support for it.



>
>
> > > eg this example from x86 world:
> > >
> > >   $ qemu-system-x86_64 -M microvm -device xen-disk
> > >   qemu-system-x86_64: -device xen-disk: No 'xen-bus' bus found for de=
vice 'xen-disk'
> > >
> > >   $ qemu-system-x86_64 -M isapc -device virtio-net-pci
> > >   qemu-system-x86_64: -device virtio-net-pci: No 'PCI' bus found for =
device 'virtio-net-pci'
> > >
> > > Hopefully most devices have sane error reporting when they
> > > find a dependancy they have is not satisfied by the machine,
> > > but if some end up asserting with crashes that's not a
> > > blocker. Those asserts can be turned into pretty error
> > > messages at our leisure by whomever cares about improving
> > > error diagnosis.
> > >
> >
> > Fine for me. I am a bit skeptical this will be possible to catch all
> > issues, but let's try!
>
> I'm confident that we will find badly behaviour devices,
> but we don't need to fix it all upfront, and they would
> arguably be considered buggy already today.
>
> > >>> A --target option (or similar -machine name,target=3Dxxx) could
> > >>> be used to dis-ambiguate between 'virt' machines if keeping
> > >>> their user facing machine names as-is, or it could be used as
> > >>> a way to be more explicit about the 32-bit vs 64-bit choice
> > >>> and sanity checked against the CPU model choice.
> > >>>
> > >>
> > >> We could also not register them as virt if more than one target is
> > >> detected, so people have to call explicitly aarch64-virt.
> > >> Would that be a possible way to move forward?
> > >
> > > Yes, we could diverge in the naming of the machines for the
> > > existing binary, vs the new multi-binary, and that could well
> > > be the sanest & simplest option in fact.
> > >
> >
> > So, for existing binary: -M virt works as before.
>
> Yes.
>
>
> > For new multi binary:
> > $ qemu-system -M virt:
> > Multiple machines were found, select one among:
> > - aarch64-virt
> > - riscv64-virt
> >
> > Does it matches what you would expect?
>
>
> One idea I had was that when define the 'virt' class type we could
> have a way to identify whether it is linked into the traditional
> binaries, or linked into the multi-target binary, and from
> that choose what name to register it under. eg
>
>   "extern bool multi_target;"

This idea already resolved,  see commit
https://gitlab.com/lygstate-qemu/qemu/-/commit/3342c04451bb21174e6bd53a7040=
e4929008b9d0
The idea is
bool target_combined_binary(void)
{
    return true;
}
for multi-target binary, and stub for single-target binary
for single-target binary
bool target_combined_binary(void)
{
    return false;
}

>
> and have two .c files, one setting it 'true' and one 'false',
> and link each to the respective binaries. So we know statically
> before main() has even run, what mode this binary is intended
> to operate in.
>
> > Also, for compatibility with existing binaries, should we accept -M
> > $arch-virt also? I feel like it does not hurt and would make thing
> > simpler to switch between existing and new binary.
>
> Yes, that's another viable option. Always register '$arch-virt' and
> only register 'virt' for traditional binaries.
Oh, I see, for single-target binary, the "virt" is QOM name, and for
multi-target binary.
"$arch-virt" is the QOM name? So this series needs to consider this. made s=
ense.
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

