Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7471991wrx;
        Thu, 7 Mar 2019 10:45:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXifKwnSn0qQ3p6qkFe5ZYIqsJ3vhFEIJqQpa1BMPzP83LGOkAIrfzPVmbP8lWgBGkArWl
X-Received: by 2002:a81:4d54:: with SMTP id a81mr11622552ywb.374.1551984340804;
        Thu, 07 Mar 2019 10:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551984340; cv=none;
        d=google.com; s=arc-20160816;
        b=awThbzerDIyHGCCm1sg3R5jZ1ngWl19svLxPDSBPVtN/iy3DRCmzLc6aRz/4+A1Pyf
         xzOTKNGj8f6B1NNuGBY+ZYqCPt/4y0Dlh2zZE7qEF+/blEfKlTa+xGHUaBn0uQzUEyoT
         nYB8JtPyd+qhaK0Xa2GCo9/8ItMeTVvevE3/8E5s//PmpsajnnLYqYk5BjHwB9vEdA5E
         3e7/JlzBksQ82iLnmpl6BHhiDl0rsbXJOxvRGXcgVdr9G7NPbKFsc5m7ZFzonTc86QTy
         QgTRDEnBPGdUL3zdzSNVR8LupVK0itwku59iN9CBsr6O/kYnCTLqUQhVl03UuHkHgnj4
         k6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=SUU0dw6nvGCyo2TOHBdsmRGOsWVjkPgNpDNu6vYHOGI=;
        b=mdxI8TEjmJxa5+dpMDQQnxBTy2JJsV2vyMl6viLdBa75rXSp3xv8gh/2J1OOiIZ3Ed
         1mMVJxDpff8wO0ADQeHUyi5rjOPAHEJvHNL7dNqUDRtnOFybjYtMvHunnqfyJq4hUplS
         iuzz4SWSUgG4Yf/BlPq9ibUKkUw9It8IFXtjGyUlZx73Xx0SHuq/1pT6Q2XEtE8b2FYC
         tcCfpM8nuFXuu0MRzLfGBIuqGaRg3C+416hMV2oO8PpzGH+te/6vNKi6gncEgXpxtRn9
         sgniKAj2tSJVoNlgMkOmmDlZ/Kmnfw9XS1nrg59pjdRXoJ/s4YL3rCvFNuCmCyWPKplL
         Tmrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si3084595ywv.112.2019.03.07.10.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 10:45:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1y1U-00076O-6H
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 13:45:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h1xGP-0008Nt-0k
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 12:57:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h1xGO-0000JC-87
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 12:57:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60774)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h1xGL-0000FH-UW; Thu, 07 Mar 2019 12:56:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19C153092640;
	Thu,  7 Mar 2019 17:56:57 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E6EA5D9C6;
	Thu,  7 Mar 2019 17:56:52 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190307090639.8261-1-eric.auger@redhat.com>
	<20190307172612.GC8899@habkost.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <42cc3974-3953-472d-d3d7-f2a507f6397c@redhat.com>
Date: Thu, 7 Mar 2019 18:56:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190307172612.GC8899@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 07 Mar 2019 17:56:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] machine: Move acpi_nvdimm_state into
 struct MachineState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sbhat@linux.ibm.com, david@redhat.com,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, imammedo@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: htCpTUTMaVSG

Hi Eduardo,

On 3/7/19 6:26 PM, Eduardo Habkost wrote:
> On Thu, Mar 07, 2019 at 10:06:39AM +0100, Eric Auger wrote:
>> As NVDIMM support is looming for ARM and SPAPR, let's
>> move the acpi_nvdimm_state to the generic machine struct
>> instead of duplicating the same code in several machines.
>> It is also renamed into nvdimms_state.
>>
>> nvdimm and nvdimm-persistence become generic machine options.
>> We also add a description for those options.
>>
>> We also remove the nvdimms_state.is_enabled initialization to
>> false as objects are guaranteed to be zero initialized.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - s/acpi_nvdimm_state/nvdimms_state
>> - remove ms->nvdimms_state.is_enabled initialization to false.
> [...]
>> @@ -765,6 +806,20 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>          &error_abort);
>>      object_class_property_set_description(oc, "memory-encryption",
>>          "Set memory encryption object to use", &error_abort);
>> +
>> +    object_class_property_add_bool(oc, "nvdimm",
>> +        machine_get_nvdimm, machine_set_nvdimm, &error_abort);
>> +    object_class_property_set_description(oc, "nvdimm",
>> +                                         "Set on/off to enable/disable NVDIMM "
>> +                                         "instantiation", NULL);
>> +
>> +    object_class_property_add_str(oc, "nvdimm-persistence",
>> +                                  machine_get_nvdimm_persistence,
>> +                                  machine_set_nvdimm_persistence, &error_abort);
>> +    object_class_property_set_description(oc, "nvdimm-persistence",
>> +                                          "Set NVDIMM persistence"
>> +                                          "Valid values are cpu and mem-ctrl",
>> +                                          NULL);
> 
> As noted in another reply, I don't mind adding new MachineState
> fields, but now I noticed you are adding new user-visible
> options, which requires more care.
> 
> This patch seems to make all machines except PC silently ignore
> the new nvdimm options.  If the current machine doesn't support
> nvdimm, "nvdimm-persistence=..." and "nvdimm=on" should be
> rejected by QEMU instead of silently ignored.
> 
> Probably the simplest way to do that is by making the
> registration of those QOM properties conditional.
> 
> We could add a simple
>   bool MachineClass::nvdimm_supported
Makes sense to me too. I will go that way.

Thanks

Eric
> field, or we could add a
>   static void nvdimm_machine_class_init(MachineClass *mc);
> helper that would enable nvdimm support on the machine type.
> 
