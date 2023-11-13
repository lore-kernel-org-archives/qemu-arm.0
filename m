Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1429287ejc;
        Mon, 13 Nov 2023 07:55:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE5GYyvAgb8xsuXRNaQvKkF6lwcDGzLzwtjHByxGemQt8ULocBJ8PTDdXFGsFMyshG017I
X-Received: by 2002:a25:414c:0:b0:da0:5775:fd77 with SMTP id o73-20020a25414c000000b00da05775fd77mr5429790yba.63.1699890919406;
        Mon, 13 Nov 2023 07:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699890919; cv=none;
        d=google.com; s=arc-20160816;
        b=zKd7igAT6+31Dm6ROu6czaIc0qAaUDNSEkG96sdl7XmZVaJuFQjEQ5wsfPsDozwg4g
         t/GUtwKvEGPFKHLJaVdiPKlGNvWrcHdXkUVbiXemZa0nrWPhVTDw72pSuFZMYr0lg13z
         /uZ2/Dxf6WukS3sBWkfG5UYjnTw6uwyDaxwRcQMqZ2QdNOjuiZP3YsXxhnGMDPg2jaGW
         R7oEaLTLvrd5pTWIj2IvYjrMif6BjbhYm5Ee00B5td5/ZLWQ6JYKINS/4GB4qXQv+SIa
         N6g2Nc95Oqa4CFb10Ore4f72HWYjzzYEGKcl/BoDx39u2t257oPGd0lQKNHINUBDx5y6
         37jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mm5g/oKF5vcP9+nurcTyb+uUJzHdUzry68ElTYh6x3A=;
        fh=ECKPmSzayR/SWczkzxbMhg/LkIVBECoHJaxAoG9yV3I=;
        b=vsrjNhOk+JxYgtyBwWTYPbxzhxfZ511xfX4ApaiJKP6TiAtJIh+fTuPUQzl765bvJS
         nGBpidfOw7vux+UPEPSQqPMLP7NFea2iWOibJlQJmz4SLeBjvV9IkOYlQ2fA0Tw9sKps
         W8xhV/c10HddA7kcX70CNqBecbBRQ4DebarnAuemywiR6l4oua8tdJRToKO/3MlC+9CL
         55JjaifcIY6sIqKLbfmZTLuFhJTOnbr+ZBdRUky4oLdF8f9P5vWj1sCvgtYQYwFNqsm5
         f513PQMjzZoICfyRmZltsqKC7ETVCcb9tzpk5/sQyzCg5dzQk43L2A42Q8vCeRhFokHJ
         KVyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U2IY+zg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020a0cf807000000b00670dbcaea32si4832310qvn.497.2023.11.13.07.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 07:55:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U2IY+zg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2ZHB-000353-G8; Mon, 13 Nov 2023 10:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2ZHA-00034q-Qf
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 10:55:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2ZH9-0000fm-BG
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 10:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699890898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Mm5g/oKF5vcP9+nurcTyb+uUJzHdUzry68ElTYh6x3A=;
 b=U2IY+zg041ANphdmY5hvlg77NHdDQRnl+998NAXIDME70j6uS2o73R09cKcxR/5UhbMBnP
 yhyLneD8PlGz1n7pPWEvxWb7LIPoAR5tt36xEPxlehBXIOcZyne7VYvA471krSqmX3KgEu
 z37OLXyUqWv3WRnT2nQkUx69s4fHz2A=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-cljjX28YMuSM5k-tQVI98Q-1; Mon, 13 Nov 2023 10:54:57 -0500
X-MC-Unique: cljjX28YMuSM5k-tQVI98Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-67445c67d5dso52666336d6.2
 for <qemu-arm@nongnu.org>; Mon, 13 Nov 2023 07:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699890896; x=1700495696;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mm5g/oKF5vcP9+nurcTyb+uUJzHdUzry68ElTYh6x3A=;
 b=UYmELwehf16P1acAx7ODkPMJ1ldC/yTtEqjM9mUC2GEcouUG7K8wFQ9bKrol2dRqXk
 rg45xNXVSz8CrOsJ5vF9JJxF4oohKNLiExsy0NfLZiA61BAR/g7ZP4UKDem1GiqvGo3J
 aNE0bsTNNDa+YbrcNg8H+MImTULrvcI3+yAOpjdIB0XiTqy3fcRUcNgVDkzxuxiI696D
 lTn7HyPIwN0/E8E8pyrD/fkF35VJC4gvACKymb08IZwzllcM8ap54eY+g3+FMNyP+nmy
 RrxA4+K5HpkIsaNXFkbGRUeRIjAd8vKEtVuvlesrFJPglukp2qTXgULEQn6rbkDXO5D6
 FzoA==
X-Gm-Message-State: AOJu0YxAjY4MxK2duV/3Lt3halOyEuWQ75dwfm9edwl3cinm1cUqWxWb
 ehpyx0u0mk0e6svHeIZws+ZiyivnzoPPrhtQF21zd6/mTcpWnZAacbea24qCBQWoGg7Eq9KIj0P
 qadFOmZs8NsLN
X-Received: by 2002:ad4:4c4d:0:b0:673:72a4:b0bc with SMTP id
 cs13-20020ad44c4d000000b0067372a4b0bcmr7493176qvb.38.1699890896754; 
 Mon, 13 Nov 2023 07:54:56 -0800 (PST)
X-Received: by 2002:ad4:4c4d:0:b0:673:72a4:b0bc with SMTP id
 cs13-20020ad44c4d000000b0067372a4b0bcmr7493163qvb.38.1699890896507; 
 Mon, 13 Nov 2023 07:54:56 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-79.web.vodafone.de.
 [109.43.177.79]) by smtp.gmail.com with ESMTPSA id
 a4-20020a0cefc4000000b0065af9d1203dsm2169247qvt.121.2023.11.13.07.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 07:54:56 -0800 (PST)
Message-ID: <43bf23f8-ef98-453b-a687-5367e39f0c2b@redhat.com>
Date: Mon, 13 Nov 2023 16:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/system/arm: Fix for rename of type
 "xlnx.bbram-ctrl"
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com, qemu-arm@nongnu.org
References: <20231113134344.1195478-1-armbru@redhat.com>
 <20231113134344.1195478-2-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231113134344.1195478-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: CpjEEAKPeMfv

On 13/11/2023 14.43, Markus Armbruster wrote:
> Fixes: b65b4b7ae3c8 (xlnx-bbram: hw/nvram: Use dot in device type name)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   docs/system/arm/xlnx-versal-virt.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index d2d1b26692..a6a77b3799 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -194,7 +194,7 @@ To use a different index value, N, from default of 0, add:
>   
>   .. code-block:: bash
>   
> -  -global xlnx,bbram-ctrl.drive-index=N
> +  -global xlnx.bbram-ctrl.drive-index=N

Ouch, that's now ugly, too. Imagine that we have a device called "xlnx" one 
day, how's the reader supposed to distinguish between the "xlnx" and the 
"xlnx.bbram-ctrl" device here?

It feels like we should forbid both, "," and "." in device names...

Anyway, for the current state:
Reviewed-by: Thomas Huth <thuth@redhat.com>

