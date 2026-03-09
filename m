Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F107FCA16A
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 18:08:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzf0C-0004CW-FZ; Mon, 09 Mar 2026 14:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzezx-0003tY-7R
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 14:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzezv-0006g5-RE
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 14:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773079591;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/alvkQgr1baGbx0ARaryDIBCWnm7KJLZWRPA88ESYY=;
 b=ip9vvP8WQnA7Ef65kvsNk/jJjDnsK02xuh9D+8+8QV7kdjDiGTO4FDqEwwA6kVCyAhtVQC
 oArhFEStPAz8YoDWUpw8TrVWNw4x9Hyw6GPCBNt37NoXGPWa3GLr7WjQ5e/Ry1bR82YMXd
 VwAxeyZaYZDX7qOaIzjuYqtAp/stqxQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-HzSRvXsENx6mIt3FUqXrwQ-1; Mon, 09 Mar 2026 14:06:30 -0400
X-MC-Unique: HzSRvXsENx6mIt3FUqXrwQ-1
X-Mimecast-MFC-AGG-ID: HzSRvXsENx6mIt3FUqXrwQ_1773079589
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-439a9182148so6332388f8f.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 11:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773079589; x=1773684389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/alvkQgr1baGbx0ARaryDIBCWnm7KJLZWRPA88ESYY=;
 b=lOsSlW95l8hpTlH4jtEw+5lBRI2nbTX9FGbG0/3PK7bScts7QniTKHxapgEM7Rd1JM
 mCWBiKXfQ3EO3MqomIbBdWz23tuMjULd4XqVYleopQmzF43XmPQNYf6+JNYJzOKwnEy/
 CgbSlsZReeBD/29j9lYiQhXyt2je6nrUNYHCwkO5rQ+ro1CRuq8ppl7J2TtWv+eB5+yV
 mejN+ZE6QWMm4CeLrDsvpTNNgt8vOJ8QTGQYoeqf1M9II8c+wohdzevmmYSfsRlCF44h
 jHckF1B59v3BqXVb+yJ74xAJ/H3LOOYazja6BYA0Va02XvJKCA/fitB4tVx7WPkvf5Wk
 dzbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/OLxuM2CONlQi+UAnnd+RV7U0LAWWisKJ/PMZk8jh3JGJ0FtS7UncsZdTN1xUgDBJapsBZhZBwg==@nongnu.org
X-Gm-Message-State: AOJu0Yzudu2SGEv+HPebi4952jlvY7XV8SbBTG/gwIdQ1/b0sheNxaXT
 L6dNrh3H47Bgqh9Q4nPtIDDKtkzCcbC7mFVPQ9QMCkJfemv5gbJmMJ50I7vUch+OAvVFTIMqS+Q
 HBBTBl2cHyxBOwOZY2LS7UwoQB2jGJyKIVoajL3qyx7TWuwVYdRTyMA==
X-Gm-Gg: ATEYQzzxQO7FW3/q5fEU9UH8iau2/0f5oFkTGACk3ySvbSx6jhGEEwbmtHKAL27ip7S
 GIP8KQDPkRkDgd3rdL+OF6hOvirdm2OTkSapAdarR1gTXuiqBO3SEzSzJLcswd6R/TVjwCyIwix
 VegzBhfbly78uI86drd2IvahMfAae+gTCn+d5L/6x96cc4KCARCyg6SqWhjOYYuxPM26h6Sk+f1
 5eILk5aLWZQMS2qit9SF9PqXidY5nxs+cktjRggNV5tJcUvSSy7IXD57aIZ+vxtzgsvgkYWAlJj
 di833fRaaOmXWCr7y98XQeDDVlBhN+BUHQlVpxhKo8+z88EldXEVnY9L2oTpw1j4eJifFgUi4Bl
 nclsTRWkKZkI/czWk4hW5YWI3N/TNW+hFUhhc6ihWgb8zorRJ5RXoHSYb5gLNC78DaU7q3w==
X-Received: by 2002:a05:6000:2404:b0:439:abcd:b312 with SMTP id
 ffacd0b85a97d-439da64f787mr21908503f8f.7.1773079588753; 
 Mon, 09 Mar 2026 11:06:28 -0700 (PDT)
X-Received: by 2002:a05:6000:2404:b0:439:abcd:b312 with SMTP id
 ffacd0b85a97d-439da64f787mr21908447f8f.7.1773079588326; 
 Mon, 09 Mar 2026 11:06:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm31525004f8f.32.2026.03.09.11.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 11:06:27 -0700 (PDT)
Message-ID: <16b4f960-61a2-4e30-af2f-a4267ebc425a@redhat.com>
Date: Mon, 9 Mar 2026 19:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/32] tests/qtest/bios-tables-test: Prepare for IORT
 SMMUv3 node identifier change
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-28-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-28-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GrB0KICgorCMv4hVLKpXJLQ4wQXqXmq4eSwDzsy4VWI_1773079589
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> The IORT SMMUv3 node Identifier field will be derived from a new
> per-device "identifier" property instead of relying on enumeration
> order.
>
> Add the affected IORT blobs to allowed-diff list for bios-table tests.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..df5fe417c0 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/IORT.its_off",
> +"tests/data/acpi/aarch64/virt/IORT.msi_gicv2m",
> +"tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy",
> +"tests/data/acpi/aarch64/virt/IORT.smmuv3-dev",


