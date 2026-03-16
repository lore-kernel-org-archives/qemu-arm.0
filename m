Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED24EFCBBB
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 07:32:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w22RC-0000cq-GL; Mon, 16 Mar 2026 03:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22R5-0000cP-DI
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 03:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22R2-0002WE-NY
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 03:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773646335;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPpac4uw5QrTsHWMhi00oGUv1rgw3Ge7wuT6TDLT/+E=;
 b=M+w+kHvlAz0mkjDU32rqAMNxfL00JvKE9fpwBRmwvDf4GAwgFkn9mGLTfOaRcljQD6xTqY
 cU+D2eD0XRnJEINSNwpxma2yR4wI8+68WdQ34V4bkJ5mAw1onujVGDq/Zxw1w0eXgtOZtB
 /H+4gEdeqLQlimYnhFPL/MWN1MTbyaI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-_mI0N5-0O-OI7u_tzt5ITw-1; Mon, 16 Mar 2026 03:32:14 -0400
X-MC-Unique: _mI0N5-0O-OI7u_tzt5ITw-1
X-Mimecast-MFC-AGG-ID: _mI0N5-0O-OI7u_tzt5ITw_1773646333
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-43b3e0a73f8so1615859f8f.3
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2026 00:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773646333; x=1774251133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPpac4uw5QrTsHWMhi00oGUv1rgw3Ge7wuT6TDLT/+E=;
 b=aK6tsVTAw/xiT0AaNMJrjxAn1Fgua/X0uptJG/weZB4QjkOieb6rCViDnrmoquwSce
 mkn72VZqS8MXZRo3SmQ3shrz3frOh7Se5LGetcxdV7MZppuzAn5C7MfsMjMvUoomfW9+
 sE184ZMuht1LCXC5RZ4lsge59Jyas2NsBOZeo1FnC7FjTNdD5hPvAGODB3hIN0kKlyBE
 woPwKyD5iUPpF9K7tCac0I35Vfs7wxvPeVhzpLVQiBXZ8gwpQNn3dsfGDK8L+5HDVXR8
 m+OKqJRkIblaWk5xOKLbwAqdfwjmt+mMlGpewiU616Ngby81GBc8fqzxXvLnN6TVjguA
 SzIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/lkB7NvR8hOM4fHBlsyNqXC4y7WOwHbxkmrJSok2hKl8YyXhqLeQ5VsJxKHhVsxKiB0GsANQcUg==@nongnu.org
X-Gm-Message-State: AOJu0YxXPkyY3/30DviX8504hLYryu/i27jaUN/TuoNovfXYwzyxTfL3
 21fC1b0yvh07YAhal7uyrv0tVdogVmmivyc7Y9ftRcyilgqxIoFoepD41K++pe3xo1MImsTcADC
 kvRIdQOCHMEKQfekEtM1JD1Ev9jUHBHv6k39R6YSpSBdLJTiXsf6mzw==
X-Gm-Gg: ATEYQzypXxp1AMbBFv6wih18U2NkmF24RdbvTpiDoqmCzlPoXLeARCD3T9AEAh9xX5h
 pRJR82XXdqa/8qFSiijCFmj7KRS99PEgYOMu0cRfqvRb3nRHzSSqvN6lEqvNVfCTrLmiYt9Xcg5
 NX9/Ts4LcuruqKLqCaMdM8NXJ/H//jZku/b2KmJM8f/wP0TqAbZHUJmDBVoMpo6RnFAVuqMqY+E
 EJAFOJ3YqgwxQUZDYFZeIf2QX6yJiGcc0aLhySSh+28pWIFX1dlpDxHgUez7r/rd7KmfU/WmLTd
 5eOI0oAO5y1LAjFHuciB02j98M8795gRkw7xgoPUwMzH1atLG5KL14jNg0Vw3k8E7j8JlFAFkYf
 umiSWI1km0x2USESk05e1jRmHyJrLUPwr9PKWqsxF65abRwuvvPDaG2ZySZmJOwEoYNrE0g==
X-Received: by 2002:a05:6000:1acd:b0:439:ddc0:4bf1 with SMTP id
 ffacd0b85a97d-43a04dcbf4cmr21432868f8f.55.1773646332997; 
 Mon, 16 Mar 2026 00:32:12 -0700 (PDT)
X-Received: by 2002:a05:6000:1acd:b0:439:ddc0:4bf1 with SMTP id
 ffacd0b85a97d-43a04dcbf4cmr21432826f8f.55.1773646332530; 
 Mon, 16 Mar 2026 00:32:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe20b899sm39019297f8f.23.2026.03.16.00.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 00:32:11 -0700 (PDT)
Message-ID: <6ec20b09-e64b-4d78-927b-80feabf9adbf@redhat.com>
Date: Mon, 16 Mar 2026 08:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] hw/arm/smmuv3-accel: Check ATS compatibility
 between host and guest
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Matt Ochs <mochs@nvidia.com>
References: <20260312210328.2016191-1-nathanc@nvidia.com>
 <20260312210328.2016191-2-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260312210328.2016191-2-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: apTThb06ZB9i5NOwrjrXeA-oiOrhr_mO5GBbcXIpxP4_1773646333
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
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

Hi Nathan, 

On 3/12/26 10:03 PM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Compare the host SMMUv3 ATS support bit with the guest SMMUv3 ATS support
> bit in IDR0 and fail the compatibility check if ATS support is opted as
> enabled on the guest SMMUv3 when it is not supported on host SMMUv3.

Miss
Fixes: f7f5013a55a3 ("hw/arm/smmuv3-accel: Add support for ATS")
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 17306cd04b..fe78ce69a5 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -101,6 +101,13 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>                     smmuv3_oas_bits(FIELD_EX32(s->idr[5], IDR5, OAS)));
>          return false;
>      }
> +    /* Check ATS value opted is compatible with Host SMMUv3 */
> +    if (FIELD_EX32(info->idr[0], IDR0, ATS) <
> +                FIELD_EX32(s->idr[0], IDR0, ATS)) {
> +        error_setg(errp, "Host SMMUv3 doesn't support Address Translation"
> +                   " Services");
I think you can keep it on the same line. Checkpatch will just issue a
warning.
> +        return false;
> +    }
>  
>      /* QEMU SMMUv3 supports GRAN4K/GRAN16K/GRAN64K translation granules */
>      if (FIELD_EX32(info->idr[5], IDR5, GRAN4K) !=
Otherwise
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


