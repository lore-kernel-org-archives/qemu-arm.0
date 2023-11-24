Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1370825ejj;
        Fri, 24 Nov 2023 09:06:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Ouk+vs4ZnDzY3e6ENOUGZ9oK+arVKAx+rKRVmdDJrompweEw1eijsw9cvTMkCyzMj30y
X-Received: by 2002:a0c:ef89:0:b0:67a:1e5e:f6af with SMTP id w9-20020a0cef89000000b0067a1e5ef6afmr1534275qvr.43.1700845578626;
        Fri, 24 Nov 2023 09:06:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700845578; cv=none;
        d=google.com; s=arc-20160816;
        b=e+NIwQuqyuFB9mmUm43fU6YLA9snyBHdoLdBLCa1OXjSxJGn76kxArTDeTvqdXAzAD
         BLauCNnB7/augATh0Q/+NAtlKG2WVi2AcgefRQu8M6i7txzTEAipcWHYawga/7GhJ29W
         ySWGH8I4/7iM51yetGi9aJbZ9Ehfy6Di1TwlEHgnAFbIYuVHstseTo/t4SMJ3YZEU9yD
         uI0clB8iDpMMyVqNChJdaQy9UdmyDO/CqtgdilnY8D8G3krqo9YbuuCWt2AZN0H+iRlP
         fEP0FTnzBGOo7o03Stcut2TqJn0Ssa2MCGX2VojRaFpstPKw00WmIogclLuafJsjBTxY
         sLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=xtTS7VWZZodDkEoGcaQwdr9ldk1hufKS+IMIeCB9hzo=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=fEMBvlJ4s4kythK7eOUCEQ56uYBPZFXl16k82eijWMdCTSRJxqh3sH/V6+5Z7h1u6G
         SwhZQsJdO+IGw/3j/A6nswC8yg9NM5FGudRToAd5dG3gzDor8nPqc3njn40y+C52nS8l
         ThEpM2H7GXku9qe6KJEzd7eUT1BFmmkjblOIC9iB3xdak0QBzgHup6RuzJiC80no9Wxk
         EJo+eWYpkwW8w+MUkpGwpVn1WRkN/Of7gc7p+G5zQwuzxFroYh/MG5Vn44l1DeIZmR2g
         gdxVQXplp02ScX/vV9ybwRGnpRk8UbKw9WyhuUaPTC9tPwDYD+3+GWthmXJ8hihzPir/
         kyRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jv34bNqw;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o7-20020ad45c87000000b00678e7ff706csi4114720qvh.171.2023.11.24.09.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:06:18 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jv34bNqw;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700845578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtTS7VWZZodDkEoGcaQwdr9ldk1hufKS+IMIeCB9hzo=;
	b=Jv34bNqwRCOXCi+18CS9S0eMuxKSgmswoHFI9uxFl8LDh3GT+132hlhkBfgBCWx0Wwt/Cv
	96X7WH5RoSB+fd9FeWRJ0JHUP0LJ5oLtfcZW5tq32o0HtP9koSkO++Ij3H/18xNr9clszd
	J9aklphqsoNLXb2QHrByzlMnTdKR6ys=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-HCLB2YGqPweISJv4scGC-w-1; Fri, 24 Nov 2023 12:06:17 -0500
X-MC-Unique: HCLB2YGqPweISJv4scGC-w-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-679f44810d9so20212996d6.0
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 09:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845576; x=1701450376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtTS7VWZZodDkEoGcaQwdr9ldk1hufKS+IMIeCB9hzo=;
        b=K4nDFQFUOEzUhPpp9FTpO5m8+7krFV/Pl3cc6/Zmz/7mdADv3ydQn3ILSpWeFnNLq6
         3qrQogRiGrZ6O+qpQ/sC+hkqznSBzM/k9mmKBOCrttIkxAm6QvFr6CBe/OjuK92khQCl
         m0biMFW+yl+Vgrt9EazVgKnDqDNHqaY9lYY6h/AOXVqGbG0pOF3ROM+9MXZZAvzd0bw+
         1EnBD96HueoHnzdhJEyCcK3ezugS9VbGF86YkTw2XwLiIEuabSOmGhoIx7CAf1VV6mOa
         9R8n/S3KRHGcs/j1vMdXoCvSBSqwIb1hxU0frYPeSRJAwWPphKnOGEunwOLYMfWzE3Rv
         7OVA==
X-Gm-Message-State: AOJu0YzwB1UY9aePwCqc/E1KGeYbU8BYlfJN8t7NYSvl8bnxkAcWYwiY
	i6DZlVrc7/fDcoznGp548W8w34nJ5oPJ5S6V8fxN4M+GBLomYHQzWSU0h81vPQiIBYDW44RdBJi
	uEpU5tyWESlhouIz/
X-Received: by 2002:ad4:4dc6:0:b0:66d:fac:33f9 with SMTP id cw6-20020ad44dc6000000b0066d0fac33f9mr3532908qvb.11.1700845576787;
        Fri, 24 Nov 2023 09:06:16 -0800 (PST)
X-Received: by 2002:ad4:4dc6:0:b0:66d:fac:33f9 with SMTP id cw6-20020ad44dc6000000b0066d0fac33f9mr3532870qvb.11.1700845576574;
        Fri, 24 Nov 2023 09:06:16 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id pc13-20020a056214488d00b0067a22357681sm115081qvb.59.2023.11.24.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:06:15 -0800 (PST)
Date: Fri, 24 Nov 2023 18:06:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V7 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU
 Hotplug Event Bit
Message-ID: <20231124180608.25b7f75e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-9-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
	<20231113201236.30668-9-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: KXnIHfspb4AI

On Mon, 13 Nov 2023 20:12:36 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
> and non-hotplug events like system power down event. Each of these can be
> selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
> the CPU hotplug event.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> index 0bd3f9399f..3acd6fcd8b 100644
> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
>         0: Memory hotplug event
>         1: System power down event
>         2: NVDIMM hotplug event
> -    3-31: Reserved
> +       3: CPU hotplug event
> +    4-31: Reserved
>  
>  **write_access:**
>  
