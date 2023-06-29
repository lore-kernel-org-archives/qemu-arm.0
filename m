Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp258515ejy;
        Thu, 29 Jun 2023 03:21:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4k+xlE8dYQlPSDzCHkao4cNXGjhglST1iS7Wna7vz+3UmR5o055VnnFl9LRnv0VvKg2Nta
X-Received: by 2002:a05:620a:8197:b0:766:3190:804f with SMTP id ot23-20020a05620a819700b007663190804fmr8728802qkn.26.1688034116056;
        Thu, 29 Jun 2023 03:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688034116; cv=none;
        d=google.com; s=arc-20160816;
        b=RBfaQjmqySexZcyV0cbEd/YrfKm4Qswx5VZQ2F6fsL7R4xulDKWe3KGWQh0FDk/PkN
         7YiRF5IT/gOPpifWV5RBta+yRDiNu5Gc2bnvZTbtTp7nuN5qAjnYyXBcuTD+DAu8Vlk9
         3rXkGt2tQUs5RAEKJjmu21BVt3BsG25or8L3qkKKoh7yxOIrT+Qc6gXc5axyghs9/EMJ
         lx1e1XO9uiw6R8ANjQJGYk4E+Tpz1PKV4q7Ki1n5V49McW4qynmka/U8nXR7KHDef0lc
         kMTS4GjC1d3o7+MUfshEu5v8wFLbNXp6eomPcmtUc20wy0EbBR8lJELQqGwqfNzmUteg
         JG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jQo1NyTnQMjXVAcorcgOXiN861ou9Pdcj+7tbVm+fOE=;
        fh=jm/2KRteZ3tnj233lJnW1TECTzG5rfYKgd579WicfZQ=;
        b=JSw5j2jAVdjlt2jWLo86N9pwMvMRePIKTl2bCgcSzMjKUFNnCSttxhvRtkPXXgcA27
         uU89HNiq+n8fZmB0OHl6psGOepyc47oOB/PGjIm8YKqc8JUhgP0YrsBxOevxpvLuPQQf
         F6Y8OB7rVIyySnoX17H04RyBsqBOwLjws/iTL7TTG+qL7EAgtez+7+1cSPZwW/tp550U
         PcLV4PVdbffdFBhoslWlU9dD3Z4P+adqyqvDHJJiONpIJWlVCMtPzfnFPqjICzoTX2Kr
         zFgkARx4GvydOWUhRir228mPX0q6xKmj9atlvCnR07GVZredR/xNn3v+C89R+edYnZqw
         z+uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=biMNwu58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020a37db12000000b0076104c6cfd1si4428143qki.23.2023.06.29.03.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 03:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=biMNwu58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEomQ-0004VY-3C; Thu, 29 Jun 2023 06:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1qEomO-0004V8-SV; Thu, 29 Jun 2023 06:21:36 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1qEomN-0006Ol-6Z; Thu, 29 Jun 2023 06:21:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23D0061506;
 Thu, 29 Jun 2023 10:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D14EC433C8;
 Thu, 29 Jun 2023 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688034083;
 bh=26X0wWq+9KqrfqXu/Z+vH+/l90zYEKnyYvOsKiRdzKE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=biMNwu58JhpCG8gJB8SliP0AtvD1dm4Byr5ngD9JtJq3EkQPRASM2atXj9cnQ2kC6
 ABi/p2g/Zowc8Vh5mTSqkkObAvk06ArIRQkLEmfjg6JPSm449iIHaMSTv7bXUIv6yi
 vA5wRGY3zLFv/byNkRl6EJmebT5y8mNHAsEgHn5ErZPU+ji55XSl4RPFGpBvcI57qg
 /999W82SDJMrY8AtJnesScL/M4RPXoVfF0ofMf3l1MkkVB1yZVpgszNxlB5M+I1dyg
 sK1j2jPXqxJMyk+BO5EW+SaECDLznQ7HOe/DARC4bLIBNEWc85cvbq+4KPv/zcsTTi
 jwiZ0sAIplm7A==
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so798564e87.0; 
 Thu, 29 Jun 2023 03:21:23 -0700 (PDT)
X-Gm-Message-State: AC+VfDzyjcpWsjI76306tww6vTZ0V0SfR7OI11RiA7sRWskXx8ib4wqh
 pBMXmCqoxzm33UyieD50sIFhdLU4YUM77bSRi24=
X-Received: by 2002:a05:6512:224c:b0:4fa:f79f:85a with SMTP id
 i12-20020a056512224c00b004faf79f085amr9525226lfu.69.1688034081556; Thu, 29
 Jun 2023 03:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-6-richard.henderson@linaro.org>
In-Reply-To: <20230609022401.684157-6-richard.henderson@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 29 Jun 2023 12:21:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFWDMijy6eTCBwCbygJHyBpS6PqaU=1d5OeE6h_v4=-zg@mail.gmail.com>
Message-ID: <CAMj1kXFWDMijy6eTCBwCbygJHyBpS6PqaU=1d5OeE6h_v4=-zg@mail.gmail.com>
Subject: Re: [PATCH v2 05/38] crypto/aes: Add constants for ShiftRows,
 InvShiftRows
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HjOvVwH3F4wN

On Fri, 9 Jun 2023 at 04:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These symbols will avoid the indirection through memory
> when fully unrolling some new primitives.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  crypto/aes.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/aes.c b/crypto/aes.c
> index 67bb74b8e3..cdf937883d 100644
> --- a/crypto/aes.c
> +++ b/crypto/aes.c
> @@ -108,12 +108,58 @@ const uint8_t AES_isbox[256] =3D {
>      0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D,
>  };
>
> +/* AES ShiftRows, for complete unrolling. */
> +enum {
> +    AES_SH_0 =3D 0x0,
> +    AES_SH_1 =3D 0x5,
> +    AES_SH_2 =3D 0xa,
> +    AES_SH_3 =3D 0xf,
> +    AES_SH_4 =3D 0x4,
> +    AES_SH_5 =3D 0x9,
> +    AES_SH_6 =3D 0xe,
> +    AES_SH_7 =3D 0x3,
> +    AES_SH_8 =3D 0x8,
> +    AES_SH_9 =3D 0xd,
> +    AES_SH_A =3D 0x2,
> +    AES_SH_B =3D 0x7,
> +    AES_SH_C =3D 0xc,
> +    AES_SH_D =3D 0x1,
> +    AES_SH_E =3D 0x6,
> +    AES_SH_F =3D 0xb,
> +};
> +

We might simplify this further by doing

#define AES_SH(n)  (((n) * 5) % 16)
#define AES_ISH(n)  (((n) * 13) % 16)

>  const uint8_t AES_shifts[16] =3D {
> -    0, 5, 10, 15, 4, 9, 14, 3, 8, 13, 2, 7, 12, 1, 6, 11
> +    AES_SH_0, AES_SH_1, AES_SH_2, AES_SH_3,
> +    AES_SH_4, AES_SH_5, AES_SH_6, AES_SH_7,
> +    AES_SH_8, AES_SH_9, AES_SH_A, AES_SH_B,
> +    AES_SH_C, AES_SH_D, AES_SH_E, AES_SH_F,
> +};
> +
> +/* AES InvShiftRows, for complete unrolling. */
> +enum {
> +    AES_ISH_0 =3D 0x0,
> +    AES_ISH_1 =3D 0xd,
> +    AES_ISH_2 =3D 0xa,
> +    AES_ISH_3 =3D 0x7,
> +    AES_ISH_4 =3D 0x4,
> +    AES_ISH_5 =3D 0x1,
> +    AES_ISH_6 =3D 0xe,
> +    AES_ISH_7 =3D 0xb,
> +    AES_ISH_8 =3D 0x8,
> +    AES_ISH_9 =3D 0x5,
> +    AES_ISH_A =3D 0x2,
> +    AES_ISH_B =3D 0xf,
> +    AES_ISH_C =3D 0xc,
> +    AES_ISH_D =3D 0x9,
> +    AES_ISH_E =3D 0x6,
> +    AES_ISH_F =3D 0x3,
>  };
>
>  const uint8_t AES_ishifts[16] =3D {
> -    0, 13, 10, 7, 4, 1, 14, 11, 8, 5, 2, 15, 12, 9, 6, 3
> +    AES_ISH_0, AES_ISH_1, AES_ISH_2, AES_ISH_3,
> +    AES_ISH_4, AES_ISH_5, AES_ISH_6, AES_ISH_7,
> +    AES_ISH_8, AES_ISH_9, AES_ISH_A, AES_ISH_B,
> +    AES_ISH_C, AES_ISH_D, AES_ISH_E, AES_ISH_F,
>  };
>
>  /*
> --
> 2.34.1
>
