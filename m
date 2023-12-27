Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp833752ejc;
        Wed, 27 Dec 2023 01:49:16 -0800 (PST)
X-Received: by 2002:a05:600c:1c13:b0:40d:6054:f34d with SMTP id j19-20020a05600c1c1300b0040d6054f34dmr59558wms.24.1703670555931;
        Wed, 27 Dec 2023 01:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703670555; cv=none;
        d=google.com; s=arc-20160816;
        b=TCDCQ6Qhanb/ubBx6PfasLPb80lwrh5eEvbIiM02D1nemS/OdTzalmAdSjw9qWHvTD
         AAJZJxuxQqo798nNz3fl+2Yhvbjf6da8btkcu0EMA1YlcnNIAFPCvYbuvjYf0Sn5L1dN
         e3Elge1peSo6SJ2vsEDhGZue5at7TIibLtq9A6JxRaXSGn6/LGRK/Q1yt2WXW1irwOCf
         PW93+bXLG4bCnSjbk5PcjEZmxkxf0neNhwTstwMXcykztI49yJ7TRYw6SnuCybT6uwDx
         iqr9yLBCSEFu0n6hiqNy+2cjTae/WqZTof+4RIkGBNUhGNdQrZXkVgZqDoiw2T3BZzX3
         w4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iVpi8RoNmLJenFFQcgf0+WfQqyWi+UE8e3gBdNcgpk8=;
        fh=NagaFr/PcAANIHwLZFzCvz4JvRdqo4Sy1JrwBCTjX5g=;
        b=h0H6lJhypzovz+8WIQCmn8Re1Wqc1Q1LgNerZk6KNvw3jKVdtaKRurdPhkzRJFrTBY
         uYwiTBO8GNq15L02NSn1eVVmAUdMjKawPHXmllYPBerp6Q13ucSuHnKOXPQWIQK6bQkS
         9WWjFPwMSF56mjW4d7CPR/NLPVjqOtjR7S0cra3CrJpsEEbtk6hiMXhrbscb+XEn3xzS
         GpdQ9PLcmI/PeoxS1SeQavK/XYLDouqwvDTs2dMUh01/iwwEEmRA6c6xCcU3h8x81pg/
         wvtB9G9lluCu5tirl6O+W+RSU7Dcn++R8iO8/sVHZyXjsOol8lj26WujY9j/gB/gxm2k
         nXBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QO43/Ozu";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10-20020a05600c214a00b0040d23229816sor968329wml.2.2023.12.27.01.49.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Dec 2023 01:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QO43/Ozu";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703670555; x=1704275355; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVpi8RoNmLJenFFQcgf0+WfQqyWi+UE8e3gBdNcgpk8=;
        b=QO43/OzuwSQ1efm8bsUPm7XT+1gSnqVCUmXmPsrZjahoO+zUJ3fSC/e/Iu6sgwZiW0
         otV3hMmYBEVF9lAiZplyMxyaz8j5NW1yG+MXg0AMZ+gPE9jv5FPn5xcaUCgPAzdtQzkR
         w5aeUZN+MpxYqyfRfTBNifIQpMwQY8XxHWLnrhyDI+yQRM19/DPLUqY9qMtcuwFEbj27
         7SZOBFmjw7W7hTwZs9DTU1hdsfil92uo07CrJIrgO6m4Zc8O6N8APGy4xUTpRi4we5Ud
         X8KFM/JwU7euB9KtfEKQDxGACnbosTzhkyLq2ikw10o7Nl8CLsQX3dUGpNecgSralrbB
         zULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703670555; x=1704275355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVpi8RoNmLJenFFQcgf0+WfQqyWi+UE8e3gBdNcgpk8=;
        b=geCh+nYKmdb2Q8sMaFDGywCgfHrd9lFwq3Iz4HETiajUosBJ9K+LjW4E8kRdgSTak/
         +Q5xzFasMtOlYAj+pMB5vHlXBiiFg50TGs5Sj1ORlR/Z9luI9iA2hw7bF6Drus6lVHNh
         jPpgPsGg/6uklvSMuk1qyUdU/t0GzAvMG+22BGDSlT7xhQC5pVSdiuu6YiMTj+AiyyVv
         nAer4vodt5cRn17Af5LsD0JlJNRABE1V9HYxdbFIsElmQqjaXCYoz76vklXhhH5iTFFu
         7X2pzFXfLZx79+AGfDkljT/kUzUpo9owImvq/YfK9HlDAdlRRk1nnTIoqkeEkjLlHeSx
         LWeQ==
X-Gm-Message-State: AOJu0YyCVhT8xVS8AVcEsw4On+Qun85+OnbJNzoOnVCUjIKmDeKBi5mv
	XYgYY7a3TSW4/K8XosSlFsnby2+J0ghTRo1e
X-Google-Smtp-Source: AGHT+IGsOfUC2BdQtbOUtG1X9aEdqqHXiI4O8tfxy0Ion76/Xsnz89nYnw0hw46N9sKUi2Q59YZEaQ==
X-Received: by 2002:a05:600c:4ec9:b0:40d:5f64:e516 with SMTP id g9-20020a05600c4ec900b0040d5f64e516mr145462wmq.72.1703670555503;
        Wed, 27 Dec 2023 01:49:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.218.122])
        by smtp.gmail.com with ESMTPSA id r19-20020a05600c459300b0040d128e9c62sm31073731wmo.18.2023.12.27.01.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 01:49:14 -0800 (PST)
Message-ID: <3d4f33b7-031f-4cc1-a696-56625a89f2ab@linaro.org>
Date: Wed, 27 Dec 2023 10:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/arm: Prefer arm_feature() over
 object_property_find()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Radoslaw Biernacki
 <rad@semihalf.com>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20231214171447.44025-1-philmd@linaro.org>
 <CAFEAcA-Je+_tNCwiL_sQb-tDmCRJ2LWm5mAfuowtxbUBNEWQXQ@mail.gmail.com>
 <871qbkug24.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <871qbkug24.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4IsvRsuw8Cuc

Hi Markus, Kevin,

On 18/12/23 08:26, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 14 Dec 2023 at 17:14, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> QOM properties are added on the ARM vCPU object when a
>>> feature is present. Rather than checking the property
>>> is present, check the feature.
>>>
>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> RFC: If there is no objection on this patch, I can split
>>>       as a per-feature series if necessary.
>>>
>>> Based-on: <20231123143813.42632-1-philmd@linaro.org>
>>>    "hw: Simplify accesses to CPUState::'start-powered-off' property"
>>
>> I'm not a super-fan of board-level code looking inside
>> the QOM object with direct use of arm_feature() when
>> it doesn't have to. What's wrong with asking whether
>> the property exists before trying to set it?
> 
> I'm not a fan of using QOM instead of the native C interface.
> 
> The native C interface is CPUArmState method arm_feature().
> 
> Attempts to use it on anything but a CPUArmState * will be caught by the
> compiler.  object_property_find() will happily take any Object.
> 
> Likewise, typos in its second argument will be caught by the compiler.
> object_property_find() will happily return NULL then.
> 
> 
> I also don't like adding QOM properties to instances.
> arm_cpu_post_init() seems to do that.  I feel it's best to stick to
> class properties whenever practical.
> 
> More so when management applications are expected to use them, because
> introspection is much easier to use correctly when existence of
> properties doesn't depend on run-time state.
> 
> Kevin's "[RFC PATCH 00/12] QOM/QAPI integration part 1" explores
> QAPIfication of object configuration, loosely based on
> <https://wiki.qemu.org/Features/QOM-QAPI_integration>.  A QOM class's
> instance configuration interface becomes compile-time static.

What is your take on this pattern from commit f50cd31413
("arm: Don't clear ARM_FEATURE_PMSA for no-mpu configs"):

commit f50cd31413d8bc9d1eef8edd1f878324543bf65d

     arm: Don't clear ARM_FEATURE_PMSA for no-mpu configs

     Fix the handling of QOM properties for PMSA CPUs with no MPU:

     Allow no-MPU to be specified by either:
      * has-mpu = false
      * pmsav7_dregion = 0
     and make setting one imply the other. Don't clear the PMSA
     feature bit in this situation.

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f844af5673..76a5e20111 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -763,8 +763,14 @@ static void arm_cpu_realizefn(DeviceState *dev, 
Error **errp)
          cpu->id_pfr1 &= ~0xf000;
      }

+    /* MPU can be configured out of a PMSA CPU either by setting has-mpu
+     * to false or by setting pmsav7-dregion to 0.
+     */
      if (!cpu->has_mpu) {
-        unset_feature(env, ARM_FEATURE_PMSA);
+        cpu->pmsav7_dregion = 0;
+    }
+    if (cpu->pmsav7_dregion == 0) {
+        cpu->has_mpu = false;
      }

      if (arm_feature(env, ARM_FEATURE_PMSA) &&

---

Both "has-mpu" and "pmsav7-dregion" are static properties, used as QOM
configuration provided by /before/ the realize() handler; but then one
is (en)forced /after/ realize().

Logically this looks like a AND configuration gate; is this acceptable?

I tend to see QOM config properties as writable *before* realize() and
then to be used as read-only within/after realize(). So here the KISS
approach would be to report an error the 2 properties differ, as an XNOR
gate:

   if (cpu->has_mpu ^ !cpu->pmsav7_dregion) {
       error_setg(errp,
                  "%u pmsav7-dregions requested but no MPU available",
                  cpu->pmsav7_dregion);
       return false;
   }

Thanks,

Phil.
