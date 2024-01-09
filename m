Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp657115ejs;
        Tue, 9 Jan 2024 13:47:33 -0800 (PST)
X-Received: by 2002:a05:6870:c1d2:b0:206:216:8f9c with SMTP id i18-20020a056870c1d200b0020602168f9cmr130403oad.101.1704836853256;
        Tue, 09 Jan 2024 13:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704836853; cv=none;
        d=google.com; s=arc-20160816;
        b=FnMCQsqeR+BOoQcbEtN54FgcKCpd3qs6bhfzse/CeR1MtKQtQueCfm8z1KRnM4cigI
         ariQ1WOOdnLQszL+JVYRfPSLMsNEnHToVkdx/4fKRSXor//4WUiqKK5okyArs1eidu6W
         6+nCFbd4jzoNCg7hn0JQnmVqFvblr87LmstWzETfpW4/yeMLrCkIH1ldWqu5JBSS1cEG
         KrucNuETOqb0HcOCDQAyGAl26QGg+j9E7UA7R3RgUmUZaA7IVT13zNvNwp69/lE0vaEU
         0PaBi4IukyIxXHy/pZpAXwKtIiSFV+7mt0LwfMQMPqINb+z4BfBGCraHq9OLOH6kZEb9
         30hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=z6mlmKKl0dxnFYQ96TgJKXaPpEa7mLFTUa1Gacpiv+8=;
        fh=W84aVyQshfm+IQnNVHPtZJa4aBqwTfwNS9QthDGemZ4=;
        b=thoNV1jFoLzWzpjQeLclam4E+NwBx37i9KIh3aFiKM1dvr5Cm/EwDU5S6zi1SZOMaR
         b7+3JmMNU0kymzUxpw+vGl/vps0f5Qr4oPwIZkm4kuunnSZ2OK/OHdJyDn82pWiwlGwy
         i9gBAAgjZ5OeWGNSijUeQsxQK4BucvE3P7V2r3lFfH+DjZ4OHoEgMRYn0m8B2yjujbIA
         6k5Duc8WDlCUkLBE9lh9KoLy1IhnshydT07sBxlvdQJ8HkGi76mAYXQdiS6aMRG9Lfdc
         egH2yyvYZSY29MAv1rhA4vXF7lD1cv1zZFpkGtc6sbiroUBZHS5mxSg8IY/N9IVO/4aD
         hyXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYexFsj2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ax31-20020a05687c021f00b00205d586170asor1429811oac.13.2024.01.09.13.47.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 13:47:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYexFsj2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704836853; x=1705441653; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z6mlmKKl0dxnFYQ96TgJKXaPpEa7mLFTUa1Gacpiv+8=;
        b=wYexFsj2GLGOQSIq/AaMJaxwQhasBQ8xQ1TaP4Y+enl5o4Tr8+n9H00lyp7RtuwVvi
         yU/LInmIcW3jounQJYfrZ6jVBo2Ziyz4Fo7q3ryPngtd2MZCoCjTWSUuukQvCGe9rvHX
         P/zgzrF7I7szzmDKFrfMw57SjELnO/fER4/HO6BB1zuYnqyAb0FMowtEbKeaS9HiGrZB
         k/3R6psezYp+i6rD3s1mjbjur/wSyBVniHKoVzoDGb8ZUQw519Gvr5AUBUbEJ/6QldLN
         lH+vhWYDX6LSZEWeWTapicGNU5Hwz9Klb127JVEDxQzdRwhmhIWQTawmYHWjGCwNcGYv
         04vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704836853; x=1705441653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6mlmKKl0dxnFYQ96TgJKXaPpEa7mLFTUa1Gacpiv+8=;
        b=hbgzVIsb6bwEGfBeYIZyFjs7lVB8tDXx5OUAD+xQuAFFZT557Ew9L2VTiGSY9LBqfP
         uuGV+NzSesNr5NSN8ARZxCqxemS+yEfd24ORjW19yhTr1/zGjnqzgCezmfnge85uyxJn
         N9jodpi5pt8dA71yfIr+nj/eocg7/krHj5qnBEKE0lvEVaXs7VgCqswEozAQk6963Fcb
         R2lG2BeyeTFfhf6RGDNwXwgCyPqr/1ict0WUT55wHs7TiQZtG1zpfNBfw+TUG8CELgWb
         Fii5epOzdNX+vxVS7dvwlfQe+lHUJHWmTf5/dpo/b0pdjZyN6KV6ppkO6TG4i/wfE5ez
         xfwQ==
X-Gm-Message-State: AOJu0YzFTnBuqnoCcKOjLnQEq1ZktXTOF/LC1tL/XFAax4pwgc7VWVaB
	MrSuI14jaq7DHMBAoK61EA5imkwafUoasLR/
X-Google-Smtp-Source: AGHT+IEqrgWcZo5HjHrAQ+SlypPQNRY8cRFDcKpwyoi7GrqHj+UdgUPe9e3qicO9EMDtCr1viG263Q==
X-Received: by 2002:a05:6870:b622:b0:204:126d:85b5 with SMTP id cm34-20020a056870b62200b00204126d85b5mr139430oab.38.1704836852809;
        Tue, 09 Jan 2024 13:47:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.44.231] ([172.58.109.85])
        by smtp.gmail.com with ESMTPSA id tp15-20020a0568718b8f00b00205e506c00fsm648824oab.49.2024.01.09.13.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 13:47:32 -0800 (PST)
Message-ID: <c0bef257-4d1a-4660-a351-ff5dc240723c@linaro.org>
Date: Wed, 10 Jan 2024 08:47:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] linux-user: Allow gdbstub to ignore page protection
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20240108233821.201325-1-iii@linux.ibm.com>
 <20240108233821.201325-2-iii@linux.ibm.com>
 <0195c274-0d5c-484b-9475-84a4d16bfae8@linaro.org>
 <139c997f23a3e7edd8334de124d0ba7820cf6dc9.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <139c997f23a3e7edd8334de124d0ba7820cf6dc9.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2P7PoVj/iJki

On 1/10/24 06:39, Ilya Leoshkevich wrote:
> On Wed, 2024-01-10 at 04:42 +1100, Richard Henderson wrote:
>> On 1/9/24 10:34, Ilya Leoshkevich wrote:
>>> gdbserver ignores page protection by virtue of using
>>> /proc/$pid/mem.
>>> Teach qemu gdbstub to do this too. This will not work if /proc is
>>> not
>>> mounted; accept this limitation.
>>>
>>> One alternative is to temporarily grant the missing PROT_* bit, but
>>> this is inherently racy. Another alternative is self-debugging with
>>> ptrace(POKE), which will break if QEMU itself is being debugged - a
>>> much more severe limitation.
>>>
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>> ---
>>>    cpu-target.c | 55 ++++++++++++++++++++++++++++++++++++++---------
>>> -----
>>>    1 file changed, 40 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/cpu-target.c b/cpu-target.c
>>> index 5eecd7ea2d7..69e97f78980 100644
>>> --- a/cpu-target.c
>>> +++ b/cpu-target.c
>>> @@ -406,6 +406,15 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr
>>> addr,
>>>        vaddr l, page;
>>>        void * p;
>>>        uint8_t *buf = ptr;
>>> +    int ret = -1;
>>> +    int mem_fd;
>>> +
>>> +    /*
>>> +     * Try ptrace first. If /proc is not mounted or if there is a
>>> different
>>> +     * problem, fall back to the manual page access. Note that,
>>> unlike ptrace,
>>> +     * it will not be able to ignore the protection bits.
>>> +     */
>>> +    mem_fd = open("/proc/self/mem", is_write ? O_WRONLY :
>>> O_RDONLY);
>>
>> Surely this is the unlikely fallback, and you don't need to open
>> unless the page is
>> otherwise inaccessible.
> 
> Ok, I can move this under (flags & PAGE_*) checks.
> 
>> I see no handling for writes to pages that contain TranslationBlocks.
> 
> Sorry, I completely missed that. I'm currently experimenting with the
> following:
> 
> 	/*
> 	 * If there is a TranslationBlock and we weren't bypassing
> host
> 	 * page protection, the memcpy() above would SEGV, ultimately
> 	 * leading to page_unprotect(). So invalidate the translations
> 	 * manually. Both invalidation and pwrite() must be under
> 	 * mmap_lock() in order to prevent the creation of another
> 	 * TranslationBlock in between.
> 	 */
> 	mmap_lock();
> 	tb_invalidate_phys_page(page);
> 	written = pwrite(fd, buf, l, (off_t)g2h_untagged(addr));

I would use here tb_invalidate_phys_range(addr, addr + l - 1),
but otherwise, it looks good.


r~

> 	mmap_unlock();
> 
> Does that look okay?
> 
> [...]
