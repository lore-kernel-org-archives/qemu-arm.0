Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36606njj;
        Mon, 28 Oct 2024 23:10:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba6:b0:424:895c:b84b with SMTP id 5b1f17b1804b1-431b5704d19mr5831115e9.4.1730182237005;
        Mon, 28 Oct 2024 23:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182236; cv=none;
        d=google.com; s=arc-20240605;
        b=YoRc/pOizmZwKZhONyvTIlAfn5PUTN7pg5P1uFzbqdd27EufNZdSMmTkBKGpJ3WI4V
         w4hWjCkbEB2T238T0/urgSDlr1B9Lz2R5GCZkGo2jKRUM3aYdjZzApfntHnVMvOebghJ
         pivGjRAWz0WfspD7Opn1xFprXbMm/J/awp56Cd+hanz7QBjU8zQmt3BEYtqczd3J2PDx
         x6a49jpEP1AmvmzrQuervs9Rsrv2dS/q4S9KcJ3QmGuUCHmdy9vGumsvrpW6fLsgGOOf
         0DjF0Wiij500Jifxv4AhxSMQsMpQAKnkrMgDMcJrV+grrs6q3rL/rqIH318IlKKHa6qr
         rCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4xMNvOFHoQMIxTPyZxSwGEaFshytQZXSxDE1TsC4b5w=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=KVM3ObPxj23WgsWcFb038oagvtIiI/p0lyH+uGgReoIBtRtWySfPqqRpQV2mBWO08J
         iDzjR5U5Gc8/8rCfSw7Rtamli81R+wTnCDBjIzvVoAbgTv+2Z9lvN6brmUp+kJxnCdDK
         iP7i+qT/tKpiFmtERbHIJOvEjWOOL6OaKlMItFAhpIv4kqwaQ/f3mf5XUj7GtUo7hI9/
         fTpZ9Z70PyZi7DehxlV2Y9AnuxoHy8ZkSO1o24LdQIBfSqaO1RQKjSlzkBQlWiS0J9ws
         ktRwAAhuaHf/IgJkHCFEr/9tZArd31m/DyNAffWqJ8g4tFReRs0+3Cznb3cpusCKc06w
         1ZBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIqYxSo6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431935965e6sor23126815e9.1.2024.10.28.23.10.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIqYxSo6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182236; x=1730787036; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xMNvOFHoQMIxTPyZxSwGEaFshytQZXSxDE1TsC4b5w=;
        b=UIqYxSo6Otd4XUPa1lFZzqFJ62YU++TSJHU/rFcirWU26Eoi8h6A3bPkaAzqHHMeNN
         1lDc15beas5Zeq1V1D6kBn8Z93PycZuS/IWuwVNCoC/bP9TAmvPg20HSCKAuDfB94aYp
         bZgpG3J8L5/DsYCL4vHUJrsE33XWiURBhJxG0dnCATz2foXx1r2b0rtXpaeYdboWsx+5
         ZUrl5CF5k0MlAtgJOU1fYiTlUxfAfE071Zf67zLgQf6VHovzaTZB/ziizjrdqDrdGNZ6
         QpjGzeRzDugGE9r7HU2PXbiTl1zxIKN86KoZ4or5LwoXmQVt95vUK1z6TwuuToigD8Qc
         tuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182236; x=1730787036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xMNvOFHoQMIxTPyZxSwGEaFshytQZXSxDE1TsC4b5w=;
        b=iwrPahsj0JV6mVSBRLvqjnofH7lh0ccVgCk+5/ayrI1Qd6+rhBwIKLPyRo31k3+jmJ
         30OdnTWtMk6TpGmjPeC5xqJxOzuadeYi5SJJOejaGawSFQUCJ1f6+C8687K7dXYpTNPd
         2tiZPPPDH4DNXrA+lMYCYtL2qrSnGFUCdHP7f7+oDL/TRC/VUQeEPhUCYx/vlPUanddz
         YelKjL8DF+TIHOffzcEQDcaN56eTojat7tmUQ1IjLc0HEIWxP+b0urIijRFmrhfFS/UW
         qjMQIwiRu29Cqlc8ulfksSfgTk+hkGM0o4jFo9XvyiB6s5l0OJA00egb16CcWBOBKd4p
         tYbA==
X-Gm-Message-State: AOJu0Yyr9zChhhONYtQ2/rVfrLBB2AsTFPgw5hQid0NOMrM/LcQz7M9w
	5FK1NzACDdxwkhwZNMHYtMEjUg8scV+vTr/SnbZciWZIAd81lzsDT1n7+4PalLxc7A==
X-Google-Smtp-Source: AGHT+IEGsX814W0LFqfoUf7zBxb/lvHLCt5x85TFKSV2oBWHRFrtdMGF1PcQ0Y1duhjfzCpcjB7xkg==
X-Received: by 2002:a05:600c:4588:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-431b5630bb9mr5994435e9.14.1730182236482;
        Mon, 28 Oct 2024 23:10:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bc1sm11560253f8f.70.2024.10.28.23.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:36 -0700 (PDT)
Message-ID: <b8dec070-e111-4484-9eb5-d98560692a48@linaro.org>
Date: Mon, 28 Oct 2024 12:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/21] target/hppa: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-7-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0zv+czMprn27

On 10/25/24 15:12, Peter Maydell wrote:
> Set the 2-NaN propagation rule explicitly in env->fp_status.
> 
> Really we only need to do this at CPU reset (after reset has zeroed
> out most of the CPU state struct, which typically includes fp_status
> fields).  However target/hppa does not currently implement CPU reset
> at all, so leave a TODO comment to note that this could be moved if
> we ever do implement reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/hppa/fpu_helper.c       | 6 ++++++
>   fpu/softfloat-specialize.c.inc | 4 ++--
>   2 files changed, 8 insertions(+), 2 deletions(-)

We could do this in hppa_cpu_init().  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
