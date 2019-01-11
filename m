Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp102297wrt;
        Fri, 11 Jan 2019 04:49:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7t6PeuOK2iulMQsetHEKl5jTsRY2L0tPH/0ruQUiJY2VT4ZQ4rbAZs8iHbCH7UNDmnrwT0
X-Received: by 2002:a1c:2c6:: with SMTP id 189mr2143458wmc.21.1547210968166;
        Fri, 11 Jan 2019 04:49:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547210968; cv=none;
        d=google.com; s=arc-20160816;
        b=CasRVTBkk+N7pFTCoA4I9HA2//DUPYQMXZ/TxepFWdikzuIGt4gUT5Gvj93AptMsSM
         MIvIJ5lKO1PvWo/LfHewkBC6xQpflRrEE9dhLiwgsmj1082P2UDa9wQikgbnCsdcURn6
         dfotsMkXN6Jb8YtaT+IptIL4SpMriOYh0SSaxwNwn+AAi/ezlVmD55xIislG4HavCKt0
         Epi3eDuO0Ik1cACWUYdZZGaofB3FNy/B6mFUaAxGD5gUapOA7zKkyEZoF+FQaEIpb2sK
         JfBgPNr+pOXcbyZTrngBAgYISwnEb2nAIMKgx7IakBF90w7t3Vbb0AQbFhwbdPFl/OU5
         /wyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=9dkhhc+OXg3zBKCq8Azjb1EOUQ32IzZE2AJAmTO3Gz4=;
        b=Mk8X192eQMkC/XWTycRDar02QQoNtNra16UiUCOEhxlWmyBZHAQTaoIsG5MieSgwHq
         dnEA2vItSmgp8q+HUK1CdjUyTqxKgSzUOSvQX4FCXQUYs5HB3gHQz1l2GgsQxtL3ttqB
         xYqr3zFw103kcFcme9awAHz/slTmu5JRWJwLzRdcL2UNohHTH1TsU0AgwIOX7FW2Owh9
         LbZ+TYKOjTUHO/MVOXXVn1LiunijNmBq6AGIbxUrRVlAS1Rzfmy2uJTT0sSVqUychTbw
         fZXy7kWKqw3pbtUay2Qvlg5BN+tBvanxNjj27e+KIhh+f/E5zpQc1E/94uQaTVICnUBL
         LuMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k8smk7GD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si44370477wrs.105.2019.01.11.04.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 04:49:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k8smk7GD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:41208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghwFb-0007ZP-94
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 07:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1ghwFT-0007ZJ-O9
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 07:49:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1ghwFR-00089o-SX
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 07:49:19 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1ghwFR-000899-CI; Fri, 11 Jan 2019 07:49:17 -0500
Received: by mail-ot1-x343.google.com with SMTP id w25so12956906otm.13;
	Fri, 11 Jan 2019 04:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9dkhhc+OXg3zBKCq8Azjb1EOUQ32IzZE2AJAmTO3Gz4=;
	b=k8smk7GD18/GDdKW8gFBXgcQQVBbqiTXxf/0p4oZCm1Muf3lViehuMeNuZNdYqaA6b
	jgL+Dj6KDHuxzHLwxTTwb/+07rC0pza5SRimtV0896qDIVcTkzYXVBuQjTgCREmR2MRk
	c0b4ayoiBUHS0hoi1aLmUTScI/HFaSrZt2Ljj+h8DOC8V7lL9y17R/ErDIJRHR3x0bbm
	dnMLPdn9zjIPRBqR2JFxUfkfDEgJl253Zj2d6UvU3Q18Pp24xoIz4Eb4EvX3qxTob1bE
	BUSE79ZILmj7MlYgGvYfFUrv2JclKWN5YISEqwQuwX6HG+QwFgFHBDRSM2YRmjr39yXp
	r5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9dkhhc+OXg3zBKCq8Azjb1EOUQ32IzZE2AJAmTO3Gz4=;
	b=e6xBmqo14VgdSTImmyLn4fLVIdRH5i4EGIDAI8MYck65a6Z9jZBSNxgbVRaCwtu9er
	bev9KmCMTOJNIVDciUAhD+oQ7B69OQX1xUUD5CaJUFyBi2BsswRgVS5IFw4bDvkhqp0x
	GUDsJSaHfgfN0iQWseCBzif+HrA19z18sYrfY3eoFXdCq6jBWmOIzekRyKHkpfxO7O0U
	1/FrS7LE8jbKRSWVyAsl4pNdRJn4oYG72NcqS4o22gPQ4P2GtSVXAxhQVqyFptBVM+8C
	6L6do2fnxyPh8Zh7pUzA6Im5IwWJIqsmsbSD6jxCIYuO+sjOBSqr/Q+RqBWcko9YjX2V
	JUHQ==
X-Gm-Message-State: AJcUukdV65OHcAB/2iGaNqiBUsCDB4N450opCbiFr1oGJU6/vV3dDAwL
	eOCJkBrhuI5zMAZ0sMSxAAFufG7Z5gJeokYxG24=
X-Received: by 2002:a9d:2387:: with SMTP id t7mr9018706otb.68.1547210956041;
	Fri, 11 Jan 2019 04:49:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1504:0:0:0:0 with HTTP; Fri, 11 Jan 2019 04:49:15
	-0800 (PST)
In-Reply-To: <CAFEAcA9xd-MJ7QHgYCyh0D+x_ooXYDCnKYTXELoxz3LbYO4SJw@mail.gmail.com>
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
	<CAFEAcA9xd-MJ7QHgYCyh0D+x_ooXYDCnKYTXELoxz3LbYO4SJw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 11 Jan 2019 13:49:15 +0100
Message-ID: <CAL1e-=gKA9dnfgcJ2QuvbWxjgHya1DfUz4VPRxqakyDVKzH1SA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006d7175057f2e1fef"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-arm] [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster number
 to TCG TB hash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NRnTvcd+f1YI

--0000000000006d7175057f2e1fef
Content-Type: text/plain; charset="UTF-8"

Hello, Peter.

First of all, I want to tell you that I support this series and I salute
efforts in this and related areas. It is known that there have been strong
trends towards asymmetric multi-core systems now for some longish time -
and that QEMU support in that area will greately enhance QEMU itself.

However, being unfamilliar with relevant parts of QEMU internals, allow me
to ask a couple of basic questions:

1. What would be, in more detail, if possible in layman terms, the "bad
case" that this series fixes?

2. Let's suppose, hypothetically, and based on your example from one of
commit messages from this series, that we want to support two multicore
systems:
    A. Cluster 1: 1 core with FPU; cluster 2: 3 cores without FPU
    B. Cluster 1: 2 cores with FPU; cluster 2: 1 core without FPU
Is there an apparatus that would allow the end user specify these and
similar cpnfigurations through command line or acsimilar mean (so, without
QEMU explicitely supporting such core organization, but supporting the
single core in question, of course)? If not, would that be a desirable QEMU
feature?

3. Is there a possibility to have two layer clustering sheme, instead of
one layer? Cluster/subcluster/core instead of cluster/core? For MIPS, there
is a need for such organization. It looks to me 8 bits for cluster id, and
3 bits for subcluster id would be sufficient. In such scheme, the only
change for TCG would be to check both cluster and subcluster id rather than
only cluster id.

Regards,
Aleksandar


On Thursday, January 10, 2019, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 8 Jan 2019 at 16:30, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > Include the cluster number in the hash we use to look
> > up TBs. This is important because a TB that is valid
> > for one cluster at a given physical address and set
> > of CPU flags is not necessarily valid for another:
> > the two clusters may have different views of physical
> > memory, or may have different CPU features (eg FPU
> > present or absent).
> >
> > We put the cluster number in the high 8 bits of the
> > TB cflags. This gives us up to 256 clusters, which should
> > be enough for anybody. If we ever need more, or need
> > more bits in cflags for other purposes, we could make
> > tb_hash_func() take more data (and expand qemu_xxhash7()
> > to qemu_xxhash8()).
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  include/exec/exec-all.h   | 4 +++-
> >  accel/tcg/cpu-exec.c      | 4 ++++
> >  accel/tcg/translate-all.c | 3 +++
> >  3 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> > index 815e5b1e838..aa7b81aaf01 100644
> > --- a/include/exec/exec-all.h
> > +++ b/include/exec/exec-all.h
> > @@ -351,9 +351,11 @@ struct TranslationBlock {
> >  #define CF_USE_ICOUNT  0x00020000
> >  #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock
> held */
> >  #define CF_PARALLEL    0x00080000 /* Generate code for a parallel
> context */
> > +#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
> > +#define CF_CLUSTER_SHIFT 24
> >  /* cflags' mask for hashing/comparison */
> >  #define CF_HASH_MASK   \
> > -    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL)
> > +    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL |
> CF_CLUSTER_MASK)
> >
> >      /* Per-vCPU dynamic tracing state used to generate this TB */
> >      uint32_t trace_vcpu_dstate;
> > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> > index 870027d4359..e578a1a3aee 100644
> > --- a/accel/tcg/cpu-exec.c
> > +++ b/accel/tcg/cpu-exec.c
> > @@ -336,6 +336,10 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu,
> target_ulong pc,
> >          return NULL;
> >      }
> >      desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> > +
> > +    cf_mask &= ~CF_CLUSTER_MASK;
> > +    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> > +
>
> This hunk turns out not to be quite right -- it needs to move
> to the top of the function, before the assignment
> "desc.flags = flags;". Otherwise tb_lookup_cmp() will
> spuriously fail, and execution becomes somewhat slower because
> we have to keep retranslating TBs rather than reusing them.
> (Surprisingly this is only noticeable in an ARM TFM image
> I happen to have, not in Linux kernel boot...)
>
> thanks
> -- PMM
>
>

--0000000000006d7175057f2e1fef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Peter.<div><br></div><div>First of all, I want to tell you that I su=
pport this series and I salute efforts in this and related areas. It is kno=
wn that there have been strong trends towards asymmetric multi-core systems=
 now for some longish time - and that QEMU support in that area will greate=
ly enhance QEMU itself.</div><div><br></div><div>However, being unfamilliar=
 with relevant parts of QEMU internals, allow me to ask a couple of basic q=
uestions:</div><div><br></div><div>1. What would be, in more detail, if pos=
sible in layman terms, the &quot;bad case&quot; that this series fixes?</di=
v><div><br></div><div>2. Let&#39;s suppose, hypothetically, and based on yo=
ur example from one of commit messages from this series, that we want to su=
pport two multicore systems:</div><div>=C2=A0 =C2=A0 A. Cluster 1: 1 core w=
ith FPU; cluster 2: 3 cores without FPU</div><div>=C2=A0 =C2=A0 B. Cluster =
1: 2 cores with FPU; cluster 2: 1 core without FPU</div><div>Is there an ap=
paratus that would allow the end user specify these and similar cpnfigurati=
ons through command line or acsimilar mean (so, without QEMU explicitely su=
pporting such core organization, but supporting the single core in question=
, of course)? If not, would that be a desirable QEMU feature?</div><div><br=
></div><div>3. Is there a possibility to have two layer clustering sheme, i=
nstead of one layer? Cluster/subcluster/core instead of cluster/core? For M=
IPS, there is a need for such organization. It looks to me 8 bits for clust=
er id, and 3 bits for subcluster id would be sufficient. In such scheme, th=
e only change for TCG would be to check both cluster and subcluster id rath=
er than only cluster id.</div><div><br></div><div>Regards,</div><div>Aleksa=
ndar</div><div><br><br>On Thursday, January 10, 2019, Peter Maydell &lt;<a =
href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@li=
naro.org</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 8 Jan 201=
9 at 16:30, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" t=
arget=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Include the cluster number in the hash we use to look<br>
&gt; up TBs. This is important because a TB that is valid<br>
&gt; for one cluster at a given physical address and set<br>
&gt; of CPU flags is not necessarily valid for another:<br>
&gt; the two clusters may have different views of physical<br>
&gt; memory, or may have different CPU features (eg FPU<br>
&gt; present or absent).<br>
&gt;<br>
&gt; We put the cluster number in the high 8 bits of the<br>
&gt; TB cflags. This gives us up to 256 clusters, which should<br>
&gt; be enough for anybody. If we ever need more, or need<br>
&gt; more bits in cflags for other purposes, we could make<br>
&gt; tb_hash_func() take more data (and expand qemu_xxhash7()<br>
&gt; to qemu_xxhash8()).<br>
&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/exec/exec-all.h=C2=A0 =C2=A0| 4 +++-<br>
&gt;=C2=A0 accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
&gt;=C2=A0 accel/tcg/translate-all.c | 3 +++<br>
&gt;=C2=A0 3 files changed, 10 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
&gt; index 815e5b1e838..aa7b81aaf01 100644<br>
&gt; --- a/include/exec/exec-all.h<br>
&gt; +++ b/include/exec/exec-all.h<br>
&gt; @@ -351,9 +351,11 @@ struct TranslationBlock {<br>
&gt;=C2=A0 #define CF_USE_ICOUNT=C2=A0 0x00020000<br>
&gt;=C2=A0 #define CF_INVALID=C2=A0 =C2=A0 =C2=A00x00040000 /* TB is stale.=
 Set with @jmp_lock held */<br>
&gt;=C2=A0 #define CF_PARALLEL=C2=A0 =C2=A0 0x00080000 /* Generate code for=
 a parallel context */<br>
&gt; +#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */<br=
>
&gt; +#define CF_CLUSTER_SHIFT 24<br>
&gt;=C2=A0 /* cflags&#39; mask for hashing/comparison */<br>
&gt;=C2=A0 #define CF_HASH_MASK=C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALL=
EL)<br>
&gt; +=C2=A0 =C2=A0 (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALL=
EL | CF_CLUSTER_MASK)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Per-vCPU dynamic tracing state used to generate=
 this TB */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t trace_vcpu_dstate;<br>
&gt; diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c<br>
&gt; index 870027d4359..e578a1a3aee 100644<br>
&gt; --- a/accel/tcg/cpu-exec.c<br>
&gt; +++ b/accel/tcg/cpu-exec.c<br>
&gt; @@ -336,6 +336,10 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu,=
 target_ulong pc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 desc.phys_page1 =3D phys_pc &amp; TARGET_PAGE_MASK=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cf_mask &amp;=3D ~CF_CLUSTER_MASK;<br>
&gt; +=C2=A0 =C2=A0 cf_mask |=3D cpu-&gt;cluster_index &lt;&lt; CF_CLUSTER_=
SHIFT;<br>
&gt; +<br>
<br>
This hunk turns out not to be quite right -- it needs to move<br>
to the top of the function, before the assignment<br>
&quot;desc.flags =3D flags;&quot;. Otherwise tb_lookup_cmp() will<br>
spuriously fail, and execution becomes somewhat slower because<br>
we have to keep retranslating TBs rather than reusing them.<br>
(Surprisingly this is only noticeable in an ARM TFM image<br>
I happen to have, not in Linux kernel boot...)<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div>

--0000000000006d7175057f2e1fef--
