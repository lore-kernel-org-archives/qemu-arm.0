Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3176985wrq;
        Sun, 24 Jun 2018 15:45:05 -0700 (PDT)
X-Received: by 2002:a62:930c:: with SMTP id b12-v6mr10480579pfe.193.1529880305448;
        Sun, 24 Jun 2018 15:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529880305; cv=none;
        d=google.com; s=arc-20160816;
        b=sjz1CLSX+OxL3AvkKQDWsLPEFVFJmh/i8oxg+r4DTYI+Y6myKdiaHIEIuUCEomiiqN
         VaGfzK5FTDBgiWN0GN3BCkJ1eVaFokWo+t++EwTxACZXiVmStUGCGZws3cuKMVeU38a9
         +Rj8j5IIffhR6TsflGT5xSy5qin2og0PPSY8D+jTij4DmPqMhBngnn2rzpoB5bZ1NSpJ
         ROcKGeQNU/0Zm+B6TTBDlegnHv1rd2WjpROBA6xkGhuC60gjCIYXc5kcsV2Y8vn7qbV0
         gQmPmH36xK4MSruGGH3hCxGJfdTqt0igK1PjzxV+o/gm7ScehgIuncfxP9+3Z4lGjxQ8
         fr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=4NM0BUFnblUvTDNrPMl+FQqIOPD09qSOUnJNblT0N8c=;
        b=rVV0+hYghg34Po6RKN9QnjBpV64kEHaW2B2ua8tL/OFlfDf0lpMnPxCbqClSSbnNRK
         /NUlqL0uAks+B8tHLfPQh0LG6f7sUfF4WRMsSUrX5pjidvF4eVre3hID8XW+rNmyzXEM
         /9dg4iyYN9aSEqBaSp43fmoNB4IwocjxjfI6SNfl1k5ZtnabyT0AUNc2IbYpM39sGc7W
         bjSgSCCz6RvgnI+EHae7xoqCDZijZrQK41uQ/WqBU8cuZIfMJ3HpJ1FOI6rcALBTPV6X
         g/XotInrZBK/nISO8/roHJBxLc/Y4DqJhlJGRCiht+ad3RqJS68NsTEBvgt5Eh1LzcB8
         ZKhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+DU2K73;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w9-v6sor3998351pll.21.2018.06.24.15.45.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 24 Jun 2018 15:45:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+DU2K73;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4NM0BUFnblUvTDNrPMl+FQqIOPD09qSOUnJNblT0N8c=;
        b=M+DU2K730gD/9nB00l4pK7pykk/tG+GkY01G2XZPAqvAzOHKiW7XJlSn8hjVO/cxN5
         IUDw3vvppsN1HQLvtTUw2vPxbMBQ6nGw63CTl3Kcivv8kZ9HXadlAmWnf9st2nmmPey0
         PTtIpn1ANyQj7W9sGk7GslNEjmfqtHga6d70o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4NM0BUFnblUvTDNrPMl+FQqIOPD09qSOUnJNblT0N8c=;
        b=LhpOTBtNj2PDQObHQIREeu8CTkqXjUcdbZDMC+FBFeT3IHSj+X6JngSLqkxsEE4IWF
         T6wT+Qjv2/6NqXM6mI3qVSR43N5wtbsLQw2FzfkwYJcpfwy1uNPtJ3qFvA6njlwYD7kM
         dKyg1GI7DfdB+eAd9O83Lv2smNW1jNNptqKWhpWyRIUDImQYA/oibVDFlePElrL6tEdP
         cPBGyuwHR/Vec3clGOEHYgTW9A+QTdKCw9LRqnwIbLL6WBOD/jZ0nSMeSot1OhqxjIqW
         t2RTgpwW+UHSZDRglLnwx2aoTaY9GWaIiZAsyiLuHB2ptlLM36yNCJXmTbFjRAf64BIv
         BuUg==
X-Gm-Message-State: APt69E0rThEFU2cIUlVnMUqBgyqzGfu15XmMGQlFGK9s0wtHKwjtVOcp
	pY6q15Z7+cFL1WTG39BMUA72Gdkx
X-Google-Smtp-Source: ADUXVKIQay2HhLabEMTwn7XN1SmMzTb1VqinISoE5ePmtTdr6pXFhi/m6v3+8WepbSndy7UlmK+CZQ==
X-Received: by 2002:a17:902:b611:: with SMTP id b17-v6mr9852072pls.284.1529880305027;
        Sun, 24 Jun 2018 15:45:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id o72-v6sm23199078pfk.76.2018.06.24.15.45.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jun 2018 15:45:04 -0700 (PDT)
Subject: Re: [RISU PATCH v4 09/22] risugen: use fewer insns for aarch64
 immediate load
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180622141205.16306-1-alex.bennee@linaro.org>
 <20180622141205.16306-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <528feb2f-10e2-5acd-485e-fe3dc8afed17@linaro.org>
Date: Sun, 24 Jun 2018 15:45:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622141205.16306-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6dgJpd9mf1J0

On 06/22/2018 07:11 AM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risugen_arm.pm | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)

Ho hum,
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


r~
