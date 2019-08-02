Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1123238wrv;
        Fri, 2 Aug 2019 11:07:57 -0700 (PDT)
X-Received: by 2002:a63:5f95:: with SMTP id t143mr65018700pgb.304.1564769277710;
        Fri, 02 Aug 2019 11:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564769277; cv=none;
        d=google.com; s=arc-20160816;
        b=NyBmv6lWmZwOi6ZWGq9jBXf30yZbVf+/15hpB2wLh9zmcrlxeV1NfkGR83XXs0wH4x
         rAiULQR/7m6oqDBHepCwwGGL4F0SBsrYH3CJ3swqIXBnFdhaAuwK+TTwi9pLmu3yuq90
         0nXtT7NbHpjb0rRbJIIEjpQ80gZTJGvhhbNGWczzEikgRTia1A1/zLgy4l15WvQ2rcVp
         GwlB/ROsuGXSG/LFEObaeyUEOTt05YyLK9RhxnJYDpZmqh+ybcKMNxmSOyt6Pb0CQgBj
         5EDqSIuJhS4EpwhthsEGi6Lvg81dsmH1PIZKA4TT6e3rvFbgfi1MOInj0GQGPYu2aM/j
         bQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=7acY56a+PDiMtL6UNCH6Fj20v/00iLU8b65HWqZw770=;
        b=YIZ79dFmoMu55BqMD9T6MuTd5gMZKZjsrEo5BQR47UX/ouda+g3JYIa4QkjyLc7HWx
         3rKA3BLr4zfZgv9ecXR6oiz20aQCql024gGLXxI6dyODALyZtmvNs7/NrJCmUcIp2/QZ
         Bx5n00CwKTre5iyIPLdZFouvnaEopCU2Qv4ntkn5anfmxaMjrACrP6PrQT7Fo1U4V3p9
         l2qkwUx4x8LJu6eCt3bST8265L0MWU+z0j1ETxQILRQKmteaLF2x7+U9iihGO/djQfcJ
         Tjxtn5VQOzx0qvMAMT6co3boly/50DFnqBYYtNThz14QyzDhlw1WIvVBBV1H4YAF9cBY
         0Lhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5SoncGl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s14sor11147846pjb.11.2019.08.02.11.07.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2019 11:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5SoncGl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7acY56a+PDiMtL6UNCH6Fj20v/00iLU8b65HWqZw770=;
        b=L5SoncGlSagGnM4NngViH5oVNAJ5AYtSgoEjRUu39rCTfGsl48XoCTFrseb0dEpEAf
         MrCp3Oh4s5GtZNagmCa33Q3Kl6HDELMmuqo7rbcZ2fkUrZWv1QlH+lvpm0gHfGWnzNE8
         SgMFJwd+nBJYg+S/jBKeWEO4ViTLHKF9HfLIGm33dNch3dVOrZpbNSKEzgBOodJpjwgD
         BgSIg5NKbaLnLGEZjgQk6UJJfSXLnVTSeq6OIaXuLZfmNwf8DqLelnyod+u1mx00I5Hg
         ailN5XNkKbD3oQ0FMY1q9Ds6DkiLNnj51SRI4UetITNdnWArsaAgm1WNA6kJ/L1Nm1W6
         QcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7acY56a+PDiMtL6UNCH6Fj20v/00iLU8b65HWqZw770=;
        b=c3sjpNMynrKi7CD8Twmry+Kc9meKK4Y1iIbHfaQz08l280otkCxC7fDg8JtEFY8kiZ
         w4JaxE6FcXIHU9fYaldvTssBRrV8cBDT30iAzlycSIQitq1+nMXLlOdYODtXyrtGl8B9
         amd1yZ8PSDIqzfNECt7kbB+k0r50J8iI0uInAkeiAIJZZopnBonYxRZo3BZweAwIDwNx
         KWYyf/ih+JbOlE8gLmrYmx+as/zbz3BOpOc8JjC0Nby/X6GBO1OP9cWzh9YzQF7nfilq
         U+z3ucf57PAZUlo5hRh66XAYq/wetinjPT9uD2LZGBbIVqI+ZUn7MC3q5xWn+jrdji9Z
         6Rrw==
X-Gm-Message-State: APjAAAVeQ5Tt6K0SY9BAwypQu1YknkO6YBfNygFcf8jnFTpw7hFfQmbO
	ZJegOnLaqFKaWFxn9kyPSMS36+Gm
X-Google-Smtp-Source: APXvYqxO1aiC5zXZa+THxvqGryRsWnr7ChOHudCnMyw1ADq+lmYljnNg7odO8FWURfnG12NxW4E8Kg==
X-Received: by 2002:a17:90a:22aa:: with SMTP id s39mr5411398pjc.39.1564769277155;
        Fri, 02 Aug 2019 11:07:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id n7sm85573945pff.59.2019.08.02.11.07.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 11:07:56 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] target/arm/kvm64: Add kvm_arch_get/put_sve
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-12-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e41ee1a4-9514-8fe9-8761-f208c9bdcbf3@linaro.org>
Date: Fri, 2 Aug 2019 11:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802122540.26385-12-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: C5RDSRJtzYd4

On 8/2/19 5:25 AM, Andrew Jones wrote:
> +/*
> + * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> + * The byte at offset i from the start of the in-memory representation contains
> + * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
> + * lowest offsets are stored in the lowest memory addresses, then that nearly
> + * matches QEMU's representation, which is to use an array of host-endian
> + * uint64_t's, where the lower offsets are at the lower indices. To complete
> + * the translation we just need to byte swap the uint64_t's on big-endian hosts.
> + */
> +#ifdef HOST_WORDS_BIGENDIAN
> +static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
> +{
> +    int i;
> +
> +    for (i = 0; i < nr; ++i) {
> +        dst[i] = bswap64(src[i]);
> +    }
> +
> +    return dst;
> +}
> +#endif

Maybe better as

static uint64_t *sve_bswap64(uint64_t *tmp, uint64_t *src, int nr)
{
#ifdef HOST_WORDS_BIGENDIAN
    int i;

    for (i = 0; i < nr; ++i) {
        tmp[i] = bswap64(src[i]);
    }

    return tmp;
#else
    return src;
#endif
}

and then the rest of the ifdefs can be removed.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
