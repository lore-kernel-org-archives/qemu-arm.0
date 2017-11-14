Received: by 10.223.150.237 with SMTP id u100csp3352240wrb;
        Tue, 14 Nov 2017 00:38:24 -0800 (PST)
X-Received: by 10.223.151.197 with SMTP id t5mr8600723wrb.263.1510648704531;
        Tue, 14 Nov 2017 00:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510648704; cv=none;
        d=google.com; s=arc-20160816;
        b=g18pTo4M9AkuzrQ1UeHgwzV7eMKKAV++EtiduUR9KfiguHOvpBxRAaixj1cUUYudlj
         uYsfL+RT/GgdKZrFJD/bgFqlFnRheUR0TcJi6KT60o3UWyrvJhInkrAIMeOtyosdSz0x
         8orVgY08vtmDqhlquz9+sb99HKJiRMIXrf0KMfutP1H4UuXvj1GKrr1Ne1G6KPSYxIJG
         VgHNgLpStYC6YGI+vS2pbI+nbOAdYxXx4+vt45SBixLLWyJIZ7x3RRWHOjtp4EVCei0x
         vYYZkorvkxRLajRGo6Pyfo1pgBFW8XX1nTdxGqBPHjUfoO4DFu8YtT6K7JbNbCK1wWH1
         FBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=OYnFHA96C6+u6EzuFk6aoWvGSwwb07jxFaSdVax1haM=;
        b=nqk0aTZB7toIjNsAVROp0ZfdGdfXRcIOZilZPEJ+eA7JvmJa1y4NL5tfJy3wxU4wEv
         bfqIC55LADFbPaY/RuPw+yyd40OFFh/NwRVkQKeF4nSPsP2kFlEi/t/9C4yptiCurR0c
         NS+RR4XmcEdDvF8+34moMPYL60/6lyBDjAVDYXZA52OaUZ2zYZ5rQB9OGkBlack23QR9
         6xM5dPqBcoZ+57d2DskzIr5fvR/81BVxC1BuJzTK7DE3eVYMMAJyxWW19kP2TLRZrTIQ
         aaFfiy1LiQ9gLd8Z3w0RVlt+Qd0j+upbqy4GBhjmbpltPLVeNMBbDK3/SIfGiGYqwsip
         Jidw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OvfL/eRg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d63sor2485920wmd.62.2017.11.14.00.38.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2017 00:38:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OvfL/eRg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OYnFHA96C6+u6EzuFk6aoWvGSwwb07jxFaSdVax1haM=;
        b=OvfL/eRgu0O5QVq7QqEvWRR8OrYHFn3ToNoUBU2msT3faDr+oeTOG6ZplAnvmeX53/
         Yz2l7UdLQkLZXbYiAQfkpeMe4U6KPP7H0KZ1yTyi1JdMECbUpo8yBj30i2dU1U9ADuzl
         BPyUykhbbYdv9ltpb8KP+rlEJGonfyDJer4ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OYnFHA96C6+u6EzuFk6aoWvGSwwb07jxFaSdVax1haM=;
        b=WirUOZg/khJyDo0sG86qAk8eWjoiiNy49hv+dR/HR6PbPRRxQ/b5Z8xKDdcXd6UHf7
         9pL843Oh8OPxAp0/b3sY/akaxbhwjrEgCtONicKADhUlX5QAf5rjWGopQ06HNFDd+8Q9
         vu7JeWe0hD2p3sZ4AHmaQKpVbPwm1dtdhlSxUzLfgOdeqIZA0Gyx6aQ1bBwLzhtJ0bp8
         nX5xXDttOn8RCOZ9krG/6Oo/CZCYTEqcMa4S6vtN8o3zsOwZluj8rxUqIqb8kSb8GPgs
         gC/jo0+e+10fioBWL8CGxhiM/TOn18iOPLfBbvSkN2PSpDhTU2D9i5pVGkba8xJn36NR
         s7ng==
X-Gm-Message-State: AJaThX4XYD56RkQMohRTxsJ1TTHv5htyMviB9nDFdLjGc37DtMmfggMq
	RzI/HMKXBX4I+ZUveoikqa8UVs43r0lKBQ==
X-Google-Smtp-Source: AGs4zMY4c3o7mTw4Y/tvdlwFPUrfBr+goykGy979RAdhC77m7cd4k/7aEnDs8hx5gZPK/g32VeoFOA==
X-Received: by 10.28.230.25 with SMTP id d25mr8016586wmh.148.1510648704172;
        Tue, 14 Nov 2017 00:38:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (176.red-213-99-135.dynamicip.rima-tde.net. [213.99.135.176])
        by smtp.gmail.com with ESMTPSA id y84sm4815107wmg.39.2017.11.14.00.38.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Nov 2017 00:38:23 -0800 (PST)
Subject: Re: [Qemu-arm] [PATCH v1 01/12] HACK: use objdump disas
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171004184325.24157-1-richard.henderson@linaro.org>
 <20171004184325.24157-2-richard.henderson@linaro.org>
 <87ineetnux.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45ba6528-e1ca-071a-32bb-6e1b0f86d18f@linaro.org>
Date: Tue, 14 Nov 2017 09:38:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <87ineetnux.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GiCf2hM0suhW

On 11/13/2017 12:33 PM, Alex Bennée wrote:
>> -    if (s.info.print_insn == NULL) {
>> +    if (1 || s.info.print_insn == NULL) {
>>          s.info.print_insn = print_insn_od_target;
>>      }
> 
> Because? Is this being droppped now for capstone?

Heh.  Since you mention it, capstone can't handle ARMv8.x, x > 0 either.  This
was so that I could pass the data through binutils master, which does support v8.3.

Obviously it won't go in, but...


r~
