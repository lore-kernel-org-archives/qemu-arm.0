Received: by 10.25.0.144 with SMTP id 138csp202420lfa;
        Wed, 26 Apr 2017 03:07:09 -0700 (PDT)
X-Received: by 10.223.139.87 with SMTP id v23mr1159452wra.9.1493201228867;
        Wed, 26 Apr 2017 03:07:08 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id w1si7680799wrc.161.2017.04.26.03.07.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 03:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id u65so31827153wmu.3;
        Wed, 26 Apr 2017 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r/lV4gMuuP8g8iwsPQLve0p/9bnSTqlfgjCi7w4KyDU=;
        b=eFLh753wNjBsPq1aGpTujZxJgs2Xo2Dg2nsCQYeaD/7nOuYLPldZArNNcXX6xQz/s6
         Q/FnCb73JY77NajDlRtV8UOjGlpZA21gCbRfnsQ1UabbkJGV5uu7LKJSrZzXZViub/E/
         TDtk2XQYII1OzFPNr+WxpVxrJVdjRtgt9rfYzoWb0SIsus+QBkPlp9s3JNSHFAnJpnvH
         1cK4CIYENo5v5IXOjJ6tF1F48aS4OJiMKee5WeYp9ht5qvOSm9hm5ClYIdPwjHpjH5ox
         /90VgAv2QBejKpZLoQQpkTQEZXTzCraQJ/8qMs7fdz/SQ4qlB3BRRaxnncmb7O64Sko1
         c4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r/lV4gMuuP8g8iwsPQLve0p/9bnSTqlfgjCi7w4KyDU=;
        b=awQ9FpML+qmpaisOf+8oOb87fcYDQm3CP9nxfb6kd2eUX6zW9kIE+PIq1Hmn2y8BXI
         09lJznu7j14vpKP50bKdjpreI5W/ne+VHHGqGs52XaAs1mU1KfCQ5wBMi8hxtdJDFd5d
         H+8KsThLjsnXXpD4KkslvbaOZKJjCz81p7W2Pi2jiGytL+M389xhs/pO2bgdfgiZdJH8
         CD7nPXv8Z0sU1nECiY6THnlhkODiq+O/3u8U0vzDDUtsuB2EBQ8eiHO1DNxiR6NlwxPq
         gA0SGzOWzXzn5IMebeBQ44ndKpQe6B6OGISuWHm7N9Tb7QuGnW4K8PB/j+slH/gAE1dU
         7Dwg==
X-Gm-Message-State: AN3rC/76rnaI/aIbU7KqgHp++i96+VY2fFhksvdVpSIKuDWIjj2uduUt
	11eku52B+adfvQ==
X-Received: by 10.28.128.68 with SMTP id b65mr206137wmd.140.1493201228629;
        Wed, 26 Apr 2017 03:07:08 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id v8sm29058246wrd.42.2017.04.26.03.07.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 03:07:07 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [RFC 0/3] split core mmu_idx from ARMMMUIdx values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <b196d1fa-3db5-6d9b-8eff-dda153f23a01@twiddle.net>
Date: Wed, 26 Apr 2017 12:07:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: eoq0Mw/QYKvZ

On 04/24/2017 06:33 PM, Peter Maydell wrote:
> Overall questions:
>   * does this look like it's workable enough to justify taking
>     it rather than the simple-but-worse-perf-on-some-archs
>     option 1 ?

I think it's workable.

>   * this does risk breaking A profile in corner cases, because
>     C unfortunately doesn't typecheck int vs enum so if I forgot
>     a call to an index conversion function somewhere things will
>     break. are we happy the risk isn't too huge?

If you like, we could add a tcg_debug assert somewhere that verifies that the 
given index is < NB_MMU_MODES...


r~
