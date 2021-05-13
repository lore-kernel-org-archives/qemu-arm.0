Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp660791lfg;
        Thu, 13 May 2021 09:45:25 -0700 (PDT)
X-Received: by 2002:ac8:5894:: with SMTP id t20mr38592667qta.134.1620924325359;
        Thu, 13 May 2021 09:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620924325; cv=none;
        d=google.com; s=arc-20160816;
        b=P7dEiv+g7wUqhoZ2ayDONP8joVEXNLkZ32syD0MR9a+0fGg5ntVA79YkPd+D4bzKQT
         HlpRgFrvzWzAYuXEJPH79SWxDRJo3053Evu64Xebo4vu9tTZowpfr9Pwi7jvIMim7m9W
         uNfGnje29B8VBd8HGMsBB03IkX56Aq4zH6w1wuOI5+IAkxjzwmSEiFXM0HaEfRxVONPQ
         ZerOums1Xp4Pjgz3FRzK0hEeKnk5iQofxLC1bwgs4sDHFC3Px40dNfx3gKkQCLgw+Dq9
         DVLk6L/o+eGS6goJFkoy+9BMH3CAQ/nyIGSP8ebvh3lXc/EGHz2hC1rnQtX6RxiybQYY
         IuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:dkim-signature;
        bh=7MdD6CGbw6TDh9FYBIxBRvnBHQVomBJ6LzpLpalAoh8=;
        b=KUZacYxrYSC2cRri/wpujc4MjldtafQ9DQX1BnMJyvzQLUEFydsPSudtCaLjsgbyUw
         EaJMbItBO6b4Xamt6IgOQxPVIgtpqWNN0Eif0q4XRXVAffsX/llqV0uG+SJGSUoWgzKu
         zLuEqBHpBE3ZSW/Ur1rmUX26/dH3QWNPxVf11Ysj5aE/whM5nvR2T3WuuHYUumdgu/vt
         ODiV8QQkEc7wdfJMF1aP0ejTONlb3QhbeoeRcgUqhVw5kbe0waT0qo8Wn+FaCYvIYVJR
         8wCn7VUdo7zWrAh3RoU/yfgooD0amH9xmvlgMzVZP+my3xATrvZFEbr+kzQ35kaCUj9u
         hs7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xR3SHKVU;
       spf=pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=shashi.mallela@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <shashi.mallela@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z2sor1494147qkb.53.2021.05.13.09.45.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 May 2021 09:45:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xR3SHKVU;
       spf=pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=shashi.mallela@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version;
        bh=7MdD6CGbw6TDh9FYBIxBRvnBHQVomBJ6LzpLpalAoh8=;
        b=xR3SHKVUwd7v2qNbqQsIMCQac6oPCkG5V2OM/snhS2Jl/c8Tx4b+ACugp4bUIcUj3Z
         dETmbmXZ6isxaFWWZnv8U89KSiW3FOkbPRzTUFoFAehNDAm89CpdyjR9IuGE4FCSg02B
         GJJxV/F8BY+QOyG0zWmerk3WZwDRH1cyMoRl+iKXCwZNNd39kVv3sUYCc7TRlWH60pVf
         bmgfeKyn84SFG8HkkZKy1sEXTWwpNdfZ5j28/WwMZxEg3lUU3u9wRSRt6XaJf1iH78gV
         Ks5GHWnkxKzDpsLDbCbZXgvmL9tMuUqj+HkfQHx9HWj7j7NQrTlQyInFvAMm1gHpnhtO
         RhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version;
        bh=7MdD6CGbw6TDh9FYBIxBRvnBHQVomBJ6LzpLpalAoh8=;
        b=R3VK/56G/OJFca97aBnKISxiH8V32g7thgem3lPVLcpPEDWa+l6NoXtTBKb8lnu5JX
         xP0uusoyC4ippMy/+Kb1ZL80G0P0wOx1TJW6isRKKvYwkqp4WoE/CmpidfU0+iODNafq
         vsLObA9wpYGEA0e/VRTHt4cuF0BBTCC8l3dL8ixkyWv0Sv05z/9g6tES+FZ1GJu2mM35
         zGSQANBUP4K//zuecAxu6sbQEJm+mnwdBUMDaFs7PFccC0W5HtZzA4RZ8ez9KWQpOykb
         rT9YPfG+jB7juRXxNBPto3Z08c4BR+y92GI5xe3QKbFd5XTBiAzodh77u6nCUcZfmT/9
         4qiQ==
X-Gm-Message-State: AOAM5307ZH+YuUtwQmnu0nVwOkezwwCuven8DvuWwNAk6XcZEZQvBazT
	fFg5d0zFGeX8EZhCyQZ/FLjU+fA7lA0oXj9F
X-Google-Smtp-Source: ABdhPJyzftoDvksgMxrRZ+CEIn25qWYhZs1yu/kUvDlKyyFmW7IdkCU4D/4b8VrXrt0D+OngG50LAA==
X-Received: by 2002:ae9:f114:: with SMTP id k20mr39789733qkg.386.1620924324928;
        Thu, 13 May 2021 09:45:24 -0700 (PDT)
Return-Path: <shashi.mallela@linaro.org>
Received: from localhost.localdomain (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
        by smtp.gmail.com with ESMTPSA id h5sm2921909qkg.122.2021.05.13.09.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 09:45:24 -0700 (PDT)
Date: Thu, 13 May 2021 12:45:23 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Cc: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 "=?utf-8?Q?qemu-devel=40nongnu.org?=" <qemu-devel@nongnu.org>, 
 "=?utf-8?Q?Chengen_(William=2C_FixNet)?=" <chengen@huawei.com>, 
 "=?utf-8?Q?peter.maydell=40linaro.org?=" <peter.maydell@linaro.org>, 
 "=?utf-8?Q?drjones=40redhat.com?=" <drjones@redhat.com>, 
 "=?utf-8?Q?richard.henderson=40linaro.org?="
 <richard.henderson@linaro.org>, "=?utf-8?Q?qemu-arm=40nongnu.org?="
 <qemu-arm@nongnu.org>, "=?utf-8?Q?Cota=40braap.org?=" <Cota@braap.org>, 
 yuzenghui <yuzenghui@huawei.com>, "Wanghaibin (D)"
 <wanghaibin.wang@huawei.com>
Message-ID: <41839E15-50DF-4EFB-AF54-6CDB089859BD@getmailspring.com>
In-Reply-To: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
References: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
Subject: Re: GICv3 for MTTCG
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="609d57a3_38479b96_14ca"
X-TUID: CcweQR1clgMp

--609d57a3_38479b96_14ca
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Andrey,

To clarify, the patch series
> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> =22GICv3 LPI and ITS feature implementation=22
>

is applicable for virt machine 6.1 onwards,i.e ITS TCG functionality is n=
ot available for version 6.0 that is being tried
here.

Thanks
Shashi

On May 13 2021, at 12:35 pm, Andrey Shinkevich <andrey.shinkevich=40huawe=
i.com> wrote:
> Dear colleagues,
>
> Thank you all very much for your responses. Let me reply with one messa=
ge.
> I configured QEMU for AARCH64 guest:
> =24 ./configure --target-list=3Daarch64-softmmu
>
> When I start QEMU with GICv3 on an x86 host:
> qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3
>
> QEMU reports this error from hw/pci/msix.c:
> error=5Fsetg(errp, =22MSI-X is not supported by interrupt controller=22=
);
>
> Probably, the variable 'msi=5Fnonbroken' would be initialized in
> hw/intc/arm=5Fgicv3=5Fits=5Fcommon.c:
> gicv3=5Fits=5Finit=5Fmmio(..)
>
> I guess that it works with KVM acceleration only rather than with TCG.
> The error persists after applying the series:
> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> =22GICv3 LPI and ITS feature implementation=22
> (special thanks for referring me to that)
>
> Please, make me clear and advise ideas how that error can be fixed=3F
> Should the MSI-X support be implemented with GICv3 extra=3F
>
> When successful, I would like to test QEMU for a maximum number of core=
s
> to get the best MTTCG performance.
> Probably, we will get just some percentage of performance enhancement
> with the BQL series applied, won't we=3F I will test it as well.
>
> Best regards,
> Andrey Shinkevich
>
>
> On 5/12/21 6:43 PM, Alex Benn=C3=A9e wrote:
> >
> > Andrey Shinkevich <andrey.shinkevich=40huawei.com> writes:
> >
> >> Dear colleagues,
> >>
> >> I am looking for ways to accelerate the MTTCG for ARM guest on x86-6=
4 host.
> >> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8=
:
> >>
> >> include/hw/intc/arm=5Fgic=5Fcommon.h:=23define GIC=5FNCPU 8
> >>
> >> The version 3 of the Generic Interrupt Controller (GICv3) is not
> >> supported in QEMU for some reason unknown to me. It would allow to
> >> increase the limit of CPUs and accelerate the MTTCG performance on a=

> >> multiple core hypervisor.
> >
> > It is supported, you just need to select it.
> >
> >> I have got an idea to implement the Interrupt Translation Service (I=
TS)
> >> for using by MTTCG for ARM architecture.
> >
> > There is some work to support ITS under TCG already posted:
> >
> > Subject: =5BPATCH v3 0/8=5D GICv3 LPI and ITS feature implementation
> > Date: Thu, 29 Apr 2021 19:41:53 -0400
> > Message-Id: <20210429234201.125565-1-shashi.mallela=40linaro.org>
> >
> > please do review and test.
> >
> >> Do you find that idea useful and feasible=3F
> >> If yes, how much time do you estimate for such a project to complete=
 by
> >> one developer=3F
> >> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU=
=3F
> >
> > As far as MTTCG performance is concerned there is a degree of
> > diminishing returns to be expected as the synchronisation cost betwee=
n
> > threads will eventually outweigh the gains of additional threads.
> >
> > There are a number of parts that could improve this performance. The
> > first would be picking up the BQL reduction series from your =46uture=
Wei
> > colleges who worked on the problem when they were Linaro assignees:
> >
> > Subject: =5BPATCH v2 0/7=5D accel/tcg: remove implied BQL from cpu=5F=
handle=5Finterrupt/exception path
> > Date: Wed, 19 Aug 2020 14:28:49 -0400
> > Message-Id: <20200819182856.4893-1-robert.foley=40linaro.org>
> >
> > There was also a longer series moving towards per-CPU locks:
> >
> > Subject: =5BPATCH v10 00/73=5D per-CPU locks
> > Date: Wed, 17 Jun 2020 17:01:18 -0400
> > Message-Id: <20200617210231.4393-1-robert.foley=40linaro.org>
> >
> > I believe the initial measurements showed that the BQL cost started t=
o
> > edge up with GIC interactions. We did discuss approaches for this and=
 I
> > think one idea was use non-BQL locking for the GIC. You would need to=

> > revert:
> >
> > Subject: =5BPATCH-for-5.2=5D exec: Remove MemoryRegion::global=5Flock=
ing field
> > Date: Thu, 6 Aug 2020 17:07:26 +0200
> > Message-Id: <20200806150726.962-1-philmd=40redhat.com>
> >
> > and then implement a more fine tuned locking in the GIC emulation
> > itself. However I think the BQL and per-CPU locks are lower hanging
> > fruit to tackle first.
> >
> >>
> >> Best regards,
> >> Andrey Shinkevich
> >
> >
>


--609d57a3_38479b96_14ca
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi Andrey,</div><br><div>To clarify, the patch series</div><blockquo=
te><div><div>https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944=
.html</div><div>=22GICv3 LPI and ITS feature implementation=22</div></div=
></blockquote><div>is applicable for virt machine 6.1 onwards,i.e ITS TCG=
 functionality is not available for version 6.0 that is being tried</div>=
<div>here.</div><br><div>Thanks</div><div>Shashi</div><br><div class=3D=22=
gmail=5Fquote=5Fattribution=22>On May 13 2021, at 12:35 pm, Andrey Shinke=
vich &lt;andrey.shinkevich=40huawei.com&gt; wrote:</div><blockquote><div>=
<div>Dear colleagues,</div><br><div>Thank you all very much for your resp=
onses. Let me reply with one message.</div><br><div>I configured QEMU for=
 AARCH64 guest:</div><div>=24 ./configure --target-list=3Daarch64-softmmu=
</div><br><div>When I start QEMU with GICv3 on an x86 host:</div><div>qem=
u-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3</div><br><=
div>QEMU reports this error from hw/pci/msix.c:</div><div>error=5Fsetg(er=
rp, =22MSI-X is not supported by interrupt controller=22);</div><br><div>=
Probably, the variable 'msi=5Fnonbroken' would be initialized in</div><di=
v>hw/intc/arm=5Fgicv3=5Fits=5Fcommon.c:</div><div>gicv3=5Fits=5Finit=5Fmm=
io(..)</div><br><div>I guess that it works with KVM acceleration only rat=
her than with TCG.</div><br><div>The error persists after applying the se=
ries:</div><div>https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00=
944.html</div><div>=22GICv3 LPI and ITS feature implementation=22</div><d=
iv>(special thanks for referring me to that)</div><br><div>Please, make m=
e clear and advise ideas how that error can be fixed=3F</div><div>Should =
the MSI-X support be implemented with GICv3 extra=3F</div><br><div>When s=
uccessful, I would like to test QEMU for a maximum number of cores</div><=
div>to get the best MTTCG performance.</div><div>Probably, we will get ju=
st some percentage of performance enhancement</div><div>with the BQL seri=
es applied, won't we=3F I will test it as well.</div><br><div>Best regard=
s,</div><div>Andrey Shinkevich</div><br><br><div>On 5/12/21 6:43 PM, Alex=
 Benn=C3=A9e wrote:</div><div>&gt;</div><div>&gt; Andrey Shinkevich &lt;a=
ndrey.shinkevich=40huawei.com&gt; writes:</div><div>&gt;</div><div>&gt;&g=
t; Dear colleagues,</div><div>&gt;&gt;</div><div>&gt;&gt; I am looking fo=
r ways to accelerate the MTTCG for ARM guest on x86-64 host.</div><div>&g=
t;&gt; The maximum number of CPUs for MTTCG that uses GICv2 is limited by=
 8:</div><div>&gt;&gt;</div><div>&gt;&gt; include/hw/intc/arm=5Fgic=5Fcom=
mon.h:=23define GIC=5FNCPU 8</div><div>&gt;&gt;</div><div>&gt;&gt; The ve=
rsion 3 of the Generic Interrupt Controller (GICv3) is not</div><div>&gt;=
&gt; supported in QEMU for some reason unknown to me. It would allow to</=
div><div>&gt;&gt; increase the limit of CPUs and accelerate the MTTCG per=
formance on a</div><div>&gt;&gt; multiple core hypervisor.</div><div>&gt;=
</div><div>&gt; It is supported, you just need to select it.</div><div>&g=
t;</div><div>&gt;&gt; I have got an idea to implement the Interrupt Trans=
lation Service (ITS)</div><div>&gt;&gt; for using by MTTCG for ARM archit=
ecture.</div><div>&gt;</div><div>&gt; There is some work to support ITS u=
nder TCG already posted:</div><div>&gt;</div><div>&gt; Subject: =5BPATCH =
v3 0/8=5D GICv3 LPI and ITS feature implementation</div><div>&gt; Date: T=
hu, 29 Apr 2021 19:41:53 -0400</div><div>&gt; Message-Id: &lt;20210429234=
201.125565-1-shashi.mallela=40linaro.org&gt;</div><div>&gt;</div><div>&gt=
; please do review and test.</div><div>&gt;</div><div>&gt;&gt; Do you fin=
d that idea useful and feasible=3F</div><div>&gt;&gt; If yes, how much ti=
me do you estimate for such a project to complete by</div><div>&gt;&gt; o=
ne developer=3F</div><div>&gt;&gt; If no, what are reasons for not implem=
enting GICv3 for MTTCG in QEMU=3F</div><div>&gt;</div><div>&gt; As far as=
 MTTCG performance is concerned there is a degree of</div><div>&gt; dimin=
ishing returns to be expected as the synchronisation cost between</div><d=
iv>&gt; threads will eventually outweigh the gains of additional threads.=
</div><div>&gt;</div><div>&gt; There are a number of parts that could imp=
rove this performance. The</div><div>&gt; first would be picking up the B=
QL reduction series from your =46utureWei</div><div>&gt; colleges who wor=
ked on the problem when they were Linaro assignees:</div><div>&gt;</div><=
div>&gt; Subject: =5BPATCH v2 0/7=5D accel/tcg: remove implied BQL from c=
pu=5Fhandle=5Finterrupt/exception path</div><div>&gt; Date: Wed, 19 Aug 2=
020 14:28:49 -0400</div><div>&gt; Message-Id: &lt;20200819182856.4893-1-r=
obert.foley=40linaro.org&gt;</div><div>&gt;</div><div>&gt; There was also=
 a longer series moving towards per-CPU locks:</div><div>&gt;</div><div>&=
gt; Subject: =5BPATCH v10 00/73=5D per-CPU locks</div><div>&gt; Date: Wed=
, 17 Jun 2020 17:01:18 -0400</div><div>&gt; Message-Id: &lt;2020061721023=
1.4393-1-robert.foley=40linaro.org&gt;</div><div>&gt;</div><div>&gt; I be=
lieve the initial measurements showed that the BQL cost started to</div><=
div>&gt; edge up with GIC interactions. We did discuss approaches for thi=
s and I</div><div>&gt; think one idea was use non-BQL locking for the GIC=
. You would need to</div><div>&gt; revert:</div><div>&gt;</div><div>&gt; =
Subject: =5BPATCH-for-5.2=5D exec: Remove MemoryRegion::global=5Flocking =
field</div><div>&gt; Date: Thu, 6 Aug 2020 17:07:26 +0200</div><div>&gt; =
Message-Id: &lt;20200806150726.962-1-philmd=40redhat.com&gt;</div><div>&g=
t;</div><div>&gt; and then implement a more fine tuned locking in the GIC=
 emulation</div><div>&gt; itself. However I think the BQL and per-CPU loc=
ks are lower hanging</div><div>&gt; fruit to tackle first.</div><div>&gt;=
</div><div>&gt;&gt;</div><div>&gt;&gt; Best regards,</div><div>&gt;&gt; A=
ndrey Shinkevich</div><div>&gt;</div><div>&gt;</div></div></blockquote><i=
mg class=3D=22mailspring-open=22 alt=3D=22Sent from Mailspring=22 width=3D=
=220=22 height=3D=220=22 style=3D=22border:0; width:0; height:0;=22 src=3D=
=22https://link.getmailspring.com/open/41839E15-50D=46-4E=46B-A=4654-6CDB=
089859BD=40getmailspring.com=3Fme=3D2a4b90d6&amp;recipient=3DYWxleC5iZW5u=
ZWVAbGluYXJvLm9yZw%3D%3D=22>
--609d57a3_38479b96_14ca--
