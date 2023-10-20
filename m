Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1211459ejb;
        Fri, 20 Oct 2023 06:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGsNcR60n7dZc43sdyMCVtEkf5HM229rxSH6+rGTmika9OuVRKOEOrZTJla1H8sG8AIXYm
X-Received: by 2002:a81:6cd2:0:b0:5a8:874:bb3a with SMTP id h201-20020a816cd2000000b005a80874bb3amr1895051ywc.31.1697807507619;
        Fri, 20 Oct 2023 06:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807507; cv=none;
        d=google.com; s=arc-20160816;
        b=hG5m4o8TDzc8bIYfusnUz/Ve4unCgNl7YXqtQ+sRGorg7JxKsLKlzFfAfxEX65WCbX
         +9BnUy+fKhrXP+cBoC+WRpSpFV03UoRH11xAQy4oJcVQ9VaCnTrPu98/Z1J1WZ+a2Ebu
         Y835Pn7pAf+vZqKsLA9l1t6D+LWHl+aBQnzhM1D9J8K3uGv8I0IHXcB4npHFi+eap60w
         Zsxe3/O6q71/9jt/zx72QOIaUX/SjzbT+2O747oppPzxV/hb3zHoMCOwmzks6B+nt0CZ
         PtXrNBfvqRUrbkA4m/W1TMFUldOfau0iTvebCegezCBNeMUgJepdwOMPfrAn9pL9bE+I
         IBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=GOysEka5jNdq7RZYbyF2klgLR8lfI6J7Iosb3cg8rng=;
        fh=aaqPnSD6tstDYOi4iE3lVjgOjq/ySCPz+jgy9Piw17A=;
        b=C8yvoMIx8ukeqfxGmwwyTkv99MeqOmzc7y/RjDqRdejkZvlwIItAfl+KhAOuKRtQAV
         B7wG+Pt6XYAiac0yYDLfvZZK0JcpFR2UuZNMgCZinzbIyK5TW8alaYTvh6pD9Cafq+Zl
         c6FDqoESTegeNmRFOqaj+PmDjeUAS6RRv7mdsf75mLOlzcECfhTi3NR9WfjLyotM/jiW
         KaBoD+dfk2GdOjZPF7MlGPOMNFSyP20IsweVdSiV7DyJJ3xSdcacHyndvdQwcP8n97w5
         +INUj2XihOtYC9V4aQY5OXV+vso7YYtAtCx0b5MoypcjEGiN+cM6Ba8X81mMdP4flbXO
         DDnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vo0NzvVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23-20020a67e8d7000000b00450a5ca7e67si146985vsn.736.2023.10.20.06.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vo0NzvVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpHl-0003CN-MK; Fri, 20 Oct 2023 09:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtpHk-0003C4-Mz
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtpHj-0007ZC-3x
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697807486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GOysEka5jNdq7RZYbyF2klgLR8lfI6J7Iosb3cg8rng=;
 b=Vo0NzvVpG/bkJPYbc9tgc7SgJf9A1sb4cLxcaiO8TxnQB5+2MXI7H+DKGKzeFwgnNYBZ0G
 biKCM853jpG+h4PS2PfLkA5uLDdq9clmaclYnTcHbJlvYnWpRhBNBVpRQxXpmW8FPSkbwr
 TN2Rh059cQ/gG1H0MvccsF5dvDdcQjI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-i26S_IwDNVGH0826c3VARQ-1; Fri, 20 Oct 2023 09:11:25 -0400
X-MC-Unique: i26S_IwDNVGH0826c3VARQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-41cba27f8b2so7856591cf.3
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 06:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807484; x=1698412284;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOysEka5jNdq7RZYbyF2klgLR8lfI6J7Iosb3cg8rng=;
 b=gYASEJjvpKH7Snet1XBpdrjWRzCvyf2r+Yq5oQTR6IWZ85FlAThHwHA2FOamT/Pvvj
 offsJJ67N5nwiW99vwos3vK1+MGjWwgp7ULIdzyfKJF7Ir9eaTtbDa48VfZ1O6OnrgZQ
 /lDBFkBY+6ftzat4SiE0ZPONIRkIArs55FCEgH0AWZT17rzL2hZx7ThwGNwEcIFKmWBV
 PG7pmVYyRdbJd04n5WPVUIa9BRTVYAS1whx6BFkuIKdkYiAUG7Y1O/fhFraI9AdiFjxK
 ch1bwU/S9CssNhlzYwgCLZGxrifiPCExCVD5QhEQ2+A0clmKeFhlfGs5gnURvfXwpJpz
 tYDQ==
X-Gm-Message-State: AOJu0YyAMq19VFrfW0x+eErRgnvkJME5ltd1hhKBp+Qrt4kw9h40QVFj
 4KjhZX80+QiWlyF559tAoWW4yh6k/HAyunWK3Mr0stCUG5K62kZHw62EYWvq7KlurkqJ2fmx6PI
 UeXASd1JU8CBv
X-Received: by 2002:ac8:5886:0:b0:412:2dd3:e108 with SMTP id
 t6-20020ac85886000000b004122dd3e108mr1364517qta.9.1697807484481; 
 Fri, 20 Oct 2023 06:11:24 -0700 (PDT)
X-Received: by 2002:ac8:5886:0:b0:412:2dd3:e108 with SMTP id
 t6-20020ac85886000000b004122dd3e108mr1364470qta.9.1697807484042; 
 Fri, 20 Oct 2023 06:11:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 g7-20020ac87d07000000b00417dd1dd0adsm577674qtb.87.2023.10.20.06.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 06:11:23 -0700 (PDT)
Message-ID: <feadc57e-1587-4daa-9f2c-d8eba79125dd@redhat.com>
Date: Fri, 20 Oct 2023 15:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] migration: Use vmstate_register_any() for
 ipmi-bt*
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
 Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Leonardo Bras <leobras@redhat.com>,
 John Snow <jsnow@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Stefan Weil
 <sw@weilnetz.de>, Stefan Berger <stefanb@linux.ibm.com>
References: <20231020090731.28701-1-quintela@redhat.com>
 <20231020090731.28701-5-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231020090731.28701-5-quintela@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8xOHBT6HxN2D

On 20/10/2023 11.07, Juan Quintela wrote:
> Otherwise device-introspection-test fails.
> 
> $ ./tests/qtest/device-introspect-test
> ...
> Broken pipe
> ../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted (core dumped)
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   hw/ipmi/ipmi_bmc_extern.c | 2 +-
>   hw/ipmi/ipmi_bmc_sim.c    | 2 +-
>   hw/ipmi/isa_ipmi_bt.c     | 2 +-
>   hw/ipmi/isa_ipmi_kcs.c    | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
> index e232d35ba2..324a2c8835 100644
> --- a/hw/ipmi/ipmi_bmc_extern.c
> +++ b/hw/ipmi/ipmi_bmc_extern.c
> @@ -504,7 +504,7 @@ static void ipmi_bmc_extern_init(Object *obj)
>       IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(obj);
>   
>       ibe->extern_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, extern_timeout, ibe);
> -    vmstate_register(NULL, 0, &vmstate_ipmi_bmc_extern, ibe);
> +    vmstate_register_any(NULL, &vmstate_ipmi_bmc_extern, ibe);
>   }

This is an instance_init() function. We shouldn't register vmstate (and 
timer) here, but do it in the realize() function instead.

>   
>   static void ipmi_bmc_extern_finalize(Object *obj)
> diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
> index 905e091094..404db5d5bc 100644
> --- a/hw/ipmi/ipmi_bmc_sim.c
> +++ b/hw/ipmi/ipmi_bmc_sim.c
> @@ -2188,7 +2188,7 @@ static void ipmi_sim_realize(DeviceState *dev, Error **errp)
>   
>       ibs->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ipmi_timeout, ibs);
>   
> -    vmstate_register(NULL, 0, &vmstate_ipmi_sim, ibs);
> +    vmstate_register_any(NULL, &vmstate_ipmi_sim, ibs);
>   }

Now here it's been done in the realize() function already ... did this 
really cause trouble for you?
Anyway, I wonder why the first parameter is NULL here ... shouldn't this 
point to dev instead?

>   static Property ipmi_sim_properties[] = {
> diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
> index a83e7243d6..afb76b548a 100644
> --- a/hw/ipmi/isa_ipmi_bt.c
> +++ b/hw/ipmi/isa_ipmi_bt.c
> @@ -125,7 +125,7 @@ static void isa_ipmi_bt_init(Object *obj)
>   
>       ipmi_bmc_find_and_link(obj, (Object **) &iib->bt.bmc);
>   
> -    vmstate_register(NULL, 0, &vmstate_ISAIPMIBTDevice, iib);
> +    vmstate_register_any(NULL, &vmstate_ISAIPMIBTDevice, iib);
>   }

It's an instance_init() function again. This should be done in the realize() 
instead.

>   static void *isa_ipmi_bt_get_backend_data(IPMIInterface *ii)
> diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
> index b2ed70b9da..5ab63b2fcf 100644
> --- a/hw/ipmi/isa_ipmi_kcs.c
> +++ b/hw/ipmi/isa_ipmi_kcs.c
> @@ -132,7 +132,7 @@ static void isa_ipmi_kcs_init(Object *obj)
>        * IPMI device, so receive it, but transmit a different
>        * version.
>        */
> -    vmstate_register(NULL, 0, &vmstate_ISAIPMIKCSDevice, iik);
> +    vmstate_register_any(NULL, &vmstate_ISAIPMIKCSDevice, iik);
>   }

Dito, this should be moved to realize().

  Thomas

