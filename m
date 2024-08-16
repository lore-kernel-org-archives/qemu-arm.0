Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1096171njf;
        Thu, 15 Aug 2024 22:44:37 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXfq01IvOLUvWuXuCPhJUaVivzk59GQwSizYgDws7JZRkGA86UMK37jWzlPpaejndFl+NRh3nKOIp4576wDcjM6JxEzBiZm
X-Google-Smtp-Source: AGHT+IEwExao+ZC1in3h/ydQf75YLVOeoYbkPw5WTvooz5U9d7dEDgDRC2fURdgRsrj1TKEBCz6d
X-Received: by 2002:a05:6830:43a6:b0:70c:934c:b1e3 with SMTP id 46e09a7af769-70cac83bfffmr1983246a34.1.1723787077208;
        Thu, 15 Aug 2024 22:44:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723787077; cv=pass;
        d=google.com; s=arc-20160816;
        b=A8Qkta9a8s9jY9VGaIVgZpeE1zQnfyI/RPFv/e3SGb3iK7PuJHcvEi3GfL8kG+BU38
         T9K5V5qLZZjFOy3LKuLB8c+GGrBvweVM06Q9T9/v1mCKuLKqvoppKgcNxq0f4sDSkkQu
         GfcqXxE32NW948e+i2ozZ5ienyrLFapiuqUs/tLtdMThsZ6waLBeMeK6T102M3GSlwXa
         D0/4sqi6LKIOt1TobV92FMzfdmctPz5+XeLzJ0G1LeqWs74FsFW3rN5qoFigvBzMAfK3
         p42yPYgF7pzH77+e7rVSCsPOVu+vp9bdz323JV3P31q/P4Vg4ddclfeKybzLRcAij1zR
         +25Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:from:date:dkim-signature;
        bh=NNl/f30TgEToijoSQ4Zdndp131Y1LmeqKfWq9ZHo0KQ=;
        fh=mH46p7TSAuxFlSJ5xNY+BFt4ePCOY0Sv0ryYCOsCm84=;
        b=HtreUbL6g0PbBOV6g0pZo+vkCw8xVfgBJI0vPwocWu4dW5kFfJeaV/6pOeaGs86gSd
         41RxQjYByQQcVWP3O05O4gTy7H1u0p1tNLpJVdg25I8IcWsc7soNZuucdZlp+bduLOuI
         Vab4Yas2To0Isryh9ffjKsyrUWbx2yRURfivjLTtPVj2GZpEYCApEKeQwIoRGHiTq++j
         ijQEGDYwzl7Aeg0YB/lJvwhFoNX9+tXzZN+GkRHWIMFUWh+HnLYC2ED+Tmoz52XpuYdC
         u+pw00s101hAS6wzQDhSiBJUQlrEieftC8hvnGSCAx5sc1KzcdolHLLZ2ITfI8dzRxCA
         52uA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IhiRtDoL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-289014-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-289014-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-289014-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7c6b6357765si3002035a12.330.2024.08.15.22.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-289014-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IhiRtDoL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-289014-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-289014-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19B4AB23D75
	for <alex.bennee@linaro.org>; Fri, 16 Aug 2024 05:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918E579B99;
	Fri, 16 Aug 2024 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhiRtDoL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53740770F1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Aug 2024 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723787073; cv=none; b=MEEqtn57877AXLXqD9Wrm5Y08xyzIE/54DB6keIW+UhR9iq6B3I5U/WsS8wHDfP4sQ2pc3dEjrxN3zsTONBq2wxHD31sKLvDG0QQZKFTBmvAcFMl8SEXFHkuxJWPBipGtoQzcPqOcrXR+va4eK+vKh2TMNLauoCzJyaW1Hv/yBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723787073; c=relaxed/simple;
	bh=o6LQ3/gXegMy3cUs5qQqcnaVukWZ6nZIPla8WlD0N+s=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sK5WF7Ei5Y6GwFDa9PC17jSlgiShUJXvwAanVS/96VuA6xgPm/KCqaV1itDoLslTqqNZfPGf9dZuW9aqI7S5m9q8eTRItZG2lgCqBwf3FKKI+o56/Flxb48SAUT+0yWXQE3OZuFEmLh8RDKSAfeDXytAdxVrQZNuwjoJhTncMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhiRtDoL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C248BC32782;
	Fri, 16 Aug 2024 05:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723787073;
	bh=o6LQ3/gXegMy3cUs5qQqcnaVukWZ6nZIPla8WlD0N+s=;
	h=Date:From:Cc:Subject:In-Reply-To:References:From;
	b=IhiRtDoLKm8lZjTy9j5xvhz+Mhi9jLbiqV55O5b4PAMebp2zW9lInqoI76EkGsFai
	 8p/hWCuV4rjtZnpN/TZTpnLpaQhEi6I2OqFsagmSQLCKSj7wpIPNevwiPZJWWWVpP7
	 ZyGEaCAK4p7RdwIeNsdEWBsjPOXwhxilMrOXB7y/DMJAkkMNWZ3bJKKw2QK+oUKdf6
	 N7PVBaVrv0ni0PLufC0oALoj49Pi2uAYl8Oy7N9Ba0ZXe2D+/QnJKHr8XXf1+YHf0h
	 qtGSjAQgcKS2cfKUKCovMCJ3SAgCUpQpEZcAAZRBc3GW8jZdjmd5Oc5bnMXyqKTt77
	 VrVELMRT8Mz1g==
Date: Fri, 16 Aug 2024 07:44:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Igor Mammedov
 <imammedo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v7 05/10] acpi/ghes: rework the logic to handle HEST
 source ID
Message-ID: <20240816074427.2c7ae7d9@foz.lan>
In-Reply-To: <9f5843c6f774035e80a7a19e0091c347edff9d02.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
	<9f5843c6f774035e80a7a19e0091c347edff9d02.1723591201.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: +tbYekb2Z3XH

Em Wed, 14 Aug 2024 01:23:27 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

This hunk is wrong:

> @@ -350,9 +380,10 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>      build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
>                       4 /* QWord access */, 0);
>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> -        address_offset + GAS_ADDR_OFFSET,
> -        sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
> -        (ACPI_GHES_ERROR_SOURCE_COUNT + source_id) * sizeof(uint64_t));
> +                                   address_offset + GAS_ADDR_OFFSET,
> +                                   sizeof(uint64_t),
> +                                   ACPI_BUILD_TABLE_FILE,
> +                                   address_offset + GAS_ADDR_OFFSET);
>  
>      /*
>       * Read Ack Preserve field

It should be, instead:

    /*
     * Read Ack Register
     * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source
     * version 2 (GHESv2 - Type 10)
     */
    address_offset = table_data->len;
    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                     4 /* QWord access */, 0);
    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                   address_offset + GAS_ADDR_OFFSET,
                                   sizeof(uint64_t),
                                   ACPI_HW_ERROR_FW_CFG_FILE,
                                   (ACPI_HEST_SRC_ID_COUNT + source_id) *
                                   sizeof(uint64_t));

Funny enough, even with this problem, error injection was working.

I'll be preparing a v8 with such fix applied.

I'll also add an optional patch at the end to double-check if the
links are properly generated, using an abort() in case something
ever goes wrong.

Regards,
Mauro
