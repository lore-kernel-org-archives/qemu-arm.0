Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49A5C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:03:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weCaP-0005tg-Oq; Mon, 29 Jun 2026 10:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weCa8-0005jy-BO
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weCa6-0000wV-Ew
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782741804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89vgmoIDNI6gFhaNxYzIx4OgW9TYHX5IZ9h7MjVh3o4=;
 b=DYAFQdrH+K8bnIdNgMkfniMwtp150L1OetHCv9xAJURDh7PCyb+q+50igeU00M28TQAAjn
 /m5J6/wsEeBcBcmjNhiMwcDyk/a1304N8ionRROE5qDqOBo79yNBq8vwZ4c3jMW/pVN4Do
 bS1opxYx/pqIrk1FWYn2cCAp4o2UGI8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-o8O6zVfhNe2jPq9FZdInMA-1; Mon, 29 Jun 2026 10:03:22 -0400
X-MC-Unique: o8O6zVfhNe2jPq9FZdInMA-1
X-Mimecast-MFC-AGG-ID: o8O6zVfhNe2jPq9FZdInMA_1782741802
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c12522a1507so170332266b.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782741801; x=1783346601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=89vgmoIDNI6gFhaNxYzIx4OgW9TYHX5IZ9h7MjVh3o4=;
 b=MoAn0RBBWH/h7zTuBAVdtrMKZOF50WCw1dT60Sta2jf3x5r8uGUmF6j6KgDbaYx4BG
 LnVLLY1kpXC6VS77JaPqJejA9Nec1/7lXcvbZVBvSie81XW3GJzIi8kTrMDeIJnPUBpS
 UW1URYJpAOVQEmFQJl2F4vzh0F2BrZ8hjCCJYKlwdjnKrlQkkqZHkJ7yhUj02eMh5ulz
 8TAidFz60VufXrUX1o0Oy7aa02XIC8+KcpYkUtTye0fSbHubux6x2eYVuIS9AuPLxRws
 F6xHAa4E74dySOzJf7XL10lQhaaI/kZg06nQy/dc8b6YddKluOhiyUXSZwWDPkK0Z+5E
 44ow==
X-Forwarded-Encrypted: i=1;
 AHgh+RopAky4Qc8cQutiatJ5FJxEotiAicNyudPBjLwMp7lcxKBpkEQgiCMGi1sPgA9spVSW5G5CfHedug==@nongnu.org
X-Gm-Message-State: AOJu0YyV97Ac4+cEBG94nXByN8A4UQmgcgj8y2Jd665H1f6n0F82q560
 cZbwrMXJAWKrZMRGs/XKN7JGR6ZKWDmxNKehevJrZgplTcrCDVNg+ZvS14lFK5kJwej+T8fNCjt
 13qJ2yG95VsECSPa7ushx6tvefv6IYf3+HYinFl0+PvZ1a8SCHd5cUA==
X-Gm-Gg: AfdE7ckI4dupiLWRTXEpPlsPnolYsTjoJyyKGX7upAyaHHDwd8b0rQqQhw3uuUkdhPt
 iWQ4J6FEdjv5TqGI5v3WfNw2oijekBUFAhY2wuptjCSa5TvWREXplHyJnZAVmoXMhzO8H1Ip1Fp
 xcB7Q1QqMTEd8J2PbWtxNdhm/ddFkN3V+UYk6l40zMoKQJN+9/OxwI5xeVWGYvt8xK9WVXtKOEj
 mO59wpoSOzKxglYIFOgF+wjhq+wvVOgqxRNRk9Dhv889irW6uhFyR71DE3+xplhxOBEKDiIq8LN
 nm14y5m44J+v4HX3w5Z/VkhFsvGcIuUd+5tr7amwDG0f3oW6rWH+13bIhOj7C/yl2IRMNY4h7L/
 QKGjLpaWzEiN33dVwBLtnfu4gOeZHIeHcu3d0do8dKpGWgtkQYDDMXg==
X-Received: by 2002:a17:907:1ca4:b0:c12:7418:729b with SMTP id
 a640c23a62f3a-c1274187cf2mr126354766b.14.1782741801392; 
 Mon, 29 Jun 2026 07:03:21 -0700 (PDT)
X-Received: by 2002:a17:907:1ca4:b0:c12:7418:729b with SMTP id
 a640c23a62f3a-c1274187cf2mr126352566b.14.1782741800839; 
 Mon, 29 Jun 2026 07:03:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12239d9268sm550574166b.61.2026.06.29.07.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:03:20 -0700 (PDT)
Message-ID: <6c609613-8f32-43df-aac4-790abf2357ad@redhat.com>
Date: Mon, 29 Jun 2026 16:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] sbsa-gwdt: move all foo_REFRESH logic under
 REFRESH condition
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 rad@semihalf.com, leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-16-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260624102830.1355552-16-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ahT_qoSpZkAfPAwmDlLpXeRbPqhxJ0slCb-4CmFFaIw_1782741802
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Igor,

On 6/24/26 12:28 PM, Igor Mammedov wrote:
> No functional change, just code reorganization to
> prepare for direct WCV load support in the next commit.
> 
> While at it, simplify timeout calculations
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/watchdog/sbsa_gwdt.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index 6113dcd077..5ee0e06af5 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -109,22 +109,18 @@ static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, WdtRefreshType rtype)
>          return;
>      }
>  
> -    /*
> -     * Extract the upper 16 bits from woru & 32 bits from worl
> -     * registers to construct the 48 bit offset value
> -     */
> -    timeout = s->woru;
> -    timeout <<= 32;
> -    timeout |= s->worl;
> -    timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, s->freq);
> -    timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -
>      if ((rtype == EXPLICIT_REFRESH) || ((rtype == TIMEOUT_REFRESH) &&
>              (!(s->wcs & SBSA_GWDT_WCS_WS0)))) {
> +        uint64_t offset = (uint64_t)s->woru << 32 | s->worl;
missing extra empty line (or is it no more requested?)
> +        timeout = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +                      muldiv64(offset, NANOSECONDS_PER_SECOND, s->freq);
> +
>          /* store the current timeout value into compare registers */
>          s->wcvu = timeout >> 32;
>          s->wcvl = timeout;
>      }
> +
> +    timeout = (uint64_t)s->wcvu << 32 | s->wcvl;
>      timer_mod(s->timer, timeout);
wouldn't it be simpler and functionally correct to call timer_del only
in case of !(s->wcs & SBSA_GWDT_WCS_EN) or actual refresh and let it
live otherwise?

Thanks

Eric
>  }
>  


