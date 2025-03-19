Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp400223njc;
        Wed, 19 Mar 2025 10:19:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRfH2Ov7Sz/iCIZ+cOIgpD8ZZT9gI8HhkkyBg/CjvyI1+uXO7rle6jN/CB7DZ+dsZZArTl8kI5xEKBZg==@linaro.org
X-Google-Smtp-Source: AGHT+IF9CP/gt4Ua6jzts1v/t3cLYanLNnmr7rg/aP4UqWaG1dR1OmVUOgZhq8mt5a3df4Xj37jw
X-Received: by 2002:a05:622a:1c0a:b0:474:e66e:3955 with SMTP id d75a77b69052e-47710cf9253mr2856551cf.25.1742404784259;
        Wed, 19 Mar 2025 10:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742404784; cv=none;
        d=google.com; s=arc-20240605;
        b=cd7RXk3+hYwZ4a4gvmUGhN9NCPVTx22oUEG2LvrzuIll86F7Y7Dsyv5ym6gp2dKtL+
         dGC0JoAJYUPi7CDcy4RBnbV6X52fTG+0JgaiO+CuM5si+A1aXNSWzwPGOvQTLilhOxUQ
         6HmrxRygbgEfMO8hFUzmpm8F16mUoBxw4i4IwLvkrMywtj/IrSKsb0eO6zkpAfJLZ0dD
         1R63tjZ3ck5Qr+3iPwdr7vGXz95l0387lqXosMrDat405JIyXjXAkzfivNXM3OATFZKS
         fNmYAvRtuD5oc2CNcH1hA7fjCZunA7AmIajZftJXOuVCoZ0rUPS1yS2gBavANTtHzi6W
         RANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9SRSY3jrkOn9x5eeoNPjo/upYoDQHJ3GIjwfWH+DP0s=;
        fh=NJOzyRX0vNAwm6EJ0Pea2CtQjQQ57bUIXgk5hkL8wGk=;
        b=KCs0EAAGho2LofXxTvOih9f95uCs/3DTQOmyNm34Lwo0W2CD5n3+cfloOj5TWHvv80
         pY+1goPmcuJ/8jvyiLH21SBm96FDv/VxqA0+1/L8Nulvvy2HhexU+iSKDVWUQkpc1IYh
         NgVG+A12L2u20ajya5UgumwUDksnfdo10fJP+NEfd/eQ3YxnRWdngzlCUVHK4O282vnb
         Yh2b9FzCIBAPKc/lCEr44kwMFHzgOKIjrX9UrQFm5Lj07GvI3PHNtKDI4NhU22GXEk7K
         lF6LDQhP8EEfpU9UdlBam5uUhKQNoOaxrTrXCtTs3HU5NgLwhbXQ4yqvXY1UuGFUY5ty
         0YaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=dTJjnzUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb85cb1dsi145791611cf.546.2025.03.19.10.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=dTJjnzUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tux4s-0001wo-Ri; Wed, 19 Mar 2025 13:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tux4q-0001pb-L2
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:19:36 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tux4o-0006NC-0Q
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:19:36 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so12824795a12.1
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 10:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1742404772; x=1743009572; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9SRSY3jrkOn9x5eeoNPjo/upYoDQHJ3GIjwfWH+DP0s=;
 b=dTJjnzUKMbEjJDOL/5XVYZb7zwNZUdOLFHtdH17Yfo3efV9R0OAHLkSuYFA3hzwioT
 EgVw8hgEYWvjdPrqOtP0l5FxvxC6yNECFx0pVfbX4gjKiJHS/Q5nBxYTI9nY9nCr5Y4d
 w9ET1h0A/W73HmBhNW35n+Elr3uyijOXUkXwiuJKjK1frhCWHew20OX5L+iV7PaPOEIZ
 thmHCKBPQ0XgMnQdxATtF/+PicOvX5/Zqm53Hu/4tBJi6ADD7tKYcWAJRrPMAyWJmdjT
 psqg5JGmSnClmf+eh/6Db0j8PkYVeF66TFs2vGeYJ1VEV8WLNLX7gHNahpdqgVZNsomY
 lzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742404772; x=1743009572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9SRSY3jrkOn9x5eeoNPjo/upYoDQHJ3GIjwfWH+DP0s=;
 b=nDoMWQa2ZgTIR6PqPJOjdzCCet8gSdN5pJRD1FIF8i6vtUtASLPUnEGdLfYfjnsV3R
 49bkMxyOPNVb/Uj7f7cEITM6Pmhay0k3f0BPr45AIemGK7Rzp41DtxDx6IPfEkCX58f/
 uxko3qoool8pAlNsh1P7Mr06M56zC/5EA8DNA4ZoY4FaDvuHNgnO3xmIkowgrLlCRkTc
 FgbyyqE107B4CwpMhOJFCrdGOpFA1YobZaiUDaPWVSeUUWSN9joKLEa7Y+uHbjhseae3
 b8Z3feiszMTbhRcSHQZN6MplAjv1fE8fShQmRI5XYxbQesuQs/Zr/Fw/obmYd53j+070
 0hPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAngS/Qar9040l/3wc9w8ibFrbsadj1VZfOh9rLUTM9k/XCUX6Ucmc4DnKeIQfHJ7axFASxZOExQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywn8hCmQB+zH8S61waRYqZqNUeBhcjYoH4+8HM5n8VrXwboaabw
 PpD+ejlR9pkTEHLm1gwgFNUspX9OcEO7LKePVXnGtsTz/k20hlx+KA6/b2Ovcu+CkqvpRGzTpJL
 SmtcD5aywHs7neOz1Elxw9WPonkfkXDeyBVeV9A==
X-Gm-Gg: ASbGncvouF/A+uFBLQxkMHfaz/W3Yqu9YpkY6D4kK7HOaNRFZ9LK/dhCmphLMRXgh9P
 fVZjRuKN3AUlcuiFOXutPwdPOmcmRPW6y7TBwA6c18O5C8ULXCDF3wRlMd4NxaqCcV3Qyn4VPz7
 l1u0Opgw+0T4I+MDy4nFFOidI=
X-Received: by 2002:a05:6402:26d4:b0:5e0:8937:6ef2 with SMTP id
 4fb4d7f45d1cf-5eb80d0ef20mr4021495a12.8.1742404771528; Wed, 19 Mar 2025
 10:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250307203952.13871-1-jason.chien@sifive.com>
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Thu, 20 Mar 2025 01:19:18 +0800
X-Gm-Features: AQ5f1JqZAlTLGxIqrg1Xli1h2HIPrLWalQEsGwmyMEFt4ifDschwS-jD0ovIUhs
Message-ID: <CADr__8rgTBJW-KKAr55Y1wHLS7jRDyvQjx=vJCGAj4T1YZhUNA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Integrate IOMMUs with PCI hosts that have ATUs
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:MCIMX7D SABRE / i..." <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007667080630b53981"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jason.chien@sifive.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pZbFWVT2iDXv

--0000000000007667080630b53981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

Jason Chien <jason.chien@sifive.com> =E6=96=BC 2025=E5=B9=B43=E6=9C=888=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A

> The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI host=
s
> also utilize it to implement their ATUs, preventing coexistence with
> IOMMUs.
> Overwriting a PCI host=E2=80=99s PCIIOMMUOps disrupts its translation rul=
es.
>
> This patch series introduces a mechanism to route inbound transactions fr=
om
> PCI hosts to the IOMMU, enabling proper integration.
>
> The final patch depends on another patch series:
> https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg00003.html
>
> Jason Chien (4):
>   include/hw/pci: Introduce a callback to set the downstream mr of PCI
>     hosts
>   hw/pci: Introduce an API to set PCI host downstream mr for IOMMU
>     integration
>   hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()
>   hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATUs
>
>  hw/pci-host/designware.c         | 18 +++++++++++++++---
>  hw/pci/pci.c                     |  8 ++++++++
>  hw/riscv/riscv-iommu.c           | 15 ++++++++++-----
>  include/hw/pci-host/designware.h |  2 ++
>  include/hw/pci/pci.h             | 21 +++++++++++++++++++++
>  5 files changed, 56 insertions(+), 8 deletions(-)
>
> --
> 2.43.2
>
>

--0000000000007667080630b53981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Jason Chien &lt;<a href=3D"mailt=
o:jason.chien@sifive.com">jason.chien@sifive.com</a>&gt; =E6=96=BC 2025=E5=
=B9=B43=E6=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:40=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI =
hosts<br>
also utilize it to implement their ATUs, preventing coexistence with IOMMUs=
.<br>
Overwriting a PCI host=E2=80=99s PCIIOMMUOps disrupts its translation rules=
.<br>
<br>
This patch series introduces a mechanism to route inbound transactions from=
<br>
PCI hosts to the IOMMU, enabling proper integration.<br>
<br>
The final patch depends on another patch series:<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg0000=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archi=
ve/html/qemu-riscv/2025-03/msg00003.html</a><br>
<br>
Jason Chien (4):<br>
=C2=A0 include/hw/pci: Introduce a callback to set the downstream mr of PCI=
<br>
=C2=A0 =C2=A0 hosts<br>
=C2=A0 hw/pci: Introduce an API to set PCI host downstream mr for IOMMU<br>
=C2=A0 =C2=A0 integration<br>
=C2=A0 hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()<br=
>
=C2=A0 hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATU=
s<br>
<br>
=C2=A0hw/pci-host/designware.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++=
+++++++++---<br>
=C2=A0hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
=C2=A0hw/riscv/riscv-iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +=
+++++++++-----<br>
=C2=A0include/hw/pci-host/designware.h |=C2=A0 2 ++<br>
=C2=A0include/hw/pci/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 21 +++++++++++++++++++++<br>
=C2=A05 files changed, 56 insertions(+), 8 deletions(-)<br>
<br>
-- <br>
2.43.2<br>
<br>
</blockquote></div>

--0000000000007667080630b53981--
