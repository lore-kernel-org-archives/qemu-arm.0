Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp223585ejf;
        Thu, 6 Jun 2024 04:04:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJHpWyTBKwkzdv+PyC/qwX9MzAfFSCdQAlwiv6qqbCyE9dFU9FXqg08Kp1VRVA+Tg4V6G9ZJoe3TvoW5EG/YWzigYUP/Ns
X-Google-Smtp-Source: AGHT+IG1lH4d1WqvHJ5VwmAIfdGn0cjvsleVFDPecusBAQ5Su5nSOfUGxQhyKFPvsfMFZuQadvUz
X-Received: by 2002:a05:6214:4907:b0:6ae:24da:ba27 with SMTP id 6a1803df08f44-6b030a9e23cmr58274686d6.49.1717671870897;
        Thu, 06 Jun 2024 04:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717671870; cv=none;
        d=google.com; s=arc-20160816;
        b=hW4LsKE+L5QoxwH8rECSc3UwizCrnqxU0DIrTOykHjQ8kBb97a+nwgn8144mseavwS
         4+wbdAE2onks0uFyiTGZcXPceNry2s0TEtSgKdj+8lSIgK2AfEwnvjtJ+lLRm+nn3u9q
         RWz0guEySvfbIL4WIQUNFX8N2Lo2LSagXvtA5xUb5gKgO3Udfisoc6aGS/KKC8oNgdL8
         zUBW6+ZFEMNyG3koguWn9v/iRqJ6ikewGAdIK2vALWN5Dc6bMB/W2oL0diVok74Df2Ou
         Pej0luJtQ/md6FySjZ5LPBBXJofsvjFqFU8RszFK0zwfKyENYsgc5kuwUDwwrgkVqd30
         1j4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=STTozLZIBEMevP5FO7VZu3tzLVa//G2nSrEQlFHlMBY=;
        fh=bXN3A/eLJ61TCSJl32h4OgcLZFl/fLUoPGNAtFwKfMI=;
        b=xaLX6LmrgRxmoylG2FQauj93X3GzvlOeW/j6hr1v9F2xa6Hkp1oTmnaEPXcxiSWHfX
         RUMew70lyjsEJGGb97f9NJj+xRIxrYFrqv5/bzadnBOhjEUZyieYczkXqaNhxo5JcJVn
         +xcE2pJAeQlZcUlndYio2m5XInYavzpiEyM4FPpMgraeHt3Ntm5ikkiyJnL8YUNOIV9J
         gljbbkYBLaC5DejGV4FI0145xSp86F6IHe09gs4D84dgiSN3yUaIC1bzrgvGddNEZZFg
         JiTvc5Tn0pVfOWZ3mV8L7Pswv4Vy5xC6UyHopFKqg5Um0nJvIfAnhZ6sauw5TCk08OOM
         T8PQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQiY2XIY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44038a6d7bfsi5315401cf.72.2024.06.06.04.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2024 04:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQiY2XIY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFAuh-0006Zs-4d; Thu, 06 Jun 2024 07:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sFAug-0006Zg-JU; Thu, 06 Jun 2024 07:04:10 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sFAue-00084u-PO; Thu, 06 Jun 2024 07:04:10 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57a30b3a6cbso946937a12.1; 
 Thu, 06 Jun 2024 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717671847; x=1718276647; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=STTozLZIBEMevP5FO7VZu3tzLVa//G2nSrEQlFHlMBY=;
 b=PQiY2XIY02B7btsGLuxsTazbkUuidEjBZVDoZgerRBE9onVuW11019gerY35xUtCbK
 yQK1bPmdLjZ3kAS040iaeubKcshYxT73djip9DlzLKicazBCLZehMvq9Dxy1x/8t734G
 e7dRlfTU6vqMQXKN/vUHnxe4xNfFhWg9zUeIv7edmxg4nqp8PwLxdvQI3hZOVyGT3crK
 nx9eoOwy7l7kACoCs1eQxd5V7YxQk908tkLRyMxJ1nlslrb4u3PeqT3MtZWLw9/TKeTY
 129zxUZFzzJ3pbSP3C3JBUu9ma/Z0j24uLp6Y+mutInTVQAe1xDoyjNmqU05AsqTQ78v
 W+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717671847; x=1718276647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STTozLZIBEMevP5FO7VZu3tzLVa//G2nSrEQlFHlMBY=;
 b=o/KapKZFMnl3kRRrVEwN+eVtZU5++MLyeI+n5me8eXyITYU9DG8UzelfzezoQYuMcX
 9CxPOnQeXqZwbtan7j8S4gogjYuFkb8l+ZnqFdCVkW5PWdlHl0FACOguj3mxWTeLvnFG
 AUlV4anHdtpRYut8Ix3KThtpLJDxFe8IWKpVW+CV16E5wdlkLbI/7Ew9V7GwDI0P76DD
 9Q+Ez3HC7r4sdeQMCedSofwz6EuiwYXs+BpHBJjsKJ89Nxv2FXpHa2laquKMeFkfZ5I3
 INFmrgeCzCF2PTs7sgJjYidY0ozgPFM8jIh3tBIX5G96dSSnT/JR+QclHpy3hSUwzi4R
 J3uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4fAG19cv5qhrMm0FUQK83/mfZLejzzwto/UWE8OPBu5R3NtWaC4wmCRcBKT769xwOiKy4S3ykRvnG8sLTTAJ8K9Czj5FBl/MNokQ+F0U0Xs8rtcsEodMK+z4=
X-Gm-Message-State: AOJu0YzBnoHIBzIAW8/nPcTya/wcN063mG42yAE+tvzIIIxMhXyOPSgR
 J2BKMasQhHFXdjnUmsDVElWdHJYMS/6CGnhpo9x2+o/vbZGoY3WwhP5ndOFw/3a+pdu6gn5CLBb
 4gnBBnVdO2OiX5vdRhcDUszPxxWg=
X-Received: by 2002:a50:d716:0:b0:57a:2fd7:c2d1 with SMTP id
 4fb4d7f45d1cf-57a8bccb524mr2339254a12.40.1717671846563; Thu, 06 Jun 2024
 04:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240606095952.2133-1-andrew.yuan@jaguarmicro.com>
In-Reply-To: <20240606095952.2133-1-andrew.yuan@jaguarmicro.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 6 Jun 2024 13:03:54 +0200
Message-ID: <CAJy5ezqq51bJG4O9HA-Pv4sw9rYqGdFW-EezCRPfDbTx=9SwyQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: cadence_gem: fix: type2_compare_x_word_0 error
To: "Andrew.Yuan" <andrew.yuan@jaguarmicro.com>
Cc: luc.michel@amd.com, alistair@alistair23.me, peter.maydell@linaro.org, 
 jasowang@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000041586b061a36a4de"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ONXuqTwdePT8

--00000000000041586b061a36a4de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 12:00=E2=80=AFPM Andrew.Yuan <andrew.yuan@jaguarmicr=
o.com>
wrote:

>         In the Cadence IP for Gigabit Ethernet MAC Part Number: IP7014 IP
> Rev: R1p12 - Doc Rev: 1.3 User Guide, the specification for the
> type2_compare_x_word_0 register is as follows:
>         The byte stored in bits [23:16] is compared against the byte in
> the received frame from the selected offset+0, and the byte stored in bit=
s
> [31:24] is compared against the byte in
>         the received frame from the selected offset+1.
>
>         However, there is an implementation error in the cadence_gem mode=
l
> in qemu=EF=BC=9A
>         the byte stored in bits [31:24] is compared against the byte in
> the received frame from the selected offset+0
>
>         Now, the error code is as follows:
>         rx_cmp =3D rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
>
>         and needs to be corrected to=EF=BC=9A
>         rx_cmp =3D rxbuf_ptr[offset + 1] << 8 | rxbuf_ptr[offset];
>
> Signed-off-by: Andrew.Yuan <andrew.yuan@jaguarmicro.com>
>


LGTM:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

At some point it would be nice to add the missing logic for the
DISABLE_MASK bit that
extends the compare range from 16 to 32-bits.

Cheers,
Edgar



> ---
>  hw/net/cadence_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index ec7bf562e5..9c73ded0d3 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -946,7 +946,7 @@ static int get_queue_from_screen(CadenceGEMState *s,
> uint8_t *rxbuf_ptr,
>                  break;
>              }
>
> -            rx_cmp =3D rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
> +            rx_cmp =3D rxbuf_ptr[offset + 1] << 8 | rxbuf_ptr[offset];
>              mask =3D FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, MASK_VALUE)=
;
>              compare =3D FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0,
> COMPARE_VALUE);
>
> --
> 2.37.0.windows.1
>
>

--00000000000041586b061a36a4de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 6, 2024 at 12:00=E2=80=AFPM A=
ndrew.Yuan &lt;<a href=3D"mailto:andrew.yuan@jaguarmicro.com">andrew.yuan@j=
aguarmicro.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 In the=
 Cadence IP for Gigabit Ethernet MAC Part Number: IP7014 IP Rev: R1p12 - Do=
c Rev: 1.3 User Guide, the specification for the type2_compare_x_word_0 reg=
ister is as follows:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The byte stored in bits [23:16] is compared aga=
inst the byte in the received frame from the selected offset+0, and the byt=
e stored in bits [31:24] is compared against the byte in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the received frame from the selected offset+1.<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 However, there is an implementation error in th=
e cadence_gem model in qemu=EF=BC=9A<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the byte stored in bits [31:24] is compared aga=
inst the byte in the received frame from the selected offset+0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Now, the error code is as follows:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_cmp =3D rxbuf_ptr[offset] &lt;&lt; 8 | rxbuf=
_ptr[offset];<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 and needs to be corrected to=EF=BC=9A<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_cmp =3D rxbuf_ptr[offset + 1] &lt;&lt; 8 | r=
xbuf_ptr[offset];<br>
<br>
Signed-off-by: Andrew.Yuan &lt;<a href=3D"mailto:andrew.yuan@jaguarmicro.co=
m" target=3D"_blank">andrew.yuan@jaguarmicro.com</a>&gt;<br></blockquote><d=
iv><br></div><div><br></div><div>LGTM:</div><div>Reviewed-by: Edgar E. Igle=
sias &lt;<a href=3D"mailto:edgar.iglesias@amd.com">edgar.iglesias@amd.com</=
a>&gt;<br></div><div><br></div><div>At some point it would be nice to add t=
he missing logic for the DISABLE_MASK bit that</div><div>extends the compar=
e range from 16 to 32-bits.</div><div><br></div><div>Cheers,</div><div>Edga=
r=C2=A0</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
---<br>
=C2=A0hw/net/cadence_gem.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c<br>
index ec7bf562e5..9c73ded0d3 100644<br>
--- a/hw/net/cadence_gem.c<br>
+++ b/hw/net/cadence_gem.c<br>
@@ -946,7 +946,7 @@ static int get_queue_from_screen(CadenceGEMState *s, ui=
nt8_t *rxbuf_ptr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_cmp =3D rxbuf_ptr[offset] &lt=
;&lt; 8 | rxbuf_ptr[offset];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_cmp =3D rxbuf_ptr[offset + 1]=
 &lt;&lt; 8 | rxbuf_ptr[offset];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D FIELD_EX32(cr0, TY=
PE2_COMPARE_0_WORD_0, MASK_VALUE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compare =3D FIELD_EX32(cr0,=
 TYPE2_COMPARE_0_WORD_0, COMPARE_VALUE);<br>
<br>
-- <br>
2.37.0.windows.1<br>
<br>
</blockquote></div></div>

--00000000000041586b061a36a4de--
