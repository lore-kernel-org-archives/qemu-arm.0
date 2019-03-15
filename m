Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp2394565wro;
        Fri, 15 Mar 2019 12:35:06 -0700 (PDT)
X-Received: by 2002:a62:4290:: with SMTP id h16mr5810042pfd.8.1552678505869;
        Fri, 15 Mar 2019 12:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552678505; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEXGoKCsB1B9QAaWwhfgi/okgvP23FoqWx//7wpGVSZOLv2NTbqypnZdDg3lnBi6jR
         3L+vrv06rR7P5DKYw4Ao1ZHsQ1bHZPBs66yWCzemIXOu8oUWtHCgEFEntv4SmvAnZV3n
         v/KiHWpCYrgEqQvAtMyxbfayWHbGPoRYWAcrAGUR4Om7wfs8Y4H5Xx84pwmsv0uNxfeh
         epKrbIUTdUoh9bNNG3tNKWOZyxNe7LdslZPhLg1BhakwZ+nK+UhVM8vBz8oFkbUC0l3J
         u88PFLwL1yEB2fUe3AfGzd/tGpwYwaWEhkuX+cxJXSoc7MctjIQjFtDk2SaH2ZxkmDOX
         Ep9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=D5YwDqrR5NSoNlONAFxHtu5tpH7S1ap4wNM+7ZujXJM=;
        b=xyik1CqBUMU7h0EanTYvrzYMFNjwkAFIoV6dpT1Mv7aSFys9te3A3wBQqzT2Ry7TzG
         c/HD8ECS78rzknesE1ie6oUHvDAmzEq/KtNpzrlR4ZZDO1FbcFo4equTCSdvlYxCgeM7
         jcOJwNq4UyiLXhCJ7kn8nvrMVPLjGMjb26imIHaRQCuV7NE9mYLheygGDMvG0j+tclrH
         qWkmB/VAbXrPzBRq7NSu86YMpqOU7QxctGawMaugrFUvKjgNy9iu5JjkrtLJCeH+ZlFf
         EIMjoJX+o3JJBKTuF4sEN1k92iPoJ98Bt78FruEjvKC9tUWu1JQqqKO1t28hxD8Oz07h
         qZ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tkFl0Mqb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d17sor4432325pll.50.2019.03.15.12.35.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2019 12:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tkFl0Mqb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D5YwDqrR5NSoNlONAFxHtu5tpH7S1ap4wNM+7ZujXJM=;
        b=tkFl0Mqbj51afHevdZBD2q5Z5b3iFu9MhPJ0dqjLy+Sr4RbBZw1iKwoeEIqNhzz361
         IM1G8vHqFLZKj2NB3aBnYrLABKE9vRgS5pvrk7V/HZJ8f2QYasclHoNu2QkCzK2PNmu0
         Ant/7+x7QXsPTsMSBZIg5DJFpViKn3+TYDDzrHa9YolDQeMwK5wKwXtgDpa1osFtfZ/P
         bCDXKjW3Bo0a1Dj6WBFoktTniMlqZoIKRMXqQkNgMZiXz+FIupRWhHUz70I+DqW5XDkL
         Z13pEeEeK/13wPqVwBO/8+9RwnN4Vfj32tivkw59jJMwItUMXqEuk/fgVPLYd1ydQdLg
         P4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D5YwDqrR5NSoNlONAFxHtu5tpH7S1ap4wNM+7ZujXJM=;
        b=AnW713+tphS+gtaZCzQnB5bb4sW0VJi1KyTX/C54Jq7gbF5qZ4Itcv1YsKL6cKwV/D
         S0rJ7LN0O/Rw3/G/T27hZSSsl8JXb8R7+LUgz6B4mtpuMIl2ZycN2lapuhGpobITCdln
         H/nnduWGGdzZaofvsRhMrDY/UJIeAJk4H1ZMQQylltxZ3eXjKPmYC4rYRDcwu6Z5lJbX
         f1DwqYHwAm+xGSEbukE61Iz1g2YQ8JHvVbBcYj765FnL0CUPbdTnM0UYRFTLj23MBtB5
         tEhhej5acNcEGLe9HCExpPMvu3A3CakvLgUdwQ+qf21UC2BESdBp16kufCcDxhpeWc9V
         Jxhg==
X-Gm-Message-State: APjAAAXeJlkJSbDArlPrO0H+3BXeNOg6V9sZ/eL9/qtZ3NanaIqwY21e
	pgyAjjv6skU9ob8sveBp5f9/VyE5
X-Google-Smtp-Source: APXvYqwuTEskv4/Dp9+vscjbZSoRDcq8PthPk4a0z45jfQjxO+GUexfiPkXyhIn5/Zb9Th6/JXWiRA==
X-Received: by 2002:a17:902:846:: with SMTP id 64mr5919600plk.266.1552678505297;
        Fri, 15 Mar 2019 12:35:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net. [97.113.188.82])
        by smtp.gmail.com with ESMTPSA id b8sm3722705pgq.33.2019.03.15.12.35.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Mar 2019 12:35:04 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH for-4.0?] arm: Allow system registers for KVM
 guests to be changed by QEMU code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Dongjiu Geng
 <gengdongjiu@huawei.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
References: <20190315143057.20165-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e73b7c2c-ab2b-7a43-c801-b607bb65e604@linaro.org>
Date: Fri, 15 Mar 2019 12:35:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190315143057.20165-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: EN4uP8ssAzS4

On 3/15/19 7:30 AM, Peter Maydell wrote:
> This commit is the same as commit 823e1b3818f9b10b824ddc which we
> had to revert in commit 942f99c825fc94c8b1a4, except that the bug
> which was preventing EDK2 guest firmware running has been fixed:
> kvm_arm_reset_vcpu() now calls write_list_to_cpustate().

Interesting.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> Should we try to put this in for rc1? Not sure... Testing
> definitely appreciated.

Probably should try.
I'll work on that testing next week.


r~
