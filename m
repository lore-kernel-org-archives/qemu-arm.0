Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp85800nji;
        Thu, 11 Jul 2024 03:49:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURI5l3FqOWwkYq3bCd5W4ws5KdjpNeO4F2NK2na0FH8cnVbJW8V0r0ZfONfzetJtIwfrRftmysuR53nzxgbkgnOWuuvxrr
X-Received: by 2002:a05:6512:110c:b0:52e:943c:c637 with SMTP id 2adb3069b0e04-52eb99a1936mr5484688e87.37.1720694998354;
        Thu, 11 Jul 2024 03:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720694998; cv=none;
        d=google.com; s=arc-20160816;
        b=YblwrHL3sztSGuWSFnrbaQfm/jCgomd5jpKio8npc5BCikfzNWMP8CPtHlcav7nAFi
         BrL2qCW3dT19vDZ7iQnO5BLRmLtyo4QdWtU4gvMrA3v0lUB+6ueQ6EsXYWtYQ/JNqE3Q
         ssIi8RNLkB95tRHqyOFs/zTyfTPwhIPO3hpeiYm6kexvnV4gEI4lkxteRJmAtb/oIh9K
         cqh9N1SQqIz96yP8ZF+HHjgVTYF5bvza78bXWR9NoLZasGeJZshKpk9e/tBt3sSpZEr9
         O7481SgbPj9fM4QI2NrqbGg0+LG9C/IFH3MBOVTH8ZH8W+37yTiaIKMtBYXeRkODARIS
         4idQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DoOydcMVbUJJ/RwXHVe5Gdr2o4qifse1CVSUD+HZfss=;
        fh=N4hLUBa80ziwoL0sFU/qwhhG8R4bqTcxcOVmp5Rn3WY=;
        b=Z9qpkMxkBE8T07N+7JGrQRqmDKHYAizlFgOhtRdwi9tAphtgUz6NSpGcN6OEkM0m1O
         SZ8E+npa92EAJ4j2jbSZa3DmkiCEA7/x0pEEHaEkr7YZ+fRJL3HkAZRbBI0T3Usp8p4I
         wAubTJqdIPxvuOfJoKE7uv857MvVRQCtt3AXvIXPG2+I3KhVRDk6C1imDxA8LyulVRKR
         Pfpx/JbT7rmwxbRJcCPTkk37IrJs3hPm2dTrvHZ7EunVxaTaze7AXGjF2BA4qZHmxskm
         awUfr1i9/RCqwYG5Qnw/J8J6QyF4JLCHt901MBJl96esY5qSY475JlSPdcSKSIaws4ZL
         sACA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="DwRVNMV/";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52eb8e5e015sor2143521e87.11.2024.07.11.03.49.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2024 03:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="DwRVNMV/";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720694998; x=1721299798; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoOydcMVbUJJ/RwXHVe5Gdr2o4qifse1CVSUD+HZfss=;
        b=DwRVNMV/9+XRqYc2uVg/KzBUCeMnMPlC1CM3M6ea97aIr3cNSSW3TDQvM2Y18FgQgL
         bJF6f7bSKuzJI4cJZqnpOJ2Rm9O9V3fiaeoWWVDdiYwLV6Pik11P4MXYmXTmqENiMArL
         Akvp+0H+YLBlhzM2ejN/ooEb1eYrPK+nC8VQftxwhH8brxNJsTn3VeBSFmAiOaMALQGa
         /wL/noSDQQtyKMXwZEV8pKFqJLD9szGJciRdd/TknxDp5ZOSpuaJIlAbDiToHQCjCqIV
         WQsrLRC7gh7EkHQsSb0inCS63f+BJyfJA7GuCuRBlm+QkfJPp/kMrVghcnZziHxme8zm
         AHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720694998; x=1721299798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoOydcMVbUJJ/RwXHVe5Gdr2o4qifse1CVSUD+HZfss=;
        b=OqyM32D8a+TWDFnUOrcRjl9G939plTF3RVPpfEecuuGcqZP8Ae6EAMLklh0BDeUDXx
         YaAQ/c2GgxrVp6UBoz9NTdxFZ+GRMrrLBMQlyApQV3ylUwPaDbS0DEwKdIe0SwsEIHad
         IiIUvq0A6AE8yeD3AFCo6URlIgfNSF3cOY4QebxYORdgeHQyHjiFhy0/AFTmFAOut2Kx
         GPP/iiaSAalRu7BcU3+17gYDM0elz65ok5BO1b9t1F4PAD9YP7k9Kx46+KSrtZaIFbyo
         +/bsqAk35c9xA886yXfM9iat0aHEgDcvV06jP42YCSlF4odQIs6kn/dKrnwwgO9eFYA/
         XvXw==
X-Forwarded-Encrypted: i=1; AJvYcCU1S0yFiJ/Y3x+Tgr5FhGtzEV16maB3Y94TZOSr2jnWkyAmba3VfWMpapDgJAAkKqf4xhv2LbDWtZNCpw8W8h21PyYm5jtf
X-Gm-Message-State: AOJu0Yz/9/gxoMUyVdOKFVK+/xOw/m4gij0hZ0vQ6IZK8MBQL64it2V9
	K5dyoESFXPEujKxhRFdt5jPOSHhDuFvgZsRZYju+IO8rnBSC0snw1VTxaYyj+fA=
X-Google-Smtp-Source: AGHT+IHPAxEvR7swT6UVmUDs99ElJWd5uHiVOdjCrb5wHoWsmzwgBkfgSl1iIZTXjHe7Wour1tKFfA==
X-Received: by 2002:a05:6512:114d:b0:52c:dbee:bdb0 with SMTP id 2adb3069b0e04-52eb99d4e86mr6226794e87.59.1720694997507;
        Thu, 11 Jul 2024 03:49:57 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279c933c63sm908435e9.19.2024.07.11.03.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 03:49:57 -0700 (PDT)
Message-ID: <86749cab-8c25-4dbf-970e-60d226c0dbf3@opnsrc.net>
Date: Thu, 11 Jul 2024 10:49:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 4/8] hw/acpi: Update GED _EVT method AML with CPU scan
To: Igor Mammedov <imammedo@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-5-salil.mehta@huawei.com>
 <20240706162845.3baf5568@imammedo.users.ipa.redhat.com>
 <27cc0420-df0b-481e-a58f-e17fa4d02367@opnsrc.net>
 <20240711103403.2eadac1e@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240711103403.2eadac1e@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: qWwDNfTah/0e


On 11/07/2024 08:34, Igor Mammedov wrote:
> On Thu, 11 Jul 2024 03:29:40 +0000
> Salil Mehta <salil.mehta@opnsrc.net> wrote:
> 
>> Hi Igor,
>>
>>
>> On 06/07/2024 14:28, Igor Mammedov wrote:
>>> On Fri, 7 Jun 2024 12:56:45 +0100
>>> Salil Mehta <salil.mehta@huawei.com> wrote:
>>>   
>>>> OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
>>>> results in start of the CPU scan. Scan figures out the CPU and the kind of
>>>> event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
>>>> method with the call to \\_SB.CPUS.CSCN
>>>>
>>>> Also, macro CPU_SCAN_METHOD might be referred in other places like during GED
>>>> intialization so it makes sense to have its definition placed in some common
>>>> header file like cpu_hotplug.h. But doing this can cause compilation break
>>>> because of the conflicting macro definitions present in cpu.c and cpu_hotplug.c
>>> one of the reasons is that you reusing legacy hw/acpi/cpu_hotplug.h,
>>> see below for suggestion.
>>>   
>>>> and because both these files get compiled due to historic reasons of x86 world
>>>> i.e. decision to use legacy(GPE.2)/modern(GED) CPU hotplug interface happens
>>>> during runtime [1]. To mitigate above, for now, declare a new common macro
>>>> ACPI_CPU_SCAN_METHOD for CPU scan method instead.
>>>> (This needs a separate discussion later on for clean-up)
>>>>
>>>> Reference:
>>>> [1] https://lore.kernel.org/qemu-devel/1463496205-251412-24-git-send-email-imammedo@redhat.com/
>>>>
>>>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>>>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>>>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>>>> Tested-by: Zhao Liu <zhao1.liu@intel.com>

[...]

> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 2d6e91b124..33addb6275 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -117,6 +117,9 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                              aml_notify(aml_name("\\_SB.NVDR"),
>                                         aml_int(0x80)));
>                   break;
> +            case ACPI_GED_CPU_HOTPLUG_EVT:
> +                aml_append(if_ctx, aml_call0("\\_SB.GED.CPEV"));
> +                break
>               default:
>                   /*
>                    * Please make sure all the events in ged_supported_events[]
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f4e366f64f..8b4f422652 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1536,7 +1536,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>               .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>           };
>           build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
> -                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
> +                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_SB.GED.CPEV");
>       }
>   
> this way build_cpus_aml() will create and populate with scan
> \\_SB.GED.CPEV method.


I see. Perhaps, I failed to realise the semantics in the AML
sense i.e. exporting a call to a method belonging to one scope
to another (\\_SB.CPUS to \\_SB.GED). Yes, with above change
we can avoid calling \\_SB.CPUS.CSCN method direclty from
within GED _EVT. Sorry for the noise.

I will do the change.

Thanks


> PS:
> For legacy cphp handling acpi/cpu.c has only _INI method
> that is created when opts.has_legacy_cphp is true.
> we should be able to get rid of it when 2.6 machine type is removed.
> But ARM [or anything else] don't have to be aware of it
> if you use static initializer like it's done in hw/i386/acpi-build.c
> and just ignore non relevant fields.

ok. thanks for the clarification.

Best regards
Salil.
