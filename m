Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C61C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:09:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weCfD-0007Yb-7E; Mon, 29 Jun 2026 10:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weCfA-0007Y8-B3
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weCf8-0003a3-0k
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782742115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWU3w74Uw6TNjG9FtCdjy2t1znpl7sxW4LG0tlPOhw0=;
 b=ePm/hSGktb2Dp8E/c1hXGciToMdbWCO/nttFtURN7SPFLI8NRPP+De2GvCvkcQX1SphZV1
 V7EmOIyRHHukw2v4UKjhT3sEVh+wW1BFUnAXH77kEe3+K560ZHyBaSrF44nTmeyjHWhnPA
 P0+2Og564f1HT8U3jVKfyQpygWWavTo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-xo-ZFeg1NDCqx_wnjo9wcA-1; Mon, 29 Jun 2026 10:08:31 -0400
X-MC-Unique: xo-ZFeg1NDCqx_wnjo9wcA-1
X-Mimecast-MFC-AGG-ID: xo-ZFeg1NDCqx_wnjo9wcA_1782742110
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-474170b59dfso407786f8f.3
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782742110; x=1783346910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YWU3w74Uw6TNjG9FtCdjy2t1znpl7sxW4LG0tlPOhw0=;
 b=i5Vz58Xcb24wWYOsGI3GCca9AEkXLY5nJs1gLQmA56lGQ2dnM0YJnmjOy4Kn8dfMOj
 6CdJnALjkvyT4jOJuuOZBSWG/CxynpH79pDxNLT23erF02YBBtQ4ivz9wHaesRYXOn7d
 9tkj/0W3S/mbg9XDTSpQR52eXy1T7+MYegbQjxRycxP3QIjNS72qTASIDyNtQh5Y8k5E
 zCoyCXdBd01H9zCGzSAC3auAlzC+Z4zSozrwkRBYJplN1LvCRbBbcXWjS9ijIXtnWEYF
 Fbq2nRLXC6gRjPo1M9kSrGuOlLDX6ASsdj8iya+rgZGG5l64jXGcEiHdkXEOrsK7fXsz
 M+7w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqx4e/w93M5e3su1nBkXIIGtTk7+9uD46fSzFCoZjFkyTBrD9P9zv0jn0rES0ZkPEUIAFjRw+oBVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyoj7Ps5mrl66me3n5UElR1e0CrDUXewK7gU65xdnxdw6QoF+87
 ZXUQ109Ex92yDUfEiuNGTVOEMyo95N+BO2dxng7Niwqqvq2B5tfRAY2ULUIEzsDLDdFsir9A7tK
 qk0HUfW4w+WhbURlPG5LEpqh0LY8949dMLy1P/dRBOKRyK5qpgRMZDg==
X-Gm-Gg: AfdE7clBJqws7beGEEv3CkGBTq+2wPDBt09/8AcmB9hz9OUpD1XkUbKlCtfs1lSkDjF
 5t1fLnSn7IstnU74NB0YaW9tvSGkSOX5yv3Waln+tQH/CVn0am2/hclyXu9ehEqfypy7+BiDBbB
 51FzaBPj0qnsNROTiwadDZdEspbew1GspnJqZGtD6nmfCRp3mZa9Nkmd9qm43x4W9RZXrQK6Fky
 LyG24QaoFGZrKLAJjGkEreGFcjmFCyD+RgJsPMq/pOmkEHA2MqmsjpsNaVDt+1ncY7GQ8nClDCN
 DhSttk0ddOBtYi2Exc0BNe1u90fcN+ye50HUCpzgYTMAVGSXgNx1AVoa0fOMQ7fALRLx42dFhsb
 0hE2pgOS7nhf/TLfnVbUusAZBXk/t1je5sfGmSjbhRRRZJSyUK2mu4A==
X-Received: by 2002:a05:6000:2307:b0:471:f180:86d7 with SMTP id
 ffacd0b85a97d-471f1808813mr11795295f8f.41.1782742110433; 
 Mon, 29 Jun 2026 07:08:30 -0700 (PDT)
X-Received: by 2002:a05:6000:2307:b0:471:f180:86d7 with SMTP id
 ffacd0b85a97d-471f1808813mr11795242f8f.41.1782742109959; 
 Mon, 29 Jun 2026 07:08:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4721c88bfcasm21180785f8f.10.2026.06.29.07.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:08:29 -0700 (PDT)
Message-ID: <dc356f8a-0ec3-40c2-90ce-a411210b73d3@redhat.com>
Date: Mon, 29 Jun 2026 16:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/17] sbsa-gwdt: reschedule timer on direct WCV load
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 rad@semihalf.com, leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-17-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260624102830.1355552-17-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oOR32j24gr1On8vi_FkRiKB-j11mgvyR7toaHwhmFVE_1782742110
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 6/24/26 12:28 PM, Igor Mammedov wrote:
> According to spec[1]:
> 
>  "The compare value can either be loaded directly or indirectly on an
>   explicit refresh or timeout refresh"
> 
> QEMU accepts writes to WCV but doesn't reschedule the timer,
> which it should per the spec pseudo code:
> 
>  "TimeoutRefresh = ( SystemCounter [63:0] > CompareValue [63:0])"
> 
> Fix it by updating the timer on WCV write.
> 
> Fixes Windows in GTDT mode, which never issues a WRR refresh.
> Instead, it programs WOR to ~4 sec, enables WCS, and immediately
> writes a large absolute value into WCV to push the timeout far
> into the future. Without this fix, QEMU ignores the WCV write,
> the short WOR expires, and the guest reboots unexpectedly.
> 
> 1) Arm® Server Base System Architecture 6.0
>    Platform Design Document
>    DEN0029D 6.0
>    "A.2 Watchdog Operation"
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/watchdog/sbsa_gwdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index 5ee0e06af5..fb67db9672 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -44,6 +44,7 @@ static const VMStateDescription vmstate_sbsa_gwdt = {
>  typedef enum WdtRefreshType {
>      EXPLICIT_REFRESH = 0,
>      TIMEOUT_REFRESH = 1,
> +    WCV_LOAD = 2,
>  } WdtRefreshType;
>  
>  static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
> @@ -167,10 +168,16 @@ static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
>  
>      case SBSA_GWDT_WCV:
>          s->wcvl = data;
> +        if (s->wcs & SBSA_GWDT_WCS_EN) {
> +            sbsa_gwdt_update_timer(s, WCV_LOAD);
regarding my comment on previous patch, you could add a WCV_LOAD check
in sbsa_gwdt_update_timer now.

In the previous patch it is not obvious that the code is identical to
the original code in default path (hence my previous comment)

Eric
> +        }
>          break;
>  
>      case SBSA_GWDT_WCVU:
>          s->wcvu = data;
> +        if (s->wcs & SBSA_GWDT_WCS_EN) {
> +            sbsa_gwdt_update_timer(s, WCV_LOAD);
> +        }
>          break;
>  
>      default:


