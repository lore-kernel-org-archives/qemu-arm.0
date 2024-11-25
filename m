Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1434256njc;
        Mon, 25 Nov 2024 08:39:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWW0KsXzD0YIYm8egEINQ2EO84wdgd+FSfi1ryjcHTkdOQzZ8OjhzlNBBSK7pEzC/Ja8BdDg3tweeiZQw==@linaro.org
X-Google-Smtp-Source: AGHT+IHoWDcMEYLVeCcxzN1ThXceKDCjZt53uJnPGcv+VSYu+bUR0rIzW3k43VNXOANT6kEuPVcL
X-Received: by 2002:a05:6902:2507:b0:e30:8440:8162 with SMTP id 3f1490d57ef6-e38f8b57024mr12167866276.28.1732552757830;
        Mon, 25 Nov 2024 08:39:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732552757; cv=none;
        d=google.com; s=arc-20240605;
        b=gYWkX9y++JN7ZXF2RXvN87g9QnBz1DF4RSo5UYaclFpIFu2X62e45HsbSJos+AHscR
         chjuehDfE6/8UAAinKoquLiQkJORSU/MW6+S2PPynG0EKwAdC8/RWHN52pQE1o+80cEc
         BBorTMBnJbuSPkk30zGkJTQnnfgMJIngXE859wZEjzlXsHsOrTuV0OT2sJW/SozpnTtP
         Z9ZBLGvy4gx0ezRO061+iCjK2d6r1DpLAw+K1nu1dSME5lRP2e4uvlxdc5gbcx8Ec79+
         +V4BBxpWdIfKPZo+pq2ggIrP9SY1PhJ2zmeu//yXEgUOwYbK0//EfBcuy8rkrHPo+Erh
         dIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8W2PHlqzuLwSu++3qOdo0UFQcb9hDu43m0wkS5CHwmk=;
        fh=vgJI0+kUkvLSvI5bKte9l9G8X8wPe+rJqLIpN+LJW2Y=;
        b=CkCgFqNyWu8Nl79R5okd82d/JsznrpOo/j+OtXLKDjmhly4zROEC/reEjZaDznqcyj
         iuoNcJBGroF0ehjLK9fTaXe+cMxof2peOy7eF7kT3bNzpjoUyaBncaEYH5x25B8nLZgA
         dQYYPAOOvbDqZRjYRkTHmerS+CI1+Ins45pMRqwu+9EEX3Bn4U66VnZeiXA7g/FpLYRn
         gvFcR0Zv4lsqZPLFQijMJggqEbP0rfglByPwOgTThDa/1zynSzEJoXH5T0lKNI1L9OOb
         gTk9N8SRdSOiNQj8z272n5w5q/97skeKCL6lwP5cSvqUVdqAH0vsUm3RorTU8VKrGWsX
         UtSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXkyMcJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46686c118ecsi43567241cf.393.2024.11.25.08.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 08:39:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXkyMcJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFc6r-0005Mk-H7; Mon, 25 Nov 2024 11:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFc6n-0005LM-N9
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 11:38:46 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFc6k-0005ZY-2C
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 11:38:44 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5ced377447bso6180693a12.1
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732552720; x=1733157520; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8W2PHlqzuLwSu++3qOdo0UFQcb9hDu43m0wkS5CHwmk=;
 b=dXkyMcJZD6tEO78Q6whCbX4m1va3sfA6gaKqIh4w5pZAL7R8eNSNbLdj+obHTohlxo
 ARGrFZXIigmuHc5dG3Oc5SAwVKsNerGepw1p154GcV8QudrapDfY03V4kzDiYD2VMuEV
 TcGkuJg3Coo+Arfcvvzl5fsWT0iAhoYHCiRIW/KR8dbLM591bzkqYkGeJ5PFpR/bb+Ex
 Y1TreqINN7X1B4sRqOfExMK6WxkNhexlVZ1FXgQOTqOuLu3BbHNOUbms3sNVn0hqaPmC
 qccDvcmJ4mwXwcPJj7LhXL+BxvqGCuk2g2P17mkbaqCv+n/QSFw3eVk5a+sH5/m6ipN9
 mifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732552720; x=1733157520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8W2PHlqzuLwSu++3qOdo0UFQcb9hDu43m0wkS5CHwmk=;
 b=WKgiwAeEjd9+OURl3eUBmwqxm9yA1wkYznqI3Eo8sOa3yJe9A4pcpRaLeLMUtPFAfa
 eCkLidNxOs0ws36at2q0CrqJfzK6JH1swIyetdjAXzKGJqjM7axd+oKsJKUmdac7eU+l
 V25j8jAjZmKHwuXKx+f7EXIvD+x41qfHi9WOeMeW0iDKM6iYJfVFJP+epOmGU4SrN6jm
 CLEKuQWupJ7+p31Qf/gWaUQjIPVVq5+c6Y7teZQgbRzd6q1Q0pH4RmbP+7mxL5s7Czbd
 NlKpXfdoWe9dyeo+CflF4IJ4RqSHZj1hgtA3pLF+08IZizwG36Ujo4Z/IzNnjUmXbhg2
 DD6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0kWsuVSZOsfFuDKtFr3zmMvKHgq7B2EdVl+92r1eMiGRy4T6hay8NcWZVWUhZbNsBSojWQVdGUA==@nongnu.org
X-Gm-Message-State: AOJu0Ywk+ywV6XAqbFMiLUIRvuuPLOvIm9V6p3Nji1NnehGmfNq4Hthy
 PI0m++gt+RYmoTA0cGnpnDa8LkUnNjY52y6RSIgLGLoJW6Jq3nABzmwsa2XkjM8Q58djcBvyNF3
 oLiAWF6XAhFL9uhHcgeB4DZxyCzspATEyvckOvQ==
X-Gm-Gg: ASbGncsd4YfIHt/fEZRRtW6jEWrQiNTcdbLohgQ6ZW6LQzf0Xff6ifda8bEOC9Nh0oR
 oDZ78LKp7yISE2zKmcU2y85BCn994pZI0
X-Received: by 2002:a05:6402:1ecc:b0:5cf:c188:81b6 with SMTP id
 4fb4d7f45d1cf-5d0205c7491mr11920947a12.6.1732552720004; Mon, 25 Nov 2024
 08:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20241125140535.4526-1-philmd@linaro.org>
 <CAFEAcA9vS-9u282Jr+_QaGZT6vD4cpmh0wjuYPQSPLZQw30e4Q@mail.gmail.com>
 <748eb21d-4b73-4d2a-8058-b3a79d4fb802@linaro.org>
In-Reply-To: <748eb21d-4b73-4d2a-8058-b3a79d4fb802@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Nov 2024 16:38:29 +0000
Message-ID: <CAFEAcA_NqH5v5Oii2dQqw_Lx66u=Fkbqq6WGnOHF_Z0jfumgSg@mail.gmail.com>
Subject: Re: [PATCH-for-10.0 0/8] hw/boards: Remove legacy
 MachineClass::pci_allow_0_address flag
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Thomas Huth <thuth@redhat.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-ppc@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Alexander Gordeev <agordeev@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GiwwCgpjVC35

On Mon, 25 Nov 2024 at 14:49, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 25/11/24 15:14, Peter Maydell wrote:
> > On Mon, 25 Nov 2024 at 14:06, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> This series aims to remove a legacy field from
> >> MachineClass.
> >>
> >> Rather than a global exposed to all machines,
> >> use a pci-bus specific flag on each machine
> >> requiering it.
> >
> > Should this be a property of the PCI controller, rather
> > than on the PCI bus? Presumably on the machines that
> > don't allow a 0 PCI BAR address this happens because the
> > PCI controller refuses to map BARs at that address.
> >
> > TBH the commit message for e402463073 suggests to me
> > that "allow address zero" should be the default and
> > either specific machines should forbid it or else we
> > should figure out what goes wrong with them, if the
> > problem is caused by some bug in QEMU. The commit message's
> > mention of "fix PCI memory priorities" suggests to me
> > that this is a QEMU bug, and that it ought to be possible
> > to have the machine set up such that you *can* map the
> > BAR at address 0, it's merely invisible to the guest because
> > some other machine devices have higher priority and are
> > visible "on top" of it instead.
>
> You are probably right, the following comment ...:
>
>   pcibus_t pci_bar_address(PCIDevice *d,
>                            int reg, uint8_t type, pcibus_t size)
>   {
>       ...
>       /* NOTE: we do not support wrapping */
>       /* XXX: as we cannot support really dynamic
>          mappings, we handle specific values as invalid
>          mappings. */
>       if (last_addr <=3D new_addr || last_addr =3D=3D PCI_BAR_UNMAPPED ||
>           (!allow_0_address && new_addr =3D=3D 0)) {
>           return PCI_BAR_UNMAPPED;
>       }
>
> ... is from 20 years ago at the beginning of PCI in QEMU, commit
> 0ac32c8375 ("PCI interrupt support - PCI BIOS interrupt remapping
> - more accurate memory mapping - 'info pci' monitor command") which
> suggest the implementation is incomplete here.

See also this thread from 2015:

https://lore.kernel.org/qemu-devel/1444683308-30543-1-git-send-email-agorde=
ev@redhat.com/T/#u

which includes:
 * me asking why this isn't a property on the PCI controller device :-)
 * MST confirming that this setting is only for buggy machine types
   that don't get the priorities correct when the BAR is configured
   so it overlaps something else
 * me expressing disappointment that we made the default for this
   flag be "this machine type is broken" rather than "this machine
   type is not broken", because of course almost every machine added
   since has left the flag at its default value
 * a now out-of-date list of possibly affected machine types that
   might actually need to mark themselves as "broken", or at least
   be tested to see what they do

thanks
-- PMM
