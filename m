Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A45EC1459
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 14:46:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxR0s-0000vW-C4; Tue, 03 Mar 2026 09:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxR0h-0000ta-LN
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxR0e-0004Fq-Pr
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772549163;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrdlQ5T8ikU6P2SfLah3sHVhhePFNaBLUUPTRqmifig=;
 b=PMuH/1crLR80fhC8YH2gybc/EjoLVztb8DjXjZQCLdMtz1PNhyY7ixtZ76WaFD2FIb5VTm
 YhocfpbHdINbo1UNklXL/bJBQdk5OIV7JpAzOhwOUOONhqqKGVftrDIuNb6C9e+2Qx8gAb
 J2dphH6uy9uaKPcBO2QXdwDqeSNAkis=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-NM_vREutP0ycfjFwYn-rBA-1; Tue, 03 Mar 2026 09:46:02 -0500
X-MC-Unique: NM_vREutP0ycfjFwYn-rBA-1
X-Mimecast-MFC-AGG-ID: NM_vREutP0ycfjFwYn-rBA_1772549161
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439b4e653d2so2158410f8f.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 06:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772549161; x=1773153961;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrdlQ5T8ikU6P2SfLah3sHVhhePFNaBLUUPTRqmifig=;
 b=Rhw433iGdJq6pbBz8n/iKYfBo9+Xppuex205f9s/x2c47vhDSkTX37ffwueLy2y1bC
 ictEjCliSE3hQGAGv0pej6ciMZs7SZwBqUvoR2I929l1k/WnCN4t0LiUd7dyBYMbAmM5
 8HU9WLlyHutPrle/6UgvDqPsar1iKy6JIrt8O8Tq+ZeAx2/8ursalDmrluTyLIe774Tt
 ceK4heFF/HvcXHlOotdlt1B1mWhnV3wJMatIEmJYh8Ms3EFcXMcFXc0+CmemzeEXQ1hv
 W0kkbbBI5KdNvNEU/7vK8h1Ely2nX7gqRrsqQ22bQIApjkHNhaZjKssJ4gN2GOouNvEg
 lJnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDKq1cgD9M+LceY8jlxp+1ScdUp74knyPdMcS/H0Sg2JMV9Yv9HjJ7AuPj8WkkdvxpI9EqgIls9A==@nongnu.org
X-Gm-Message-State: AOJu0YzlZd0CpfEGZMsGffrpJ1AjBuptcisCfNYWPIJ3wp+8uVP/zbjU
 zmbRqSj6S6ySxacwm3yiJ4iSekQYLeWAiFJUfsW7Eb9wjV7oHVPG+5cRLw4B07NPy5fIf0x4tQT
 /8EWAtaQnX8vX4cOQx2quniQpSOzOJclS4J6aRX7CjW5TbljF/+XpIg==
X-Gm-Gg: ATEYQzwrJwOIE+2UC61NBpjxfm7EE8/xmJkoxPOK8vs5rX57wdM51qh0p/cxKo0T3a4
 Vyfxl2dAGgt3XofPZvlp1liAyq5fohlxcKG+kzhM8HsEI+rXyuW9MRGwmuI5xI6aA2HvsuDP/PE
 hwIIUFXHNe7I4SMs2eTU6QTd2c645MfFJusWPTpHS0AV01k0arG72S3iCidZ/wyn+qyh0qNMDQ0
 LVfAToN49IsQD0enbDUGNVFwQ6uiQIbeDWXFvOhbtPs6F0C+cWc7yDl4ZIj3+mTSvM+bmiMR1Hy
 xlHJ/a/kmZ2qiFOdP8ZK+Yy0GnKqR6JaE1igYJh0wDY7y3Ru+dpH81MwWUmJwkp57UXXMjP3MYw
 Rtja6W5FfG3QfPDyLffVVPkvWTeuYJONqkmyTtw/fsgYrR83zIvObEnBZ+YSv46Y+r4bCmQ==
X-Received: by 2002:a05:6000:2583:b0:439:c43a:acb6 with SMTP id
 ffacd0b85a97d-439c43aae46mr2223830f8f.10.1772549160730; 
 Tue, 03 Mar 2026 06:46:00 -0800 (PST)
X-Received: by 2002:a05:6000:2583:b0:439:c43a:acb6 with SMTP id
 ffacd0b85a97d-439c43aae46mr2223782f8f.10.1772549160243; 
 Tue, 03 Mar 2026 06:46:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b1b97927sm20159866f8f.28.2026.03.03.06.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 06:45:59 -0800 (PST)
Message-ID: <22a006c7-dda0-455a-9f16-49064a1f06d7@redhat.com>
Date: Tue, 3 Mar 2026 15:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Improve traces on migration failure due to cpreg
 number mismatch
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 peterx@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20260226100232.500781-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226100232.500781-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3ToD4gD1zq87z0zDCz48311Jxa29URnkLAvMU_Up4lk_1772549161
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.322, RCVD_IN_VALIDITY_SAFE_BLOCKED=1.141,
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

Hi Peter,

On 2/26/26 11:01 AM, Eric Auger wrote:
> This series comes as a follow-up of discussions held in
> [PATCH v6 00/11] Mitigation of "failed to load
> cpu:cpreg_vmstate_array_len" migration failures
> (https://lore.kernel.org/all/20260126165445.3033335-1-eric.auger@redhat.com/)
>
> It only covers the improvement of the traces. Actual mitigations
> will be handled in a separate series.
>
> When the number of CPU registers received in an incoming migration
> stream is bigger than the number of CPU registers seen by the
> destination we currently get the following error:
>
> "failed to load cpu:cpreg_vmstate_array_len"
>
> This series removes this cryptic message and explicitly outputs
> which spurious registers cause the failures.

Thank you for the diligent review! Hopefully I have taken into account
all your comments in the v2 I've just sent.

Eric
>
> Available at:
> https://github.com/eauger/qemu/tree/cpreg_vmstate_array_len_traces
>
> Eric Auger (5):
>   vmstate: Introduce VMSTATE_VARRAY_INT32_ALLOC
>   target/arm/machine: Use VMSTATE_VARRAY_INT32_ALLOC for cpreg arrays
>   target/arm/kvm: Export kvm_print_register_name()
>   target/arm/machine: Trace cpreg names which do not match on migration
>   target/arm/machine: Trace all register mismatches
>
>  include/migration/vmstate.h | 10 +++++++
>  target/arm/kvm_arm.h        |  2 ++
>  target/arm/helper.c         |  5 ----
>  target/arm/kvm-stub.c       |  6 ++++
>  target/arm/kvm.c            |  7 +----
>  target/arm/machine.c        | 57 +++++++++++++++++++++++++++----------
>  target/arm/trace-events     |  3 ++
>  7 files changed, 64 insertions(+), 26 deletions(-)
>


