Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp837670ejs;
        Tue, 9 Jan 2024 22:01:29 -0800 (PST)
X-Received: by 2002:a05:6830:4901:b0:6da:5d8f:ec15 with SMTP id eq1-20020a056830490100b006da5d8fec15mr187644otb.50.1704866489464;
        Tue, 09 Jan 2024 22:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704866489; cv=none;
        d=google.com; s=arc-20160816;
        b=orZEvtfi3ra21tEqwAo+ebihbFp2iB0553q8dpvyQvYcbeX94pskOsv3MMfy7nzq0/
         XwAe1Z18k4sXuo5DjoW5TORLhC1/K2JoufdJlOfEF/KZIuCkz4E/FYrfSZNNAMcq8A3v
         QIvc1hJPR2XJg3u8+fKUN85PorJlRWSkVXHDA+GgzYidOih7wbHVJE1Y0VCxWJVVHMV4
         xNWsU2TyD62RV0djr4OWRRakH95WIBIQQg32C4izX5hMY+EAjUuTypZduPGEyrhOPLt1
         OKfFBBOCYr024tO3w+MKTQEK/B4KXFzUgcFTZgkIaymFy9GGwNXv4bP6HxHw1KGf+snX
         qo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bZLy7w4sWwr0LxjC+kOBmf3dPDrUlHrMBo1D7eYdnS0=;
        fh=W84aVyQshfm+IQnNVHPtZJa4aBqwTfwNS9QthDGemZ4=;
        b=wTpeRI1I025Nog+JOjqAlQmbIFbz0StfibOuYtRJ8xxfSIICNfZ2LeG7U8/s03Dbmm
         27dhpJJm18IdkevYDRVcIKVxH8sWMWKGEXDrKBjhcz2Gb1apMgBR3yz+l0EzMjtWwg7Q
         SqDHmEJF1GCr9Ik25Y0mKGbYEY6AcH+JqSFKIm/8gDb5dFjqkiRjxkG1uTJ3uFy9OtgC
         /1HoH06V3ramUmz3s2a4nXXR0pe63tpTVGzi1KXXt+y+EBeZS+sUHacsL4Xychu9wtTi
         3kwMX0nlwR86wqjyIemRxa1alIZd+05eBIJQNd9omcYVX8pDlg1kf9yiezQbeQjmeUiL
         wUPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEw4eUVq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u12-20020a9d4d8c000000b006d7e910e74asor1791908otk.2.2024.01.09.22.01.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 22:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEw4eUVq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704866489; x=1705471289; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZLy7w4sWwr0LxjC+kOBmf3dPDrUlHrMBo1D7eYdnS0=;
        b=CEw4eUVqvRQLUzHXRIQVp6Y0FahOjKDGOQ30cxXb9cU3rPRqOQEjYj5J44keil/MGv
         IopCd/rEwmbj997NkkNH8RwRUoZUU4ayXeGAbOau+GTNyeJ1/RCW3SGjcpTPUlTlOGi0
         NnOFfw6GGvUk7KuQ/0G27sXP8C5yyTXyxnqWXC3cKiCwtbRuPl0lAF/0orCkttbj7Bet
         DCFK6RpmPD/7CWWUdhenVrADbIdFqcmyvM5BF9soDxQe0LmDxaIHT6TuXr/9BQDD3A9b
         ouwI3u1/+E4xO3jMF2rGhrpt1VhW6DH51T7HYwWMjMCJ+xtk02oxdb1l8NfWtpZ4GZg/
         B4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704866489; x=1705471289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZLy7w4sWwr0LxjC+kOBmf3dPDrUlHrMBo1D7eYdnS0=;
        b=ls7CpAYjV1ZEjPaXBeia9qkfG8IoFeCq21pqcnopVrSo75lWjIf+DB422qUCyc9X4P
         TMgyVBoHlW81Y1DmgS+YhGALYwmrhoo8BLXKiqLHch0A8OsvWoeydxUJf0xvn0BZVISQ
         wmWiegkc9nSqHVFGwGziNcCMvaIOmFbxa+L1P3cCR5h8nkElkqiKa1XsCLdIlmppqQdm
         w6ZxlQe+rNBorFxNSu3I2yxNE7flAg6xWNWYNpx/PzzchCUlrWjkmpnilWJPWFKOHrH3
         qJ/xviWbF9SRwEgPhGAR8JsiP/wgdHdk/71MfHXIUHlJEHf/azG6pCsFWmmp9FftvnzS
         HilA==
X-Gm-Message-State: AOJu0YwSIG+iv5UymheEdbXeA3Ig+IZQfqtca4FkYvrvF1GlplB1TXz2
	KcvcBRvaYOBeot4XBoxoW3q1o6pGtGzd4gnC
X-Google-Smtp-Source: AGHT+IF/Ox5d1Zv5hnwlyiCKIflahIBNF663KuWxW22l+73YDArqiEI5TYp0+AOV5uSjzTqo+IOUMg==
X-Received: by 2002:a05:6358:338c:b0:170:c91a:b466 with SMTP id i12-20020a056358338c00b00170c91ab466mr541667rwd.23.1704866488934;
        Tue, 09 Jan 2024 22:01:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.40.227] (ip-38-9-1-25.internet.url.net.au. [38.9.1.25])
        by smtp.gmail.com with ESMTPSA id s9-20020aa78d49000000b006d9b2d86bcasm2648982pfe.46.2024.01.09.22.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 22:01:28 -0800 (PST)
Message-ID: <50340773-f466-46a1-9c8a-93640cef7dd8@linaro.org>
Date: Wed, 10 Jan 2024 16:47:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] linux-user: Allow gdbstub to ignore page
 protection
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20240109230808.583012-1-iii@linux.ibm.com>
 <20240109230808.583012-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240109230808.583012-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xfOBeASrp1cR

On 1/10/24 10:05, Ilya Leoshkevich wrote:
> gdbserver ignores page protection by virtue of using /proc/$pid/mem.
> Teach qemu gdbstub to do this too. This will not work if /proc is not
> mounted; accept this limitation.
> 
> One alternative is to temporarily grant the missing PROT_* bit, but
> this is inherently racy. Another alternative is self-debugging with
> ptrace(POKE), which will break if QEMU itself is being debugged - a
> much more severe limitation.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
