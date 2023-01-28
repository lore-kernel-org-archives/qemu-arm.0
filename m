Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1532392ejc;
        Fri, 27 Jan 2023 16:31:25 -0800 (PST)
X-Received: by 2002:a17:90a:53:b0:22b:e5e1:9d3 with SMTP id 19-20020a17090a005300b0022be5e109d3mr18059345pjb.25.1674865884543;
        Fri, 27 Jan 2023 16:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674865884; cv=none;
        d=google.com; s=arc-20160816;
        b=otO+KhBUnz5b7bdIHd5fw4fCF4xZMXu6y6KRSC+FK8YCbmXUhXogVPtfeswYrG1LTX
         LfxUQJ16bYU/lLOfBudRa6Zu5/70YS5x8Q7y1QJgIKAXrtHQrPjmeX9upybWx+i9upoX
         GFJ14NUtPy30AEmj7XLaHuJR2ruaC9yx3Sl6YRmFw2b8HuXY2C76pv9r72iXZVSmQUJR
         VPOE8cfOGsn1CQOiydz+JMUYHipQYHysf3iLwFfZ7puZvu2NgEo1u5NMSUO3S+F6tzt5
         1DqSvWpcpX8skOUaDS3HegjdZ6cPNun7oJ3rIuw240R9RdBTxGXc6/uIOVHEbyU7J8Sd
         AM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=c9TvRgP/WaR8VIU1peabWvB2vUf9So4db7kZY32WBfc=;
        b=Rg906j8SjrigNuPgp27VrTeXtlpiKhsUs/xFe73rwbGTXiIbS1WeikJbI0bAeW7Irm
         q1a+VAMfUvGuRfBD50AeDEaxH53tBj1806RL8lnjk/yBUC16rQA2XgOtFlncNkTXdZuG
         WHa4kntzmzhSx3q1dphigqQzTAM8cM4kfHaTn4RyWONy3l1LKro3KTR1lSr8VtejKrDE
         hbRzO4APzqqOu6mNBci/GGDWZugbtohsUNyHa7re1MU2Fb8Qvi5p4/MZLUK41VdjZKky
         nqNQ8OGRu4HUtht+wEioKjErfCjgN16u8Yt1z8QXcm7cc7J0D577wkTLd3YPXcmo1KE+
         0jCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEl1AYt1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 7-20020a17090a098700b0022699821d21sor4088815pjo.21.2023.01.27.16.31.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEl1AYt1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9TvRgP/WaR8VIU1peabWvB2vUf9So4db7kZY32WBfc=;
        b=IEl1AYt19438v8bXivEthPYpOZVUPLt1TrDVUjgeZveFIDdI2tZ8lPHkEJn+H5e73R
         i0NhJaZktaN+kZg/8DvrsUAmXq4oqymNqseMNfdFNnTlgFLIygZh/5OTL/c3859W2erd
         pcqdy0WSKVgxovtrUAuPOfpnyGdOPrWklX2QPSNrU9YDT6b0nPpsTpTJoJfydYqBI0ko
         Vk8ozHdVW535sA2m3rsRJh/NLQmSQREVFY/3nbRi4zPa3U20D/1hXnTsP/oNCQT7UnAJ
         Hoxp0HFBq5TaSU9leX81bCklm9Z5hYSW84h7lTe0DosdfxeUM4099HZEKF49xFMIc00f
         1ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9TvRgP/WaR8VIU1peabWvB2vUf9So4db7kZY32WBfc=;
        b=k6gxl0pa5deWrzfhx3K8nCBWOvWFYDwX8lih6t2l4rp2X3DChPEgLgVq6eifWdiFW5
         m4M6y+T48n7TzTiZlqqEtC1Ti69KrC6xcOl9X7/JabJ1Tr5FmGq0KDaJadh8qRgDK6Zx
         ApD9I/Uk7sWW5yGf232Px78+nYTcyVun3i7zUKnKp14u8TneoOlZ1Zw1wxQxkTlOLV3i
         sO6AgLWL97y+R/2uUfRr7K35TvFPgdl18YyxQ4f+hc784tJStUREacNXxWlFvJM36Jo0
         tH/MdEVKpRew/uB68AOxpH0TBlr3JVPf7qOkXYExtOgtPINj9C1PSRZLA70C6xygOg5l
         WRdw==
X-Gm-Message-State: AFqh2kpVjR5foIfd6dlnXhccPTgObIP4ihI8vgqCKy9Q/m01SZAnTwrs
	dAKaOckVo7igDeNrmlv3cOtSbDoo
X-Google-Smtp-Source: AMrXdXsiNM15dpRGIk4QId/SPm9kumoxRKvgkSBZbhSmLmWgSylmcrGDkvxoIX/SzZChfNGsshb6ig==
X-Received: by 2002:a17:90b:3148:b0:22b:ae0b:ac88 with SMTP id ip8-20020a17090b314800b0022bae0bac88mr30939009pjb.47.1674865884062;
        Fri, 27 Jan 2023 16:31:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id em6-20020a17090b014600b00217090ece49sm3260523pjb.31.2023.01.27.16.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:31:23 -0800 (PST)
Message-ID: <55b9afd2-f158-3c27-fbb2-a367d10ce536@linaro.org>
Date: Fri, 27 Jan 2023 14:31:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 12/16] target/arm/kvm-rme: Add Realm SVE vector length
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-13-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-13-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YjOlEj2Pw3Ug

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RmeGuest *guest = RME_GUEST(obj);
> +    uint32_t value;
> +
> +    if (strcmp(name, "sve-vector-length") == 0) {
> +        value = guest->sve_vl;
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
> +    visit_type_uint32(v, name, &value, errp);
> +}

Something I've used elsewhere just recently (and should probably make generic:

static void rme_get_uint32(...)
{
     intptr_t offset = (intptr_t)opaque;
     uint32_t *ptr = (void *)obj + offset;

     visit_type_uint32(v, name, ptr, errp);
}

     object_class_property_add(oc, "sve-vector-length", "uint32",
                               rme_get_uint32, rme_set_sve, NULL,
                               (void *)(intptr_t)offsetof(RmeGuest, sve_vl));


r~
