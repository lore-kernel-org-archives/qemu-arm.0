Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3174301lfg;
        Sun, 28 Feb 2021 18:03:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBAGjrp/js6DeYSiY/eqjEh3nj4ebf4pU7kUIoZYQo4dK9ulXkMKkdej6qrxQLuxKJsNci
X-Received: by 2002:a0c:b912:: with SMTP id u18mr12943970qvf.2.1614564201954;
        Sun, 28 Feb 2021 18:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614564201; cv=none;
        d=google.com; s=arc-20160816;
        b=t0aEF/ef8krwDhu7kpJzRST9PknntTsBGXxXGzwxoICD1F8bsv7UrRtWNNoMGFm77b
         Lbhm0nOHgJ0iCB8Y2K1z53JXaK0cRqTrFOxJ1bJZ55LsLC6WCuQ4/YFL6B+yOh+/BVvA
         MgWfkTZkOj12v2WvtBi2uNT/05wAXH2/RDGsLjY9UEQWJha32vvtUArn6sJOTqPelDEe
         9PxP7iHMtmEZtK2HJ7NtBUvETRVy9DH9z/88fYdvwnRh+6cFCmvBZ4fD1/O+y99Tytga
         WTzdF+S+1dNgwQI4wolsYUw/yb4k764awSf5UzX0/t/luBHJS8oyhjJAQ+jmm76sKEtM
         cQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=hexTB5OR+wTXUXUIChdvVYmX7gCa6GzrwLbfLjCWreA=;
        b=U3Gu9kHYF7RJ4FULKzOxfIiN8FOUfxVmTWqDFMfQxBxf6j6r94u2EaJKlmV8AQzCrF
         mcGqxXuKVAw4eaJZb91wOJ5D1nzrea1TuSknWs8pCf+OneggmqrKH4x72f6How0BAb6C
         8u7KwSxAMVde90xWSFPkAaI9Z82aKS5zuBpiUyO2yD+pE0/GzUfgtMlxzOxqzLW48ZQT
         qQo48Edytf7ibiAZLQO5Crz9ONC3YVzMjPBMGX16ASxh+ud7+tXeZoIBUg4VwWdZMoWL
         vWneomDyUv4hV7Kma9t4lUvUJeg3/YRT4e9lE1f/ETvfS4x5M4NSzJzVptYBOJoeICk7
         GNuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhiVsCLN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si7937236qko.189.2021.02.28.18.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 18:03:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhiVsCLN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGXu5-00063b-AL
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 21:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGXtv-000621-Pa
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:03:11 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGXtu-000130-8N
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:03:11 -0500
Received: by mail-pl1-x634.google.com with SMTP id z11so1223896plg.10
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 18:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hexTB5OR+wTXUXUIChdvVYmX7gCa6GzrwLbfLjCWreA=;
 b=fhiVsCLNVd8tYux1GrWpOFFOadgOM4lFbChp5hjf2jH1ZbGuja9o7H+ZLG2FwzB+bF
 oHw5JcyaCBTzLnm3UXCuPZFgmom4JgnnVx+ssrNk/fitnZEoecqQ1Nnz5TNhnj/FcUkp
 v8M15shDAiDRI5tIpKoAZ132NUgjwNrd4KAJFxDWSyt2g4pHcxr/oZDE0VNO3FJOSAmx
 8zAFi1PCzEUJ0BF1n4S7rvE7HGtqLpKXJ/SnJqqx62hpARrwYgALo5q5OkwG8FTQS3Un
 0WTEpOav3s3jNWEFQvbnO9BUj5CYTs4p5iFHvf3o9j/VaOXRY6Av8rCf/JLVwI+5xfBd
 8zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hexTB5OR+wTXUXUIChdvVYmX7gCa6GzrwLbfLjCWreA=;
 b=TGMsixdxRX12Dd1Di5G51VZxgpFWCbSBOgDAVGEoVmISjOxKQ0f5IyVmSWA1CrRzld
 S23sjkd8H4xPJDnQAoLuukrf9eYCUPzmTOObshP96KZNpKOx9ZsyCJc7wFCQxhLoddej
 +uMTgAxpOHcWVh80RX5FQMwQe6KIvol62WKdDks4u61obm9ZL/8p1VavTId4cmOPmRBq
 qNJ3rdwkXYm8SQ5XETvsJijHXXfOaWy/AxPIHfuhvlPzU3+dQRqfO1tIMFv+s0SUl7ID
 UiqcCjQEUi75z8fXwKmZWvFGYcQCeG4jgkMtDKWX6ihTsg19Zm0OQZGb1ztWQFfQBk32
 kR1Q==
X-Gm-Message-State: AOAM533Sm1Uac900mhGsuTePL0AiA7d8oTOfU4yGVEvVBnusydF3Hd4A
 +5zHGOa+Eydu3LNw3plv0/uz2Jk/68fD7A==
X-Received: by 2002:a17:90a:8c08:: with SMTP id
 a8mr14252744pjo.136.1614564188439; 
 Sun, 28 Feb 2021 18:03:08 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id m10sm14793449pjn.33.2021.02.28.18.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:03:08 -0800 (PST)
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210220212903.20944-1-richard.henderson@linaro.org>
Message-ID: <d9ff1133-b275-9194-3fb1-7fa48e4f2938@linaro.org>
Date: Sun, 28 Feb 2021 18:03:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aPQ9ZYUyWCOZ

Ping.

On 2/20/21 1:29 PM, Richard Henderson wrote:
> I guess it has been a while since I've run aa32 risu on aa64 host.
> 
> The launchpad bug is something that should have been seen from the
> beginning, but the similar aa64 operations are expanded as integer
> code, not vector code.  The aa32 neon code has only recently been
> converted to use gvecs.
> 
> The cmle0 (zero) bug has been exposed by the recent constant
> propagation improvements; previously we saw a reg/reg compare.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    tcg/aarch64: Fix I3617_CMLE0
>    tcg/aarch64: Fix generation of "scalar" vector operations
> 
>   tcg/aarch64/tcg-target.c.inc | 213 ++++++++++++++++++++++++++++++-----
>   1 file changed, 182 insertions(+), 31 deletions(-)
> 

