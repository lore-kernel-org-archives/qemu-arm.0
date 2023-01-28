Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1522461ejc;
        Fri, 27 Jan 2023 16:07:56 -0800 (PST)
X-Received: by 2002:a05:6a00:1d23:b0:58d:a91d:e9f8 with SMTP id a35-20020a056a001d2300b0058da91de9f8mr34516087pfx.18.1674864476463;
        Fri, 27 Jan 2023 16:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674864476; cv=none;
        d=google.com; s=arc-20160816;
        b=aN87MgcMnO0zIDgv69sqe/YN2bI2d8bG8F54Mmd41Fe0PL+g8V+MQF7ZFaFyoLShwa
         LmCtkB4xv6BHgoDpDwtL2pkuVPmoXbJo9eMhnJak3snloaSaWSnzq3T+qz2sywtUwRrU
         +qPKe6rvAPeDi40TQ8pLCREcr0d5WeHcJBKQzZTS9Xd5IwEMyIcJ1KlFcw1/hpMTFyI3
         3rJ+v2+oXmZg+fkgaC+pOIZX3BhmwkSBQmUuLX67XbSqP/oOY9oDwOOm0yEOHmpBRAwZ
         fwP+h3lKXTEF/ZgHErf0tEf+rSmmfjgQ/6wbJqw5oManquzdpldSMo53jL/4GU+LKbwN
         AJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YU7YW85QPyg9XiExQDx6HHoBI9WegkkBjdetxlQe2BA=;
        b=BMTUpAyp7B9eR0PGVHSO5KclXd/WlYVk3UKpFPgLb2CUfBe96NN/VOU1YllwaLjpuV
         +eIVZHRgN+Y8fophhyj5R+fziiasDgBhc8sMTl3UlsTk1g5+AEp/7kPNkov+DL6tD8Ty
         MiAmsrKpcSUOVSLJnHHM0eLZ/kr8PY8mBl0s4u0uGDD+JkFVMSblVIfVJjqxcofMolAL
         tUV/dQINl7Ql4q6mZsm/c9vQLf4pbaFr5oVMZqmp7t1w/nnGxA/hucmuZKEUMhSMfp7a
         9sRM5541MVQ7HQXqBFA18uBcYWIf0QyZP9eypOms4OK8lUmwVsT+4vXh4bqGOuyoq8jc
         4cDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InT5xDyt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8-20020aa79208000000b0058dd7b77ab6sor2409258pfo.10.2023.01.27.16.07.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InT5xDyt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YU7YW85QPyg9XiExQDx6HHoBI9WegkkBjdetxlQe2BA=;
        b=InT5xDytkKCvS19kVb/E04KjdCJjarIrs3tK5VtFzItNWMSeNyV3hvHQ7L5Kb6XIzH
         P1qja1qFIRxXg2pdsHIt62YONgs3mqj7XJfwqMgsXB35Nmh+3K//ICcu6DFFHbACPPEv
         GjIB0MSTFwCfDJL6FErtU3TiN6H41qvq4jdEfGWw4FcNAXLAhRYVXjtGsGtyJM8y2J/6
         1yfyH9IoU8+dGInHt0D7dJYnA07i2kPRA2YWgB4iAvtg6us5nE72n13Co1lZoRvtGble
         9equAjl1bMxcht6iO/FAvDUXzMRKS0rYXe/iqDJ0jgBfSd/hXJEQ0vZiIXFKIUDmtpBC
         KCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YU7YW85QPyg9XiExQDx6HHoBI9WegkkBjdetxlQe2BA=;
        b=S/2WA84FAE/VPw/2AxkRwCjju9+hCThnqW3d6sU+kY/TLIVpDHh3lcrXST0RYvVWLk
         lRoRh8MgllcefRUowQchDhCn8cYhFc8W+o2sl6F2VjQ6P8K+1/tjZgehFh8XDv9M7ef5
         HKOVzTmCdOZKsA4vwvfTsyvSDHM3wwbpqv4G/dGrINj0SwsulaE0Ikzg7Y0qWOMvcGbq
         NRHSVOI5Fb7ygctjxyKS3tLkCqjxLKxTbDa3JCj3IRSGnOFOwLFjPRFkRrCcuNiZpegX
         uqwBNTlXh33RPpGzY+ayE0Xbs7ZcEcDvbqYujHZIvjz3Tb4fBdjVpJIiKskX32Od7Y/z
         USAQ==
X-Gm-Message-State: AFqh2krfvhUqgYRLWHHvDi0sjZ2/kQocOmFBRqzmZX5CQzd5sXRfFSoe
	X5IwI5aqp0gZw1QSBT49M3AzNXjW
X-Google-Smtp-Source: AMrXdXtwWcvCovpkIIlO4QENFYvBh/hlFQr6arSIh2vaId8oz311bkjp0hv3DpHUeVAcJO5ciNXLkg==
X-Received: by 2002:a62:3007:0:b0:587:8d47:acdd with SMTP id w7-20020a623007000000b005878d47acddmr40545361pfw.34.1674864475973;
        Fri, 27 Jan 2023 16:07:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id bm6-20020a056a00320600b0058d9623e7f1sm3187454pfb.73.2023.01.27.16.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:07:55 -0800 (PST)
Message-ID: <d0fc0e05-180b-f345-441f-f4c62c8e1521@linaro.org>
Date: Fri, 27 Jan 2023 14:07:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 11/16] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-12-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-12-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 21ekvqrNy5YO

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +static int rme_parse_rpv(uint8_t *out, const char *in, Error **errp)
> +{
> +    int ret;
> +    size_t in_len = strlen(in);
> +
> +    /* Two chars per byte */
> +    if (in_len > KVM_CAP_ARM_RME_RPV_SIZE * 2) {
> +        error_setg(errp, "Realm Personalization Value is too large");
> +        return -E2BIG;
> +    }
> +
> +    /*
> +     * Parse as big-endian hexadecimal number (most significant byte on the
> +     * left), store little-endian, zero-padded on the right.
> +     */
> +    while (in_len) {
> +        /*
> +         * Do the lower nibble first to catch invalid inputs such as '2z', and
> +         * to handle the last char.
> +         */
> +        in_len--;
> +        ret = sscanf(in + in_len, "%1hhx", out);
> +        if (ret != 1) {
> +            error_setg(errp, "Invalid Realm Personalization Value");
> +            return -EINVAL;
> +        }
> +        if (!in_len) {
> +            break;
> +        }
> +        in_len--;
> +        ret = sscanf(in + in_len, "%2hhx", out++);
> +        if (ret != 1) {
> +            error_setg(errp, "Invalid Realm Personalization Value");
> +            return -EINVAL;
> +        }
> +    }

I think this parsing is late, and should be done

> +static void rme_set_rpv(Object *obj, const char *value, Error **errp)
> +{
> +    RmeGuest *guest = RME_GUEST(obj);
> +
> +    g_free(guest->personalization_value);
> +    guest->personalization_value = g_strdup(value);
> +}

here, when the value is set, so that the error is produced at the proper time.


r~
