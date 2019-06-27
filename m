Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1173888wru;
        Thu, 27 Jun 2019 04:26:08 -0700 (PDT)
X-Received: by 2002:adf:cc92:: with SMTP id p18mr2843661wrj.260.1561634768739;
        Thu, 27 Jun 2019 04:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561634768; cv=none;
        d=google.com; s=arc-20160816;
        b=wy1gNEVpxX8yiMecsDiRpY1uXfIj+tY+Q5oxlLEz4jRLc8ABR082LyWUyRgLJOdGbZ
         zCjtjGrK3WbstuVkTkrEhv58Xv0QP5C6VyepCZQXN+SikpdEtkhaIkIJdwQYI1oqXaRk
         P+dYPVXacX6U58gBnQZIiBqXbFvHZ3p/KZRSHbEmu1T9QJrsHcwPgF1dRiC7Yv2PnWQ7
         /qQn2zNMChJjGhoNWnom4SufHktXtxq1OZjKPn2Maz8fTCNZO8NxXM1mUe/AfOqgbAAS
         q3RocztTYJVPBFwBNgH8Ww0M6mq1ti0sZnSLB86iTcE9s6RNt9FmkkevjVcrtIJ/MoBB
         uBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=4RkMmGKQKjowWesS7S0Mr0HIQPeKOUmICFDQ7aVky7A=;
        b=pKvdkp8fFZYfvF5lQuE8P4IMZIPhvVmVX6PQZSn80L0kqMHBsDYOXKyAGUiVVeyMei
         uZL08kt7c2ZyCXS0riRO0a+4F7dR3SFaqkUazHq6dtpm7sUJPBhU9cl4L9mCoO1KF98O
         LIhBvkeqr44XDfPrixcTnU3f1ChWrrcACrmWZ6fXSVTCMDPb3/GSrAYunl9s6mTytglh
         a7FnsQ9ojaSeU8HCsXEnABAs0ZLE/ZFSDTQP4UHZBk0iK9eiNLKMOjemwxpht4hPNSeL
         ULSl6C+ue0aAIvwzYUYgKN1uWTzm3EimM1PTB+x7h8jvwqo3U1oDB+NnS2gd9nAqBgb1
         vGtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xj2E+4v8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w2sor1523378wra.36.2019.06.27.04.26.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2019 04:26:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xj2E+4v8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4RkMmGKQKjowWesS7S0Mr0HIQPeKOUmICFDQ7aVky7A=;
        b=xj2E+4v8t21FnhalvEERtadOJQgsl8MKmfnu1cF9OgE+E6I1BLvHr/W65X3JZGtt3R
         K+9B+4EDu3HYCbviusn3FvNF8L50T7YZDnpxzDzxGCnxF08/Pd9Yov5qBezTxprish6G
         Km+A+tVFz5a80Gipl7vqMTV1to2QdyD4V4aSWFkadsJCXOE7UmAytJfL2QJrE5KpDpvy
         IWzQ1/NtzwWK0xqqv2vaphcm7EPvQXkfndyZWbgd2fys1VvLORFeBbvsxlx9LX3hVavM
         6qmOBJ+Xaxi3bdnmO/pSI5kOfpI3E0228jcs/oZrROe8VKV1TNJZ9K0amukuiKgJkNEq
         siGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4RkMmGKQKjowWesS7S0Mr0HIQPeKOUmICFDQ7aVky7A=;
        b=PtHsRoHMt7kBl7/Mrp/xDg38cl1W8wuiqWSSExgF0Z7coOPuK3HrWvbvMOo7EwymIL
         T41Q7whzhoPN68BopQq7nGpMJ1RU2PopksWsCM2zy30gggBIZ0auFY8/z8aHIlg3hGkV
         RWUFHW047DKs98oPwj97fv+Ua+rr3/3leoyBxfTMPCNMl13fn3+Qw6KkTUPPDecA6HTF
         WGj4mlSXrrVsj2QpJwVCYj6sCNX3PxDdcZCIyLnrpqdHwjCjkKmyBmaq6nLBMla+pgzq
         WLaqd/6RC6i4hDPVPsgoymgnGcgpH8l8ur2Z7c+IlfkqonSkrKkU8Q4qiCAg95Wf+Y1f
         kr7w==
X-Gm-Message-State: APjAAAX744s+V4ZdcFYWxQ3egkRaBZPpyC5LASm2Dp3AMCx0vMR9byzh
	HeBqdLB1yKmE5cB9K6VIx9TTRI3R
X-Google-Smtp-Source: APXvYqwIYLbZetqyxTG6VJd75yzRjv3mfCdVMMqeLKUKiXueUKyUshNHaA2dA0sYywJt5U2PbDvbPw==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr2897586wrq.143.1561634768442;
        Thu, 27 Jun 2019 04:26:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id z126sm7569242wmb.32.2019.06.27.04.26.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 04:26:07 -0700 (PDT)
Subject: Re: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
To: Dave Martin <Dave.Martin@arm.com>
Cc: Andrew Jones <drjones@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
 <20190627105911.GD2790@e103592.cambridge.arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3e935f36-1065-b82e-86e0-f3e4cd11f95e@linaro.org>
Date: Thu, 27 Jun 2019 13:26:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627105911.GD2790@e103592.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: ooQP0oAzT4gD

On 6/27/19 12:59 PM, Dave Martin wrote:
>> It's a shame that these slices exist at all.  It seems like the kernel could
>> use the negotiated max sve size to grab the data all at once.
> 
> The aim here was to be forwards compatible while fitting within the
> existing ABI.
> 
> The ABI doesn't allow variable-sized registers, and if the vq can
> someday grow above 16 then the individual registers could become pretty
> big.

The ABI doesn't appear to have fixed sized data blocks.  Since that's the case,
it didn't seem to me that variable sized blocks was so different, given that
the actual size is constrained by the hardware on which we're running.

And if VQ does grow large, then do we really want oodles of syscalls in order
to transfer the data for each register?  With the 9 bits reserved for this
field, we could require a maximum of 1024 syscalls to transfer the whole
register set.

> It's for QEMU to choose, but does it actually matter what byteorder you
> store a Z-reg or P-reg in?  Maybe the byteswap isn't really needed.

I think the only sensible order for the kernel is that in which LDR/STR itself
saves the data.  Which is a byte stream.

Within QEMU, it has so far made sense to keep the data in 64-bit hunks in
host-endian order.  That's how the AdvSIMD code was written originally, and it
turned out to be easy enough to continue that for SVE.

Which does mean that if we want to pass data to the kernel as the
aforementioned byte stream that a big-endian host does need to bswap the data
in 64-bit hunks.

> I don't know how this works when migrating from a little-endian to a
> big-endian host or vice-versa (or if that is even supported...)

The data is stored canonically within the vmsave, so such migrations are
supposed to work.


r~
