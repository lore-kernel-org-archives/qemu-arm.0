Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5489586njc;
        Fri, 22 Nov 2024 07:42:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6ePlZ/7ZRW3XP7O+Cq777sR9rsg9dj0KRYYKIeCA3pD9z9yidSWR1ikLY0kVAsDeMQQhC77e1UTLqRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE2GSlRBAbIuBSgKzN7nWljq2sy4XwOWGxeF/9tuoBqzWn3M5cfnI4ywAS88tZJXD7wiVjd
X-Received: by 2002:a05:6359:4c20:b0:1c3:9ab7:eb54 with SMTP id e5c5f4694b2df-1ca7970d116mr270222155d.9.1732290138835;
        Fri, 22 Nov 2024 07:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732290138; cv=none;
        d=google.com; s=arc-20240605;
        b=Eznj0ZuJ/jf9pYWzGEhld90wbbUEMeOgShHRODIQ31pgpEwFYaGfImB8Ewmk6DEGEq
         AGoVie0Ff2EQjwJb9Dhp8BEymOLmhDorHgO+50ezHOlbI/kKPBwpiAvaHlhadTB8vESt
         Akm6sngIQMRb84aAJ9JQyJ59MBe0jXdp2lYebXH3510d0R85H+7cn2giM+0U6nYysyDD
         P9opCN2+aFkaHN04hp+5YdiR98hj/jb8EvkO5vBW3XBCIWcGADj5g6nbcYWVFaA6F8Ze
         7WT2gtlN59wMCOWzZHSV8XRZeqOf8E7yCrUnl746dqzn9O3Z6x2syhXCEOIRHViPVcfv
         bbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=D+yaHaIkSyy8GR8NSGw9v4GihzAiPvpRQjvYO902Fu4=;
        fh=45g6PnCMFuQxrQPYI+sYJ/oqaV3bntcCbirl7brO6tA=;
        b=EYIoX6MJUUSFoOPvt52CjYXVE0Zj6QVQW0+DdFqg9glcK4P7st5L5orlEYPi3hrnvB
         qLVhBfNMsE9RNag1JDFFYAGwkJzeQ4+7tFikcbaksk/hwkxQWBVmy1BhosL+wc3KT0cX
         pvlxNRsqgSFpl2WglsO9L9bEriqq3B3yvwf0OT3kAXoZs2dcGETuERVnQdQuHZ0wR3hF
         TOMvaSGqR+C4qrpKKBNQhc0jH0kdCgQx5QP6tEU3kpHv5D6rZfhY4Y4yDs6s5VNiiZST
         xpbb4RniNi5INpqEHYaN5NW76Sy9bWVlmv0YcLMFFZ3N2OnrNrZog4TWA8SxriT490s9
         N6yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BnAVdp7G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aef61c1271si345455137.497.2024.11.22.07.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 07:42:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BnAVdp7G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tEVnI-00049x-9Y; Fri, 22 Nov 2024 10:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEVnB-00047R-8N
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 10:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEVn9-0003g0-1L
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 10:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732290113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+yaHaIkSyy8GR8NSGw9v4GihzAiPvpRQjvYO902Fu4=;
 b=BnAVdp7G0m0+R+w/RxHrRWKRV15DV0eMNa7pdSupIkD8jP1+FaTp9g1W0frPcNZxy+iQ/m
 81FXukQaV3GIQ1TcRvkn6QVIqI3osexgxQeFKEGjo+WUEsmPjTfOT2t34bb4JoMTobITsw
 Flj3hQ7w6VDWwAlRW/KY3cOGy0/Emec=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-CxDlPPqON7-pKcM2RH60Rg-1; Fri, 22 Nov 2024 10:41:51 -0500
X-MC-Unique: CxDlPPqON7-pKcM2RH60Rg-1
X-Mimecast-MFC-AGG-ID: CxDlPPqON7-pKcM2RH60Rg
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-382412f3e62so1109931f8f.3
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 07:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732290110; x=1732894910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+yaHaIkSyy8GR8NSGw9v4GihzAiPvpRQjvYO902Fu4=;
 b=q3ant1FD8fbPj+axVsaEWiyulU4ix7SZaibPK+//JQKUfMx1JQ6CQyFG3SwuoAzxsK
 f7RRrH23BUd2gYWs4kWdZ7O8Vx4l2eepvR1RA2EBpIHRXWb0CnB7oVK9Otr8b/J6qDDR
 Be7ZbLw1gEvhnzRpvWC7UAJrRRGif7WnDuc7IOz9PP+3/w9HmcuZmsVoxUpmbuPHfWZe
 5qPGJtmhYc0oOMZt92kDUEMF74C72PI5c/sUPBD4tZ5edAazN51L1NJ0Vt1BM3Nq+NX6
 Rw4pZ5T7btxbBeXvjVf+jcW91P7vNYwrjns8+E3skuMphKl3k7suSnfurMWtYlJQRopX
 UzFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoyTkf0buhB13P4Ses8JV9NYlG49IldWHcWKBuH1puyuTTKzshL6pWLuR+eCD31xC/njz/IFs2zw==@nongnu.org
X-Gm-Message-State: AOJu0YzPEJz54sxbgOwHgCwJLoG+92R6SaV887VakhMWmNJcyNo3yG40
 2RyKSFPuulnZSHu9WReYgqHpU83c2ktJSxGkngZx4uKaPuZH3+eGIFsG4ifZhIKxOedAdDC7Wos
 xUaJrhcAHJpzekzSzACTqu/78tbHBsH/hCWAwIeQf09qTwCzFdQ==
X-Gm-Gg: ASbGncug4UpnmLMtNeOChFMlvMQfOcCAIB7HeBvMtBM81FpqPSo+kulWodNQdbr6dYT
 e1yXZ3s1Ko13IeJFthZ3cO0A1MT3JcnFnI3tV9cfssE9tzh+5pIIYH85BAQY3ngCB2+pkApscY7
 +x/787wyHrkUcHkxH+WJzpBCAq/hcNnR2N5UCDfFrTexfV8x642ns1dmwZ6sgp2gslQBNVpusUW
 1RBNP3F6d+k5wx6QdTANUM9tvLM6OrBNGhIi7plsrQaeWYSZhuKT1MIcQW5aPKLOsNU5WbOzVDP
 KjApsw9mCUdmiG0Hz6rK0g==
X-Received: by 2002:a05:6000:1446:b0:382:512b:baff with SMTP id
 ffacd0b85a97d-38260bfaedamr3291398f8f.59.1732290110699; 
 Fri, 22 Nov 2024 07:41:50 -0800 (PST)
X-Received: by 2002:a05:6000:1446:b0:382:512b:baff with SMTP id
 ffacd0b85a97d-38260bfaedamr3291367f8f.59.1732290110322; 
 Fri, 22 Nov 2024 07:41:50 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fd0fbdcsm2680201f8f.109.2024.11.22.07.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 07:41:49 -0800 (PST)
Date: Fri, 22 Nov 2024 16:41:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 07/15] acpi/ghes: Change the type for source_id
Message-ID: <20241122164148.60dc5290@imammedo.users.ipa.redhat.com>
In-Reply-To: <84475e30b69680d93697ec666214482e36cd8844.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <84475e30b69680d93697ec666214482e36cd8844.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U1EveNJVxYRVO880D8R41L5t3LI_dmGqZrGFU8KI_2Y_1732290111
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rpk0eLwdBXt5

On Fri, 22 Nov 2024 10:11:24 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> As described at: ACPI 6.5 spec at:
> 	18.3.2. ACPI Error Source
> 
> In particular at GHES/GHESv2 table:
> 	Table 18.10 Generic Hardware Error Source Structure
> 
> HEST source ID is actually a 16-bit value.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes-stub.c    | 2 +-
>  hw/acpi/ghes.c         | 2 +-
>  include/hw/acpi/ghes.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> index c315de1802d6..2b64cbd2819a 100644
> --- a/hw/acpi/ghes-stub.c
> +++ b/hw/acpi/ghes-stub.c
> @@ -11,7 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/ghes.h"
>  
> -int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>  {
>      return -1;
>  }
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 5f67322bf0f2..edc74c38bf8a 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -383,7 +383,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      ags->present = true;
>  }
>  
> -int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>  {
>      uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
>      uint64_t start_addr;
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 50e3a25ea384..9295e46be25e 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
>  
>  /**
>   * acpi_ghes_present: Report whether ACPI GHES table is present

