Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2164169ejb;
        Tue, 30 May 2023 06:08:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yBdfSnjXVnpdQdgW3k7D94lL968hfuDZaTN9Mr4/FoAIG37uuu+hLNosZ9FnDN5xy4DcM
X-Received: by 2002:ac8:59d0:0:b0:3f3:9395:671 with SMTP id f16-20020ac859d0000000b003f393950671mr9704510qtf.0.1685452083296;
        Tue, 30 May 2023 06:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685452083; cv=none;
        d=google.com; s=arc-20160816;
        b=NVdMdtCpbhLySXFf7amE6qKbvOtBOfnODJCD6L8ktnVXPMXuRbcPQc9BRbaqw6aEBf
         Evgbb2L3+4q2mC7/Vr1v8JqbaSTl4TCamX2OPDIMCQAk+NSDKqeH+xPAZvxhPkID9KLm
         MoR+46jq4WhLYfDKl2n7fWTftLWNjwRWJM54vWjJsgFcjDViZ2SiI8BmF62wr3EARx3l
         A630hKqAYaqfswvZZQKRuGlo6zDwFeSISo0G/D1eu9cP0ZCoxfaF+HPFY4gUfn2156jP
         9ntrW7EIo5BU/vo9vg0LBTmfJ86/AmvQFlL1IdZY+hlEZS2hwGkYWGLcpKPuX4B2buAk
         ZLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=krcwGUvxn03gQCAlqftsgQo0yygpHvxoKgBhg4ggaz8=;
        b=KwbO7u+xKwc8A/5YyeNLszK664J0ivZLto5aur5UEmSqYDGSFi5ut2IB3/08TDosId
         6OjHXua9bH2V2WDhl9sJkybN8mekq2S13Fd8rjVdHyjIm0LdWkkO+RhJ6mxC8Z63p1Po
         oSRgUGBRkZA/PJgfhBL584BBAurYyRTWQBWqhOEDu6MbKEdeoaP/8gzyunCZQdVDY92G
         an8tutzdwvx200VD1iF2Ae/g4KDTAxrCqi/MLPm4clZ6DNODp3sIkAK4AHFkjMHN2YFT
         T8O9YRjKdu/gtmALXsyoFWTmnjXsX7cXbMaY4oe5di905BwoHf9pEf3qwpb+4yKCj6Yt
         e4/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkBzI+8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020a05622a058f00b003f6ac42f745si6651787qtb.126.2023.05.30.06.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkBzI+8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3z4m-0000O1-Bg; Tue, 30 May 2023 09:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q3z4k-0000El-9w
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q3z4h-0002zm-C5
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685452062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=krcwGUvxn03gQCAlqftsgQo0yygpHvxoKgBhg4ggaz8=;
 b=JkBzI+8u7jamCB+3SnG0ijmR/HzJziAJDN7Du+jRwtJaPmqGuOSoczRwdG5oV+K1XbLeJN
 LfTXyP3LYGGr6lg+Y9843+KxtwrhgY2mTrBY+xx0oULrunQZcJXoBywjub+hYCH9Zx7Bak
 N3SLZCigOX+EU/y9BGjMNa1Tbd5NQyY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-et_Dwz3OON6HFoL-qZyqQw-1; Tue, 30 May 2023 09:07:38 -0400
X-MC-Unique: et_Dwz3OON6HFoL-qZyqQw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30ae4ed92eeso1200113f8f.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452057; x=1688044057;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krcwGUvxn03gQCAlqftsgQo0yygpHvxoKgBhg4ggaz8=;
 b=eZxvipCBpnaemYZbMpKy8ap2aWFf2Dy9eMPVXdYLRm6J65I/TOO1xYYn+zJm7RN3E8
 0OX/6pFBWR/JX09PkuRIeZuBh/n3sqH5ujtR653zuG+YSd/vGI5VaqwsobLr0gkq0wSJ
 sb5SYYOFnXGC10i08o3OhH0WTsB1FBZl3ZEpAObHSxHEJmDM3pB9/Tmsp25TOvnyEvuj
 c6ZVRjW+iKPhmi3HaRh0DDXkrHa8o4EY2ELduDiDp5YreE4MppJRWFPbsZRpA2vllNfL
 gdn92xo6m421cPdvEFmA8bAYEkDbWN1Wll8im8Aeyj2RBavZs+1HgeMTRADxDl6kSi5p
 zENg==
X-Gm-Message-State: AC+VfDxEsUADM7NbiitDic7UmAaX/qeaVeXzdwS1LX/nhvUm5ZHpMN2E
 F18BIA5s/QYwM3ezGYIyXT+4fl3TNGRI3UlTxouL5/KsNJ4eLQ2ClK94AzmOlywdhmVFQei9HI6
 Caxqve9jcQ/co
X-Received: by 2002:a5d:4c42:0:b0:30a:d731:a220 with SMTP id
 n2-20020a5d4c42000000b0030ad731a220mr1737311wrt.41.1685452057366; 
 Tue, 30 May 2023 06:07:37 -0700 (PDT)
X-Received: by 2002:a5d:4c42:0:b0:30a:d731:a220 with SMTP id
 n2-20020a5d4c42000000b0030ad731a220mr1737279wrt.41.1685452057025; 
 Tue, 30 May 2023 06:07:37 -0700 (PDT)
Received: from redhat.com ([2.52.11.69]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d6602000000b0030903d44dbcsm3208381wru.33.2023.05.30.06.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:07:36 -0700 (PDT)
Date: Tue, 30 May 2023 09:07:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: Re: [PATCH 08/10] hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
Message-ID: <20230530090655-mutt-send-email-mst@kernel.org>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-9-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230530113838.257755-9-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: gY8Y8/w88iVW

On Tue, May 30, 2023 at 01:38:36PM +0200, David Hildenbrand wrote:
> There are no remaining users in the tree, so let's remove it.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>


This (with previous patches) means any user changing
device-memory-region-size machine property is now broken, right?
How do we know there are no users?

> ---
>  hw/i386/pc.c         | 19 -------------------
>  include/hw/i386/pc.h |  1 -
>  2 files changed, 20 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 920aa32b53..c4789e2f35 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1646,21 +1646,6 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      return NULL;
>  }
>  
> -static void
> -pc_machine_get_device_memory_region_size(Object *obj, Visitor *v,
> -                                         const char *name, void *opaque,
> -                                         Error **errp)
> -{
> -    MachineState *ms = MACHINE(obj);
> -    int64_t value = 0;
> -
> -    if (ms->device_memory) {
> -        value = memory_region_size(&ms->device_memory->mr);
> -    }
> -
> -    visit_type_int(v, name, &value, errp);
> -}
> -
>  static void pc_machine_get_vmport(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
> @@ -1980,10 +1965,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, PC_MACHINE_MAX_RAM_BELOW_4G,
>          "Maximum ram below the 4G boundary (32bit boundary)");
>  
> -    object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
> -        pc_machine_get_device_memory_region_size, NULL,
> -        NULL, NULL);
> -
>      object_class_property_add(oc, PC_MACHINE_VMPORT, "OnOffAuto",
>          pc_machine_get_vmport, pc_machine_set_vmport,
>          NULL, NULL);
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index c661e9cc80..6c9ad2d132 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -60,7 +60,6 @@ typedef struct PCMachineState {
>  
>  #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
>  #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
> -#define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
>  #define PC_MACHINE_VMPORT           "vmport"
>  #define PC_MACHINE_SMBUS            "smbus"
>  #define PC_MACHINE_SATA             "sata"
> -- 
> 2.40.1

