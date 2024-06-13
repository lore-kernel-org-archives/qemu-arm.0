Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp29933ejb;
        Wed, 12 Jun 2024 18:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+Ff7g36KSDD8m/bBHiEd0+zON6fqJgWkoqzoOB2sWJcKsGvY/2RZqijN7mfplAuLfZ+TUplHWDLAzgEBcznwUm30vJdoK
X-Google-Smtp-Source: AGHT+IFMHgsawx53/4hSOO52NqQ1TWKf/5QWeoi/9hqI8Kb0aGhxfGxTmVKswFCVeAY0YujhYZC4
X-Received: by 2002:a05:620a:170f:b0:795:5f3d:3e61 with SMTP id af79cd13be357-797f5d9b64fmr380787085a.0.1718241891633;
        Wed, 12 Jun 2024 18:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718241891; cv=none;
        d=google.com; s=arc-20160816;
        b=k5+saGcLXvVwS8yYBVHLopcWqwgJLnNTgpyGZrP9hjuvrVQPfSKlLnkESjjVViIl5q
         hG5M7EEr2nPYbzzCAYt7dlyMEtot6HkmR7uym9bEFvVeP5zhStR7k1iHqEavN3UkgqfC
         5H5abq0qWKyZ0LhGclKS8WYarC0KzrfQvPT2PUX91pWQEHgQH+t/bikl9/Vd3gU7jwJk
         jEKYWlv+Fi1qN9b+ZwOQMy0XM+3qqhUtxN4xp4xMiqa3qwN5gwg+XuRK1DDPFvNuWvzK
         OKzjUNYOT/lMFGtQQENjAT1U5/ZpsAHAiNfxElKVlRdVaKt0Ycl8Ws18RNFM6ERsr/8e
         D4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+9fhbaKyi/gKD8M+vEAuB7KrOsgtG6SSl4lqPHdloaA=;
        fh=CXRbuHQo0UDQ13hb7TgLki/yd0gbfPruiVSWEJ2sN3w=;
        b=VKagT6etHV5pinZStUXvmL/X36mn02NZxpkujrqi+kcU2SFl0qEPUhsw0pK2a3roA+
         H0DKxgS8ReEDsxp1NhIW7r9s1mvtS+aneQsDyUsUxFpR5TokKvp/u0q4zGtcDg6zqRew
         YpPEItlAPBwXloa/roBF3e+mhNNvHJkHh+anLyRjLlrEou46wCXlXaGubBl19qoT7JBZ
         9ywokFCCenmBWCY8341YwEQMt8bapyrfDUAG1w2tLa/uSVvF2Noyuneaz/Z22PL8quV7
         GND1GSaLHFMyRgJZ+kOYvY1l4ViCO5NF0Wi9FHYnBX9NUxKHGTDhNyFxa0unmVFzn2js
         GJAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=JCu0HDZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798aeb8cfd6si29027785a.474.2024.06.12.18.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 18:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=JCu0HDZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHZCV-0005Xj-60; Wed, 12 Jun 2024 21:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZCT-0005X2-Lu
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:24:25 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZCS-0007Qr-1K
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:24:25 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4eaf67ad82dso164282e0c.1
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 18:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718241862; x=1718846662; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+9fhbaKyi/gKD8M+vEAuB7KrOsgtG6SSl4lqPHdloaA=;
 b=JCu0HDZ6w6m5JQlvAU6Qy9Oe+ESqKDei2C7m4YzQNPbKZ7nKtDSbC0g5wX0Ua8H3Hz
 zWFlgYjcYLkJbxejpBRnV5liy5XxT7fLilIXOze3LDKA52Re0XuVbhQ7Aw71UyrVc7//
 JqO2NKKpSMEiH+GFIneQodPqSJoDjcqlBPVbtJJ2Ol9J0k9v6Snz+/Ln2iGDXFKJ8F4H
 pVCvk9MFP/dROTSJGGZW9MO/xohXFqprxfdvdWtdmu4bCbe5XYM3n7Zxan4GMPfgn7k0
 wF91/nNtGCsAEh/Nq2RZxEVx6J4YYLjXFgxpm+EazgsS4MoalmlG1d7tUqYQObDFOlfa
 om6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718241862; x=1718846662;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9fhbaKyi/gKD8M+vEAuB7KrOsgtG6SSl4lqPHdloaA=;
 b=j/sNYMc5/KqjVLcIYmeed1eIqfQVxR1f16lmEvFI6+uf2q7kzxuprB/6k76Y5tyWJ+
 +tgnigoZibfrn31irnEtdBXr3RIdIwFvR7+1MA3nW9OQF4ge3Z1eOKOS8G5S18FvU3qK
 I/B/wJbQ1zGGXsNTFgLwhDC1VkSNBBUMI7lwvXrnuTj8R9o6TSkV1tdj06Zy+/r3zzGS
 vgHJLj56t9IN4IOhHvOHu6I+lIowZD6dWFLhePjJ0whVEBGLhgGgZY4Bc3waG/peFQWU
 Td9nbae4Jv7yHg/rEo8pZcryNz5O21FMKbsjvOe8oduIh/Ibq/y/ex4UNKl2qXa8+l+3
 V83g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY4LW+6HwbQ9mVbquUblalwBRO6v3qGUFAR7YJLm3AyxMl2vWYNBXG1cUn6sQw4a9wsOXIwcyCRZndxE1452IFIz6Z
X-Gm-Message-State: AOJu0Yx0bsEE6w+tElR8Tac/ywGKQ29ydeqG83h9apO8a0ge51d2/s8v
 Mom1NxRritRUsWySD3xyqbVojd8m+vAl4cKOhiy/B/cOITJJ/IrXkouL5plLb2OGzB7Z6ju9AQU
 1fLyNm+9J07wBdJr/aCRUMqk4b62LELPqwB2Hcg==
X-Received: by 2002:ac5:cd47:0:b0:4ec:ef78:d753 with SMTP id
 71dfb90a1353d-4ed07f474d8mr3299129e0c.14.1718241862316; Wed, 12 Jun 2024
 18:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240604071540.18138-1-fea.wang@sifive.com>
 <20240604071540.18138-3-fea.wang@sifive.com>
 <3a919e08-fcce-48d5-b609-cc97cd3ff22b@linaro.org>
In-Reply-To: <3a919e08-fcce-48d5-b609-cc97cd3ff22b@linaro.org>
From: Fea Wang <fea.wang@sifive.com>
Date: Thu, 13 Jun 2024 09:24:11 +0800
Message-ID: <CAKhCfsfarBTCud3Bo8e3viNxQMLT0X+xQSpPACMyPFgOECB-8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/dma: Add a trace log for a description loading
 failure
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jason Wang <jasowang@redhat.com>, "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000d796f8061abb5bbf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=fea.wang@sifive.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-TUID: O0j0LwJE04Et

--000000000000d796f8061abb5bbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, I will fix it in the next patch series.
Thank you

Sincerely,
Fea

On Mon, Jun 10, 2024 at 7:49=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi Fea,
>
> On 4/6/24 09:15, Fea.Wang wrote:
> > Due to a description loading failure, adding a trace log makes observin=
g
> > the DMA behavior easy.
> >
> > Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >   hw/dma/trace-events    | 3 +++
> >   hw/dma/xilinx_axidma.c | 3 +++
> >   2 files changed, 6 insertions(+)
>
>
> > +# xilinx_axidma.c
> > +xilinx_axidma_loading_desc_fail(uint32_t res) "error:%d"
>
> Unsigned format is "%u".
>
> Regards,
>
> Phil.
>

--000000000000d796f8061abb5bbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sure, I will fix it in the next patch series.</div><d=
iv>Thank you</div><div><br></div><div>Sincerely,</div><div>Fea</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jun 10, 2024 at 7:49=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D=
"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Fea,<br>
<br>
On 4/6/24 09:15, Fea.Wang wrote:<br>
&gt; Due to a description loading failure, adding a trace log makes observi=
ng<br>
&gt; the DMA behavior easy.<br>
&gt; <br>
&gt; Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" tar=
get=3D"_blank">fea.wang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@am=
d.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/dma/trace-events=C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 =C2=A0hw/dma/xilinx_axidma.c | 3 +++<br>
&gt;=C2=A0 =C2=A02 files changed, 6 insertions(+)<br>
<br>
<br>
&gt; +# xilinx_axidma.c<br>
&gt; +xilinx_axidma_loading_desc_fail(uint32_t res) &quot;error:%d&quot;<br=
>
<br>
Unsigned format is &quot;%u&quot;.<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div>

--000000000000d796f8061abb5bbf--
