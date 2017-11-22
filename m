Received: by 10.223.159.82 with SMTP id f18csp165942wrg;
        Wed, 22 Nov 2017 05:12:17 -0800 (PST)
X-Received: by 10.80.169.78 with SMTP id m14mr29313115edc.118.1511356337768;
        Wed, 22 Nov 2017 05:12:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511356337; cv=none;
        d=google.com; s=arc-20160816;
        b=JvpDuG0/eeRM2ZWGqWhPqlfZThRjr4fySkUilaGCMUIiykZIuiT98iuGsJxt9Ktv8T
         aYIxQJODnmKpB6X6nk1xSCUXgONGFuN4aG76/LZvzaxgJ2OO0Lx2Ie5mtUSnDECxlUSe
         dGV1uIbEFvfrAlAfC+M2dL4xIM210vcEdAKvkJAS1zJeR5EXGRvMGLGfsByEPlkgd2II
         MmGrPUKqDJ49m3AOgNKyDs533P7BEUezfHbuhCpETvIpAicTm0FyBuVpiNrDWyasigP3
         iFDouIeIfadUuNqwAy+c46KTyXvrEt7JpXpjbdoiO7ZMiERUmhnhq8A5lsFlXdH4JHG3
         LGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=3wWA3+ANWHa2Y7dx3yJbUeIM5ttP3S1I5bFznLeuFf0=;
        b=1BF168Zh5O1qEGpXInJxnY7r+/q32CzElPYoWGAyC6rZAtcsSLfkSCGixzUC7pUowG
         dOCjokOJb99bJYcxW21hwhPhSgmeOIdyPSlS4B2ZqGNkTS2ZIVRxLIs3ZveKjkt3IY/g
         fo3Z0uSR9KLylsfABN14z45nSZKMntQfgp/m66oAROufYJfoUYrjURdMc8XICVJDpAc+
         r2Gn0gXlIEtBzrvZOTTzVFNtsNIQfUe/29qu18DuxcpMr9Tj3/2TwzuKGLfwnJuR7yop
         iK17F+r/dYjnWwo0NptJZ7rnK8A6OGtfStGxS5IoEnbW7/VPNu1Qc6F/0bw7XeWTFn14
         oMIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HxZEi+zu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w51sor8846027edd.54.2017.11.22.05.12.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2017 05:12:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HxZEi+zu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3wWA3+ANWHa2Y7dx3yJbUeIM5ttP3S1I5bFznLeuFf0=;
        b=HxZEi+zu429p0ew7wjJ2Ry81VdYwZkbBAx1YgDa8PfgMxlr/hwL1Famqdj9xDMgOXw
         RCVEJIRj/rSY/f+cvIwKp7Z7nEXC9XqHa/6JfFe520XlO6zIcSqV990M7Rwa5dDy9vcL
         bRqt+IhKeNiZqR3B1hp+TqWPrAMOEOP+iCfrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3wWA3+ANWHa2Y7dx3yJbUeIM5ttP3S1I5bFznLeuFf0=;
        b=G8wvrPPqwkjZBgo/TypPxMX9ujk/yztc7N03mkv/+gMlPQcd6NAIwUgWIexV09MD9I
         bHcjlbPzkq7rB9502MX2+NKEdOkHuH0rNV7qtk0JJBthyDozxDB1elLUkLz5AbXdyP4J
         i6d16QqTUUqRJMInuIB1L/Y9O9EwUZNDB54OLeJTfDfEZi2EyPIoWTmrID9/s66iu/eD
         qtM9YaYhu+y2S4PAdjeFkElI9ecXxJ7/he58bm5ILYtZ0BrDcMV+pmiwUM8TS0nmQ5E1
         HiwJTyOdw+/za4CzzWm5FOrFL5ua5eq9adRmOc4Rvl5qMhd5mWrPTxCR0+Ay/ZdeHjUT
         TDZw==
X-Gm-Message-State: AJaThX5ZiKMIqC4z9UI5WyOG6VwIYJ9i4bUBILWl6Is3A5sSTOWlphYh
	W+j9MPwctpavB+oHsTHvtHoCYy0ZOR7GqA==
X-Google-Smtp-Source: AGs4zMbuC24+JwPimAI9dV9yIH0mtxUrbFile0aH8CM+kXkfI/ouFyypGa2jsBS5wcdLDi/cvNh8aw==
X-Received: by 10.80.179.15 with SMTP id q15mr28588340edd.166.1511356337547;
        Wed, 22 Nov 2017 05:12:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (66.red-2-142-25.dynamicip.rima-tde.net. [2.142.25.66])
        by smtp.gmail.com with ESMTPSA id k19sm12021848ede.35.2017.11.22.05.12.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Nov 2017 05:12:16 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v1 07/12] target/arm: Decode aa32 armv8.1 two
 reg and a scalar
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171004184325.24157-1-richard.henderson@linaro.org>
 <20171004184325.24157-8-richard.henderson@linaro.org>
 <87r2t29kje.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5753185a-0407-6d7e-d874-172e9726c3b9@linaro.org>
Date: Wed, 22 Nov 2017 14:12:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <87r2t29kje.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Iw50W1+R2b9M

On 11/13/2017 06:05 PM, Alex Bennée wrote:
>> -                default: /* 14 and 15 are RESERVED */
>> +                default:
>>                      return 1;
> 
> I think this should now be g_assert_not_reached() as we decode the whole
> op space. That said it's tricky to follow in the mega function that
> extracts op with old-school shifts 5 different ways :-/

You're right.  Thanks.


r~
