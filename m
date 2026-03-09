Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF8EEFCD6D
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 09:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzWlj-0003ld-Qn; Mon, 09 Mar 2026 05:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vzWli-0003lC-2l
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 05:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vzWlg-0004B1-8c
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 05:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773047954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N3yMJzLs3F5Anq7A90bWN79v6moTXl8yrGvPTFX7mlw=;
 b=LiRVVrbUtmjXAq+8MpHsoOG02gG8h+Yq4EVmlsixZzaHKF9EwVC1SkTc4fnCU0XoMtPPPw
 X8G76aGPkFVRKuxt51Ve7SC2woYz1Jx8Hx1nIrEyFeDMuKcQkRMxVMqluyd2geCnW8HD6E
 KbfjzwGjjROjmdModj7bkq+nhiS18gA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-0i-Fx-RzNayApth-6EWV7g-1; Mon, 09 Mar 2026 05:19:13 -0400
X-MC-Unique: 0i-Fx-RzNayApth-6EWV7g-1
X-Mimecast-MFC-AGG-ID: 0i-Fx-RzNayApth-6EWV7g_1773047952
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4837b6f6b93so91317955e9.3
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 02:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773047952; x=1773652752;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N3yMJzLs3F5Anq7A90bWN79v6moTXl8yrGvPTFX7mlw=;
 b=Y/Cgz+7Cy9F7A4CdlSiBuXC2Z++/QXVFOArMC2wMo4GGwNL8oyXAB1mZGKGs0Trotn
 +Z2zqJUPopO8qLx8sDBVLA7b+Eo9bOEBJiV1XEzthxyY8XLcBlPIHswYEJ8XDYcGp9jp
 OivjMpAh3sqAX+9DqRabwO9EH6gp0SxzjIGVjyk4HR/CLOdEmR5I7SICfC899cj6Qpmw
 5sSZUl67HSEGCTPrLhUAgg+o70Yej3Zml+Dusr21RcjjyVmgW+8OG122MOeWBtxFNObQ
 GytEMZfZ+UOB5xU+LxuHQ/QCyy9omv5zJYYQPjNIw3MjdbEgz2gRVDhdze059VSW0O1R
 8Nng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcbg75NPW5GNezkTCfY7u8dHCzurWuC+Temop+roVJULKGRTdbjQAyNB/XNbtz6yO3/F88DeLvsg==@nongnu.org
X-Gm-Message-State: AOJu0YzHHPsH8BWRFdBMWC5jyfjIKktr38Gbf97kvTsZm+dfBEbcvNrN
 HewOD0lpNsvFi+IHL2yvOOW8Nz3amnqfCcYo6FRUenoWq6zqcUY/gjJux/TeQfblJYE3wL0nqre
 p1IP8AdhWcjCxu4rw7V266Ig4+YwL+lUyyE6uuxU6c4UemGCWJfKU6Q==
X-Gm-Gg: ATEYQzzRQa/QoAAiPVs4Pd/BxmHsyJ4bsow8DUPb4yvovkbhEfajH6co+6TuvsaiMr0
 TtoMPdBfeSp9tzu9VixmnyqorK4aYDw36aQlk2YQGEJWGCmz7Zx3VNe52QYEUotmW3YwEUKl7/+
 Yh4mJG0e7JlDnDQoj4cFx4QFSdMTTUNhv3M3yijd1leq7vWfunhOWKi0usK/vLXeVWimv2VQ+5B
 RvzGNHwSrTawPCMvxf7vaTucjZ+PZx/2VXkPbLg8EMZeioax0bPlBKAxZa65zAT6Yg8oO2O5PEl
 OIMOlOodkX05v5TOHjqgk/N8TeMXvajtyu1UQRPUKbse9IFZerJJ0zP1RI1Hyhx6rBrGnzRrDM1
 BBtwlsqG+OwLfrlL/i6JVUIdGhcwO6sWX+fFrAr933DERLOwt4Txn2wHz9oiR
X-Received: by 2002:a05:600c:1f0f:b0:483:badb:618b with SMTP id
 5b1f17b1804b1-4852696758emr161079455e9.24.1773047952015; 
 Mon, 09 Mar 2026 02:19:12 -0700 (PDT)
X-Received: by 2002:a05:600c:1f0f:b0:483:badb:618b with SMTP id
 5b1f17b1804b1-4852696758emr161078925e9.24.1773047951509; 
 Mon, 09 Mar 2026 02:19:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae56300sm24644470f8f.37.2026.03.09.02.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 02:19:11 -0700 (PDT)
Message-ID: <af77b92d-9303-4ed0-942d-6188e00ccdde@redhat.com>
Date: Mon, 9 Mar 2026 10:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Revert "sysbus: add irq_routing_notifier"
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-6-shentey@gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260308203516.160103-6-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fYLX-MlfZ2PvFzz9MYvjhFtBR-00QcUEcoqae_lLIJ4_1773047952
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/8/26 21:35, Bernhard Beschow wrote:
> The callback has been introduced in commit 715ca691daca ("sysbus: add
> irq_routing_notifier") for use in VFIO platform. Meanwhile, VFIO
> platform has been removed via commit 762c85543948 ("vfio: Remove 'vfio-
> platform'") which was its only user. Remove this unused code.
> 
> This reverts commit 715ca691daca081108b33306faa6fa102f0df8d8.
> 
> cc: Cédric Le Goater <clg@redhat.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/core/sysbus.h | 1 -
>   hw/core/sysbus.c         | 6 ------
>   2 files changed, 7 deletions(-)
> 
> diff --git a/include/hw/core/sysbus.h b/include/hw/core/sysbus.h
> index c0d18d9e00..f3c4259d29 100644
> --- a/include/hw/core/sysbus.h
> +++ b/include/hw/core/sysbus.h
> @@ -50,7 +50,6 @@ struct SysBusDeviceClass {
>        * omitted then. (This is not considered a fatal error.)
>        */
>       char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
> -    void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
>   };
>   
>   struct SysBusDevice {
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 3adf2f2faf..3e1160ee92 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -104,13 +104,7 @@ qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n)
>   
>   void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
>   {
> -    SysBusDeviceClass *sbd = SYS_BUS_DEVICE_GET_CLASS(dev);
> -
>       qdev_connect_gpio_out_named(DEVICE(dev), SYSBUS_DEVICE_GPIO_IRQ, n, irq);
> -
> -    if (sbd->connect_irq_notifier) {
> -        sbd->connect_irq_notifier(dev, irq);
> -    }
>   }
>   
>   /* Check whether an MMIO region exists */

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.




