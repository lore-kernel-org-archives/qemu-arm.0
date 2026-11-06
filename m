Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48C606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d0d+E4Hd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPIH0-0005KG-5F; Fri, 06 Nov 2026 06:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPIGx-0005JK-Nc
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 06:38:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPIGs-0002e3-Kj
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 06:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793965093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vxedVB9T0G83yMeRDfIDyzcOuTFvsBZ3LW5A8WJJi1c=;
 b=d0d+E4Hd02isDcuypryT+iY++nOtiMDbwX5N1bf4oEdVLNrEmTiBEN9XEbOdhzIaO71O/8
 PScTMx+v3k83eUWuBCWntGawHMrg8IWozPz7ItAUdOr5HWVzG83xSA0Q0JoFdCg43mgT8F
 qcoQ1Z3QdC5VYbHNNvGWs/vRXiOXNTY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-5z5jAKmlN3S0PzzbhEfaEg-1; Fri, 06 Nov 2026 06:38:12 -0500
X-MC-Unique: 5z5jAKmlN3S0PzzbhEfaEg-1
X-Mimecast-MFC-AGG-ID: 5z5jAKmlN3S0PzzbhEfaEg_1793965092
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-49337a224a8so226708f8f.3
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 03:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793965091; x=1794569891;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vxedVB9T0G83yMeRDfIDyzcOuTFvsBZ3LW5A8WJJi1c=;
 b=vnqUuAyRf0V9TS6b0GpNsSuyWn6podseaCIZygm9/kD/ZD+TfsmLnfNGjBZbYwtVvh
 rYccbNutf5NFDkbIVqyYMG3pdQJ9V+vrts8xLoEHyGms/1J1NODxkobksnHdVjjKDpna
 VBzbY4iatq+LhKJuyTX5UQsUonH58Fg7sxIj0naq8uv6Wsycq3+gx0duV7pQ2yLIruPu
 UzQuhxYpLs5+ZK1JkgniZ1tTk+rV4n5sphOeBaZXGmFNYgp7X4yAz+cD+Rfhz51NjTTA
 Tgaez0L6OdgV3UPL8h6A47sMHko4j8Jx6s2YHcxEyhBZQn1Fmz0gCdemouWFlFt3kEk/
 S2jw==
X-Gm-Message-State: APuU4Z8N399AI7Qsl/HRAM8akO3PZVrcFPBJ1KL9aIKcLOsf4ntqEK3W
 xNEkSSz37yWNhTe1mG07Pr6nWzS7lSbT/nr40I1KHXGGaA+agD9vhfIlcz+dtDkGvFqpRwLxou5
 HLtzavnhtkVoDkm7g90Djg/dPaHCw3SRKgayYxEImhPaWMrQZkDDkJg==
X-Gm-Gg: AYBFou1p2XzgY5nWRNrfwsYDj/XJjN4iHqvsUrA+moWAGOXaH6jgO2KnQm8f1f/DAew
 luY9c1CujQM5gBSPf9w/6A4jdKZ7er+zONKTaLitNUz9IHj8RToUsJV1PN6RdiaX3gtn7KXECdR
 TmZokzEc2/cymQZkHD4P9vKtGvp8CHQtHhG59Rimuoas0niMBgUJ2uuoGBb5gc0+G9Hy3R2LX4c
 LRC/rAbRxWTrtiwCA2Mob/41CdbY9pl/HaTMYMh3g8nQasvjmgKq5j/vGUSOunEixNnqdgkVXrW
 oCk57G8yqAk/OUUwSjRn/0BM+Wd8UrhqqW6uE+ba6mnUMM3Pm1NCSp1ttu0JbSUXQaiSm67woPB
 hgB+IabhKye6pcVX6cOM7otRgYoiu4v9IlCQNboTjvBtF/+ZjsrNr9uN68L4uOXg5uRVaRDD9ac
 rLanRgtGK0xA==
X-Received: by 2002:a05:600c:630c:b0:4a1:e0db:8cf8 with SMTP id
 5b1f17b1804b1-4b6db1c5edcmr35283105e9.3.1793965091622; 
 Fri, 06 Nov 2026 03:38:11 -0800 (PST)
X-Received: by 2002:a05:600c:630c:b0:4a1:e0db:8cf8 with SMTP id
 5b1f17b1804b1-4b6db1c5edcmr35282835e9.3.1793965091308; 
 Fri, 06 Nov 2026 03:38:11 -0800 (PST)
Received: from ?IPV6:2a01:599:b03:7322:436f:1f3:b26e:91b8?
 ([2a01:599:b03:7322:436f:1f3:b26e:91b8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6df5eab6esm65073015e9.1.2026.11.06.03.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 03:38:10 -0800 (PST)
Message-ID: <b3820b45-7d26-4b4a-aec7-cfcd5aaf5d96@redhat.com>
Date: Fri, 6 Nov 2026 12:38:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/28] hw: mark all virtio CCW devices as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261029131241.2275706-3-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N2OVaNtMiRiLLUTsBs-zqBWImyZ907RStK4HrOrCTrk_1793965092
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 14.12, Daniel P. Berrangé wrote:
> These are all intended for use in a virtualization scenario and must
> provide a security boundary.
> 
> Acked-by: Eric Farman <farman@linux.ibm.com>
> Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
...
> diff --git a/hw/s390x/virtio-ccw-9p.c b/hw/s390x/virtio-ccw-9p.c
> index d8612f7cd13..08d3ee577b4 100644
> --- a/hw/s390x/virtio-ccw-9p.c
> +++ b/hw/s390x/virtio-ccw-9p.c
> @@ -64,6 +64,7 @@ static const TypeInfo virtio_ccw_9p_info = {
>       .instance_size = sizeof(V9fsCCWState),
>       .instance_init = virtio_ccw_9p_instance_init,
>       .class_init    = virtio_ccw_9p_class_init,
> +    .secure        = true,
>   };
I wonder whether we really want to include virtio-9p in the list of secure 
devices ... but in case we reconsider, I guess that can be refined later, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


