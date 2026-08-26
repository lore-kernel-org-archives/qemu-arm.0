Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F78C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 14:50:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzExK-0001xi-W1; Wed, 26 Aug 2026 10:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzExK-0001xJ-3v
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 10:50:22 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzExF-0007Zo-EW
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 10:50:21 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6a5ded53570so1759176a12.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 07:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787755815; cv=none;
 d=google.com; s=arc-20260327;
 b=P91qb11YlQbjANXy19e7eYvsPrxWcxEvxcUS4YCYnxtE1TIX5U4Tbw5ztK7IqtJN09
 17FCESzFvcnEhXmC+zGxei8KH06cBs8Bg6EKsFu+QEmYl2skAvOh0QRyZhc0mEVL4sJH
 Jmhdz8yqF+mJ6txy75T9pIRh7t42+z4T2R4xjZWKzgXvqshrI7ST/3C+KISMijB+5UM+
 2QsBbEZXGrQLf9X6Ll0YTtNtmUaEYUYan2yqf/JlmBwS+S5ICbCGmraX36vso3YLmWEU
 7s+wdzWFqEyvir5ZFtbqAijfvphRhTeiSwLBuZMIWc52pe3WE6EHv2dsDYC2foo8eN70
 B0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jhXEmhxBTNPgEuERuoabZDXRBbWJgledSUYNexn8Ch0=;
 fh=XOzKq0mIfmgqnDGu+0ntV5kfKsFC6n89aDqo4VmmTBg=;
 b=SOv37+WbJABxCp/ni5D4h2rHxav26f7SQ7XM+R6DHYYu84323MkNaRjwiSCunjFjYW
 jp5HNCnDTSa/+YL5njOXzSHVM1UgFARyepxMztl0P0Cb3l8OqmTmbKEZlIWI3yOcpQuX
 saTxvI95mFmZaRU5PcWH4zVclufLumbsF41pB0LhiAkrompWCgMDzKWUemnQbry2TjOt
 LSeKVW5EyO+Eb299lHaHf29U3jBcAdFl30AEs6u4WYY0QgYObuEivBge1BP9YL4eD+5E
 n/hEGs/klEj+oVyH0h2mRjLcXNOjn3NFCj0murrxVbxkEZ7pmkATJdIdlxIwFeP9Vn4V
 5rqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787755815; x=1788360615; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jhXEmhxBTNPgEuERuoabZDXRBbWJgledSUYNexn8Ch0=;
 b=pgfVxEb7neX5ETPgqZ6AFDoNlMdP72NpYJlQlU7ECJqua+RdRxrofvo9/d/vDf8EcL
 HS43obPxC64BeeKGTiaUEWFX7XxzADENVJy9VhTJYO35vv6NKCVhPq+PrSh96+9Mej6T
 XFvNVpMEvIXd/W7K14aJj7ll+Pm1cSsdEdqz2OA3rfW7tBrD987eKCQRv7LLoECHRdVh
 WX6nU4megugAh46l7uP2sttT+HSJJoyV9F3K/q5TEgu9eEL5OZtvbNeTqMzloDNhi6RK
 74D+/3DP1/Ze2TFmvtr83kCg69YjZxPkawsIxV/CbrlHf2sYptyXP1MmzeTrpTTgqSv1
 2KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787755815; x=1788360615;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jhXEmhxBTNPgEuERuoabZDXRBbWJgledSUYNexn8Ch0=;
 b=pQM60keFQrIpjYwRzJTodXSHRNEgqKBNPHepOH8p/BJnXEY36MjAir2EE6bohTHDGm
 XVPlFJnISD0Ne+GSK3vzD4DgQFe2+sx51vSFQMSrtcjxxS3zT3Ay3aGkCcsY3TXMHNhE
 /IzBhnrQRMwOkeL7cjjtCrjfGPRr0eEBGmrJ6YMcTwdwJe2UoOtxq36vVgWWF6W+zzHv
 l7PEHAI/E/1kPA2GxRfJOwqaDOdtcKteKSBCryafERm8qC40nUjsXpXY0k8yz2/tHqCr
 2aouSnRDBgMPX03csj1WIfZlK2epuq7suuyuDfddLJAMFFcfcCk9kPAncYgt8B+NQwOQ
 b7fw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpZZMHXwsPdbziqmCO1SG/+UutS8HfLK/mIc8LueQaA2aA10c1jd6jIbh2COa3c4tiFlbIOKeQghw==@nongnu.org
X-Gm-Message-State: AFuF++l2FXDNXuxJYZB1clwEadRuyE/qeAkFqvaeSq3XMDlUEhHyDbHC
 yzAcxuzlEQCSccZnjCUAl0rY2+4js+5wyoyhwECX7NORkm7WaFssuA9rQBxUwg3/cIS1im/t/ou
 PoUS2k7ytzFViNSdvddC6hW12TAw8xN4=
X-Gm-Gg: AR+sD12zeyuZiTsMtR0eYs4ju7H3TNRBh2jtHjaUZWWgtNdm4DsmbqRlZSdkME/ZI6G
 OWkg2LGvzX61RazOpnwE1peDZBKaTdbTjDkmYnvQ/dJ5T4rtwFQq502nlB4xMQPZhlr1JbpeYz9
 JdPCO98xF7F7tAPXWluk041tVd6HlqjqT9jwihy3oCIeMoEEprz7YLsnd7fhEwM3GdWyP5ATkw8
 kSlDw7uvPuqksQKMmWDTn71TMbe9EilkDJOy+bHL49VbriGu49/ekZGWXiIZE32k9ZBAFvZjaMb
 hvUl1A1p22dAYyLePAv+p/3pqXvSh3AxTY/orGnEu1V9
X-Received: by 2002:a17:907:1c84:b0:c24:bf0b:6b62 with SMTP id
 a640c23a62f3a-c250bb05c1cmr712141266b.4.1787755814408; Wed, 26 Aug 2026
 07:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao7c-FiawF9sMCGj@redhat.com>
 <392d0652-2d06-4889-8b67-c199e59bd314@nutanix.com>
In-Reply-To: <392d0652-2d06-4889-8b67-c199e59bd314@nutanix.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 26 Aug 2026 22:50:01 +0800
X-Gm-Features: AcwNN1XsGorm7YtTmyNPNuqbUwv3DlmuK4C6hxozOcE4hdWxLv5l-T2KNGgK03Y
Message-ID: <CAE2XoE82jR0rRCJFEqB4vvULCV0gQrcGeHPQAOPRvNEadjPZvg@mail.gmail.com>
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Xianglai Li <lixianglai@loongson.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-s390x@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Fabiano Rosas <farosas@suse.de>, Aurelien Jarno <aurelien@aurel32.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000004367eb0659f45685"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000004367eb0659f45685
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 9:41=E2=80=AFPM Mark Cave-Ayland <
mark.caveayland@nutanix.com> wrote:
>
> On 26/08/2026 13:32, Daniel P. Berrang=C3=A9 wrote:
>
> > On Sun, Aug 23, 2026 at 11:07:18PM +0800, Yonggang Luo wrote:
> >
> > snip,
> >
> > ..to comment just on the end result for now..
> >
> >> The last patch builds qemu-system (and qemu-systemw on Windows) from
> >> aarch64 common/system objects plus RISC-V arch objects, and installs
> >> qemu-system-{arm,aarch64,riscv32,riscv64} as symlinks so argv[0] still
> >> selects TargetInfo.
> >>
> >> Examples:
> >>
> >>    qemu-system -target aarch64 -M virt ...
> >>    qemu-system-riscv64 -M virt ...
> >>
> >> A basename that matches no registered token falls through to the uniqu=
e
> >> default. A combined binary with no suffix requires -target when more
> >> than one default TargetInfo is registered.
> >
> > In testing and comparing  the new qemu-system-riscv64 symlink
> > to qemu-system vs the current standalone qemu-system-riscv64
> > binary there are some significant user visible changes.
> >
> > The simplest is 'qom-list-types' went from reporting approx
> > 770 classes, to reporting approx 1530 classes. IOW, the
> > qemu-system-riscv64 binary is now reporting supporting for
> > all the classes that were unique to arm.
> >
> > The '-device help' output similarly shows a great many more
> > devices
> >
> > TL;DR introspecting qemu-system-riscv64 is no longer accurate
> > wrt riscv64 capabilities.
> >
> > This is not suprising, since we register all TypeInfo meaning
> > we get all QOM classes present. Some of Pierricks patches try
> > to filter places which iterate over classes, but this does not
> > have full coverage.
> >
> >
> > I think this is probably also what leads to the increased RAM
> > usage in qemu-system-riscv64. Starting
> >
> >    qemu-system-riscv64 -nodefaults -display none -M none
> >
> > shows an increase in RAM usage from  17.3 to 20.7 MB which
> > is about 15% increase. NB this is dirty, private RAM per
> > process. The shared RAM pages also increase but that's not
> > a concern since they're common to all QEMU processes.
> >
> > qemu-system-aarch64 shows a much smaller RAM increase, since
> > it only grew from 1430 classes to 1530 classes.
> >
> > We have many more target though, so if we assume the end
> > point where every single target is unified, the the union
> > of all classes for all targets comes to approx 3600.
> >
> > My guesstimate is that would mean a memory increase for
> > qemu-system-riscv64 from 17.3 to 39.9 MB, which is a
> > 72% increase.
> >
> > In absolute terms this is still modest, but for deployments
> > with large VM counts  and small RAM sizes, that gets to be
> > significant.
> >
> >
> > None of this means single binary is a bad idea.
> >
> >
> > My main takeaway is that we're creating uneccessary work
> > for ourselves by trying to make 'qemu-sytem' identical
> > in behaviour to qemu-system-$TARGET.
> >
> > The complex filtering patches / QOM interfaces that I
> > found uncomfortable in Pierrick's base series are largely
> > around the filtering needed to simulate qemu-system-$TARGET,
> > and they're still incomplete. I don't have high confidence
> > in our ability to avoid regressions if we go route this
> > route.
> >
> >
> > IMHO we should make a clean break with the past. Leave
> > the existing qemu-system-$TARGET binaries being built
> > from the same pieces they are today, such that there
> > is better confidence that we are not making behavioural
> > changes to them.
> >
> >
> > qemu-system should be built alongside qemu-system-$TARGET
> > and offer new semantics where it is documented as exposing
> > everything from all targets whenever introspected and does
> > not apply target type or target Kconfig filtering to inputs/
> > outputs.
> >
> > We still get the benefit of only building most  .o files
> > once, so keeping qemu-system-$TARGET is only a small
> > overhead in the final step of linking everything together.
> >
> >
> > qemu-system will still have the increased memory overhead
> > but that's fine as qemu-system-$TARGET will be unaffected.
> > We can tackle the memory overhead of qemu-system at our
> > leisure through use of loadable modules, and thus not have
> > that as a task to think about today.
> >
> >
> > With the clean break with the past, we also have the
> > ability to tackle various long standing design mistakes
> > present in qemu-system-$TARGET instead of carrying them
> > over into the new binary.
> >
> > Specifically
> >
> >   * -nodefaults should become the default
> >
> >   * All CLI args should be processed in order from
> >     the command line, so we eliminate the nonsense
> >     where we process some -object, then -chardev,
> >     then more -object through hand crafted deps
> >
> >   * No default machine type
>
> I would even go as far as to suggest that we should make modules

This is also why I post these patches, i've already enabled better modules
support, so we can implement devices in dll(win32/linux/osx) all works.
I achieve that by introducing a new plugin and getting the memory to be
more configable. so that we can bind the device to dma-memory by option,
not by link.


> mandatory for qemu-system, so that devices can be loaded upon demand
> during machine construction to help keep the size down.
>
> I'll leave whether that is through dependency tracking or via an
> explicit load directive for someone else to decide :)
> >   * Drop all legacy syntax so we only have a single
> >     QAPI based way of configuring.
> >     eg drop -hda, -hdb, -cdrom, -drive, etc
> >        only keeping -blockdev
> >     eg drop -mon, -monitor, -qmp, etc only
> >        keeping -object
>
> The only problem with this is that I often get a lot of complaints that
> QEMU command lines are complicated from retro folks who just want to run
> their favourite old games. Why would they want to come up with a
> long-winded -drive command line when they can just use -hda instead?
>
> > We don't have to do all that straightaway. If we declare
> > qemu-system "experimental" initially we can iterate on
> > that intentionally breaking compat in releases, without
> > any impact on qemu-system-$TARGET.
> >
> > Avoiding the back compat task will give us more flexibility
> > with the follow on work when people come to create new
> > machine types with heterogenous CPU targets.
> I agree that this is a good opportunity to explore new things without
> being tied to past decisions.
>
>
> ATB,
>
> Mark.
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000004367eb0659f45685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Aug 26, 2026 at 9:41=E2=80=AFPM Mark Cave-=
Ayland &lt;<a href=3D"mailto:mark.caveayland@nutanix.com">mark.caveayland@n=
utanix.com</a>&gt; wrote:<br>&gt;<br>&gt; On 26/08/2026 13:32, Daniel P. Be=
rrang=C3=A9 wrote:<br>&gt;<br>&gt; &gt; On Sun, Aug 23, 2026 at 11:07:18PM =
+0800, Yonggang Luo wrote:<br>&gt; &gt;<br>&gt; &gt; snip,<br>&gt; &gt;<br>=
&gt; &gt; ..to comment just on the end result for now..<br>&gt; &gt;<br>&gt=
; &gt;&gt; The last patch builds qemu-system (and qemu-systemw on Windows) =
from<br>&gt; &gt;&gt; aarch64 common/system objects plus RISC-V arch object=
s, and installs<br>&gt; &gt;&gt; qemu-system-{arm,aarch64,riscv32,riscv64} =
as symlinks so argv[0] still<br>&gt; &gt;&gt; selects TargetInfo.<br>&gt; &=
gt;&gt;<br>&gt; &gt;&gt; Examples:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; =C2=A0=
 =C2=A0qemu-system -target aarch64 -M virt ...<br>&gt; &gt;&gt; =C2=A0 =C2=
=A0qemu-system-riscv64 -M virt ...<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; A base=
name that matches no registered token falls through to the unique<br>&gt; &=
gt;&gt; default. A combined binary with no suffix requires -target when mor=
e<br>&gt; &gt;&gt; than one default TargetInfo is registered.<br>&gt; &gt;<=
br>&gt; &gt; In testing and comparing =C2=A0the new qemu-system-riscv64 sym=
link<br>&gt; &gt; to qemu-system vs the current standalone qemu-system-risc=
v64<br>&gt; &gt; binary there are some significant user visible changes.<br=
>&gt; &gt;<br>&gt; &gt; The simplest is &#39;qom-list-types&#39; went from =
reporting approx<br>&gt; &gt; 770 classes, to reporting approx 1530 classes=
. IOW, the<br>&gt; &gt; qemu-system-riscv64 binary is now reporting support=
ing for<br>&gt; &gt; all the classes that were unique to arm.<br>&gt; &gt;<=
br>&gt; &gt; The &#39;-device help&#39; output similarly shows a great many=
 more<br>&gt; &gt; devices<br>&gt; &gt;<br>&gt; &gt; TL;DR introspecting qe=
mu-system-riscv64 is no longer accurate<br>&gt; &gt; wrt riscv64 capabiliti=
es.<br>&gt; &gt;<br>&gt; &gt; This is not suprising, since we register all =
TypeInfo meaning<br>&gt; &gt; we get all QOM classes present. Some of Pierr=
icks patches try<br>&gt; &gt; to filter places which iterate over classes, =
but this does not<br>&gt; &gt; have full coverage.<br>&gt; &gt;<br>&gt; &gt=
;<br>&gt; &gt; I think this is probably also what leads to the increased RA=
M<br>&gt; &gt; usage in qemu-system-riscv64. Starting<br>&gt; &gt;<br>&gt; =
&gt; =C2=A0 =C2=A0qemu-system-riscv64 -nodefaults -display none -M none<br>=
&gt; &gt;<br>&gt; &gt; shows an increase in RAM usage from =C2=A017.3 to 20=
.7 MB which<br>&gt; &gt; is about 15% increase. NB this is dirty, private R=
AM per<br>&gt; &gt; process. The shared RAM pages also increase but that&#3=
9;s not<br>&gt; &gt; a concern since they&#39;re common to all QEMU process=
es.<br>&gt; &gt;<br>&gt; &gt; qemu-system-aarch64 shows a much smaller RAM =
increase, since<br>&gt; &gt; it only grew from 1430 classes to 1530 classes=
.<br>&gt; &gt;<br>&gt; &gt; We have many more target though, so if we assum=
e the end<br>&gt; &gt; point where every single target is unified, the the =
union<br>&gt; &gt; of all classes for all targets comes to approx 3600.<br>=
&gt; &gt;<br>&gt; &gt; My guesstimate is that would mean a memory increase =
for<br>&gt; &gt; qemu-system-riscv64 from 17.3 to 39.9 MB, which is a<br>&g=
t; &gt; 72% increase.<br>&gt; &gt;<br>&gt; &gt; In absolute terms this is s=
till modest, but for deployments<br>&gt; &gt; with large VM counts =C2=A0an=
d small RAM sizes, that gets to be<br>&gt; &gt; significant.<br>&gt; &gt;<b=
r>&gt; &gt;<br>&gt; &gt; None of this means single binary is a bad idea.<br=
>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; My main takeaway is that we&#39;re cre=
ating uneccessary work<br>&gt; &gt; for ourselves by trying to make &#39;qe=
mu-sytem&#39; identical<br>&gt; &gt; in behaviour to qemu-system-$TARGET.<b=
r>&gt; &gt;<br>&gt; &gt; The complex filtering patches / QOM interfaces tha=
t I<br>&gt; &gt; found uncomfortable in Pierrick&#39;s base series are larg=
ely<br>&gt; &gt; around the filtering needed to simulate qemu-system-$TARGE=
T,<br>&gt; &gt; and they&#39;re still incomplete. I don&#39;t have high con=
fidence<br>&gt; &gt; in our ability to avoid regressions if we go route thi=
s<br>&gt; &gt; route.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; IMHO we should=
 make a clean break with the past. Leave<br>&gt; &gt; the existing qemu-sys=
tem-$TARGET binaries being built<br>&gt; &gt; from the same pieces they are=
 today, such that there<br>&gt; &gt; is better confidence that we are not m=
aking behavioural<br>&gt; &gt; changes to them.<br>&gt; &gt;<br>&gt; &gt;<b=
r>&gt; &gt; qemu-system should be built alongside qemu-system-$TARGET<br>&g=
t; &gt; and offer new semantics where it is documented as exposing<br>&gt; =
&gt; everything from all targets whenever introspected and does<br>&gt; &gt=
; not apply target type or target Kconfig filtering to inputs/<br>&gt; &gt;=
 outputs.<br>&gt; &gt;<br>&gt; &gt; We still get the benefit of only buildi=
ng most =C2=A0.o files<br>&gt; &gt; once, so keeping qemu-system-$TARGET is=
 only a small<br>&gt; &gt; overhead in the final step of linking everything=
 together.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; qemu-system will still ha=
ve the increased memory overhead<br>&gt; &gt; but that&#39;s fine as qemu-s=
ystem-$TARGET will be unaffected.<br>&gt; &gt; We can tackle the memory ove=
rhead of qemu-system at our<br>&gt; &gt; leisure through use of loadable mo=
dules, and thus not have<br>&gt; &gt; that as a task to think about today.<=
br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; With the clean break with the past, =
we also have the<br>&gt; &gt; ability to tackle various long standing desig=
n mistakes<br>&gt; &gt; present in qemu-system-$TARGET instead of carrying =
them<br>&gt; &gt; over into the new binary.<br>&gt; &gt;<br>&gt; &gt; Speci=
fically<br>&gt; &gt;<br>&gt; &gt; =C2=A0 * -nodefaults should become the de=
fault<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0 * All CLI args should be pro=
cessed in order from<br>&gt; &gt; =C2=A0 =C2=A0 the command line, so we eli=
minate the nonsense<br>&gt; &gt; =C2=A0 =C2=A0 where we process some -objec=
t, then -chardev,<br>&gt; &gt; =C2=A0 =C2=A0 then more -object through hand=
 crafted deps<br>&gt; &gt;<br>&gt; &gt; =C2=A0 * No default machine type<br=
>&gt;<br>&gt; I would even go as far as to suggest that we should make modu=
les<div><br></div><div>This is also why I post these patches, i&#39;ve alre=
ady enabled better modules support, so we can implement devices in dll(win3=
2/linux/osx) all works.</div><div>I achieve that by introducing a new plugi=
n and getting the memory to be more configable. so that we can bind the dev=
ice to dma-memory by option, not by link.</div><div><br></div><div><br>&gt;=
 mandatory for qemu-system, so that devices can be loaded upon demand<br>&g=
t; during machine construction to help keep the size down.<br>&gt;<br>&gt; =
I&#39;ll leave whether that is through dependency tracking or via an<br>&gt=
; explicit load directive for someone else to decide :)<br>&gt; &gt; =C2=A0=
 * Drop all legacy syntax so we only have a single<br>&gt; &gt; =C2=A0 =C2=
=A0 QAPI based way of configuring.<br>&gt; &gt; =C2=A0 =C2=A0 eg drop -hda,=
 -hdb, -cdrom, -drive, etc<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0only kee=
ping -blockdev<br>&gt; &gt; =C2=A0 =C2=A0 eg drop -mon, -monitor, -qmp, etc=
 only<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0keeping -object<br>&gt;<br>&g=
t; The only problem with this is that I often get a lot of complaints that<=
br>&gt; QEMU command lines are complicated from retro folks who just want t=
o run<br>&gt; their favourite old games. Why would they want to come up wit=
h a<br>&gt; long-winded -drive command line when they can just use -hda ins=
tead?<br>&gt;<br>&gt; &gt; We don&#39;t have to do all that straightaway. I=
f we declare<br>&gt; &gt; qemu-system &quot;experimental&quot; initially we=
 can iterate on<br>&gt; &gt; that intentionally breaking compat in releases=
, without<br>&gt; &gt; any impact on qemu-system-$TARGET.<br>&gt; &gt;<br>&=
gt; &gt; Avoiding the back compat task will give us more flexibility<br>&gt=
; &gt; with the follow on work when people come to create new<br>&gt; &gt; =
machine types with heterogenous CPU targets.<br>&gt; I agree that this is a=
 good opportunity to explore new things without<br>&gt; being tied to past =
decisions.<br>&gt;<br>&gt;<br>&gt; ATB,<br>&gt;<br>&gt; Mark.<br>&gt;<br><b=
r><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=
=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>=
Yonggang Luo</div></div>

--0000000000004367eb0659f45685--

