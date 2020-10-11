Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp498624lfa;
        Sun, 11 Oct 2020 13:48:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMbgAm8qTqTbbwqkQAvnG8v4nmzwtdtuMnvBmct3L5ZX8ClUuShDMK8iGux35gzCQ1Nrnc
X-Received: by 2002:a25:40c1:: with SMTP id n184mr28018964yba.255.1602449339290;
        Sun, 11 Oct 2020 13:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602449339; cv=none;
        d=google.com; s=arc-20160816;
        b=ydr0mKlFq5BNnpQEeK1F+mZNJ4erzhFFcyxYEF6+xLvgINA32bQeUIo4YGe7ayXO5i
         9TRBNiML+GVZj7xsAMoDR0704Sjxc7c7Y6h+AfM5ZELh4Zk0T468V00LeKEGwx/z7bH+
         jxnhIHWXUaZh54yAYGelmMQawnejuooLWCLdkE/BenVB+z1gEKsGFeav9nGt8ITMSppI
         1CnkghAbSC1wcUuzAus3Q30dSBAxes8VWXt6ZRTnKl9eCsow22L4/L00HzIlqoIzgeTu
         QjvPPLpk0knmGkfRSKxgFoy989Ej7FwUwlon3NXLKkIwoNYiss8I//FGYEWxf1mMVW9M
         qUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Zd7z4Zeb1k14kVm7EXjC3JkEyZMOY9MA5z0PafSZ+sc=;
        b=j5pFb+fkT5fuj8pZWH8rJHswJ8e4wS5+rVfEGboh1J+ePDhFcScVN8QjRoijWkqN8B
         Pa6MVH9jHZEssHcYNgmJkLyTgsSj3rWz/ifr/DMNOUxjpa1qrWJZeW+Ok1fGzgIm4MwZ
         BHn5E5TkBWE8+c/ccXKCfIdcN5SXal8Ad5gw7auX5lXJ2vQjoe/hZIraq7eP/WPQo9VM
         VpWfM99pyPXx3+8XAQexD+iC/GPi25lMbTbiCimlxvppmZKozFEiJWomkg/T29fCH8DU
         TdrHzO1PdIi3DPyPY6BP55ev6C4lhNg+0+lqvPTs2Mihs/iCzW1vwjiApb+ScFbIrfnM
         vBEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B3F6pgeO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x77si5493743ybe.61.2020.10.11.13.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 13:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B3F6pgeO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRiH3-0000Rg-52
	for alex.bennee@linaro.org; Sun, 11 Oct 2020 16:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRiET-0006ZL-Fq
 for qemu-arm@nongnu.org; Sun, 11 Oct 2020 16:46:18 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRiEQ-0006YA-Gj
 for qemu-arm@nongnu.org; Sun, 11 Oct 2020 16:46:17 -0400
Received: by mail-ej1-x641.google.com with SMTP id e22so20469128ejr.4
 for <qemu-arm@nongnu.org>; Sun, 11 Oct 2020 13:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zd7z4Zeb1k14kVm7EXjC3JkEyZMOY9MA5z0PafSZ+sc=;
 b=B3F6pgeO0Tn8KgvLLQ3yUAnVQ1ELii/Ue3tGgjguk8AYbFaAT1uG5HLzFF2hsMWdtB
 wSn7br303hLqFQzfp1OgLtnCUGUX/4OHAFgqZ2E4D5lO0JFP9++wh44/wQnHpnZrMNc6
 1N854ZV2ZCrvwlySz5Fx6NcqBa2IhrE5fspiZEhyyoMrJSy/KaFI1lbPJXoqKmeoO2fg
 EVFCbAR3AZ092bpKKyKZOoWCWu1gFtEpGvrfotQQuQyiv0y1JR1kxnq6pybym3hBu9Gj
 /F3vxOeb29N+W/eyrrDyxow1o9luvHmPyoSnrtA/RusMWLhpKfNmmjRlY2GBhd3T1sqk
 hRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zd7z4Zeb1k14kVm7EXjC3JkEyZMOY9MA5z0PafSZ+sc=;
 b=WG9mT2sKxfloebK+cKNMQeYcAXEoyjkTx04NCyn6GPmREgzctYI1lcKNJxwhFOjG/7
 r2RPHVisMChatXjbTKjKckZkoWWrcELXvRhwvDWtSSRuUJRex5m51Jh9vVxp7XO4/SJN
 fIznBPkqHklFh+yGTKoeIfDuuCV7bRU1xg8DryRldQx5fCBugaaS5hyZth4egOtsz0dZ
 gdQCfxDhg56bn5AgOyOpYcKU1QaQ4knwbDwe+LIOpdYBArPuuSh2RYn2PwaRS/Uz/6Hp
 ZFILtA3f2rWHoQxh8ogf3XTiFEWwlOnqiP/xp7Xi9pNpo43wLu9Wvxy9n2Wc8YybNhTx
 6EQg==
X-Gm-Message-State: AOAM533IhSN/XFWKISK8iQz4kAytxcxSqsJmHs7zXk1m15St705tvhxl
 yNGFFpNFvF20/EdmbfHWO4OfAjuC5kbMpZGMj6QZ2Q==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr24587356ejk.407.1602449172696; 
 Sun, 11 Oct 2020 13:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201011194918.3219195-1-f4bug@amsat.org>
 <20201011194918.3219195-4-f4bug@amsat.org>
In-Reply-To: <20201011194918.3219195-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Oct 2020 21:46:01 +0100
Message-ID: <CAFEAcA8hbkrTo0VpLtjFDtXc5CL7zK+X8ppX==P9_+q_V8-pAw@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/pci-host/versatile: Add WINDOW_COUNT definition to
 replace magic '3'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ouC4UZi9lGFL

On Sun, 11 Oct 2020 at 20:49, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Use self-explicit WINDOW_COUNT definition instead of a magic value.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/versatile.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
> index b4951023f4e..4d9565de4b1 100644
> --- a/hw/pci-host/versatile.c
> +++ b/hw/pci-host/versatile.c
> @@ -72,6 +72,8 @@ enum {
>      PCI_VPB_IRQMAP_FORCE_OK,
>  };
>
> +#define WINDOW_COUNT 3
> +
>  struct PCIVPBState {
>      PCIHostState parent_obj;
>
> @@ -86,18 +88,18 @@ struct PCIVPBState {
>       * The offsets into pci_mem_space are controlled by the imap registe=
rs.
>       */
>      MemoryRegion pci_io_window;
> -    MemoryRegion pci_mem_window[3];
> +    MemoryRegion pci_mem_window[WINDOW_COUNT];
>      PCIBus pci_bus;
>      PCIDevice pci_dev;
>
>      /* Constant for life of device: */
>      int realview;
> -    uint32_t mem_win_size[3];
> +    uint32_t mem_win_size[WINDOW_COUNT];
>      uint8_t irq_mapping_prop;
>
>      /* Variable state: */
> -    uint32_t imap[3];
> -    uint32_t smap[3];
> +    uint32_t imap[WINDOW_COUNT];
> +    uint32_t smap[WINDOW_COUNT];

Strictly speaking, this is conflating two separate
things which both happen to be equal to three.

The versatile/realview PCI controller has:
 * three memory windows in the system address space
   - those are represented by the pci_mem_window[] array
   - mem_win_size[] holds the size of each window
     (which is fixed but varies between the different
     implementations of this controller on different boards)
   - the device IMAPn registers allow the guest to
     configure the mapping from "a CPU access to an
     address in window n" to "a PCI address on the PCI bus,
     and our imap[] array holds those register values
 * three PCI BARs which represent memory windows on the
     PCI bus which bus-master PCI devices can use to
     write back into the system address space
   - the device SMAPn registers allow the guest to configure
     the mapping from "a bus-master access to an address
     on the PCI bus wherever the guest mapped BAR n"
     to "a system address", and the smap[] array holds
     those register values
There's no inherent reason why the number of PCI BARs
needs to be the same as the number of system address
space memory windows, so they shouldn't really share
the same constant.

(We don't actually implement the behaviour of the SMAP
registers and the BARs, because Linux always configures
the PCI controller to a 1:1 mapping of PCI space to
system address space. So we get away with just having
our implementation be "always do direct accesses".)

thanks
-- PMM
