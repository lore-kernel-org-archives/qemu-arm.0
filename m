Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp40335ejm;
        Fri, 28 Apr 2023 10:50:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5eoqIJG9LJCwUA+WAqg23FY+mS0VAstXTTDdrAyi64tKMvZsrycoeuLhmURk1CuBBQ4DXh
X-Received: by 2002:a05:622a:14cc:b0:3b9:b6e3:c78e with SMTP id u12-20020a05622a14cc00b003b9b6e3c78emr10198274qtx.8.1682704239492;
        Fri, 28 Apr 2023 10:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682704239; cv=none;
        d=google.com; s=arc-20160816;
        b=E1PJ7N2Ucctj+4v4t+uCSgI/2JoH0EwdUFAksLBLrcMizhTHw5ZbfTRFwoJ5SEPfXv
         HbhxY8XNeqYObSHayuStMaZN7bILD2tLYc6iD6VUrEWIr8N65sluw096O5RBRveg0cCF
         R4Uc2n6ZsdOrwcHw74Dz55t+LN6WFPhdldTE1+zg1MxdkLJ1c9BxN9RCjkDmy73BLuRD
         k9jjSCZFC0/l17KdS+reVOPXJuRwT1pnHv+lZRc0SFr0IZCi0cfjs159bYhapZ9vRZoG
         PxM5fkFhDjBZLBFyTNFnJ0mQrdx+jL60hkKrNHx1HwoFeM+z9zLAV6CzoPtc1z470fO7
         Zhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=dFy8RI3865X52CBDIP3RqFy8Zpprq4rs5liYXkWuaDw=;
        b=IBvRTnfOHpn7R6Lr5fZzsQ8nA4wBdVy8z6DweV2+GYWQ7N4ncFDszv9fw8UhXQYLye
         CMeULkU/3UIJLP2bp54MhK0FgFRzN4khqq1245+vAwIjnQi+q67aNyUA/HvVmaKsdcwt
         iHTK6ThvXlwh/M0DZyh8+6ZHf/wQVWG+5hRNzRBJZMS9yrIG2RV5WjDLowg9AW8lOBMA
         b4HtsuMSS00mR+faCiOnCUULziTK4asubWzvbh3UjhJeZRrymuihbYIaV8HENLAJHdDt
         1SLBitH5rHFwaP/i16PcTX4a+cypE7Zwa+7mZ2skzHCHLglPwyn6GeWhNT8/1p1+2nN/
         lWeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MabR2pmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020ac857c4000000b003ef41f00c61si14133631qta.98.2023.04.28.10.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Apr 2023 10:50:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MabR2pmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1psSEY-0000Td-QO; Fri, 28 Apr 2023 13:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSEX-0000RV-AW
 for qemu-arm@nongnu.org; Fri, 28 Apr 2023 13:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSEU-0003FM-Hk
 for qemu-arm@nongnu.org; Fri, 28 Apr 2023 13:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704209;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dFy8RI3865X52CBDIP3RqFy8Zpprq4rs5liYXkWuaDw=;
 b=MabR2pmiAuTOpIDeemWISEZZXzdFFhjBm8La5VVFlyWIjQVMu+3rWfrUiw0svRCQRkwyv7
 g8QMKbHcQTWClvDXIGI6JxjAI6WFIHz0YCwSU3sAec/e4do5TUkjAGt3zYcq4eFjXPTaRv
 JFPf+jukXpJUq18CGXWs8gP+f8KKllc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-iCvbd7sdMKm2BR6kFi5HpA-1; Fri, 28 Apr 2023 13:50:07 -0400
X-MC-Unique: iCvbd7sdMKm2BR6kFi5HpA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so10717f8f.1
 for <qemu-arm@nongnu.org>; Fri, 28 Apr 2023 10:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704206; x=1685296206;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFy8RI3865X52CBDIP3RqFy8Zpprq4rs5liYXkWuaDw=;
 b=EkLOdrqmIsPMvOMqwfLdMcSqTRmpeasFqUMvTARA9K3qFp2W+KJhf8ZO2IG/dSKdEY
 KjOVOAnElcxN6wUvWZGgnlnTuTxXijJzTT7BQ0VTYWMYtrv7NNmVsgl+tcesXFUfok4N
 yhJnsxF0qDvdZhZAOFCcqCqDROHTJoo3FPz60KKh51XmtsGI0GDXAvyFApVYtBUyybRS
 FZIcwfc94HW6kUK8uMtrkvS2ed7s/bKWVVHBKEbIiVzer2oN9CgbpeqR9snkNVu+05qD
 O+TMg298KFbC1wfgf5CKc/3K7Xb7MsG4UPlAzU8p3PlwMEgeGR46U7WlZ/oxn44QF+rT
 PW2g==
X-Gm-Message-State: AC+VfDxLQ8+UaY16/c9GnD6IRiNOAToy0LxQsDy4k7Sz+zPTeGnijb0s
 K0N4hneT13TsZmOdEGJxD/oHu2manS7xZBDZ+LCKql4cJnWNFm3XbMn2htlxPzvCzQ3r4iS+jqF
 LjdtO0DXhbOw7
X-Received: by 2002:adf:f4cd:0:b0:2f5:b1aa:679c with SMTP id
 h13-20020adff4cd000000b002f5b1aa679cmr4615536wrp.39.1682704206684; 
 Fri, 28 Apr 2023 10:50:06 -0700 (PDT)
X-Received: by 2002:adf:f4cd:0:b0:2f5:b1aa:679c with SMTP id
 h13-20020adff4cd000000b002f5b1aa679cmr4615516wrp.39.1682704206287; 
 Fri, 28 Apr 2023 10:50:06 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003f3270ddbd8sm2503636wmg.37.2023.04.28.10.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:50:05 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org,
 kvm@vger.kernel.org,  Eric Auger <eauger@redhat.com>,  Gavin Shan
 <gshan@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>,  Andrea Bolognani
 <abologna@redhat.com>
Subject: Re: [PATCH v7 1/1] arm/kvm: add support for MTE
In-Reply-To: <20230428095533.21747-2-cohuck@redhat.com> (Cornelia Huck's
 message of "Fri, 28 Apr 2023 11:55:33 +0200")
References: <20230428095533.21747-1-cohuck@redhat.com>
 <20230428095533.21747-2-cohuck@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:50:04 +0200
Message-ID: <87sfcj99rn.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UoYvVTDmVRhp

Cornelia Huck <cohuck@redhat.com> wrote:
> Extend the 'mte' property for the virt machine to cover KVM as
> well. For KVM, we don't allocate tag memory, but instead enable the
> capability.
>
> If MTE has been enabled, we need to disable migration,

And I was wondering why I was cc'd in a patch that talks about arm, cpus
and architectures O:-)

> as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c        | 69 +++++++++++++++++++++++++-------------------
>  target/arm/cpu.c     |  9 +++---
>  target/arm/cpu.h     |  4 +++
>  target/arm/kvm.c     | 35 ++++++++++++++++++++++
>  target/arm/kvm64.c   |  5 ++++
>  target/arm/kvm_arm.h | 19 ++++++++++++
>  6 files changed, 107 insertions(+), 34 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a89d699f0b76..544a6c5bec8f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2146,7 +2146,7 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>  
> -    if (vms->mte && (kvm_enabled() || hvf_enabled())) {
> +    if (vms->mte && hvf_enabled()) {
>          error_report("mach-virt: %s does not support providing "
>                       "MTE to the guest CPU",
>                       current_accel_name());
> @@ -2216,39 +2216,48 @@ static void machvirt_init(MachineState *machine)
>          }
>  
>          if (vms->mte) {
> -            /* Create the memory region only once, but link to all cpus. */
> -            if (!tag_sysmem) {
> -                /*
> -                 * The property exists only if MemTag is supported.
> -                 * If it is, we must allocate the ram to back that up.
> -                 */
> -                if (!object_property_find(cpuobj, "tag-memory")) {
> -                    error_report("MTE requested, but not supported "
> -                                 "by the guest CPU");
> -                    exit(1);
> +            if (tcg_enabled()) {
> +                /* Create the memory region only once, but link to all cpus. */
> +                if (!tag_sysmem) {
> +                    /*
> +                     * The property exists only if MemTag is supported.
> +                     * If it is, we must allocate the ram to back that up.
> +                     */
> +                    if (!object_property_find(cpuobj, "tag-memory")) {
> +                        error_report("MTE requested, but not supported "
> +                                     "by the guest CPU");
> +                        exit(1);
> +                    }
> +
> +                    tag_sysmem = g_new(MemoryRegion, 1);
> +                    memory_region_init(tag_sysmem, OBJECT(machine),
> +                                       "tag-memory", UINT64_MAX / 32);
> +
> +                    if (vms->secure) {
> +                        secure_tag_sysmem = g_new(MemoryRegion, 1);
> +                        memory_region_init(secure_tag_sysmem, OBJECT(machine),
> +                                           "secure-tag-memory",
> +                                           UINT64_MAX / 32);
> +
> +                        /* As with ram, secure-tag takes precedence over tag. */
> +                        memory_region_add_subregion_overlap(secure_tag_sysmem,
> +                                                            0, tag_sysmem, -1);
> +                    }
>                  }

Pardon my ignorance here, but to try to help with migration.  How is
this mte tag stored?
- 1 array of 8bits per page of memory
- 1 array of 64bits per page of memory
- whatever

Lets asume that it is 1 byte per page. For the explanation it don't
matter, only matters that it is an array of things that are one for each
page.

What I arrived for migration the 1st time that I looked at this problem
is that you can "abuse" multifd and call it a day.

In multifd propper you just send in each page:

- 1 array of page addresses
- 1 array of pages that correspond to the previous addresses

So my suggestion is just to send another array:

- 1 array of page addresses
- 1 array of page tags that correspond to the previous one
- 1 array of pages that correspond to the previous addresses

You put compatiblity marks here and there checking that you are using
mte (and the same version) in both sides and you call that a day.

Notice that this requires the series (still not upstream but already on
the list) that move the zero page detection to the multifd thread,
because I am assuming that zero pages also have tags (yes, it was not a
very impressive guess).

What do you think?  Does this work for you?
What I would need for kvm/tcg would be some way of doing:

- get_the_mte_tag_of_page(page_id)
- set_the_mte_tag_of_page(page_id)

Now you need to tell me if I should do this for each page, or use some
kind of scatter-gather function that allows me to receive the mte tags
from an array of pages.

You could pass this information when we are searching for dirty pages,
but it is going to be complicated doing that (basically we only pass the
dirty page id, nothing else).

Doing this in normal precopy can also be done, but it would be an
exercise in masochism.

Another question, if you are using MTE, all pages have MTE, right?
Or there are other exceptions?

Sorry for my ignorance on this matter.

Later, Juan.

