Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp811251njl;
        Wed, 2 Oct 2024 06:21:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcRTL2BuJXRqOvw4cceUBgM82+dLkhuVxWu8PEtYm95YmQEsnvHgT7c/D2DkOLSAcKFI2A/+sqXml7Yw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZ8lPDcvg97hkRiVmzSS2Qd82LV9U97LveD758Et8kjixO2qt+6VNdnTuYVCEERzrEUprK
X-Received: by 2002:a05:6358:9394:b0:1b8:1131:d10c with SMTP id e5c5f4694b2df-1c0cee92a59mr145440255d.27.1727875302802;
        Wed, 02 Oct 2024 06:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727875302; cv=none;
        d=google.com; s=arc-20240605;
        b=Dk3C9jpGplANW/PsXSocr55gPCu36FvFIama9VW9GtxbkU8wt+GrbqhO1rrHdDZL67
         DPQlB71CjIVvraKbxV6AkbcyBl1YvmQ4b2SJEuOBsWdOh53+6ccvvvbr5nf5gDxRDWpW
         WOoONTgD9u2qKY5lo5NOonAjHnvGltSOEoK8m/Z8UmTnPJba6oKmQvWYgavq9jYJoz1u
         QaYyj1dZSpFlP8PIu3c47l21tysnJpzhzuY43IoD8fYnLLioVzXJbR+WCF+uLQHV38qC
         8whB3K4+SAMl0RCnXuRnem7o8BP01Ik0g/r9VfYd+4Zr1YYvv8hcSduweEsZPDJ4cgAb
         iIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=fi2yz8P5s1N+bIPUltlWoEdasaEDLb+ur9FDivcVwJc=;
        fh=Du0MhO+aEKlfroFkRfaUuJr6/Lq5UpKhjZy+EPShmEY=;
        b=QfxIr7goXiG1WtUIO4tJOjIYeNXn/C44R4LCIfWdyLsZbtvW9R6TBjsmk51C8NBRDP
         K0jUutGBZ+wll5xzRY6niD7BZR+VzjDw35+2rTjxY481vVwIIEC1vkVWOS7nKqKC2+Se
         dGtc63ARxV5CguQCIFN02V4TvpPaEYAzaYnwWNyPrnrZOi6Z0O71QSkN6wc7koTgEcfk
         W4Spobu/gxgoR3VrUlCIA996RUpsaBEMosFPC/esz025xretI30t1amOAdP6McU5V5Pg
         JNt0rfCfef1GdbLESwv0TAxS/zlugYnGdO75zU/hmOEIIDIVEZEKqJ/Hdgiz0aqzBJK3
         Wq+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8R7Gw1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b686372si144052816d6.322.2024.10.02.06.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2024 06:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8R7Gw1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svzIQ-00045U-S2; Wed, 02 Oct 2024 09:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svzIM-00043n-RN
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 09:21:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svzIJ-0007SR-4I
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 09:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727875290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fi2yz8P5s1N+bIPUltlWoEdasaEDLb+ur9FDivcVwJc=;
 b=U8R7Gw1jd81iFVx2ayV+BRPWtTcUPAZizWqDdzYAkImqvQhgNivdGawB0zICZo8PmlWd+4
 M6O6ttXAQQK9gRmLVs6ofdkMuBq9AaxkGkklcxEsAUUNDRFmDhRr27nSg1yjLo21PL1T6Q
 vkar+J+kPBnpO2qLy2hLELuDU9piF44=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-7toygBE3OI2DxupPYvNr6g-1; Wed, 02 Oct 2024 09:21:29 -0400
X-MC-Unique: 7toygBE3OI2DxupPYvNr6g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cbcf60722so52514595e9.1
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2024 06:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727875288; x=1728480088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fi2yz8P5s1N+bIPUltlWoEdasaEDLb+ur9FDivcVwJc=;
 b=vFQX5SoVa5GnJ9IQSB6LzFxwySs9IB5kwGq6RBjQwfSj3DBeBFNdZRmEV0j+3Z5qVd
 uUImsrMUdw/e/Kq4XkEbKog1JiO+vfwEWgTEjARLMjjPwGpy3QS8dja7cI/aVvfZDkP8
 doo959aIhDwb+AuTjaERjyg3apH1d8kdkgyUg158ThEfii+VWa8J7ok0k3WoJYsqyFs5
 UlHRDbUD2pZ99YU0YbeTPPN5e9FqLrU9hikWHOn4FtNmU1mSDmJ8Pxk3ib34kacF16to
 PjyZCdmcTkBA3nYfyD9j3YxvW/ZSYbZSaFuEG11/6ER8Z/YNk4eC7KdKeDJBeJCT41Gj
 xkMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE/0cvIXc56wAp1FJ3p1IX1Mvh7EBVIpHgE5L1AlJb3HDa+koxKbapulcHQdpHio5uQj1BrtKQYQ==@nongnu.org
X-Gm-Message-State: AOJu0YwmCus7IOBH3aUTMz4ykg5ok+v/OSrDnywFpaoexuXcNmgkBhr2
 XUtn5ZVkxA8HXG+IRci5wccV/hf0FUfEBd5saB3cuOOVUdnhmOLE3Q2pbM6yhpJQmYaTp57bmwi
 95H6RLFg3Y3vQEj5e3kXOBdAKzz0e/4ZkYna85ne+V1TagMT1Dg==
X-Received: by 2002:a05:600c:3b11:b0:42f:5209:f82 with SMTP id
 5b1f17b1804b1-42f778fca07mr24075775e9.29.1727875287932; 
 Wed, 02 Oct 2024 06:21:27 -0700 (PDT)
X-Received: by 2002:a05:600c:3b11:b0:42f:5209:f82 with SMTP id
 5b1f17b1804b1-42f778fca07mr24075465e9.29.1727875287486; 
 Wed, 02 Oct 2024 06:21:27 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79db2b97sm18643505e9.6.2024.10.02.06.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 06:21:26 -0700 (PDT)
Date: Wed, 2 Oct 2024 15:21:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 05/15] acpi/ghes: Fix acpi_ghes_record_errors() argument
Message-ID: <20241002152126.08438809@imammedo.users.ipa.redhat.com>
In-Reply-To: <7c2862061ef4b358154414127f6cfd231310660e.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
 <7c2862061ef4b358154414127f6cfd231310660e.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: x9dh4sbTyfxB

On Tue,  1 Oct 2024 09:03:42 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Align the header file with the actual implementation of
> this function, as the first argument is source ID and not
> notification type.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> Changes from v8:
> - Non-rename/cleanup changes merged altogether;
> - source ID is now more generic, defined per guest target.
>   That should make easier to add support for 86.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  include/hw/acpi/ghes.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 20016c226d1f..50e3a25ea384 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
> +int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
>  
>  /**
>   * acpi_ghes_present: Report whether ACPI GHES table is present

