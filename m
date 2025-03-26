Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3319358njc;
        Wed, 26 Mar 2025 06:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVi2iSLJBWiL1SI7lPgHaZrxdJckaJrAn28+ELg8Y8iuyB3NgJjS2IdHWJUp6dH9hylO/XA47wHU/fCpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGwEHXFvs+1tDKUizZaPGe58aupKEgyIvT+l9v8YXTt7Oqj9rojrE28GY8Tm8nUX8GX5VL+
X-Received: by 2002:a05:6214:2a4f:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6eb3f35b4fcmr298643176d6.34.1742996411672;
        Wed, 26 Mar 2025 06:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742996411; cv=none;
        d=google.com; s=arc-20240605;
        b=FHfuRhM5ZopTreNJdGMg1GgdJPVmpaUum46J2JK5Z1ekrsKz/JyO+L8uXsu6w8rL3F
         T9yVZRupUx7eqSoH0A5p11/Gz+HAgoib45jglIQdD2GgGNLgiz2seh0uyLB639VPDut4
         X9ib/opJWu6Q33TiaYUc7ZDyRnOa0tx69HZ0uuwZww8mnsbW6/HR2FMFdZ2jM/o9AM2v
         Sn6phMS/hmqyCcTuRDZRCvfmTrVw9tEF0tNG2Z+Y6eDW5N9V4fQyPybwQqRdrFiap2IO
         UX/z+oSDg6qtcel8jaBLNz9qzZF6r36znR/4SuKGYHPK4Hhc/8Qb9GLOAOBW5R9Pp3Tx
         Q9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LeQkt2IuYTyr4XDk0FlNiWrsm07L59YTJwlvktEcskY=;
        fh=i86g/n7Z5yxvcc32Rb+OnkwU41s3/c8/2+EN9AZSWYc=;
        b=UtoNTxwvPJW408S9dEQyFiaIyodeW+y+q1UXRay1GAkEHXf02Fr31YvRfVLPf1PyY9
         zJySebSAzTGBSC+6G7snLgSKnnOKH8c5si7hIdRtaSYIsGH9JSShQv7EGux9nRtyPdb5
         ysXoA4FeFMFhu9JlQeHlGuAUGWEO95AnknhAqCUFCzlQ5dludVHxUrxuDgJ5HdkZMR2z
         OUEdVqXCAzsYBsK6oLzSNeQxH2hPJVLmfd6kje/0z6yTX/+jXmF/BxYGrL/pbcOW4evJ
         MRjrza3hJfmhRM1+5O+Idnk8jbG8c+UxV1YUM+DpmkqFe3cjD6zfmSaEttmiKMwEjTl/
         rzhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Da8sEydD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f01aab1si118250816d6.312.2025.03.26.06.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 06:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Da8sEydD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txQzE-0008SD-I9; Wed, 26 Mar 2025 09:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txQz2-0008LU-FK
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 09:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txQyt-0000oi-Hg
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 09:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742996382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeQkt2IuYTyr4XDk0FlNiWrsm07L59YTJwlvktEcskY=;
 b=Da8sEydDQ8dv7i+scNvzsXK2f2snARpVqhZSWRjzwmw11fDQg+k4lXjexXTNlPqcZYtvW5
 enIzMlKbLmdpXAFISxgKDa5ZlE0LpcSCBa+s8CiJ4zHbnp4X68owTXbaiHHD+Uug63QYUl
 s5K14yYfRUoKX9cu9R22j8L+hOpCnkc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-zHKvlbhJOommkT9UeAmTeA-1; Wed, 26 Mar 2025 09:39:40 -0400
X-MC-Unique: zHKvlbhJOommkT9UeAmTeA-1
X-Mimecast-MFC-AGG-ID: zHKvlbhJOommkT9UeAmTeA_1742996380
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so37307705e9.2
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 06:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742996380; x=1743601180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LeQkt2IuYTyr4XDk0FlNiWrsm07L59YTJwlvktEcskY=;
 b=m9FZdFcHlCN0+cmTVKMYwRYQ0cjNKQhyUAl371aKeSssAz9kMcd7o+QbhUQvbM8MPW
 T9tNfBNP/K+irmIPCpBGAchSRff7GsdRoraI0Ef0a+c3yTPTb+QUIPHc16I+iduIw9b3
 upB11ET2Zwytp6AYRVe2sQk4pDOZ3zfPmjD17sTGPc0FZ+bnNZ2Gt0oRlECYXWKVRaAl
 SBXM62MQINnCr37oM97iuVx62YO+YTJwvBzwsCbYo9bp+rNyXDibEfvZd7N6FI3x7UEz
 Qckxnn8mjZHm80K+qWK9mHZcaXwDE/0cab+LhSHHctPE2yVC+lmW55QuzJ8HBWi2DMCw
 6cqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPo6X4YTnP2sSgxroL7dTbhSwpNgtNqrgXAnwRz+OzaoMnrRQwZNPbU3LquG92jCt0Tutr7Elslw==@nongnu.org
X-Gm-Message-State: AOJu0YxzJZ3sopaIILp7mzJzqRHHrA3elK4dmOJxgICtiogXEunbH4DA
 HAwUIQ/D1zPZ2sayI8jCj2wL3N94kMx4fcrqqeHqP0gXoAZLJRtz0IrC4GvX8ae8721+ki4fUvl
 aXnRrk0XEsufP3aQBw4cUaVuIgLgcS2N1IuoDwozxSUlG9hM/QQ==
X-Gm-Gg: ASbGncvOo4H+/s7LBfeb3B4n/VXMR3Y9vYmBBnujQN0KHR90idkzIjwCuLF6YpBIfyH
 tSrFTwTcyXY6DlnhHtt3ZXroy7r3a9qXyRe44AfQjwbesXbczBT7YMjqwIvCFq9cFCQxupaF1Fa
 ucaB+4/9HEO2H+ua5b0z22rKpgO9TH3tyO0p7Xd0ePam02wTuiZgzP5N+gMTOd6GaPU/x/WkqGk
 2iLTK8SAQ/hlYxe7YO4SWXdYb8HNVgTlOKwjYrl56y0wWIHLRNOsntwnnZ4GHFM5P8mKNK29WRO
 vU0hFMbmhFKeMb0KJtFrws37nr5ILJMWUPNfiDxZ2WqTdVlFgguriV7XFD2NndU=
X-Received: by 2002:a05:600c:1913:b0:43d:649:4e50 with SMTP id
 5b1f17b1804b1-43d509f67d4mr193754105e9.13.1742996379700; 
 Wed, 26 Mar 2025 06:39:39 -0700 (PDT)
X-Received: by 2002:a05:600c:1913:b0:43d:649:4e50 with SMTP id
 5b1f17b1804b1-43d509f67d4mr193753725e9.13.1742996379309; 
 Wed, 26 Mar 2025 06:39:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f59d0sm2159035e9.28.2025.03.26.06.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:39:38 -0700 (PDT)
Message-ID: <a3d32485-90c9-46da-bcf6-577bd880ce81@redhat.com>
Date: Wed, 26 Mar 2025 14:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/20] hw/arm/smmuv3: Install nested ste for
 CFGI_STE
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-15-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-15-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sqi-y8tn2z85j4y7H-VB4IU5uljzebOWlBef60k6XN4_1742996380
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: mnww2wjFEzq0

Hi,

On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> Make use of smmuv3_accel provided _install_nested_ste() for CFGI_STE.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ea63731d61..83159db1d4 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1286,6 +1286,7 @@ smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
>      if (sid < sid_range->start || sid > sid_range->end) {
>          return false;
>      }
> +    smmuv3_accel_install_nested_ste(sdev, sid);
>      trace_smmuv3_config_cache_inv(sid);
>      return true;
>  }
> @@ -1353,6 +1354,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>  
>              trace_smmuv3_cmdq_cfgi_ste(sid);
>              smmuv3_flush_config(sdev);
> +            smmuv3_accel_install_nested_ste(sdev, sid);
>  
>              break;
>          }
Given the small code diff I would merge this in the patch that introduces 

smmuv3_accel_install_nested_ste


Eric

