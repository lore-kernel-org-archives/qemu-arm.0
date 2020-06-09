Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp377484lfc;
        Tue, 9 Jun 2020 04:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVSAt/EeUuuW48vS1vGUIR5MflYokWarggD4HxdUpsJGWUAnBO01x54JR08L5AOsU/8Urv
X-Received: by 2002:a5b:c82:: with SMTP id i2mr5143057ybq.340.1591700771153;
        Tue, 09 Jun 2020 04:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591700771; cv=none;
        d=google.com; s=arc-20160816;
        b=0w7+uieV03XcNwi2hfQSH+OddQdvGmvpAwSmuLD2caOXQJt8AfBxCKlhD7cUBm3ANX
         +di8xJ4N3tGXYHQzAf06mb3oaqCtUrnY+4IqD2iBweQm4clPXm+OJV8Qj0m8AnNUzcqg
         fhVDkESrgyT1AsaAIp7NMhuj7oKjouOxyiOOPEB/CmSvAXGOCaxImoxRs9cs4IXSoACr
         K7OSxrXlnyUQKz7+IMLfneRwvUsnEyqHhItytiK3MVp88mvwL66PmXYNwp/YrE6r7hMP
         0WHIsujIePUxsv+1yjIeMpf5MOSi5QST9Rn0jUQKpoN4ULPu/Hrenrghynw/ViLcUgiT
         e/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ki/NH7KwE2iZfzrfj27y3fd4qwWI07EUloemfjIHR0Y=;
        b=oGF462JcywAn3Cj4mfJIEe1ryvnoGeG1YDZLNthbHb/zrW1IEX9fMonUUpmvn+3GDd
         Dlgune0+O2OgFBSw3kUPgshu9+B+2G0Ljt/sW85MZI4HPffoDUG1Csqppy2vHH3aKpzr
         dqVnDOpeBYPdBmC7Wqnqh/VuQsbOFys5SvteAk1l/+7oDy1fXw7FjsrQJ46l4BLf8VBG
         hZhFERT9QwsxhcMiLvusWNNdlHpe357yiiVJocOrIjUURWbO/YcOH68fkBNQ33SMAQD2
         Lsb99BwBTtPHbVu/5irxbik7G0FchWwEMB09FEkU4tYK3B2+d/v8u8FiWBUuT/rTmSMU
         ZVug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hEjwbb2Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si2206670ybk.106.2020.06.09.04.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hEjwbb2Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jic54-0007KW-Ir
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic3r-0006K2-Kn
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 07:04:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57996
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic3q-0000by-Pd
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 07:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ki/NH7KwE2iZfzrfj27y3fd4qwWI07EUloemfjIHR0Y=;
 b=hEjwbb2YOQOWaMHpJZgCRA1Zh1bkdkTpVgMFBS/q95ym48i0G2lOrt1emqouh4up3714dx
 F/lqTks4o3NgeUfxDEpsQdLrAYZPQADal7Z4su5lYWWnakdpriZ1jM5vkk4wfJ/fWk+EL9
 NctG00EqnsOMyuEFKbkZVMt4weuXiwU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-rQmBBnnHOXi82b65t2FcwA-1; Tue, 09 Jun 2020 07:04:52 -0400
X-MC-Unique: rQmBBnnHOXi82b65t2FcwA-1
Received: by mail-wm1-f69.google.com with SMTP id b65so599619wmb.5
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 04:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ki/NH7KwE2iZfzrfj27y3fd4qwWI07EUloemfjIHR0Y=;
 b=piS6Flny2SsKQiY1tYRYhfyshvAMhlT1+SEU+XNvTNRsBug/Nz3EGRJZRPyXWqZCKr
 YDJm+6UYl+8T8x+wd7opf0hZHq+XBjAdFn5WDEQW07y2H8hVOcCsrUWfCOzBT9v3OzIz
 j2eD4wMYMG+6Nxq/qL/RWzSDfKucr2qn934RYBMLxeMPew96Vwxmsy8rm4DFgyfJ8zuL
 ojF4Y2lC2EM7FXvSKhcGwppHxqmj0KWiOjO8vTqqEEKJtixZGxGG1aiRhhnDXI5FSTb1
 8fwd8ngHLxrIlMbf25P/A4xSb73jIfDMcrOcTTFL2uvJyBemE90NDY8K/mf/m1xxDHs+
 FL7Q==
X-Gm-Message-State: AOAM530Q1kQtj4rZLN5PnJPM4uvA4pNlW44PsOnl8dU4X83SBLjvc98f
 ElZNVevrPrPCcEF+F5yjzv5B9vN8PmYXWDU0dKPnuTtINvhhmXQDqzZmh7Y2Dn8//JVH2YgVhqu
 P5dPMdzUp3QyyMdM=
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3608968wru.427.1591700691531; 
 Tue, 09 Jun 2020 04:04:51 -0700 (PDT)
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3608951wru.427.1591700691283; 
 Tue, 09 Jun 2020 04:04:51 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id e5sm3132662wrw.19.2020.06.09.04.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:04:50 -0700 (PDT)
Subject: Re: [RFC PATCH 32/35] hw/riscv: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-33-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <78a05ce1-ce9a-431a-69df-77b0a8fcfce9@redhat.com>
Date: Tue, 9 Jun 2020 13:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-33-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vsuN9bRmSaxS

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/riscv/riscv_htif.c  | 4 ++++
>  hw/riscv/sifive_uart.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
> index ca87a5cf9f..bd080dbefb 100644
> --- a/hw/riscv/riscv_htif.c
> +++ b/hw/riscv/riscv_htif.c
> @@ -30,6 +30,7 @@
>  #include "hw/riscv/riscv_htif.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
> +#include "hw/qdev-deprecated.h"
>  
>  #define RISCV_DEBUG_HTIF 0
>  #define HTIF_DEBUG(fmt, ...)                                                   \
> @@ -238,6 +239,9 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
>      uint64_t fromhost_offset = fromhost_addr - base;
>  
>      HTIFState *s = g_malloc0(sizeof(HTIFState));
> +
> +    qdev_warn_deprecated_function_used();
> +
>      s->address_space = address_space;
>      s->main_mem = main_mem;
>      s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
> diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
> index 9350482662..1a5890d5f7 100644
> --- a/hw/riscv/sifive_uart.c
> +++ b/hw/riscv/sifive_uart.c
> @@ -25,6 +25,7 @@
>  #include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/riscv/sifive_uart.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /*
>   * Not yet implemented:
> @@ -183,6 +184,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
>      Chardev *chr, qemu_irq irq)
>  {
>      SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
> +
> +    qdev_warn_deprecated_function_used();
> +
>      s->irq = irq;
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
>      qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Not sure why this code was accepted, furthermore it should have been in
hw/char.

Paolo

