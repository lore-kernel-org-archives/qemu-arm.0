Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4D9C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 14:51:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whq5j-0003R9-SD; Thu, 09 Jul 2026 10:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1whq5i-0003Ql-FG
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 10:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1whq5g-0005JI-JL
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 10:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783608662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3PTVKaHvig/lQzC6J1Sm0xHuPhGe+BAov25dQoJsUY=;
 b=LnHCQ5uizYs0hHDElJtX4+GALSxTibck0+r4y3O3WB6CMmqLXTKmHsAgLQFe9R+oxlwQBY
 zULZ62DYYVeLXYDEGclVW1KOmg0SvmWBmJ8EvILn18s83tD0WuSKO7ugGNARgHOBtcOmcY
 BX83ofQ6kr3ihdIsOHqzaYJy5Bk8p5g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-2iFIU8i1O2ygvMGR4J9btg-1; Thu, 09 Jul 2026 10:51:01 -0400
X-MC-Unique: 2iFIU8i1O2ygvMGR4J9btg-1
X-Mimecast-MFC-AGG-ID: 2iFIU8i1O2ygvMGR4J9btg_1783608660
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-493e9ea2c77so8779485e9.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 07:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783608660; x=1784213460;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=u3PTVKaHvig/lQzC6J1Sm0xHuPhGe+BAov25dQoJsUY=;
 b=KPuUEJPZMl4i0AkuJdm93hfIpoORU30fcRCE4GYNEyaLzrv6JGazhw/rg+UxQMHi7X
 nip+76FHJeW44GukGKy5K7UHbMpnCUOCDx4okGccDmA6WZqBbTx3ypn/RUGtUhvdqlSd
 TpKAf5m/ezVYvjQ6mm8/Wy74h3Aze+SNAFh7Ugxt/V1ZsSBs+popo8+jehfEej+rvcZ/
 RpF0kmzoufL62jXmqA95H+LdY59TmWC21OCccWqI4FU5Quy2eU6/UOHV8af8gwBpEAY6
 y6ZeUPOnwRd27r6XXtQBpPp8OfVHLwMcA2utsL6CRs78ULFFNi+kKTS+/rrBIbGzVF+i
 Lb1A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZo686R71k5jpO6yeAjIwNT9SbzvNzb9RZJ4hCI2SqvUlCyp/dwCbaDPsyjGEPWDFxumF5gopO1g==@nongnu.org
X-Gm-Message-State: AOJu0YxAfMC8/mEEAkvuzlk4GCUeDoI6LsnOPs5cFxuqL9ENb1bhVoGK
 dJ6U4HjSMt10Zqwd8fNjrXVWCNDQluhTF14KiIgMAKIdLlGuBm/b41LjzThUg4vWJNQnaCz5h4v
 JrPyyJ2dnmX21jJX16DVx3yxo6L3knYOWqulg4XFQO/qErhbn+whrOA==
X-Gm-Gg: AfdE7cmFxO/i29EFYUDL8Cksp8VFvMl45b05IACpc/mqiQ1Z0RTjEYl6Lk55vsitdrn
 3f+dKuPC67XOJ3/rVFAFS0mPirbxy9aSTlg+p1cUapZytR90iXihQ6tPIzzFCib7D0iWcJV+8uO
 Vrtt49HaP+3d5P4ZSN/x7tNe6h3WuJvpd6uhG2wprDH3I95D4vdnuq9OMl6yKycBGbWJsrhxdFg
 wHM4J1ExYY/CaYiwo1dYszPWd9W0sVthusiYcFBTYFFVzncZSy4YiOaH3DQo7DFl7HAQkwXhVD1
 iFebo8is/r9ttxCaWvPW8Md7hGwt+sc03PRaZr+XmKYurjzmipYeSLBB0SeNVmw57yfBqFehDa+
 G0E2KBelKhlZEBNyU4HWWp5+C//yCvSkwPtCAxVFnru8AVLPmEMw5lxLKcWkPYw==
X-Received: by 2002:a05:600c:8b05:b0:492:41c9:886b with SMTP id
 5b1f17b1804b1-493e68a0db4mr75737485e9.14.1783608659868; 
 Thu, 09 Jul 2026 07:50:59 -0700 (PDT)
X-Received: by 2002:a05:600c:8b05:b0:492:41c9:886b with SMTP id
 5b1f17b1804b1-493e68a0db4mr75737205e9.14.1783608659426; 
 Thu, 09 Jul 2026 07:50:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:263:8800:8714:9136:d3b4:25b3?
 ([2a01:cb1c:263:8800:8714:9136:d3b4:25b3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a6240fsm105823165e9.2.2026.07.09.07.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 07:50:58 -0700 (PDT)
Message-ID: <5161e394-4f41-4fe4-af83-1c0993758442@redhat.com>
Date: Thu, 9 Jul 2026 16:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/tegra241-cmdqv: Do not sync GERRORN on VCMDQ
 allocation
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com
References: <20260707112450.111178-1-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260707112450.111178-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JrUEnBsDcq5fAvipXpGqYMAgGah_e7vkDQB3IgvrSzQ_1783608660
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 7/7/26 1:24 PM, Shameer Kolothum wrote:
> When a guest hits a command error, the hardware sets GERROR and the guest
> acknowledges it by writing GERRORN to match. These registers use toggle
> semantics, and since GERROR is read-only, both GERROR and GERRORN may
> remain set after an error has been handled. As long as they stay equal
> there is no pending error, so a subsequent VM is unaffected.
>
> When a new VM starts, QEMU allocates the hardware VCMDQ and flushes its
> cached GERRORN of zero, while the hardware may still have both GERROR and
> GERRORN set from an error the previous guest acknowledged. This makes them
> differ again, so the hardware sees a pending error and stall the VCMDQ,
> leading to CMD_SYNC timeouts.
>
> Do not sync GERRORN when allocating a hardware VCMDQ.

One question: I see cmdqv->vcmdq_gerror[index] is likely to be set in
tegra241_cmdqv_setup_vcmdq(). Don't we have a risk to silence one
pre-existing error?

Thanks

Eric

>
> Fixes: 1d0f77535417 ("hw/arm/tegra241-cmdqv: Route allocated VCMDQ Page0 accesses to the mmap'd host VINTF page0")
> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 29c488e0e4..fe88bec41f 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -212,7 +212,9 @@ static inline uint32_t *tegra241_cmdqv_vintf_lvcmdq_ptr(Tegra241CMDQV *cmdqv,
>  /*
>   * Flush cached register writes into the mmap'd host VINTF page0 after a
>   * successful HW_QUEUE_ALLOC, so the guest's earlier writes survive
> - * the cache-to-hardware transition.
> + * the cache-to-hardware transition. GERRORN is intentionally not synced,
> + * as overwriting it with the cached value could recreate a GERROR != GERRORN
> + * mismatch and stall the VCMDQ.
>   */
>  static void tegra241_cmdqv_sync_vcmdq(Tegra241CMDQV *cmdqv, int index)
>  {
> @@ -229,9 +231,6 @@ static void tegra241_cmdqv_sync_vcmdq(Tegra241CMDQV *cmdqv, int index)
>  
>      ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, A_VCMDQ0_CONFIG);
>      *ptr = cmdqv->vcmdq_config[index];
> -
> -    ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, A_VCMDQ0_GERRORN);
> -    *ptr = cmdqv->vcmdq_gerrorn[index];
>  }
>  
>  /*


