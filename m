Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1744728ejb;
        Mon, 24 Jul 2023 02:54:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG6fa3+8Dh/hh5cUPITY8emVROk//ya2NR/3cagkxDf8eC2JnjgDWqU3AJdvUpWMe4s/rGx
X-Received: by 2002:a0c:f306:0:b0:63d:526:5899 with SMTP id j6-20020a0cf306000000b0063d05265899mr1129366qvl.24.1690192455592;
        Mon, 24 Jul 2023 02:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690192455; cv=none;
        d=google.com; s=arc-20160816;
        b=S5Hp0LL1xnHSE6qU3G08iIxDwzkf556jLc1CWu9l0QKWVKTcSdM93NmmolN1j61Qsg
         lLql8psqTFLf9YXNMwQ3rzCHNdf/t9/T2PNgNpKMjw+2tDQXgaG5cOUHGOA5SuL31N5H
         8Bd6DKpMCGLljJIFJvcInHhLeyYz/kDiEZiThuH3kuVGDfj52iaauT4H2lo/DD++sX0w
         SXT/WtKHurh3ysvUjeZmc3r6Es0Ep99hN8Z8CYnog4F/m2mfzWaPLY2mUJRdJg2zs5Bm
         7ErgQ+z8eKaZ2P0a3WAgdy5NEUDunRkaOf1COtn7wKsphcEjgkn5u6Z+3HkhLW0OFNTC
         CKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W8BnD/WmjfxcZiGA/dUP3aM2hxnahbkcOcilHinU3gM=;
        fh=0M0TlrJ9fkZsL3e0wS7ddJxfdinhoqiktylMZ0kLP30=;
        b=Maf57Ghz85Adx39T8a2iGL6BzDFr5Cj/CcMO7oG+Ay2UEeRMaZvgkDyDZri93mIBBs
         PXNfyi6I6LgchH70jGlhs8K7y2bGvK0tvoLhbeEmjV6r0UFWy0IYdXDVJ+ZFG7zWBN5j
         D6cqgi8N8anyvpIXDf4lYm4rTKB9xvboI4pY6YWk3zCSEVag01ex4mYKXW9uAeGFe86M
         r048C2L9jL/tzmx/EngpcjdDuaVMQYGF/3TbstJdv8Fd2S/hjR8D60TSJj9I2rDXmNTi
         Z43iSt4+i0zL56hRqroul93KpTelUYd4aqGqFSnq9wRm7Md8UPnNQvvUc7jtyCXU0l2P
         IvOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KdcIa3LR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp3-20020a05621407e300b00635f54683b8si5063451qvb.516.2023.07.24.02.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 02:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KdcIa3LR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNsGL-000289-FX; Mon, 24 Jul 2023 05:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qNsGD-000261-5t
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 05:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qNsGB-0005LG-DP
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 05:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690192425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8BnD/WmjfxcZiGA/dUP3aM2hxnahbkcOcilHinU3gM=;
 b=KdcIa3LR4CJVBTxXodS/zNWfvoR0k+YIUfdSVN9TWEVFeSg0OYfzoOE5GQubndxVwk3AR7
 OOQg7kwmZEzkRkdj+tjjuehZrqvaSHGZJ0BOGCoP97/y7ByC7utAJ8xLDKvy7qRPRP0wfn
 l0V/BQtvPbEbKWMs6xOR8pimWXfouzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-BKbHl67PMKGquAIFIG3z4w-1; Mon, 24 Jul 2023 05:53:44 -0400
X-MC-Unique: BKbHl67PMKGquAIFIG3z4w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31455dcc30eso2634614f8f.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 02:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192422; x=1690797222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8BnD/WmjfxcZiGA/dUP3aM2hxnahbkcOcilHinU3gM=;
 b=LuSrKKMBV0CcIyY+ZRjUW290XqSAPc6N/kujeYdSuGu5CndeANdeNTuVXDE9+k00rA
 POcTcxFNTpRSK17YDnQShwzh8pHl+R/6kN6efaNqLjzOufVFool/ZoG53Q7Ui9QcnOLr
 3GND83DW8/kTjLEE+brP0vJxyPWfju683bVHqw5SWYwYG13suvDZRqHyQVxOSjGGZwYQ
 UM6iVodruT4ZZxRS9Qn3ajL9uO6aJh7vgkCLeJZ7TNbB/ofni4K+CW4/Zkb4/Rw8AO1n
 xGaBuJLjrIRO0p9yX89dfRiCmQkisx5AGoXnGKFIfkuO8FszmkNQkbybUdCDkxUFFp43
 0/XQ==
X-Gm-Message-State: ABy/qLYvQBbxV3Y0p8ub1d0xEf4VW4UsVUxtim1a0+H99j1haLWoQwBd
 IAgDF4Z75FxnsE0RrV4UD5JuRMAd0KnfD7KuF5BUXGD+cPMZm4s7zqWNT7JiBPvkmiCQCXfo8zT
 0T24lp00QeVc5
X-Received: by 2002:a5d:50c7:0:b0:315:99be:6fe4 with SMTP id
 f7-20020a5d50c7000000b0031599be6fe4mr7650813wrt.69.1690192422001; 
 Mon, 24 Jul 2023 02:53:42 -0700 (PDT)
X-Received: by 2002:a5d:50c7:0:b0:315:99be:6fe4 with SMTP id
 f7-20020a5d50c7000000b0031599be6fe4mr7650795wrt.69.1690192421663; 
 Mon, 24 Jul 2023 02:53:41 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-165.web.vodafone.de.
 [109.43.177.165]) by smtp.gmail.com with ESMTPSA id
 m12-20020adff38c000000b003145559a691sm12402548wro.41.2023.07.24.02.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 02:53:41 -0700 (PDT)
Message-ID: <81dd6b4c-200f-bb35-69fa-ed623eb7e6d1@redhat.com>
Date: Mon, 24 Jul 2023 11:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] kvm: Remove KVM_CREATE_IRQCHIP support assumption
To: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mtosatti@redhat.com, peter.maydell@linaro.org,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, dbarboza@ventanamicro.com,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230722062115.11950-2-ajones@ventanamicro.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230722062115.11950-2-ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: QW71OVtDxvMr

On 22/07/2023 08.21, Andrew Jones wrote:
> Since Linux commit 00f918f61c56 ("RISC-V: KVM: Skeletal in-kernel AIA
> irqchip support") checking KVM_CAP_IRQCHIP returns non-zero when the
> RISC-V platform has AIA. The cap indicates KVM supports at least one
> of the following ioctls:
> 
>    KVM_CREATE_IRQCHIP
>    KVM_IRQ_LINE
>    KVM_GET_IRQCHIP
>    KVM_SET_IRQCHIP
>    KVM_GET_LAPIC
>    KVM_SET_LAPIC
> 
> but the cap doesn't imply that KVM must support any of those ioctls
> in particular. However, QEMU was assuming the KVM_CREATE_IRQCHIP
> ioctl was supported. Stop making that assumption by introducing a
> KVM parameter that each architecture which supports KVM_CREATE_IRQCHIP
> sets. Adding parameters isn't awesome, but given how the
> KVM_CAP_IRQCHIP isn't very helpful on its own, we don't have a lot of
> options.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> 
> While this fixes booting guests on riscv KVM with AIA it's unlikely
> to get merged before the QEMU support for KVM AIA[1] lands, which
> would also fix the issue. I think this patch is still worth considering
> though since QEMU's assumption is wrong.
> 
> [1] https://lore.kernel.org/all/20230714084429.22349-1-yongxuan.wang@sifive.com/
> 
> 
>   accel/kvm/kvm-all.c    | 5 ++++-
>   include/sysemu/kvm.h   | 1 +
>   target/arm/kvm.c       | 3 +++
>   target/i386/kvm/kvm.c  | 2 ++
>   target/s390x/kvm/kvm.c | 3 +++
>   5 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 373d876c0580..0f5ff8630502 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -86,6 +86,7 @@ struct KVMParkedVcpu {
>   };
>   
>   KVMState *kvm_state;
> +bool kvm_has_create_irqchip;
>   bool kvm_kernel_irqchip;
>   bool kvm_split_irqchip;
>   bool kvm_async_interrupts_allowed;
> @@ -2377,8 +2378,10 @@ static void kvm_irqchip_create(KVMState *s)
>           if (s->kernel_irqchip_split == ON_OFF_AUTO_ON) {
>               error_report("Split IRQ chip mode not supported.");
>               exit(1);
> -        } else {
> +        } else if (kvm_has_create_irqchip) {
>               ret = kvm_vm_ioctl(s, KVM_CREATE_IRQCHIP);
> +        } else {
> +            return;
>           }
>       }
>       if (ret < 0) {

I think I'd do this differntly... at the beginning of the function, there is 
a check for kvm_check_extension(s, KVM_CAP_IRQCHIP) etc. ... I think you 
could now replace that check with a simple

	if (!kvm_has_create_irqchip) {
		return;
	}

The "kvm_vm_enable_cap(s, KVM_CAP_S390_IRQCHIP, 0)" of course has to be 
moved to the target/s390x/kvm/kvm.c file, too.

  Thomas


> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 115f0cca79d1..84b1bb3dc91e 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -32,6 +32,7 @@
>   #ifdef CONFIG_KVM_IS_POSSIBLE
>   
>   extern bool kvm_allowed;
> +extern bool kvm_has_create_irqchip;
>   extern bool kvm_kernel_irqchip;
>   extern bool kvm_split_irqchip;
>   extern bool kvm_async_interrupts_allowed;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b4c7654f4980..2fa87b495d68 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -250,6 +250,9 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
>   int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
>       int ret = 0;
> +
> +    kvm_has_create_irqchip = kvm_check_extension(s, KVM_CAP_IRQCHIP);
> +
>       /* For ARM interrupt delivery is always asynchronous,
>        * whether we are using an in-kernel VGIC or not.
>        */
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ebfaf3d24c79..6363e67f092d 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2771,6 +2771,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>           }
>       }
>   
> +    kvm_has_create_irqchip = kvm_check_extension(s, KVM_CAP_IRQCHIP);
> +
>       return 0;
>   }
>   
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index a9e5880349d9..c053304adf94 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -391,6 +391,9 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       }
>   
>       kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
> +
> +    kvm_has_create_irqchip = kvm_check_extension(s, KVM_CAP_S390_IRQCHIP);
> +
>       return 0;
>   }
>   

