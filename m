Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp794582wrs;
        Wed, 21 Aug 2019 06:25:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2lqMToRZLiXY5vw8w8wjsqadZpCFzPdZdPT/Sf6tXNdE7e4bVC65KhlSpXP89KP3pPoc1
X-Received: by 2002:a05:6402:12d1:: with SMTP id k17mr36484920edx.214.1566393903764;
        Wed, 21 Aug 2019 06:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566393903; cv=none;
        d=google.com; s=arc-20160816;
        b=kH0npsOkb8UlHCT2fCM4PoGmHKdF75rTlWjv0riYXBQQvh/xzJE5bXGApFJzZ501pi
         FUhWyxH60RGHu5gxrIpY1HFsEO1QPvW/pcG2wZ638MeTckNuyEzPfmDOubz96QZpqh2g
         Vc5rNiA4IEVNt/Oy0ItE+zsDUefDDvCMfGPPrtMpxnRCXVi1LYcn+ZF7wjMRdouQl/5w
         eN+ehVqMfHA1Yz82HCKG4Sz+jrRJiCSInwFSYoPeP+QqL1f/4R9p+6oQ22e01QlBb377
         OJqhn494l51DDIoPDnb6snwwzFq2vqfoE/FshgWN3Q0nJ9ShsNt66jVZqcKxRN+26ov8
         gv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=CAt+SsfvqbHMDoF1V7d6Unrf8Z737ikrbAhP7qhw6UU=;
        b=A/qat7QU8Y/OOqPelhxJ+G+cs7t51ppu6OH3bbrwTMiQGpdhs9bpZJufE8HoPpj+bn
         FanOrkzFbQlBHJw7we9pz9nKqkHcpg8o/Hz5MjO3zgKAAPsYaBGQnKxMTtJQOEfHSNHY
         IAVeNLx6PPAYS1s56NLo2MA1Ap6ADbLSxb4jhNB4iyYXNfOpCQ5t5PpGatdmat6Hq41L
         NkgZQLHquDrVs8si/yLacgXHFq7FhbWiAJTU/oZ249nEpbZ7s/U7XfO7LiF75dwE34eO
         s3eQdfJ2hzKqvphLegHGvK9qrCdxa8n2EVGpffKiSeQejw1IfForEnDTPfAur+4jFUwq
         RsDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k40si12752532edb.14.2019.08.21.06.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 06:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0Qbm-0005Nn-6x
	for alex.bennee@linaro.org; Wed, 21 Aug 2019 09:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0QbW-0005Ge-V6
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:24:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0QbV-00016Y-Ka
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:24:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38810)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i0QbV-000164-CZ
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:24:45 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 836F419D381
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 13:24:44 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id c11so843520wml.6
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 06:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8tFGO5CHaBMuyfQl29QMXGfRoQe+7se+b32QsW/sJHA=;
 b=DcgKWnIiNZghrBRbx7xdWToI4PZzBtsTs4kUWyHmoYZJbSJyGAndwACwkS659TTuIA
 5zQy2kvLomf8Y3CJVZzqZlAP5h083dtNmeoxwyAGrYw8BgIq4CkH40yVZF+qSEMqPSqX
 3STenfqDL6xyVMb8su6OOVw5vuW9j77G7xULSSCnzOyVp0TlCwfj8lDDmaK33KuVpXky
 gth9SdXjjpzYFpyU3JHUcy3ohLmjVAub9KirkPwYynzATbj7n9Jr4o+wXpZALmvUCG+z
 5jMmjzw5AYOBem2z4jdz81B7yKXhyorG2mvsKfWRUyfOztKiz6OqQhpZMeIacElWi6rq
 fRzQ==
X-Gm-Message-State: APjAAAXbyEj/r5dHtsKquEL9yhLODqO8ACGYLjvqTR0f6+uxBTnSd3B1
 FGrdpddAN7MzRuFtvhmOsfaRLV5VbcyzORm/xJw+QMGUtu+fel55wRT9gJKGxwLU2KT0NpngMf6
 Xtuv024qxyQ1a
X-Received: by 2002:a5d:5408:: with SMTP id g8mr34206209wrv.201.1566393882836; 
 Wed, 21 Aug 2019 06:24:42 -0700 (PDT)
X-Received: by 2002:a5d:5408:: with SMTP id g8mr34206193wrv.201.1566393882681; 
 Wed, 21 Aug 2019 06:24:42 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id 20sm2465110wmk.34.2019.08.21.06.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 06:24:42 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-39-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <03f2a4d7-6511-916a-efaa-baa8cbf40386@redhat.com>
Date: Wed, 21 Aug 2019 15:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190819213755.26175-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 38/68] target/arm: Convert
 Unallocated memory hint
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XMuhvwctC9p1

On 8/19/19 11:37 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  target/arm/translate.c       | 8 --------
>  target/arm/a32-uncond.decode | 8 ++++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a30a9bb4e0..9ec6b25c03 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10216,14 +10216,6 @@ static void disas_arm_insn(DisasContext *s, un=
signed int insn)
>              }
>              return;
>          }
> -        if (((insn & 0x0f700000) =3D=3D 0x04100000) ||
> -            ((insn & 0x0f700010) =3D=3D 0x06100000)) {
> -            if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
> -                goto illegal_op;
> -            }
> -            return; /* v7MP: Unallocated memory hint: must NOP */
> -        }
> -
>          if ((insn & 0x0e000f00) =3D=3D 0x0c000100) {
>              if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
>                  /* iWMMXt register transfer.  */
> diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decod=
e
> index aed381cb8e..afa95bf7aa 100644
> --- a/target/arm/a32-uncond.decode
> +++ b/target/arm/a32-uncond.decode
> @@ -64,3 +64,11 @@ PLI              1111 0100 -101 ---- 1111 ---- ---- =
----    # (imm, lit) 7
>  PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (registe=
r) 5te
>  PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (registe=
r) 7mp
>  PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (registe=
r) 7
> +
> +# Unallocated memory hints
> +#
> +# Since these are v7MP nops, and PLDW is v7MP and implemented as nop,
> +# (ab)use the PLDW helper.
> +
> +PLDW             1111 0100 -001 ---- ---- ---- ---- ----
> +PLDW             1111 0110 -001 ---- ---- ---- ---0 ----
>=20
