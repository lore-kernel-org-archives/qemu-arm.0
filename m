Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2785490lfq;
        Mon, 11 Jan 2021 07:52:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWuXbr8eZcpjpwW78hwi/gUX/CAdo23jxapXjNxLtnhC1YcWgjMkW4apTsWtTKIZTon/k8
X-Received: by 2002:a5b:4c3:: with SMTP id u3mr496583ybp.261.1610380321639;
        Mon, 11 Jan 2021 07:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610380321; cv=none;
        d=google.com; s=arc-20160816;
        b=BErXBn7FRc161sMIf9/Hg6b6P/GWA5FtLZLmbeVVT3Nm+hl3drEimAJgeOmYnBUhA+
         0todvY0CH3lCZ2kNhas7jfV3Z6dpP8yC3MwifaDGrjmFm/1nC/z8RM1x1rnUCm+dBb93
         758GNIxoIm4LzOGzTUFJq3Kf5yPZ+NDya994qiXy/GIOwd1A73l9S54EyQK4rPLnF+gK
         i700mWSuClJJf0qhixD7plwGwuye9UqXePHXMCzLLEtndIo35cbX2KaJyfC0o4k+GUup
         htFR73qedEM4v2UVOwj1jKKDSHO6iJKHX4joaZ6WtxTQ3zHuYnFkOr+i6fjz/MrrZJZ1
         T+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :thread-index:thread-topic:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=Q6BqBBz/LmyyAaTw3+NjQTsglvnsrykSxnC/U1btFcA=;
        b=HbHXAljG1JM4ecwKH6ZiqTUx0CL8xAJ73ZxTINMOOPOvpO/7iMZp73vk0hhWJ3rNKR
         RM4sdaamN4orBV/fVHaD3j8ULqAO06Gc8B0IEis7Y0OVCUSiwOSwDupu5GZRhFBecU5/
         v0UAGKPWJT3KrkvO0qSYFNWqe6znaMkLUxORXgGhkqp5bVnOoXcDsM0D9rc+rN9Tcz47
         xCtXWon39kIcv0la60p6vQxeE3QrvC3DxgYqp/C2p3KMqqql8V2fCInO4WxqnhYKsS8l
         psQCvohdDMhHkxw9zyKB2r0R+0KRrabyRVsGqm6XBQ93qsGu9qeDF4COb2ak+DnkFak2
         EB3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q4+v8z60;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o83si164015ybc.486.2021.01.11.07.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 07:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q4+v8z60;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyzU9-0002T7-2D
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 10:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyzS2-0000Cs-P7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:49:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyzRz-00083k-5q
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610380185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6BqBBz/LmyyAaTw3+NjQTsglvnsrykSxnC/U1btFcA=;
 b=Q4+v8z60fcNIcwd22PqevNVpqkS6/2YvXOC1G1oDQTVdnhpRthV8dIBCYZlebPbxtTom9y
 YTKHtpuyJkaVtfHbym6USHwfbHJOcVeuLQMFsML8W/093div47kXAw28BSCxW1BE3htPXq
 uFvvaXzIVFbFTzHtNYOi2Nkd03ZwuSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Gp_AoUSgMXucHrpaH7Rzsw-1; Mon, 11 Jan 2021 10:49:41 -0500
X-MC-Unique: Gp_AoUSgMXucHrpaH7Rzsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A75A803628;
 Mon, 11 Jan 2021 15:49:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1175017C5F;
 Mon, 11 Jan 2021 15:49:39 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E86F18095C7;
 Mon, 11 Jan 2021 15:49:38 +0000 (UTC)
Date: Mon, 11 Jan 2021 10:49:37 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <245930420.32442484.1610380177977.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210111150114.1415930-5-f4bug@amsat.org>
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <20210111150114.1415930-5-f4bug@amsat.org>
Subject: Re: [RFC PATCH 4/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
MIME-Version: 1.0
X-Originating-IP: [10.40.192.93, 10.4.195.1]
Thread-Topic: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
Thread-Index: NYNXgELFV+TcZBY9QJ2v3tKDyrLcCQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-riscv@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mG4xaT2EmhHe

----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> To: qemu-devel@nongnu.org
> Cc: "Huacai Chen" <chenhuacai@kernel.org>, "Aurelien Jarno" <aurelien@aur=
el32.net>, "Aleksandar Rikalo"
> <aleksandar.rikalo@syrmia.com>, "Thomas Huth" <thuth@redhat.com>, "Stefan=
 Weil" <sw@weilnetz.de>,
> qemu-riscv@nongnu.org, qemu-arm@nongnu.org, "Jiaxun Yang" <jiaxun.yang@fl=
ygoat.com>, qemu-s390x@nongnu.org,
> "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>, "Cornelia Huck" <cohuck@=
redhat.com>, "Richard Henderson"
> <richard.henderson@linaro.org>, "Andrzej Zaborowski" <balrogg@gmail.com>,=
 "Alistair Francis"
> <Alistair.Francis@wdc.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Miros=
lav Rezanina" <mrezanin@redhat.com>
> Sent: Monday, January 11, 2021 4:01:13 PM
> Subject: [RFC PATCH 4/5] tcg: Restrict tcg_out_op() to arrays of TCG_MAX_=
OP_ARGS elements
>=20
> tcg_reg_alloc_op() allocates arrays of TCG_MAX_OP_ARGS elements.
>=20
> The Aarch64 target already does this since commit 8d8db193f25
> ("tcg-aarch64: Hoist common argument loads in tcg_out_op"),
> SPARC since commit b357f902bff ("tcg-sparc: Hoist common argument
> loads in tcg_out_op").
>=20
> RISCV missed it upon introduction in commit bdf503819ee
> ("tcg/riscv: Add the out op decoder"), MIPS since commit
> 22ee3a987d5 ("tcg-mips: Hoist args loads") and i386 since
> commit 42d5b514928 ("tcg/i386: Hoist common arguments in
> tcg_out_op").
>=20
> Provide this information as a hint to the compiler in the function
> prototype, and update the funtion definitions.
>=20
> This fixes this warning (using GCC 11):
>=20
>     tcg/aarch64/tcg-target.c.inc:1855:37: error: argument 3 of type 'cons=
t
>     TCGArg[16]' {aka 'const long unsigned int[16]'} with mismatched bound
>     [-Werror=3Darray-parameter=3D]
>     tcg/aarch64/tcg-target.c.inc:1856:34: error: argument 4 of type 'cons=
t
>     int[16]' with mismatched bound [-Werror=3Darray-parameter=3D]
>=20
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because such compiler hint is somehow "new" to me.
>=20
> Also I expect this to be superseeded by Richard 'tcg constant'
> branch mentioned here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771401.html
> ---
>  tcg/tcg.c                  | 5 +++--
>  tcg/i386/tcg-target.c.inc  | 3 ++-
>  tcg/mips/tcg-target.c.inc  | 3 ++-
>  tcg/riscv/tcg-target.c.inc | 3 ++-
>  tcg/tci/tcg-target.c.inc   | 5 +++--
>  5 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 472bf1755bf..97d074d8fab 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -110,8 +110,9 @@ static void tcg_out_ld(TCGContext *s, TCGType type,
> TCGReg ret, TCGReg arg1,
>  static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg
>  arg);
>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg);
> -static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
> -                       const int *const_args);
> +static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS]);
>  #if TCG_TARGET_MAYBE_vec
>  static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
>                              TCGReg dst, TCGReg src);
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 46e856f4421..d121dca8789 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -2215,7 +2215,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TC=
GArg
> *args, bool is64)
>  }
> =20
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                              const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGArg a0, a1, a2;
>      int c, const_a2, vexop, rexw =3D 0;
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index add157f6c32..b9bb54f0ecc 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1691,7 +1691,8 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opc=
v2,
> MIPSInsn opcv6,
>  }
> =20
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                              const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      MIPSInsn i1, i2;
>      TCGArg a0, a1, a2;
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index c60b91ba58f..5bf0d069532 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1238,7 +1238,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TC=
GArg
> *args, bool is_64)
>  static const tcg_insn_unit *tb_ret_addr;
> =20
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                       const TCGArg *args, const int *const_args)
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGArg a0 =3D args[0];
>      TCGArg a1 =3D args[1];
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index d5a4d9d37cf..60464524f3d 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -553,8 +553,9 @@ static inline void tcg_out_call(TCGContext *s, const
> tcg_insn_unit *arg)
>      old_code_ptr[1] =3D s->code_ptr - old_code_ptr;
>  }
> =20
> -static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
> -                       const int *const_args)
> +static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS])
>  {
>      uint8_t *old_code_ptr =3D s->code_ptr;
> =20
> --
> 2.26.2
>=20
>

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer

