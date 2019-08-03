Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1444229wrv;
        Fri, 2 Aug 2019 18:28:56 -0700 (PDT)
X-Received: by 2002:a17:902:347:: with SMTP id 65mr38807784pld.232.1564795736014;
        Fri, 02 Aug 2019 18:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564795736; cv=none;
        d=google.com; s=arc-20160816;
        b=PiQf6AsJS7r9wZLBV2Wljmc9DLnlXv0wqWnQ/UYN2oZg4iXN8t5t90Vak15q7pqWLJ
         VEmhTx10aExPavLTZUHCksXkKeK0JAnPIgQPo0qiQ2DY9NQkB6VQpks8+rPaiADow6Wr
         w31lmxG9AD+U6rrwjFepNdUWxogqQ1N1HZwILRbASV+0dD2F+1fKulFenQ9E5B/d058A
         9yg39qkd/7gs6eM7V+ePFTEucCL3Aed8MIw3zcjDuM5DFLsif9WEzJfusZ844KHoLDZW
         yQ3BesYbVDJ6Z2SWGV3cEdosb1b/gbAgPH/CllKmX9XdQS5bDnI0bqfn77osiy1VtjNO
         vDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject
         :dkim-signature;
        bh=O2YN/QvQPLAClyEHRsWfCjD/z1AkYNw3I+YAPw1gM+M=;
        b=FuAGJ+YR3BQPFTBFz0LKqWE/bvr2FdUuE6FjLLE4yKS+TDY3LBSeG/COY+q/188Sgf
         Mn30yU67V83MvupziZezfBfKEzmZ+ggQBfZukM+VVlnJzXKAdOotmpgNHlaSJhShe2ts
         HNoanHRzKlNljvC1nzdL0jRjzZti+96X/B789WPib10DFNeD7jgnzk2SaWHrKiKKr1fB
         WFiku/mncGVksKjQbZuBE/hEzpDvOSLgUOfhT/5dYD6NLanrs03tOUEdcx6Ncvi+dIOZ
         I6g/miJ0py/MElJthIRG+wW7/S/DF165E7wwJ/ejAxl50vYddXQSVRn4OGrGKGnbQKGD
         dGhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="peAEqdQ/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a1sor12261300pjv.18.2019.08.02.18.28.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2019 18:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="peAEqdQ/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O2YN/QvQPLAClyEHRsWfCjD/z1AkYNw3I+YAPw1gM+M=;
        b=peAEqdQ/+jsPCbvSoNEMbZBGBEB7ki3rifLdsBrYOJ5QKxZWLx1r+73A+qAOYmq5mD
         UFghBw8pYHSMfttL1UUuMSG05BfX39qf5PZz+gdA0dHRPJp1XfiGz/H5P4Sv8v9VWu8e
         sC142ceEEwx9Qnyg/aOteuebeBAw7hzsmkWuruWg1To0qG+FtFjEIJYf7EZPOmero6wa
         M6oNh9j/hNaLxjBCirpPkbVsIemJlO5tXPEAVpWRAGIeUkvYzpiTZ4JmQr7/rBHMgqK8
         /sVlTbxaTIHb+Yj+HHw/eiE7uGIxUUhj+hk3mCJizkgW9XXv/prcPgaB1DQQ7GG60g0q
         oKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O2YN/QvQPLAClyEHRsWfCjD/z1AkYNw3I+YAPw1gM+M=;
        b=cZEpdoDPZJ1ghfv99Y8q1LpFSJiEmaJKtSGDN2Ji31BLkKV7jLSlpbCT3axAlIEetn
         7mKc/bwwxDuctejHdC9vHRbC3nlfn+ZqVq2+nT4g+JY95zNqvA8kNeGGFX6mA9LW6fEv
         v3gLUYnjSdVLgpqbxeki2q+L7/WqtT3Q2n2VXzsIffQKR6ti0hfIj+k7dDnr2GPBTx+5
         kjlxrtbYTV44noaOI+LEViAbBnG0CR3op5vbmCsHMvLxW4kqIiP1lv5ykTYcXvufPT2x
         dN5/f3PFGuDHaMb0MOQcAW/hvuF9C/SsCDOi035C9egWVmC9OvvdAyHpF53gb3XTZXBl
         jUdw==
X-Gm-Message-State: APjAAAUQYxzN1pYnrC2SgkJxXy+wf/8sfRNQrzUKbEcma94otS5rZvKz
	fjjcIuz6bQ7vJbElMRCIW/3/BQDs
X-Google-Smtp-Source: APXvYqwnVSUZlfREhsnBw9LuHXiDiZQOlt95M3/uViEX+7mxMOn6jU98+8N42JxsR+pBkaRjBsNXqw==
X-Received: by 2002:a17:90a:8c90:: with SMTP id b16mr6967034pjo.133.1564795735351;
        Fri, 02 Aug 2019 18:28:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id v13sm89644104pfe.105.2019.08.02.18.28.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 18:28:54 -0700 (PDT)
Subject: Re: [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
From: Richard Henderson <richard.henderson@linaro.org>
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-4-drjones@redhat.com>
 <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ec44ddad-c33c-918b-e94b-a534a2519a9e@linaro.org>
Date: Fri, 2 Aug 2019 18:28:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: SkYzXf75bhU2

On 8/2/19 9:27 AM, Richard Henderson wrote:
> On 8/2/19 5:25 AM, Andrew Jones wrote:
>> Note, certainly more features may be added to the list of
>> advertised features, e.g. 'vfp' and 'neon'. The only requirement
>> is that their property set accessors fail when invalid
>> configurations are detected. For vfp we would need something like
>>
>>  set_vfp()
>>  {
>>    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
>>        cpu->has_vfp != cpu->has_neon)
>>        error("AArch64 CPUs must have both VFP and Neon or neither")
>>
>> in its set accessor, and the same for neon, rather than doing that
>> check at realize time, which isn't executed at qmp query time.
> 
> How could this succeed?  Either set_vfp or set_neon would be called first, at
> which point the two features are temporarily out of sync, but the error would
> trigger anyway.
> 
> This would seem to require some separate "qmp validate" step that is processed
> after a collection of properties are set.
> 
> I was about to say something about this being moot until someone actually wants
> to be able to disable vfp+neon on aarch64, but then...
> 
>> +A note about CPU feature dependencies
>> +-------------------------------------
>> +
>> +It's possible for features to have dependencies on other features. I.e.
>> +it may be possible to change one feature at a time without error, but
>> +when attempting to change all features at once an error could occur
>> +depending on the order they are processed.  It's also possible changing
>> +all at once doesn't generate an error, because a feature's dependencies
>> +are satisfied with other features, but the same feature cannot be changed
>> +independently without error.  For these reasons callers should always
>> +attempt to make their desired changes all at once in order to ensure the
>> +collection is valid.
> 
> ... this language makes me think that you've already encountered an ordering
> problem that might be better solved with a separate validate step?

It appears to me that we can handle both use cases with a single function to
handle validation of the cross-dependent properties.

It would need to be called at the beginning of arm_cpu_realizefn, for the case
in which we are building a cpu that we wish to instantiate, and

> +        if (!err) {
> +            visit_check_struct(visitor, &err);
> +        }

here, inside qmp_query_cpu_model_expansion for the query case.

Looking at the validation code scattered across multiple functions, across 4
patches, convinces me that the code will be smaller and more readable if we
consolidate them into a single validation function.


r~
