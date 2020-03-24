Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2366135lfi;
        Mon, 23 Mar 2020 23:17:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvfa/jKIWZxaC3+pn5EQecyYweTDbIJ0CftzuGtsp4ptW1vQ83M35kXPHzImnaR4Psa8pg0
X-Received: by 2002:ae9:e894:: with SMTP id a142mr24759131qkg.379.1585030631940;
        Mon, 23 Mar 2020 23:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585030631; cv=none;
        d=google.com; s=arc-20160816;
        b=havO3dqoKf3oPOZADSV3NwZy937WlokRtYKXcip57vq232lVLNFwC92r5ONqsMf7HL
         MPoKWU/E1C2VgneAjn6tyJy+WKCcS3G8Dm5nlI58NXhGYutX8gPUYfBYvb4KYRWgoCsY
         UnPmP5AeNsFeJ4pL/KRBzo399v7r3pEiMT15eGt/Go9Ht8pz7Uel1BEUn4Slhq7ByBGS
         qVelNgX/IBBuF5IirJlorPOQE8ppo5xvYU8kFvNyWKg08o/8/WyTEYMZ2xck6WO8s42Y
         Mo2f2k0YT3f0aITvxC5qQ8EPv1uZuaBdnpVKJSA7lcqjfW82S5ZT8FKbDe4KvgsQfpog
         uHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ntwu0iNk5SxCHAsBwOrQKWEafoKA9mB3OGWLeaqo74s=;
        b=tSH4f+9XltjW/P94sBi77aPSiEjjElb5pcsIhh2/L/r6HzMDdtYjlXfoEHlX282OKT
         2EuG4101ebQLJ6DnwKqPyoaZmKLiUDaJO3sxNJ0yphbTpvrDHCOcZfKedBUTlI2kqtde
         WGt6f7Xamnae5kviFAwYwJlwdJ/j2sfHefyX85bvbvpet2oaK0bm3JmuUT44DMfP/tGE
         sN6ZS6YdpT4X5QWdJEBOoLkGbras3G8ZqGxsDcQbwiB5bbvj+Jcwg4+gSC0kp+v121+n
         h+F3+CWenoba9YplJAI3em5sscF7vVnwd6IlSOc29WefDELBHl0Fi5PGr5MhkxTErAyh
         QJqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ArxcFgzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si9196898qtw.272.2020.03.23.23.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 23:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ArxcFgzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGcsB-0000le-A7
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 02:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shannon.zhaosl@gmail.com>) id 1jGcs3-0000lL-8L
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 02:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shannon.zhaosl@gmail.com>) id 1jGcs2-0007Wl-5O
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 02:17:02 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
 id 1jGcs2-0007VT-0c; Tue, 24 Mar 2020 02:17:02 -0400
Received: by mail-oi1-x242.google.com with SMTP id k18so17484524oib.3;
 Mon, 23 Mar 2020 23:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ntwu0iNk5SxCHAsBwOrQKWEafoKA9mB3OGWLeaqo74s=;
 b=ArxcFgzP4sznUBhNmRg2O6o4lVtFtUn0x/Tz3s6yChWB05s3YDIlNrx1081JchJ+BA
 qmGPzVlJ6YYVYdm11rXSyk4WMMUc8juLKSr2esDvElBzSnCq0YBAif2u8W2nF/G/un/r
 WMk8DGR0QDF604XADy/37yhQ7c9hFIyKlg7lxhw5liis5BILbsbIu+F/rLAtRw1onoU9
 GhzOJwNOZJXq8msaLHfPAyCONMyJ4QTivprAEDtIEEhTEeNVu7s1Omlom8r1kIjQJ2K9
 odIG62vHCzo1VEPzI71ZwH8Qbn1nkzfwLdZoaSfUUF99Leb3Axl4ACUJovuLWL1TTDqF
 Y6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ntwu0iNk5SxCHAsBwOrQKWEafoKA9mB3OGWLeaqo74s=;
 b=ZYBSzoXYO7Gs+3nX68xgiaZQV2GCHrG8iPKdsvTcQfm/Z5R5o12NEZfeAjLL4p3MLF
 HLfYr9UtEoXoUSqotcbgGG3LjGgUl4cRa8Y8jCpR0YAKL5uTOR9gICIPeG0RVuOUT6SP
 7zUcGq6+APipEu/c3Y8+6dU/Pg1EJG6mC3T4N+zrJ42nbqmKoOethU9EBo3q1XpyIo19
 qbrZsJTEKNl2hRj32/Whr+ck7CC0rANYE5Bq73f40DsiOw6lr4SFOgVL75dUgruukrz9
 tTYpGbLcor9wP8XkQdPQuIAdWkIArPyxGbOYL/JGAl5o6uV0oCDoB12jMTnzbFz5VYJ1
 kGiA==
X-Gm-Message-State: ANhLgQ2hmpds4ERJNA+R4GwSIBWEICYQiD3ylzwNgF8f9w/tqh7ZLPx3
 EGX1SoZKqJoPpxUdZI3B3PU=
X-Received: by 2002:aca:3a83:: with SMTP id h125mr2236038oia.64.1585030620674; 
 Mon, 23 Mar 2020 23:17:00 -0700 (PDT)
Received: from [30.43.122.30] ([47.89.83.57])
 by smtp.gmail.com with ESMTPSA id f3sm2815282oto.42.2020.03.23.23.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 23:16:59 -0700 (PDT)
Subject: Re: [PATCH v3 07/10] hw/arm/virt: Add nvdimm hotplug support
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-8-shameerali.kolothum.thodi@huawei.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <079d4ae2-4be1-feef-4729-d94c85431a6f@gmail.com>
Date: Tue, 24 Mar 2020 14:16:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311172014.33052-8-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 david@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d0AqmhgBBBt/



On 2020/3/12 1:20, Shameer Kolothum wrote:
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> index 911a98255b..e3abe975bf 100644
> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -63,6 +63,7 @@ GED IO interface (4 byte access)
>       bits:
>          0: Memory hotplug event
>          1: System power down event
> +       2: NVDIMM hotplug event
>       2-31: Reserved
should modify "2-31: Reserved"

Thanks,
Shannon
