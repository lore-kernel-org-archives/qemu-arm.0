Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1318119dlb;
        Thu, 9 Jan 2025 02:57:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1fSB0VMpo0EdZbAJ4SlExD6Duwdcfa82BRFPR9A98YGGAxbvDaA+vSZ6+q7/o0xSf0Z7r5LEZqyf1RQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDsiOLGoQXezQx/2lQeaBKibmKzGdbiGbhhyBpO+8klFJTA79AiJqF4yg9iefK+76STBK7
X-Received: by 2002:a05:620a:1a28:b0:7b6:da92:fcd0 with SMTP id af79cd13be357-7bcd9727ae2mr864196685a.8.1736420253767;
        Thu, 09 Jan 2025 02:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736420253; cv=none;
        d=google.com; s=arc-20240605;
        b=cDgSk+GpdcDmCveB73yDjeyB67ljAJJM9+4xP7z+oyTLBpkZzocHQrO8CCcyKxeVlE
         wY5xi6r85mmjCAE4ucYQkz9sNhf4QEgKV+fumQcdZvv+ziyndutVfpzlmERnga/moHCa
         ETKAkOY+CC6lkZtvDue2kG8HMSgxQ2RQddjtv5RB/bZHmumlM95YfoA0k/hPLTzPh8Ds
         qe/1YzRQ9GG8Vw72xcNNXYEEMnM9XtX1ZnTclF8JIUEu+IIuLfmdSSb3JM7FvMijVNjc
         xcG1ZSyx1XozjoEXRrsaitI7jXeudApwiXvZsAzK698hr5osGbZhPtp7Nzchf/jHp54y
         m2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QZizyE+sqVqNzd/4+/3++039N742rp8OayC2oGAAPnk=;
        fh=7HSU5Yo7rYdJ3iZOvEO1YpDyfFO/1B1x2X2j0NNSKeQ=;
        b=UHSzrqxTZtEw3L2Un+3z+PB0LC3NqZhO9FZ1iODWYR+18O5AJGmTxPLj9oxTRB8kZR
         sDl5V+y5Zz3hAJI22aFa5NzWm+K8cQ7w4X05ATwmrIC9JM8Yaa0rTDb7/gKvTm10KHEo
         qZjvnlPKkpQuS6gJmNxV3xAerG2aJsATUHdb175j/vA23Fz2tnxDixSqxyfNwNSdHZgY
         7gMySfP2KH4ab5G5lvSImFibV3JKJ9mHYr9iki/AIZ8bK6gkGT5u12rEaQzZzPx6W7DX
         VkYz/XmDpxNZYMmtudfzj4qlFaSyI91vHlZPAgEJBhme7VDCBdmwCazWVn1uBpWSSnQf
         b0tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=K9TF3Csw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce322a560si130341585a.65.2025.01.09.02.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 02:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=K9TF3Csw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVqDy-0000i3-B7; Thu, 09 Jan 2025 05:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tVqDw-0000hT-N0
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 05:57:12 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tVqDu-00008j-Tp
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 05:57:12 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so1310599a12.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 02:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736420228; x=1737025028; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QZizyE+sqVqNzd/4+/3++039N742rp8OayC2oGAAPnk=;
 b=K9TF3CswzFn28cESMU64Ycq7JnPREaoAGT0FBP0bH0U1vmSCAuPdZ92Z3UtqeiDUyc
 uJ38OMnWnGgyIpjxNFZgp2SlZP87GZOknHvcBnUldnG1gz6+3E1RzEhi+VfP6m5OeU7Z
 j4n5fY8hqW+e/nLakZfrVYM60R9yk7xJ6u/zE4znhDkbGbUApGgSdUJhX+A1k2gx83sT
 ofJz+KxNDrNPXP/o0sR/0bPCegRbvdIwDSiarV4lwey4/itmCUmB5z7LqpKgl9TMdG37
 YlB351KAxNpWFZw1l4nfOjJgprSRLJ3lkprIAETJYJL/ynW9A8bSaFFHrovrGLuzsIU6
 WUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736420228; x=1737025028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QZizyE+sqVqNzd/4+/3++039N742rp8OayC2oGAAPnk=;
 b=uAzw95KuvuZt9Vs6kiZFUcSe39EDubo4l5bgeil1oMpIGmIwSqjq1XhCFvrvtNkjVn
 e6hpznRT4+caDnynG1NmVfabeOu8gJ+N6qThq8u5DJGz5lbubCO2DmZ5OiBgz+6fobQp
 X970PcXZz/+rzoCU+kSq5glnROT5BRzFuXLqFLmrcsdn4Im8u7t77TVnRhN0nsFwbgTD
 ZAmvOAMmf31bRR6fcK1N8c38XiUNyeFu5ZwbnrAe/iVuxFfBJWDgbrQO/3krWz2GvYdg
 Tv7mENaNgXDFGf+ZjHXEtCYTdn5LQd5E4ZeHl2VPJUoCVK/yrfGfmqndWtT/iqRq7/cs
 o2+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQYWtn/bNuXlG6Vo8Nj8cr0gEhXjvR4gnPts6QX51dXd+wLN3vcP2kQX/wvCRNpVqTlfRDqdC+NA==@nongnu.org
X-Gm-Message-State: AOJu0YzVkO7ojtRQoYFl0G2B9N2qmyeReO93BjAVCPZ2bZXRBsqJreE+
 cCwwe2oolsJgwZhYBXuPrxRc9F+9IdZhjVOQdsglfFvfkpPAOZlQKoMrpS09/AobbA/gxJ0mk3J
 55bimcDscaOCyYthEIiGP7FaLkRb28eHzj4R/EA==
X-Gm-Gg: ASbGnctcSWdecUCUNFmIbLQOVEZXspcuNFCgd3HhPlOUqsyOM8gw3420P4bPE/WosYe
 oqwPqt6MQPeHQ6BsVTqzHjzlG4QO+TmNDcZPiXnua
X-Received: by 2002:a05:6402:4415:b0:5d1:1f1:a283 with SMTP id
 4fb4d7f45d1cf-5d972df6fecmr5421704a12.4.1736420228620; Thu, 09 Jan 2025
 02:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20241216004857.9367-1-jason.chien@sifive.com>
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Thu, 9 Jan 2025 18:56:57 +0800
X-Gm-Features: AbW1kvYz0C0jE49uTCElGy3vKnqKd2DkiKC61hXIFIqabUQVa4biuyRfrxbeJz8
Message-ID: <CADr__8pzZ2+H1g0SZWqjYqRLf_gaeNYQ+ATNyYZLBtaqQDkhTA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Avoid contention for PCIIOMMUOps between IOMMU
 and PCIe host
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:MCIMX7D SABRE / i..." <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e88b3a062b43d600"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jason.chien@sifive.com; helo=mail-ed1-x52b.google.com
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
X-TUID: iGLXi5LTPpw5

--000000000000e88b3a062b43d600
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.

Jason Chien <jason.chien@sifive.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=BC=
=9A

> When PCIIOMMUOps.get_address_space() is already registered by the pci hos=
t,
> e.g. TYPE_DESIGNWARE_PCIE_HOST, IOMMU cannot overwrite this hook without
> breaking the PCIe translation rule, which means that IOMMU and the pci ho=
st
> cannot coexist.
>
> This RFC introduces a new callback, PCIIOMMUOps.set_memory_region(), and
> an API, pci_setup_iommu_downstream_mem, to avoid the contention for
> PCIIOMMUOps.get_address_space().
>
> Jason Chien (6):
>   include/hw/pci: Add a callback to set the downstream memory region of
>     a pci bus
>   hw/pci: Add an API to set the downstream memory region of a PCI bus
>   hw/pci-host: Enable DW PCIe host to send memory transactions over
>     specific mr
>   hw/riscv/riscv-iommu: Allow PCI hosts with iommu_ops registered
>     connecting to the IOMMU
>   hw/riscv/riscv-iommu: Acquire device IDs dynamically
>   include/hw/pci: Send PCI dma requests with memory attributes
>     containing BDF
>
>  hw/pci-host/designware.c         | 18 +++++++++++++++---
>  hw/pci/pci.c                     |  6 ++++++
>  hw/riscv/riscv-iommu.c           | 21 +++++++++++++++++++--
>  include/hw/pci-host/designware.h |  2 ++
>  include/hw/pci/pci.h             | 20 ++++++++++++++++++++
>  include/hw/pci/pci_device.h      | 15 ++++++++++++---
>  6 files changed, 74 insertions(+), 8 deletions(-)
>
> --
> 2.43.2
>
>

--000000000000e88b3a062b43d600
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">Jason Chien &lt;<a href=3D"mail=
to:jason.chien@sifive.com">jason.chien@sifive.com</a>&gt; =E6=96=BC 2024=E5=
=B9=B412=E6=9C=8816=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=888:49=E5=
=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">When PCIIOMMUOps.get_address_space() is already registered by th=
e pci host,<br>
e.g. TYPE_DESIGNWARE_PCIE_HOST, IOMMU cannot overwrite this hook without<br=
>
breaking the PCIe translation rule, which means that IOMMU and the pci host=
<br>
cannot coexist.<br>
<br>
This RFC introduces a new callback, PCIIOMMUOps.set_memory_region(), and<br=
>
an API, pci_setup_iommu_downstream_mem, to avoid the contention for<br>
PCIIOMMUOps.get_address_space().<br>
<br>
Jason Chien (6):<br>
=C2=A0 include/hw/pci: Add a callback to set the downstream memory region o=
f<br>
=C2=A0 =C2=A0 a pci bus<br>
=C2=A0 hw/pci: Add an API to set the downstream memory region of a PCI bus<=
br>
=C2=A0 hw/pci-host: Enable DW PCIe host to send memory transactions over<br=
>
=C2=A0 =C2=A0 specific mr<br>
=C2=A0 hw/riscv/riscv-iommu: Allow PCI hosts with iommu_ops registered<br>
=C2=A0 =C2=A0 connecting to the IOMMU<br>
=C2=A0 hw/riscv/riscv-iommu: Acquire device IDs dynamically<br>
=C2=A0 include/hw/pci: Send PCI dma requests with memory attributes<br>
=C2=A0 =C2=A0 containing BDF<br>
<br>
=C2=A0hw/pci-host/designware.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++=
+++++++++---<br>
=C2=A0hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
=C2=A0hw/riscv/riscv-iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 +=
++++++++++++++++++--<br>
=C2=A0include/hw/pci-host/designware.h |=C2=A0 2 ++<br>
=C2=A0include/hw/pci/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 20 ++++++++++++++++++++<br>
=C2=A0include/hw/pci/pci_device.h=C2=A0 =C2=A0 =C2=A0 | 15 ++++++++++++---<=
br>
=C2=A06 files changed, 74 insertions(+), 8 deletions(-)<br>
<br>
-- <br>
2.43.2<br>
<br>
</blockquote></div>

--000000000000e88b3a062b43d600--
