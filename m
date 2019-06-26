Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp591894pjq;
        Wed, 26 Jun 2019 03:20:31 -0700 (PDT)
X-Received: by 2002:a1c:1d8d:: with SMTP id d135mr2112314wmd.54.1561544431719;
        Wed, 26 Jun 2019 03:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561544431; cv=none;
        d=google.com; s=arc-20160816;
        b=RAS1WrLDV7CiRpji5Vn41O4h5cYNiCo6TGRNQ3p/9wWwyf9TGm8/MrweQTpSg1vqW5
         5LUXoaR/PRaRyln/poeiYTLOY+xb6guzwZ5LQpEckAg9fpefp9Cw8FYVlMIalW4pgVe2
         mqtD4jiErm8GHnQHmHj8jhyS6bf/vr+suWInM4AXI3ZLurrc6mwJUSrsX+Gj3iV/cDrY
         CXjdSRhRBrcAusad/RVpmAXK7fjNYJjA5T735R2+CeOA/plIpzXBrhSgpdZXPcKeyevQ
         V6oaNiUqUqzTb9k2NBwBvmUEoGjb3A+qWOH3MjkLIhedpPWNtgliHagfwqSPyKE+EBTi
         nxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=AJROqdVuF3MKSOUxZEUUzGgPgREzKz04HNRZCztinVY=;
        b=KWUET4m2EEoDjmIIS4QmtonVsqawW0rIlTNV002Arv2xueQvn1u0fTkmq6qIHCmNRs
         z2t8426knyEk0tJ17bItUp+Rrwcd4OTXkX+eq6ooU3JO8dc8WeWs4+awna7inhehJT4d
         ZP1zcEGXzr9DE2Af8KFkAH7kTH94xKm7DJMxdiERIjP7+mkl0amedjmYYNmcLOMqOATI
         h3MZtJyLvVO2yyVLB9OLR0KsLq8NRiNYAVjCCjpgMFgdG8vqLfjzsht+Nbd+eEqUv/ps
         StL+56LAZwbE/fey7Jv40r61bPQmUBzJBv0ps8a0oZIYj07Nw1h3yCMMRIKLa6A/o3Qy
         yYqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/0yJbJn";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m3sor864366wma.15.2019.06.26.03.20.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 03:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/0yJbJn";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AJROqdVuF3MKSOUxZEUUzGgPgREzKz04HNRZCztinVY=;
        b=m/0yJbJnx4fCTEXTrOgsHsxrl3hX6Nzptdr0Xe26prTmK2ZDFA0XdZa8s5s75Isp4U
         913az60WI8i8qtgY/UaxzPfXwQ8KRKKcEsrUpD7Z1ErwX7vRnMK8qQig2EPAnTne+/wQ
         KCCFCBCmZzCsZhLmvfIH9SnBRYazVjMT5DU1xZu3L6kzLWpsfaINVtO6vbHlVy2tdINv
         9xAOIy5JcXlcJ57lU46oBEqCphw2gkB4KUzrOXUH83bNi75Y0spv2XTX541HUsgXTYFk
         c6IdTEAGwOEgKRgyDIB9CQ6/2iORi7uweh7bqwfSXOnBWJVZQDuNKLa0b6OazaJ8mlhK
         0d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AJROqdVuF3MKSOUxZEUUzGgPgREzKz04HNRZCztinVY=;
        b=TO1Ls+/0AVN6YRd7emYyKQQdfNXv15lHigfLAfLqIl6JlJ8FbF2WzXZWEiSI5VTYJ4
         zWfKMUv8lW6n0brXUSDbE4RwJZFxA76XOmJBsoDcE3yvHbJmMj0Fso71lGz798s7E0VX
         r3iz8dUFRHW+tjTWr9Dm5k2V35Tk7jfJBdf8mZzAs95tEfscRid2D8ezPbSvrOzVlxnC
         /yzuEGk0qqcnwz+gqLvlgqz/4i2nQldKdwwgwWZruG3Hl/e8NNPjtPp6Gm41BpDSB7GY
         zBFgiB/MpOxWjLcALAlOZWBBVBu696ITNIUYJXuVs5k+fZ64/M+rtodLpFfgVrDF0qcZ
         rCXQ==
X-Gm-Message-State: APjAAAUoE2mvLJW2zkkHWU2mltTgiGo6zKGA5cj+BSjknihg7EKSWQmK
	qRNzeGIAtXUGiMc5itWWpjwScyyQ1bwXyDJD
X-Google-Smtp-Source: APXvYqzMkSfavkM8g6Ou7HsrjGV1NSrMZl0A/bF457+KLh7Huj0b7lFzlXoR3U5ptXC38GrIgDCGBw==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr2162544wmb.107.1561544431257;
        Wed, 26 Jun 2019 03:20:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id a2sm3478001wmj.9.2019.06.26.03.20.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 03:20:30 -0700 (PDT)
Subject: Re: [PATCH v2 06/14] target/arm: Allow SVE to be disabled via a CPU
 property
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-7-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c794d810-fbaf-ff81-9833-3e40fb5a951d@linaro.org>
Date: Wed, 26 Jun 2019 12:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-7-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: tV0tGpHASXQs

On 6/21/19 6:34 PM, Andrew Jones wrote:
> Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> a CPU property") we can disable the 'max' cpu model's VFP and neon
> features, but there's no way to disable SVE. Add the 'sve=on|off'
> property to give it that flexibility. We also rename
> cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> to follow the typical *_get/set_<property-name> pattern.

I think perhaps the new property should not be overloaded on cpu->sve_max_vq.

At present you are generating an error for

    -cpu max,sve=off,sve_max_vq=2

but not for

    -cpu max,sve_max_vq=2,sve=off

and then there's the issue of

    -cpu max,sve_max_vq=2,sve=off,sve=on

discarding the earlier sve_max_vq setting.


> @@ -1129,6 +1129,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->isar.mvfr0 = u;
>      }
>  
> +    if (!cpu->sve_max_vq) {
> +        uint64_t t;
> +
> +        t = cpu->isar.id_aa64pfr0;
> +        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
> +        cpu->isar.id_aa64pfr0 = t;
> +    }


I suppse the isar bits are initialized too late for you to be able to re-use
the ID_AA64PFR0.SVE field *as* the property?


>  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                        uint64_t value)
>  {
> +    ARMCPU *cpu = env_archcpu(env);
>      int cur_el = arm_current_el(env);
> -    int old_len = sve_zcr_len_for_el(env, cur_el);
> -    int new_len;
> +    int old_len, new_len;
> +
> +    assert(cpu->sve_max_vq);

Certainly there's no reason for this assert, given the above.


r~
