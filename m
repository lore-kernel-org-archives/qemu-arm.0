Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1976445lfp;
        Fri, 1 Oct 2021 23:41:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYYi1D0ZYPef0J5bPPHegWasdJyBRNC05MG+I1n4XwsfJY98dFoIeCpCBBCrtdXhW4HI5A
X-Received: by 2002:a5d:8844:: with SMTP id t4mr1483849ios.186.1633156911107;
        Fri, 01 Oct 2021 23:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633156911; cv=none;
        d=google.com; s=arc-20160816;
        b=o/7gE3It7DhXvh2lYm2l7S85hFsF/9WNRZ3gkfPDq39xAOVjZfebiQEeEO54Jw97ce
         2ejPWjDLHRB+LWbtyicRpj9YJ1i0S8bSixOuM7hwT/A456PxUT5zkUQ+QNmaH7HKG/13
         zyhxdbqqaN/zj1Y6eRd03VbhGvVgSbbGe6xTB/zAjbxFCdk++8vGTyVzQQoTPT+JhjDH
         VsS2OwWJBasEQ05QsPxge8yCGJCnLMYrzzdVceABpgw0bta+5KN/nUc4bqv+jRunXth2
         ijKisRmcIxIQ3AM2Q3ZxK32yvFDyrRBd/aej8KnqzfftgiqqyAexW4gpfHad+TB2IYhU
         fvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=k3YwzyCfrWdbxV2jLlz9OuKZz7WRdWtIr5Uc/2COSU0=;
        b=KXN5ouMQMSFTCoEc1BbrEUa8VNCrNGidzWbZuYpwCTzPZh4fmNJBDvi0jW+b8t25He
         RdE6Q6B3wUeZKX2iov4SEtg3BGDPzVH/7O2loN6+chC5K9KX3/fI6TrGZC5QO207tZ4Y
         5e5JWcRA0dLWf8d6CVP5u9oKjL7uN8cWiq/pppaThG8bKCW8B92ABJz8wov9Z3cdMV8I
         qMTwHZTM6wKhWgd8XZX9Pt6fkXB08MoGeOCVuuREu2b4uXY0PYLrsp2tyEFqT+ToClfv
         U0lDPDhGSbhde/oPrrz5oM4G/BtUVfyn5WzJvXAmDdPpudPocTRmB6ZMZRcaDPKVfSSm
         9+uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I83KwTrW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si7890167ioy.6.2021.10.01.23.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 23:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I83KwTrW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWYiU-0004Y7-Ea
	for alex.bennee@linaro.org; Sat, 02 Oct 2021 02:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWYi3-0004VQ-QX
 for qemu-arm@nongnu.org; Sat, 02 Oct 2021 02:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWYhy-0003vX-Th
 for qemu-arm@nongnu.org; Sat, 02 Oct 2021 02:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633156877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3YwzyCfrWdbxV2jLlz9OuKZz7WRdWtIr5Uc/2COSU0=;
 b=I83KwTrWFxQ+g7uKSXg+aqlar7Uk0EHzC0PGCy3ooV8Bnb/VsnF7mC3ZvYACSYaIm/vvg+
 Zej+Kus1tczxL+uCyq3uO14jQOIaMejSvzeJc2knyrTwoOY4qGMW3+M0QNwTwR1RhPaoWW
 EX80c8GdrNSMBoZzFQgwqzORRMvrv88=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-PS17zkKVPcibN8AX2GMcEw-1; Sat, 02 Oct 2021 02:41:15 -0400
X-MC-Unique: PS17zkKVPcibN8AX2GMcEw-1
Received: by mail-ed1-f70.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso12514763edp.0
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 23:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k3YwzyCfrWdbxV2jLlz9OuKZz7WRdWtIr5Uc/2COSU0=;
 b=UQjtVhOd3FwSJ4RKpTZP25OW/tupUExdXhKY3urvjWpT9FRUpUEuLaIerq7x/PSaSs
 sibhRH+drvVuiv7lkkdqimPTu7jIDhIvf5oSWtEdWgZ13aaYU5jnGcJ8/U/PhumBrD1N
 v7k8Q8pUjNuEeOjnDUXcF6mUlRxdXxOdpxQhMkTryF9DUA+5NxEYeePCmFfJ4yvw+ZkM
 gZa+dOBXlUOKKDXt5mOq5LQ4JiZZISpUEbRxr5XivJXLzV6DCuraeUMFgpzMVNSR+GtP
 XMwD++8bfENsOhZRsJ6HTqrjfRiOauNhdiW9LGy33h9W92P1FnkZGhxHBgR+NeqFVAHs
 0pog==
X-Gm-Message-State: AOAM531OgaMDYHj4gINGsJ00zM6NHDvs7oEHgyaIQ3090wdtzLy0jBwI
 bju2RPR/PVDTFD/2pP8c166vV3Z0r69AVrUUY/kbaFQUqJf4XF+BDYRBO8HED/0O1WaLw719PmY
 oWtqguVeRLFiJ
X-Received: by 2002:a17:906:aad9:: with SMTP id
 kt25mr2494527ejb.516.1633156874497; 
 Fri, 01 Oct 2021 23:41:14 -0700 (PDT)
X-Received: by 2002:a17:906:aad9:: with SMTP id
 kt25mr2494512ejb.516.1633156874311; 
 Fri, 01 Oct 2021 23:41:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id k19sm1175977ejg.13.2021.10.01.23.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 23:41:13 -0700 (PDT)
Message-ID: <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com>
Date: Sat, 2 Oct 2021 08:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YVdCRYvRHIio6MZe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4vIyDiaoOlDT

On 01/10/21 19:15, Daniel P. Berrangé wrote:
> On Fri, Oct 01, 2021 at 07:08:51PM +0200, Paolo Bonzini wrote:
>> On 29/09/21 04:58, Yanan Wang wrote:
>>> @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>>>            return;
>>>        }
>>> -    smp_parse(ms, config, errp);
>>> -    if (*errp) {
>>> +    if (!smp_parse(ms, config, errp)) {
>>>            qapi_free_SMPConfiguration(config);
>>>        }
>>>    }
>>>
>>
>> This is actually a leak, so I'm replacing this patch with
> 
> This patch isn't adding a leak, as there's no change in
> control flow / exit paths.  AFAICT, the leak was introduced
> in patch 15 instead, so the code below shoudl be squashed
> into that, and this patch left as-is.

Yes, even better make it a separate patch and fix the conflict in patch
15.  But I'm still not sure of the wisdom of this patch.

At this point smp_parse has exactly one caller and it doesn't care about
the return value.  The "return a boolean" rule adds some complexity (and
a possibility for things to be wrong/inconsistent) to the function for
the benefit of the callers.  If there is only one caller, as is the case
here or for virtual functions, the benefit can well be zero (this case)
or negative (virtual functions).

Paolo

---------------- 8< ----------------
 From e7f944bb94a375e8ee7469ffa535ea6e11ce59e1 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 1 Oct 2021 19:04:03 +0200
Subject: [PATCH] machine: Use g_autoptr in machine_set_smp

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
  hw/core/machine.c | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54f04a5ac6..d49ebc24e2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -897,7 +897,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
  {
      MachineClass *mc = MACHINE_GET_CLASS(obj);
      MachineState *ms = MACHINE(obj);
-    SMPConfiguration *config;
+    g_autoptr(SMPConfiguration) config = NULL;
      ERRP_GUARD();
  
      if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
@@ -920,7 +920,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
  
      smp_parse(ms, config, errp);
      if (*errp) {
-        goto out_free;
+        return;
      }
  
      /* sanity-check smp_cpus and max_cpus against mc */
@@ -935,9 +935,6 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                     ms->smp.max_cpus,
                     mc->name, mc->max_cpus);
      }
-
-out_free:
-    qapi_free_SMPConfiguration(config);
  }
  
  static void machine_class_init(ObjectClass *oc, void *data)
-- 
2.31.1

