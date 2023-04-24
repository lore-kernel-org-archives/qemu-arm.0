Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2936006ejm;
        Mon, 24 Apr 2023 09:39:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350b9i7nGeBUqey22sNqQT52bYeoVouH2lhkKxWYFUs0MfGlUT1X4f764NRBVzhTMV1v04X/P
X-Received: by 2002:a05:6214:481:b0:5ef:422a:5711 with SMTP id pt1-20020a056214048100b005ef422a5711mr30664971qvb.17.1682354381095;
        Mon, 24 Apr 2023 09:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682354381; cv=none;
        d=google.com; s=arc-20160816;
        b=PRaMdljkxRlzktJCQCO8rW7keol4KuB2T3TfmMVcaS7WL49S6ZkQ5ruhjaUO6E1G3w
         A43bOkk6IcKOoyONE1Fg/4AJRnN6vF1iOeaj0BOP3kiUVrpr5q9D3MUFis5k2wpzFfSi
         GcZTT9plC7nQT2xpG7RLGCxspb+WTTRMtq/6Fr5xZ2a2raBwehHrOWvkY8LVjbVrddNY
         PncchXVUzrjaC2e19VkOOwWFE3MZWy/YNQRrRhzyfqmukKZAKf/IkRM/uF9yAB3cbf/b
         kh6XXe7z0t051NW65FbjuRkZfmsYcLKjnMQlY0tNZj893jScyajEDOV1qF6kdtv9+FyS
         WRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AIrPqDKNckrm9rRNnpAer5v7LLkXQnVJgY+hTsr4RqM=;
        b=EDM6Yz7qupcDViAlpC4Vl3OH8Ou3YGRzxDEmDC8gkFGr15VNgU84FyiIA+CvP4nU9B
         ejr/ioCAY4pkTHM/86I5nYU7PZM5RMO/WVQfQckz7oHsIfxp9dmS6naNtVWd64HBdOs8
         PkLg3x6N0mgS214joOxogKVghMTiGUC08PxxD8q9eD74aknCiGtYJldn69XDOUHpQRAN
         VTkX5x8HKeFwVq5MfyDp+CjO+HiTDH6hkMMbJetWZA/NzdD1ZBUcl+ps8WBU+Hmhqk1T
         T9HSzRYn/ij7N/NlJ02yclHHjK2jj8yYTTav/GEv5s3MxW4cZFvs67P7uEYPLQOAR9iG
         VoMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QU6pIdL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a0562140cac00b0057115385fd0si7511407qvs.373.2023.04.24.09.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 09:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QU6pIdL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqzDp-00066Z-OF; Mon, 24 Apr 2023 12:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqzDn-000661-Ow
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqzDm-0007hR-5T
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682354360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIrPqDKNckrm9rRNnpAer5v7LLkXQnVJgY+hTsr4RqM=;
 b=QU6pIdL3misonmtLMWIQBNJ8bv91HIs7DlOriw+YHLFBy4eZQsfJqYt3GaF/dS8MG9mmSr
 /1FGh5PdcVNvRGZvC2IH30xozibWCBt2UhuRYq59lmLb1FncBf2+cSnBtLRNvj71USk6t8
 vY9188x9p1XPhJ6qDVTQUmluyGXtEXI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-x4SaYSOjOTOnTgVkbkPPjw-1; Mon, 24 Apr 2023 12:39:19 -0400
X-MC-Unique: x4SaYSOjOTOnTgVkbkPPjw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2ef39671038so1449146f8f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 09:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682354358; x=1684946358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIrPqDKNckrm9rRNnpAer5v7LLkXQnVJgY+hTsr4RqM=;
 b=TDB7f9Lq72RGoQ7ozOiKcIYK0pzH4ofaFSXamrC2NnbmdAqxoHzu3REbPkXZ1vkouJ
 H50CLXdmYOBW4aDvXmZ9Z1+tdRijQR6Si+aZfbliyjDVb/DTJEINZrvds+4KjXhj2xdc
 7jJ85SiaakAHPj5LWLAsawKNB0+a7OoeV/f7dyLwk63oRRLwRD862B3b66oxdglCIlbc
 OUgVRkZ8dhcWgaxk0eejFSPxOSPK4nFXcP+D2Ty4ZqmLHTiXhn8IDoAkhjSQmqy0t/ft
 U3uGHSeptV6498Rs4AISq5zR+DMdXEOLJCdtSoa2scYf2wQtHlTU1uzuTMFZItAAAbqU
 gNRA==
X-Gm-Message-State: AAQBX9cjG/EnEAPIYmfHBjjpnDzl/Vof9MQLhSmclI3J/tj/aJGnKMZ8
 ulBYvXULRpXH7IMIBKFOSbLHS5cmkttEbeZNvOnsaoUlDti3+1/FZyvpYmL9Hwa6SGgEDmWNkKi
 y4tHgtBLLp/Cd
X-Received: by 2002:a5d:6352:0:b0:2ff:f37:9d19 with SMTP id
 b18-20020a5d6352000000b002ff0f379d19mr9572363wrw.54.1682354358443; 
 Mon, 24 Apr 2023 09:39:18 -0700 (PDT)
X-Received: by 2002:a5d:6352:0:b0:2ff:f37:9d19 with SMTP id
 b18-20020a5d6352000000b002ff0f379d19mr9572351wrw.54.1682354358155; 
 Mon, 24 Apr 2023 09:39:18 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003f18372d540sm12443983wmc.14.2023.04.24.09.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:39:17 -0700 (PDT)
Message-ID: <755fb6e3-1f2c-00d0-139c-7275825fbe69@redhat.com>
Date: Mon, 24 Apr 2023 18:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230424152833.1334136-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424152833.1334136-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wRIgmNteJE4L

On 24/04/2023 17.28, Peter Maydell wrote:
> The Allwinner PIC model uses set_bit() and clear_bit() to update the
> values in its irq_pending[] array when an interrupt arrives.  However
> it is using these functions wrongly: they work on an array of type
> 'long', and it is passing an array of type 'uint32_t'.  Because the
> code manually figures out the right array element, this works on
> little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
> in a 'long' are in the same place as they are in a 'uint32_t'.
> However it breaks on 64-bit big-endian hosts.
> 
> Remove the use of set_bit() and clear_bit() in favour of using
> deposit32() on the array element.  This fixes a bug where on
> big-endian 64-bit hosts the guest kernel would hang early on in
> bootup.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/allwinner-a10-pic.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
> index 8cca1248073..4875e68ba6a 100644
> --- a/hw/intc/allwinner-a10-pic.c
> +++ b/hw/intc/allwinner-a10-pic.c
> @@ -49,12 +49,9 @@ static void aw_a10_pic_update(AwA10PICState *s)
>   static void aw_a10_pic_set_irq(void *opaque, int irq, int level)
>   {
>       AwA10PICState *s = opaque;
> +    uint32_t *pending_reg = &s->irq_pending[irq / 32];
>   
> -    if (level) {
> -        set_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
> -    } else {
> -        clear_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
> -    }
> +    *pending_reg = deposit32(*pending_reg, irq % 32, 1, level);
>       aw_a10_pic_update(s);
>   }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

