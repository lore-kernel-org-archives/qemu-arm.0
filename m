Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE01D1F9BC
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 11:10:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR7Dl-0002HM-AU; Thu, 04 Dec 2025 06:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vR7Di-0002GR-EO
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 06:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vR7Dg-0002nr-Qz
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 06:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764846594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XyCCexfikUNWiqkNfYU1zCh5RHwj+ikUhsH7znFqHmY=;
 b=OmbH18+2iKBWxP+c24RSAcavJkiThjD3Zbd7hqM3k50jIL8DyeX/fpscx8eW/NdWF64ikX
 S0FbAKGIC4wRZyKo5lyK4ZPh+DloN5lAbNJs8w39+3tlbjZ+2ZPeYkud3Y6dbTFQR692y4
 Ea9MSQdy8gWHMJMhgsNQmyfk6LlWuzI=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-qnmp9kKeMZyX0N378UrQAA-1; Thu, 04 Dec 2025 06:09:53 -0500
X-MC-Unique: qnmp9kKeMZyX0N378UrQAA-1
X-Mimecast-MFC-AGG-ID: qnmp9kKeMZyX0N378UrQAA_1764846593
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-be8c77ecc63so1126619a12.2
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 03:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764846591; x=1765451391;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XyCCexfikUNWiqkNfYU1zCh5RHwj+ikUhsH7znFqHmY=;
 b=Q3AK1l/L2EFCwnQhkStjEnDdhsMyLA5CZxMBlPlLduCbGlLTDNgk5Bh8QB/ZWFPLB7
 paKKcxd4KG+6s3BuD4idMOiWn2vLnrRwcRuaxgnaMJppTM30iPEAoFs2+wP00ij/Gbns
 CLNQoEdrtxmozB+6mBFo/dapYV82aw9KZzItMGFPfpOVFX5SUYbw6y2r9qZD5spzX4yX
 0LkNQBQyb0D9nMOcinFlxfvHnCBvfYRwEn3lEuTNw7uZC3Yn/dVy6mUvNPBaUPFICwcs
 KO0LJQAcJFO5QDfxTjhyY6huSj/mBeq8prazi7O0R8u5/bDL/6jMZqaO6BxCa0htbpUy
 nSFw==
X-Gm-Message-State: AOJu0Yzc8Bd2ox85aB3QaDyGloG65r2u02pk2vKH7cgn1f8xu+EcVSvQ
 CDtz7JVYXAGPATebR89PQcf4QfnKhz3Cxp09RJUKEhfH7RYjSezylOLT6UkFGMX7yDZiyw2ynmL
 vS8ZusdtixEQg3v5PFTc0V6MMCeewaHSLPe4vXkIHQCkpXE+aiSwsK0Q2YHQEFWtLPPzlai/0L9
 BxTe10h88XAvQuPbNnegURVcSS9zYMeO6qUA==
X-Gm-Gg: ASbGncuRez/64LKndTIZxk82I8s3W8k4Mg9jCPiM3W4smM9DThIjiClwMSNq5NADOjw
 wJJONciIRaXhyvSO18nfNWikjKWY2Bnl6jP2brlykU/Pa6YO7sMjYOC+HaFUAIedEsGqy21h47m
 sdvzueU35ejOOk+9T6SzKl0UGZgKIBpdvEM0cGj6PAiGWmbKNlBlk5+RCeh4+3QVqWW5kDRXv0I
 NU/UjllDgLVMCChViaCXVfF1C19nxqz52Bumywh1mZi5WPRGi8AvXr0T789he+nFHXulX1NPkjj
 sSqfdLObIPtlRoABm8WzHR31V8reRSrLypVHU1g9nPdbe+Zpjeks2SmQqapTs4TW9YP9BPJ/Vqo
 zqGHOT0r1XQ9Y/50hkNZOsTnBMSH0nOH5FUensL81SOvKWb81+w==
X-Received: by 2002:a05:6a21:3284:b0:35e:3c6c:1eed with SMTP id
 adf61e73a8af0-363f5d7336dmr7067444637.18.1764846590955; 
 Thu, 04 Dec 2025 03:09:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqniOWBR9ujUTYUCSa0noJOQ0Z/uKgnG+Wt491XrUqEYC6Y4H3O99netEyJr0G4i89B8NFYQ==
X-Received: by 2002:a05:6a21:3284:b0:35e:3c6c:1eed with SMTP id
 adf61e73a8af0-363f5d7336dmr7067401637.18.1764846590436; 
 Thu, 04 Dec 2025 03:09:50 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e2adc5bf17sm1858152b3a.38.2025.12.04.03.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 03:09:49 -0800 (PST)
Message-ID: <f9cc047c-9ede-4956-b79c-0e3a05e41a43@redhat.com>
Date: Thu, 4 Dec 2025 21:09:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] acpi/ghes: Error object handling improvement
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, imammedo@redhat.com, armbru@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251201141803.2386129-1-gshan@redhat.com>
In-Reply-To: <20251201141803.2386129-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F1XDlDpuqQO9HTPi0LLkrfiEmpIqwEdMUQJSINlO1Ng_1764846593
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Michael,

On 12/2/25 12:17 AM, Gavin Shan wrote:
> This series is pulled from the series for memory error hanlding
> improvement [1] to improve the error object handling in various
> aspects.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-arm/2025-11/msg00534.html
> 
> This series doesn't have any dependencies and can be merged by
> it own.
> 

Could you help to merge this series if it looks good to you? :)


Thanks,
Gavin

> Changelog
> =========
> v2:
>    * v1: https://lists.nongnu.org/archive/html/qemu-arm/2025-11/msg00969.html
>    * Commit log improvement on PATCH[v1 4/5]            (Igor)
>    * Collected RBs                                      (Gavin)
> 
> Gavin Shan (5):
>    acpi/ghes: Automate data block cleanup in acpi_ghes_memory_errors()
>    acpi/ghes: Abort in acpi_ghes_memory_errors() if necessary
>    target/arm/kvm: Exit on error from acpi_ghes_memory_errors()
>    acpi/ghes: Bail early on error from get_ghes_source_offsets()
>    acpi/ghes: Use error_fatal in acpi_ghes_memory_errors()
> 
>   hw/acpi/ghes-stub.c    |  6 +++---
>   hw/acpi/ghes.c         | 45 ++++++++++++++++++------------------------
>   include/hw/acpi/ghes.h |  6 +++---
>   target/arm/kvm.c       | 10 +++-------
>   4 files changed, 28 insertions(+), 39 deletions(-)
> 


