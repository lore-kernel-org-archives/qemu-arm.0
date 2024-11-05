Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2829628njc;
        Tue, 5 Nov 2024 05:44:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXy4L3NcCv4DJryZ55G/6n08fX/mPK1vfP5l8blC910Z3Pq0cStFkKtmEBy18n4RnzI59kI3uFtHYNFGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDeZ8Qcu7CNvmrimr0uYPHO8RyqxyI3CpnhLOQxzeVugzJ3mVEO0E9TIn46Q48ofhRWj2m
X-Received: by 2002:a05:622a:55:b0:461:2f3:c52f with SMTP id d75a77b69052e-462ad2549d2mr275432121cf.2.1730814273481;
        Tue, 05 Nov 2024 05:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730814273; cv=none;
        d=google.com; s=arc-20240605;
        b=jTpczZdeJgA+Jx7qLhYEZrua7FSxHJsM0M1awMsxjzDgqOY3pw8Y11OkL24MbRb9Zx
         RzDWI5x3xXU59h04vG0P+n4I/7X+L6buDt+uom9Y/3b2PLcqrCZqd51Rz+eOapRk34JO
         tvvvzJ42gb2qnbS5OfWkK5jW4Xc3ne/LRpcWAw7JlQE9Btj/6wggV6MldbueRlVloGkk
         m8GGirABroXLbIg3Y9lJ9jAyOA3AyBSWLiGPbM0uzbdWKp8Idq3VcZ+phQDmmUGyhb9D
         X1cVODaVxDKkRjJHt0DAOifEaD3AXB74l6hgkULVt4DplUmYgqIx251PU1V9naw4Ml/J
         7PSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=40G9pr3QBzMc2KOpvJ6PeZ8hO4T9az3q3ckT6Oy74kU=;
        fh=7kjaeKwFPrFGjOrKNu7cNgl0ebyHGqbMOvThH/RAcFc=;
        b=GEaBqlUP3uOLfPKp7rUJDJQU5Pha+HrY4HCQDntlEru7coDxMXlTHb7/BRguAkBxwv
         8DmwHNRAcG+6YnWgLL1yRA5NcYpBsyA2gMzGUqJIDjtt4WrrThjM769e71UrH8po9vOj
         hXwOy5MykTnrnjCgrXMuhSgx+ZxYxKCG++w4Rxr3wzQSxBlfVimko/BE7qHq+0EUmTbl
         AqC9VsBY4gvY60fycmWjWMrJELTTeWxmPqpW7DfsRoUK1px5E8tIZoOJ2klV0PonQTC6
         GpnloOIhEi9hEzA2VX9IfG/FEGBJfPhXymxQOwuujqK6WrccM/23549moRVVu7uU+IwM
         r1BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBUyz4Z9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b0f4csi142292671cf.145.2024.11.05.05.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:44:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBUyz4Z9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8Jqq-00031k-13; Tue, 05 Nov 2024 08:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jqo-00031T-Gd
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 08:44:06 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jqm-0000Ur-RB
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 08:44:06 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso875836566b.0
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2024 05:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730814243; x=1731419043; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40G9pr3QBzMc2KOpvJ6PeZ8hO4T9az3q3ckT6Oy74kU=;
 b=cBUyz4Z9TsBkNaG9NBciu/arL0RmeUc+NaVCNHzQLP00Ke7uT2H0/fg1RrOt8zAzZo
 SRc9gu3W5xSnHCWYiSa3PVQCGTV+eSn1SfG975IlmnOK/OSNNWWKMuC84lNZTOmnkg1H
 SG3Yr4NnE5/Gx2GFe/CKNiEmPBaOFTDL5e/irg3Ep8HM7dZglGzPqZo6YoG8TcTV7ZR5
 RrRCCNjVVQEOEAjRbZKbOo6hakOKno3jb59nb+fLLTbUEUHxXuJ75KRwvaMMV2/s5+1X
 IeHdLjEinFazI/rn8XEE4x03kBXdpibFfA121if+nlwG3v60NAoWRGp1ks3nkIMbOw4T
 Hl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730814243; x=1731419043;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40G9pr3QBzMc2KOpvJ6PeZ8hO4T9az3q3ckT6Oy74kU=;
 b=rt5uWhoaZTSlqHiJBBX1MG9+bPpwCkIHQsPkrvDVPklp/LVVmTnXw6LNB8ncTxOWb9
 0obOL+4Ta5lvHf1WLtkuupGfs6YikkYo+XoiUxPvkLFUq+vjhGoqOCAXSOFRt6+kWMkM
 PgBl0I631+BI9BKEtbQ0WWpPqqw9eR4pRdw89b451F1Iq2yZISQilpu0d0gWpu/jFuVf
 SyoNUsMpy0RV9EsJdy+uJd8qkT+KyH07MzeIDVafAWEynuxdGIV7tjAK0uA4dTFZJUYb
 w8/sjxdka3uJzNaq9Ti46h/JzEYhe4DBZtX9IhPLvHwUX+MkyZGFjoox4r/eWxzF8/8J
 3dpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq5y6MOuflabjxQMUWCIRmQlczNzKh4h0NbMUe+D1slhOD6tzokig/QZdG46rUOS2BhjDPbt1iRZzL@nongnu.org
X-Gm-Message-State: AOJu0YwmWiE1qv6WnJMA3uq5MlsGyqfHi6ceJwnl2m4FU/Ac6IYZM5Yv
 BZ7hHzcYWURtck6xlEHe5uE3+5xsvZq/GMrTuxQXp5SHI29eksEcXt75W/qIvl3lRsKY3w819yl
 o+1s=
X-Received: by 2002:a17:906:f889:b0:a9e:6712:c27 with SMTP id
 a640c23a62f3a-a9e67120e0dmr1261536966b.49.1730814242789; 
 Tue, 05 Nov 2024 05:44:02 -0800 (PST)
Received: from [192.168.21.227] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb169fa0dsm135635166b.17.2024.11.05.05.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:44:02 -0800 (PST)
Message-ID: <95438667-18ee-450f-8d1f-69bf6b898651@linaro.org>
Date: Tue, 5 Nov 2024 13:43:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/19] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-18-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cog82Gcs9Qnx

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> -static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc, void *data)
> +static void petalogix_s3adsp1800_machine_class_init_be(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> +    PetalogixS3adsp1800MachineClass *pmc = PETALOGIX_S3ADSP1800_MACHINE_CLASS(oc);
>   
> -    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800";
> +    pmc->little_endian = false;
> +    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (big endian)";
>       mc->init = petalogix_s3adsp1800_init;
> +#if TARGET_BIG_ENDIAN
>       mc->is_default = true;
> +    mc->alias = "petalogix-s3adsp1800";
> +#endif
> +}
> +
> +static void petalogix_s3adsp1800_machine_class_init_le(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    PetalogixS3adsp1800MachineClass *pmc = PETALOGIX_S3ADSP1800_MACHINE_CLASS(oc);
> +
> +    pmc->little_endian = true;
> +    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (little endian)";
> +    mc->init = petalogix_s3adsp1800_init;
> +#if !TARGET_BIG_ENDIAN
> +    mc->is_default = true;
> +    mc->alias = "petalogix-s3adsp1800";
> +#endif
>   }

These can be C if's, instead of preprocessor #if, at which point you can share code.

static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc, bool little_endian)
{
     MachineClass *mc = MACHINE_CLASS(oc);
     PetalogixS3adsp1800MachineClass *pmc = PETALOGIX_S3ADSP1800_MACHINE_CLASS(oc);

     mc->init = petalogix_s3adsp1800_init;
     pmc->little_endian = little_endian;
     mc->desc = little_endian
         ? "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (little endian)"
         : "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (big endian)";
     if (little_endian == !TARGET_BIG_ENDIAN) {
         mc->is_default = true;
         mc->alias = "petalogix-s3adsp1800";
     }
}

static void petalogix_s3adsp1800_machine_class_init_be(ObjectClass *oc, void *data)
{
     petalogix_s3adsp1800_machine_class_init(oc, false);
}

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
