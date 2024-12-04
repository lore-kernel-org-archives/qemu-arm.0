Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp501460njb;
        Wed, 4 Dec 2024 12:51:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMWiwr+uqtFHcDBvkpzSgHnbU8HDKxPQ86/Uf+O0M0EEB/RNj+d45sFpaJu4GKj2MJhEGoUvXRWtSYPg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+bhB025hou2xOmfCcZ0oFCZOknUTo526UmCnEKTagkmAgQEGw0cT7YzMMY42r7vYMeqPL
X-Received: by 2002:a05:6214:27ef:b0:6d8:a730:110d with SMTP id 6a1803df08f44-6d8c420c24emr98890776d6.0.1733345482641;
        Wed, 04 Dec 2024 12:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733345482; cv=none;
        d=google.com; s=arc-20240605;
        b=HfBBo8CbYDbR4kybZfjFQI8ITv7rXbQbu8/G1eCZoKHWJ8nwTFi/ZaELAjTWZCg4NH
         HfUJC3bfM+n2UCJIFeuE1maVouOvMCNfHG5rBHE0j0cDHbsU3Oj750OTwTuspGKStpoP
         NMKWew2FxxUhIiachbGk6JhT1DZibktAhpBl+0GJ8+sN6pCHpq6Je7GHaaZ3m9tShgGi
         eSFyMsQnkwnU+0TVlK8NJCJgkMrOSAM15oPuOGEBW0gnNiGpmDD2Ke4CT1WDIVH4zkoS
         01Pu9uz28nB/x3NGzia0ifeR8rq4reSceBkFT3PDvmV6Mst5HNLRHmDTOmXa9lUwMFWv
         VYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ieaDmxmi/VDvGvPyu9m/mprRo5fRdXLjUqQSWTteXxQ=;
        fh=kwaciWR4cBmnBAWEst3dvWaOsxiYIQpcr7UYuao46x8=;
        b=Au48RcaOVmlxkBojPoHBZOQ6cB7qMCBaUNLqREFIryRd9jjHofCll2daW6XoR2wPvu
         deQt9op6NV2QSVRH5dCW8GQNIuVuCkn98Tjy256J4fvUBpbsZJGuZjyBFtEkxuTFXuN9
         PUnFy8mJeFklXER04Yb3tkRHP6GVw5mCLl2r+YRS9LvX4U2hvaSnG3hGPQtqKZg5/+6X
         fKJDSH+e4CC1EFm8SNCZxugPPJzcAhvuufO5noe1vQOwNqaH6dep4aaNxCkEh/yz+71K
         DhcxOOOkfhEHpe1c9H6On8rg90yYGh7+wmHSw8Lergfm+snz7P/utPK1RKOndgj+6Cq4
         xKtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDP+O5MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8a2cbddadsi93238896d6.451.2024.12.04.12.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDP+O5MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIwKv-0006pC-IP; Wed, 04 Dec 2024 15:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIwKs-0006ob-RA
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:51:03 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIwKp-00056y-MN
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:51:02 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so1432405e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733345457; x=1733950257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ieaDmxmi/VDvGvPyu9m/mprRo5fRdXLjUqQSWTteXxQ=;
 b=fDP+O5MVgAwczi9UI9YqTkf9H2LOlcOm/S2n5ReSRB7HmK365dxGNyvy5MdWKHWSNo
 YXP27gp6KaXJQyqCFT57KPpsqF/2mwHSJrLDYZG+xRr9pmk8fxnS1bgKol31SMj5Gr5n
 Ged9iBNH9Wwm8Sx0b7RjPPHaL4/wyyXnW5QEx3MMHegEdV6SDR7945X4llOqM1jL3Est
 YT8Hf2didnCzLJScDAKnWzGKDFtmUngKCwViodBRPefl7eEZ4oJm5M/Gzz5GpUKlkpUO
 3eEVxazDTpjX7G9DkwlOpB3XkTM6vNJXag2fV7zECsZyhtxZUGHz7TYzuXY8nmT65CaM
 i16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733345457; x=1733950257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieaDmxmi/VDvGvPyu9m/mprRo5fRdXLjUqQSWTteXxQ=;
 b=P4z+VJ6kSetXV0DPVW1nQnMnv+ytwVTfioW0/aUk2fp2keafgv+a4E0QWRkCIa0byy
 wJAhvmXjHKi2Is1eP4+39BArl2aPhgG7e2q8r5s18XpalnRAZHZgGKDX+t2AZ49wvBa3
 W686zXgQsXTVq9HoqxUJ2osalvLk18pk8Z4MwXxXvsNBG/mvTcy1dQs0tiVuxadq3s94
 Y3ollcZYLLiK+ANqiQIGQvGg0Km57qgcFbw8O+YQDhl/04hyda4zBL1JCiY3SjV10ine
 n9TLHcbDJH+6wA6Y8NJbKDl5FPypWILhMt4SPffUOHoA76XeGXkfUncfvJ+xkn0la+2f
 zcrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK4beTI2jYw8Yufj6BY/jCfNu72eYaU2vZb+X0EDdOzRK9pQHSbav7+uAU+yjuqvD1aF7jhueydA==@nongnu.org
X-Gm-Message-State: AOJu0Yy+6eXS4SNvoNO1TW39bZKTeBjXbP/fGmJpYh/4oaommP2tCH3/
 oXVOsYoocanbP/6frGbV/h+BacqtGY8Vofgr5xD5yLZO02lfsceytSiZq0euRtQjn53LNViDSAE
 s
X-Gm-Gg: ASbGncuaZhiUZZgxyHeEK90g8l5KPtiX/1jFhpS74sOSMub75sua9FlB8X/ldnavR8N
 qQIcel4Y388Ytv/CYFYHmFOVJldmNzkzobIrO0SSHcA904rtVaSyhfF5okYPVOOuD1e4PRiwiRI
 PxzPMYjytGUEJ9G7Sk09CG0HvR4/+CKm8/AQfETATD6jfXJl7IO16+tMXTl0GqfliGNQISsfeKJ
 hxQwyN4ICv9Y1zm/+fehUyVf5XgUYkIz0O3+0yvFIMFoqInKYgZ2XTZBHtVvOn4o1l1X7wh3BVU
 9BvwLUDa7y07oicb31dL2ao=
X-Received: by 2002:a7b:c309:0:b0:434:a378:51a8 with SMTP id
 5b1f17b1804b1-434d4177fe7mr43417455e9.27.1733345457470; 
 Wed, 04 Dec 2024 12:50:57 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52b841esm35712395e9.44.2024.12.04.12.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:50:56 -0800 (PST)
Message-ID: <c4245af0-3dd4-4cf6-a786-c15fa079ad05@linaro.org>
Date: Wed, 4 Dec 2024 21:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: bump default memory size to 2GB
To: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, leif.lindholm@oss.qualcomm.com
References: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_SkZ+ew8AAVpBHuw-9YW4S5wFbB0Vqx+dBzXf97JGDGw@mail.gmail.com>
 <cd635753-4e2c-42d6-bb7b-d558d90f59d7@linaro.org>
 <2106db77-88fb-4113-ae09-9bf77bce6ad7@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2106db77-88fb-4113-ae09-9bf77bce6ad7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +mfp+2fCRW/t

On 4/12/24 13:17, Leif Lindholm wrote:
> On 2024-12-02 10:53, Marcin Juszkiewicz wrote:
>> W dniu 26.11.2024 o 14:14, Peter Maydell pisze:
>>> On Tue, 26 Nov 2024 at 08:49, Marcin Juszkiewicz
>>> <marcin.juszkiewicz@linaro.org> wrote:
>>>>
>>>> We are working on adding RME support to SBSA Reference Platform.
>>>> When RME is enabled then RMM (Realm Managment Monitor) takes 1072MB of
>>>> memory for own use. Which ends with firmware panic on 1GB machine.
>>>
>>> Reasonable change, but isn't it also a bug in the RMM that it
>>> grabs 1GB of RAM regardless of how much RAM the machine
>>> actually has?
>>
>> I think that the goal is "get it working" first and then optimize.
> 
> I agree on a different platform this could feel quite hacky, but in 
> reality even 2GB falls within "ridiculously low for an SBSA platform".
> 
> If we're worried about overhead for CI jobs that do not require the 
> feature, we could always conditionalize it on RME being enabled. But I'd 
> be happy to wait and see.

I'd rather do that, since it is as simple as:

-- >8 --
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e3195d54497..66751d0806c 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -51,6 +51,7 @@
  #include "qapi/qmp/qlist.h"
  #include "qom/object.h"
  #include "target/arm/cpu-qom.h"
+#include "target/arm/cpu-features.h"
  #include "target/arm/gtimer.h"

  #define RAMLIMIT_GB 8192
@@ -795,6 +796,12 @@ static void sbsa_ref_init(MachineState *machine)
          object_unref(cpuobj);
      }

+    if (cpu_isar_feature(aa64_rme, ARM_CPU(qemu_get_cpu(0)))
+            && machine->ram_size < 2 * GiB) {
+        error_report("sbsa-ref: RME feature requires at least 2GB of RAM");
+        exit(1);
+    }
+
      memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base,
                                  machine->ram);
---

$ ./qemu-system-aarch64 -M sbsa-ref -m 1G -cpu max,x-rme=on
qemu-system-aarch64: sbsa-ref: RME feature requires at least 2GB of RAM

$ ./qemu-system-aarch64 -M sbsa-ref -m 2G -cpu max,x-rme=on
// OK
