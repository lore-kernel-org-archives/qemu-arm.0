Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp856613dye;
        Fri, 27 Jun 2025 05:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMEQOupF0InPPrl0Henk49/vYIjoIZx1b1jZuBysnNOrKfTT32nmDEs9TaUatUG6xrSx0Vd2jdFSYuwg==@linaro.org
X-Google-Smtp-Source: AGHT+IFjM82vS+OdfL6WGYW6GGgnqADQ6yElZyMXHugvtMDNbh6cDOMYQL6++ybWQs6feQqIj/Gr
X-Received: by 2002:a05:620a:cdb:b0:7d3:f193:6328 with SMTP id af79cd13be357-7d4439a15famr464039385a.54.1751026496563;
        Fri, 27 Jun 2025 05:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751026496; cv=none;
        d=google.com; s=arc-20240605;
        b=jrMeKBmuYkuQmn8OXwFGGWCaA7cU4U0im0hfEH7hY9YBrkcTn96h3N6yr117KxEoxo
         6mHjcgxHJeSP7+A1omaafaZULB81JrYU4o+LMUBEJxjBI0nPt/8zZMJ12WqpEly9kQ0s
         ULqtVsk9ej4R3n7g5o8OWKXG6wDTXyrg88ZWQ4gLxq4OnCD8Xb4OKDsSqChnPnPOGUC9
         3DhsKgo2V1CBnYXyQE+FxD+eXrXKqOv3Zk4OseA7BI1kEEfF+vqkKwqEJco+mvz+sr8J
         IdBrgN3vcoEQ09LoW7vqGA+Q7Ts9K7dZh0OH+hRgRlYomHkXWZPJecTxIwXl6EOaQRuh
         ek6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Py3TPV5zuZPrpF/KGzIXmqU+JkJO3G52AmeeZCrSa9c=;
        fh=ylXPPJQDo7Ryig4p7CaR5ZgCUPH9Wyl8qnXsgukKhzY=;
        b=DgA2xQD3ZZpMm++Ylf48puxoD6j40Ya3fLoMYYSQpx87NjmLO1Np9wPXsw1dnO+0el
         zc27Ygng4ojYnsDKb5m/VPck40N9VRYsuKO0aHTwWqXDQS53tyTfOdu77O7U6t31njlJ
         tDqU96tnTA0QOgTd+XnavqYQZGYQHPgXXbtTPqVfXqFKuGRUlS8mjAxS4AxYq/eUhqZs
         UjH7IeJCsyu6powvWatX5mk6ySd0I93SsehOZLuGFY1a6ZHE4E3bBDoWNA+20dCNYANc
         Q+J4zihtiUolqYqzn32eQwxEVYInI7DWkEiwpYUMWFR4+dAaHKQFJnMGzpMTXE0iSQbD
         Le1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/BBrTr4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44327c985si217096485a.480.2025.06.27.05.14.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jun 2025 05:14:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/BBrTr4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV7yE-00022D-2j; Fri, 27 Jun 2025 08:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7yC-00021g-9U
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 08:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7y9-0006YJ-4G
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 08:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751026450;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Py3TPV5zuZPrpF/KGzIXmqU+JkJO3G52AmeeZCrSa9c=;
 b=i/BBrTr4C5lIVc7eeGIA/R3NO+CVWxNcvyEvh0av5BxoAU4+txab4u3yu7O8xMs2VN/p7/
 blKvs19DpwrGZdWbK7Gdwan48MzNPDb1TF2WiL2b9RKl5fWxm1w+um9hQNNQpS4HWJqxoZ
 1zKEtJQE/B8gyJ6pqC+BmGNIp35i9uY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-SjMPx8sKPHK--Q7BA5tnsg-1; Fri, 27 Jun 2025 08:14:08 -0400
X-MC-Unique: SjMPx8sKPHK--Q7BA5tnsg-1
X-Mimecast-MFC-AGG-ID: SjMPx8sKPHK--Q7BA5tnsg_1751026448
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a50816cc58so1098070f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Jun 2025 05:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751026447; x=1751631247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Py3TPV5zuZPrpF/KGzIXmqU+JkJO3G52AmeeZCrSa9c=;
 b=wFHu5xJbVBMUyGTcK+zMbT9awgymelZwXUDcKs3m45y8pVXgKALH/gIiX6mHwvmGvM
 kVVUqk2Wh6naOzey1UwpJuc4ZHgFw/GjMgcqJCrXn6KX4TziX2YoSEEBjj4aUY2NH6hh
 mpBba4bHBhR6ZpAT7teLIYFIXlcG7eUQcxTyMTiWTHIZuviHlo2LNdTJwWJqUSvUnooR
 nnOWRN+4LnX4oTu0EYzEoBWCPyOgdPGIBumqwVXiA4TzeZRtCsNITJRkn4KPkkoh5lpm
 nnU/WrNYqabmL0t3r0v/cz8v6qbMMqDqDEPu8GyBmE0OBG2Jb6sTCL9MiC6/8xm5uLW1
 z6jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6UTE3+QLce966P3oysnIdNxaB3+v02DKn/H1IiCeh5OVLtvw47E2ebYak6A3RxSQ5nq54Hpe/2A==@nongnu.org
X-Gm-Message-State: AOJu0YzqQ2qBBSWjCutAj7DJowh2udo56qDnZs1Oo61vS+bqWMyaIh+B
 2VqDsFTSPPmcX410OJHr8UpRqZcr/cYRPoVAmoHPwIopzlkYf17SIMdJJc/o6AIRv5UjjwL/9nK
 d0WZdmKdvt66m8BmcRHxoYSG8D7epnR50zNNNCFYt4IGkU/c8R8X4Gw==
X-Gm-Gg: ASbGncuHSyDKqsrzd8DshNNoSv4TR0AO8mSmWVYK76Ga+Yby1DBfRmp1PbiDTig/YHg
 J4OWhjC2dWSiTgecXRU+Zn/MmBJdsO9zRLVqMqei4QSvnEemsbfwcui5P03A7qaNcNoRnfE7o7C
 CwsdUEUpIGBMoaF4xEnZLXKhwWYL1Xw7YK9y34Ywav15atCMqtMIGLW8nCeHroYvFK2Q7ggFX2i
 tzl2T2k+IvbuXcnhaqs5ZjBc9hK4qQY5U9OIQb39NW+qWtlXVR6UwPRRHPN+evbmVKPbXHPbBg4
 /Utl9vOx4T95WpbW6d4lGN3XNFTJZeQj18iqF9Bl0LTiH3jnPjxqu8FMQBKpsS6I/aQy5Q==
X-Received: by 2002:a05:6000:645:b0:3a4:d53d:be20 with SMTP id
 ffacd0b85a97d-3a8fdff4832mr2372082f8f.18.1751026447363; 
 Fri, 27 Jun 2025 05:14:07 -0700 (PDT)
X-Received: by 2002:a05:6000:645:b0:3a4:d53d:be20 with SMTP id
 ffacd0b85a97d-3a8fdff4832mr2372048f8f.18.1751026446855; 
 Fri, 27 Jun 2025 05:14:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a406ab6sm49594285e9.30.2025.06.27.05.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 05:14:06 -0700 (PDT)
Message-ID: <6a3c2ebf-ac62-474f-b2b7-a1d017f6c2bb@redhat.com>
Date: Fri, 27 Jun 2025 14:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] bios-tables-test: Allow for smmuv3 test data.
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 gustavo.romero@linaro.org, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-10-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623094230.76084-10-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YxyQKdnno_6o4CwrNPSuv2Gc1XSyLbH0460V9h9jdWk_1751026448
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LuDNEpJQaNt3

Hi Shameer,

On 6/23/25 11:42 AM, Shameer Kolothum wrote:
> The tests to be added exercises both legacy(iommu=smmuv3) and new
Suggesting: exercice.  legacy (

Besides:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> -device arm-smmuv3,.. cases.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev    | 0
>  tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy | 0
>  tests/data/acpi/aarch64/virt/IORT.smmuv3-dev    | 0
>  tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy | 0
>  tests/qtest/bios-tables-test-allowed-diff.h     | 4 ++++
>  5 files changed, 4 insertions(+)
>  create mode 100644 tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev
>  create mode 100644 tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy
>  create mode 100644 tests/data/acpi/aarch64/virt/IORT.smmuv3-dev
>  create mode 100644 tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev b/tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy b/tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/aarch64/virt/IORT.smmuv3-dev b/tests/data/acpi/aarch64/virt/IORT.smmuv3-dev
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy b/tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..2e3e3ccdce 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy",
> +"tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev",
> +"tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy",
> +"tests/data/acpi/aarch64/virt/IORT.smmuv3-dev",

