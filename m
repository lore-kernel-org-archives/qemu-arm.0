Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp702076njk;
        Fri, 24 Jan 2025 02:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXs9x9CLZ5XG+h8n+OWfn0ceFY+WZIPMraB4cBcF5h9Qfd16WpRdb1il6f/WuyWT9m7yjrEtfO/+E/fnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEkbsQu7wxTRUxNfKp53NPSKuIUHXpdz6V3OmF5pEY+ROv1ThdhmKIWq9aEp/sMaob472s+
X-Received: by 2002:a05:620a:4502:b0:7a9:c129:5da7 with SMTP id af79cd13be357-7be6320be98mr4313697485a.29.1737713316743;
        Fri, 24 Jan 2025 02:08:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737713316; cv=pass;
        d=google.com; s=arc-20240605;
        b=DbfgKwE8Vyolree2dl+C9Tr9v4sEXi08dpjhwyjruR9cdVWK43sIiMjsqrV0OMqAW+
         fyWMZBIsVQFlAYSHwvQ/VC5bdkMD80Lz4fhuOJ+QG7IceeS/sLnR47QU62ozKM71dFF0
         0piw1M4Pz/bOivWjnB9greg/sBkBTukbV7Lw7hSp0Rb4ojVHIB87bwF1MZiKz64wQYPw
         xtyDy8b9gY5ga7OlCfueqDUbK8LkAehrb70xnp7bhUyFfovR4I5CjSqLQ5UqVZ68gq2d
         5RnwIoDOUXdvMQ42sv5A1/dxvmho2XfT+BH4hFUaSPY55sta31+/qabtNSEtu0w3E909
         g0dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zBjlmnyL+/0MoaysJf/6GyTT+XbsU4a0p4ksOTJUm98=;
        fh=dA9VXOWRTCIv4BpX4e/w80eYjDpIJIWF7X3O4DHI5tA=;
        b=YXLcbb9nNevUHcww+kzrSWT7uFUq+2011TOlAMN2na29XGatMh1BFdXdNXJBtbkRi8
         7/o7fBk4O7FjJ2xiYYMO/6SKRsIBjeUylt1cn6PrBzq74l9kzDvT5YBO6QfQVhJLI58a
         SDTjYwRdMrvJFjV9FW4HDythP+q9eIf8YT4Cew1oohHHuqAE0lJFRXjy7IcYGwQ9+f6m
         VfZGwUHApSFFw0236yBOTDDYBWojWUNUtNoHuS9S+xZQSGDD8KyBrlot7ii4zJuZwaqo
         oSrojp5oRLmTKdFHSsqSpudD9Nv6lCLrtEad45JJEA2a68D5t52g3GYtYhXIeG29Meyh
         W+ag==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QH4wvdbb;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487785-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487785-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-487785-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae84513si189533485a.99.2025.01.24.02.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-487785-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QH4wvdbb;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487785-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487785-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8998C165B91
	for <alex.bennee@linaro.org>; Fri, 24 Jan 2025 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6612218AC1;
	Fri, 24 Jan 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QH4wvdbb"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE31B87C3
	for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737713315; cv=none; b=AHzUr/uGyK7/J+H/d7pEOu6SPTNd1Y42zy425Jyjmc8HJsMfwrYnJIVckh4AejYM54Eop2qd40E0VvrUsP7X0gMxing+o7l0V4nRSe/2PaQZH5jHn6zP9DULi0H+HmBE90IP4k04Rtn1ylud6AM8zi7nRdUCnJI9mZRZRmr9PGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737713315; c=relaxed/simple;
	bh=UPjWokmlA8OtBKXL7jjtZMVlBk+VtuKKuM4pngRYpVA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=doMJCcDlDLW8zJEMdNrwD6lNPww/PkfhiJDDOOeV9ZtXbZfrnZdJfnriULHv+YSvZQlbIhVzFY3ZizP/p7eT84T+Hmh8WpRCqdPv2NJmfL6lK6OuTDZMJ/xp/sH3CgOf3bLZ7iL06/yTBEed7KMAeUFCwOPmlojzFhtG2Diq994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QH4wvdbb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737713312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBjlmnyL+/0MoaysJf/6GyTT+XbsU4a0p4ksOTJUm98=;
	b=QH4wvdbbxrdS7JDkJ7fjegEAkZtX+frm+yDD/dAguID0ZnQeoI6J8aau/0e5FL4OYgFgU9
	jE9QXqnPyIH/3+50C/nF0tFncML602OH/0PLm5Bs+tv5Yh+RzeEStgwcyl4E18pdkD+BHA
	1uVopChg0pW0guo7IeHX72tTZ9R/p3I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-eNFRHU5FPVi2tJXEULO25g-1; Fri, 24 Jan 2025 05:08:31 -0500
X-MC-Unique: eNFRHU5FPVi2tJXEULO25g-1
X-Mimecast-MFC-AGG-ID: eNFRHU5FPVi2tJXEULO25g
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38a2140a400so1471558f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 02:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737713310; x=1738318110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBjlmnyL+/0MoaysJf/6GyTT+XbsU4a0p4ksOTJUm98=;
        b=FUjVTCXVOsyg6lNiKBs0UoB7Gw8PAKuNurb3asjsfkhdc1sSal3iM15PACmN6z4C4Z
         daG/3fkXzIBgxhvahvbPZ0VAnjv4SzoZ1/nHS2kOWWGHgFT48nghNIvzL2p32QlO5bgA
         RDXN159balIPp+yLSvOY7c/W3O0qZUpyLwo3hGCHYC/BOVkCzkQxecjSrhEzK8meAIhi
         /L2LmpxAB5huDX8yxKB4g1BGPS5KDCdmpDns0XeNZJlGOoBE0kz9sbLs5wOw8YhZLVPg
         qmPPjUfj2QQgUvjYl/uUd1JBOEhIXgC81KiWrtNtHqCIDWfLEscLX2sLLqWw/E99r4N1
         hZMw==
X-Forwarded-Encrypted: i=1; AJvYcCX1eurZz9yXO+MJOVMukYVayw3gOujac2GCHqUtSRK6Gj4bY3mJrhnVBjPnSPGE13qLqDCEVA3NJ4P/zW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC5bA0k6/OLM0ULFDwLhM9VxorSYhZ0sz0Jb5KpkUrBJGY8htT
	GViah1l0xomuFNUlP9KIgKBy/y/rrbW0lQPbtVp0+gU0r9q5nqO6o9hAgBPrs857WRaqiNzQpR1
	VRCThDZL8PJXax+5ixPzpc6E6Fu8tte9S1qS1ngA/dPmQFFm9gVo7WVgU2yTCYQ==
X-Gm-Gg: ASbGncvjeBHvUcTbnT8n123ZEIP5aAz4gp0y8IZtADpzx1MNs47HJokCddxU5qFWhQW
	KnLyyLIg6k7BhA0UcIUXQ1VwFw8FLpwOET4gFglumUcgyDmhURcqGCHTnoM1Y478GUNRebGGikZ
	Y1rlug1GgGs2xxaOGL6qzrkn9Edh2Cb+sHYUxT1zW7le+GR6/tvaxpJKhgvgC7ggvsZ95N6FpLz
	ZlUo3WI/omMXSzUKBcqu8x9TEIb/ymP+yy4HW9Uv3ZjsRzOJEt6IcNeS46UHyf832MmC6DGQR8D
	aUu5l9jPMT54/qiuElWCVmQ4OfBUlBR82l+UW5TYQA==
X-Received: by 2002:a05:6000:18a7:b0:386:4312:53ec with SMTP id ffacd0b85a97d-38bf5663683mr28298501f8f.17.1737713309875;
        Fri, 24 Jan 2025 02:08:29 -0800 (PST)
X-Received: by 2002:a05:6000:18a7:b0:386:4312:53ec with SMTP id ffacd0b85a97d-38bf5663683mr28298453f8f.17.1737713309454;
        Fri, 24 Jan 2025 02:08:29 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d5d4sm2183937f8f.21.2025.01.24.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:08:28 -0800 (PST)
Date: Fri, 24 Jan 2025 11:08:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] acpi/generic_event_device: Update GHES migration
 to cover hest addr
Message-ID: <20250124110828.3a2b92b9@imammedo.users.ipa.redhat.com>
In-Reply-To: <6b79da0dbd8d735e93c15c4673bf2af61e8c34a2.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<6b79da0dbd8d735e93c15c4673bf2af61e8c34a2.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: pI3UCCMTSsDt

On Wed, 22 Jan 2025 16:46:21 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The GHES migration logic at GED should now support HEST table
> location too.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index c85d97ca3776..5346cae573b7 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_hest = {
> +    .name = "acpi-hest",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static bool hest_needed(void *opaque)
> +{
> +    AcpiGedState *s = opaque;
> +    return s->ghes_state.hest_addr_le;
> +}
> +
> +static const VMStateDescription vmstate_hest_state = {
> +    .name = "acpi-ged/hest",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = hest_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
> +                       vmstate_hest, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_acpi_ged = {
>      .name = "acpi-ged",
>      .version_id = 1,
> @@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>          &vmstate_memhp_state,
>          &vmstate_cpuhp_state,
>          &vmstate_ghes_state,
> +        &vmstate_hest_state,
>          NULL
>      }
>  };

