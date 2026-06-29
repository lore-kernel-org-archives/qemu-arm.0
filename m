Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B277AC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 08:13:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1we76w-0001uU-4j; Mon, 29 Jun 2026 04:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1we76u-0001tz-SS
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 04:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1we76t-0004fN-F1
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 04:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782720774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKIK0SUno5CX+2oH+AKwpBCMF/JJ5BRSDyNKjfU3BYk=;
 b=BVgz5VHoA7BigThfSkUHw1BLwxUjAiAt51Jx2ztKtQ7cRGWFrWg/5TLLbDfegqj++we3kM
 cp6XUswzBCZ+WYyKM1LskXe8cP4/hI1r9nsdJ0saQI15+rRS3lOwinLdqWursUB5USJIzp
 QnYbM4/fblaxIUsHisUIgFsXmn0UlWk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-9BOs8uelMTWSKHX09PZ4eg-1; Mon, 29 Jun 2026 04:12:52 -0400
X-MC-Unique: 9BOs8uelMTWSKHX09PZ4eg-1
X-Mimecast-MFC-AGG-ID: 9BOs8uelMTWSKHX09PZ4eg_1782720771
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-47248bd8bc0so857039f8f.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 01:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782720771; x=1783325571;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oKIK0SUno5CX+2oH+AKwpBCMF/JJ5BRSDyNKjfU3BYk=;
 b=pMWzmq2hJ4UU73Z658iYNTsFwWhD8tIsEZxJ0jN4ZD+VyviU6Dmy5sDZnqBuJsVGSq
 njqdtlP+0qwcdp21DDpdaVTnHgm7FBM7IDlK6UHWq3u29it43LpLQvJdGFqWMxzaf2xC
 m/rHW3hrX4WXINXf016vJoPxr0u73gxShV3PGsiq1lvVeU7oIm/9gZmN4pbtsnRyzbPc
 ro1p6sHnjub/AJ6VLrd0wJ0r7TLhv7UsYTukXSOEuU9DzPB69ep7hdIjTHf23856DuON
 lyHVIqIVZUkS3a7XnKoSzv7jcE4O2xzBxzE8ry8vcDSAEBlXJ0bEklfmUcLNCCky+eCz
 553w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr33ehM2+goxkO402JrzGLaUNNcTpPTWl4BaUOSVV8Dl2tZgvqeHOoslPw9d4LoGJyAd0YqiK78gA==@nongnu.org
X-Gm-Message-State: AOJu0YwomqfS6rVY9t8nnwRAfD15owR5wkr+GxZ286CzLjGMdwhZoajL
 JWChyinovijHDPbRCdWjXlCmShN2ELCcdCeY5rUg46YDI8biLChZa7zhs7uDks2HXA8VDAEIeuC
 n9cSpgZVgB/GM3Wj3QEvfVh/I2Q6+N2qqKCpQxrrifhAtAOkYfmhdrg==
X-Gm-Gg: AfdE7cndYdrah+n69GOp7oZjFVJ9naWWUifnNw1G/hHipk6QQp3DSsakNRYn0mYwJGg
 d31BNgBCMq+Q3PeRA+yDQ688UBZzOdNrMIkHCQztvFxe/txD5r6oqq4kSR9Yj68bBa00EgytRPo
 DSmKxbWH20Ii6MtZtH6gf6ZGBBAKKJJ51TTagf+lhy0SN6jfXZuB/8BizfHH0J6YjFRIJdVvakm
 iskERRx8KcAPmhuf224QM9iNVnhTZVrkwlXZVZ5cp58DcCTPg2ZfsEAnkip1UP+zQyAJqp/BoFm
 6UMH6Qu3YDUhZD3YZnIfmbA4T+d6pZEpE05f2NZJaTiW17KtVR9kqnNok5iDrUTT4vlazJORO0S
 4zinIraA5R/CtwbtHT7zlVNYk78DcU8pGlaV28DIkVCSBB9kq6k2FPg==
X-Received: by 2002:a05:6000:2f87:b0:46e:1658:7c62 with SMTP id
 ffacd0b85a97d-46e16587d84mr24643972f8f.16.1782720771006; 
 Mon, 29 Jun 2026 01:12:51 -0700 (PDT)
X-Received: by 2002:a05:6000:2f87:b0:46e:1658:7c62 with SMTP id
 ffacd0b85a97d-46e16587d84mr24643935f8f.16.1782720770546; 
 Mon, 29 Jun 2026 01:12:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4728072188fsm14230044f8f.29.2026.06.29.01.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 01:12:49 -0700 (PDT)
Message-ID: <6b64061f-06d4-4e92-8f06-43332c10fd3b@redhat.com>
Date: Mon, 29 Jun 2026 10:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/17] arm: sbsa_gwdt: rename device type to sbsa-gwdt
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 rad@semihalf.com, leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-4-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260624102830.1355552-4-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tbbXsS-RS3QAPvGmL1S6dWqddqXlvhjCwKI064V6rmo_1782720771
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 6/24/26 12:28 PM, Igor Mammedov wrote:
> Use hyphenated name to follow QEMU device naming convention.
> Migration compatibility is preserved since the vmstate name
> is already "sbsa-gwdt".
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  include/hw/watchdog/sbsa_gwdt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
> index 307a4f291a..8941dcff9e 100644
> --- a/include/hw/watchdog/sbsa_gwdt.h
> +++ b/include/hw/watchdog/sbsa_gwdt.h
> @@ -16,7 +16,7 @@
>  #include "hw/core/sysbus.h"
>  #include "hw/core/irq.h"
>  
> -#define TYPE_WDT_SBSA "sbsa_gwdt"
> +#define TYPE_WDT_SBSA "sbsa-gwdt"
>  #define SBSA_GWDT(obj) \
>      OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA)
>  #define SBSA_GWDT_CLASS(klass) \


