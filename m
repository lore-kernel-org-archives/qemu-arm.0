Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp796414wrs;
        Wed, 21 Aug 2019 06:26:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQ0vjdBDd/wR4XI8TSGeznMv/LkL2A6YqoSW8pKlAUZopctYDPbHcRW3w5LsUxEFVSfZXQ
X-Received: by 2002:a37:a358:: with SMTP id m85mr31794269qke.190.1566393997648;
        Wed, 21 Aug 2019 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566393997; cv=none;
        d=google.com; s=arc-20160816;
        b=Jn5+Rf7RIlNK80Nb6PxIZ1RarZdHrmgeDUz8LiCwFZKby67j0qU2v5TnyIkZtXJpxo
         OiZ7crarILkL3P0UHi6OtAWYbmyiMYWFFurDeUeazF1Ty4Yv8ECtaotneNcy1uPCOvst
         qvna2YXxbNbezRm/iDVNGyZA4j4jAAsuFkyzdrmDhN2Vp0M8m5ZY2Bh7EBUL9MarxdMf
         eFNEBBlqi7kJfSFC7rVtN9CmM4+6OAaJiKndP6LGUClgO1GC1htZF0MzkLmRXj+q9pqQ
         teGynR5z4Bu0P0aj7iRkEao6TPC5CacCuE8SOHXJGtXcRv8BJbeBeCGH/bT6IoOqXxm4
         2AHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=egB0z17PYG3HO62Gt+o/sY6b9gFbZWilQtcofyOj9gc=;
        b=Skj6Gy2rzo8BVUwhHaH6mcBS9RqpeEzjWAnXazdNwPY7uoV48jP+hxpB//vYo9pWZU
         FNT1nRgLG5BmjJ+W+hO1DhLIpLUeAodZ9KZBZ3FV0a2B9cR6WHsv5vTjZkVflCcvv19W
         lwVC8ko0MElWvxFv9R1J8HM/XdiKVjihmcMQ/tVsqmxMVUHHqIdmtrdHLg0Got16KG5f
         Cfel8IZEyd7365hpORIx8RIuiNRSUr3mtckzAtrYvBp5UynjH/ep6Nf77DDt8qspN5A6
         gqFCpXBgI7EExoOEwgTvRktS2/OvTarnkelnZQ/tsulNLhwpYLJIC7ohFeYaArVGD983
         ZYeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si12109310qkc.377.2019.08.21.06.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 06:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0QdI-0008Ok-RA
	for alex.bennee@linaro.org; Wed, 21 Aug 2019 09:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0Qcj-0007fq-3J
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0Qch-0001bE-Ll
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:26:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39272)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i0Qch-0001am-Ex
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:25:59 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 817B72CE955
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 13:25:58 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id 19so1196045wmk.0
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 06:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GqKn29SWMbJRkwcj2D71PwBa39tuXlL9JMmgWiJEmVA=;
 b=MXdcc/jr/g0OmNbPhEiBF2eKhCHkUO51YjMBC9fK+VSe8vj8ExI246J/HyMx3bUPHB
 B3bUeeKQHehj6SoSKI8FyoDW/v4Z7fIg2jFEfcIFnuVY/5AqXuJiub/zQYoo7MfKQ8PZ
 ytNI3fgX8MTuhwZR/yEl119QFt3CblVN7oOywx3uUNWKmNE6E2U+9O6zXzSyWnlO95xo
 QJrMgMby68VPABqZTI/1/qzn25HV+ToHUeVKaP7lleNmlENwJuvw1Rug3d8yM8dDe6oF
 H3aTE/xeGRNZbbQnG1Y/mFF+omt2EIJULEooQaSiWhkhgAbPF3aSNdYOhP/ZTY3RL7JF
 PyfQ==
X-Gm-Message-State: APjAAAWJEUeSEAb8E0AdK/inpAlmAJ88N6YVuVlkGWj+6J0fUu3u+kKo
 iUrL1dIZY3K9cj6yl9pybcV5l4Qa6EDyzTlSqpQglJkvVTm+LpgQW7pOl10ZVTJn2CMFHJnePek
 43cQ7tfzY1T1d
X-Received: by 2002:a7b:c019:: with SMTP id c25mr3647wmb.116.1566393957085;
 Wed, 21 Aug 2019 06:25:57 -0700 (PDT)
X-Received: by 2002:a7b:c019:: with SMTP id c25mr3623wmb.116.1566393956860;
 Wed, 21 Aug 2019 06:25:56 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id p9sm21430447wru.61.2019.08.21.06.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 06:25:56 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-45-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ca8d024c-c9c8-dc0d-d025-3a3cf50bf155@redhat.com>
Date: Wed, 21 Aug 2019 15:25:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190819213755.26175-45-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 44/68] target/arm: Add
 skeleton for T16 decodetree
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
X-TUID: 9rAlveEZpqPG

On 8/19/19 11:37 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  target/arm/translate.c   |  6 ++++++
>  target/arm/Makefile.objs |  6 ++++++
>  target/arm/t16.decode    | 20 ++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 target/arm/t16.decode
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 49bab7d863..90d608a2d2 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7538,6 +7538,7 @@ static int t32_branch24(DisasContext *s, int x)
>  #include "decode-a32.inc.c"
>  #include "decode-a32-uncond.inc.c"
>  #include "decode-t32.inc.c"
> +#include "decode-t16.inc.c"
> =20
>  /* Helpers to swap operands for reverse-subtract.  */
>  static void gen_rsb(TCGv_i32 dst, TCGv_i32 a, TCGv_i32 b)
> @@ -10550,6 +10551,11 @@ static void disas_thumb_insn(DisasContext *s, =
uint32_t insn)
>      TCGv_i32 tmp2;
>      TCGv_i32 addr;
> =20
> +    if (disas_t16(s, insn)) {
> +        return;
> +    }
> +    /* fall back to legacy decoder */
> +
>      switch (insn >> 12) {
>      case 0: case 1:
> =20
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 7806b4dac0..cf26c16f5f 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -43,12 +43,18 @@ target/arm/decode-t32.inc.c: $(SRC_PATH)/target/arm=
/t32.decode $(DECODETREE)
>  	  $(PYTHON) $(DECODETREE) --static-decode disas_t32 -o $@ $<,\
>  	  "GEN", $(TARGET_DIR)$@)
> =20
> +target/arm/decode-t16.inc.c: $(SRC_PATH)/target/arm/t16.decode $(DECOD=
ETREE)
> +	$(call quiet-command,\
> +	  $(PYTHON) $(DECODETREE) -w 16 --static-decode disas_t16 -o $@ $<,\
> +	  "GEN", $(TARGET_DIR)$@)
> +
>  target/arm/translate-sve.o: target/arm/decode-sve.inc.c
>  target/arm/translate.o: target/arm/decode-vfp.inc.c
>  target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
>  target/arm/translate.o: target/arm/decode-a32.inc.c
>  target/arm/translate.o: target/arm/decode-a32-uncond.inc.c
>  target/arm/translate.o: target/arm/decode-t32.inc.c
> +target/arm/translate.o: target/arm/decode-t16.inc.c
> =20
>  obj-y +=3D tlb_helper.o debug_helper.o
>  obj-y +=3D translate.o op_helper.o
> diff --git a/target/arm/t16.decode b/target/arm/t16.decode
> new file mode 100644
> index 0000000000..e954f61fe4
> --- /dev/null
> +++ b/target/arm/t16.decode
> @@ -0,0 +1,20 @@
> +# Thumb1 instructions
> +#
> +#  Copyright (c) 2019 Linaro, Ltd
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <http://www.gnu.org/lic=
enses/>.
> +
> +#
> +# This file is processed by scripts/decodetree.py
> +#
>=20
