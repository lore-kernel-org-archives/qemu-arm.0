Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1584810lft;
        Sun, 26 Jun 2022 03:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uVBSXq1toH8A14M9XyfeKsWxM3MY6dhqiP+mUFyRw6s39jbra19NcpQt4zHHtsAUdqOfWO
X-Received: by 2002:a05:6214:c21:b0:443:a2d2:a685 with SMTP id a1-20020a0562140c2100b00443a2d2a685mr5372138qvd.52.1656238506385;
        Sun, 26 Jun 2022 03:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656238506; cv=none;
        d=google.com; s=arc-20160816;
        b=pBDflci3311l8FFpXC3THJkDuZA1JpuMeRYP2JF1H3Z+dKpBK5+RdAfRUNRNaq+RO4
         XyZXAN7zSf5tsY4rxuqqk1UK9kL8vfL96mq42+Ynrt/t7YHEWJup6w41Sjl8y92Usvov
         iniseAd/QbPfhpO48WMACRNn33AQ94LALMp0lSD+VtVMGj25+TFo10DNXlVv1vvTruUk
         ZdUgGrz+OTMKIgLvsh3zVh/0nnSaa9ljiVhI5EjeGa5nchPL8heQ4vXexkDSTA27/NPE
         qZgk0hOYK5V/KLH71oo+R7nB5RBYeOLgpaczrzye8w0Q5CKg6+eF+ep/u/DJNSmgeK8F
         fPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:from
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WsOuRUWrFMgbOC/rj5gAOjpQXdTDCYE/fhrGK5BLKME=;
        b=Ln4dxO5HYNjA1ADdxH5sHHf561AqzcMNLoCWRYHOUsKQcwb9eqUg2XUmWLt9ZkR/Tw
         ndjd0hNEXXDpVXAMjzJlilzJoI7f8TSenKx4KhDaq++mYQ+6pn+8ja0rwDB2+AC6mt24
         XoenS5pGe+vNVEBTGJhnoPEBqeoPNMl3f1O0zBis1Au4W5dJxDEfLVjV4KIa6x3xF/Nr
         puyjsOmTAd5mjGB4neDa2EOaRyxpGYWI8baaloDE5zN/wiiCldTk0wmUfXIflN+UHnlz
         uQ1TCUQL/ZwvcUTpcjxzv3w+6gaMq3mg0lZLAysIEAL/RS2kTq6iuLWkWtdpLS1Yy3L3
         WVqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=sn+nWsae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189-20020a3705c6000000b006af0b903855si2095905qkf.40.2022.06.26.03.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Jun 2022 03:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=sn+nWsae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:41498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5PIH-0004PQ-QJ
	for alex.bennee@linaro.org; Sun, 26 Jun 2022 06:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5PI5-0004OT-G8; Sun, 26 Jun 2022 06:14:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5PI3-0000KN-VK; Sun, 26 Jun 2022 06:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WsOuRUWrFMgbOC/rj5gAOjpQXdTDCYE/fhrGK5BLKME=; b=sn+nWsae8vS2kKAitZS7q+7Ryd
 W2iHoztxHx36bPVazz6SgenSPQaja4Zoyy9Krnf23G8/UbMMcQMScTNXKTyDphmsYur/n4rD4IDwR
 fbX0edCyndQtzMgwyoD4MflBmkDiFK3EnMdTzM+2WmLe5k5IdwA9PREE11h+UGLMr2zHKI8ZGtTuH
 yQPc3r7+ZdAZKzvHC94cGWH9eUQlIGFJcmaUOjErZkYiYEV2nfbTaCjI1kJZ/nICdTuGF1q3HlkgT
 028kPQJ353PUzrqJL6M+Z9dgEMa+IalEAx7nuAb5F5mYKuvb2+CA9CyLep34vl8DMBPPyNDIptKji
 ly6CQBd0wlLkDnfaUzdYo46tGhxpe8FbNtf5IPdGtuu4DbG9r0altjLGraHcjtqb4+Q9Vqph7rhKc
 nljUxfBr2ggRqf7Kf8RGYqqmexcKnMDIoCP8e+l706s29Fx5a5jYj1RLLfE55bdICfOAtxEYvUPLE
 Zp8BEf8rDq+xdc94gLJ5i4Y+oUVfTjJvzTHzFGcPkG/Yafjr56Q+dMRIelnlRUrfQ6WfPz5hTv7MN
 Dvnpz61LosZb1SCNcg1VD7gIQDJCWGjZHkMl8ds7ZYlrAKstalW9yzeYBPzq5B77npIxnDSvWk+X/
 sg/9k7LfR6qUxzXLu3jc7EDC+w8udPuyHby6LdAsY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5PGb-0005AU-Nh; Sun, 26 Jun 2022 11:13:25 +0100
Message-ID: <2d47b22e-c865-8cc1-2f29-cfda57d07717@ilande.co.uk>
Date: Sun, 26 Jun 2022 11:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-48-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-48-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 47/54] lasips2: switch over from update_irq() function
 to PS2 device gpio
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SUGZP4E5fSy

On 24/06/2022 14:41, Mark Cave-Ayland wrote:

> Add a qdev gpio input in lasips2_init() by taking the existing lasips2_port_set_irq()
> function, updating it accordingly and then renaming to lasips2_set_irq(). Use these
> new qdev gpio inputs to wire up the PS2 keyboard and mouse devices.
> 
> At the same time set update_irq() and update_arg to NULL in ps2_kbd_init() and
> ps2_mouse_init() to ensure that any accidental attempt to use the legacy update_irq()
> function will cause a NULL pointer dereference.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>   hw/input/lasips2.c | 30 ++++++++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index bd72505411..e1a8a7e34b 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -237,9 +237,19 @@ static const MemoryRegionOps lasips2_reg_ops = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
> -static void lasips2_port_set_irq(void *opaque, int level)
> +static void lasips2_set_kbd_irq(void *opaque, int n, int level)
>   {
> -    LASIPS2Port *port = opaque;
> +    LASIPS2State *s = LASIPS2(opaque);
> +    LASIPS2Port *port = &s->kbd;
> +
> +    port->irq = level;
> +    lasips2_update_irq(port->parent);
> +}
> +
> +static void lasips2_set_mouse_irq(void *opaque, int n, int level)
> +{
> +    LASIPS2State *s = LASIPS2(opaque);
> +    LASIPS2Port *port = &s->mouse;
>   
>       port->irq = level;
>       lasips2_update_irq(port->parent);
> @@ -264,8 +274,14 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
>   
>       vmstate_register(NULL, s->base, &vmstate_lasips2, s);
>   
> -    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
> -    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
> +    s->kbd.dev = ps2_kbd_init(NULL, NULL);
> +    qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
> +                          qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
> +                                                 0));
> +    s->mouse.dev = ps2_mouse_init(NULL, NULL);
> +    qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
> +                          qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
> +                                                 0));
>   }
>   
>   static void lasips2_init(Object *obj)
> @@ -286,6 +302,12 @@ static void lasips2_init(Object *obj)
>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
>   
>       sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> +
> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);

I was just rebasing and testing part 2 of this series which flagged up that the 
rebase on part 1 had inadvertently pulled the old qdev_init_gpio_out() back in again 
on this patch. This line is no longer needed and should simply be removed.

I'll remove it locally and if everything still looks good after testing (including 
gitlab CI) then I shall queue this series to my qemu-sparc branch and send an MR.

> +    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_kbd_irq,
> +                            "ps2-kbd-input-irq", 1);
> +    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
> +                            "ps2-mouse-input-irq", 1);
>   }
>   
>   static Property lasips2_properties[] = {


ATB,

Mark.
