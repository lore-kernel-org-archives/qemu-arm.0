Received: by 10.25.0.144 with SMTP id 138csp198488lfa;
        Wed, 26 Apr 2017 02:57:15 -0700 (PDT)
X-Received: by 10.28.26.149 with SMTP id a143mr183432wma.18.1493200635048;
        Wed, 26 Apr 2017 02:57:15 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id c41si20869969wra.299.2017.04.26.02.57.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 02:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id d79so31862399wmi.2;
        Wed, 26 Apr 2017 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MO3Jq9TEZolLbQATgCz3z3vITuY7wG3fPvli3R2qp1g=;
        b=ZaUr7/kA1XRU9tS9J/T3eN0jelH/ysmGbH1SGAPO0z7S5V1TvuAZYPVCUoiqYbpNO+
         YtL3WXxhBl59hYUjpA309plQqIAgFOwlBt+x55wlMj5rPrbMZwkUxQknRS785nBkG2FX
         VgcG1KKG0LBKRPEvxmSrlmyqI9AmHnXmxJbRrG1KPwYOtEowsI/J/Rr9BqlFliSDj1uO
         gClYeroF/7hoDcyQx5yZ/C66cscjoB2OYOcLk/EvqVq/re6DUdfqor7xpop3gxFcfvop
         5Di1VxDqZl9md6P+ixqV/5xMd2eFj4b2+y89MscZPJKr12ySnJdVcbGJdakl66pUYgFx
         9KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MO3Jq9TEZolLbQATgCz3z3vITuY7wG3fPvli3R2qp1g=;
        b=A2auzJDQ/h+7bB1T8WaJbKFDi+r+aWxCEyrW5O/VjfGhHAUml3IAYThqbAaOdNXWZ7
         LDtqzrP+AuCWA+NRCOUic9W5VRdlCZ1Xu6UooY3VZKvU+v8IXlLCXljkMd5VcBBKc0Jz
         iQyfApaniVmWI7zO6pMlBBC2Qp3Tr656gq+4FL3AsKZI5sJjOtVIBTZPlHWICi1hRrZx
         lXdDYQaE74JgO4bGyOOU1mTNJ/OGa5adhBd0qBkGXWWgJy7tH+lSCbw8sBcW1n6qboYL
         DPkUCWcfRruaq72naab0/C8Fd9WGq41qT4eJpgcv9vdOTrboh3ve3sQO3sIi0Q2V8tBJ
         mXrQ==
X-Gm-Message-State: AN3rC/7nzUh0MeMXw4k4Qfl7kf4NQGU4QU7v6mRLOfPzzk+1TjrPc0+5
	0Yx4ERbRLJy4AA==
X-Received: by 10.28.63.148 with SMTP id m142mr5093517wma.98.1493200634607;
        Wed, 26 Apr 2017 02:57:14 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id w126sm5502168wmb.25.2017.04.26.02.57.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 02:57:13 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [RFC 1/3] arm: Use the mmu_idx we're passed in
 arm_cpu_do_unaligned_access()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org>
 <1493051615-30715-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3b00cc54-e40f-9dfb-3701-3cda61a6ce8a@twiddle.net>
Date: Wed, 26 Apr 2017 11:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493051615-30715-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: pPUSEP09pr+o

On 04/24/2017 06:33 PM, Peter Maydell wrote:
> When identifying the DFSR format for an alignment fault, use
> the mmu index that we are passed, rather than calling cpu_mmu_index()
> to get the mmu index for the current CPU state. This doesn't actually
> make any difference since the only cases where the current MMU index
> differs from the index used for the load are the "unprivileged
> load/store" instructions, and in that case the mmu index may
> differ but the translation regime is the same (apart from the
> "use from Hyp mode" case which is UNPREDICTABLE).
> However it's the more logical thing to do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
