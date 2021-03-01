Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3629341lfg;
        Mon, 1 Mar 2021 06:43:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyQB7IoobqyhEhNOZCvCT1yqIIxtqM5muh2xlRDokEfsN7adV+JWKo712M0cfyN9nBTR85
X-Received: by 2002:a6b:fc16:: with SMTP id r22mr13388002ioh.102.1614609793446;
        Mon, 01 Mar 2021 06:43:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614609793; cv=none;
        d=google.com; s=arc-20160816;
        b=iNBdaBaQN8zsyurXh6m2SBf4Ncr70EOTgnKZIorW3micKnu4rZTFInEGon3WXFq7O+
         mfwwVfJVt6KqTzCU5eOekZhVpgnmdhPkz2zmglU8PWNXDTyxDcdKwVr8zgmr0/o7aFCZ
         m4qVpuMYxTc6Tg7HK84JczNN+3TNJ9QFV6Y4/EcDNdPqIINgW8p1Z7Ge6FN8AuUOo4X8
         CebE0wlVMMFNDejpaibhAcdXVX+8sicJpMJDNLesRyyUOtdIs3PP4mzDPSlFC6UD76DH
         B9QVdGbFxGqdq7Ec6ftyMdw8Y9lcYPc9+U1Nej4xTgXGJrjw/I5CKepdku4t9Gw3lSf2
         xqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=muYCTXVdLJ6CbfyyOAOGWFWB2m/EafH9clXz8BJBxvY=;
        b=kygmVYfrc+YkEYuT85N48J9hGSKi/NJRx3q3ospSj6lI4Ry6nQl72qy3c206ukJJq7
         HOWoatShK6CIVpNKuXl8F4BAv9HosBdxsjOcoFtDAx4/hOVIkRq01NT4GmJvNmRB0udn
         u2V7NUNJOeor5XXaBSugbCOQ3OfvSU+pdeyspT8u+sfR4om91ZuQKkI7XqeeHLeTPOnE
         y2AdzytWpTNExEV9fNZWRkXnyUxoTzHjy6NxZEDFEZxgVhRaI8LVZBXdEbGSw+Ixl+dG
         T5OC3qhUyx1kx1lAKQZvb+kO6PmpObZVEQ+365o9QuYJMdKC838z8bjQyN8ZwTGXa8QQ
         QCQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=ov9RD5WP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si14450666ilg.102.2021.03.01.06.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 06:43:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=ov9RD5WP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGjlQ-0004F6-OV
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 09:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lGjkz-0004Do-No
 for qemu-arm@nongnu.org; Mon, 01 Mar 2021 09:42:47 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:44417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lGjkx-0004oF-Ap
 for qemu-arm@nongnu.org; Mon, 01 Mar 2021 09:42:45 -0500
Received: by mail-ot1-x332.google.com with SMTP id f33so16618509otf.11
 for <qemu-arm@nongnu.org>; Mon, 01 Mar 2021 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=muYCTXVdLJ6CbfyyOAOGWFWB2m/EafH9clXz8BJBxvY=;
 b=ov9RD5WPNtRFSg7k8BznDiqgNLG/gB8d2myEgf/f/Vm9fNUtIXT834nTTKKCHkpzoz
 mDH3s66jZX+w3N2QtAw3rXIAE9ICBV81lwfMFX+ZdoRd1y62Sqmpmlp075B8iC9lodsh
 kNez8JucdHO9jynH5liKiACpj1IiJq5FqmBZ82PeIZML7h5/RTdjWqkDB0NQXU5lvA+H
 40lyaincyJKK+AbowKHrnk/zlMo/tGZBpKsyMJTydZ2zJ5doL30BkxBEORdIVg3Nn7Ur
 gYjpsCMG7XiYw0wgqmVUp0bIZnWZUEs5GhgsNYDfgT+G4soZfmNRw38dDM3h9SHvknxb
 Trfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=muYCTXVdLJ6CbfyyOAOGWFWB2m/EafH9clXz8BJBxvY=;
 b=TVFoX4VBWKYQE9r9haYqbLx5B2WwZayfNDgcPomhyAgsBI3C3dSv1Wvvcy4qBvjm3R
 GGn6DV5QWxnNull3wC0rz4dwz0jawa40HjZxtXTNMOV0D8qOPp1B1CZCJDI0k1l8oNcy
 PxtJmRwIZUMDYTi+YZ1CdgSUIBodETvN3SJEifnkx2+wIzEC0JB4BeAwPapRmhUhldbh
 3P0JlNjPmlRcbL8b7V8+b/11AbV1sl8OeuuSVSX/fLvd6NXMrX7gfJSW7rLT1UTKsm+P
 LWC3gYZH3Q87iScUdcJc54kerluOKIAnfYhL0kcplRPwY9TNhBjFJiRs01FxquoNpi+X
 My1g==
X-Gm-Message-State: AOAM533OKmOZ4cl9PXTgX6A1WOfWinuv7o8tO/zo4r+/j9fxmHpQ1DLj
 xWo+LKSU0/Y5UyMLnQBD1JNRGw==
X-Received: by 2002:a05:6830:4d3:: with SMTP id
 s19mr13681317otd.355.1614609760914; 
 Mon, 01 Mar 2021 06:42:40 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d26sm2320314oos.32.2021.03.01.06.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 06:42:40 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
 <20210216224543.16142-2-rebecca@nuviainc.com>
 <7ad3acde-1f9b-13d5-7600-000400fe0c38@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <3763284c-e68b-d7c6-511a-65104a5f48cf@nuviainc.com>
Date: Mon, 1 Mar 2021 07:42:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7ad3acde-1f9b-13d5-7600-000400fe0c38@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LX9twU5TUNu3

On 2/16/21 8:45 PM, Richard Henderson wrote:
> On 2/16/21 2:45 PM, Rebecca Cran wrote:
>> Add support for FEAT_SSBS. SSBS (Speculative Store Bypass Safe) is an
>> optional feature in ARMv8.0, and mandatory in ARMv8.5.
>>
>> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
>> ---
>>   target/arm/cpu.h           | 15 +++++++-
>>   target/arm/helper.c        | 37 ++++++++++++++++++++
>>   target/arm/internals.h     |  6 ++++
>>   target/arm/translate-a64.c | 12 +++++++
>>   4 files changed, 69 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

I think this was the last remaining patch in the series that needed 
approved?
I just want to check I haven't missed anything because I haven't seen it 
go into the tree yet.

-- 
Rebecca Cran
