Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1284245lfc;
        Wed, 20 Oct 2021 00:13:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU6bh5Dhhwj9FrSGTWg35lRsIp1BUqGQlrrihQ5u/chR4TKn93kLlw83uCO5Pl4o0zw1wY
X-Received: by 2002:a05:6808:f13:: with SMTP id m19mr4005830oiw.37.1634714033536;
        Wed, 20 Oct 2021 00:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634714033; cv=none;
        d=google.com; s=arc-20160816;
        b=apUgF198a+/fWBFsdqf4PgTeK8vYqmxym2ga/YKwceSX75zduhEKR4+htvoRxIM0/B
         WL0WXQHTAp710F0uJ1hEtOIpZ78zfCfTDpHkBizRGZc/LNAJcvEIfm+H7j3UM9/66Waf
         TZpMzeb4iIsFIAQIk1f2mz6rcSMuYs+riy/JU/5ME/25vsdr3v5dgPYU0qUoBxOPnQ59
         SHurR4tdhTUsFUuvbU2UqSpsCZby3R6V5vH7OsVZXNLEmLpRkhXqUP9N4QjeqS3oRSGv
         aJD8SqbofbMwomp77ckXFEP7XJaQmWwX5L7SgA8xAQsTgv62vvVn4AXchfqEK6b6DOAc
         EhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ICPZpJ/7+RJ6DTaOfS5Iu2KAP/XMMrirk6OivVUbS0k=;
        b=hWYsb2X94ZwCMHTSNCbmcxxf6aR9Jmb2cOTFBVybmNAYMCZSqpAFvCyzanlLa9OZQC
         ccEsAtm3c9h78xBkAO3w3UL+GYrJtRlX3t89MEGk23LChw1YNkwM9ctrEpGJnUbsCQ3v
         rkOYr0s4E22zozsXXUKkfwg3CwRYQYCetKnKGsobEk/4Q8Uf3DpRSvAvjlgQ30j3IA/4
         MGLK4fLYAsA6zu/loGqw4sTl+bpuEn5jnLiuqcHQP0gk7H3MEJ8112il3pvQJKH/cv+X
         zqml7ooA6so2+LtKR7+/6HDRMisAC1KyzVRuNiJCQSLGdAuOaj5gXd9J+zbQMT8KdsTR
         Jugg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OsZThno6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si1468723ooc.20.2021.10.20.00.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 00:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OsZThno6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1md5nM-0007wt-QR
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 03:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md5mj-0007wT-CS
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 03:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md5me-0002ti-VZ
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 03:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634713985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICPZpJ/7+RJ6DTaOfS5Iu2KAP/XMMrirk6OivVUbS0k=;
 b=OsZThno6m+RaUJHZn9WKVdU9P7fvC3CKRa+s3JcoHnakvAtcjDMd6bLmE789btC6LLs3EM
 9M7QrwWu9diOrRtBWI1Resy3NueiVJ0AxZvu3WcF4thtZCHehWkGVP1xA7FOjNKCf6aZ7P
 fFcYyAzWGG/Bujx/pMFX5h5a8NFaJ6M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-yPlcEkqXOeq2--E6Xgzyeg-1; Wed, 20 Oct 2021 03:13:02 -0400
X-MC-Unique: yPlcEkqXOeq2--E6Xgzyeg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a05600c0ac500b0030dba7cafc9so3676069wmr.5
 for <qemu-arm@nongnu.org>; Wed, 20 Oct 2021 00:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ICPZpJ/7+RJ6DTaOfS5Iu2KAP/XMMrirk6OivVUbS0k=;
 b=3gZl2QD2UxKeJbVfoKXFO/juq0U89VJXB7Jm2dwM0Y5+DiwSmbOOXKrV0mKkeeleYW
 8BeurrSg33nurJ1NtxhckgsWKc1/s62nKT/wQDJf4GV7QjtxrV0iAvLWKauJUDTGfYI/
 m4hyYaEvPrJAEVQAcXNXV1wLvJzaeQuLZXVzFV7FduOyHcJBb1772qpgQrf/VrP3D54f
 n3xteIt1wpczvAqAqdAn+jzxIOQ50BIr2ZJ49BzpCmP1Makom6ouHFK/lbdZhMRsk6QA
 b3xWNCOTj/Yym/5Ti6XHuQsuaQXT8WJmX6HG8fquB5TtIQAMdCanzUNO04L77LjEwA2L
 fAUg==
X-Gm-Message-State: AOAM530Lv7p7tGs7YyOJBgD6JgGDHshts5+kvWONpHD4TdREVaciCS0x
 6j9YCEgHqgRVWdk2RDsVn+mvAmCF6RKCUgeGJEJOoRE3K99clPeb9rZUphucVOTzzuno7HPIYpA
 uGER9pxuE3NHw
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr32248852wrq.18.1634713980906; 
 Wed, 20 Oct 2021 00:13:00 -0700 (PDT)
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr32248827wrq.18.1634713980701; 
 Wed, 20 Oct 2021 00:13:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c3sm1144855wrw.66.2021.10.20.00.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 00:12:59 -0700 (PDT)
Subject: Re: [PATCH v8 6/8] tests/data/acpi/virt: Add an empty expected file
 for PPTT
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-7-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <3a626a9f-37de-0487-66cc-408eb74704a9@redhat.com>
Date: Wed, 20 Oct 2021 09:12:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qM5SiO1oc2U/

Hi Yanan,
On 10/14/21 3:22 PM, Yanan Wang wrote:
> Add a generic empty binary file for the new introduced PPTT table
> under tests/data/acpi/virt, and list it as files to be changed in> tests/qtest/bios-tables-test-allowed-diff.h
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/data/acpi/virt/PPTT                   | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/virt/PPTT
> 
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..cb143a55a6 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/PPTT",
> 

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks
Eric

