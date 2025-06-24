Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp284727dyb;
        Tue, 24 Jun 2025 09:06:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhv1U3qbY1jasvPYbw8IhV1kPPxUTUCCbsjxBA9jRZF8TYslWVkf03UeX9X++UaAaBK0BWO7h+5MyImg==@linaro.org
X-Google-Smtp-Source: AGHT+IH8zFu8tjqQdKghxqCy33YbWFS1S53Zi6JwiK96+WD97ey68nU+CXgWn+RkizH31jwq5KCx
X-Received: by 2002:a05:6000:25ca:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a6d1329a17mr14485636f8f.39.1750781163407;
        Tue, 24 Jun 2025 09:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750781163; cv=none;
        d=google.com; s=arc-20240605;
        b=W1PqqA45PLfwc8IqniY3XZFGP20bQC5w7cKbScSKAanjX70UdaJqg+iWC4ZJzfj+L7
         rXDu0fqucssgHUJ0tSZJtlWMzV6R6puYxYNp7N/qftav8M8FhDVjhdp4EYDm+1WNHj8/
         T9dgbCTwXkm2AcaRcIUC4Bjrpba8VwdAU0oNJU9feddAx8hAgK8hKMdsmdLJHl+F+g1s
         qOoxpRFp2BykptrNwLN1nR+xxjtPFDPP0EPnbrMUFSypo7/qsmWV96e2/KjMgkqWg1q8
         RRbd6P0cV/inTDFdwU0YkEn3bN6q5QFjHVT4wzJNw86P5aFM+jernt8QwOL4XjBhNdUs
         fWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=lCk2s8wM27Wufe54g1qdEigJtmQmsb2rZ0yOJcY4dQU=;
        fh=kHQiES9atnaOvQqCxX2RcVy7TmG1YYHN+xbGGyvVOB0=;
        b=NVtLbojEhUtLf7xnPpNsjTtA5bwzB08MWyBaHywCJnNDBmYyzZyqgMZ43dJcIDTHAS
         Sx2/++DROejfgtNYAyi5P6Wv3/W+7dVs0q5sKgFVWGtsiBHcut2tDsamAHGhfqnICctt
         Ly3+LAi9Kw3HSaDvQPiEh6FNdStNZTKMCe39TyMhkLGiD8kBLnHYtSAJP1S7tgiA5Qm8
         pfQBVuDE5FwAR/F+Z6FXwQ3CZZUBsexq2Cyt/s1ni/hM4FKHMcE6fvoT/0wDXrwEhYZ3
         f/ab+dV2nTenHVa4wekyFMCfo3B6YQeLIYzUPdYLFjvqpkJB3lOvLIG1NDajAIc0GrdF
         Qbag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cZy/mWpk";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e80f202dsi1497035f8f.431.2025.06.24.09.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cZy/mWpk";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750781161;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lCk2s8wM27Wufe54g1qdEigJtmQmsb2rZ0yOJcY4dQU=;
	b=cZy/mWpklpYvKyhGamCMD6im4kXMsNDtn4I/GQx256AliavZh1HqufvXHyZ9HxxXoRhBdo
	qCCXgGGUVMC7N7Jr9sNheu1ljTPxPGEi9Zvn1F8kQcTYLaaJRmNOhIC83NQ0RhCjshCQwc
	K+KR/IVlyAqVhKDAeff1OAUsEK3AZAs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-gI5URUfNOnW5zswJ34_9dQ-1; Tue, 24 Jun 2025 12:06:00 -0400
X-MC-Unique: gI5URUfNOnW5zswJ34_9dQ-1
X-Mimecast-MFC-AGG-ID: gI5URUfNOnW5zswJ34_9dQ_1750781159
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45359bfe631so3991545e9.0
        for <alex.bennee@linaro.org>; Tue, 24 Jun 2025 09:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781159; x=1751385959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCk2s8wM27Wufe54g1qdEigJtmQmsb2rZ0yOJcY4dQU=;
        b=wziG+l406r2Sr2sgUcNa2YwuMY/L7Naskt3f1qzQ2r+JVa4pco9ZEwXlkmlUySWeZa
         L/aWMSwjZ0eyxIp2oX+B8iDs4ZsWc/eFSpwCO7IqCa5sQNKt8H7CV2vnGnym0LapESj5
         qa6CeXhlWiOPQBJUEji71FJAMzTgvhWXgGdH3ccKvWweThG8Be/YMusO6vqbTuWzbYbE
         XIjHxaBGK1OxEDIaEWeJI0z9EoM7nbIACebKAfYsGS6vXXSua0sChEZge/StHn8zBTAh
         tNbpGM8qI5z58PABqrOkyrpxdWw312xaW0A2epZaYe9AD3TWvXSqXtmugLsc9f6IIq5z
         aJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX5jkzgBZYt4IJRhZXHGvpSEUjjgurzNB0B7RFxu+iWZHvEDslTD/4+qyrUsPSf8Z7KnLUTO6uUja7aA==@linaro.org
X-Gm-Message-State: AOJu0Yxq0Ca3KK5fy2xSLnTAqA7CJdcdkThMoN2DNothw/PhKevGPkbS
	vz58SUOy6ARi7UMyDrMZ33tg+mSYNU3VkvHbfJHBt6fqjnM/i/0K7C5/b1rhwcadImNomE6ty47
	6nMQscMy7OCfdZwH37YICmoS49pqSYzexXQiZ+St6JqNbUBz1HyIDcM+l3Q==
X-Gm-Gg: ASbGncthwd5EFs7GwUOfVX6XM7rqL8/8WK1+N61mvreDd2iON9oEfp2wuAWCR5IfDQS
	N/+cw+ZsArFUjvTJMS4NSCkunedhgnP2SWy8qbmnwF2eliPcH4uXTZRfMutxfL8sGhAThkewmEa
	kL5dJkpi7L+i8nBuxGwFmb82fsYn6gO+MfmhxRxMG5AsG4Wn8w3VsMcakxPxaSdQ3BXF2PLZrJ/
	dOgayt/MthOKZZ2ewJLH4iWHCFGBRWupugfGTtzfQbqjnLG5xon/iE6A5tN3wkk4Y+/7Dt/9hhX
	e9JH5+FtD8rwJCn+jefoqTHNQE0H3GaawdJlt1IQ1Crx+/o8gEx+at36/gp0Sjl7FzXxOw==
X-Received: by 2002:a05:600c:3589:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-45380bb6ffamr13082025e9.15.1750781157478;
        Tue, 24 Jun 2025 09:05:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3589:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-45380bb6ffamr13081215e9.15.1750781156688;
        Tue, 24 Jun 2025 09:05:56 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b48asm181510355e9.16.2025.06.24.09.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:05:55 -0700 (PDT)
Message-ID: <a408d74d-bb3a-48a5-8a5b-64664c85ec36@redhat.com>
Date: Tue, 24 Jun 2025 18:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 16/29] hw/i386/acpi-build: Move aml_pci_edsm to a
 generic place
To: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-17-eric.auger@redhat.com>
 <20250620101936.00005f96@huawei.com> <20250620142714.4c4b1d8a@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620142714.4c4b1d8a@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m0wc1LytTubObgmw40NCXRoYbei0GhqkQyG6CKHM3cY_1750781159
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: Nl4y1IVFBR4P

Hi Igor, Jonathan,

On 6/20/25 2:27 PM, Igor Mammedov wrote:
> On Fri, 20 Jun 2025 10:19:36 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>
>> On Mon, 16 Jun 2025 11:46:45 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> Move aml_pci_edsm to pci-bridge.c since we want to reuse that for
>>> ARM and acpi-index support.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>  
>> A request for a bit of documentation inline.  aml_pci_edsm() sounds
>> like we should be able to grep the spec for edsm and find it but
>> that's just internal method naming in qemu.
> agree, aml_ prefix is typically reserved for ACPI spec items. 
renamed into build_pci_bridge_edsm()

Thanks

Eric
>
> perhaps rename it to follow build_ prefix scheme?
>
>>
>> More interesting is I don't think this will ever be called as
>> the kernel has no idea how to call it and unlike on x86 the
>> blobs don't show wrapping the call in a _DSM() (see aml_pci_static_endpoint_dsm())
>>
>> Did EDSM usage get dropped as this set evolved leaving this behind?
>>
>>
>>
>>> ---
>>>
>>> v2 -> v3:
>>> - move to pci-bridge.c instead of pcihp.c (Igor)
>>> ---
>>>  include/hw/acpi/pci.h |  1 +
>>>  hw/acpi/pci-bridge.c  | 54 +++++++++++++++++++++++++++++++++++++++++++
>>>  hw/i386/acpi-build.c  | 53 ------------------------------------------
>>>  3 files changed, 55 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
>>> index 69bae95eac..05e72815c8 100644
>>> --- a/include/hw/acpi/pci.h
>>> +++ b/include/hw/acpi/pci.h
>>> @@ -42,5 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>>>  void build_srat_generic_affinity_structures(GArray *table_data);
>>>  
>>>  Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
>>> +Aml *aml_pci_edsm(void);
>>>  
>>>  #endif
>>> diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
>>> index 7baa7034a1..be68a98c34 100644
>>> --- a/hw/acpi/pci-bridge.c
>>> +++ b/hw/acpi/pci-bridge.c
>>> @@ -35,3 +35,57 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
>>>          }
>>>      }
>>>  }
>>> +
>>> +Aml *aml_pci_edsm(void)  
>> Can we have some comments, or a more descriptive name than
>> the resulting method name?  There is stuff in the function obviously
>> that associates it with the naming DSM but given this is moving to
>> generic code maybe it needs a brief intro comment?
>>
>>
>>> +{
>>> +    Aml *method, *ifctx;
>>> +    Aml *zero = aml_int(0);
>>> +    Aml *func = aml_arg(2);
>>> +    Aml *ret = aml_local(0);
>>> +    Aml *aidx = aml_local(1);
>>> +    Aml *params = aml_arg(4);
>>> +
>>> +    method = aml_method("EDSM", 5, AML_SERIALIZED);
>>> +
>>> +    /* get supported functions */
>>> +    ifctx = aml_if(aml_equal(func, zero));
>>> +    {
>>> +        /* 1: have supported functions */
>>> +        /* 7: support for function 7 */
>>> +        const uint8_t caps = 1 | BIT(7);
>>> +        build_append_pci_dsm_func0_common(ifctx, ret);
>>> +        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
>>> +        aml_append(ifctx, aml_return(ret));
>>> +    }
>>> +    aml_append(method, ifctx);
>>> +
>>> +    /* handle specific functions requests */
>>> +    /*
>>> +     * PCI Firmware Specification 3.1
>>> +     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>>> +     *        Operating Systems
>>> +     */
>>> +    ifctx = aml_if(aml_equal(func, aml_int(7)));
>>> +    {
>>> +       Aml *pkg = aml_package(2);
>>> +       aml_append(pkg, zero);
>>> +       /* optional, if not impl. should return null string */
>>> +       aml_append(pkg, aml_string("%s", ""));
>>> +       aml_append(ifctx, aml_store(pkg, ret));
>>> +
>>> +       /*
>>> +        * IASL is fine when initializing Package with computational data,
>>> +        * however it makes guest unhappy /it fails to process such AML/.
>>> +        * So use runtime assignment to set acpi-index after initializer
>>> +        * to make OSPM happy.
>>> +        */
>>> +       aml_append(ifctx,
>>> +           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
>>> +       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>>> +       aml_append(ifctx, aml_return(ret));
>>> +    }
>>> +    aml_append(method, ifctx);
>>> +
>>> +    return method;
>>> +}
>>> +
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index fe8bc62c03..6cf623392e 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -338,59 +338,6 @@ build_facs(GArray *table_data)
>>>      g_array_append_vals(table_data, reserved, 40); /* Reserved */
>>>  }
>>>  
>>> -static Aml *aml_pci_edsm(void)
>>> -{
>>> -    Aml *method, *ifctx;
>>> -    Aml *zero = aml_int(0);
>>> -    Aml *func = aml_arg(2);
>>> -    Aml *ret = aml_local(0);
>>> -    Aml *aidx = aml_local(1);
>>> -    Aml *params = aml_arg(4);
>>> -
>>> -    method = aml_method("EDSM", 5, AML_SERIALIZED);
>>> -
>>> -    /* get supported functions */
>>> -    ifctx = aml_if(aml_equal(func, zero));
>>> -    {
>>> -        /* 1: have supported functions */
>>> -        /* 7: support for function 7 */
>>> -        const uint8_t caps = 1 | BIT(7);
>>> -        build_append_pci_dsm_func0_common(ifctx, ret);
>>> -        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
>>> -        aml_append(ifctx, aml_return(ret));
>>> -    }
>>> -    aml_append(method, ifctx);
>>> -
>>> -    /* handle specific functions requests */
>>> -    /*
>>> -     * PCI Firmware Specification 3.1
>>> -     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>>> -     *        Operating Systems
>>> -     */
>>> -    ifctx = aml_if(aml_equal(func, aml_int(7)));
>>> -    {
>>> -       Aml *pkg = aml_package(2);
>>> -       aml_append(pkg, zero);
>>> -       /* optional, if not impl. should return null string */
>>> -       aml_append(pkg, aml_string("%s", ""));
>>> -       aml_append(ifctx, aml_store(pkg, ret));
>>> -
>>> -       /*
>>> -        * IASL is fine when initializing Package with computational data,
>>> -        * however it makes guest unhappy /it fails to process such AML/.
>>> -        * So use runtime assignment to set acpi-index after initializer
>>> -        * to make OSPM happy.
>>> -        */
>>> -       aml_append(ifctx,
>>> -           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
>>> -       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>>> -       aml_append(ifctx, aml_return(ret));
>>> -    }
>>> -    aml_append(method, ifctx);
>>> -
>>> -    return method;
>>> -}
>>> -
>>>  /*
>>>   * build_prt - Define interrupt routing rules
>>>   *  
