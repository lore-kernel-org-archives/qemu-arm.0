Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76298606A31B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W13QJxPq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOxTI-0003It-VB; Thu, 05 Nov 2026 08:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xOxTH-0003GB-FI
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 08:25:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xOxTF-0002uk-Ti
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 08:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793885137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F3DnMNYXy0XA5mOEhuGmojm9zsrvbaxmojXfe+5TRcc=;
 b=W13QJxPqtRF+FORyIoMAO1NCisuVZe5mHkehl34jq3INqrKsVKtbFt+za8gqb9L8M53/tG
 MpTk7mYJfAIv4SxAdX4Aw4MA4NdwJVOjgNsWe9wLfNr6JIUxYXRyjBCgLJgm0a050Cc31a
 ih9ILkDS68k+r/jjixVpJ8RgrNjbKQQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-TJ5lTlRGPhOjq6OG-LL10g-1; Thu, 05 Nov 2026 08:25:33 -0500
X-MC-Unique: TJ5lTlRGPhOjq6OG-LL10g-1
X-Mimecast-MFC-AGG-ID: TJ5lTlRGPhOjq6OG-LL10g_1793885133
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a16dc2323cso21207415e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 05:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793885132; x=1794489932;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=F3DnMNYXy0XA5mOEhuGmojm9zsrvbaxmojXfe+5TRcc=;
 b=jsk7J/m+5hmmbiQwrClH6grvBpFvVbIWARu+jGYBtTzr4fY46B932PIItPf9VUbQZa
 DJHYf+loK36zvCjbfewV0S7A2dRl5Obdi1VE8Oy1HBrAQ3RdjXWZTgV5C2+vTLhgAlOG
 hSfQnctMWp03ERnJhip34Uc/9E2rV9MhEnz0zz89hZiIKDnaDjEc0FpXtuwbXmwk432r
 Rssd0ZT/y4SoYxr0gBTt9ycX5HtILLdFO4y7hqPav54XImled9VJyy2pdeQt11IMptcp
 mqmqXeor4TrOG99KV9ogfc3YOmYQCKasfdKJZu+k/1CrTv/UfulwZwwk2MAMYdnW2iew
 h3vw==
X-Forwarded-Encrypted: i=1;
 AKwUvByyDCQWweP/5lHSa440Jyg1VrZoSjEVE8sm5J/fKASHn4/6WvQVaB1UHWmxT2BziPtB7J7UwYu8Jw==@nongnu.org
X-Gm-Message-State: APuU4Z9Ws8PdQhfPDS+5SHcjI9DByxjLljnh/OhKeUSTIFUDb2Wblq0b
 ESbRSMiaZHc7/HuxxvUzBnj75d6G7+MgiOdSsNl+1ihRo1L9iH/oBQQ1VrVispQ2d5Fj8I9j7nU
 z5H5uALGbq7otPw7PYJRi0s0ZoZbVsi5gvseG6AF+7BWn4HZCF1MDBQ==
X-Gm-Gg: AYBFou1H4+UAtcOVCSmwHnZRHASqCpGSeWz8pZ+nhoCC1ji42h2Op9pzGQCFsGwApv7
 GT0/exIFvfqmoF/HC+OCunBYazioCD2R1deWem5sKRtqHgeiaVEe1b6QReZEVfFWSgDkSGdMTIE
 UBcciUtH52zPCc0uQs77ZZswWjEjuvSQyYFfPJjirCfqeBh55ACcY7I2MmrJIrcfggr1AYUXFTp
 ft78GPSXy5j54GMS/sbJRyuOf8unqpjml7AviYA5eIqCp/dc436esVwxIgxrEyqGlh+2uR6n7SU
 SyDVbxvN4zfdXZhU65QXpRmNBXhLkquEyTsMTUnQ0pu4nkAanD7Emb2CDY0ahuSWw6rPyN/d9hL
 +IafwlVpmNqqXMAMAJynvA07qMaW2WvT5LHbYJSBEbwVLr3FJmrlpfWKlH7oPIrhPdS56i2JeQJ
 iWyhJAvj0eSQ==
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id
 5b1f17b1804b1-4ac18b7df2cmr443549415e9.23.1793885132504; 
 Thu, 05 Nov 2026 05:25:32 -0800 (PST)
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id
 5b1f17b1804b1-4ac18b7df2cmr443548845e9.23.1793885132016; 
 Thu, 05 Nov 2026 05:25:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:1292:d530:6448:8ad:27f1:8b49?
 ([2a01:e0a:1292:d530:6448:8ad:27f1:8b49])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b433ebd278sm116811565e9.3.2026.11.05.05.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:25:31 -0800 (PST)
Message-ID: <a56f747b-3c00-4cfd-a981-279e1fcb28df@redhat.com>
Date: Thu, 5 Nov 2026 14:25:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] hw/vfio/pci: Replace deprecated sprintf() with
 g_strdup_printf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Alex Williamson <alex@shazbot.org>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-9-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20261105125203.40320-9-philmd@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: erZL8jsQZDt0Rxg48e5aim94r38FvBcvdG2IrlMl5KI_1793885133
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 13:51, Philippe Mathieu-Daudé wrote:
> Replace sprintf() by safer g_strdup_printf() to format the
> host address, silencing -Wdeprecated-declarations produced
> by Apple clang 17.0.0.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   hw/vfio/pci.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 0da2e143b88a..eea96240b7c9 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2857,10 +2857,9 @@ void vfio_pci_post_reset(VFIOPCIDevice *vdev)
>   
>   bool vfio_pci_host_match(PCIHostDeviceAddress *addr, const char *name)
>   {
> -    char tmp[36];
> -
> -    sprintf(tmp, "%04x:%02x:%02x.%1x", addr->domain,
> -            addr->bus, addr->slot, addr->function);
> +    g_autofree char *tmp = g_strdup_printf("%04x:%02x:%02x.%1x",
> +                                           addr->domain, addr->bus, addr->slot,
> +                                           addr->function);
>   
>       return (strcmp(tmp, name) == 0);
>   }

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


