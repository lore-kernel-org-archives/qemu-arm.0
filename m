Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp853312dye;
        Fri, 27 Jun 2025 05:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvd69VjnmFqO5tgf5hCX2boqSnxgT1xC/Wi5esct04tgcwBg5H4Y6L+/oRDBPrf59JNSmO02F+9S/GPA==@linaro.org
X-Google-Smtp-Source: AGHT+IGvKu5ZgaEoOMTv2MUGPBvPITBH37/ETOTAOshwSGgvyfXWPAKQqdRAUBcRLOU68/PVOSJA
X-Received: by 2002:a05:622a:4c0b:b0:476:aa7a:2f78 with SMTP id d75a77b69052e-4a7fce1c534mr49720321cf.49.1751026151120;
        Fri, 27 Jun 2025 05:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751026151; cv=none;
        d=google.com; s=arc-20240605;
        b=azexgia51wjjd7EeIe7xGmlPSklDZrEHwRHWkWFnAYTFrlQd909CBAyqJ9CvF9WjjE
         axpEWHyIL4ZZovUASdK3V3AW16y0c44WfoFHkfVquDI/koz5sTw+3RsDppZdVPOoFk9Q
         iNW2CvHXh+Rgi3MG86cTByXrT8B+lM775GcEBiZrNIV8kYB9OkuF/mYhmmfjHipTZhWm
         mec8YBmcQJCpaSoFLPSRxLqxCcaX5zoLj7gzAY/wqmEBGYwDG3v40UsyPQPWyeH50NPi
         8DKHSchd0D3IwGR4JsEH40GlsfJciqvj29M5WycFwRx+bYO92LeSD9Gl5L4HmmciMVfP
         1JJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nCd3s/hIu3T8xTe2GEFTw+4ocd3vQcHSEOXXbYEjSyI=;
        fh=nZ+HUpaENvCZMbkjwuAI9b1gRoP0JR+MO2OazNaS7/M=;
        b=fLWcCwB0ZS/QdsVlx84rOkPQF6sA0Ma2ToRet5bhrywbuuG1ZOyZ+jBc+coSPDznt0
         Dkb55ODcerylFC/c1LlzK8q2+EzFUZ/M06crhPbcJf1Z9VpwvUu48RQboKbFIywPRAbY
         KJDytExVrVrVGhRW1dNqrNBroRNddPTxfhv2BW5+l6QqU4FlI/mlWEu1jN2R/sX6f4xZ
         9NCWQZ/mi7aXTVkNCaHCl6hLbzATYtpq6wATNEEiuaQE06qx5/DJXF7OOnjFoVCR07lO
         zOUT06jhKrW6nZeKH6t+B7YjiR/86chF7riMbm9TvYFfq2qfj9FeS4jW7of+Fjj+vIEv
         04Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W62kHZjR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e703bsi22667421cf.224.2025.06.27.05.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jun 2025 05:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W62kHZjR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV7t9-0000VD-Qm; Fri, 27 Jun 2025 08:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7t3-0000Ur-V6
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 08:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7t1-00047X-Je
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 08:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751026132;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCd3s/hIu3T8xTe2GEFTw+4ocd3vQcHSEOXXbYEjSyI=;
 b=W62kHZjRDwvy85GHcATWJ8bio0SxIKhnagh8eFcv2UgauT+1yKYzWTKgx/2YqKzvi2TIui
 lXQdwGcfi/jYaIhIgwR6ndi9+G+nnx5g6onxvZjk5jexd8Fkj57yfvTfKsWpkWVRxuf020
 58K148PdYEd5o3BTaCb6nfU5kuaLDfQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-ae7Z-KkmM6eB7e5gxy6xrQ-1; Fri, 27 Jun 2025 08:08:51 -0400
X-MC-Unique: ae7Z-KkmM6eB7e5gxy6xrQ-1
X-Mimecast-MFC-AGG-ID: ae7Z-KkmM6eB7e5gxy6xrQ_1751026130
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451deff247cso15730485e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Jun 2025 05:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751026130; x=1751630930;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nCd3s/hIu3T8xTe2GEFTw+4ocd3vQcHSEOXXbYEjSyI=;
 b=GfHkEj7akbPrHbWa/sA5GZhI7GA1TAAVgIFc59JKH+xtpGZSKW+jou/JYJjWWuW8wI
 JU+2ItaZpLc0O+8VM4ok2vkmP0L93g2XfyH9+LriuIDRvcCtnTGLMXP3ugmlURO7WBlS
 WQIM64vqokwnkDeYk5UnKpPyzGG0caE+SSZxUn0hF3MOTtVm5Wj0WXrKniX/vivxWXOA
 6o+VWPSy3ugSL9FALpxLxtrYguMKm/Gomk96VzpcTckzxeHlKRvrSUlBxThzSe+YaIKB
 b+pVYGkOn6Vvbv22muCVwiZ1yNiwYPmtb76JrSSZGCp6qYoxiXcjB2pP/rKoZysCsieB
 BILw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBHdcsGbzfFh7rpCiQOw0bAsZdU0olyG7OqO+KNWd3dgt2cLCyxqHfufHndGFUZ3UyTi0gkm5jBA==@nongnu.org
X-Gm-Message-State: AOJu0Yy00U0qTEhJzfaIZ880Ybvz5wa7fFzhnSh/0TCb25svQmqpxBPl
 BBCaPIHDThiFllFmYhVvoZWr2p15xf5L+hpFFP9zVNbBCpaxk3NtDp/Rfi+f3T8Ti/lrjI0Sw//
 NzcdUlARXbuLSHCsYy2ZYMPESis5H4jsHiaqgya1wulBrVvAiwYEAKg==
X-Gm-Gg: ASbGncvkEwY0edpqb+tMEJtfMvlp1l5GdR1p0yzthm6OQyTg/9DhgheLW/GcKGBdQ1a
 qAWr7ezjYA/BFAO+1GcaTHnnn+JgpCTHFbWWR4XHEIWJvJQ7EQIClZFbEd6/YfSSMz1Pw6dTbbs
 9pU3YH5OFABZoVfU5zxYvF38Gp1loexhedD7t23cZwWBvTCC0n6xR9byKESi/uijvXjgqoGPfU4
 7jAzYbEkdFM2qKHVEBNdtJ1ICfNQflshIwZIjZB+dQdLCDujnTjl+NrCPbB3ii63/7VBebFobTn
 BPr78ldgyWONq1eZgM8aGwDfHVMrVWL0WLZ1V74E0egpfzRHydrSiY43SNjTHDE+pu40FQ==
X-Received: by 2002:a05:600c:37c5:b0:43d:fa5f:7d30 with SMTP id
 5b1f17b1804b1-4538f30fefdmr27046455e9.16.1751026130256; 
 Fri, 27 Jun 2025 05:08:50 -0700 (PDT)
X-Received: by 2002:a05:600c:37c5:b0:43d:fa5f:7d30 with SMTP id
 5b1f17b1804b1-4538f30fefdmr27046065e9.16.1751026129857; 
 Fri, 27 Jun 2025 05:08:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a423abbsm49892465e9.39.2025.06.27.05.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 05:08:49 -0700 (PDT)
Message-ID: <38955beb-bbd5-4bc9-9996-ffde0b310d54@redhat.com>
Date: Fri, 27 Jun 2025 14:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] qemu-options.hx: Document the arm-smmuv3 device
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 gustavo.romero@linaro.org, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-9-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623094230.76084-9-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tzNtqmY8omvd_9uAybKslL-dIVejqpldKJoiFo_YggM_1751026130
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iW7Q0GI3ks2A



On 6/23/25 11:42 AM, Shameer Kolothum wrote:
> Now that arm,virt can have user-creatable smmuv3 devices, document it.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  qemu-options.hx | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7eb8e02b4b..7d1a12f7ef 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1226,6 +1226,13 @@ SRST
>      ``aw-bits=val`` (val between 32 and 64, default depends on machine)
>          This decides the address width of the IOVA address space.
>  
> +``-device arm-smmuv3,primary-bus=id``
> +    This is only supported by ``-machine virt`` (ARM).
> +
> +    ``primary-bus=id``
> +        Accepts either the default root complex (pcie.0) or a
> +        pxb-pcie based root complex.
> +
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,

