Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1501393wru;
        Thu, 27 Jun 2019 09:49:05 -0700 (PDT)
X-Received: by 2002:a05:6000:106:: with SMTP id o6mr4276768wrx.4.1561654144986;
        Thu, 27 Jun 2019 09:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561654144; cv=none;
        d=google.com; s=arc-20160816;
        b=vudrOgySwJVX4jiPc4W50vriKLiLUgMJS7BliF9XURu1hKIObmqtXLlRk7vNAphYAi
         AWT6TPYebIAJDhhhz0aARDz9no26BwUx5w/VzwzW3aGtk++S2nxPPfoQqwVZli87LXWy
         U3a9WA2CRit6voBg9Xi/UsC2Cyx0JTNVt5gYCzzyKimKReMAImRYgFXoXrppqcGVsHUY
         ipHyJuAFxdRM38fldD69R8ud26Y5SOJAyQcwYwKoFNSpecG3MDzMh0t6o0/EEyjM+u2P
         nw01sXl9HJHZfCapCvy6evHwyH8wAjLl7Ts4/0/f+mV2TOIOLT2HQYkhl4f/yr3DsqU+
         /rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=KxaezKipBS23o61QK8eZk3AlZTmXnPtWw+JObqAW/p4=;
        b=iX4Mpa2iwu1QJe5UP16IJ1yzs3heWBS6o0JK9yVfklsdQWzwBVtr5ii6fXbvpdpwYW
         K1yXWbhE4TTPrW/Tp3EBg3lPw8CGV+ev3ZGDvtGU0ICP58HZFM0qk8devbiEhsZmF2EA
         e2fuTPIVRS40+5AbLQ+92M6iadEiW+3TYg2vBKA08iwpsQyEYBXueoPMoGjS7AK9Pk0F
         yEdNurMEATLzUTGs0+JSsoC83bG5SRLQZpKhisqj4xt2fGoi9vIKp4r/8grZmZ/R+WBN
         hJ3cb6m5QTiqE7/X5lm3Db7rrjI4bsUJsAk0D2PK5hcggjR27lmzcrKIJwTmUBEyOkgo
         zfBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpRMsVUV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 13sor3515039wmx.5.2019.06.27.09.49.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2019 09:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpRMsVUV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KxaezKipBS23o61QK8eZk3AlZTmXnPtWw+JObqAW/p4=;
        b=vpRMsVUV/nm5/ml4RovtUjO6KoxNioiuu3WDSg3Zz0mtcjxZozEt+IBRZVmz/tr4De
         ZzMi1YVoazraEr7yY8VcE3jHaifK3RjFOYsrn4qVQnc5LivN8hxNXjt0MOPaTj9H+bYc
         lNT+6CN0MtGoMN7p0T1zyiTjoDVHZLAHLACILdP3l856Rkr9TCM9d72kpXcdTf9yAB3a
         U+7on4Vl6UZPS7TVYCVKqNpRJRcE2oOsfgvCJ6eAs19R2HsEv+/3SFmbOdB19kjL/iuc
         LtbxzA+EjhtzCvv/ilrFgYRwQSng0SCBbYiHQs4FhqOPufclliwjnBG+V2TpOw11RjHb
         DItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KxaezKipBS23o61QK8eZk3AlZTmXnPtWw+JObqAW/p4=;
        b=H2XSqSK6qVehEd3oFo9K9ge1sNOjupnvZDFlW27Md1r2oFAoIMBiyaGGV3CTRqo/PF
         6oNBePvkopQRvmjVpMIancmFoLUpk2XvIgDjfgMOxPHLjqqQK09dZEFnAauccgsgS+F3
         1FaBCvoOXiTy5RsKlfavvvZqH7TMO/rwWmDlhAtcF5p71vfVwFDbqlXWkcM/i3k0M6P9
         2jMHzoLF7TV0AxGj+yTR6giUI47oEvRxiDRwCFoXnwXyrvMGKKs3YMkh6MLKz03KuHlF
         u0HAucvVCAGo1P7QgFe2ZmdAknscX4ETguK5dpEiDmKX7ue2NS/72O1i9aaMy+VRCPpN
         3tBA==
X-Gm-Message-State: APjAAAW/HFMI7beQHxzi0Ms1HThAQ567/9sQgaRKsXvkb3gyL9A7GDd+
	UACwYrvUb+ENvG8hhtFmBpJpNC5T
X-Google-Smtp-Source: APXvYqw0dXcQ6SMbSTw0LaOL66eawMY2BJ3g6gMKi1zpD6dVL7zhuHJY0y3a9H8TpaOjRphG12Mdaw==
X-Received: by 2002:a1c:c747:: with SMTP id x68mr3923706wmf.138.1561654144652;
        Thu, 27 Jun 2019 09:49:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id h90sm3796163wrh.15.2019.06.27.09.49.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 09:49:04 -0700 (PDT)
Subject: Re: [PATCH v2 07/14] target/arm/cpu64: max cpu: Introduce
 sve<vl-bits> properties
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
Date: Thu, 27 Jun 2019 18:49:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-8-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: J2vPDh2OSkHc

On 6/21/19 6:34 PM, Andrew Jones wrote:
> +    /*
> +     * In sve_vq_map each set bit is a supported vector length of
> +     * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
> +     * length in quadwords. We need a map size twice the maximum
> +     * quadword length though because we use two bits for each vector
> +     * length in order to track three states: uninitialized, off, and on.
> +     */
> +    DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ * 2);

I don't see that having one continuous bitmap is more convenient than two.
Indeed, there appear to be several places that would be clearer with two.

> +static arm_vq_state arm_cpu_vq_map_get(ARMCPU *cpu, int vq)
> +{
> +    assert(vq <= ARM_MAX_VQ);
> +
> +    return test_bit(vq - 1, cpu->sve_vq_map) |
> +           test_bit(vq - 1 + ARM_MAX_VQ, cpu->sve_vq_map) << 1;
> +}

Neither easier nor more complex w/ one or two bitmaps.

> +static void arm_cpu_vq_map_init(ARMCPU *cpu)
> +{
> +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ * 2);
> +    bitmap_set(cpu->sve_vq_map, ARM_MAX_VQ, ARM_MAX_VQ);
> +}

Clearer with two bitmaps.

	bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
	bitmap_set(cpu->sve_vq_uninit_map, 0, ARM_MAX_VQ);

> +static bool arm_cpu_vq_map_is_finalized(ARMCPU *cpu)
> +{
> +    DECLARE_BITMAP(map, ARM_MAX_VQ * 2);
> +
> +    bitmap_zero(map, ARM_MAX_VQ * 2);
> +    bitmap_set(map, ARM_MAX_VQ, ARM_MAX_VQ);
> +    bitmap_and(map, map, cpu->sve_vq_map, ARM_MAX_VQ * 2);
> +
> +    return bitmap_empty(map, ARM_MAX_VQ * 2);
> +}

Definitely clearer w/ 2 bitmaps,

	return bitmap_empty(cpu->sve_vq_uninit_map);


As for how sve-max-vq=Y and sveX={on,off} interoperate...  I wonder if we can
just remove cpu->sve_max_vq.  That might simplify your code a bit.

What if sve-max-vq=Y "expands" to

	for (X = 1; X <= Y; X++) { sve(X*128)=on }

Then you've got a reasonable in-order definition of how those two sets of
switches interoperate.

The uses of cpu->sve_max_vq within cpu.c and cpu64.c are all initialization
stuff that you're replacing.

The use within sve_zcr_len_for_el can be replaced by AVR_MAX_VQ.  Your "select
supported vector size not larger than" code goes at the end of that function,
such that we select a supported maximum no larger than the raw .LEN values.

The use within aarch64_sve_narrow_vq should in fact assert that the given vq is
set within cpu->sve_vq_map.


r~
