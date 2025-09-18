Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D181CAC59A
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:27:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGXF-0001Lr-M2; Thu, 18 Sep 2025 11:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uzGXD-0001De-25
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uzGXA-0003FW-UK
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209216;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KL5XphfGve3/sGWIcFqGeYJJAdQnhKsRbINuS8YWb0o=;
 b=cjTRIokJ1cvNz/BynNoI/S98IQAuxZfCnvG0OkzLT8gEFFiPiZ1vWVHCXP1bV1+DXGLW7h
 0SEjevT8s+DeRAKeZAOlSb3hQfHwPgsE6/fdrw8v1ZW7q2aUUUv7uL1cXBf2eJ7E7oNE0R
 yH1ZjtbfR9SP1ZX/DC/BP5wikv1yOgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-rXWu-KwUMOCC0zoUT71GOA-1; Thu, 18 Sep 2025 11:26:55 -0400
X-MC-Unique: rXWu-KwUMOCC0zoUT71GOA-1
X-Mimecast-MFC-AGG-ID: rXWu-KwUMOCC0zoUT71GOA_1758209214
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b98de0e34so11242085e9.0
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209214; x=1758814014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KL5XphfGve3/sGWIcFqGeYJJAdQnhKsRbINuS8YWb0o=;
 b=oPq380t+wWdqPazE0SPjky/CZHpSwJZfxc8UEXX8aYvsQ/ngzQur5p9Zy+tE3WN4BC
 Lv7MuDXo+nbtmLzRmecm/gKCxhzWpLG2zZCUdGzBbCO5gf10/RBVDMkg4hLl7w76e0EU
 YwA8+06+kmRsg6JiCRoqk5wMSDcHFZQuegdare9GOxbbEiZ7wpTV7R1/lXzNyyOfBkqk
 ucH/Y+hGnc7ZDx1u2EgmlWtj9du7XIa7WFSz4kBWuDB8/R7JEVEGi6PsrC0i/Bq3tQ0r
 fje/dgSAeKdtxeVKN7qnlzFH9NZ0qul2SoF6Wf/xr1tlFRLcfABJvKc1xCl0CrFfaUKN
 ZiEQ==
X-Gm-Message-State: AOJu0YxdbyaqmFA6B3oPye0Wt6X9jmMpsxMncDA0S4gNSTnw2zSQ76uY
 WqsWT8/HdrA77Ppt97Qdl+JxM9VrYbLvwuLJ9mvaHMBMaz9TSntTat0/FKRsOI+1Y0QOcC2W+9L
 rqgGBEDdbTjbs+YVfy0apzAX/mzFneNV5QjL7czvgMWv32YQOotTSAg==
X-Gm-Gg: ASbGncuxlk6jIDcNetFjxWc/++slJnFU5/MooLSgCet3emhgEY94onc9gQAHQ6oc9cC
 sY2txJx5yIftjJDJlR3a1pQwD75YbkQ5YzgxIaDnWgE4s14KFF+EsZKNyI/826VC/+aLRlyP0al
 8HgmlG8l48p8fc/xJGZOB9Sx8q3LVdSG/x2GjHVOIwxLciZoqAkJwlL3DVZJceKHN5Duj0KUdY0
 ugra0BLknqOOKzVeEpCTnMGv30zmJXhfq8DSJWZijBVrgsEOW5MYM37IVT01XZ4CHb29CS6Tc8t
 YAY8k4obwhzeacUTokditJL4w5FTVIMnSgLft2Dao99UUfmeM39JRiYIAWHdN5MBdFdwkTjulsK
 7+t4jkKkWioU=
X-Received: by 2002:a05:600c:19d4:b0:45b:8f5e:529a with SMTP id
 5b1f17b1804b1-462031b1dfdmr63298585e9.14.1758209213815; 
 Thu, 18 Sep 2025 08:26:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAFdhxqAFtJ5xKzXqH5L+rh3q+f9wj0clvTRsPw0BM11XcNBfnHbnLBJBzjrN/jbBhLHWSaw==
X-Received: by 2002:a05:600c:19d4:b0:45b:8f5e:529a with SMTP id
 5b1f17b1804b1-462031b1dfdmr63298295e9.14.1758209213397; 
 Thu, 18 Sep 2025 08:26:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d68sm4154041f8f.10.2025.09.18.08.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 08:26:52 -0700 (PDT)
Message-ID: <6a4651a8-d6ea-4bcd-9f73-3e852f9904dc@redhat.com>
Date: Thu, 18 Sep 2025 17:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm/kvm: add constants for new PSCI versions
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250911144923.24259-1-sebott@redhat.com>
 <20250911144923.24259-2-sebott@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250911144923.24259-2-sebott@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mewWeGKYAz2NY_Tu9Crm4RwuPxxironm1LHu_fUZASA_1758209214
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/11/25 4:49 PM, Sebastian Ott wrote:
> Add constants for PSCI version 1_2 and 1_3.
>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/kvm-consts.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
> index c44d23dbe7..239a8801df 100644
> --- a/target/arm/kvm-consts.h
> +++ b/target/arm/kvm-consts.h
> @@ -97,6 +97,8 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
>  #define QEMU_PSCI_VERSION_0_2                     0x00002
>  #define QEMU_PSCI_VERSION_1_0                     0x10000
>  #define QEMU_PSCI_VERSION_1_1                     0x10001
> +#define QEMU_PSCI_VERSION_1_2                     0x10002
> +#define QEMU_PSCI_VERSION_1_3                     0x10003
>  
>  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
>  /* We don't bother to check every possible version value */
I would simply squash this in next patch

Thanks

Eric


