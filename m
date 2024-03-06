Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp749416ejb;
        Wed, 6 Mar 2024 12:48:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7WDon87vZy9B6hMebt8YZUWIAA6+A2lH48H97xeu3oyqJMvF+0asO5ynNJORKPqi2RoZbXAgOhgmhNYUT3t/8HLxOPdv8
X-Google-Smtp-Source: AGHT+IGJJ5nC+03FIjhskN2XNckk76G5Nysc2eOM+GGApw2wsEHFRgkplQ+VSTEW0f4hhvXMDexJ
X-Received: by 2002:a81:8987:0:b0:5ff:a52b:55ac with SMTP id z129-20020a818987000000b005ffa52b55acmr17566238ywf.34.1709758112889;
        Wed, 06 Mar 2024 12:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709758112; cv=none;
        d=google.com; s=arc-20160816;
        b=E2zR16AwBHFRb1zhhrXtpT73Zz77/B8oKlNAiGaEYpNyL+9FmpGgrO3G5WGuMHjnGn
         jarI1HkFT9FVGvFdB4GuMGLDKsiNF+R7jYSHL6a43SaCiI6zxZndZi0gxm4whdBCiB9a
         0UQzcuwwqviyc3datTTeAJbqZddAhz+QnQclyFqX16a9H6lF8LflqF+zn8i9Mc5KSDa0
         WGiCPg5c2Ppv1EtADXOpJRih2vZ4jT7OqJ157/eKnTBBHcPUBGiKgV9vEFdwYhpSPsWF
         D+LIW/KEna0FSw5ViBey4BQlj4tGU/DPnD/150hAuUX11Je6pS56iiW3C7g63jh6htI2
         tXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=clW4tepOhz4bwtSCztep8nMjoY4jMCkBoy9loVNxKzI=;
        fh=TDMSv+D20ttnd/ASj1X9D/269+YQQOtnl2NjC5uL/qY=;
        b=QVfB53mEEpLLT7Q3cs8LOLCzhsyfmUjUmIChVuwx5TTzDqrrZCJSWq+3p6jKJCuOO5
         Mql+VO4cBPOUUHSVsWWh5X18RSq1TcBU70zWW9L0bTCwKD/o3KeAwFMm3Ccvs4n9/JpU
         MVuQemvYcZHlivrgUQjmo7HTQgAQp/KzInBCK03+xgILrX1dFRATUUP14yP556bkS6yN
         M6pLlx6tPF4uYaTSttAS0b8Ax5tbTQykPIrQxuyfb8zvq17cVtV+Z0cXbaF51pJtPZGx
         xDiqbXmOd4dl1dMvPaFTM0W8SpghpzEtxT1yZCacbiIBS/6JC0Y4wn2BMxna6i+SdSZG
         TAAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGUR0KMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2-20020a05622a014200b0042dfb6f53a2si2642681qtw.748.2024.03.06.12.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:48:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGUR0KMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhyBh-00070H-Km; Wed, 06 Mar 2024 15:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhyBf-000701-M5
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:48:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhyBe-0007Ua-58
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:48:27 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so1737265e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 12:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709758104; x=1710362904; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=clW4tepOhz4bwtSCztep8nMjoY4jMCkBoy9loVNxKzI=;
 b=DGUR0KMpJihQ4DcbPnVmV6UmlAHpFHFfvpcMM0i3UybxM+ZZQZpg1fzx2Y984s88Yp
 Oy8d9jnutf3VpWaUm2mlSC5LqeNTDUkvw5SwIZ+2Uw3qykOTcuFiRpXoNhWyZgudo+Bb
 pJvPZz2s51NflQG2KWSHJKbH8OmLKtFWrW4nxX8IyMp/003cQsdXG6psWQ/S4PMdJHG/
 RbmXkRqyupLzLH7qaFU8Nn3mXwKEstfLffWQThqK1gBvq4zwpw6wojfMAzhU4cmCV0iF
 DGdy2lkPOBJDsxuZDrFrlE8Ecp+zQO1HFeeinCp5ODBIXqYsjdHF7Mc3om8lRmqQsi3b
 U41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709758104; x=1710362904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=clW4tepOhz4bwtSCztep8nMjoY4jMCkBoy9loVNxKzI=;
 b=Hojqjm/VsGoSLucXRrCFsbz3poDA+y5XvQmloE++JuILAGPzLFQaArTu+fQIgJK36X
 vOlvMk9YR1B8jtgQed1aChucyjyljcBDc/tSc6yhA/MfRgLP+OE727ZMAfLangjc5AwY
 bXVDf4exG1a1/LH0VE91mp5sq7xNT/W3S3/+E+mUhUB3ITHhjnRnsVkqN83kZcAoWTsJ
 59qns/EoF+vatBF/D9SmtFqFIwC4L5QdBtYmBkv8UYNBZAKSdyioR4/Es7b+VwBI3+jf
 rlVZ1y2S74yCTYHzXB4BZpz8DlAbKINRLcI1nq35gI1sJNAoJ0X3niMi5uaryQW/oQd7
 Fteg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhZRXoDXhj1/Pa72Mkv/2j4Kz3dzPO5kBp9CPQpgmHLfTG5ArfltW3PV1V0es4DrimptoXvO4PRzr+YyMR19Ojg+0
X-Gm-Message-State: AOJu0YwvAzdkbN7RdK1SN35EIBSCS4VJGXw3fAmuV92Zj3VhnT89lRJQ
 QfGdl7KV3W/WzJcUa6L0RyIJEG0lH6VOrkycmzUIiiB3JXNzoK5nD3YTm9xCRi4=
X-Received: by 2002:a05:600c:46cf:b0:413:88b:c10e with SMTP id
 q15-20020a05600c46cf00b00413088bc10emr468516wmo.20.1709758104559; 
 Wed, 06 Mar 2024 12:48:24 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 n15-20020a5d484f000000b0033dec836ea6sm18505929wrs.99.2024.03.06.12.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 12:48:24 -0800 (PST)
Message-ID: <359b4559-0ba1-42b9-8292-c90d65043898@linaro.org>
Date: Wed, 6 Mar 2024 21:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] qemu-options.hx: Document the virtio-iommu-pci
 aw-bits option
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, imammedo@redhat.com, peter.maydell@linaro.org,
 clg@redhat.com, yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240306203348.65776-1-eric.auger@redhat.com>
 <20240306203348.65776-10-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240306203348.65776-10-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Tx26gjaBIIIS

On 6/3/24 21:32, Eric Auger wrote:
> Document the new aw-bits option.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> 
> ---
> 
> v4 -> v5
> - tweek the aw-bits option description according to Cédric's
>    suggestion
> ---
>   qemu-options.hx | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 757df3eac0..87959ede08 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1180,6 +1180,9 @@ SRST
>           This decides the default granule to be be exposed by the
>           virtio-iommu. If host, the granule matches the host page size.
>   
> +    ``aw-bits=val`` (val between 32 and 64, default depends on machine)
> +        This decides the address width of IOVA address space. It defaults

"It defaults"?

IMO this should be squashed in patch 6/9 "virtio-iommu: Add an option
to define the input range width".

>   ERST
>   
>   DEF("name", HAS_ARG, QEMU_OPTION_name,

