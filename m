Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4751822ejc;
        Wed, 18 Oct 2023 09:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4cSBcbpsrChndz+Zy9ORaCVLj2E+xM6JQPrtyxUAdg93QxuJQB+1hrMArkS/Xw3VClFno
X-Received: by 2002:a05:6214:5296:b0:66c:edbf:ee9c with SMTP id kj22-20020a056214529600b0066cedbfee9cmr5824429qvb.30.1697645585808;
        Wed, 18 Oct 2023 09:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697645585; cv=none;
        d=google.com; s=arc-20160816;
        b=oH+8UMFlbSbAUEHzsWZB6IOALKECreIYNrRPIQFcZ/AnUnkOWYBBrTWEzcZAZOg3x2
         Ad81WL8O3yxsOO0grytvJ0+SL2nk5+Jyzedh1pm91P+JauYpGzE2tVo8Zk1z4AVNkaPZ
         y7oA/2EkA02+eomtEDfiMwi2FkAOPvX++S3TUrFo9yYAQHiWjGgLrNM3Z1HaefIkRETE
         ssiBlNHsZb88Ff4BVkMXMF5QgBsLn8wSlMP6TeZ5wKwDOgUSvWMVXl9pGgClAPlA+PeH
         PcwxQt5x1wrxwjwlxomOasT7g2YSnt41GKI5BD2xyNCYxcP3SMmWR+fvvzJDHmX8s9qV
         7zUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=i5eLR4Y03O+qFqGmSuSWp4YUJKeV8dKkaktp82PE8Jo=;
        fh=5KD7BjLGFDublHDNRImOelVUthgQZWbxdG3c9Bb6fGg=;
        b=qO6gHJg1MZff39B7PimcHtHLZLuR8+ZC4Z3VO88UgZmJghK11v2onDRbQoGfj/rsJi
         iEYFefMkjsO4bNYynprhKwmrfC29NcDtjiTYUldPwPrP/I5AX9ac0bmEJD4vVYIYm7ov
         oKhShagci1abC+3yYJlTtsVOEAru4X2LpkqQIfB3r6GxoZ8qgOTnSWwwLJjBCvcHb8L4
         iFKG2VFJz7tmt5ONckqyai0EadyLI7Mz240moORf0NJhpwSH2C7jMX9Cvdtad2JAIhbi
         cDVmekvH/qmloM8WzPDmfss9gTQQT1l9EoasMg+r8C0Y0lv42lwQ10UmLpO0wtgzrtNJ
         3fbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKumzeaT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im2-20020a056214246200b0066d08b5a900si147499qvb.557.2023.10.18.09.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 09:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKumzeaT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt96L-0001fZ-6k; Wed, 18 Oct 2023 12:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt96G-0001VN-RE
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt96E-0001SJ-PC
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697645324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=i5eLR4Y03O+qFqGmSuSWp4YUJKeV8dKkaktp82PE8Jo=;
 b=YKumzeaTZCI9JdQoz/abUnWJ41GoqqR2CeT20PvyTr2OV/QcGztlnY8PAVKUJiZXQGV/67
 ykAlj5/t1wtJVGfYIci5hVoy8P1O3p3bSowSC095ktb1/csodhimBXpwikSijeC+GMCswJ
 4ePItrjncfZkqnuvhsZs9eTWfv71RQk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-Vt8dImyhPAy7lhUtsyy8mw-1; Wed, 18 Oct 2023 12:08:33 -0400
X-MC-Unique: Vt8dImyhPAy7lhUtsyy8mw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-66d4aa946ceso61472976d6.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 09:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645313; x=1698250113;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i5eLR4Y03O+qFqGmSuSWp4YUJKeV8dKkaktp82PE8Jo=;
 b=iiAFhPbcofWle6O/sbZO4XA8nY2C1wZfRqXzdndIEQC8bvzkMP8vTvbr3EX9nTd29q
 zJYW8XJDaTfH1qlKr8mBlUKeh2W8p7QKeRHBAPHIkh69Y0WRa1N0SKsGBL+CScnvU94K
 X2k5wi6acpMCGDaORRHBAvNgjrDF4y0VyqqEImUNpbUTSTm0xGHIAJhwsgA0G8JF+BRO
 Vez8xSTsbb6/+Fvc+T2AkwNHWJmNIcgGzev47/phNrcnQeilwsf5pYC8c4X+loISX3HU
 ecnwhDepH6C0Gqzc5flhuktlCTXXpr6bsiJ/rBEQ9+VXQnxddotf8WdzKTKaiGT8GK7N
 8fBw==
X-Gm-Message-State: AOJu0Yzs6E1kBeFaWhipLi53Qj9LdONTc4xpJvybfKUaXXjQecCb0RBK
 wX8q2+tDMRTWrAya2BEHAD98IG2QZtGgjZ2o6FqJbUiGCJL669jPqXBsZXL4kyGLkR1mHjkVisQ
 PujFebCT9PRjy
X-Received: by 2002:a05:6214:2023:b0:66d:81bb:5234 with SMTP id
 3-20020a056214202300b0066d81bb5234mr2140473qvf.11.1697645312972; 
 Wed, 18 Oct 2023 09:08:32 -0700 (PDT)
X-Received: by 2002:a05:6214:2023:b0:66d:81bb:5234 with SMTP id
 3-20020a056214202300b0066d81bb5234mr2140441qvf.11.1697645312761; 
 Wed, 18 Oct 2023 09:08:32 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 dm9-20020ad44e29000000b0065823d20381sm62884qvb.8.2023.10.18.09.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 09:08:28 -0700 (PDT)
Message-ID: <1dadf5f0-10ca-4f88-ac1c-c3e5a821de04@redhat.com>
Date: Wed, 18 Oct 2023 18:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] hw/qdev: Ensure parent device is not realized
 before adding bus
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <20231018141151.87466-11-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231018141151.87466-11-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hMnoQMx9pMLW

On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
> qbus_new() should not be called on realized device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/bus.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/hw/core/bus.c b/hw/core/bus.c
> index c7831b5293..c92d07667b 100644
> --- a/hw/core/bus.c
> +++ b/hw/core/bus.c
> @@ -21,6 +21,7 @@
>   #include "hw/qdev-properties.h"
>   #include "qemu/ctype.h"
>   #include "qemu/module.h"
> +#include "qemu/error-report.h"
>   #include "qapi/error.h"
>   
>   void qbus_set_hotplug_handler(BusState *bus, Object *handler)
> @@ -163,6 +164,12 @@ BusState *qbus_new(const char *typename, DeviceState *parent, const char *name)
>   {
>       BusState *bus;
>   
> +    if (parent->realized) {
> +        error_report("qbus_new(type:%s parent:%s, name:%s) but parent realized",
> +                     typename, object_get_typename(OBJECT(parent)), name);
> +        abort();
> +    }
> +
>       bus = BUS(object_new(typename));
>       qbus_init_internal(bus, parent, name);
>   

Sounds like a good idea!

Reviewed-by: Thomas Huth <thuth@redhat.com>

