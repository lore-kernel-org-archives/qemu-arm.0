Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6798291njk;
        Sat, 28 Dec 2024 01:58:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0XSosAqlb+W/B7EneDQ5JeayVdAh2XQ2R756rXa4n81Q5aVH9oHNOtmHmOMmBTh4iKHBD0CTRlu7NTw==@linaro.org
X-Google-Smtp-Source: AGHT+IErlExdJlIPOEZ7IKEDF+a62NQYXLqgEOevJzgug1wQKSTQyX9SeAXUS8ovXNZ8ZUrtCg6X
X-Received: by 2002:a05:622a:181a:b0:467:72c1:7084 with SMTP id d75a77b69052e-46a3adaef78mr558330631cf.0.1735379932203;
        Sat, 28 Dec 2024 01:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735379932; cv=none;
        d=google.com; s=arc-20240605;
        b=IaN7mxyx3b2I6pV64avXHUZqcghL40L203zBsu6BqFAg2aFWVtTLRD1nrvxhrO3Jy4
         Tf0NvLPSLZ3QhkbHhqi9538aPG2imRFCP4e/nWwIhUNMJ2m4qxdWzcKyQ0UFof1a3EKi
         JFKjhNHPLGgg35xQDmbV/s3Dcnj4A+xNoxIpHspu5pTfo2fbWEPkJh7+QFIRWlLptR4O
         rHdjow+0G3ByLNx82BVgdbJsx0+KKJT34tvZr21OH2DHjHlagtgePi8OvEPSu614TSyR
         jkqfnMjHA9xmxURRV/dGtDAhPI8q24IfrOop0lXE7FkIvGXHm3/JVE1ttJJEfGQGuDPA
         eNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oLlZkWWkhRX5Oroi9WNUnTbKDBk8JMb0+4tDupX6CDY=;
        fh=ucikgKTO/fL/tApgCvf7XyzMUCUn6dqL1t6daM2fN+4=;
        b=fmQq0B06O+MOxWokMskN8ehlQB7nrsUHJz55SiVShtLygNfdUP5fc5dEVKFrgg8+fm
         k5yETn6VATPtGMW0ylPl2W5PAnnHfI8LhLGQfXAdu0E7xj8jtk81dMtjXH+k4SpkuwxC
         vJbhpDmQOfIIADvWE1+busmb6A+yfUXC7EhtaHaMbGpkVIw/yN7VlYiXC1ALzNFsL6QR
         dahG1jJ9A87rqxZMX0G1dsQNkytYHNbD873RXI/eLBTLHzLL0QHQPlkzQwpJaMUz/v7C
         hn2kngnyY871stWoMsI2JNw9AZU09E8JxGNqng5D/ahyWQTLf3erTzQPBVZHxFGLLgkA
         KlNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=u0KbVkNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3e6b0379si219149061cf.211.2024.12.28.01.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2024 01:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=u0KbVkNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tRTaJ-0001l7-Io; Sat, 28 Dec 2024 04:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tRTaF-0001kW-Gq
 for qemu-devel@nongnu.org; Sat, 28 Dec 2024 04:58:11 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tRTaD-0002lc-Fy
 for qemu-devel@nongnu.org; Sat, 28 Dec 2024 04:58:11 -0500
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-4aff04f17c7so5060242137.0
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2024 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1735379887; x=1735984687;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oLlZkWWkhRX5Oroi9WNUnTbKDBk8JMb0+4tDupX6CDY=;
 b=u0KbVkNx57iqTt1LN4EPpoWGbg4aCwdoo/9FKdQfHSK2rG9bNqtAmeqjYS4UMZ2CJC
 qQi8UBRjbOyMWEat80GZk4hB+gdrVfpCZWpOUiZZNEoEnrhBEokEXNziqCKv+bK6EKwk
 jcXyefKSmLo7aAI6Lkc0Tbsq3Er+9eztKjJo69s9U03wQcDhkF9vLS3aVr4R1AyfQ0gw
 MNy0Bledc3rUyqF6DVr/Q/q8PQUy2zK1deGeSti3RHr85z7cxNoqspZ4BYdxlwLQz89h
 w5mdpLJlZ0z1XvZZk1KSVghh/sATyc+HXDwD/qjzSQbG7YPzVF0+O0B0e+ND6gG0UlEp
 HB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735379887; x=1735984687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLlZkWWkhRX5Oroi9WNUnTbKDBk8JMb0+4tDupX6CDY=;
 b=Wu92O4UMDe2wXNmT2sCwUHA5OpXwUsWRHVb4bz+kcQDjjhR4guQxFcAqY+Fk3wGEWY
 1LO6+Q6sJMcU37+hR+fx5xv15APi/4YdaCKekM2x5vihGCkbZcUXvkFid8dCbLk7DQZp
 TTYaR7/LxG7BjtU/3z4k8IVzYAi9JykWkd23p6RWRVJjXqDYx4Drhea9I+QeVvJOzpgm
 IFUGkv7Y/JPvybNl4pd6uvo+aUCvOnB36MSZERMBYWXCWF6yUrFBYN3iIhoTG1YZHb/k
 yhFPO/UbxFiWoAIN9PjxWNjSJRnmEAc+2bsYNR49VUTPpsprMuRMaI/NCKyiqQpK5TIX
 yU4A==
X-Gm-Message-State: AOJu0YyJv8gwuVliTtL2gKOYT8RU/bpaNrWs5nTezmgDMWCvjOiod6fr
 +EkXAp7e1ISuBCaEZyfYvHctLa28DG9B3161P3W4ONXeNMTNOejfi7OiIAP+yKjsFpKQW40YYXi
 qe4QrzelhHiHwkvtxBNVpGQcRLDLKovzGgo1R
X-Gm-Gg: ASbGncsqN69I9/QpUUYlN7l6DbtnJXa8OZL719C3EADNXGa85buhmPbE8/OJJEPFqQX
 eo1D5qpJHkDe6wJleu17RjedbggKXxPvmS0W1uA==
X-Received: by 2002:a05:6102:1623:b0:4b2:9eee:666e with SMTP id
 ada2fe7eead31-4b2cd6e373bmr22422432137.4.1735379887262; Sat, 28 Dec 2024
 01:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20241223221645.29911-1-phil@philjordan.eu>
 <20241223221645.29911-15-phil@philjordan.eu>
 <2ceda358-adce-42bd-9f29-9a2e441361f0@linaro.org>
In-Reply-To: <2ceda358-adce-42bd-9f29-9a2e441361f0@linaro.org>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Sat, 28 Dec 2024 10:57:56 +0100
Message-ID: <CAAibmn2dTpEcbp5P9VKARevCDBthTyhRSyhQrZTiq5e3BWCftg@mail.gmail.com>
Subject: Re: [PATCH v16 14/14] hw/vmapple/vmapple: Add vmapple machine type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org, 
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com, 
 richard.henderson@linaro.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, chenhuacai@kernel.org, 
 kwolf@redhat.com, hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com, 
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com, 
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Content-Type: multipart/alternative; boundary="000000000000bb2c84062a519dbe"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::e32;
 envelope-from=phil@philjordan.eu; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: tLST03aP2+vW

--000000000000bb2c84062a519dbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Dec 2024 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g>
wrote:

> On 23/12/24 23:16, Phil Dennis-Jordan wrote:
>
> > Known issues:
> >   - Keyboard and mouse/tablet input is laggy. The reason for this is
> >     that macOS's XHCI driver seems to expect interrupter mapping to
> >     be disabled when MSI/MSI-X is unavailable. I have found a
> >     workaround but discovered a bunch of other XHCI spec non-compliance
> >     in the process, so I'm fixing all of those in a separate patch
> >     set.
>
> Should we wait for your XHCI fixes series to get reviewed first
> so I can base this series on top (removing this comment) when merging?
>

I guess that depends on timing to some extent. Maintaining all these
patches out-of-tree for extended periods of time is somewhat tedious. We
could also merge this series in batches if that's preferable?

The gpex patch (4/15) especially touches a lot of parts of the code base,
so I'd really like that to get wider regression testing sooner rather than
later.

Patches 1-5 are also useful outside of the vmapple machine type, as they
affect x86-64 macOS guests, so they could easily be merged without the
rest. (OK the apple-gfx-mmio variant contained in 2/14 is only useful for
vmapple; if we were being picky, it could easily be separated out into a
separate patch to be merged with the rest of vmapple though.)

--000000000000bb2c84062a519dbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 27 Dec =
2024 at 21:36, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 23/12/24 23:16, Phil Dennis-Jordan wrote:<br>
<br>
&gt; Known issues:<br>
&gt;=C2=A0 =C2=A0- Keyboard and mouse/tablet input is laggy. The reason for=
 this is<br>
&gt;=C2=A0 =C2=A0 =C2=A0that macOS&#39;s XHCI driver seems to expect interr=
upter mapping to<br>
&gt;=C2=A0 =C2=A0 =C2=A0be disabled when MSI/MSI-X is unavailable. I have f=
ound a<br>
&gt;=C2=A0 =C2=A0 =C2=A0workaround but discovered a bunch of other XHCI spe=
c non-compliance<br>
&gt;=C2=A0 =C2=A0 =C2=A0in the process, so I&#39;m fixing all of those in a=
 separate patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0set.<br>
<br>
Should we wait for your XHCI fixes series to get reviewed first<br>
so I can base this series on top (removing this comment) when merging?<br><=
/blockquote><div><br></div><div>I guess that depends on timing to some exte=
nt. Maintaining all these patches out-of-tree for extended periods of time =
is somewhat tedious.  We could also merge this series in batches if that&#3=
9;s preferable?</div><div><br></div><div>The gpex patch (4/15) especially t=
ouches a lot of parts of the code base, so I&#39;d really like  that to get=
 wider regression testing sooner rather than later.<br></div><div><br></div=
><div>Patches 1-5 are also useful outside of the vmapple machine type, as t=
hey affect x86-64 macOS guests, so they could easily be merged without the =
rest. (OK the apple-gfx-mmio variant contained in 2/14 is only useful for v=
mapple; if we were being picky, it could easily be separated out into a sep=
arate patch to be merged with the rest of vmapple though.)<br></div><div><b=
r></div></div></div>

--000000000000bb2c84062a519dbe--
