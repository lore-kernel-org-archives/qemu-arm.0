Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1342082ejb;
        Thu, 6 Apr 2023 12:23:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZPOxvkXC0VWesVS+DRCvWg8ScgfishjizZsHYyGWx6unbUBkSz4E6NRb5v1E5/LWzAhEsN
X-Received: by 2002:ac8:5c8b:0:b0:3e4:df68:a5a4 with SMTP id r11-20020ac85c8b000000b003e4df68a5a4mr12108779qta.33.1680809002570;
        Thu, 06 Apr 2023 12:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680809002; cv=none;
        d=google.com; s=arc-20160816;
        b=RnBlYXRHQ2yN1FeWJEhUy3+/HC726N9+ql0IJMadgF/XV7AVPmRiccemh+zOUwVzkJ
         Utyy3lcca+AGSrSiaCy14UFQ7wch8q0PdKBmP2yvS9KNNh8lKGqyIM9dPAMW2ojfrjQ8
         R3mXw/saTznLH6O0rp7ElTD5c7OkDBV6LN+yqdmWrxn8a4uIQW668WV3riBsC/YcS+b+
         pQr1QWfns5c/vD/76ikyV0dJ5Wy7VaapWsac+jd0AKxFWjhU9YeHpeSL6CJ+SYVoEAeB
         K2S+d3j4y+Um+cqCoIUhQfPC8KWhwZekWIjKcUPFiyPxKYxVBq22PVC/iDg+w/aSxOPZ
         Fjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gzZTlQMZN6qlcXT1wmIfxv7cj+L5Hn9HQyVCvdPkQiY=;
        b=tDDPqlSTYyS86odQ57VCq9u1MVi0hQ3tgsbVHz1vmK8M1WuoGIrHErNSMbbbu250ZH
         Htm7vZ4qi9wIBBIkJY0CjxLiLoqyuuGg1nYPZGsl6vY1TLDHR33LcsrKg43tLTFJ0mJB
         BcbPk80Ub0rxQLIyNOGREV7SjxL8UuwY5il6B98e+soS3IIzDe1iDJB2rxK0hnzyHcan
         hNlHOI9BXO7h9n6hnPOC5JfDMbb6mH34gYePLfgkGluCzKMiGtOT3Vwsua1hsxPik/pA
         3uTJdd9ebNVyW/s5m5pbweYl5mcpIGEGFFHQvJZRrP/fAyiF/7tknLCS/PEnb237/2Mx
         2b0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="b/eyy1n2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05620a25d400b0074857673206si1453988qko.749.2023.04.06.12.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Apr 2023 12:23:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="b/eyy1n2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVCJ-0004fl-Gu; Thu, 06 Apr 2023 15:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkVCH-0004f1-VP; Thu, 06 Apr 2023 15:23:01 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkVCG-0006lb-1j; Thu, 06 Apr 2023 15:23:01 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-54601d90118so603204497b3.12; 
 Thu, 06 Apr 2023 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680808978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gzZTlQMZN6qlcXT1wmIfxv7cj+L5Hn9HQyVCvdPkQiY=;
 b=b/eyy1n22YzjbIz5YJxjJDgtDzQkSqmyYoWaCnrsWzOgmbnr5AEErL5APMi4GrfNbM
 SaWFhv+N1kYUOaWdcNX7niYTFJOaApRsH/QN9eDtW5uqLgBtH+3FUbG00zTmNLpQfrcq
 r5L4KT2MVle18TWrTt6qfp0lCY7oYL+TKEAativCIMFdz3RhOlhdsrPnlq6nyQYGD8/s
 +hYL/B/VKwGFGyUaGh0AUXHVflCST97MjA/Im9PD2ShUwLiNFRm5JG7a+J/fqaerun+0
 tu1okgbTfNLRC1lCgDoEt7jouSG8bX0FfdD/NU29QaIoRUUwB/ONzRrrEvGdEVz75O2/
 uzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680808978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gzZTlQMZN6qlcXT1wmIfxv7cj+L5Hn9HQyVCvdPkQiY=;
 b=cHvfaPcuVVFRDEOXKO62wffzeVYXetilxsQ99ujgRCajU0IMpl+5j7+GLCYro2CYyz
 R6vpe1+7gMv51maVEOcqWCV1qtNrt4j+aPlKP+lqbRrwGkEaK8ffCzp3StkmpnHNa8/2
 iM3MdK/jElTfdV7ZqTWv4PX4J+547q+DH45pQxM8xA8Tlte/h8715giqdIODBva3EfQ1
 Idwm2LX7wuW9+TiQrrERMJLVQRhGW5+AAcs4rM7UcQMTaAnME5q9kbTU12AMdy6hu7Rt
 L8/wDvtqKmdSJydGOD66xYZQG6YA/+oBZwFKbEMHt0ucch8lB+ACxnmaWRXZxQ7JTF56
 YohQ==
X-Gm-Message-State: AAQBX9cIHf1j74ec+z0PeizswvWRCvwAd9XWdLPmP0yHgpiJbjQHGkdz
 muFL9ScAxouy7Wi2DJJ3GQeSvZwXXTcRg+LdC8BBgz5o
X-Received: by 2002:a05:690c:72c:b0:52f:184a:da09 with SMTP id
 bt12-20020a05690c072c00b0052f184ada09mr4558069ywb.2.1680808978738; Thu, 06
 Apr 2023 12:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230328054654.18620-1-qianfanguijin@163.com>
 <20230328054654.18620-9-qianfanguijin@163.com>
In-Reply-To: <20230328054654.18620-9-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 6 Apr 2023 21:22:47 +0200
Message-ID: <CAPan3WrcM_tyfsVQNkZxtpj3pse6O58Nvkcwg7X=XHYt+seGgQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] hw: arm: allwinner-r40: Fix the mmc controller's
 type
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001cf3e705f8afd64c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WeuSz2ju8MxE

--0000000000001cf3e705f8afd64c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qianfan Zhao,

Is this change really needed as a separate patch?
Looks like it would make sense just to squash it with the original patch 01=
?

Regards,
Niek

On Tue, Mar 28, 2023 at 7:47=E2=80=AFAM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> R40 has SAMP_DL_REG register and mmc2 controller has only 8K dma buffer.
> Fix it's compatible string.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/arm/allwinner-r40.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index 0e4542d35f..b148c56449 100644
> --- a/hw/arm/allwinner-r40.c
> +++ b/hw/arm/allwinner-r40.c
> @@ -271,7 +271,7 @@ static void allwinner_r40_init(Object *obj)
>
>      for (int i =3D 0; i < AW_R40_NUM_MMCS; i++) {
>          object_initialize_child(obj, mmc_names[i], &s->mmc[i],
> -                                TYPE_AW_SDHOST_SUN5I);
> +                                TYPE_AW_SDHOST_SUN50I_A64);
>      }
>
>      object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--0000000000001cf3e705f8afd64c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Qianfan Zhao,</div><div><br></div=
><div>Is this change really needed as a separate patch?</div><div>Looks lik=
e it would make sense just to squash it with the original patch 01?</div><d=
iv><br></div><div>Regards,</div><div>Niek<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 28, 2023 at =
7:47=E2=80=AFAM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfanguijin@=
163.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" targ=
et=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
<br>
R40 has SAMP_DL_REG register and mmc2 controller has only 8K dma buffer.<br=
>
Fix it&#39;s compatible string.<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/allwinner-r40.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c<br>
index 0e4542d35f..b148c56449 100644<br>
--- a/hw/arm/allwinner-r40.c<br>
+++ b/hw/arm/allwinner-r40.c<br>
@@ -271,7 +271,7 @@ static void allwinner_r40_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; AW_R40_NUM_MMCS; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, mmc_names[i]=
, &amp;s-&gt;mmc[i],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_AW_SDHOST_SUN5I);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_AW_SDHOST_SUN50I_A64);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;twi0&quot;, &amp;s-&=
gt;i2c0, TYPE_AW_I2C_SUN6I);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--0000000000001cf3e705f8afd64c--
