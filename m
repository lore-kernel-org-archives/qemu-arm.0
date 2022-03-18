Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1456116lfo;
        Fri, 18 Mar 2022 05:19:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsWWvIAJSYdd7OmAM14wRXc/NjDOKzlMaNgV17KWoJqAa1TM4gi1pqYR10JbgUc+F2Rhah
X-Received: by 2002:ac8:570d:0:b0:2e1:c9be:b2ad with SMTP id 13-20020ac8570d000000b002e1c9beb2admr7162260qtw.456.1647605990826;
        Fri, 18 Mar 2022 05:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647605990; cv=none;
        d=google.com; s=arc-20160816;
        b=MfoOOcQquha9cLDZ0Wc4D9obf/YZp161UVtAu/fzXn1WUQ3W7CTLqHejsJeysfcWRX
         iycPDEcBCft1gLkPfWqRPPk+suOAb5aaBooIk34HQPusoFh68jpoRJ+K9DImjwjKdvml
         8+YraOvkQkZan2S8/MHHP8rkFys9Kt1FO162/gVF2c+yNK5y+i7Q1y8K4+GbXUoBDsFQ
         R3H5n3XjM7n5icFHAyWBzXIFpP3TLPKr7/yF1gnSgyeOMMsL+qANtlX62XEUrIBKnhDw
         CeKIfFDISCy/GSznnv7IuOzqROfz+X2iA0zoqoCrXBvzNVfWKBIPkAL88xJzlWi+rR6C
         N/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=vwZGbc9in2st0WF8Ra1OwJxHudiAbBIeP/KYvtMjXHU=;
        b=Inh9h/EUO/zfnCtyVEtv2LuJjbIaOhZTIRubu8yyXyTlRmhmULIlT/nCNIXXlo8kob
         whvLYFBPHaW56hIZXklwPMFr1SmqgZZgYcTOChdpG6mCnC/V5oBNZl7yiMO3kK0O6K3P
         5ncC1l86hK2APAYQ/EmTdaQeW9e+2jGsJPOX3AtT10iQBWVoUhHvZpxqOT2IuWYQiagE
         WTp/DZqAFkV+GMwhjqXv5hL/8sFoQPqBFEkFmZg+8Nu1eU1GL+MvUuLed6123Z96Q4Lg
         ohX1P38UDRAgnOwaTmj3CqTIim+qqtT9urUybXFSpo2kAfnvoXgUnmMYQPik7Fi6TDA9
         pSeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cxwc5O/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05620a25d300b0067b3c197ef6si2589003qko.531.2022.03.18.05.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Mar 2022 05:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cxwc5O/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nVBa9-00031S-Mg
	for alex.bennee@linaro.org; Fri, 18 Mar 2022 08:19:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVBYm-0002zU-IR
 for qemu-arm@nongnu.org; Fri, 18 Mar 2022 08:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVBYj-0007Bf-TA
 for qemu-arm@nongnu.org; Fri, 18 Mar 2022 08:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647605901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwZGbc9in2st0WF8Ra1OwJxHudiAbBIeP/KYvtMjXHU=;
 b=cxwc5O/grJG86Oe3eTlbJZnAAxs8xjJ+Bli5W4xhdgui120+RQ8Nii/kuGhSlNKhZg/osf
 dAMRidi2PrAH+bMe9M3Q33J9xClR1WqqYmzDEf9KN3De9TzxRTVrjM3aAwZ5FuzRLchxmG
 gXmfMemouJOiyWTftRnXqli4yvMoN9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-KYaobvNFMyOuETk9h0drlw-1; Fri, 18 Mar 2022 08:18:20 -0400
X-MC-Unique: KYaobvNFMyOuETk9h0drlw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a1c4d0a000000b0038c6e5fcbaeso2871156wmh.9
 for <qemu-arm@nongnu.org>; Fri, 18 Mar 2022 05:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vwZGbc9in2st0WF8Ra1OwJxHudiAbBIeP/KYvtMjXHU=;
 b=cl4hdwlE0fbSxfk1jvhM4Bf+sTu/3g2Rl7u4TNAqF6qn5G17K51urNJa/z4p6zE66I
 QX5vysMPVLgWFxZlT7YdbmSDl4Db0mhs1euWs48RAde2nfJRMHYnfMLfRe6vgqdE9hTQ
 3sZSHRjx7aTIM9iNbUa52UCLaEiikHiJGBtoVk6XYBcyTFByd8UKZkbdxkZ8hLdp9UWX
 C3Zm4zmE0IJc5MsWBfNBRDEy6STUyS7YAEe8MQZDZrRGbhcvVSSooFqYVcUdhgVOBuN/
 U5lMjX1ju3l+pzDDTEwrcfrGGyXwomvS8JWsblpOYbksXW/NrA6bGtDzkMV9x9P35lMP
 mM8Q==
X-Gm-Message-State: AOAM530mBfynsWsjr0bLgn4Xkokx7sSW40pLt3ZN5S4whLDk+8o5G4LW
 VyRiLV+joN5nABGzHNWkAKzDd8KQInTBgzlCp21kNyXNa/pKZZGuJQycKeF8CdpF6s/IIy10raX
 1kO8CiqL9MDE4
X-Received: by 2002:adf:ed49:0:b0:203:e5c2:b3d8 with SMTP id
 u9-20020adfed49000000b00203e5c2b3d8mr7580660wro.24.1647605898236; 
 Fri, 18 Mar 2022 05:18:18 -0700 (PDT)
X-Received: by 2002:adf:ed49:0:b0:203:e5c2:b3d8 with SMTP id
 u9-20020adfed49000000b00203e5c2b3d8mr7580625wro.24.1647605897914; 
 Fri, 18 Mar 2022 05:18:17 -0700 (PDT)
Received: from [192.168.42.76] (tmo-065-254.customers.d1-online.com.
 [80.187.65.254]) by smtp.gmail.com with ESMTPSA id
 b3-20020adfd1c3000000b00203f1231082sm3719394wrd.90.2022.03.18.05.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 05:18:17 -0700 (PDT)
Message-ID: <1150fe4c-cccd-ac14-70c5-55eb88ee9749@redhat.com>
Date: Fri, 18 Mar 2022 13:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH for-7.1] hw: Add compat machines for 7.1
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20220316145521.1224083-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220316145521.1224083-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman <farman@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /0y1ATYJzceW

On 16/03/2022 15.55, Cornelia Huck wrote:
> Add 7.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)
...
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9bc..c3eab13c60e8 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_7_1_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_1_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_1, "7.1", true);
> +
>   static void ccw_machine_7_0_instance_options(MachineState *machine)
>   {
> +    ccw_machine_7_1_instance_options(machine);
>   }
>   
>   static void ccw_machine_7_0_class_options(MachineClass *mc)
>   {
> +    ccw_machine_7_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>   }
> -DEFINE_CCW_MACHINE(7_0, "7.0", true);
> +DEFINE_CCW_MACHINE(7_0, "7.0", false);
>   
>   static void ccw_machine_6_2_instance_options(MachineState *machine)
>   {

Acked-by: Thomas Huth <thuth@redhat.com>

