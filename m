Received: by 10.25.0.23 with SMTP id 23csp142470lfa;
        Tue, 13 Jun 2017 21:48:20 -0700 (PDT)
X-Received: by 10.55.141.67 with SMTP id p64mr4626631qkd.164.1497415700757;
        Tue, 13 Jun 2017 21:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497415700; cv=none;
        d=google.com; s=arc-20160816;
        b=JkLhSQlW08+hBDmNJZNOvEIwOPfyvCPpTguiSNoE5rXQvprvO7KN8A4Ww8yN9MqtAw
         dkqEZAd/B+eJg8P8jgPWB2jejNtIrb9DqaYnl4+ziWCLPu8pK556E9+eZYEB2tfA7kiV
         biIM34A/nNRXtEZe0SuWieKEWUtSs0o8OZIv20OnhbMPONBrU4shVd0fdCHZD9Py/cp3
         51Lz8+e1dLDtXhs/vRMvEf6fXadkWk8wo5fwHNzsi1jmvmSHM6PKf3tzzobPjpwmb7lq
         J1d93pUaHrHSlFJBvlNCpKh5W4V3ula+5x72dk4Xq+Z4HzhvqLXlzadbnxwIlOQlxIxs
         pAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=eXUHdi927/3/Qek9LVWpyy9Lkz3QBFmuCVQjh30RcCw=;
        b=QHAUb1ph3ala7RWPBikKlCDGkPZD2+fVdIEMr52WfSUUAfjTopfa4auiQestQGQKVu
         EuGWSWmdsVU2+EWZYDAhaKbHXO9w446f85I3oT7VC1PWkUbcyLhTWWBfbxVcSvxAheW/
         sNyzLhYAVC2naKPoqA/9VR+Ie1/e3oZcWeRM7RZLWuOJfQkcdEJGVFf/l1m2/IdERYb+
         TyNJmvuqwdFemL8H+zY78rMwrttZpajJk+fx7K4PrBrGPaawKOAfKjnEdVEbDDtsg1zk
         86fCyEOQFcVzp+Z/cJhadursxPkbzD2uuV5mIgjtPjo0it3pjTk5SlDNy+CvTk0S1Q7V
         yC9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id t31si2125428qtg.95.2017.06.13.21.48.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jun 2017 21:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id j126so4748754qkj.2;
        Tue, 13 Jun 2017 21:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eXUHdi927/3/Qek9LVWpyy9Lkz3QBFmuCVQjh30RcCw=;
        b=oYuBG5Ex66au61rbVqU9PJcX0Fp/0klG7ibPW6aTicpyzlkcKlAN0yVD543mXKoAC2
         iKMJLtOZ3u64bggGtd9MAMD28Q+9jzFUTQVCBqa1wwXNP2nPfLXRdKlXQJx0s8Tgpj+O
         brrnP7uxQAMfJeCd1T6MbF9ZLoc8tzMdvZuw0nPbfM/RAf5Orqm+DSBOrqtojJvH7xgD
         obxYoaiGHNMfJBAF6oAwpHeKWG4wzHX/YIx7w6+vdSkAzR0WximmkKIuww34PZvu7k9A
         MeaWYFVlnVjb7HVde49PC3alRsFmAIiLQCfg1y8rJJjh9BhImMiIz34sJpOPWIRwJ+QS
         VdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eXUHdi927/3/Qek9LVWpyy9Lkz3QBFmuCVQjh30RcCw=;
        b=QNx12YMS+5cHTkzC/WEzS6Anbd8OKD5qGxh+ryhQgxnyw/90lDknmqtZ9n86GoXWBM
         mB3KVn2wSv0uQSrs6EVqC5fuiAsFSEHHUm1uxNiwKvNPpUF+h5WBh38u524nhAitll14
         cf1MUQye5bfslzfJFpU9bzezWzhoIKF8xNMRO639JfsGu2WCZ7A5PWVnUhlSDJ6JJse8
         dcl7TJ56ZOTlynMLAQoC5bO9pxHQETLApioBVdGE391wg6d7RlkxhzIPX7M2qc8mnN4Z
         uxyzfV8ZKU/re/+k90fxY/AsPKq+7MeIAhB3euNvfpQ8UYj40fz2oKQkG9yNZWOHzOTv
         GMiQ==
X-Gm-Message-State: AKS2vOx6BGtaR5lt+qvfjXepm0/9Dd2LPHVa9NK0KxbuWjIHmHb2bet8
	Nqj+MP9A5UAEsA==
X-Received: by 10.55.191.197 with SMTP id p188mr4080327qkf.69.1497415700444;
        Tue, 13 Jun 2017 21:48:20 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id b52sm11119597qtc.35.2017.06.13.21.48.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jun 2017 21:48:19 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] target/aarch64: exit to main loop after handling MSR
To: "Emilio G. Cota" <cota@braap.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, edgar.iglesias@xilinx.com,
 qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
 <20170609170100.3599-4-alex.bennee@linaro.org>
 <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
 <87vao4b4z5.fsf@linaro.org>
 <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net>
 <20170611050730.GA12317@flamenco> <20170613225352.GA26288@flamenco>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <db800d74-7cfa-d9e3-60d7-3e7b19565b9b@twiddle.net>
Date: Tue, 13 Jun 2017 21:48:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170613225352.GA26288@flamenco>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: pQw2ScAp2Nsw

On 06/13/2017 03:53 PM, Emilio G. Cota wrote:
> The appended fixes it for me. Can you please test?
> [ apply with `git am --scissors' ]
> 
> Thanks,
> 
> 		Emilio
> 
> ---- 8< ----
> 
> Commit e75449a3 ("target/aarch64: optimize indirect branches") causes
> a regression by which aarch64 guests freeze under TCG with -smp > 1,
> even with `-accel accel=tcg,thread=single' (i.e. MTTCG disabled).
> 
> I isolated the problem to the MSR handler. This patch forces an exit
> after the handler is executed, which fixes the regression.

Why would that be?  The cpu_get_tb_cpu_state within helper_lookup_tb_ptr is 
supposed to read the new state that the msr handler would have installed.


r~
