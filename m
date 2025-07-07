Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD827C8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 16:27:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYofl-0001v1-8L; Mon, 07 Jul 2025 12:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uYoe9-0001KY-Eh
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 12:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uYoe6-0003C3-IM
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 12:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751905479;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73lHyK1dSG44+Alh6C1OepclZN6fdLa2QCegCfeT4fY=;
 b=UN+a5jET6Lv9boH7dPEXOdliyH+8jaic3jo2HQzf8XYOAYjiAia8FbO4ZPHPmsK2xXpwcY
 SeGmsgoAbebmjEFuDK4eylWOgSX7hATOJ18pqk98uAqppbsXd3xnRBQY659/dACkcZWA9R
 J27XZ/jSPSEfj2mGJdpDm1oxhtFcVLA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-HCYUcJ2_NOmwZ2OZD2usXQ-1; Mon, 07 Jul 2025 12:24:38 -0400
X-MC-Unique: HCYUcJ2_NOmwZ2OZD2usXQ-1
X-Mimecast-MFC-AGG-ID: HCYUcJ2_NOmwZ2OZD2usXQ_1751905477
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a6d1394b07so2140884f8f.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 09:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751905477; x=1752510277;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73lHyK1dSG44+Alh6C1OepclZN6fdLa2QCegCfeT4fY=;
 b=Tu1kzaEhokj7++XNKatkanFkKELSEdx+GoaYIA/TKV5majxX+RwXYOx6xn3u7GjoX8
 4zbupkUfN/CTx11de9d/M8iQstOINRYxuynjNJNjz/etvjFezuYrCFDmv9/mcJQMScTl
 VW9Y7NM39gtYqeAsQlSoGSULi5npakoMeU0H25iWq6zrEMY8nKl4ED4sC/X6ItAZ/qst
 DdLVaiPCZnNuq5qNMaj2oGa1SkBKNXpZYjjGBArlDGvvC/MTc2KvkPAga0bvFHyDPm/J
 B30rOsxC9Qv88IvgQxyDFAgFSVYFg5CTi7LAgpgTEwxmY/SWUiT8ERTNRICFXTtIKCIM
 dMEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGiNpfe3heNamlF3Rgrj+zrltv4b0BdGMsI3Z54/uU0R6+NIis9xnICCgWiHuZInAO7fH2cDs3Sg==@nongnu.org
X-Gm-Message-State: AOJu0YxoOY/TzIR5+gKlTvMt0fz40C4uk6WBTH1CXRXuA8323pdeki7P
 6cWQwWSTWjxwSiOuFcGUT3HCNxP6GfU07fh6P8+TMsLz4geAeqUWqUctDvZkCLntqjL17UO+r9J
 q4YvrHcdZTeQDMbwWFiS1T0YG4GEfNNzG1ZrLT1l4d/Ddwk7UbGr78A==
X-Gm-Gg: ASbGncshrNN3PTBnB/Z7RgjRDsngAxBa6e5l9Litb10lqQZFdOf3DQEZ7OOSBrAmfr1
 JDtLMB6qHG+SGb7O82luL/ChVbbmRE9mV9oaDm/9MIItTG4i3o69isvPawuWrsoNom/sQnU3pwl
 kLts7M/2i51QFBkH0l0jfWfvs8gKF0mRDUqvlCC6iBAnk31CJzqzUwxCxZlmfPSelTa06/2wXU0
 DyakjYuXvcZs70GjVC9acdgIQOE4m5QzocyOQl69MLH0txY7klSirtzCJULwprZ3SAYGm5Z0Omd
 dj76kCsUf8PAnEPSbccgZHRIAMFlc9ojfywr16XP3HzOrUFVv3hYeLF+3UARf5d/EgPIYA==
X-Received: by 2002:a5d:5f02:0:b0:3a4:fb33:85ce with SMTP id
 ffacd0b85a97d-3b49aa7c401mr7115413f8f.46.1751905477391; 
 Mon, 07 Jul 2025 09:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI6raxdqfK8LmtsOdU1aAvOjnTEQwFTyhU4US7BSI88R7puW+XH2lV1+X6iRfewDvgpsb5Bg==
X-Received: by 2002:a5d:5f02:0:b0:3a4:fb33:85ce with SMTP id
 ffacd0b85a97d-3b49aa7c401mr7115392f8f.46.1751905476939; 
 Mon, 07 Jul 2025 09:24:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97708sm10793392f8f.50.2025.07.07.09.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 09:24:36 -0700 (PDT)
Message-ID: <8700d75d-677f-4aa3-b666-d249dcd46932@redhat.com>
Date: Mon, 7 Jul 2025 18:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/intc/arm_gicv3_dist: Implement GICD_TYPER2 as 0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Marc Zyngier <maz@kernel.org>
References: <20250707161018.585469-1-peter.maydell@linaro.org>
 <20250707161018.585469-2-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250707161018.585469-2-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v6NP9g7GtKXodCnmMwhrU_Lc7IT2ARLcjpZEdMjTPdA_1751905477
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 7/7/25 6:10 PM, Peter Maydell wrote:
> The GIC distributor registers GICD_TYPER2 is present when the
> GICv4.1 is implemented, and RES0 otherwise. QEMU's TCG implementation
> is only GICv4.0, so this register is RES0. However, since it's
> reasonable for GICv4.1-aware software to read the register, expecting
> the zero for GICv3 and GICv4.0, implement the case to avoid it being
> logged as an invalid guest read.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/intc/gicv3_internal.h | 1 +
>  hw/intc/arm_gicv3_dist.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index bc9f518fe86..fc586524f56 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -31,6 +31,7 @@
>  #define GICD_CTLR            0x0000
>  #define GICD_TYPER           0x0004
>  #define GICD_IIDR            0x0008
> +#define GICD_TYPER2          0x000C
>  #define GICD_STATUSR         0x0010
>  #define GICD_SETSPI_NSR      0x0040
>  #define GICD_CLRSPI_NSR      0x0048
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index d8207acb22c..a7d10ed9493 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -431,6 +431,15 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
>              (0xf << 19) | itlinesnumber;
>          return true;
>      }
> +    case GICD_TYPER2:
> +        /*
> +         * This register only exists for GICv4.1, which QEMU doesn't
> +         * currently emulate. On GICv3 and GICv4 it's defined to be RES0.
> +         * We implement as read-zero here to avoid tracing a bad-register-read
> +         * if GICv4.1-aware software reads this ID register.
> +         */
> +        *data = 0;
> +        return true;
>      case GICD_IIDR:
>          /* We claim to be an ARM r0p0 with a zero ProductID.
>           * This is the same as an r0p0 GIC-500.


