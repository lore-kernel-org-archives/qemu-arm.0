Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp583643lfb;
        Wed, 20 May 2020 06:32:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfA7RLtxiSrXN2MAvJ/pOWHR2dGl3i+HMlZjzxbNkM6wKmUuhnzPGB+gXPbyJymj35JbnB
X-Received: by 2002:a05:620a:110d:: with SMTP id o13mr4694768qkk.212.1589981549879;
        Wed, 20 May 2020 06:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981549; cv=none;
        d=google.com; s=arc-20160816;
        b=P0tXYvsVrNmLbUgyARx+GYloH4iT9sSEo/Ozn+nFff59TtXzcw29wPKtTNnsINZuGQ
         4/FLJI7qnAG26kfIxIIt41saUv7AZ+SVFHic6gDttiOf22gbKPRPwLw0CfnM5KEc6F9D
         5oo00bGcFi1I3spu75k2FEydS5BvG3gMeQvYyV4Ls1zmiBGgbjfDuk8fUxxBO+z9PaWR
         rcPsudZ/2ZGgHKL7pWfmJLQzN5DMgjWrgANMHuBIitYgCVzyCjT8ewS3u3cH6ZT2KS1z
         anzd/6QJI0vi/2BlHQ44uy0iJz6kSEUwlG2Oy94drtjD0nI6y5H+aakC70RbHiV/d2pV
         9PWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wSGZ3gehLIq7FBpI9sreSKihRzYfMOkCI1HPmeTVMak=;
        b=keW7wORAP/I8OxSp49Z+BawzCxGYMyS7nFN7QTP8PZ2pdt+oKbY3tFWOMXpp2UYKGn
         TOMNDRLrfbqCV+LdP7DqevjhLmI7aySg5Isp24HtTbOcpzikH+s/jZixoQpqKMR0ChjY
         HO5QpWttHAdkH6ZJVEV4kAD01s3YZlXei0mLGzMDlCGRvrOYve2rlq0TB1ltRtBPprQ1
         gnIPm9qj3vySyXlLELw7vHiZtnojqQG6TneLGwBQfcXrf/UXaGm2oRXn5Yp2QXEYHvV9
         GvcWWIwHF3oE1+If6ZQUb2wpKAmvaNBXUYnRUwx6iUglGWl1qUfLXXY3PT57dN8DDbMU
         hsQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aZUc8stE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si1546159qvo.222.2020.05.20.06.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aZUc8stE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOph-0000Xs-6p
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOnO-0005j0-FO
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:30:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58578
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOnN-00022h-HV
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589981404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSGZ3gehLIq7FBpI9sreSKihRzYfMOkCI1HPmeTVMak=;
 b=aZUc8stEeD1oLUH3xQcN4S8yN2nv3H3vVLsFtUtJmDCP4A9hstDLH8+1ropYbUpvUmhcRY
 nfgiBBPD67HhL5Hki5UowxT6bzy5XK4zghXztisUfwqg1bxnian0nroqJmT0BHOvCPbnRO
 OqErppjs4aRjzDc1A0hbjY6SAKmkrTc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-7_XF29WDPJSo0FM5djXmig-1; Wed, 20 May 2020 09:30:00 -0400
X-MC-Unique: 7_XF29WDPJSo0FM5djXmig-1
Received: by mail-wm1-f72.google.com with SMTP id v23so909426wmj.0
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 06:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wSGZ3gehLIq7FBpI9sreSKihRzYfMOkCI1HPmeTVMak=;
 b=YbJMdFc0+ssu9U9CJC0YRu5ga9besHMXX3trhIJP7e+iqzvSGR+hui2QLK9LxHsh5v
 iKQ7hfbqFRNS8X/OIFDj25j6xgs/DhMmUIwxDT7WWa7BSEBaEHKoy1IBjHJZil9Giznt
 GlyC9JopLy6F9MCK7d3yEoezqGcdmxwuCBaRTi3Jtmnneta+Pd4g2La3Jg6sctySC2B1
 DfdmGMWlS3Rh8MNu0Dp9Sa8KlfnqZKo8dF3VSXZLCEijk5JMVsWu/nFZL28POE3z+hsI
 p6LAWFuHF4t6mSsrFzON/rw85V8vAIxD1kLBfNtole0zi7aMF79ORoJ26fqj/8ntHv/6
 +ZwA==
X-Gm-Message-State: AOAM533Hn0oRmWq8u8bFPkx7twelcvA9e+N5G5H15RrRE9Jejbp6IpbR
 WfBMG36GldIlCXjoSY+QAjm/hcEma8Kw+5Qmxr9ZZW1KZRj1DxPEFvdDtCfqxHrnGlK43emtQtS
 VszTM5W7Hfrpt3CE=
X-Received: by 2002:adf:9564:: with SMTP id 91mr4101558wrs.414.1589981399373; 
 Wed, 20 May 2020 06:29:59 -0700 (PDT)
X-Received: by 2002:adf:9564:: with SMTP id 91mr4101542wrs.414.1589981399182; 
 Wed, 20 May 2020 06:29:59 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id l13sm2828388wrm.55.2020.05.20.06.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:29:58 -0700 (PDT)
Subject: Re: [PATCH v3 15/22] microvm: make virtio irq base runtime
 configurable
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-16-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3e0451d7-5692-10b3-ac01-90128765643e@redhat.com>
Date: Wed, 20 May 2020 15:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520132003.9492-16-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wdQTio/fjFb1

On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> ---
>   include/hw/i386/microvm.h |  2 +-
>   hw/i386/microvm.c         | 11 +++++++----
>   2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index ba68d1f22bb3..2709306c4016 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -27,7 +27,6 @@
>   
>   /* Platform virtio definitions */
>   #define VIRTIO_MMIO_BASE      0xc0000000
> -#define VIRTIO_IRQ_BASE       5
>   #define VIRTIO_NUM_TRANSPORTS 8
>   #define VIRTIO_CMDLINE_MAXLEN 64
>   
> @@ -57,6 +56,7 @@ typedef struct {
>       bool auto_kernel_cmdline;
>   
>       /* Machine state */
> +    uint32_t virtio_irq_base;
>       bool kernel_cmdline_fixed;
>   } MicrovmMachineState;
>   
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index b8f0d3283758..ea4460714a99 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -121,10 +121,11 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>   
>       kvmclock_create();
>   
> +    mms->virtio_irq_base = 8;

Hmm you made it runtime configurable indeed, but you also changed it 
from 5 to 8. Worth a different patch, or at least mentioning in commit 
description.

>       for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
>           sysbus_create_simple("virtio-mmio",
>                                VIRTIO_MMIO_BASE + i * 512,
> -                             x86ms->gsi[VIRTIO_IRQ_BASE + i]);
> +                             x86ms->gsi[mms->virtio_irq_base + i]);
>       }
>   
>       /* Optional and legacy devices */
> @@ -246,7 +247,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>       x86ms->ioapic_as = &address_space_memory;
>   }
>   
> -static gchar *microvm_get_mmio_cmdline(gchar *name)
> +static gchar *microvm_get_mmio_cmdline(gchar *name, uint32_t virtio_irq_base)
>   {
>       gchar *cmdline;
>       gchar *separator;
> @@ -266,7 +267,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
>       ret = g_snprintf(cmdline, VIRTIO_CMDLINE_MAXLEN,
>                        " virtio_mmio.device=512@0x%lx:%ld",
>                        VIRTIO_MMIO_BASE + index * 512,
> -                     VIRTIO_IRQ_BASE + index);
> +                     virtio_irq_base + index);
>       if (ret < 0 || ret >= VIRTIO_CMDLINE_MAXLEN) {
>           g_free(cmdline);
>           return NULL;
> @@ -278,6 +279,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
>   static void microvm_fix_kernel_cmdline(MachineState *machine)
>   {
>       X86MachineState *x86ms = X86_MACHINE(machine);
> +    MicrovmMachineState *mms = MICROVM_MACHINE(machine);
>       BusState *bus;
>       BusChild *kid;
>       char *cmdline;
> @@ -301,7 +303,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>               BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
>   
>               if (!QTAILQ_EMPTY(&mmio_bus->children)) {
> -                gchar *mmio_cmdline = microvm_get_mmio_cmdline(mmio_bus->name);
> +                gchar *mmio_cmdline = microvm_get_mmio_cmdline
> +                    (mmio_bus->name, mms->virtio_irq_base);
>                   if (mmio_cmdline) {
>                       char *newcmd = g_strjoin(NULL, cmdline, mmio_cmdline, NULL);
>                       g_free(mmio_cmdline);
> 

