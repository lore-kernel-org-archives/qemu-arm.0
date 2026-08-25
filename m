Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7465FC61DBC
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 17:12:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyugx-0003nq-9H; Tue, 25 Aug 2026 13:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wyugv-0003mI-C2
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 13:12:05 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wyugs-0001gN-6B
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 13:12:05 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-81e6f0b4610so56463177b3.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 10:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787677921; cv=none;
 d=google.com; s=arc-20260327;
 b=DtnzxMG53HQZI/Ms2PKw6T3uNstgmgmgsef7YdQkjISNPyHW0atgxBFJILfjeMeRd+
 /v57Trk/pt5l9+APSbM6bFO4jsbkGPcoFw8IxYTGTeQQ8Oz/k4aWZh8/EUpOv959fNL1
 ImIf29phHYbH2eZATToWe3s7+GB/zvhmgfn1E0hkCVV5fJkPxblyBFWRa73fHnBR2Tx3
 Oe7RYB4vwcFtXpzEy+2955vbbM3Ua0U5jGTFo4J88zJXON3Ys7Ppa5YfEWO4kFWsT8H7
 rXHtn9UVdM1o5ukCbfb+NTtyRTD3KOZnTU6Vlb+qx1gJl9LDkHXdGG75R0Sm4fzw0c9v
 DQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aLrwkN2hpeFMupH+bxDa1e3NGhRfPpCK+VUOuYRo6l4=;
 fh=uAjxscon6LSvuQR29WhWoAA+GESVYvi3teLTsS0QOuY=;
 b=PxkNxEm7VC3K8+QOMOe0rD0n7Pj61gSDVB3taOVeA6ZCmiJ9sTWzUebNdmczQ4plUx
 1sOLvB60G0+MP4bdjQ9ZyTJK2E7kQDCqHHwfaXXda/Ao1Pfn+SjLQ6oCooJ1ivZ+1p7n
 XB1gcKC6+fIVVSpn6ovxvukLgSpDmRx9OWh3rF0BXuHZWm12LKL0EW0/947vKAXs6+04
 GcnIPovN5/qUyQiTL7Yv6jY97JrNYWgygqNEhGLAgzBSsHhNteEpZnI0zJaiP30plo/j
 ftCaPT5/396w58ZDT6euUbuuLpame+6eeYVQN03msrXn/RGHOGJ2WB7bDxEZnHSYpfEk
 UDlw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787677921; x=1788282721; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aLrwkN2hpeFMupH+bxDa1e3NGhRfPpCK+VUOuYRo6l4=;
 b=ZvzPECkQqnHgJmUBIIkiho69Nqg+7HV/pb1nfkaEDZEoU95VheTxMUucmx7J6C0gn7
 lBPFkSmcQEBG+3vzwShj8ry0FCLRQv7vWhN83aW7ugQOuePvnjAdavbaW449aH6GpuLZ
 DK6duT39/VFfyLBfoUrrBAEOdpEScDImlZ/Yzez4E9Ia4n3ovJTsQorbURXwR7gbWM84
 FrjAlCcdS5sBJnHTSAjgGJp0grLlQcAGBgKP8v4JCUbnUbUri62YgBsme8QB0b1+RLTP
 UEbFUp9rTbIWCgZIeNUNbxzqX5HLXk49mpVMC3CUnIrnimi5bu5qmlTic32mKe4oJpwn
 dfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787677921; x=1788282721;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aLrwkN2hpeFMupH+bxDa1e3NGhRfPpCK+VUOuYRo6l4=;
 b=IwrNhuYDMR4lUIWxMZQhAUajEpvwiZakECLsOBoKzVYqlS6k80U0/LSiGFj7w1et2M
 FTfsRH4IdX/4CFVMFRf26vB6VBb9f/yKy1ZWB4ulrLf8WjZ4ZT+CjNNFOA+1d16KlDjI
 MCMbNSfCDS1JeQA1CQwBo+PHduqDZimDHqJ93AZo6rtBgSTfVupfb+k8VYi0IXeZHs8g
 uczqvcC8cecqIMtbZsRR/4Kqc534tuhWi7PyZwAQ3N8DmHF5WKkQ41/UL1QnKSThPUCf
 F7HXS4O8T+7MI8EGyfTroEpbCOkkSz8O2YHyZ8IwyENQc7DVNXS7neb/UfT7EL4YvBfY
 85+Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoYc0N8qpxyKekD4bSOOhcATul8IVFSTBGWw+wCZp4xJvRFd3G3IqgHTjIRWwFETKo7ptbYiqRBFw==@nongnu.org
X-Gm-Message-State: AFuF++mrnsJ45ODSw1QABLs8y7lKsimLwfFrTiZ2Rps25JKv8WUqPrj2
 QMKPvEn841nYRp0iRFc/gH0xx6m/gaN/3rKEuK4nrwDnoJIoHhBdDPfzb/50LO+hNwdKPzLe+TW
 BDUAqgb09QDVqCACKFbdWlAMB7cSC0I8=
X-Gm-Gg: AR+sD12IjkJcS9Rcd5cYj6a8WaVIdFE66a2gURUgPLAWvTFUCEif04zDXcPpKP6uokm
 hIBk9gtfLlZ3jEDCw3lAmH4KK4qTF3Yy4CGxSczieobihVwrPPcgEB0mq1xT7hyfupDys6YHqGG
 UyALXzb1zOKUGiCQQu4vZSxMgv96LE3NvDNYbxQb77Mdh2oMHv8nFPI1ZAQ08j2oMAsAp8g403R
 hO5fXDQkW9y0DVB+dd1c3BHGXC+LakO0JgVdZ8yIRHJpxlSdMQ+LIOXLgmOu2isvzeu17gmpwi7
 0j4t2MHJCA9FUKEo7p2zE8Xo6DdgXn6Z5FFXY9s181CJ
X-Received: by 2002:a05:690c:a701:b0:81e:c736:acce with SMTP id
 00721157ae682-8574173375fmr1148707b3.32.1787677920679; Tue, 25 Aug 2026
 10:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao235Hm8Uovrk0ON@redhat.com>
In-Reply-To: <ao235Hm8Uovrk0ON@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 26 Aug 2026 01:11:46 +0800
X-Gm-Features: AcwNN1W7IegOOQAdYSNJRFaa-idk915Db0vwA2saIsvqm3MO8VJAnZIhPjlE8MI
Message-ID: <CAE2XoE-Y==KCjy8i9yUmivHs6J-zdVmpbCNRs66R-OsOEdhU=g@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000006f5cae0659e2333c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=luoyonggang@gmail.com; helo=mail-yw1-x1132.google.com
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

--0000000000006f5cae0659e2333c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The github branch I built locally

https://github.com/lygstate/qemu/tree/s11.1-riscv-arm

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
>
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

--0000000000006f5cae0659e2333c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The github branch I built locally=C2=A0<div><br></div><div=
><a href=3D"https://github.com/lygstate/qemu/tree/s11.1-riscv-arm">https://=
github.com/lygstate/qemu/tree/s11.1-riscv-arm</a><br><br>On Tue, Aug 25, 20=
26 at 11:42=E2=80=AFPM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berran=
ge@redhat.com">berrange@redhat.com</a>&gt; wrote:<br>&gt;<br>&gt; On Sun, A=
ug 23, 2026 at 11:07:18PM +0800, Yonggang Luo wrote:<br>&gt; &gt; This seri=
es produces one qemu-system binary that can run ARM (32 and 64)<br>&gt; &gt=
; and RISC-V (32 and 64, little- and big-endian TargetInfo). It follows<br>=
&gt; &gt; Pierrick Bouvier&#39;s merged series &quot;single-binary: impleme=
nt dynamic<br>&gt; &gt; filtering for machine types&quot;:<br>&gt; &gt;<br>=
&gt; &gt; =C2=A0 <a href=3D"https://patchew.org/QEMU/20260724000948.234657-=
1-pierrick.bouvier@oss.qualcomm.com/">https://patchew.org/QEMU/202607240009=
48.234657-1-pierrick.bouvier@oss.qualcomm.com/</a><br>&gt;<br>&gt; Do you h=
ave a public git branch somewhere with this series ? I&#39;m<br>&gt; having=
 trouble getting either this series or Pierrick&#39;s to cleanly<br>&gt; ap=
ply at any point to test it.<br>&gt;<br>&gt;<br>&gt; With regards,<br>&gt; =
Daniel<br>&gt; --<br>&gt; |: <a href=3D"https://berrange.com">https://berra=
nge.com</a> =C2=A0 =C2=A0 =C2=A0 ~~ =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"h=
ttps://hachyderm.io/@berrange">https://hachyderm.io/@berrange</a> :|<br>&gt=
; |: <a href=3D"https://libvirt.org">https://libvirt.org</a> =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0~~ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https:/=
/entangle-photo.org">https://entangle-photo.org</a> :|<br>&gt; |: <a href=
=3D"https://pixelfed.art/berrange">https://pixelfed.art/berrange</a> =C2=A0=
 ~~ =C2=A0 =C2=A0<a href=3D"https://fstop138.berrange.com">https://fstop138=
.berrange.com</a> :|<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>You=
rs<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--0000000000006f5cae0659e2333c--

