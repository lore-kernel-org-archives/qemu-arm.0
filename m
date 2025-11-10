Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB07CCCF9E3
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vITKD-0001lG-P3; Mon, 10 Nov 2025 09:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vITK7-0001fa-5B
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:56:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vITK5-0000sc-3u
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762786608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cM2DwQPWnMIZwjLyerZc3itnOUiJcah2Bj1sbM5eok=;
 b=fNhZcwyU0ijSWEdFZQjNIRjBMfFJWIJ9H18LmFhN7CKx3m5Nu6CDw2mOKkZbftN6ss5tkK
 vp978JFFgJBE0+dqzB18MKokjULKxf8BYOf4pnXz2StW6XayPgM+XhAlFq3sfjTR8H7b1G
 MzpbBBzLw0ia/F9+Q7lOYehqF2+fP50=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-73JaBdU7Ov2xSoSG_7lOhw-1; Mon, 10 Nov 2025 09:56:45 -0500
X-MC-Unique: 73JaBdU7Ov2xSoSG_7lOhw-1
X-Mimecast-MFC-AGG-ID: 73JaBdU7Ov2xSoSG_7lOhw_1762786604
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b3155274eso437747f8f.0
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762786604; x=1763391404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6cM2DwQPWnMIZwjLyerZc3itnOUiJcah2Bj1sbM5eok=;
 b=B5tSsBjBY5fjHATFrnD5LYN8l984OGMGvZDUE9LKQqo6RsIxppFA4o81r/w0TXdZvk
 r4UlRqmezKo9/uPgxjWT12G3W/4OGoePIKsn5ZHd+oQITX4JIYbigVeK4d0ipnaUex1r
 I2vJHmFUOK0jCKdKCcGtzrweqs1jVXsBU76v9QA9E5+Fk8UJZvHIMoVG4He3w+AdSXd9
 Uh4LVwXZcokjYI0dUScfcHjE2piJepAl4mVQLDxHSMDzU9gioYIUVxLAoZO7KaJOyNsc
 XN0/UCCzp0QYSEnSNiU9K6ewoK9OYAOzOqyAbU3gLkwg/6zvui9HVdKYlsBNzeIvSyBg
 382A==
X-Gm-Message-State: AOJu0YwlwY8CRDumjZrKuZ9NldXTAsS4WlI8j2x9nK5QmUOCHDCIClax
 YykCaRZ+Koun5ccVuswZP/Xd9BN45oqZsPtuv1RhWBgiX318+5aJwCrWSYen+eG0/Xfz6XJ8q1i
 vWl+8VsjjxcV3oZvGrcfLEELXjhM5MIV5JHw0DEVv81CERoJc/Gk8gw==
X-Gm-Gg: ASbGncuvamHTeBOn47bFXAVgOx+xGQExc04afDIKcvQpo6HRIU2GEIAmryJM8lcFnya
 vg6ErtfYs9pNYxV+nEEiR8QGVKmYsvp0jDhqIWDo1lfAiV8S/XQEzW/9zAxZJDWEMKWBPH+XvrY
 a72gDccPzvVm91Gn2JvkaPBGfSP0oOnSVz0WV2LEbK65PuC5dB/3ozPMEzixiWRGbjjvs2kKXUT
 RhFiMLYaHbHYFY7zaRot19i4Ecdlr4WBaZ1TENW9FDIG61jrt+eXCMwfRGk89yd+p7cZ1XDKiFa
 0rWSs8WEJj0DSWOHEQi4XVEFWbCtOkjkZIYbobgNzG5M2BCb76f9w8679/e4Ny27SQ==
X-Received: by 2002:a5d:5f50:0:b0:42b:411b:e476 with SMTP id
 ffacd0b85a97d-42b412b29aemr1280697f8f.9.1762786603796; 
 Mon, 10 Nov 2025 06:56:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqffXlXaUV8iTzadTTIkODoWrRx97bPnVr7wBabo7NHbFIY353VbqDAkqEDogoOxonmr2NCw==
X-Received: by 2002:a5d:5f50:0:b0:42b:411b:e476 with SMTP id
 ffacd0b85a97d-42b412b29aemr1280674f8f.9.1762786603426; 
 Mon, 10 Nov 2025 06:56:43 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2dd927d5sm15875533f8f.24.2025.11.10.06.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 06:56:43 -0800 (PST)
Date: Mon, 10 Nov 2025 15:56:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 7/8] kvm/arm/kvm: Introduce helper
 push_ghes_memory_errors()
Message-ID: <20251110155642.2bf8eca0@fedora>
In-Reply-To: <20251105114453.2164073-8-gshan@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-8-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LscYDxrkdQgIeUewjFgMf9DAR2F3Cq3H4qZ-vDUuj_0_1762786604
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed,  5 Nov 2025 21:44:52 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Introduce helper push_ghes_memory_errors(), which sends ACPI GHES memory
> errors and injects SEA exception. With this, we can add more logics to
> the function to support multiple ACPI GHES memory errors in the next
> path.
> 
> No functional changes intended.

I'd squash it into the next patch

> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  target/arm/kvm.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index a889315606..5b151eda3c 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2429,12 +2429,23 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>      return ret;
>  }
>  
> +static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
> +                                    uint64_t paddr, Error **errp)
> +{
> +    uint64_t addresses[16];
> +
> +    addresses[0] = paddr;
> +
> +    kvm_cpu_synchronize_state(c);
> +    acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses, 1, errp);
> +    kvm_inject_arm_sea(c);
> +}
> +
>  void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>  {
>      ram_addr_t ram_addr;
>      hwaddr paddr;
>      AcpiGhesState *ags;
> -    uint64_t addresses[16];
>  
>      assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>  
> @@ -2455,12 +2466,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               * later from the main thread, so doing the injection of
>               * the error would be more complicated.
>               */
> -            addresses[0] = paddr;
>              if (code == BUS_MCEERR_AR) {
> -                kvm_cpu_synchronize_state(c);
> -                acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
> -                                        addresses, 1, &error_abort);
> -                kvm_inject_arm_sea(c);
> +                push_ghes_memory_errors(c, ags, paddr, &error_abort);
>              }
>              return;
>          }


