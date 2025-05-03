Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1646683njj;
        Sat, 3 May 2025 15:11:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZgEpdUfVfAHRc+Vwz0qWN3/Kczm1ZwbW+jq2Dh0nYApwHbgFyj9SG4SK1FNKsroU5ExzSenv+3C06bA==@linaro.org
X-Received: by 2002:a17:902:d4c1:b0:223:377f:9795 with SMTP id d9443c01a7336-22e1e6e1a90mr30645495ad.0.1746310293076;
        Sat, 03 May 2025 15:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746310293; cv=none;
        d=google.com; s=arc-20240605;
        b=VyficshMSfG8YNlGKDxnvf/MZBMraFZKGN+gX7tpElCKi3VdnrhQE0nnBa2TpxYTEk
         qYvD3gufUrppq2JSZSO+2x08CavEvQ7GY853po/VqwqGBpV8G7dHM9i33hwet2rt008x
         peLfd2UNHsXem1wrScGUsDSwIhZ1Zhw0shpgJfouLJ7c21CCRzXwB5G3qWWFa65iUHyW
         SnxCZrTCcokmnhhcS+2cZL1cBCttFNwUpz7S4Cts9v5jPMScDH0nvnyDumtyu6cGartW
         NF5A2FZtMx8mOPCAQZyZFEI+87Aw8UutNKBBdPx1MU9y+ROWVdSmN7oST2ugkTpgye9j
         Js/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T7LctirqTNATR4ocbX59fsgCBPnDuKRYJ8DURr+ffWs=;
        fh=YyZHhM/y9ix55lORjS6AQxeMuB/ldIjFBGU2cV11GFg=;
        b=Tb9gkKu5E4d6gnCV4/+ZRWaDRP14SXrHFgcp6HcHdy/ZtDrbuGNWG1Qh0JBpJQeYIi
         723ePC/C/andV+uRQPpdqGkIvbZ8jeapwtImDhfBXGKVQd5JJmGTHXWJvUii+VUJqnR5
         /8SuyFq4aM/xUysdKd+BR3RRqdlOWEl3feWNeBX8ypuMh++bzuKc09sAAqs8TVw4uR8L
         72ZJbk81n88hsGwJxi4xRqFg//Fga0SGBcAqrHBq0XTzBJ5/qxiGv9Uptqm803a1q/TC
         Q5ZU7D8vj17rMkA2hleLz412WG2OezYvqzDkHX0406pcBUaeUcyOQR0zFAPiBUxP2aC5
         GmGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ebRi3k/E";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8bbe6sor51640855ad.16.2025.05.03.15.11.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 15:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ebRi3k/E";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746310292; x=1746915092; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7LctirqTNATR4ocbX59fsgCBPnDuKRYJ8DURr+ffWs=;
        b=ebRi3k/EpBENDJ+QLRNXZVph9C7t1bZb3Pyxn2QzLyluT6PYP+se5WfXbI1d9Z1TmO
         JlsHNNJEG925KCNZRJCHTV/CYpmyIeX9XV2wTYau70t3VrxJd0nO7y6kA5QepDfjixAt
         E20U8j4eQKHm9SsRjBUrmMy4jxaQZuItMgId1TqM4Hn+pC+54BG5hI1Ki1o/QtlddmGA
         S36mLlANmtJ9YQgPExyR1KqCWY8V3f89fSYtgZK/fc+vANN7TQqbDgf+UF1tgZvS/yM7
         bwxUboIduX5dBK8gtXY9Gn/Gbcy5vQ1/RqFwnEDoW4mqyIHD7Zf2XVceAp/CfAn26Z8l
         lnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746310292; x=1746915092;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7LctirqTNATR4ocbX59fsgCBPnDuKRYJ8DURr+ffWs=;
        b=JdL8ToGtONahtw21heEIW592Q6nHP7kmCgmYSlhcQ4146K9CWZv55PV206+1LG5OTG
         bnDgx3VD/w0Dn1DXO7ntorRWls2eibkxRlW6nrpZ/rx8d9GynrxYZstIjAlN2Y5/icvd
         JTIS2hSxsvyuWT/tcdGJpU4n1fLRFRhofQitXfcrFTLvzrKCVxS0y/b1vyhCVy0Sht37
         cnZYppVl4gi+G0XJn8a6GDPBqy8aNXIg0f2lAAgUJ1RZpfH+eqLPBWNpAwAa4WdJ9KjI
         pcc017uGTOjq2Uz5bBVFfC9hTIYt6/5WNjBtucirMvAPgTHnmv2gni4sZ5+1/RdMif9t
         Zwsw==
X-Forwarded-Encrypted: i=1; AJvYcCU+zw0GhcxKhYEbCRRaglagCUiTkR4VXgO9UbGTqPjBRgDQbgnPA6XVoEYxGfIYksJPtyajCUCUkzp5aA==@linaro.org
X-Gm-Message-State: AOJu0YwPdj0a6nLIhaaWmN1AYIDwdGDbGgydGPDPy3X+tO3j6hgsEgHX
	qpXFInO6GXVHNxq+Ece+gv8tWMMkxA7fgo3dicoAYkvOEGYfnkP2EaFYp5kZtq1RwA==
X-Gm-Gg: ASbGncvFJVWdRuKvZxhU/zi8P4NriOEGEnSoeO1zhSH3GBCdbDY2b6kdkKOz8FEkRp5
	F25CVjk9Ia0RMydbJIpc9oYMC6aLhQRCcu+SpSuHJL5Ng4LJFgrGXlmJhoeQdlZXTqyYG137cRf
	WF2NuJxI7wZZ4w2w7y6LYwu2rZZUjJrVWs2BsFf9hlFaUqj6Eao+2RmsxMm9rRKS4O00TELHZVG
	9EYxKX1crkmN2FtqW4m1Z2McK7uS3J0/89rZTlgoL3hq6F/DkXUP9aQ5oyRFRyaye5RBJoP1qLV
	jrRSO32ODkj2la//5rsIvCV+mHKbd9UbhYxZBPyOxzth4zw4TJQ09F0xqJTuVsQd
X-Google-Smtp-Source: AGHT+IGKZOl9sWhuTSlWLAe3uWJrr+qu/WKjiaqq1BSWM3eRAc1/owPtZQjoqVpboGxgTa1PqGq1pg==
X-Received: by 2002:a17:902:f64a:b0:223:faf3:b9c2 with SMTP id d9443c01a7336-22e1ea6a954mr30930175ad.27.1746310292542;
        Sat, 03 May 2025 15:11:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e813sm5644044a91.24.2025.05.03.15.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 15:11:32 -0700 (PDT)
Message-ID: <4abc3e82-acfe-4877-9f92-66e134d19d56@linaro.org>
Date: Sat, 3 May 2025 15:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/33] target/arm/helper: extract common helpers
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-16-pierrick.bouvier@linaro.org>
 <8f480fa1-609f-4b90-b6e7-02a76d2767d2@linaro.org>
 <00710aa1-2a44-4778-83da-05cc125506e1@linaro.org>
In-Reply-To: <00710aa1-2a44-4778-83da-05cc125506e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7s52MoHv+UHX

On 5/1/25 8:24 AM, Pierrick Bouvier wrote:
> On 5/1/25 8:06 AM, Richard Henderson wrote:
>> On 4/30/25 23:23, Pierrick Bouvier wrote:
>>> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
>>> ---
>>>     target/arm/helper.h     | 1152 +-------------------------------------
>>>     target/arm/tcg/helper.h | 1153 +++++++++++++++++++++++++++++++++++++++
>>>     2 files changed, 1155 insertions(+), 1150 deletions(-)
>>>     create mode 100644 target/arm/tcg/helper.h
>>
>> Why?
>>
> 
> It allows later commits to include only the "new" tcg/helper.h, and thus
> preventing to pull aarch64 helpers (+ target/arm/helper.h contains a
> ifdef TARGET_AARCH64).
> 
> As well, for work on target/arm/tcg/, we'll need to have aarch64 helpers
> splitted from common ones.
> 
> Makes more sense?
> 

Added a better description to commit message.

>> r~
> 
