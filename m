Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp342635ejb;
        Mon, 13 Feb 2023 08:23:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+gKOn25ZSoOq8EJt6w6C4MWd9Ph0YzRo5rf0eqxYSS4lzydnKsv7a9cQUckNIeLDHIvywI
X-Received: by 2002:a05:6214:484:b0:56c:37d:51e with SMTP id pt4-20020a056214048400b0056c037d051emr50814358qvb.22.1676305427718;
        Mon, 13 Feb 2023 08:23:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676305427; cv=none;
        d=google.com; s=arc-20160816;
        b=I+A7gEoQEXzuHf3APhoKwhmoyYkgakbN9bad2nRe6SHvoDa7d11nAVAeSx0uAKjf/e
         3VAsRTgzRmtJPfobzYM9yQ0kPpSh7GhRHH0Vh4X5FBbAhNb5PUY3tC2COu8Zgh2yo+mA
         c3VMMFO72KRUz372b2U/Dvh42wlPZAB87hYAIFTCfRpS7rHBffwWJTUk8WWmPpgroBaO
         +ONwDc4g73DvywCz/0SpxxUWXYS5RdlV25PVaTtaHhOgHYlEZMHUT2JtQmPPXRP5na7X
         0W/bTmoPU6MO4ZlWQNltBFdrNjHx48pi3xk3JFWHQuGy/RvgomkKpPLH7eC/snfXCPoV
         qDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6hGiCD0ViewYamTmD/veg8Esu+9d8OzIfLb0/JHUxF4=;
        b=N5EVAsMm6j2cticy7HF14Gr6iRzYClReIr+Pnak8EcbWWlySOXz6VCvbVqA+Yp78/n
         ipyISrL1um6FwdoF8hJhIiOUAL//XqTTx3rK9cGaZ19gUXGz0FkmiYruHI0FSXCe7lP6
         RRL0H4TbPWlKfvMsl27efq+1M5r1is5aBovEL/A+bzpI5WKmHJJqdh0wQYhv0aFHkEtd
         LleVisjBB7fGmaS+JV2mg93UpDnLMOG2jFqKAKT+LlO2LY3T8ekiq2MB4wFnwMiDNMuG
         JIOa+MFaPcsWdwJ95YSn+bJsgbidJQ90PHKnqb0grvmK1B6DfoTauq0ovoyiIr/umjrh
         oIxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DzaeqDDb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b00708f1b0f43esi10311061qkp.37.2023.02.13.08.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 08:23:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DzaeqDDb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRbbO-0000QQ-Ty; Mon, 13 Feb 2023 11:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRbbN-0000K8-5r
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 11:22:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRbbL-0008Hd-HE
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 11:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676305366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hGiCD0ViewYamTmD/veg8Esu+9d8OzIfLb0/JHUxF4=;
 b=DzaeqDDb4YywqU1a7RWVG9DQNQJyaadYpYXr0EPpSYET0n6TmPLvS5eicyARNgq8DyVRbS
 yAOsJsVZE/YA8BJAiPyS4znF+dT8dml9hktJszvLYDK4j47T//3zIvnZQ+GiHGaxE6Lz0S
 go363zpAoVM/Ydq9fHktdHyRI01ivOk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-nRemWW4nO6uzk3c3nmTkEw-1; Mon, 13 Feb 2023 11:22:45 -0500
X-MC-Unique: nRemWW4nO6uzk3c3nmTkEw-1
Received: by mail-qk1-f198.google.com with SMTP id
 ou17-20020a05620a621100b0073b2dc0e161so2736998qkn.12
 for <qemu-arm@nongnu.org>; Mon, 13 Feb 2023 08:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hGiCD0ViewYamTmD/veg8Esu+9d8OzIfLb0/JHUxF4=;
 b=Ag+MVH0qSHZUP21CeULgWNhA3y7Heu4tcd3QSQhEap8oGPHX7FiAxiy3Fp+kBDzP/m
 hFMHbz1W4Vi0fimYf8DQs43bNBWoke6Xkkj0szFgadvh/e00b6blzfQcQF/a9v1FP7qj
 qM0Rcgpha2V/tRROt1tHIifCy0XU3vmSX/bhXNYEjmQEs4b5O3afUr12I8wyMQJ7kL1j
 A5AXx1/GgHFhxkJCx06Al+J5d6WIZn9y8mR9w8hinOEDm9n9PVkAWtsGYc5l53EuyjZh
 HL9j4v8TXpGEmp/yZ/1v8+YC9fYxEGzLRF6muPjPHxYXufYRNji8Dn+FyT7Wh5Rfish8
 Eqzw==
X-Gm-Message-State: AO0yUKVGllGkESq4psICnPywoCMhLmMEhjVUn0ZE33NaabWkwexI4cI2
 cLTrRdqZ0cFd/1/VY127PTi0sajSnIS/A1//JNArJ6DByaPITvQ/6AWlaR2rcxFvsJDBNLbeAWY
 9m5ZGoruI76YS
X-Received: by 2002:a05:622a:112:b0:3b9:bd05:bdf1 with SMTP id
 u18-20020a05622a011200b003b9bd05bdf1mr46039333qtw.14.1676305365162; 
 Mon, 13 Feb 2023 08:22:45 -0800 (PST)
X-Received: by 2002:a05:622a:112:b0:3b9:bd05:bdf1 with SMTP id
 u18-20020a05622a011200b003b9bd05bdf1mr46039294qtw.14.1676305364818; 
 Mon, 13 Feb 2023 08:22:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a21-20020ac84355000000b003bb764fe4ffsm9677032qtn.3.2023.02.13.08.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:22:44 -0800 (PST)
Message-ID: <6b4712cb-e084-b0a6-7c07-db24e2068427@redhat.com>
Date: Mon, 13 Feb 2023 17:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] hw/arm/smmu-common: Support 64-bit addresses
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230210163731.970130-2-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: Sl931iO3SgpW

Hi Jean,
On 2/10/23 17:37, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set. Ensure the IOMMU region covers all 64 bits.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/smmu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
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
as SMMU_MAX_VA_BITS is not used anymore, please remove it.
>          address_space_init(&sdev->as,
>                             MEMORY_REGION(&sdev->iommu), name);
>          trace_smmu_add_mr(name);
Thanks

Eric

