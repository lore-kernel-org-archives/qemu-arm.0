Received: by 10.25.44.15 with SMTP id s15csp611398lfs;
        Fri, 28 Jul 2017 09:07:56 -0700 (PDT)
X-Received: by 10.55.94.197 with SMTP id s188mr11315103qkb.167.1501258076841;
        Fri, 28 Jul 2017 09:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501258076; cv=none;
        d=google.com; s=arc-20160816;
        b=OaWJnNA3FR/iODE4CFO/Yy3IvvEFIlTTIAmms7wwTRzaNs8PbxvLit+j5c+neB6JQ8
         UHXZFdIQIqenj4vIEIlHSBx2xp4l9C/usbTHPY3VN7v8HovBcx9D49qUuoEl48eCmrIm
         as51SXfFWwTP4ZBwlVjknNgHU4bg3bdfR0Ltv+WvlvIV1XFjDsknhvg6XXB6qpNz4yLd
         Hl0stTTUTWlU5yTGwKPDeeVlBb5g5uWes2MeEKoYMRmNkWPMyNGEJkt02lqTELFIQSRq
         8F43J018ayCX5ELVnZhw8AahebxQY0DsVlKqk51bkAj/VE1Bo4C+dFkfCrJ5tyr10KMH
         HCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=a07zUPYK5OXzBGQIBohOETFNVFHWRWL8EXhUDvcyO6A=;
        b=lg1GfFTVunuwt9IO/P24CoI0qe74RM1ToI2GR/AQnSRIZxaFKorpwQIphjzcProALG
         DxaWy8Y49bQd3Zdu8Tn8zyI1kNHXv7bWAO1rCZsBuUqWhvWxDfKJ+9OCMQjeYokm9j4l
         URYcIPdjn7XqL26rcF/gV3JITn2OdttCRzjC1b/i91jOH1pW6DitQ3eOV+PLq4zpYZBz
         ExMyHFI+PLK9zbd8etZHnpdQsGUCs50T4VQNVjcnjKTy1b8aX6zIGGkoOJ7kKHGUAU0S
         KjUpEvs21kev//6yB9IASN6Ufn+yy11tfGFWEbVNOjM0DYchkDA91TbcegSTbZctCtYp
         7jOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=skZkS4wN;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com. [2607:f8b0:400d:c09::22c])
        by mx.google.com with ESMTPS id y51si14632405qta.110.2017.07.28.09.07.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jul 2017 09:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) client-ip=2607:f8b0:400d:c09::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=skZkS4wN;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x22c.google.com with SMTP id u139so59599741qka.1;
        Fri, 28 Jul 2017 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a07zUPYK5OXzBGQIBohOETFNVFHWRWL8EXhUDvcyO6A=;
        b=skZkS4wNHhf6nk/N4Vm0QzMWj7hJJxnIVaM7vWTpAY2Lqim3++0tdO538DazCBSm6R
         PzlNZEq2Db/e5+KOYtmbr8G/BDDf4t34DVeh0HlVqa3PLfnh8vqmQbot8ZOULYamXx+7
         rp3zW+cKBw3QaQLKeYWI3+EIRFkrJXOp4UpSuEMlueX3W16/W0nABvdcSkZt69zYf0f+
         fQuLVMXuzMRIEDQ11sOdUfwFPHc5F2UoS8CSPacMcDgrLEE3Bswsa7Y9VcJ6f3UOZYH3
         hV+Eq60IGlrqBCNKx+YFu+2wP7SFj6Jy/La6xq1ufM+zkQGE/xo2C+wxLMX2rLuyHhbL
         sbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a07zUPYK5OXzBGQIBohOETFNVFHWRWL8EXhUDvcyO6A=;
        b=lhLZcqunUIJAaEJg+mgbktaJhmqKtYJqF15GW5Ok6KubffwLfJEbSmG2EQ1PLFzHpR
         qBclFcPmNMHqIiO04pis7w1KHG10sCumFpiiiUybiW5HjP+k1l25TlWU8AscGD82tU0f
         eNURotgQeFXgGqXKpecEvUTRBBbAFDbZLl7tA2NJ40cYISC66+6BE0uWvxvsuv2HBJGm
         Q6d5R9zEEmK3qosNG2gzU9FlW3WypdD+30N6k7MQOukwi396BMVMneeuuF+tEwYwgGJN
         DOvUCeRJBCCYnVHTvi3VNzCzTbGav78bt94CnMcCHj8Q2AlYJDNNkzSAh1EC2hFdm6cP
         tMtw==
X-Gm-Message-State: AIVw113lQY0+qxJ+kl7XYErIKC3emr9bHitWWYYVPvfX0yG88y2pLDUK
	mmwkyqRRCpRp3A==
X-Received: by 10.55.180.197 with SMTP id d188mr11107937qkf.181.1501258076142;
        Fri, 28 Jul 2017 09:07:56 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.googlemail.com with ESMTPSA id u67sm15041907qkd.67.2017.07.28.09.07.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jul 2017 09:07:54 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH for 2.11 12/23] target/arm/translate-a64.c: add FP16
 FAGCT to AdvSIMD 3 Same
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-13-alex.bennee@linaro.org>
 <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net>
 <87y3r8d8de.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f69bce67-6458-9a95-3abe-a91564ac46b8@twiddle.net>
Date: Fri, 28 Jul 2017 09:07:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87y3r8d8de.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6NqAexJhLWiL

On 07/28/2017 06:00 AM, Alex Bennée wrote:
>      uint_fast8_t *old_fpst = softfloat_exceptionFlags;
>      softfloat_exceptionFlags = (uint_fast8t *) fpstp;

Better, but not best.  We still need to collect all of the different variables 
that are currently members of float_status, of which this is but one.

For QEMU purposes, I wonder if resetting this to NULL when leaving the 
softfloat helper would be best.


r~
