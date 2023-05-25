Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp328900ejb;
        Thu, 25 May 2023 03:16:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44412UILlWVCznlonNX1IENL1dsNU0tdtlZLGt9a9nRYiuBI+yEYwKotxlFAYjJhAvKQHc
X-Received: by 2002:a05:6214:ca6:b0:625:7c0b:4640 with SMTP id s6-20020a0562140ca600b006257c0b4640mr801403qvs.22.1685009778325;
        Thu, 25 May 2023 03:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685009778; cv=none;
        d=google.com; s=arc-20160816;
        b=PXaNcbfjHZVHfxYxwiPOkLHf82Q2f2EgfMkfooWjGpTcCZWfodh7P70v94h1ooI31y
         X2W9h6gF30i0BDtZ925GhTsskFHOQ90oBbnXrR2o46cuWBtI8VTQbSK2n9q4PUzQlu2I
         WGRKCKEf7sXYjwWvZZYIcwmNIpiU/aOM2jIB5/1JocBFCS2XJY3N+ac6p45UJtwpt2HW
         m1nvmJdCKVx/XkknmNe8MyNPxhjC/5iafSpWpgG2AWRkCf+75Gw57Jle7dW5OtfthQnD
         0oXTU4xf1u6T6nXJEYfdlJEz06wX3ZUqin0I+ly5SfUaPAXsaPUY4iJALM+N5fK9A58q
         LwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W/kc5TwXbfL7YxMsakEEY5OHPKQY36Pjs54a1ei2hJM=;
        b=AaBLi/kg4vuFelR8OuYUvwqItdc7fCMcW/JFvhIfuh191knrT9RJgr5YZtOOiWwkQW
         2m8a/HMwWRyvDspAglAgxsuUnVwZGr71W8JmSXZal+q8ts1uynhj4ykBuoQ9pe7GQ8el
         7HUZQpMgiFQT494D2uo8XqZZZ8ZTFIWYywDVNpOTQ5L7XA8icKGD7z70z7/FJG/m3UEH
         fsbQo1RIc+/bZSYvEF96V90aq3u2yrGVag7S8UR5xpQBcVLYuaHFY4GomVk3jLPF4kvv
         uC33wNKJ8OHPoCLgaFeeuTP4+tNO22vksrsDxuYf2JTdP6bTr37zNRkiMfI2Llp5xBec
         8+Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H0P4RNxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs4-20020a056214226400b006211ad6e707si334440qvb.532.2023.05.25.03.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 03:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H0P4RNxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q280N-0003V2-4w; Thu, 25 May 2023 06:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q280L-0003Sy-TA
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:15:33 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q280J-0005TK-4U
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:15:33 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-510d92184faso4044202a12.1
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 03:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685009711; x=1687601711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W/kc5TwXbfL7YxMsakEEY5OHPKQY36Pjs54a1ei2hJM=;
 b=H0P4RNxBitBcq5y3MbDQ5xDQ0ixDbxb9p4AED9Tt8zCVLn5BoU8y/gCXKmtlc0t8yV
 gbQCdQJ0x7b4et/7uf9Auwp/mzH6R8kB+R0dFPbX+p1eEA1a6rYs3BoE8orZwWrRokt/
 64VgzvndlRWlB/Av7ENI24LpgTQMuqvu076mZZaUw6i/dHpMUOJJxyYOii7EdNFEsQtW
 Y9ak4I+JUukVrItZ9LOwadHXQJ+Zq91teW6gOL//telceSPEJYOoCpTNY3LXXRHe7lg8
 dvsv34L+b2ot04m98DTh3DK+EYCOR0CLoJVhM+ofwLnLXHSvDIitom14pDgq7aaWiemY
 iqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685009711; x=1687601711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/kc5TwXbfL7YxMsakEEY5OHPKQY36Pjs54a1ei2hJM=;
 b=Ak11lFZ1tw6V+urmbuv3sPp9e9nI+sfpXvXKhDrpFFZqGQGP63UQNX3aCxLXTdevpq
 k6obD0SVc24tLSCgIfxJX+ZQsu0c27rft9Xare1mxrtWjM3ji0k7nBlQyyLsAowcer62
 ZkiJP/qxeiw9lGVxfzNV0nictV1wJj2tjbHZ/to1kSAsGXygMfzzCshRL1ffQB/Twjj7
 nthlpW3LdgwVAfF5RBzTF+ghJJSl0Tb2RrpKJJhz6B1M3VDzzIf7weUqsP6WeOlW+vF1
 iIx7NGK6A/3FppyAqzumHTo40wPbK9QRXpVpxFNJKa/8en5N9fgDCB3EH+VFrppXtldu
 i1bg==
X-Gm-Message-State: AC+VfDwQwcjnGTSh6Ic4rpQ4wJ18YCA4Jn/JTfqsAgCFDsUPZKQwdLBY
 NRJvo2l3nsA1b1Q5TV459j2OTY41V8rv14rL7XNxrzm9Ii5w+kbu
X-Received: by 2002:a17:907:940f:b0:973:84af:66e5 with SMTP id
 dk15-20020a170907940f00b0097384af66e5mr951023ejc.40.1685009711402; Thu, 25
 May 2023 03:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
 <20230524111413.833912-3-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230524111413.833912-3-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 11:15:00 +0100
Message-ID: <CAFEAcA8_f9Vo+i2PfRvMC2+5=omNi+7Z=0K=oRutgsuvNdOUDA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] Add Bochs to list of vga_interfaces
To: marcin.juszkiewicz@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: l3dL/yT9awiX

On Wed, 24 May 2023 at 12:14, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> arm/sbsa-ref uses Bochs-display graphics card and without it being
> present in vga_interfaces "-vga none" argument handling cannot be added.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/pci/pci.c            | 2 ++
>  include/sysemu/sysemu.h | 2 +-
>  softmmu/vl.c            | 6 ++++++
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 1cc7c89036..edac76ea15 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1937,6 +1937,8 @@ PCIDevice *pci_vga_init(PCIBus *bus)
>          return pci_create_simple(bus, -1, "vmware-svga");
>      case VGA_VIRTIO:
>          return pci_create_simple(bus, -1, "virtio-vga");
> +    case VGA_BOCHS:
> +        return pci_create_simple(bus, -1, "bochs-display");
>      case VGA_NONE:
>      default: /* Other non-PCI types. Checking for unsupported types is already
>                  done in vl.c. */
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 25be2a692e..9713a1b470 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -29,7 +29,7 @@ extern int autostart;
>
>  typedef enum {
>      VGA_NONE, VGA_STD, VGA_CIRRUS, VGA_VMWARE, VGA_XENFB, VGA_QXL,
> -    VGA_TCX, VGA_CG3, VGA_DEVICE, VGA_VIRTIO,
> +    VGA_TCX, VGA_CG3, VGA_DEVICE, VGA_VIRTIO, VGA_BOCHS,
>      VGA_TYPE_MAX,
>  } VGAInterfaceType;

Is it really right that we want to add more support to this
legacy-command-line-option interface? We don't list every
graphics device we support here...

-- PMM
