Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp505380eja;
        Sat, 27 Jan 2024 16:45:05 -0800 (PST)
X-Received: by 2002:a17:903:3284:b0:1d7:5e30:983a with SMTP id jh4-20020a170903328400b001d75e30983amr2163474plb.111.1706402704906;
        Sat, 27 Jan 2024 16:45:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706402704; cv=none;
        d=google.com; s=arc-20160816;
        b=d883jazmIqLYi93cNxo/Ne3kbW6UWsyWlfLhcNx/+tr32EFEkvSif1UY9+CbGtf9Q1
         qoylwVymK04UY5JCOhbxwN8p3spw8QVNF5o5rDG8iCETamB/pdSG6jpkRTUvQQMRCi88
         E/mYacKmfbWGWM2TqSQujuTNfI/3QOl6ZJZsjjNzDYhm5NThV68MTfqSETv3KWAu/P4F
         JF0WAyJ+9HyyJ++mD0N8q5viWMCjasW3Rfkdzk8T031rTFzArhmBa86lg2PAXjSc7xeq
         FJ8UVjcEVGW41PFAAedJReuFFDRDVm/zCxqrR6GCk0WIxBTa8/BOPAdP2JHtNREZFHVg
         hTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=F7rBobLVGNUalgOF8L/NQKUskxN54oKJXb8lMs5nVQA=;
        fh=W84aVyQshfm+IQnNVHPtZJa4aBqwTfwNS9QthDGemZ4=;
        b=N50NZS30rDd/GLcsBPHVtfgpeD0HJp1yBmqzxp8Ls8bfggGgT5Q/DUsQvLpS3s9Dk7
         FG3wmSuXx1cOW/NPPAUZW+BVoFmQtva1gOT1quIdEmSZuKP5yadwb1HRKSXD2/+ddFj3
         09vUZAp6eC4kJYtYna5BxK65L/3D+cX05J6pxdbSYhEfD9o0LLUHrf+9VsCt2EXmp1Ww
         DpK/ASjaqvHxfeedjO7kVMzN/WksGRagViPVnF26Eg3BtGbH9S0fLTwDrL22cCUZf+az
         9jZc8ImhucXmv3ybUBtNyZ8WhHstMWdkJjnvZwdY+1wNK097dSoB80Ld6iaCN/DJ0Z3h
         PaVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dymzQHPY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e2-20020a17090a77c200b002944b2496d6sor1881228pjs.5.2024.01.27.16.45.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 27 Jan 2024 16:45:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dymzQHPY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706402704; x=1707007504; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7rBobLVGNUalgOF8L/NQKUskxN54oKJXb8lMs5nVQA=;
        b=dymzQHPY1MhnTuONTPEnc7tWxjdYTm+v9DPlUurdsFtj494PULWuAbW32qg4W6RRck
         Ll/bMT4m2x3PVcpsoJ09XIhrQEjK6Qh9G6mWO//3Rck/7AgjKjFsrrzGKiggiA4B9G2s
         DBTFORMnxk6SAP9d1ateTBhGNJn8XZ9AtD8iNKxH9mIpr4fZHuVLylemU/osQ7nU8mc/
         pCi0+BLRH7KxS3e3KrX2vqcgcM9Wlp+PUQ9WCzHUOdRBv17TArZkGroKahSQOSrM5kTV
         LxzbOlhjkQLDxWHQV5NVK6D0++48A1p4fCKKatQXLp+9rEL//rAoPXiZyw9EimcSHArj
         gdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706402704; x=1707007504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7rBobLVGNUalgOF8L/NQKUskxN54oKJXb8lMs5nVQA=;
        b=HUKtrd/dBTHMS5GcGrTeRHaQ1/TY19Od0eOmN2rF6cjSSNBvYtQoitz2AMpVeMbCOR
         PzefUBhgnWg3KUuBM1A7enx2Q7DWB53j6XA2IC3R6J5xPLz5gt2owH9csRLIPDIHUdfn
         Jxlh+H1zK5UPaWHcL0uUOtdnoa7Ql8zYTT+RP9y9NIV0TQf1SvA9ipk+FdXqoTYehdVp
         hN2j5JN5WpDxxYE4dq4/zp2w1UYS2sP2oDlgKh5yBs7Q28gRusON6xbg/PvcNsqkAWGJ
         c0fRV0cWXkvktHxdy85PHv8mNdl21HqQW14T7kIyL9HQV53XxqMQ+TlhEvQcJpJiN+Yz
         tidQ==
X-Gm-Message-State: AOJu0YwQdeR/3rLY39MH5ezUXugZFVzWUHSTd4VeD4OeQEiEroq3ztnz
	MC+oKhzMszI75lWyDpSohzCV7UOy6jb320FG8KTG5BaXUB2EaCajbdr6PLi32O2+Cw==
X-Google-Smtp-Source: AGHT+IF0S+Ra5udkCxuDxsXeQJuJcn9ruDI3fnfeqSAUdMNHA44+oGlD8ydK1Art+3Z2M3ElbLQ7LQ==
X-Received: by 2002:a17:90a:8a18:b0:294:9a03:6d13 with SMTP id w24-20020a17090a8a1800b002949a036d13mr1458365pjn.15.1706402704433;
        Sat, 27 Jan 2024 16:45:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:44b8:2176:c800:5c13:51aa:e666:7387? ([2001:44b8:2176:c800:5c13:51aa:e666:7387])
        by smtp.gmail.com with ESMTPSA id pb18-20020a17090b3c1200b002954b669007sm616816pjb.11.2024.01.27.16.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 16:45:03 -0800 (PST)
Message-ID: <2a0f2eae-dab0-4235-95ba-310c3cd12ec2@linaro.org>
Date: Sun, 28 Jan 2024 10:44:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] linux-user: Allow gdbstub to ignore page
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
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240109230808.583012-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NALL6q7xYJF9

On 1/10/24 09:05, Ilya Leoshkevich wrote:
> v1 -> v2: Use /proc/self/mem as a fallback. Handle TB invalidation
>            (Richard).
>            Test cross-page accesses.
> 
> RFC: https://lists.gnu.org/archive/html/qemu-devel/2023-12/msg02044.html
> RFC -> v1: Use /proc/self/mem and accept that this will not work
>             without /proc.
>             Factor out a couple functions for gdbstub testing.
>             Add a test.
> 
> Hi,
> 
> I've noticed that gdbstub behaves differently from gdbserver in that it
> doesn't allow reading non-readable pages. This series improves the
> situation by using the same mechanism as gdbserver: /proc/self/mem.
> 
> Best regards,
> Ilya
> 
> Ilya Leoshkevich (3):
>    linux-user: Allow gdbstub to ignore page protection
>    tests/tcg: Factor out gdbstub test functions
>    tests/tcg: Add the PROT_NONE gdbstub test

Queued, thanks.


r~
