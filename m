Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1010953ejq;
        Thu, 9 Nov 2023 23:32:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHye04xcQ0xj/TPZyCA0ObS3PL3F/kyHTzJm2WfoANmhIVQoDPpdPYOmJjkXy/fjxOaIOKx
X-Received: by 2002:a05:620a:2408:b0:773:c6a1:a4e0 with SMTP id d8-20020a05620a240800b00773c6a1a4e0mr8009720qkn.2.1699601550776;
        Thu, 09 Nov 2023 23:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699601550; cv=none;
        d=google.com; s=arc-20160816;
        b=SLe/MbR7+5fAvhLh6IqR75EmfCsn2BXOhULAwWN9ZeA7u8UD983bqzV7jQnmkJgxsl
         1BjfcAsCE6aZ452v53RoCcWOo7IF9vEyd8LVvbKDBDmZm4fKgI/3THcBUxmCr8f3vAvn
         I+lDFDDAt9E/2pmm9Z0XXN6oNGBVE6fT5YaAieMpLra+nsKPzFBnu0fDXHPWLyKKa6oj
         9GZMo1PdtV22AG97EypnEIT3QwIs90Ocv17Z276HK80EWwBtSnZZen4wPD1PN5LNhVrw
         o24d6wIyuSo3DgdoH0eCx2nokuybt648zOgwpNwbbYk6Zk8y5Xz2ndYgNNeqsrmkUFP2
         ieWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZpzkuQ3EokkT80Y2bQ2BAl9ZQRy6Itv22qj1L2DbalU=;
        fh=VFthBNTFGAd8XGwXzHkSOFg0ccThzO5uyAVYa9pZWZU=;
        b=XO6mNqFhPS4b+qFgh1cIrWtGzxH1VzdGGmsqSDj/hwD7I4wqG1hi4FsAr+eHTysnJV
         Oipfgfe4/wR8OldqikFAxOaNi/7YMlORqKMWBTP9ih8ayLIarazh5V/lyV0qOgLl3Zfu
         w1c3pbhZV9BWK36wii1fzJGIos6puEnfI6TFNbExteb/Wl8ljc6qAaL7uyz1h0YV8CTS
         FvYcgTYYS9CpVgFhel9JEnUQ1QrAS0Wje3iEodar7q9BNViBBO2SoV9ZZBOGOa+fEYgB
         H8CnjgS+mYIRb4ZzivGJSSftcmKXYjSY7YGJlz/XIvxqqTW3FW3QI7mJslM6NnQ+TylA
         fLeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JyP1IZzx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a05620a056500b007771d46fd50si3879871qkp.111.2023.11.09.23.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 23:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JyP1IZzx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1Lzf-0004Nc-6A; Fri, 10 Nov 2023 02:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1Lzc-0004Lq-6Q
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 02:31:52 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1LzW-00074o-VV
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 02:31:51 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so2944869a12.0
 for <qemu-arm@nongnu.org>; Thu, 09 Nov 2023 23:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699601505; x=1700206305; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZpzkuQ3EokkT80Y2bQ2BAl9ZQRy6Itv22qj1L2DbalU=;
 b=JyP1IZzxa0gvLOcfIwK20DxBM84jgLn9NRIwSMTXg/uZ5JNm2nOnrmMoiw4cEY99Bi
 4s8PN5cdAHLLNGVuYRIkNfcoWtZ2Sqrl1VLxNN49bkn3s5sbljWLj6hs6EqjgSuT7Vc7
 iBQgymVQN4v+454kmbDwpvb2cEw9p8AfZL41OmXrQEZp6hS5Ciy3tOWbm1hpPf7ZOArc
 tIScnDN9baW5jtYF8XRIZ3psXqVnnSOnLUOZj/HEVm6WvLR7CSqTdUG63uUcFc1M8zXU
 SJk5Gg2WkSXG6a7W2cyoXYX+1XiBQffTV2d+boNxq1Vqp4YxqAKPfUrJb3W5AuLmB0+e
 fotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699601505; x=1700206305;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZpzkuQ3EokkT80Y2bQ2BAl9ZQRy6Itv22qj1L2DbalU=;
 b=NMG2M3cAU1gRkvH/xE3dfEvK4EZQLm2fKJFC5KARawD+ylliHBFy4zKlNYnu15PFnc
 uMwoeX2w6ELDcbCkYF8sK5Wx0F2DxTIzWb9TuogLAmHuRcOv0+TjrcSPoxF9hat8P5xc
 1bHbVdxRmHANY9KFZyh419aQJEWH6tWGVek4DpaIBktDxf7/n5T98nciL5EIWOglCvzo
 biojmWDjy8IrHy0m2QIHFlrxLg3GOcrOSHygsvt3wupI5UG7mEBu96u762uhwNmKpB0t
 mQgtRKGW1isgFgD3/tlJ3t/OzrgKH7c3tlpMuEaGuIA4zwd1IvVi6VGb6Way8S3B0zPL
 n9vw==
X-Gm-Message-State: AOJu0YzN1Z0N9j5Rghph1pmeIAIbfmqUj22q0ABZgq12rdgDwhgBnVMM
 YdrqXKdLTZFQXZS6xlg0Z84IPQ==
X-Received: by 2002:a17:907:a0b:b0:9cf:35a7:9ea5 with SMTP id
 bb11-20020a1709070a0b00b009cf35a79ea5mr5018325ejc.74.1699601505123; 
 Thu, 09 Nov 2023 23:31:45 -0800 (PST)
Received: from [192.168.69.115] ([176.187.194.109])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170906d18a00b009a1a653770bsm3512222ejz.87.2023.11.09.23.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 23:31:44 -0800 (PST)
Message-ID: <464bf22d-e9c0-44bf-8d78-4e64eb57c8c1@linaro.org>
Date: Fri, 10 Nov 2023 08:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.3 v2 04/46] hw/pci: add pci_init_nic_devices(),
 pci_init_nic_in_slot()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20231106195352.301038-1-dwmw2@infradead.org>
 <20231106195352.301038-5-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106195352.301038-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 0+F81B0tm3t3

Hi David,

On 6/11/23 20:49, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The loop over nd_table[] to add PCI NICs is repeated in quite a few
> places. Add a helper function to do it.
> 
> Some platforms also try to instantiate a specific model in a specific
> slot, to match the real hardware. Add pci_init_nic_in_slot() for that
> purpose.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/pci/pci.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
>   include/hw/pci/pci.h |  4 +++-
>   2 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 885c04b6f5..5703266c0b 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1925,6 +1925,51 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>       return pci_dev;
>   }
>   
> +void pci_init_nic_devices(PCIBus *bus, const char *default_model)
> +{
> +    qemu_create_nic_bus_devices(&bus->qbus, TYPE_PCI_DEVICE, default_model,
> +                                "virtio", "virtio-net-pci");
> +}
> +
> +bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
> +                          const char *alias, const char *devaddr)
> +{
> +    NICInfo *nd = qemu_find_nic_info(model, true, alias);
> +    int dom, busnr, devfn;
> +    PCIDevice *pci_dev;
> +    unsigned slot;
> +    PCIBus *bus;
> +
> +    if (!nd) {
> +        return false;
> +    }
> +
> +    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
> +        error_report("Invalid PCI device address %s for device %s",
> +                     devaddr, model);
> +        exit(1);
> +    }
> +
> +    if (dom != 0) {
> +        error_report("No support for non-zero PCI domains");
> +        exit(1);
> +    }
> +
> +    devfn = PCI_DEVFN(slot, 0);
> +
> +    bus = pci_find_bus_nr(rootbus, busnr);
> +    if (!bus) {
> +        error_report("Invalid PCI device address %s for device %s",
> +                     devaddr, model);
> +        exit(1);
> +    }
> +
> +    pci_dev = pci_new(devfn, model);
> +    qdev_set_nic_properties(&pci_dev->qdev, nd);
> +    pci_realize_and_unref(pci_dev, bus, &error_fatal);

Could these functions be used with hotplug devices?

If so we should propagate the error, not make it fatal.

> +    return true;
> +}
> +
>   PCIDevice *pci_vga_init(PCIBus *bus)
>   {
>       vga_interface_created = true;
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index ea5aff118b..684d49bdcd 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -317,7 +317,9 @@ void pci_device_reset(PCIDevice *dev);
>   PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>                                  const char *default_model,
>                                  const char *default_devaddr);
> -
> +void pci_init_nic_devices(PCIBus *bus, const char *default_model);
> +bool pci_init_nic_in_slot(PCIBus *rootbus, const char *default_model,
> +                          const char *alias, const char *devaddr);
>   PCIDevice *pci_vga_init(PCIBus *bus);
>   
>   static inline PCIBus *pci_get_bus(const PCIDevice *dev)

