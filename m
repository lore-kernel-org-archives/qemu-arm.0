Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF65ACCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 14:59:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFw1k-00088L-5s; Mon, 03 Nov 2025 09:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFw1i-00087o-P8
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 09:59:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFw1c-0007tO-My
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 09:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762181954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUMmQNsJ4EY099ozgwM+CkiCSbJhC+x0O1MF0oGmAhk=;
 b=L9fvLEbyK8h2oOxslqkfx7Ixdd6RcFktzcXjdy+biXymZCwDyVNNXhSplqhoOspBv+ULYc
 Q/io0elgtjah1Ks3hjfS45VbUKCYq08AwwkUwfjQUYaHuZtY/TTgkQOB9V3BfQc10KcFrs
 8vgPnkaW+2fWroUqZ2R/tBopkQc/erM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-fqA4b0tTMkOOUGFGGI9R1A-1; Mon, 03 Nov 2025 09:59:13 -0500
X-MC-Unique: fqA4b0tTMkOOUGFGGI9R1A-1
X-Mimecast-MFC-AGG-ID: fqA4b0tTMkOOUGFGGI9R1A_1762181952
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b2ef8e0133fso593281266b.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 06:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762181952; x=1762786752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GUMmQNsJ4EY099ozgwM+CkiCSbJhC+x0O1MF0oGmAhk=;
 b=OC9CoaJT2OMuGhCJiLDNmuevUYKAaEKoHAsgSfawvoZ+HhlBC8zLAz9sCm+eLQEYr2
 9BlsRAodieALZAYZyd4r0qoDRQs+51hb/3R9neVZ+LEhU697tIL/GABHqC3DKZM1fEiv
 7kvpY9pnVcI9eJN6zhT1shVBA508wDI2+HxhaNqshQnolkN0fvcGV/ZGVeSIz64RGHXr
 dteWEH3ZbfTW+26P2Jg9uhh/HM4HFyG+yVLVlvuwF/8sPGftxB5vN9Lga8jsMAmg7bZ1
 b2jq4iQh+GjADR2gAdk0qUKVyHcYfgkLWY0KbQzoNVeD4mn8dNIR6UQDycCS0ojEzX8/
 /wWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLDiTrQ7YT+MFI5mW+tbmykwXwqJ7e1tyiw2WDE/Po97cDKIGB4ozOMtVxaz43JJXVuxKetm4M/A==@nongnu.org
X-Gm-Message-State: AOJu0YyYpUbM5PMSuX6CfD9XNsBcE2XWpjRwaOBdqwLbgauM1v30wpOW
 YgyMNd1SEa4vOtXIv0B2XVA5CB/LCpJtr6MQgCCRl+ZGof0DIfkrLLrUbMT6TZ05IPi6Bds18P3
 Pb9xWWEb57eNwpLldKWP40tAmqJ6Zd+1UDA8CAHEQ7WNtb3zAHkkCJw==
X-Gm-Gg: ASbGncufBeYTk9ouOFBj7l/pk8iR4RgiVcrwW62LhMdJg77I8TPzuaiauxKnF9TUDrJ
 tcRh3OtJFlD5J3WiIq+BJbYyr8W4eFzrKdSjpsS3R1ebnP7IUq0II0afeb4NS99ggNe7xJT3Yh/
 N88+sD2blH+WmMkVGnRKJwUDID6+zHMluzWijQUU1HrAF5SnpKP32fSD4/14ztvwXKKEZ/Xgjgw
 FgooLn5zY0GVyD/87BaD3cUafB4ygrv09xKh7h6d+dTwsR9s78XJryDLUe4VcJIWpga3hGQEpy4
 FGjmPTJtPgkiEZtpTed6UJOx4OSQ1bOuQ9Q/WvudBXznyVu8r2blm59sb7YZLfYnSFDyYNr15RH
 ZYm5Lg+1i8ZSritQ+3IV3Ayvbp7tnPyYM3qrXzgP6TUno/w==
X-Received: by 2002:a17:907:9803:b0:b70:b3e8:a363 with SMTP id
 a640c23a62f3a-b70b3e8a77dmr620036166b.48.1762181951629; 
 Mon, 03 Nov 2025 06:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwFfTJUrJCYQIjTbtGM01p4oXfFcMhzd+xiooBthSfCpLtbyXqo5hOPPpRTGrTznxF7WXWDg==
X-Received: by 2002:a17:907:9803:b0:b70:b3e8:a363 with SMTP id
 a640c23a62f3a-b70b3e8a77dmr620032466b.48.1762181951151; 
 Mon, 03 Nov 2025 06:59:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077cc4918sm1043588266b.57.2025.11.03.06.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 06:59:10 -0800 (PST)
Message-ID: <1a4e33af-ff47-4a6d-aec8-54eeec4ea2ab@redhat.com>
Date: Mon, 3 Nov 2025 15:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/32] tests/qtest/bios-tables-test: Prepare for IORT
 revison upgrade
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-23-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-23-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8l4ckE5RQO0qmHHp0Q0mU4DDmOJ8wvk1Uz2Xwyysy9M_1762181952
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 10/31/25 11:49 AM, Shameer Kolothum wrote:
> Subsequent patch will upgrade IORT revision to 5 to add support
> for IORT RMR nodes.
>
> Add the affected IORT blobs to allowed-diff list for bios-table
> tests.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..3279638ad0 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/IORT",
> +"tests/data/acpi/aarch64/virt/IORT.its_off",
> +"tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy",
> +"tests/data/acpi/aarch64/virt/IORT.smmuv3-dev",

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


