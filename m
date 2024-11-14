Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp516596njc;
        Thu, 14 Nov 2024 11:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW41EeURTh/EOOQsX5lVYlMPeOqZLqU4L07Ee9SK1l4gGpU4L4XpE2n8lZ206EkBzoZA4jM3wVk0copAQ==@linaro.org
X-Received: by 2002:a05:6a00:998:b0:71e:44f6:6900 with SMTP id d2e1a72fcca58-72476cfc9a9mr84935b3a.16.1731614373660;
        Thu, 14 Nov 2024 11:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731614373; cv=none;
        d=google.com; s=arc-20240605;
        b=AptWW3TfzVLc4WI6kPMDBbb3q72TsUqlFw33OXS2gcK7UBKGm5Zx8bWGFuL39GFo2p
         ZM0YkhmfhiBYeKXOJQUjale/1Vpp3Eo6zbVEibpIOOrUdYTc3jKGIlVH/4oP8nf4jjBU
         cpb7TJQuVwBedBB8q+YubVEtEXdCqDD+VUVG+YPucGeEF0hCVRSw3oWcDlaqx9YjvQpr
         G6Ws/Gxo0m+JD+LiyQ+RHExfuIH3nKOJ8tpQ0Tnr3fdDvm+OFBS64DW9TFqYhLVcuN5U
         At1cEuZwpQy9c56rJXDSpzNmSpXcva2JelJIlV9spq0wpscGyjLp8CEDPTeEKbS39Iq0
         LBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+qYw/5xHcyUvaWdcr+DqLAPRs3FLnKC1DNON73mpwic=;
        fh=QznJ/AC45ad/qPHkINhP8GZT8TUQnJ/CqniC7vWfhl0=;
        b=QvbsFNqRafDDUhLMPjpRKj+wiHWwNt50tDBPmb6Ae6sGZc12yNTuLRhwdJiPfo6mod
         o1qojKQZozfYcF2eBAki85PYrw1ZeBWwWONvuJkfLyf96yjwVSowW/hbCG9VUJVSMMC/
         LRcGOFPHjd2NAYGmMrQdZiD+3HqFsCXRTRgXKfDgJ7E03wZRQzhrvPS67MG9jr2HurCa
         fCP0igZ8OaEh6wySBInvHg2hVdgQFLvzflCXD9sPYy15ptolxRlxK2hRUSydsApGTT+M
         6Tr/3xzFGZegcxpNkXQSUxwvCChYzKHovCr2Rr/ljAtctZ41K6auvsHjp9dBUaaktkL+
         WjHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ag+4c8u/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a99cdf0sor1543761b3a.8.2024.11.14.11.59.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:59:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ag+4c8u/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731614373; x=1732219173; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qYw/5xHcyUvaWdcr+DqLAPRs3FLnKC1DNON73mpwic=;
        b=Ag+4c8u/YtCUO594QiSOlZCAxq9ULytpjWy+5GP0idAOye5VvyDwyDoSIxZhK8kT5R
         zeEhPidVmPtB7K4iKSJynxuzPc6SfSqAruXwtLZSXKBmRpVZvHBVLqChmMbVHZPs0j/L
         qBD4oVG86t7Oea0c3wwMmzEdam2viXf/+q9zH23nQEbvXdtgrW9OyQWrJr636rE8bt4t
         jSbkcC8PXZrLa5m/dmS0wPBqKLsWJB55aZIZOsX/A5CU2g5RvKXNpMSLE7tsNQX2XfIc
         NnhWYGyrnfGzms8eCUUqS7wBp2ivfJgh9+0AS7vdjI5+Lg3GeBq29Mjm3OGMoSiPFjEe
         yfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731614373; x=1732219173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qYw/5xHcyUvaWdcr+DqLAPRs3FLnKC1DNON73mpwic=;
        b=mXJTmOkAsRWfVR/Sy7+e0ISKJOriHm/V0SPWHHZpTMhTu4WDQrpy3CPCvs1/CTaT3w
         KsWNIZYsVY0b8YD5n1YxCdEWQN40X93O79N0jQ2GpEEmgmsipcWrM5eLOlxEG1IWOyea
         00ud0W4EXQW3Fb//ScrG9lu5luZ5/2pu/Oyfyea4FQlZXLE/4YcGdV62jiNm9P/kEkQu
         Wts1xrLmPNyvS2AwLYVeMe1VPAdx/mP1+ty2DAH9v6bzos0P/WDDMwjc4aVg4M9d5hm8
         MBhyBhkGUbi1Sqb9gwUZ94wDMAsiiK+25h0vMqxiOADDgFA2341jATltFlfkPCkqW8c5
         B1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUyxN6e8hU0qyNtCjyvuT1BhMhEqGrNd26G6GVE7BRQMBNxmn5rOL8XWFkH81czoeo666w+PoY2C5d0pg==@linaro.org
X-Gm-Message-State: AOJu0YzTw8hXDZv2DdZ3+TlIliZcVuMeDyYgRqS7UN2r1i8OFtHTdrFb
	ks3+Qm1Ja4m+VY6VWNamN9G0t1ERljtqKnF5TZevxAJXQlQ4i0eyxSYYOQqPRPji8g==
X-Google-Smtp-Source: AGHT+IEYzbBrbb1mIOIOhkjINXYRzGCcstpoZvWUAGnXtLwwV7z16KBMuTJFWDLsUOYRMPaTANfx7A==
X-Received: by 2002:a05:6a00:a18:b0:71e:6bf1:158f with SMTP id d2e1a72fcca58-72476d26c8dmr89396b3a.21.1731614373041;
        Thu, 14 Nov 2024 11:59:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771e1c7bsm15261b3a.146.2024.11.14.11.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:59:32 -0800 (PST)
Message-ID: <e39d524d-ba9b-46eb-8d2d-739d001ca59e@linaro.org>
Date: Thu, 14 Nov 2024 11:59:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] exec: Declare tlb_vaddr_to_host() in
 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-21-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FIWLGldSKN6M

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h     | 25 -------------------------
>   include/exec/cputlb.h       | 26 ++++++++++++++++++++++++++
>   target/arm/tcg/helper-a64.c |  1 +
>   target/ppc/mem_helper.c     |  1 +
>   4 files changed, 28 insertions(+), 25 deletions(-)

Hmm.  I'm not sure about using cputlb.h here.

This is general-purpose guest->host translation, with or without a tlb.
It's more similar to user/guest-host.h, but obviously not user specific.

I think cpu_ldst.h itself is ok, because that's guest->host translation combined with a 
memory operation.  But I'm also fine if you want to create a completely new header. 
Perhaps probe-access.h?  This is the oldest of the family of probing functions after all.


r~
