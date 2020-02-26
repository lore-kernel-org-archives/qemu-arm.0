Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3240455lfg;
        Wed, 26 Feb 2020 07:56:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSlFCNBapEyCxWQKEMHVisEKcBDgHIqgNeKLFcPduqCnAdQ04cVsdqv7QGfY5HrAgAGrc+
X-Received: by 2002:a81:b143:: with SMTP id p64mr4631435ywh.78.1582732576052;
        Wed, 26 Feb 2020 07:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582732576; cv=none;
        d=google.com; s=arc-20160816;
        b=bpjd/6wBl5TYfWhhxHQ9O6I3HFEbdYa5Kf60N/aqstDIeZc4FD06qc9+w0fSfDIkCj
         7pWsbeB9qTjZV+g7L3jNpf7lyzTGejW2Ci0NvaMxWG9k73XwLCwjiFtY6gDx1tD8gJFl
         8cBEj57O9nvbH56326i8dpjVPc6KaaPP9OBsNznc3efq+931yNM74EV/gJLQGwiMCf8Y
         KHa++el4DB5AkQ/cXWwbI+/LO3WpSwIBwXTzdAq5hAJ9yJH+QKSR8OrsqWgEvhDfeCFs
         QP56mL/YOhvF8yMsQ4UK7gzZGfOenZEjqhXty4fqUZXdJSyGj0Ok8S9uHiH/KFBNqroK
         V3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=1igi9ykotGU2A39oy4h2Af1zX9tVmd6s3/K2j/j0AqY=;
        b=xS6TGrE6jGVDlkzXE1Xug4zeOGdkAvsZi/jzgH26L2CBD0WvdDNHgCvh7EcuWtZwsp
         zqHsv2x6FtTWZ+huA/Vmmya6rrL0/djCMru7SJsJDSyPSomVUsvzV+ra7OoaAwXDqMUv
         p2Yc61Rv/ABKt2gjEw6L3lko7vPhBWooMQyorem6Env197gfxtduaos+0dDFIborjAXN
         ggc7edVC9B72d2Tdd8Rg7HB+uElqEWzdzwgB8ft+QPps6Aw9aq0LsqPcz3+B8eYCHS0O
         9WaaIggAh8vZPimUV2NqYVl8XGEfoZtrLdH9Sg0eMsR1H2B1uPi3chTpdzFf5xP6TsCS
         NuPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZSJZFAj7;
       spf=pass (google.com: domain of imammedo@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id x62si1417184ywf.414.2020.02.26.07.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Feb 2020 07:56:16 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZSJZFAj7;
       spf=pass (google.com: domain of imammedo@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582732575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1igi9ykotGU2A39oy4h2Af1zX9tVmd6s3/K2j/j0AqY=;
	b=ZSJZFAj7SCMfs/FKs7+tjG085laJooiKib7vCTwLEVMybp0rXViOAYsuOVNKw4R1Ec/jTH
	405PMLoCVex1of1L29Eu7H5bDV3y25+Ae8I0W7A9y5K/62MIC/O7CjKBK/tzvk+p3yYQwv
	Hb5ZYrRs+dOLvoxCSyKR/lD4fnI8oqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-C3qV1A0YN3qBnw-mBoZ_gg-1; Wed, 26 Feb 2020 10:56:14 -0500
X-MC-Unique: C3qV1A0YN3qBnw-mBoZ_gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7D76801E5C;
	Wed, 26 Feb 2020 15:56:12 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45FBA399;
	Wed, 26 Feb 2020 15:56:11 +0000 (UTC)
Date: Wed, 26 Feb 2020 16:56:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org, Niek
 Linnenbank <nieklinnenbank@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] accel/tcg: remove link between guest ram and TCG cache
 size
Message-ID: <20200226165609.48a0b5d8@redhat.com>
In-Reply-To: <20200226152710.31751-1-alex.bennee@linaro.org>
References: <20200226152710.31751-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KcJDnrTuxfBz

On Wed, 26 Feb 2020 15:27:10 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Basing the TB cache size on the ram_size was always a little heuristic
> and was broken by a1b18df9a4 which caused ram_size not to be fully
> realised at the time we initialise the TCG translation cache.
>=20
> At the same time the default code generation size seems mainly set to
> deal with the fact we use a static code buffer for CONFIG_USER to
> avoid mmap allocation problems on constrained systems. So we:
>=20
>   - only use a static code buffer on 32 bit systems
>   - up the default buffer size for bigger systems
>   - ignore the ram_size and just go with the default
>   - document the fact tb-size is ignored for 32 bit linux-user
>=20
> The could potentially slow down softmmu emulation on 32 bit systems
> with lots (3gb?) of spare memory. Those users can still manually up
> the tb-size via the command line if they do in fact exist.
>=20
> Fixes: a1b18df9a4
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
>  accel/tcg/translate-all.c | 23 ++++++++++-------------
>  qemu-options.hx           |  3 ++-
>  2 files changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index a08ab11f657..cdfa2db7c56 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -891,11 +891,12 @@ static void page_lock_pair(PageDesc **ret_p1, tb_pa=
ge_addr_t phys1,
>      }
>  }
> =20
> -#if defined(CONFIG_USER_ONLY)
> -/* Currently it is not recommended to allocate big chunks of data in
> -   user mode. It will change when a dedicated libc will be used.  */
> -/* ??? 64-bit hosts ought to have no problem mmaping data outside the
> -   region in which the guest needs to run.  Revisit this.  */
> +#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS =3D=3D 32
> +/*
> + * For user mode on smaller 32 bit systems we may run into trouble
> + * allocating big chunks of data in the right place. On these systems
> + * we utilise a static code generation buffer directly in the binary.
> + */
>  #define USE_STATIC_CODE_GEN_BUFFER
>  #endif
> =20
> @@ -927,7 +928,11 @@ static void page_lock_pair(PageDesc **ret_p1, tb_pag=
e_addr_t phys1,
>  # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>  #endif
> =20
> +#if TCG_TARGET_REG_BITS =3D=3D 32
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32u * 1024 * 1024)
> +#else
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2ul * 1024 * 1024 * 1024)

I wonder how resource constrained CI VMs going to react to this jump
from current default ram size (128M) buffer size (32M).

> +#endif
> =20
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>    (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
> @@ -937,15 +942,7 @@ static inline size_t size_code_gen_buffer(size_t tb_=
size)
>  {
>      /* Size the buffer.  */
>      if (tb_size =3D=3D 0) {
> -#ifdef USE_STATIC_CODE_GEN_BUFFER
>          tb_size =3D DEFAULT_CODE_GEN_BUFFER_SIZE;
> -#else
> -        /* ??? Needs adjustments.  */
> -        /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
> -           static buffer, we could size this on RESERVED_VA, on the text
> -           segment size of the executable, or continue to use the defaul=
t.  */
> -        tb_size =3D (unsigned long)(ram_size / 4);
> -#endif
>      }
>      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
>          tb_size =3D MIN_CODE_GEN_BUFFER_SIZE;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ac315c1ac45..0a4bbdb8eb9 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -139,7 +139,8 @@ irqchip completely is not recommended except for debu=
gging purposes.
>  @item kvm-shadow-mem=3Dsize
>  Defines the size of the KVM shadow MMU.
>  @item tb-size=3D@var{n}
> -Controls the size (in MiB) of the TCG translation block cache.
> +Controls the size (in MiB) of the TCG translation block cache. It has no=
 effect on
> +32 bit linux-user binaries.
linux-user doesn't have tb-size option so this hunk could be dropped

>  @item thread=3Dsingle|multi
>  Controls number of TCG threads. When the TCG is multi-threaded there wil=
l be one
>  thread per vCPU therefor taking advantage of additional host cores. The =
default
