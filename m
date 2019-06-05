Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3679772wrg;
        Wed, 5 Jun 2019 14:18:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxs/9H8g+K6sO68JrAGjvJMTEgqfSMmyuj7u2C9luX8x9q3by/J5EHUmOptrXfWUHiOb+G2
X-Received: by 2002:a37:9506:: with SMTP id x6mr23306656qkd.107.1559769522090;
        Wed, 05 Jun 2019 14:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559769522; cv=none;
        d=google.com; s=arc-20160816;
        b=VKPL1yTHuGcA0u47fxOyaaqCTYO9XCvcpbAQWyxL66OSgpBR1lTkaTmP66Rq/YAMEm
         roSETAPoVx81yXL3+cJixifyD+xCaeY0LNyyvb0r+DUg2kPgHX1NfzOETPndiMXXXt7y
         KftR1m0sc5eGlbFxWB/l0oYcOEOnSJ3RWw+/FWlrsZcm2T5KzOFP2hWL34XeGj4/lC+U
         KHflFOQnP7IguBg9Su1Lzzvyk5/XB00opRsFDqO+js/er4/K7J4bnWIJQZwJP3tNDigK
         HtWsl8fD5hE2Rs9GTlDW/kcnCxsXm5TyNtY8vHGa2uAqvJCXghXePOKHAm5cKuOrTmWU
         gDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=bQVHAIuc8cylmO4EtZU3JgpNo/hW/0t6dfoknwfUJfQ=;
        b=CdFx7F5e1URy+5YJlislzfx8LupNSrpEd5/pujKojC1U5yu6GVeQ1hsjLlHBayd1Pz
         SRSqeEIPzSdf07p8WRymkrIlQYYy8Erdv5gHp3Fc89exnr/cQDUB8sr/1GP/IrS/rIyr
         62P3pdk6z/1XyJlZyy7kU6JMDhrYyoy0hqAQkyQoHGUb5Mlk9sYO8dOuOglgk/e9+V3n
         5Zp2mJ8eiwo21HuEnCftb+HYF/qRqixzSldKAW/ay7zpdPCVzTOU3vFykM4zj7w8/BAN
         o/lrnSAWTZqNEfObR3sFPsmMxnnD8YxRweiyZAy7sVBFc43BxH4KlMw3jlppnf83YWAr
         tP5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OHqr7Bd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si5435582qtj.159.2019.06.05.14.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 14:18:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OHqr7Bd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:50316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYdIv-0004up-FF
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 17:18:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hYdI4-0004SM-C7
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 17:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hYdHz-0004NI-HQ
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 17:17:47 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36623)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1hYdHj-00046R-Lg; Wed, 05 Jun 2019 17:17:28 -0400
Received: by mail-ot1-x343.google.com with SMTP id c3so2138971otr.3;
	Wed, 05 Jun 2019 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bQVHAIuc8cylmO4EtZU3JgpNo/hW/0t6dfoknwfUJfQ=;
	b=OHqr7Bd89Ikoj2lm3Ar9o2YyiUZjEV2IOLT7fkMQ6YffGlkA6Jh+EdizoiXLRu+k1y
	BqhsGDSR9OqkKfVo7iF7qZANkrwfOI+yhIYtNIc2ThDX4gGNZ3+HnjrfGjvFOccn+WFu
	EXRhdwYsv+69zgSn5TR/oOqFy4uyCo9m/8D9JaFPS+TE3JxgvaSwh3khkaNFzpHA+OcL
	YIM4QPIVvV/U4BOlqdJbQjj5/V/LNjwbKF1gLativX1qHzbZ+4BEyjAnXDZJx8F6sm67
	6Dks23+QhV4QIe6VNbcBFLxq/ZV0NtCk1uZpqSps+BSVmu6jzY4O++h3TbQbyKSycjTe
	q2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bQVHAIuc8cylmO4EtZU3JgpNo/hW/0t6dfoknwfUJfQ=;
	b=hP2jdLhlQGJ8CjIcK1pFsfiJaT3JYnZIKRJs3A0gNq+gKcU8uml13CrVVacqP73YSC
	DetGQiSbQ+q+7S9BGZtUWIhVZ3aAV798ZBye32k8Z+hVzhXhl+iixdHjy0W0ve6DHFfJ
	WviTdv0XRqfHqhJxeyiM+XjMmgK1lyXq2BhPQj1GuXWTdHOM4oPcay4QWVWXN6VrVNns
	Uly+cAbLjhUl3wF6Cwu6b1bKQCJsIUJN47bDec7TvxpUOlAnpjsx7cC5zQqQkygrIxfg
	oziPxXPCxz4AqkX3wM4rzmNYdAqYEusL9ZIYZniPV7WUaflOU/ffpYw5wWmIFakw0nrv
	w0QQ==
X-Gm-Message-State: APjAAAVKJ05z5TMTj3VaNheLpOhqalkGF3VpUWJOkpW7t62rKYfpWzeF
	AOqQ325p458MvXqwBwwOo5gEaB6fzCe09ODfa8k=
X-Received: by 2002:a9d:6ad7:: with SMTP id m23mr5634375otq.306.1559769445254; 
	Wed, 05 Jun 2019 14:17:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP;
	Wed, 5 Jun 2019 14:17:24 -0700 (PDT)
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP;
	Wed, 5 Jun 2019 14:17:24 -0700 (PDT)
In-Reply-To: <20190605205706.569-5-richard.henderson@linaro.org>
References: <20190605205706.569-1-richard.henderson@linaro.org>
	<20190605205706.569-5-richard.henderson@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 5 Jun 2019 23:17:24 +0200
Message-ID: <CAL1e-=i+9K=gJ8Aw2=vwmORx=CpmffvPpP9Sfb_qAxcpwyN9Jg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b74866058a9a1f81"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 4/6] include/elf: Add defines
 related to notes for GNU systems
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6OfqgN0tcKhT

--000000000000b74866058a9a1f81
Content-Type: text/plain; charset="UTF-8"

On Jun 5, 2019 11:03 PM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> This is a collection of related defines for notes, copied
> from glibc's <elf.h>.  We're not going to use all of these
> right away, but it seemed foolish to cherry-pick only the
> ones we need now.
>

But you are doing exactly that: cherry-picking, but this time according to
some undisclosed criterium. Why don't you state your motivation in the
commit message in a clear way? Why only these items are chosen? Confusing
and confused.

Regards,
Aleksandar

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/elf.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/include/elf.h b/include/elf.h
> index ea7708a4ea..6f3eada36f 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -1650,6 +1650,54 @@ typedef struct elf64_shdr {
>  #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint
registers */
>  #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
>
> +/* Defined note types for GNU systems.  */
> +
> +#define NT_GNU_ABI_TAG          1       /* ABI information */
> +#define NT_GNU_HWCAP            2       /* Synthetic hwcap information */
> +#define NT_GNU_BUILD_ID         3       /* Build ID */
> +#define NT_GNU_GOLD_VERSION     4       /* Version of ld.gold */
> +#define NT_GNU_PROPERTY_TYPE_0  5       /* Program property */
> +
> +/* Values used in GNU .note.gnu.property notes
(NT_GNU_PROPERTY_TYPE_0).  */
> +
> +#define GNU_PROPERTY_STACK_SIZE                 1
> +#define GNU_PROPERTY_NO_COPY_ON_PROTECTED       2
> +
> +#define GNU_PROPERTY_LOPROC                     0xc0000000
> +#define GNU_PROPERTY_HIPROC                     0xdfffffff
> +#define GNU_PROPERTY_LOUSER                     0xe0000000
> +#define GNU_PROPERTY_HIUSER                     0xffffffff
> +
> +#define GNU_PROPERTY_X86_ISA_1_USED             0xc0000000
> +#define GNU_PROPERTY_X86_ISA_1_NEEDED           0xc0000001
> +
> +#define GNU_PROPERTY_X86_ISA_1_486              (1U << 0)
> +#define GNU_PROPERTY_X86_ISA_1_586              (1U << 1)
> +#define GNU_PROPERTY_X86_ISA_1_686              (1U << 2)
> +#define GNU_PROPERTY_X86_ISA_1_SSE              (1U << 3)
> +#define GNU_PROPERTY_X86_ISA_1_SSE2             (1U << 4)
> +#define GNU_PROPERTY_X86_ISA_1_SSE3             (1U << 5)
> +#define GNU_PROPERTY_X86_ISA_1_SSSE3            (1U << 6)
> +#define GNU_PROPERTY_X86_ISA_1_SSE4_1           (1U << 7)
> +#define GNU_PROPERTY_X86_ISA_1_SSE4_2           (1U << 8)
> +#define GNU_PROPERTY_X86_ISA_1_AVX              (1U << 9)
> +#define GNU_PROPERTY_X86_ISA_1_AVX2             (1U << 10)
> +#define GNU_PROPERTY_X86_ISA_1_AVX512F          (1U << 11)
> +#define GNU_PROPERTY_X86_ISA_1_AVX512CD         (1U << 12)
> +#define GNU_PROPERTY_X86_ISA_1_AVX512ER         (1U << 13)
> +#define GNU_PROPERTY_X86_ISA_1_AVX512PF         (1U << 14)
> +#define GNU_PROPERTY_X86_ISA_1_AVX512VL         (1U << 15)
> +#define GNU_PROPERTY_X86_ISA_1_AVX512DQ         (1U << 16)
> +#define GNU_PROPERTY_X86_ISA_1_AVX512BW         (1U << 17)
> +
> +#define GNU_PROPERTY_X86_FEATURE_1_AND          0xc0000002
> +#define GNU_PROPERTY_X86_FEATURE_1_IBT          (1U << 0)
> +#define GNU_PROPERTY_X86_FEATURE_1_SHSTK        (1U << 1)
> +
> +#define GNU_PROPERTY_AARCH64_FEATURE_1_AND      0xc0000000
> +#define GNU_PROPERTY_AARCH64_FEATURE_1_BTI      (1u << 0)
> +#define GNU_PROPERTY_AARCH64_FEATURE_1_PAC      (1u << 1)
> +
>  /*
>   * Physical entry point into the kernel.
>   *
> --
> 2.17.1
>
>

--000000000000b74866058a9a1f81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jun 5, 2019 11:03 PM, &quot;Richard Henderson&quot; &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:=
<br>
&gt;<br>
&gt; This is a collection of related defines for notes, copied<br>
&gt; from glibc&#39;s &lt;elf.h&gt;.=C2=A0 We&#39;re not going to use all o=
f these<br>
&gt; right away, but it seemed foolish to cherry-pick only the<br>
&gt; ones we need now.<br>
&gt;</p>
<p dir=3D"ltr">But you are doing exactly that: cherry-picking, but this tim=
e according to some undisclosed criterium. Why don&#39;t you state your mot=
ivation in the commit message in a clear way? Why only these items are chos=
en? Confusing and confused.</p>
<p dir=3D"ltr">Regards,<br>
Aleksandar</p>
<p dir=3D"ltr">&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:=
richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0include/elf.h | 48 +++++++++++++++++++++++++++++++++++++++++++++=
+++<br>
&gt; =C2=A01 file changed, 48 insertions(+)<br>
&gt;<br>
&gt; diff --git a/include/elf.h b/include/elf.h<br>
&gt; index ea7708a4ea..6f3eada36f 100644<br>
&gt; --- a/include/elf.h<br>
&gt; +++ b/include/elf.h<br>
&gt; @@ -1650,6 +1650,54 @@ typedef struct elf64_shdr {<br>
&gt; =C2=A0#define NT_ARM_HW_WATCH 0x403=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* ARM hardware watchpoint registers */<br>
&gt; =C2=A0#define NT_ARM_SYSTEM_CALL=C2=A0 =C2=A0 =C2=A0 0x404=C2=A0 =C2=
=A0/* ARM system call number */<br>
&gt;<br>
&gt; +/* Defined note types for GNU systems.=C2=A0 */<br>
&gt; +<br>
&gt; +#define NT_GNU_ABI_TAG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* ABI information */<br>
&gt; +#define NT_GNU_HWCAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* Synthetic hwcap information */<br>
&gt; +#define NT_GNU_BUILD_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Build ID */<br>
&gt; +#define NT_GNU_GOLD_VERSION=C2=A0 =C2=A0 =C2=A04=C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Version of ld.gold */<br>
&gt; +#define NT_GNU_PROPERTY_TYPE_0=C2=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=A0/* P=
rogram property */<br>
&gt; +<br>
&gt; +/* Values used in GNU .note.gnu.property notes (NT_GNU_PROPERTY_TYPE_=
0).=C2=A0 */<br>
&gt; +<br>
&gt; +#define GNU_PROPERTY_STACK_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; +#define GNU_PROPERTY_NO_COPY_ON_PROTECTED=C2=A0 =C2=A0 =C2=A0 =C2=A02=
<br>
&gt; +<br>
&gt; +#define GNU_PROPERTY_LOPROC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xc0000000<br>
&gt; +#define GNU_PROPERTY_HIPROC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xdfffffff<br>
&gt; +#define GNU_PROPERTY_LOUSER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xe0000000<br>
&gt; +#define GNU_PROPERTY_HIUSER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xffffffff<br>
&gt; +<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_USED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00xc0000000<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_NEEDED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xc0000001<br>
&gt; +<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_486=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1U &lt;&lt; 0)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_586=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1U &lt;&lt; 1)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_686=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1U &lt;&lt; 2)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_SSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1U &lt;&lt; 3)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_SSE2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(1U &lt;&lt; 4)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_SSE3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(1U &lt;&lt; 5)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_SSSE3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1U &lt;&lt; 6)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_SSE4_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1U &lt;&lt; 7)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_SSE4_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1U &lt;&lt; 8)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1U &lt;&lt; 9)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(1U &lt;&lt; 10)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX512F=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1U &lt;&lt; 11)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX512CD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1U &lt;&lt; 12)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX512ER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1U &lt;&lt; 13)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX512PF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1U &lt;&lt; 14)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX512VL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1U &lt;&lt; 15)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX512DQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1U &lt;&lt; 16)<br>
&gt; +#define GNU_PROPERTY_X86_ISA_1_AVX512BW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1U &lt;&lt; 17)<br>
&gt; +<br>
&gt; +#define GNU_PROPERTY_X86_FEATURE_1_AND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0xc0000002<br>
&gt; +#define GNU_PROPERTY_X86_FEATURE_1_IBT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1U &lt;&lt; 0)<br>
&gt; +#define GNU_PROPERTY_X86_FEATURE_1_SHSTK=C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
1U &lt;&lt; 1)<br>
&gt; +<br>
&gt; +#define GNU_PROPERTY_AARCH64_FEATURE_1_AND=C2=A0 =C2=A0 =C2=A0 0xc000=
0000<br>
&gt; +#define GNU_PROPERTY_AARCH64_FEATURE_1_BTI=C2=A0 =C2=A0 =C2=A0 (1u &l=
t;&lt; 0)<br>
&gt; +#define GNU_PROPERTY_AARCH64_FEATURE_1_PAC=C2=A0 =C2=A0 =C2=A0 (1u &l=
t;&lt; 1)<br>
&gt; +<br>
&gt; =C2=A0/*<br>
&gt; =C2=A0 * Physical entry point into the kernel.<br>
&gt; =C2=A0 *<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</p>

--000000000000b74866058a9a1f81--
