Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A748AD116F1
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 14:07:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOz8F-0000XL-8w; Fri, 28 Nov 2025 09:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vOz8D-0000WX-Iu
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 09:07:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vOz8B-0005Yf-7r
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 09:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764338846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpsArHMDWhQnZ48+h1svHXcQNA5FM0Gqizl/c11YZ1g=;
 b=SHTaAZFlIpCAoqXHWdoARhwnPFR9s3QBjX5vnh3S2GKqlNGWQnDTP1K1TRhRZJ5IYNpy+6
 5mUp/eyFeF51lVMgtrUcRXEU1rH8ogMOLDgxASGIMAs79CUEp1NOmO8wInjLd66Hr6qWGC
 pV7iKR/pVhF2RrIslpe4Lb+mGRyZFtQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-1wK9nng3PNauIfgIDft3xw-1; Fri, 28 Nov 2025 09:07:24 -0500
X-MC-Unique: 1wK9nng3PNauIfgIDft3xw-1
X-Mimecast-MFC-AGG-ID: 1wK9nng3PNauIfgIDft3xw_1764338843
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42b2e448bd9so1257244f8f.1
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 06:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764338843; x=1764943643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DpsArHMDWhQnZ48+h1svHXcQNA5FM0Gqizl/c11YZ1g=;
 b=G2B5CMeRYXVP/oz3k3abW1dCr1PxTg0mcMvGu8V0Nx+UL5oulLAgEfYaq2+ZNfxT0G
 MJ5cK/dvZBTj18G8QEaq3uK/IamR2bNy0qoFLbJe9lQP6Mc8j96WU/QwmWCTx7PomE5x
 R/YmNsGGQoglN9ILGOxKQ0R8j3ZoIwXY2TTkef7o8ReI25Sw57Sy3FXWinVfvrIXd0IK
 hi5wsvW4iOYSuNDeeC6xyGUbLx9X6i4JkCNeSn21r+0fUbVkxdFu/I6JXuF71/G54Hay
 RkeyG7Eli7/Z0LHC2gtp3uKnIWmr0/koKxP6lWfRx6NqewA+UxwQB4qcKZUIpfwuKN98
 E9Vg==
X-Gm-Message-State: AOJu0Yxb61ArEezBRvXYDwYQN4yuU4WnGCcDKLuPogBVYVm+lC2yJqz8
 6kdNs/bMaeC1w29BQ2isyrcwpGuMnvZNkmUjmUlsjoMXlHZa3U2rMeSj7hCWHkaPX6ms3CDulZ6
 QbbeQ48XTVP+6i40GLetbBVSmhu40bgAnayG9MsDCw29fRSGuxQQBiA==
X-Gm-Gg: ASbGncuupiCtRXwpwBzkGKYkHiNyhQatLCoWeOlq9bepVUREZdA83WyjPfYBXpb0oEx
 7KhUHwhxxQav8aebJJbqTJ0iL00hFsm8RGH04JOcVxk3zhYnE+AzyibeKhZNPA0WxQw4SB7otFy
 SiT6At1sTpW/eBGq7uJSF9gmDbj4fiZfORSF1PLKLGFAEeM5zVBD4YGeB0yeH6+sotndVSfbYfF
 xfUFGcSySH/0MqZifsrQbOuLMpY1iovTg0yipr8epjh3LMWqKWq3mpY8fSo7j0yll/zEUkve5KY
 chJu/MXLY08E4wQ1EHLE6SUBVGIyrhqYJ/vIlLBsNk9UEkej2FfydUaUJsUqvVuQ40iIsQ==
X-Received: by 2002:a05:6000:2891:b0:429:9323:2bec with SMTP id
 ffacd0b85a97d-42e0f356945mr17567435f8f.40.1764338843294; 
 Fri, 28 Nov 2025 06:07:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPCNKph31y97kHrbit085OznGbfGctx9/3cy2eR7oAnrTdSwNGrdNJnygUa71CNzADfiAccA==
X-Received: by 2002:a05:6000:2891:b0:429:9323:2bec with SMTP id
 ffacd0b85a97d-42e0f356945mr17567377f8f.40.1764338842774; 
 Fri, 28 Nov 2025 06:07:22 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca7880asm10089337f8f.31.2025.11.28.06.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 06:07:22 -0800 (PST)
Date: Fri, 28 Nov 2025 15:07:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 3/5] target/arm/kvm: Exit on error from
 acpi_ghes_memory_errors()
Message-ID: <20251128150721.390604e9@imammedo>
In-Reply-To: <20251127004435.2098335-4-gshan@redhat.com>
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-4-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qatyL6cbYQ1bGxsGhvVtJu25kH3FexKXnYxNEVkxL2o_1764338843
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.014,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Thu, 27 Nov 2025 10:44:33 +1000
Gavin Shan <gshan@redhat.com> wrote:

> A core dump is no sense as there isn't programming bugs related to
> errors from acpi_ghes_memory_errors().
> 
> Exit instead of abort when the function returns errors, and the
> excessive error message is also dropped.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  target/arm/kvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..acda0b3fb4 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2460,8 +2460,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>                                               paddr)) {
>                      kvm_inject_arm_sea(c);
>                  } else {
> -                    error_report("failed to record the error");

so with message gone, user will just see qemu silently exit?

> -                    abort();
> +                    exit(1);
>                  }
>              }
>              return;


