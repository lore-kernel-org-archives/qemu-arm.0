Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5729475eje;
        Mon, 17 Jul 2023 07:12:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG46zYOqSCUL79M0/ZfKM5OwBWw8Zj+Pw7wnVLXKIsh0K5V8qnNpI+aW9ePns7UjJI/e0Ys
X-Received: by 2002:a05:622a:1992:b0:403:2fe0:a445 with SMTP id u18-20020a05622a199200b004032fe0a445mr17125705qtc.13.1689603131383;
        Mon, 17 Jul 2023 07:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689603131; cv=none;
        d=google.com; s=arc-20160816;
        b=0FRZgDIhtlAuWhG6Dpv7phalzxcZhR+izqJajjaSJ6TrO1oZCEItaw5fQNIYNsAIjs
         gc2kz83MDrHsUbQAbZkMF/mV6izsz8LpaesTSijepLLbCx+hq7mjzf9T4ATe3BCdglMz
         GAzlbH6X3xOWUg3lpfCHwJzAkIli1esTVL+agWUs+qk+BRsSwFcO0FPVUYsOZjGYJ1gn
         DOSE4BSvGR4/qbvECNK9VENwA9xnQ3x1GXQTP6qQIDE8a9dF1mtf9E0SmoRpcLWVJBKI
         T0UAghtwW5C1mAzeIapW0O7ta/8Vpq+SvGXDOO6kkigNjGMHHYm5uaE/ry94b5JPi/X7
         4jHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GDqb+Yck5FSpqI2m5af3Do3k0WAk4wWd+pHmgZ0EuZg=;
        fh=/lRmkoDywsnmHiNIlWm8e3AwWsp15JawbBU+IJLOxwo=;
        b=ExSiNgUHxR7AQffxLztv5vKmrw0dl8OXUAZ0Egol9riqss0lQPrCjMIN47TBjRmU1Z
         z3sfxi9QKCo524hf1xu+ngmKP0GA8lKiyGfgs7eN+0PGZp3j+vRLH8IR/rfwf6JkrA3e
         UpO/x/mZtzJY8bOVrearRwXzLm5jR2QmShjJb17jNPo1qsuGrth/rah4CIHLx8ruB0G/
         jiLa+9V9Rw8km3bvAGdoGGcN1LY7sCBLj8SxbGW+0LxS2rZaFeF/ZAeKgwaXtA3J3gAY
         Jra1ze38T96SBxqlLlc/ThAFXuin1iaReT8IY3qVkl2VXXnSSuR2J78p/Hh1WIMRnbgN
         5wAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M8N+h3dg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4-20020a05622a020400b00403e8a2a97dsi2388503qtx.546.2023.07.17.07.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 07:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M8N+h3dg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLOxC-0006Wm-1G; Mon, 17 Jul 2023 10:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qLOx8-0006PX-1v
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qLOx6-0008Mp-M9
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689603111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDqb+Yck5FSpqI2m5af3Do3k0WAk4wWd+pHmgZ0EuZg=;
 b=M8N+h3dgVNf8yaogI61kS6dzIHCEIy+YgRpyAc8s6eHMRcrrZ6Lg+05a2z18mP+BCSwyxy
 1mZkHanPwdi/AqZ5lTerOYs4g7Aa1kXJ/rr///rMrnMvBEPXnisHi3LB9opyYB/kBkOY90
 AsCWoCS8eQhsk+R0S6vaKAqtZQg430M=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-v8_CUCgWO2OGHOew4cwLJw-1; Mon, 17 Jul 2023 10:11:49 -0400
X-MC-Unique: v8_CUCgWO2OGHOew4cwLJw-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6b9cf208fb5so2750846a34.3
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 07:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689603108; x=1692195108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GDqb+Yck5FSpqI2m5af3Do3k0WAk4wWd+pHmgZ0EuZg=;
 b=GaVE8BQX1lWh0ZmvCVXrOkPPMhuQDjnJUcOd8YKVQ2A73n/es3A3c5PL26cHAOj4ym
 +AX6tqntsPo6o4ojFcpkmHEHJoRR5aRnYSQctFX5Dj7vF9x2yiqwDEnsCpizVi3OwudG
 AndXitNk7IAaIXsMwCmhHtpvCOL41gXZVgvU6y0CNRHymnW6bo+vvNxLe/LRwyZukHkg
 mPgO0xhqO5Ha3wURGfsL/WcGQhSZUjGo4WS6CU5Kz31nY9HDUb6t7/n8rc2VpoWbvSMJ
 4ysZEjXBusirlE4P6rPdQ5faPEVNrE1IH0JSg5GxW2tGylclGc+Eq1jUQlPv29uiyOa8
 gRbw==
X-Gm-Message-State: ABy/qLZgDMSUztl61F+QTQr6K/lY70dPuHbloGenmvCpnNhxYwWxqQke
 qR0jfue5lEvU0oU0eI8rPXLU1KqDg5OUUC8q75X3l4B3Fy2RNQnPemptHxPJht9xQhoSxJ/+c1y
 8H6/oU6IR8Btp
X-Received: by 2002:a05:6870:d1d3:b0:1b7:8836:95c9 with SMTP id
 b19-20020a056870d1d300b001b7883695c9mr13379542oac.42.1689603107169; 
 Mon, 17 Jul 2023 07:11:47 -0700 (PDT)
X-Received: by 2002:a05:6870:d1d3:b0:1b7:8836:95c9 with SMTP id
 b19-20020a056870d1d300b001b7883695c9mr13379515oac.42.1689603106626; 
 Mon, 17 Jul 2023 07:11:46 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-137.web.vodafone.de.
 [109.43.177.137]) by smtp.gmail.com with ESMTPSA id
 c14-20020ac81e8e000000b0040331f93ee0sm6370638qtm.77.2023.07.17.07.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 07:11:46 -0700 (PDT)
Message-ID: <f1ec6d82-af18-b399-4ef3-7a1249e705f4@redhat.com>
Date: Mon, 17 Jul 2023 16:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH for-8.1] hw/arm/smmu: Handle big-endian hosts correctly
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Eric Auger <eric.auger@redhat.com>
References: <20230717132641.764660-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230717132641.764660-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oel0WQfe0hm6

On 17/07/2023 15.26, Peter Maydell wrote:
> The implementation of the SMMUv3 has multiple places where it reads a
> data structure from the guest and directly operates on it without
> doing a guest-to-host endianness conversion.  Since all SMMU data
> structures are little-endian, this means that the SMMU doesn't work
> on a big-endian host.  In particular, this causes the Avocado test
>    machine_aarch64_virt.py:Aarch64VirtMachine.test_alpine_virt_tcg_gic_max
> to fail on an s390x host.
> 
> Add appropriate byte-swapping on reads and writes of guest in-memory
> data structures so that the device works correctly on big-endian
> hosts.
> 
> As part of this we constrain queue_read() to operate only on Cmd
> structs and queue_write() on Evt structs, because in practice these
> are the only data structures the two functions are used with, and we
> need to know what the data structure is to be able to byte-swap its
> parts correctly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   hw/arm/smmu-common.c |  3 +--
>   hw/arm/smmuv3.c      | 39 +++++++++++++++++++++++++++++++--------
>   2 files changed, 32 insertions(+), 10 deletions(-)

Thanks, this fixes the alpine test for me:

Tested-by: Thomas Huth <thuth@redhat.com>

