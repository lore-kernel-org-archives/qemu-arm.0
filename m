Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp83999ejb;
        Thu, 1 Feb 2024 00:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLPcMjGi8wLlggWWjfgVFrZaI4eIbt2JCkpRVRn+3q+eW+GDosdBDEERJ5MXvzAFheIviE
X-Received: by 2002:a05:620a:400a:b0:784:aae1:f52 with SMTP id h10-20020a05620a400a00b00784aae10f52mr2154899qko.7.1706776430605;
        Thu, 01 Feb 2024 00:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706776430; cv=none;
        d=google.com; s=arc-20160816;
        b=wqOU8QlHnrLed2R2v3tLPTLANdH4pa/ko/sFHNAZfKs0fQE+JvzblhlHg4+e3glD+1
         Udl+CZolR7k1cBjYHf7FDVmpyfXBJPAyk3h3/rOEjldadCionbtNLPsgt41n+TW360kG
         5hpEGgrbSfLUaGAmQsOSHAyFE5j2fzeE7SaxAT/0PS/eu+9sfoWvtT6EVlaB9Eij3tMN
         CMkHNzrQ8FkTYAsdIKILm9lmX/0ZMqt8bvArpnsmEdHdPvYTqaAoKZqObohEvDwDup0B
         IrIVp92q/6wu1XbqQ1v/YajAEB4gKOBZFcsAm7Zek18SVIkU9r2Fik0VZKw2RozbKGk9
         OD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Zb1e7rtk1xUP/I/nFiGIoNW9JPRvL3+u/XnxeX49f/U=;
        fh=uZw6C4+D3O3A/YHJDmsMZXAS+YGc92Ww5e4kNvCKjiQ=;
        b=chORKAxI0FsYE3w+MmTQDl1ig2okcOUc2L/dMMVSY6El436R7evQxRgc4UzxS+82xH
         3Xxuvsvv6aQgRpQO8gDJPCGkc3rjWZYClRujmthWh7g+MqBQ+VtuJFapIaIMi/xelaPd
         qNdd9mzFViGH1curneOcFg0w/lKmqxbuDcZovuY7Y1ywbKMyCBe8rqpsuUvgiyHak8TP
         OLfWlsV9KqeoXLJ99FhpDJoUExTF/EAr64PpTOr4UAPbYV96XYmoM5BClwxjdMRKdURJ
         c4PFAj7MOZ7pvuBPeqWXx30wgDwUwR0SpP4gDhBY+f6FWjVCe/ncr07CBwOQljZNmuls
         v2gQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q3DDrZKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCXguNOqHEJ3Re09jzNKbwNb7M8pIfi3kdUotiAyCxeKqeGlGh7xeJg38MqYcEVNOZsw9XfJH69D9O7ygABQQWmxI3jadWl+
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05620a0ce800b007853fc5d241si1947720qkj.387.2024.02.01.00.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q3DDrZKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSVV-0002tJ-2G; Thu, 01 Feb 2024 03:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSVP-0002fz-2b
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSVM-0006qR-Js
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706776384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zb1e7rtk1xUP/I/nFiGIoNW9JPRvL3+u/XnxeX49f/U=;
 b=Q3DDrZKVP5QqoFVE1yAklb/i0RUTyeQbEeCmwML8JDx1OeIIuWslXfK1cNL6PMfSh55UjG
 GFZWPfC3Y4fbyU9fMCdyREDRELFbJ7ogZmOW/YLEc8IKdEmLfxYacXUd3w1Zue+ANxTVta
 DbNZ+/mGd8C4cfTJHDg9TgJZpDbXZ78=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-PAVykoLHOK-S9Bs2_bpn1A-1; Thu, 01 Feb 2024 03:33:00 -0500
X-MC-Unique: PAVykoLHOK-S9Bs2_bpn1A-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2cf2ea2d70dso6077281fa.3
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 00:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706776379; x=1707381179;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zb1e7rtk1xUP/I/nFiGIoNW9JPRvL3+u/XnxeX49f/U=;
 b=mYS0YwsLr2RXpeJaDTA7tWw4UaiuwA5jqFt7xonKX/SCDJCJQpJwjQBaJ3J9zUzhtJ
 0ZTJRJn9wfIX7Jl6kLC2qt6iEL/oWf781xM0sIhqPDElv+3D3P3gsDP7CrjAL51hpnar
 rB0EK1eFyil2sOlihpHdZ/omYONOjw1fD5/nUMrndjpjX4Zye55SLsQ9HzGLm78/oO2G
 3KRKIR79jJNfdmo10y+dljIWfIQHNECn/rC773InQCVrO+fSBDKOyXl5iJugOuhPLmLm
 OSkk34ceuwBcWGeo7tur9qMwSJ/iW2QKmgMydmBHAiSz7PcWYZy9mpsGQGumElDGIr6e
 7jMg==
X-Gm-Message-State: AOJu0Yz89uo6mLWXI9AVYfDZKEG9y5BagiEGeUhby+20Przsx4g58/aw
 oqdcJ9qel5iAbcPbbf4Vh9ssPT4l8ZKAvYEiheRLRRw/wJ6iV4GIpBfcbrdB7DwbMcQms7w/ObU
 Il+ecBckA8A/GRcO2PzT+HLajN5aPrWRjAlaLu6K0IN4yxCVlww==
X-Received: by 2002:a2e:9059:0:b0:2d0:5225:6100 with SMTP id
 n25-20020a2e9059000000b002d052256100mr3171050ljg.38.1706776379320; 
 Thu, 01 Feb 2024 00:32:59 -0800 (PST)
X-Received: by 2002:a2e:9059:0:b0:2d0:5225:6100 with SMTP id
 n25-20020a2e9059000000b002d052256100mr3171026ljg.38.1706776378997; 
 Thu, 01 Feb 2024 00:32:58 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600016c900b0033aedb71269sm10265216wrf.88.2024.02.01.00.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 00:32:58 -0800 (PST)
Message-ID: <ebf3b065-2fc2-4e49-a066-ecc756958776@redhat.com>
Date: Thu, 1 Feb 2024 09:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/arm/smmuv3: Consolidate the use of
 device_class_set_parent_realize()
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eric Auger <eric.auger@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
References: <20240201084027.345459-1-zhao1.liu@linux.intel.com>
 <20240201084027.345459-5-zhao1.liu@linux.intel.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240201084027.345459-5-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: okb8ynUhLZQg

On 01/02/2024 09.40, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Use device_class_set_parent_realize() to set parent realize() directly.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/arm/smmuv3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 68eeef3e1d4c..b3d8642a4990 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1857,8 +1857,8 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>       dc->vmsd = &vmstate_smmuv3;
>       resettable_class_set_parent_phases(rc, NULL, smmu_reset_hold, NULL,
>                                          &c->parent_phases);
> -    c->parent_realize = dc->realize;
> -    dc->realize = smmu_realize;
> +    device_class_set_parent_realize(dc, smmu_realize,
> +                                    &c->parent_realize);
>       device_class_set_props(dc, smmuv3_properties);
>   }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

