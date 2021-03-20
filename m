Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2412775lfg;
        Sat, 20 Mar 2021 15:34:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdYqhU0dhzgnqWsv4CxQFdJDeeS4WYhPWfVEZ7BHIx817fKM0HvJazgSSK3S25Mx8FCTq7
X-Received: by 2002:a25:ad57:: with SMTP id l23mr14507401ybe.172.1616279663483;
        Sat, 20 Mar 2021 15:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616279663; cv=none;
        d=google.com; s=arc-20160816;
        b=gzB/vmLCg29dVXAwiCLPJcsOsiJhR9eo6UjjM5iDWQBXHAm6JchjE1TbrZAlIXcBqb
         Uea02EwjSk+Hyjq5NSXgX8SmnlbokFhMbJBCWHloMDdOREmzlbqr74GfaTusjrLfnwxY
         3jsgwmUE+5+ySn7nMvlh4PgcTp7NEVVZ0FQBhoQM/qpdcDQRXvn7GcSXVtebMGTdfb5f
         L8izTP0xbE+kjge41M+/9OojKQ+FfwKBM9FLCjqeXX63A+RlyVFWDh5itjy+zLXw/7CU
         lH55wk/3t9whUVsXHMrLA7fJ4s4+9mA3Fo2b+wGOJFgBZwF+YhMT6KTJdWxePdgggiLh
         WpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1UxKis0LVyGsYkzLfjdp1IYD4jd9L2RM7ZQeouyzT4o=;
        b=gUr4sjq6hb+AJylTn5WuLFOkkIPMPgNgudFvFRpah+jLBw6BjG4E/XySF1bs5X4gr/
         fya49mzk8dVXFBWcxyYRkBNitpfGlmoCWusodue2HUolW1ktnrhGFZ5BvKEj+KjouuC0
         1Bzt6HOdE1h4iTO90dM/KAGwzaVwQe2Gbp++PzSKCjWLW/tCYHSFuhKm/aosVoUy6bFM
         SQxypkIJhzKz7ink5q7igrVCG/CQIldqEFoiC+jmXgZsmzvdsJ8r/2FBEQK84eSVyxt8
         TeGfK1TZL632Dhdy4P7wX42Qr/nBgmlPSRDHhxzOurxfFkS+gcjsrIkEoyWnPIGZAgDw
         N7hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Egxb+jV6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si8336866ybp.489.2021.03.20.15.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Mar 2021 15:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Egxb+jV6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNkAo-0004WO-Ny
	for alex.bennee@linaro.org; Sat, 20 Mar 2021 18:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNkAV-0004Jx-4G
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 18:34:03 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:34733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNkAT-00060U-LM
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 18:34:02 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so12130386otn.1
 for <qemu-arm@nongnu.org>; Sat, 20 Mar 2021 15:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1UxKis0LVyGsYkzLfjdp1IYD4jd9L2RM7ZQeouyzT4o=;
 b=Egxb+jV6YhtlwnCBbVGxYuMsm0N/zOL/jQRHIwVXS4ap6+ZR1SM+yGRMehB8QTJZMZ
 8vuUl39MIvS/HZy3tzRLLqREVloqDsSFdgP0z3qhyQzj/rouk/90fSxkQwvNjDr66XSf
 ul0k27+pmFbEAOt7CY1oG6H5iwfrulDyIwIMyaDhCPKwVOUmAmE3kXRyNf3O0VQ+1OfG
 0Ij1H9i4iKcwkledkRKTPh5DJtSEbkCIef+Rwv7ab3UYb/F9j69t37q0fSxs6NvwAFJE
 rRQ/SSbRKM8TBmWldGKJ2baU56vO2MEvDFGW7PXbT19se4fLKN3e65nsu0rrjiKO00Vp
 Nl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1UxKis0LVyGsYkzLfjdp1IYD4jd9L2RM7ZQeouyzT4o=;
 b=gjLSdCv8guRl/BnOwVkzvwnj1DqyYyFavUwuEyuFNxKmrF1xm4C7uGhhqAmG9tLDvm
 GCUL2Vq9GzqQrSZ5xgbkdrlPsabtj9PQJb3SLPw1dZga+UJkQ6SDa99vdzLtLxDoXMsz
 wKUlHtJKOarPYkRhUNMH7LejxkFM5WGkpvP041NUF6kBDOOWK2APEgLyQ6lGarY2y+93
 0zBuVrvS4Y21UlfXVemWUn1RoAM67wezpO+GhbtIZJHDz372GnH2q7qFFTPp5jiAlWDe
 9bAX/BV4+TpsuGyJ+vAjxvgbXKbfKF+Y7EKfLjv08sMw0clNISUuRx/ft2t5NV7B0ifa
 1Nwg==
X-Gm-Message-State: AOAM531zXtVlxztzzhIQIX6+exsW5hpZZIUf+S1U9rBge2+/GkjK/i31
 Hd+WlsdbzSGOJ/0fD69eE6Glmw==
X-Received: by 2002:a05:6830:908:: with SMTP id
 v8mr6399637ott.217.1616279639793; 
 Sat, 20 Mar 2021 15:33:59 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2113698ooj.26.2021.03.20.15.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 15:33:59 -0700 (PDT)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
Date: Sat, 20 Mar 2021 16:33:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com, laurent@vivier.eu,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V7lEyQAuV6V9

On 3/20/21 11:52 AM, Paolo Bonzini wrote:
>> +int main(void)
>> +{
>> +    return read_y();
>> +}
> 
> I think this should be "read_y() == 1 ? 0 : 1".

As a testcase returning 0 on success, yes.

> I can reproduce it with -flto -O2 but not without -flto, do you agree?

Agreed.  Replicated with a random recent gcc 11 snapshot.
This is really annoying of lto.  It's clear something needs to change though.

> Perhaps we can obtain the same optimization by wrapping reads of the page size 
> in an inline __attribute__((const)) function.  Richard, what do you think?

I'll give it a shot and see what happens.


r~
