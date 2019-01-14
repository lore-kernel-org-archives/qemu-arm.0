Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2528582wrt;
        Sun, 13 Jan 2019 17:09:02 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6vtrs6EIWLPfgaWGZf61EyHgNYSgURNXkT7aiHjC7kl6Pv5a66ZqX16nlUGjtrpFepE12p
X-Received: by 2002:a1c:4046:: with SMTP id n67mr9366430wma.123.1547428142537;
        Sun, 13 Jan 2019 17:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428142; cv=none;
        d=google.com; s=arc-20160816;
        b=U2+K+W7xsEH0iE3vfjUU3tAcBRXezpu/GzRrp4xSVkFrvACfmxePhRQtMN+3WbL2dM
         WAFAUORWGw5mkgsvavM78+Tpe02WNOsG94hd2C64Dsj3d/VoHSbw8B+2vnS39msuMkd5
         7a+arAu/woQER+xLmrT/HL98upWX2jH9ThwtWlhGsBHEnYdFz7n7iFIVEVBnbFy8+5bb
         /XG81mk+Hi5KSgRYy4NP42+GyfLIjQe7A01P7PHTfD1e3VEoD6yber2JOluTpjyuW83F
         6uRmln65q+nSBJqQ8y3Ssuljk8KVGiI7HRZrdX9KYq7JAoVf1x2wOIZzOT6LipZTyXuy
         RUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Y8olnyWyh7+819qCEh7Tz8uO9UwXBOUBaFJYgBaNjz0=;
        b=eG9bUUuvOZgl/4+fpp7smImO4AL7p1V+khzRo5XwOi+Q2B346PLu19t7qeLyxU6Bew
         VzQk/OIxNIBJsymSV21MSTBLxWkcFx+SIs+96KQBtlU0om7fe+gl8fPJ/o3+IYcRAKuQ
         lbPIkI1b7O2tRrM917eXdNew0rdOPk4kbhdTfCWrKR2gCOHAt00Q9xFLJLCaBR6HeqkK
         HwYU7czGtjA8MkQVkLrzpHVRBnRXOU3Ax00PhDtWiPZsicrJNkyZ2HI5osoBY3SasRwI
         SqrZL8eimniWuhK0VABCKoo38V/z1cAUS3AMn7+nbgg3xT0faRwL59LgkAtj1n+D6wxC
         qrXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=spFId+rU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si8064660wrw.65.2019.01.13.17.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:09:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=spFId+rU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:53513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqkP-0004SA-H1
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1giqkF-0004Rl-FH
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:08:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1giqkE-0007d4-7v
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:08:51 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37932)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1giqkD-0007ck-Uc; Sun, 13 Jan 2019 20:08:50 -0500
Received: by mail-ot1-x344.google.com with SMTP id e12so17972688otl.5;
	Sun, 13 Jan 2019 17:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y8olnyWyh7+819qCEh7Tz8uO9UwXBOUBaFJYgBaNjz0=;
	b=spFId+rUIoxu78v5slJYOyNKmrshOYCy6gn3+84swSRzCDo41FUciJSmij8R1bvBKe
	JXImJJa8l4K5FWh/8UctM4zfq1CgfGXkiyOLPrMt6ErfVxCWmjC/qI+nu+tyxdJNa51I
	oL7vvANvctDPPHKijuQPGPWg8JDUxv3HLfm2FRVbjyMMWPFT1QYOLvAl3UefnV9YJlrt
	dBPHHAvo3w7bJ9hYakiExt9WjwbdAAEa+4tzCnnnAxWLYZ6GxwijvSyi3eft1VU03BVo
	uyb1vqS3DcslF0PnGNbxdFcZvpOpnZ1bbNQoB1uahjoG6AIvA5/OByv0N2kDS7/U+RTy
	SRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y8olnyWyh7+819qCEh7Tz8uO9UwXBOUBaFJYgBaNjz0=;
	b=T0yuWmnt1DNaJzClCe0zUT+vF08oCtMIVru2Ve6JhekfuK+a6ipAeXoQMYBTzpZs5T
	QYbvspZYn2K1CX6fZFH/DrSDT+1O9PEt3RKMF7X6WGMLtbmy8uteBeGHev3L0QuOOTFU
	WJnQVSZOBuGVD99kw1TIe3Hy7AmNe7XuAGz31fSWcrEanO6I0UsppX7139uTr8qNM0nm
	TtBqKZp0eEVNja8ttjjEWWCZaEXlc+msgvZmU3I1C7+Hi4iaWH7LK6FiKy/cFUGvlIQC
	jGOD3yRkgPHLtWZY8/Y7NNjhUWPV4QIGbZ5ne9WTZubRIVybnbCcA0rbKsKepnmCE8Ee
	/3Cw==
X-Gm-Message-State: AJcUukc95kR4nMvpAwRN1X07esnP/5ChnYZpcimAfaBSgtjD7q21dzIZ
	z9RznIJj0Cr8L1WKfzyCwN7mSc5jSoVylUAf7yo=
X-Received: by 2002:a05:6830:14c4:: with SMTP id
	t4mr11459276otq.303.1547428129001; 
	Sun, 13 Jan 2019 17:08:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1504:0:0:0:0 with HTTP; Sun, 13 Jan 2019 17:08:48
	-0800 (PST)
In-Reply-To: <20190108163008.7006-4-peter.maydell@linaro.org>
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 14 Jan 2019 02:08:48 +0100
Message-ID: <CAL1e-=gtbka64eAhVdbPyLa4+HP-OSQRg7u6+SC-8MCRgoZ9Qw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f1d3ac057f60af8c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster
 number to TCG TB hash
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OH5VMELhzgY3

--000000000000f1d3ac057f60af8c
Content-Type: text/plain; charset="UTF-8"

On Tuesday, January 8, 2019, Peter Maydell <peter.maydell@linaro.org> wrote:

> Include the cluster number in the hash we use to look
> up TBs. This is important because a TB that is valid
> for one cluster at a given physical address and set
> of CPU flags is not necessarily valid for another:
> the two clusters may have different views of physical
> memory, or may have different CPU features (eg FPU
> present or absent).
>
>
Hi, Peter.

I do understand the definition of cluster_index in the sense of this
series. However, it looks to me that the term "cluster" is generally
overused in areas where we work. This may lead to some confusion for future
developers, and let me suggest some other name, like "tcg_cluster_index" or
"tcg_group_id", or "translation_group_id". Admitedly, they all sound ugly
to me too. But having the name that would clearly separate this id from too
generic "cluster_index" IMHO would save lots of time during potential
related future development.

(Needled to say that,  for example, we in MIPS, for multi-core sustems,
group cores in clusters, that actually do not have anything to do with
clusters in TCG sense...)

Sincerely,

Aleksandar



> We put the cluster number in the high 8 bits of the
> TB cflags. This gives us up to 256 clusters, which should
> be enough for anybody. If we ever need more, or need
> more bits in cflags for other purposes, we could make
> tb_hash_func() take more data (and expand qemu_xxhash7()
> to qemu_xxhash8()).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/exec-all.h   | 4 +++-
>  accel/tcg/cpu-exec.c      | 4 ++++
>  accel/tcg/translate-all.c | 3 +++
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 815e5b1e838..aa7b81aaf01 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -351,9 +351,11 @@ struct TranslationBlock {
>  #define CF_USE_ICOUNT  0x00020000
>  #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held
> */
>  #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context
> */
> +#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
> +#define CF_CLUSTER_SHIFT 24
>  /* cflags' mask for hashing/comparison */
>  #define CF_HASH_MASK   \
> -    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL)
> +    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL |
> CF_CLUSTER_MASK)
>
>      /* Per-vCPU dynamic tracing state used to generate this TB */
>      uint32_t trace_vcpu_dstate;
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 870027d4359..e578a1a3aee 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -336,6 +336,10 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu,
> target_ulong pc,
>          return NULL;
>      }
>      desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> +
> +    cf_mask &= ~CF_CLUSTER_MASK;
> +    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>      h = tb_hash_func(phys_pc, pc, flags, cf_mask, *cpu->trace_dstate);
>      return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
>  }
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 639f0b27287..ba27f5acc8c 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1692,6 +1692,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>          cflags |= CF_NOCACHE | 1;
>      }
>
> +    cflags &= ~CF_CLUSTER_MASK;
> +    cflags |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>   buffer_overflow:
>      tb = tb_alloc(pc);
>      if (unlikely(!tb)) {
> --
> 2.19.2
>
>
>

--000000000000f1d3ac057f60af8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, January 8, 2019, Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Include the cluster number in the hash we use to loo=
k<br>
up TBs. This is important because a TB that is valid<br>
for one cluster at a given physical address and set<br>
of CPU flags is not necessarily valid for another:<br>
the two clusters may have different views of physical<br>
memory, or may have different CPU features (eg FPU<br>
present or absent).<br>
<br></blockquote><div><br></div><div>Hi, Peter.</div><div><br></div><div>I =
do understand the definition of cluster_index in the sense of this series. =
However, it looks to me that the term &quot;cluster&quot; is generally over=
used in areas where we work. This may lead to some confusion for future dev=
elopers, and let me suggest some other name, like &quot;tcg_cluster_index&q=
uot; or &quot;tcg_group_id&quot;, or &quot;translation_group_id&quot;. Admi=
tedly, they all sound ugly to me too. But having the name that would clearl=
y separate this id from too generic &quot;cluster_index&quot; IMHO would sa=
ve lots of time during potential related future development.</div><div><br>=
</div><div>(Needled to say that,=C2=A0 for example, we in MIPS, for multi-c=
ore sustems, group cores in clusters, that actually do not have anything to=
 do with clusters in TCG sense...)</div><div><br></div><div>Sincerely,</div=
><div><br></div><div>Aleksandar</div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
We put the cluster number in the high 8 bits of the<br>
TB cflags. This gives us up to 256 clusters, which should<br>
be enough for anybody. If we ever need more, or need<br>
more bits in cflags for other purposes, we could make<br>
tb_hash_func() take more data (and expand qemu_xxhash7()<br>
to qemu_xxhash8()).<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/exec-all.h=C2=A0 =C2=A0| 4 +++-<br>
=C2=A0accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
=C2=A0accel/tcg/translate-all.c | 3 +++<br>
=C2=A03 files changed, 10 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index 815e5b1e838..aa7b81aaf01 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -351,9 +351,11 @@ struct TranslationBlock {<br>
=C2=A0#define CF_USE_ICOUNT=C2=A0 0x00020000<br>
=C2=A0#define CF_INVALID=C2=A0 =C2=A0 =C2=A00x00040000 /* TB is stale. Set =
with @jmp_lock held */<br>
=C2=A0#define CF_PARALLEL=C2=A0 =C2=A0 0x00080000 /* Generate code for a pa=
rallel context */<br>
+#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */<br>
+#define CF_CLUSTER_SHIFT 24<br>
=C2=A0/* cflags&#39; mask for hashing/comparison */<br>
=C2=A0#define CF_HASH_MASK=C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL)<b=
r>
+=C2=A0 =C2=A0 (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | =
CF_CLUSTER_MASK)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Per-vCPU dynamic tracing state used to generate this=
 TB */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t trace_vcpu_dstate;<br>
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c<br>
index 870027d4359..e578a1a3aee 100644<br>
--- a/accel/tcg/cpu-exec.c<br>
+++ b/accel/tcg/cpu-exec.c<br>
@@ -336,6 +336,10 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, targ=
et_ulong pc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0desc.phys_page1 =3D phys_pc &amp; TARGET_PAGE_MASK;<br>
+<br>
+=C2=A0 =C2=A0 cf_mask &amp;=3D ~CF_CLUSTER_MASK;<br>
+=C2=A0 =C2=A0 cf_mask |=3D cpu-&gt;cluster_index &lt;&lt; CF_CLUSTER_SHIFT=
;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0h =3D tb_hash_func(phys_pc, pc, flags, cf_mask, *cpu-&g=
t;trace_dstate);<br>
=C2=A0 =C2=A0 =C2=A0return qht_lookup_custom(&amp;tb_ctx.<wbr>htable, &amp;=
desc, h, tb_lookup_cmp);<br>
=C2=A0}<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index 639f0b27287..ba27f5acc8c 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -1692,6 +1692,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cflags |=3D CF_NOCACHE | 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 cflags &amp;=3D ~CF_CLUSTER_MASK;<br>
+=C2=A0 =C2=A0 cflags |=3D cpu-&gt;cluster_index &lt;&lt; CF_CLUSTER_SHIFT;=
<br>
+<br>
=C2=A0 buffer_overflow:<br>
=C2=A0 =C2=A0 =C2=A0tb =3D tb_alloc(pc);<br>
=C2=A0 =C2=A0 =C2=A0if (unlikely(!tb)) {<br>
-- <br>
2.19.2<br>
<br>
<br>
</blockquote>

--000000000000f1d3ac057f60af8c--
