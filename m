Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2128650ejc;
        Mon, 16 Jan 2023 23:35:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdYUB+09fibwXRhlYmzJTvxnVMELRU1ybbAFPYWE1WJRvt4FNvjgbVVtc2b4M9QVb6m8Is
X-Received: by 2002:ac8:70da:0:b0:39c:da21:6bb3 with SMTP id g26-20020ac870da000000b0039cda216bb3mr2449501qtp.56.1673940904283;
        Mon, 16 Jan 2023 23:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673940904; cv=none;
        d=google.com; s=arc-20160816;
        b=RDgg73xyBUP6G5MxcRxGZrhGsGinGoj2bHkCfsHJ9h6VdC76/I7cEEg5HXATRjzWKP
         zReRfHCLLPA8TWbWZghYCobnFPI4Iq9CeCqu4XFrm9ffvK4r8Sbmg2w7cxruo9GYQz3g
         IEGtS9ER95NvwSz6+gx6KIdJNVdGIi6uJmgI+uhs4Mr1k8m4gaxwwkTTyZaNwSy7Xig5
         NWpOysxTGghdM5hhS/bgwjHEDu7Lw01w4E0YGSaqHnARXZV2+0UpW9TQqwRgu6VdUm1S
         EeLi9a51dxL2xnvUQdQLGE1vJGQXGNPxwtAXtYeZkiaHZXQsKxgaM92s64A8uQh445/5
         vV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YYgYZBj3Ft9SEGcVTq83+VwIbHreEzwzIZfHmyz9o9o=;
        b=MpzJbjnKiOdi3vydm6QiLf0ZOdzbwFB8ylnv/9s7doBYaj1lCtoBgePIgFypzgGQHw
         9SmFjF7Euo/MXJjopFaaoiVZNRp2SGj5cbIXriLmJ9uQaKlhAgwx0oyBJUKI4Am8Sjo+
         nXEuhP24MQ8s7gxMtzHv8ehO0Az6YZ0mzUY3hm/NXQpb1h/okVf78Vnw4S5O/iF5CRMl
         q79Gy4U7/jEoZ7/1mK6sImXmKb/Uh+lLUZBZUE5Jm0YfY5k/+tVUT3f1iH/EsCcPeEXe
         bY9/yIgJnvn/7wULQr1OCiYMk1YAH3QbRwNsc4/40bSjP07DprLpZEj66/bVPirQ9Gq3
         HpmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wG+3YPVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18-20020ac86792000000b003b630226888si2762756qtp.551.2023.01.16.23.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 23:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wG+3YPVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgUW-0001Y6-3a; Tue, 17 Jan 2023 02:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHgU7-0001VL-GU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:34:30 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHgU5-0003da-F1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:34:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id r30so5194332wrr.10
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 23:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YYgYZBj3Ft9SEGcVTq83+VwIbHreEzwzIZfHmyz9o9o=;
 b=wG+3YPVkliW4p1a+pboo/SPsbgaGLX9tYrSTna59L/amT9E65TGqjmIgMWNs4+YCdr
 hImHrS+DRcdUhz7F/o5QAj7vS607ppa3TbqHui+nGZZkOU9+swQWkw/XnW3fmuAlxS2o
 7ziNf10Oim48x+5niYymU8z+1RuiKEnVTWfzFITkWVeAztsEXl88qJCLSY0HlMvqqIO9
 AARMaPCnvKYdfEzvYY5iBBTbgFKLhhc51LTjSlGxW/A3XGLE0S4cDAygBObXYUZtQGKm
 iHPlGN2eBa1WExZ03kU8d+2eN9Im9moDcSi/eBryqNq19AUmEgKxGuplBB2kB/5sexBE
 WOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YYgYZBj3Ft9SEGcVTq83+VwIbHreEzwzIZfHmyz9o9o=;
 b=tnrLZ2k02KBz87babojAbeFnheLbfutGPc81tPQXSjlgrpUEElNyq1VZgroFHsE7gd
 NUy4qQZIEsabgXGaymKN/QBtqvPTQxyr24d0odQ5q+ISVDkMl6z7vp+Hq6syEOZb5AK3
 TMtojIcpRy+SQ/Qr8EMX6+DBQEbHEEu5n7GaDYbybgUP7kQXpWcccHQ3NfpSsgDRY8I5
 2TCq6N2skVocGUHcaQxxQ69RqQh0Nrrwin1fizUcQ3Xj/0+OWD8ZTCJBXqKbf55c3i07
 8lDeFqnpFUSPoOH8V5WliqkAoLEAS6RMNoSB8DAgwDfvUG1ge9ZvELmB2jZDd5yBEE1Z
 BTWg==
X-Gm-Message-State: AFqh2kqIy6sZ8FkNyuaR4G3KGasnLT/99GjBUo5dpE5eZCAimYRrnj5s
 zmANV42T0CfzmmTFwimV96sU1w==
X-Received: by 2002:a5d:4591:0:b0:2bc:7fdd:923e with SMTP id
 p17-20020a5d4591000000b002bc7fdd923emr2036746wrq.22.1673940853896; 
 Mon, 16 Jan 2023 23:34:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm28430262wrm.6.2023.01.16.23.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:34:13 -0800 (PST)
Message-ID: <3278ab81-ccdc-9ccc-e504-dca757db5658@linaro.org>
Date: Tue, 17 Jan 2023 08:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/2] hw/arm/virt: Make accels in GIC finalize logic
 explicit
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>, Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20221223090107.98888-1-agraf@csgraf.de>
 <20221223090107.98888-3-agraf@csgraf.de>
 <615a0ee5-1a0d-1cd8-cd16-ac076d6db7fc@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <615a0ee5-1a0d-1cd8-cd16-ac076d6db7fc@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lQN0ZHHAJfBt

On 11/1/23 14:35, Zenghui Yu wrote:
> Hi Alexander,
> 
> On 2022/12/23 17:01, Alexander Graf wrote:
>> Let's explicitly list out all accelerators that we support when trying to
>> determine the supported set of GIC versions. KVM was already separate, so
>> the only missing one is HVF which simply reuses all of TCG's emulation
>> code and thus has the same compatibility matrix.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> 
>> @@ -1938,6 +1939,9 @@ static void 
>> finalize_gic_version(VirtMachineState *vms)
>>                  gics_supported |= VIRT_GIC_VERSION_4_MASK;
>>              }
>>          }
>> +    } else {
>> +        error_report("Unsupported accelerator, can not determine GIC 
>> support");
>> +        exit(1);
> 
> Looks like qtest will use arguments like '-accel qtest' and a 'make
> check-qtest' triggers this error_report() on my box. It'd be good if you
> can have a look (as I really don't have much knowledge about qtest..).

Indeed, I had to squash:

-- >8 --
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 611f40c1da..b17e3dafa8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -50,6 +50,7 @@
  #include "sysemu/tcg.h"
  #include "sysemu/kvm.h"
  #include "sysemu/hvf.h"
+#include "sysemu/qtest.h"
  #include "hw/loader.h"
  #include "qapi/error.h"
  #include "qemu/bitops.h"
@@ -1930,7 +1931,7 @@ static void finalize_gic_version(VirtMachineState 
*vms)
          /* KVM w/o kernel irqchip can only deal with GICv2 */
          gics_supported |= VIRT_GIC_VERSION_2_MASK;
          accel_name = "KVM with kernel-irqchip=off";
-    } else if (tcg_enabled() || hvf_enabled())  {
+    } else if (tcg_enabled() || hvf_enabled() || qtest_enabled())  {
          gics_supported |= VIRT_GIC_VERSION_2_MASK;
          if (module_object_class_by_name("arm-gicv3")) {
              gics_supported |= VIRT_GIC_VERSION_3_MASK;
---

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


