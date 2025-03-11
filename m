Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1706701njc;
        Tue, 11 Mar 2025 02:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqsolMmvlkL1ATAO3xpPrTEPN32jHhvuRDWdNDoxBJi09es2F2JfLV9CBX/Sfjnwnd7E8AgljOjkWUSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGGaKJlETfue9MRbXxG3JXw8c0LoLuHMmHh461IKB5UIDXuDOGQPgexUJCS7SWbR/dpDw5I
X-Received: by 2002:a05:6214:d6d:b0:6e8:98c0:e546 with SMTP id 6a1803df08f44-6e9006c8309mr232179526d6.29.1741683712549;
        Tue, 11 Mar 2025 02:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741683712; cv=none;
        d=google.com; s=arc-20240605;
        b=gYrah560Qg9yEAj1XH7cR6bJa1/q/3m45/Rhpfr4A3WhxGBrU0O57sYa1ndc+ay3uK
         QXSwg3tUpPO1w1nl3xeqGbrUuKiDNkAV+eir32VgEz69EHNt8DfoCVBgpETeQl62ESi8
         QXNjnq8U1NtX76zpV47IGRMnkRFbVR5BoT0IBCferFfCC4HAAXL2IX7bT84O0vk6zFel
         2BG5s7TMlSWi66oSHzRgOQMSRfLZ3++aoPwtKFfVr+bQNceh6vFfXSVlDfVn2jvkEawR
         tOMUH8pstuB1PmZRef15dPYT2HvlgU6Z9CB4ftMeiQ+ZGwiSIPCi+vEzCwMNOm4hyOsA
         gr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PTnMl+LwpyUuxwQWpr4yTuH+ktyfBqsl7s/0FLPGbnw=;
        fh=LHW3KN1T/ve9GRgXx8KuFQc0MBXqhIKfRyOwInLSF2A=;
        b=EhjI+hToHvkKTcn/kYDO34n0K2nIPfU1+/0rFw4A6WE7zqu9g1aSQBPIKPhc5EgQWp
         56rgmyz1A4ZxjsoPWPQ0/Y6z+rqwcC58GFkyCcsnZEtniEC0bcN/s7nC1imsPIQ22Hi1
         wKmA1tgN4gSL/8pejP4obhhrbjbuYQA21WlUQJaiRpj+dv9LMS+MOXlqCjSIKXgP1R1n
         Fn5/iZotFAs+hsG3cuopW7zPR3V2Jv3+xfKg1lotBcIyOxqyN9iFRPjrkgHxGHExMvKv
         3N4dqPHhExznLGzsrL35CUZ33WTxayymJFVmAiy1I6bxA2XNc09MJpgVjd0GXIrkSCxk
         rxmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aO+JHwy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707ccfdsi106620616d6.36.2025.03.11.02.01.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 02:01:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aO+JHwy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trvUg-0003h8-8T; Tue, 11 Mar 2025 05:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trvUJ-0003Co-AD
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 05:01:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trvUE-000253-IY
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 05:01:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2684338f8f.3
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 02:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741683676; x=1742288476; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PTnMl+LwpyUuxwQWpr4yTuH+ktyfBqsl7s/0FLPGbnw=;
 b=aO+JHwy3K5hDVKqTRyKFIt9fju6sovCRwQtxPfWlQWageXfG3CkelnyiHhNzAIqMSB
 m55/5Ta4HssF/9sp0c+o+BhsaIDW+0EM6KgOXV7R4haJ9mHgXnrmY4w+jRgaL90v8SJS
 hUuUZR1gdc/6W2WJQOEJeSb6RWbu9CaAkU+wRtx7R76q8W4yro4J01k7ogXDjLDPqNoM
 N4y1qxUdYkX5qoROnk18w42rkC1Ew21rorxn4ZKLJVKvEhoRLsEYnELdXHxFNy7vpNoQ
 pERumfzPWwucpl1C2GhWTUshPbCWqQmihhjej+/8y5+B5dFQY3rxuYWyyVlcTr3TXBdy
 FAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741683676; x=1742288476;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PTnMl+LwpyUuxwQWpr4yTuH+ktyfBqsl7s/0FLPGbnw=;
 b=TQGuB3wYDUDVUcZ3kQbh0rRHeShP4yg1i+oTxkoPbH4FpDpz6v9a7aiMtjMMDRKSPM
 gXNhGISMTEEDr32HAgla7GtUHFG7Tz3QV+1aDB8NmDpWmgGeo0zTwVHTFVCCwbJcwnej
 4c3c4AaT+Pajfm6I9u9egVEtJYQ0daXRok28kzCxtH/sgHEu0rNAPStO5fNrbAiswnx7
 oAoqiBWgvm2OBYWQyRH+Pi4P41nWsQPIl0ZOBFGWBJ87v1l12AI7ZRYWt8H+ynnGt+k6
 9o0BlV2crXOB9aEPrq/P9LdAMPYqxtc0ui3w02Km7NySYKgEHPdhLDWuZjkTkuEXu8CW
 1DMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCScYNqqkIpFig7x5SS7T6ZsEowgDl0FUXBawlHCEGZZZkIKii6WjeHFttzMy7yTPT0POc09rlZw==@nongnu.org
X-Gm-Message-State: AOJu0YwLQwO+qNJvGZgyfqEamZRT+X0WJAEUC9A6Tz1J9ILV222dQnLh
 juKbuUGf7ltiR4lNfuzfobgdpyM3Z7w86BItW6d0lZ50Wlnao2Cb/y6xvOFAw7W4AUH3GDLqmXn
 i5bc=
X-Gm-Gg: ASbGncusnQ3arOjOCnRhcIG+LBzJI0MKigAgOXwY5AzsZpJdc2eBleqVR9idUzPYSy+
 0CA/OQ9b8ZJValTXnCQk9FFz0/MuaIhn442Qr3eQWHLVYr3P+WgVr3VP9M8B1vdti7wPFW9enU8
 /cfhLUFNYAz0mdT8icWJx5ZKkxPZWa0+QY6jk9jOgBLwHxOKw5YtizBge4M/wzNj94F1giHZ5Pn
 Tb6Q2Gqy7GYrgP8YefgiNWbZVFcMK+0dS/7+DOOqsg+/Zpp+9RcoJHCvaaGzPfgE85gZ5Ie5Aih
 6HkuU8WA/9WwInkMOIhxz5/1H7QtDtgZ0ZKPva8OL9UW3Lg7cjxjaWVPdJMwOONNPLQT64c6eTH
 gTLIRfXD8u4I5
X-Received: by 2002:a05:6000:156f:b0:391:ba6:c066 with SMTP id
 ffacd0b85a97d-39132d9870emr17337399f8f.35.1741683675564; 
 Tue, 11 Mar 2025 02:01:15 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf595a771sm71103315e9.36.2025.03.11.02.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 02:01:14 -0700 (PDT)
Message-ID: <f325c69e-6a30-4d16-bce1-8f7b4de72de1@linaro.org>
Date: Tue, 11 Mar 2025 10:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net/smc91c111: Don't allow data register access to
 overrun buffer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20250228191652.1957208-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250228191652.1957208-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B6vd4EWnWoOc

On 28/2/25 20:16, Peter Maydell wrote:
> For accesses to the 91c111 data register, the address within the
> packet's data frame is determined by a combination of the pointer
> register and the offset used to access the data register, so that you
> can access data at effectively wider than byte width.  The pointer
> register's pointer field is 11 bits wide, which is exactly the size
> to index a 2048-byte data frame.
> 
> We weren't quite getting the logic right for ensuring that we end up
> with a pointer value to use in the s->data[][] array that isn't out
> of bounds:
> 
>   * we correctly mask when getting the initial pointer value
>   * for the "autoincrement the pointer register" case, we
>     correctly mask after adding 1 so that the pointer register
>     wraps back around at the 2048 byte mark
>   * but for the non-autoincrement case where we have to add the
>     low 2 bits of the data register offset, we don't account
>     for the possibility that the pointer register is 0x7ff
>     and the addition should wrap
> 
> Fix this bug by factoring out the "get the p value to use as an array
> index" into a function, making it use FIELD macro names rather than
> hard-coded constants, and having a utility function that does "add a
> value and wrap it" that we can use both for the "autoincrement" and
> "add the offset bits" codepaths.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2758
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


> ---
>   hw/net/smc91c111.c | 65 +++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 53 insertions(+), 12 deletions(-)

Patch queued via hw-misc (except if another tree is preferred), thanks!
