Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2482830njk;
        Mon, 27 Jan 2025 06:41:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUd+H56mtz6iXVw2Rmw0YnF848ZZR0uEYV4dWVVdpiBw8xHKZ5Q0RSOPAydqn7j2RTtG9B+Hticmx+XJA==@linaro.org
X-Google-Smtp-Source: AGHT+IHI1wGc18pSVcZZbkZ0caFGIgcc0/vF2qIOfsC8hT3NU9ISwJR4oQANQNb3hhf1BLVEUAdf
X-Received: by 2002:a05:622a:18a7:b0:467:7fbf:d121 with SMTP id d75a77b69052e-46e12a56138mr507801401cf.12.1737988888787;
        Mon, 27 Jan 2025 06:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737988888; cv=none;
        d=google.com; s=arc-20240605;
        b=enPaYoa3mYceAkzZP+z7gmOEKElaGdIZtXPg7cRawE9jJn2OhvrIdR4HrG+pqeVsir
         hHbDK01LBICLK81b62y+jWYmIHmHFCcndbaxeFA+VBteeIuy23a2+n25GQbUSDC5GrVI
         QOcu1C/a0FRZzAp9/wfn/7xgFKtTTgxnJu+tYqRyKkmx69sXz1UImpF/+YYJ/DIhf+6G
         n1O9F7Fv+b+WVOK2vKofkqcL2IRD/aKAfFeo0qHQcgUvCccpbg65L1K9wCRF/pjJAgaJ
         hA/ZyTwTEB70OedRmMbtuj9omDXBjbHyeuWtxkgMcbtTrdkdNRd+unhIuiZQ9urOWbCO
         kuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=igU26OaUrMHkAXEoLTt8pG5PSWfGZgJYsR8vT4NBQwE=;
        fh=SBM1bJqcsAvw5uy+Lv7AbXCBPXCSxNUali5g9ivrre4=;
        b=EjFEZ08R5q45gkzqBRIauSvF5FJeAcqZjwE7EQkr7rUSclWm92036Eh2Be6pRrbtGO
         DeM62mh10ntm54UrXY7nhpQKgwG0rPVzekIh3Sh2ubshNWMl3K/s5kvUU5rac9hJ97DG
         ISQCdVIkk93zlJBzYa9timbJuxQcbnfOAk3Y27+fuMflwam2EsJbyGlZBHanwSSFMf34
         D2bhWGjjWvE6oSaKBwwyoGLJcPT5tec37OqVIY0poQscS0KeJI5VlCfdbmF2y6wNFvel
         RAwuX8oMHRRJGIhu8zjP41JrCegzKtLLxvKsMr5WNqQ6zJQ0eUNEgknci7mkbVy3FLAG
         6cGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WX7KbO8n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba5827si102537891cf.516.2025.01.27.06.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:41:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WX7KbO8n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcQIa-0001cU-Bx; Mon, 27 Jan 2025 09:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQII-0001Ys-8w
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:40:55 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQIF-0006RB-Ox
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:40:54 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e479e529ebcso5768904276.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737988850; x=1738593650; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igU26OaUrMHkAXEoLTt8pG5PSWfGZgJYsR8vT4NBQwE=;
 b=WX7KbO8nW4PWmep6BqLN8RFpSPInS7wivcyLumHhkSvP0gjm6rxsOoJJtMkzY0jtpx
 W+62lOmy6Py6krznlXHJx3EOezl70XBmnV8M375bVzg3NTK5BVrZUyHJAJBDivDUDTK5
 kc+L/j3DX3fGbHrBmZmV1fdM/I71Mg1N+PK01oEAj8w2XRt7FF2xyDO8J/2PhBtpaI5S
 gG/L3T2VJlAbf0K53hZFbjxBqFmpbHyNO2AxWUUU60pHQ+7UHpszP+YtSiRjGtpUJUZt
 3djz/4Dwwu5nRAWEZj+DkM1zheKQMEDatagsywRKY5ArSrwEDIPmh4X2fzYRnaa1iWNY
 eHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737988850; x=1738593650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igU26OaUrMHkAXEoLTt8pG5PSWfGZgJYsR8vT4NBQwE=;
 b=KBjPLV6DKIbVb++dO0+QMizGCnaM8X4bSOoxFObzjvO0rAx8bUVlx1T0OT+9Who5iT
 MCue4Zw/YZ8jlij5Z2nVy4i0cfpa4HkO1yJ+Q69vryBoBc9CrERhU8Ogx9V1z/MnWBsH
 3AB3YrsJVj69VSvsEi2K27YhPZ7LtHzG7ruvRiEj/QdTCXF2zAnfCTpkajZMT8UZUqrR
 tou6v7gky29raawW+HCO819P3IjQ6F3+7HZbWWzFPJYjC6IHCKN9ZgffETBMIKfx4518
 FVgibLX9CIq1LeK+POeRkWZaYtjppMRPwnAVrTKQs6aCxZ8wmQpJnssCOIOijTXNFWwa
 TYEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfeapFuTu5aHQ1muoqpYl9tGCSPvMwvagnuoWibyu+NOferonVFPOcIc0BmHd0rFzgguMCgNQbCw==@nongnu.org
X-Gm-Message-State: AOJu0YxpYp04BmHqffrO5ifztZV/NG1NExUdbEwRze2yRTC73MZ2GJT9
 29Eh3N/ZPuqFXI3Y13yGKarsp3917/ihNRmMhSOCs0D6xMy4j/FAlAhf7jO3EHRMHeFdVcZ4y4g
 JD/whE6oTmen6NnjZARvrRrSpoPxemAVkAQjNKw==
X-Gm-Gg: ASbGncsjRt10hm90vKnnvY4taLSwwWjSO/oq9xJdfK4SfXKGG/qk6yE3ow2qUsjC9Nr
 yv+7Rigz7HX9Nv+RrMq2VJZQPEfXxHhgQXQU67awFuHVk36+zmBHYZxJ+tvZ+u0M=
X-Received: by 2002:a05:6902:110d:b0:e57:99a0:eda6 with SMTP id
 3f1490d57ef6-e57b1096d49mr29668651276.25.1737988850333; Mon, 27 Jan 2025
 06:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20241219061658.805-1-andrew.yuan@jaguarmicro.com>
In-Reply-To: <20241219061658.805-1-andrew.yuan@jaguarmicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:40:38 +0000
X-Gm-Features: AWEUYZnDOAZDZ2sLCyf__3Ae86IoqVoE_TmIXRkA5ABP3xjK8KcYbSTAxHNFZ1E
Message-ID: <CAFEAcA96ZLjOhBT9rhNhuk32ve0Qv4hUVuTTtgE=DBApbN98Pg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/net: cadence_gem: feat: add logic for the
 DISABLE_MASK bit in type2_compare_x_word_1
To: "Andrew.Yuan" <andrew.yuan@jaguarmicro.com>
Cc: philmd@linaro.org, edgar.iglesias@gmail.com, alistair@alistair23.me, 
 jasowang@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: NvOkEk808Yjf

Edgar or Alistair -- could one of you review this
cadence GEM patch, please?

On Thu, 19 Dec 2024 at 06:17, Andrew.Yuan <andrew.yuan@jaguarmicro.com> wro=
te:
>
> From: Andrew Yuan <andrew.yuan@jaguarmicro.com>
>
> As in the Cadence IP for Gigabit Ethernet MAC Part Number: IP7014 IP Rev:=
 R1p12 - Doc Rev: 1.3 User Guide,
> if the DISABLE_MASK bit in type2_compare_x_word_1 is set,
> mask_value in type2_compare_x_word_0 is used as an additional 2 byte Comp=
are Value
>
> Signed-off-by: Andrew Yuan <andrew.yuan@jaguarmicro.com>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/cadence_gem.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 3fce01315f..7bd176951e 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -909,8 +909,8 @@ static int get_queue_from_screen(CadenceGEMState *s, =
uint8_t *rxbuf_ptr,
>
>          /* Compare A, B, C */
>          for (j =3D 0; j < 3; j++) {
> -            uint32_t cr0, cr1, mask, compare;
> -            uint16_t rx_cmp;
> +            uint32_t cr0, cr1, mask, compare, disable_mask;
> +            uint32_t rx_cmp;
>              int offset;
>              int cr_idx =3D extract32(reg, R_SCREENING_TYPE2_REG0_COMPARE=
_A_SHIFT + j * 6,
>                                     R_SCREENING_TYPE2_REG0_COMPARE_A_LENG=
TH);
> @@ -946,9 +946,23 @@ static int get_queue_from_screen(CadenceGEMState *s,=
 uint8_t *rxbuf_ptr,
>                  break;
>              }
>
> -            rx_cmp =3D rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
> -            mask =3D FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, MASK_VALUE)=
;
> -            compare =3D FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, COMPARE_=
VALUE);
> +            disable_mask =3D
> +                FIELD_EX32(cr1, TYPE2_COMPARE_0_WORD_1, DISABLE_MASK);
> +            if (disable_mask) {
> +                /*
> +                 * If disable_mask is set,
> +                 * mask_value is used as an additional 2 byte Compare Va=
lue.
> +                 * To simple, set mask =3D 0xFFFFFFFF, if disable_mask i=
s set.
> +                 */
> +                rx_cmp =3D ldl_le_p(rxbuf_ptr + offset);
> +                mask =3D 0xFFFFFFFF;
> +                compare =3D cr0;
> +            } else {
> +                rx_cmp =3D lduw_le_p(rxbuf_ptr + offset);

Is the change in behaviour in the !disable_mask codepath here
intentional? Previously we use one byte from rxbuf_ptr[offset],
duplicated into both halves of rx_cmp; now we will load two
different bytes from rxbuf_ptr[offset] and rxbuf_ptr[offset + 1].

If this is intended, we should say so in the commit message.


> +                mask =3D FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, MASK_VA=
LUE);
> +                compare =3D
> +                    FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, COMPARE_VALU=
E);
> +            }
>
>              if ((rx_cmp & mask) =3D=3D (compare & mask)) {
>                  matched =3D true;
> --
> 2.25.1

thanks
-- PMM
