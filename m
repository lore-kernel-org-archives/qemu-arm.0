Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8233265wrv;
        Thu, 8 Aug 2019 11:37:09 -0700 (PDT)
X-Received: by 2002:a17:902:8b82:: with SMTP id ay2mr14192273plb.164.1565289428989;
        Thu, 08 Aug 2019 11:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565289428; cv=none;
        d=google.com; s=arc-20160816;
        b=xarPOkY5tm1v7Tf5CJuZ2d4MxmOLNvO6UuoFkdYqjrf+JYs9DgsSUF7dQFZhWqZfQw
         5v7edAHh2daN2n7WUTGjoymb8Q8iXiz6bp4v7C6pGsvC536vsaPscbVeoMxI2EoENGDs
         aAAhwSHjklNGwbpWVSF3EHnzncePSSt/K+6dslzN2r5IFO/NfsKDnN73dBxVNzXL8Rh6
         5hmMMo3zvac1qqo5RGExjVlpCbPI0cB0cAfATQ73/NEOSKgOu8f42XMft6epKwwi2+Sh
         k/jAPwEkx8BR/Q2lJu++h6pUEKZK1mO8VEf6HBxLXgublVzDX/F6oEYb3t8hJmsLGKk8
         ZWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=ZwUGXhmWxNFcvkP+kWRtHSH+LXZ3dIUFppAlpP+dEec=;
        b=S7MBHS6wVuuDxRVZp2sGMa1ph5A+Hj/nkuc70X7t7W+h47e9UB9Dvixa1vvUVDkWle
         bUZUF4Umlrpmi+elu9zdfivE7EjX8IcpIk9nlL89K4wonSKhMYc753i8pNhEUxRP7yxu
         AQm5YKJpLou4nnro4xi9hODMPTmZc9AhR0JXA+y3Mv/wkpAvIzHcMpGFVy38OnX1/1z+
         7EB0VDT50NVR72NBYAqNlu2O22X6r945pNoqkctH45gI7qAE8tzv6fEGIcVLLW36ZHKV
         /DOk0AY/CZ3K+Cmcg5bq7fybLHf5ORhP5dP3DCbEkgttQy+TjESJ/Mo81ityVtJxZc9y
         MvQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwdC1fpC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d7sor76126570pfq.35.2019.08.08.11.37.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Aug 2019 11:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwdC1fpC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZwUGXhmWxNFcvkP+kWRtHSH+LXZ3dIUFppAlpP+dEec=;
        b=DwdC1fpC96Yg4sKyHmcG9W2BW3CaSDDybX7wcT8J9zsA799JHMI8lpbg4uJuRWxNA8
         OVLvdrpNAbVNJ488YJi+OsmcCcmkVWauKr4kTkDglP2F9WvldTEO40cUVg2Vu8WpSJtq
         6u4ynLwd8WU1SUb8ZvIFvcpb4mrzvpzuGCB761fzx7jNxBDJatSfJghll28UOxALdyrh
         j9w/JOgmfyVBx9vrhDbYoxR/O6WIPNfJ20nZoNQ99STbL7WFgpW6cz9BYfFjIM+svAKU
         sBYw2Uehe4FfSK7jWinfuF4ASv/GgDXNQ8/I8cgLy8RoG/mvxIjlmqRs5xX73xJUAYE3
         O+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZwUGXhmWxNFcvkP+kWRtHSH+LXZ3dIUFppAlpP+dEec=;
        b=r/bu+pHCVZ0UJI+iFVJfy3AuIHrrtNQ1E1RXW7u7PVPlkqrRguMsPifiyF+OgEt1VJ
         ErP6xJ7pBV4vGhOLvFeKEbPayhef4sLx3xdrFgrEZu2c7nL3cJ/KbV+C02i7Kf16Y1rN
         ooGmNvmnXTSy25qdglLJqFmkdpp9Jni6DBzUANLEZ+WddFE5xZuTGye5UcaLb95qQyuw
         UAPGaxKV5CfnioVGv97pg8j4x9BxZeUysY0Y/NwWbjXft6jLtbbM7GRQNIxvugjSHpTm
         +hpbG0jDqkS3wP3feJWtQ3A2vGsTblcaqmEDKcO/anYf76CqadASe7qxU8H2Q2bKeQHK
         cgOw==
X-Gm-Message-State: APjAAAXjl/OKVxg5yvL5+KG5XRKxBKbZfHWTNawuvHrK4WUoSAl2Rbuo
	ael8bgC82MVNuZ0n/FXUtEn4IOKI
X-Google-Smtp-Source: APXvYqwpvntLVOS1gTrdgS482RvhtN63R9d9cKLXg85KUQSnQUSCfVPbCWSt5o2X/xu+BjrZaHpj0Q==
X-Received: by 2002:a62:2ad3:: with SMTP id q202mr17330549pfq.161.1565289428518;
        Thu, 08 Aug 2019 11:37:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id m16sm97173069pfd.127.2019.08.08.11.37.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 11:37:07 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-4-drjones@redhat.com>
 <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
 <ec44ddad-c33c-918b-e94b-a534a2519a9e@linaro.org>
 <20190806122144.bb3klk7aaaqdhgwi@kamzik.brq.redhat.com>
 <39a4d205-d291-8962-2693-6bbcce89c332@linaro.org>
 <20190808085012.23aokly34zo4wxbk@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bb477706-e09a-c992-38f0-d3f8725bb4c5@linaro.org>
Date: Thu, 8 Aug 2019 11:37:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808085012.23aokly34zo4wxbk@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: LCWuZHwNrN5l

On 8/8/19 1:50 AM, Andrew Jones wrote:
> I'm not sure. Of course I'd need to experiment with it to be sure, but
> I'm reluctant to go through that exercise, because I believe that a
> deferred validation will result in less specific errors messages. For
> example, how would the validator know in which order the sve<N> properties
> were provided? Which is necessary to complain that one length is not
> allowed when another has already been disabled, or vice versa.

My point is that we would not *need* to know in which order the properties are
provided, and do not care.  Indeed, removing this ordering malarkey is a
feature not a bug.

The error message would simply state, e.g., that sve256 may not be disabled
while sve512 is enabled.  The error message does not need to reference the
order in which they appeared.

> Also with deferred validation I think I'd need more vq states, at least
> for when KVM is enabled. For example, if 384-bit vector lengths are not
> supported on the KVM host, but the user does sve384=on, and all we do
> is record that, then we've lost the KVM unsupported information and won't
> find out until we attempt to enable it later at kvm vcpu init time. We'd
> need a kvm-unsupported-user-enabled state to track that, which also means
> we're not blindly recording user input in cpu_arm_set_sve_vq() anymore,
> but are instead applying logic to decide which state we transition to.

Or perhaps, less vq states.  You do not need to compute kvm states early.  You
can wait to collect those until validation time and keep them in their own
local bitmap.

bool validate_sve_properties(...)
{
    // Populate uninitialized bits in sve_vq_map from sve_max_vq.
    // Populate uninitialized bits in sve_vq_map from on bits in sve_vq_map.
    // All remaining uninitialized bits are set to off.
    // Reset sve_max_vq to the maximum bit set in sve_vq_map, plus 1.
    // Diagnose off bits in sve_vq_map from on bits in sve_vq_map.

    if (kvm_enabled()) {
        DECLARE_BITMAP(test, ARM_MAX_VQ);
        kvm_arm_sve_get_vls(CPU(cpu), test);
        if (!bitmap_equal(test, s->sve_vq_map, s->sve_max_vq))  {
            bitmap_xor(test, test, s->sve_vq_map, s->sve_max_vq);
            // Diagnose the differences in TEST:
            // test[i] & s->sve_vq_map[i] -> i is unsupported by kvm
            // test[i] & !s->sve_vq_map[i] -> i is required by kvm
        }
    }
}

If you prefer not to experiment with this, then I will.


r~
