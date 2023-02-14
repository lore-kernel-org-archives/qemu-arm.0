Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1532770ejb;
        Tue, 14 Feb 2023 10:37:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/hR/BhTbd/BQtmKe3UQTlymswJfCA8r+RBNx9xqR6n8Y6XDwb942ho9Tqq9y/akCfXDq45
X-Received: by 2002:a05:6214:4102:b0:56b:eb9d:4342 with SMTP id kc2-20020a056214410200b0056beb9d4342mr5990858qvb.49.1676399872829;
        Tue, 14 Feb 2023 10:37:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676399872; cv=none;
        d=google.com; s=arc-20160816;
        b=Kzx1XsFxSsxth8JplcnKDlHZcO3VrrDsI6L2eppuxUMHStNZuBaWdNmgoOvgmlzDd+
         wmwz+RtcbGPa8djpEX4D3/LjR1Th0Zre51A6cdIyRk0VN/idGIaSKFno7SS7orKHg3R9
         6Utbo8KbLlQaOCNfN7dh9Ot4bWJnd8h/Z9mjmTex74H2jtghUtWZFm8KCvuQaPWk97SU
         OVTTN0/99JJJZXfIlhDR1G42CwEe4p4CgVUfUkM+nrAPP36xT0OdrNyEdwN9hcHKQXC+
         D1jlKC+96A2ciAkJxkc9CkZ3lLHLbFGxdTlzWxf8gaSid5W1MaJdyafiSMwxqJ5f0fLn
         zQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LB9WaVMBaH/HInGJ4VloOO6TJMJoHR8SjqJsf0ukbfQ=;
        b=yhGlivTVU9n+6KSsu4C4j6ps3tLQhf7IpCL28Kn7SuGo+7XLWSfTNt8CkJlB6BiEbt
         zK1yYsyuEIRG5iFJS+a4MOSEwipUOTfXiUSXGAcuH0zk8334jG793WhAgPP75lWLFbdD
         ntzdcu4H11DubDMe0tc5K2D+n1F9PNJNGA8c1aD1bcahgayK2vM5BzK4CWaULhpy7vWX
         pzOxPEp+8TQol5RGJyzaAf9D6GBJ2xDZMQVn+1xSM/WoV555J1xO0wMl0CJe3+dA08+p
         0tTVOTFdEJIqwbH1giUCOp7QsETOoopMiaPjogjrDMHIsV1ogoQ6FBz20NCqnQNJDPjC
         LgXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+bS7U+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020a0cdf0a000000b0056ec00cb79fsi3391575qvl.156.2023.02.14.10.37.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 10:37:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+bS7U+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pS0BK-0002S8-Cb; Tue, 14 Feb 2023 13:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0B6-0002OI-CZ
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 13:37:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0B4-0004Yx-Om
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 13:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676399838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB9WaVMBaH/HInGJ4VloOO6TJMJoHR8SjqJsf0ukbfQ=;
 b=B+bS7U+z/CWy3owk2ZXzyM552XyE6AO3Lj+VM5sgKjeWmbFJjflxRXuK2nG1Kagj4pr4bx
 p/gJKXhJqeY6PYtoloGqZLrVd8ClMHkR4Kw3VdrC0K3/QFbYnW8JXdD6ZNpDstsEP1LpyH
 rsHeE4OtWUEYTVVI34maEUeMDTsLsJM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-WNBKVb-ONRipBB4eSBV-jg-1; Tue, 14 Feb 2023 13:37:17 -0500
X-MC-Unique: WNBKVb-ONRipBB4eSBV-jg-1
Received: by mail-qt1-f199.google.com with SMTP id
 i5-20020ac813c5000000b003b86b748aadso9877209qtj.14
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 10:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LB9WaVMBaH/HInGJ4VloOO6TJMJoHR8SjqJsf0ukbfQ=;
 b=uDD2DVuwvcHSWqPkBkX9q4O2XgMw/I3G3UdMicf5DW28lc37Drbi8Qzqt0/v7ILMZU
 L+CaAywPUn0QE4FeVo7Eu9pnatZmZiGeTpaMiM9M7Ev6isBPJ8w3M7XS3CphEUTCDlzY
 jZfD5IVedKVnuDaJVmFZiK5l8Gz9u0gBXxr1Verru6g9jFYDOI1itEMFptPTnhS3Zs16
 uWkt/5kPeJdFnwUeNnoKWd5N5Dd3D9LxkHfqFDyD+11iD3C8YxzUwqz9AcE/UG3iwFBH
 2/SNN7q85MV2oRUs8NwyUyG+vbW0ZUYOKHneKbUWhFuXKZXsoq89fW4CjYb7Gr7Byw34
 c5Mg==
X-Gm-Message-State: AO0yUKUW6U+zIyew+1Kj6wQCsjKIFqKfwQOo9j4rKBUEcp/z2B+vhWfZ
 poteuArtMlUot+7wNbSxqI8htWWWaVKg+FY5wHC6jZeW9cWKwHsVKJu1zQS+sRupXL9XuqX30Mb
 TOUiKjB+x4V2h
X-Received: by 2002:a05:6214:246a:b0:56e:b690:9bc5 with SMTP id
 im10-20020a056214246a00b0056eb6909bc5mr7860825qvb.19.1676399836497; 
 Tue, 14 Feb 2023 10:37:16 -0800 (PST)
X-Received: by 2002:a05:6214:246a:b0:56e:b690:9bc5 with SMTP id
 im10-20020a056214246a00b0056eb6909bc5mr7860792qvb.19.1676399836240; 
 Tue, 14 Feb 2023 10:37:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j64-20020a378743000000b0073b275607f0sm7218758qkd.65.2023.02.14.10.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 10:37:15 -0800 (PST)
Message-ID: <3354c941-a109-c67d-865b-7a6fea7c6cac@redhat.com>
Date: Tue, 14 Feb 2023 19:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] hw/arm/smmu-common: Support 64-bit addresses
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, ola.hugosson@arm.com
References: <20230214171921.1917916-1-jean-philippe@linaro.org>
 <20230214171921.1917916-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230214171921.1917916-2-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: JzkjrCWW14sj

Hi Jean,

On 2/14/23 18:19, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set. Ensure the IOMMU region covers all 64 bits.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  include/hw/arm/smmu-common.h | 2 --
>  hw/arm/smmu-common.c         | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index c5683af07d..9fcff26357 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -27,8 +27,6 @@
>  #define SMMU_PCI_DEVFN_MAX    256
>  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>  
> -#define SMMU_MAX_VA_BITS      48
> -
>  /*
>   * Page table walk error types
>   */
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 733c964778..2b8c67b9a1 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -439,7 +439,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>  
>          memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
>                                   s->mrtypename,
> -                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
> +                                 OBJECT(s), name, UINT64_MAX);
>          address_space_init(&sdev->as,
>                             MEMORY_REGION(&sdev->iommu), name);
>          trace_smmu_add_mr(name);

