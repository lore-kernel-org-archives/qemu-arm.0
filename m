Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6448704ejb;
        Wed, 8 Feb 2023 04:07:58 -0800 (PST)
X-Received: by 2002:a5d:62c8:0:b0:2c3:e134:4503 with SMTP id o8-20020a5d62c8000000b002c3e1344503mr6833922wrv.4.1675858078721;
        Wed, 08 Feb 2023 04:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675858078; cv=none;
        d=google.com; s=arc-20160816;
        b=oqmWUB2Zb4eFBYoltzjpey/Tow4BKvO6oUW3blVqdniDttFNK43HBvA7mh7ZuLu49f
         yw5ycOORIaWRLcQnTxZdzhtJLuDrwqIi0NCJQGwU/9wTQJ0QvvA4AUJewDjN0QsQdzAO
         1OKcHi18eO+n6jVV/rWzyHiDyhqBKSaR2R6xcFZsY0lCFcaMTCyU+kmbnp5tloOzIOFK
         noINiEP4mK2FDcvFCF42CKeCBL33JC8uwYvx0AKS9QPNbtMYpfi6hYSFE5rH4PCp4K/p
         b6VAEOla1/NnfHmiGTZoQ5a0UGJlzlZ/0SvSxbKr9tHkQ8vvvtKuCHcyDIpYanBemMyd
         AqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=sUIpEF/iWSLj26NrRU6xGtIxKlImqvjrsPnikTLgT7k=;
        b=kzG4fxNMz3/OiuZ2uLvPDmhvyLQSsuOD6gO8rfHLEHSLXSsqnUg0LYXFpaCMH1OsQs
         WxcB3MZIGshfJHzZpdC7Ryvd0KluMB/edLMWmeYkWElTUmKwXJIVgZC4yEbPqCKBz4mB
         P7RtJdpYaWEhV65ljko9FfSj/VergPhDSjVH6kdlPXaKyubSpIJKp3i/cchH1M62uqw4
         13YZ18aiTEPgA4Vkd+0Lcm7+Fh7gsMB2o2cbD6A0OC19Q55BQYSKCqlhtt2mE/Z6m9xk
         qSqKM01S4bOdauUaI6WnRzaBfQ9zJjztSbkReWVsLH8rvL4nyyDprz3MENwB63Iyhx0R
         1x3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYAGeJae;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i11-20020a5d558b000000b002c3ea56b412sor3475380wrv.16.2023.02.08.04.07.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 08 Feb 2023 04:07:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYAGeJae;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUIpEF/iWSLj26NrRU6xGtIxKlImqvjrsPnikTLgT7k=;
        b=VYAGeJaeL66tZAT6Pocl4WHZ7/trlw79w+EpnpvJ4+efTwRtBO+L+T6VqumDcVUYMu
         OovJW/YVhpcYGM1DovHOqT2v3h990LEKceinIjSs4S38MUuJjEJlkfHcYDGJmzvdmuDK
         UH9Cfa+NGKCs9t5JTnFLcO1/czRM4gSnHUKiUBEjEBdFmZkPjsiX2VOZIwVuESPBburx
         1HnxowhZD4Rw/GK9QWArcKWyUrsnZ9dnAeY+hz+SPurzAHJMTO10CJ666rPjvN26tqQ7
         aiqT+qTunlyrtgxmXblJTaksZ0b5yYvAIJUe964ebKQevNDU9mM8SQtJEVSK5IfLK5VL
         onyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUIpEF/iWSLj26NrRU6xGtIxKlImqvjrsPnikTLgT7k=;
        b=Tne1D0IWbso7FCwio8STp7UJZtsMQv645XnexiDchY6716xZfUaR6dl2lA1f7pwh94
         wu0dStLHPjzJ60lHgLGshNwp/gscGdg3V+KDhcQVSV23UMtOofC5ga+X13fG33yN3XUu
         vhwYgtqXQsFzc77SXoit5/OjtyWoP69zN3RvtrFCxkM0V4mhadPeRUJvWxyaWf11bufa
         nViJ23WNjzARUJpy8pM8TascXmre8fxS/urO8cEbZVDOHdrZge+/vmr6AagMr9QQQODq
         w5sUGCQk7Yj5ScD2demx/92vb058V0q9vcrdc/J82lM6g6I3EC/Hc+xjF22B+ui/05Y6
         r9Nw==
X-Gm-Message-State: AO0yUKUZwbZp1gUrutW+BowKhE85LKvnI40fJjoHWrCY5F6ztH7Q/hS1
	QOu0+Ja2gEuvGxBxn2jIwDDapB4d
X-Google-Smtp-Source: AK7set/BxQ1swWtEyv8ANvFXM1Db4iFDVYbVYNWfjUFWbEu+YeRL1x0hLIw+hZeGMUHTlOLwTrd8Pw==
X-Received: by 2002:adf:f3cc:0:b0:2c3:ea59:a8b with SMTP id g12-20020adff3cc000000b002c3ea590a8bmr6788414wrp.24.1675858078463;
        Wed, 08 Feb 2023 04:07:58 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id d5-20020adfef85000000b002c3e600d1a8sm8025281wro.95.2023.02.08.04.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 04:07:57 -0800 (PST)
Date: Wed, 8 Feb 2023 12:07:53 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
	berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 03/16] target/arm/kvm-rme: Initialize realm
Message-ID: <Y+OQmbzYYqo+5HZb@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-4-jean-philippe@linaro.org>
 <5a713862-5bc5-3d2b-e54f-70cf5b484493@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a713862-5bc5-3d2b-e54f-70cf5b484493@linaro.org>
X-TUID: hliGc5wQm8w+

Hi Richard,

Thanks a lot for the review

On Fri, Jan 27, 2023 at 10:37:12AM -1000, Richard Henderson wrote:
> At present I would expect exactly one object class to be present in the
> qemu-system-aarch64 binary that would pass the
> machine_check_confidential_guest_support test done by core code.  But we are
> hoping to move toward a heterogeneous model where e.g. the TYPE_SEV_GUEST
> object might be discoverable within the same executable.

Yes, I'm not sure SEV can be supported on qemu-system-aarch64, but pKVM could
probably coexist with RME as another type of confidential guest support
(https://lwn.net/ml/linux-arm-kernel/20220519134204.5379-1-will@kernel.org/)

Thanks,
Jean
