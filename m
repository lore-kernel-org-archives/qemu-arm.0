Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F971C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 16:55:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyuQy-0007WZ-NF; Tue, 25 Aug 2026 12:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wyuQx-0007Ve-Bj
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 12:55:35 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wyuQs-00074r-KV
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 12:55:33 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-836f34a0ceaso102737b3.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 09:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787676925; cv=none;
 d=google.com; s=arc-20260327;
 b=QHmD4KZYbCNtgn/3XN/nV/1HMVwGK3n66PpyIm1CT6xZxpjguekYWPjaDKOapivAw3
 M+rsotqX0kT/71od7nDxOVY+CISZB0q3ydmu+Sh0gzj6UF7MVylgkc/AUKGFYhdGpg/r
 imJr+XnSBP6mItdTb2Qge3ZshBuGQP3rypnQzeMPq3eg2XZvA136r3pyCfl8IB8Jn41d
 sgr38GGUm4Enj3iSEsaMUPVU14+R4aOX6c13q3DbxMkCbHJP9B4xfui0AJNZ9x7DCWhi
 97a9/BwdTBi4h18/dQGnMcGsaXMD0gfKGhVCf1xAcEN+lieBiy+Z/xI4GeSjSjZj3XiL
 1FmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0PGKUcpisL/PdVjbCIBj9taleCgb4geVsx0pZw5E3b0=;
 fh=/PMsoCTxDttlih5V0KXAyvS/vhaRCvwphV0pR4rPkyM=;
 b=X8lDu8YZVFe0EwLZqNEo+m8ZW6CGzuXEALOnTYfWSatvmMbq0E6dMADh5TKAhK3tBm
 z8GGXPff67dnnVs9R8BnJbVBY4hrJgg2mU/CL9P1blCckV9yRcStWiAWUlxSSVCiqgiR
 IdexbYJ6hRcMgf7wlwnOTB5f0HCXfAB0gLtMr0f7zbMS3dTjUn5IAKaQK6h1KeWb/U/y
 QuGg/I6wC7HM0xWw84i7dy4s8712QJ2OwlYVpgQgBwXa9f1tSrZi7sKY1U4G18nMIBnK
 L+ZPvSaC+i66GsTWWES2KPIHPTXM2lVbfL33p8YdFFTDbZZCbpFhJYFMHA+712QBkORA
 mMzg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787676925; x=1788281725; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0PGKUcpisL/PdVjbCIBj9taleCgb4geVsx0pZw5E3b0=;
 b=aqXc2a5bbAivHOjMse/rWLaE8J+/HniBJpk+4Xft1aOae3fpCwHmYUBcMFXgkFTsoQ
 Cy6N76XE95LzTe0gXjugPyDow+fjE6soUaHFXaOKqFBcY5qQf4ux7aUZ3YV86l528lJG
 liHgeQcjsbxgb2bZ+cYrrlkWn7raDkevMP5U4EAM+zBqEvNBK479CYTOpg3Qwa7Q1JFd
 gE/C/aEwC9Z1fp0nwpCQaQp/Yr6hGGeGRDgQF4Q9FIBD04P7MfHPv2nZ44KzhGcT4we2
 VQSYAhhkNNHfKqrNN03uTzwOaQe0+QGckdZlU6WZ7+bOM2XDIibmeOp87dI5XAGNotBy
 UaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787676925; x=1788281725;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0PGKUcpisL/PdVjbCIBj9taleCgb4geVsx0pZw5E3b0=;
 b=U26719vFPUYQZJ2OhUWA36WTU1oF0LLFjxuLiAFe7ZCIUPddVxcMYbKb6a/kwi3Ee2
 i/Ne7WkXWMY7OaWrd7XcSeDpq2oEF0ibddfyIlVBCDcCq3zQ7VX0lhuKKdOZ8RdcXdae
 aoxGLKJwa3YF/kXAGq3sHcTZKgIS9u7oXWLrHJDdM5n6oiCCXB67jgeObKjsC8YcAx1K
 LPBT9MgYZnkw02PjH4Xdvg/cHMKFIW0wUtdm6ozrFpt7Xh6fuIdS+fqQ/fqiZUSfeXR1
 LWhrOsFX9RSrXoyY5sVvpne6Qwz+S7pDhxrFkDDG4UzTBp6JI+4LHPLMJMVV0Jrg7RYq
 Os8A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpdos5WpJ8PUr/889rk23ZjhoyepB/huKj/Fj97d6ttN0Q+5gBb//jqc9ggC+ILysfcS2odVm6FnQ==@nongnu.org
X-Gm-Message-State: AFuF++nQygIEXce4kqegu43XqpVA573JRyzXINbRECRvJTkNg+LUCYDP
 8eCeRZcHMOU5D4YuPXbjCUMN6iyhsVIGjnNDkdV1fMuOtkixpzyTwhis/L+fHLZwjjswCffmwvE
 Mm/XAK3QixM3kQdEFGyw97ow1r6Vkoyc=
X-Gm-Gg: AR+sD12vsEd5z3je6ShokzU7voBlfR3S4aUzmBfzV9VcfE9HN8wT5U7fzNzx5GKMawB
 b5Pc/bCtgGZWblPyKvfz8zT2rwfsZNNZqWuwyvuVOKqT572WhH/xGC88t0ObTuPcyEIc4XphDjb
 8H2RrWDqJf5ZL7En3n0F53FgJx0P1M3NYSE3Zz+EJEraeWuaNr8+Sn3gNHqKyhxDH7ZNr3G6lr7
 7zvihT10rqgJ9mzLGC2CGy1autkJjCZPYicoiW5VLQxF9L4soKriuTw68MsxdLJCfgjv6iFmGRE
 8CY2EkoPO5+Xv5aGDS83PgARfBXAnIT6H/lWZXt8PVC+
X-Received: by 2002:a05:690c:30e:b0:81e:f337:494b with SMTP id
 00721157ae682-85470beb834mr39361027b3.8.1787676924940; Tue, 25 Aug 2026
 09:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao235Hm8Uovrk0ON@redhat.com>
In-Reply-To: <ao235Hm8Uovrk0ON@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 26 Aug 2026 00:55:09 +0800
X-Gm-Features: AcwNN1XxiiOybUdcnAMhBxhLRl0Ru7IaT7l5U8Ezqkmoe0-ZJG7jflEoexKYMDY
Message-ID: <CAE2XoE-EJQH7c3TWvpioa7yokNR6cf6pGMjZ2e001yU4-F7rag@mail.gmail.com>
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Xianglai Li <lixianglai@loongson.cn>, 
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
Content-Type: multipart/alternative; boundary="00000000000015957c0659e1f89d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=luoyonggang@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO=1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--00000000000015957c0659e1f89d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:42=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com>
wrote:
>
> On Sun, Aug 23, 2026 at 11:07:18PM +0800, Yonggang Luo wrote:
> > This series produces one qemu-system binary that can run ARM (32 and 64=
)
> > and RISC-V (32 and 64, little- and big-endian TargetInfo). It follows
> > Pierrick Bouvier's merged series "single-binary: implement dynamic
> > filtering for machine types":
> >
> >
https://patchew.org/QEMU/20260724000948.234657-1-pierrick.bouvier@oss.qualc=
omm.com/
>
> Do you have a public git branch somewhere with this series ? I'm
> having trouble getting either this series or Pierrick's to cleanly
> apply at any point to test it.


https://patchew.org/QEMU/20260823150731.896-1-luoyonggang@gmail.com/

you can use git patchew do it

git fetch https://github.com/patchew-project/qemu tags/patchew/
20260823150731.896-1-luoyonggang@gmail.com

a>
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000015957c0659e1f89d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Aug 25, 2026 at 11:42=E2=80=AFPM Daniel P.=
 Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.c=
om</a>&gt; wrote:<br>&gt;<br>&gt; On Sun, Aug 23, 2026 at 11:07:18PM +0800,=
 Yonggang Luo wrote:<br>&gt; &gt; This series produces one qemu-system bina=
ry that can run ARM (32 and 64)<br>&gt; &gt; and RISC-V (32 and 64, little-=
 and big-endian TargetInfo). It follows<br>&gt; &gt; Pierrick Bouvier&#39;s=
 merged series &quot;single-binary: implement dynamic<br>&gt; &gt; filterin=
g for machine types&quot;:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 <a href=3D"http=
s://patchew.org/QEMU/20260724000948.234657-1-pierrick.bouvier@oss.qualcomm.=
com/">https://patchew.org/QEMU/20260724000948.234657-1-pierrick.bouvier@oss=
.qualcomm.com/</a><br>&gt;<br>&gt; Do you have a public git branch somewher=
e with this series ? I&#39;m<br>&gt; having trouble getting either this ser=
ies or Pierrick&#39;s to cleanly<br>&gt; apply at any point to test it.<br>=
<br><br><a href=3D"https://patchew.org/QEMU/20260823150731.896-1-luoyonggan=
g@gmail.com/">https://patchew.org/QEMU/20260823150731.896-1-luoyonggang@gma=
il.com/</a><br><br>you can use git patchew do it <br><br><div>git fetch <a =
href=3D"https://github.com/patchew-project/qemu">https://github.com/patchew=
-project/qemu</a> tags/patchew/<a href=3D"mailto:20260823150731.896-1-luoyo=
nggang@gmail.com">20260823150731.896-1-luoyonggang@gmail.com</a><br><br>a&g=
t;<br>&gt;<br>&gt; With regards,<br>&gt; Daniel<br>&gt; --<br>&gt; |: <a hr=
ef=3D"https://berrange.com">https://berrange.com</a> =C2=A0 =C2=A0 =C2=A0 ~=
~ =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://hachyderm.io/@berrange">htt=
ps://hachyderm.io/@berrange</a> :|<br>&gt; |: <a href=3D"https://libvirt.or=
g">https://libvirt.org</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://entangle-photo.org">https://enta=
ngle-photo.org</a> :|<br>&gt; |: <a href=3D"https://pixelfed.art/berrange">=
https://pixelfed.art/berrange</a> =C2=A0 ~~ =C2=A0 =C2=A0<a href=3D"https:/=
/fstop138.berrange.com">https://fstop138.berrange.com</a> :|<br>&gt;<br><br=
><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=
=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>=
Yonggang Luo</div></div>

--00000000000015957c0659e1f89d--

