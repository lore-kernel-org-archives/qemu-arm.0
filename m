Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1529140ejc;
        Fri, 27 Jan 2023 16:22:43 -0800 (PST)
X-Received: by 2002:a17:902:ab50:b0:194:d5ed:b9ea with SMTP id ij16-20020a170902ab5000b00194d5edb9eamr26264189plb.57.1674865363229;
        Fri, 27 Jan 2023 16:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674865363; cv=none;
        d=google.com; s=arc-20160816;
        b=irf7PnNA/ypHRmm0keOcbw6H0Xl651a7FW7GVJK1QyqPzMqyvkSU1TvGT2L/tZE6Lc
         cFLZ3Ki3znU4SgPHffhZPXUueInvIjM4r6vamatpJ5bpn8/tQNXGBgFMUEcQuQgP7NuD
         a0A5HjiXVWGSiNTzrsTWHKmobsZAKJQ8dxFrdXpz2j0Lq6aq76aaCHWsQVdRTQ1i5zCS
         QUGbJ1qept9KWnBIIqkqf3bybFHu4WVb7mOsox8azdGUsk60TnnWXXRanQp1UJBi50tP
         XdzUogIcDWmDHDKTS3v1WwW8V2q73WXmVc9Ev8BudZ4R1sNLxoEzTwd3kF+eoVAHS60h
         PtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GadLoYihLq2je6MYFrcuqG6j575+3dCNXyYioo3yDv4=;
        b=GZ9F123LP6py0u3BhwNAsZpSbN9Q5jXMN6KgcwCybOWprsBrS7c9d64SeF8/9z9Vmp
         0nLkPKpBY9H2aim+e9ThtYyW8GQ/iBjWiFLVKF8UFD6pX04HT02rVHsDn9cR2lSPmNFB
         yOawGGK2SS7gUW38yYurY+M2ZVXrqZXxs3imuhA80m4D5T2eLne3y870UxspidTuR2n+
         plXoztqSqoEb+TlKd94fpBJg/7dnxfsGT8C2AaUu1HdyoaEDukNMp9UeaLejgnjjpc44
         stQRp3iGde4U/j2MKCU7/o4myV5s0m+0wni198WdjtTZzh+fkUDq73LrprkewcLJt5xF
         zEYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LzXYQzQc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id im22-20020a170902bb1600b001948f52a761sor2399206plb.116.2023.01.27.16.22.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LzXYQzQc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GadLoYihLq2je6MYFrcuqG6j575+3dCNXyYioo3yDv4=;
        b=LzXYQzQcjpXjqcvSEOU37Agha8Nf96xVUrqeb0JZuBURmEwXJAtxvemoVS8EryFLnO
         rJZQZZBlvvzCRTe3oUij/oAav3mxA2I0BqVhMxlL2nQ0YPfeJJVPuK6Bg4b6Kc3jOAjY
         VeXcRPQ1K5Rh0IHvX2rquaCk/1PzVLThF7aQt7QeW1zNe6P45x28KdtbUcNcC9KM0+Yz
         YuFk9oZTpZGmM+WMmvga10sG+1CoCBVa/W/cQEvabhnLclsK+evg8KJHuECWQqZEeCXo
         Wk8dRr9crxKRCtqpQBCSy6sLF87fa4T4sCyZPAv7PCchKLvp+yORJ93ocLzv5VoxeHhf
         PY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GadLoYihLq2je6MYFrcuqG6j575+3dCNXyYioo3yDv4=;
        b=fSAOrqqDIJykzQaTC4jFj33YtsOmYyMxk8XZhS+Xg/gW4w5Enph8JnjzSKwvIC6Tl1
         mc52H8VhNr2ed3N0bZy9MALAXjM7Z8l45m7n3KIW9UlwcQiY67FM6Eo/h8yOvzwE9Lnp
         ejmtt+N2RwAZ2gmNWb+Y9RpmMljmacQLa/HfVh0xJexDHdSy8oZKqzG2ZBzFN/w5ZvNF
         RgJoTkdyu+Cwh18dGyolMuHWkiG9B1Y6QVO1d0tL1fk6X7wL166anQWyGl0NntY9Xh+K
         nZdFP+nwBa3iYJHrTeZtKYwB42WFpMYjBdMT+/0YhIu7WAjDdUdjCLJbFb1OiqbvHtap
         PS3w==
X-Gm-Message-State: AO0yUKXh8DorRdgW2KUqsE8FQ56T85E4SWUwDQWCuoa63vt34MgRIbW9
	aaaqQu3G7dwxZIRVk84Z2Nyu43It
X-Google-Smtp-Source: AK7set/Lk845WbGAFjZ5rF89GfB5FvB7W1sRpidMh9LOczcFsy825tblbmE6E7m86VRHuoGiqkF90w==
X-Received: by 2002:a17:902:d2c2:b0:196:3596:4a29 with SMTP id n2-20020a170902d2c200b0019635964a29mr12288145plc.21.1674865362703;
        Fri, 27 Jan 2023 16:22:42 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709026b4800b00188c9c11559sm3445126plt.1.2023.01.27.16.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:22:42 -0800 (PST)
Message-ID: <d9c2116b-79bf-9a25-a407-bba568e23773@linaro.org>
Date: Fri, 27 Jan 2023 14:22:38 -1000
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
X-TUID: kFZKLDnQp/Mv

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
> +
> +static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RmeGuest *guest = RME_GUEST(obj);
> +    uint32_t max_value;
> +    uint32_t value;
> +    uint32_t *var;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (strcmp(name, "sve-vector-length") == 0) {
> +        max_value = ARM_MAX_VQ * 128;
> +        var = &guest->sve_vl;
> +        if (value & 0x7f) {
> +            error_setg(errp, "invalid SVE vector length %"PRIu32, value);
> +            return;
> +        }
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
> +    if (value >= max_value) {
> +        error_setg(errp, "invalid %s length %"PRIu32, name, value);
> +        return;
> +    }
> +
> +    *var = value;
> +}

I don't think you should try to genericize these functions, comparing the name string. 
Just rename them and let them be specific to SVE.


r~
