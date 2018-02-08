Received: by 10.28.71.27 with SMTP id u27csp8826wma;
        Thu, 8 Feb 2018 14:39:19 -0800 (PST)
X-Received: by 10.107.11.85 with SMTP id v82mr869778ioi.28.1518129559347;
        Thu, 08 Feb 2018 14:39:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518129559; cv=none;
        d=google.com; s=arc-20160816;
        b=C1eMMovSQVWmjoW9JWwj0ogy1rvV6iJNyQGs7nEBTWt17VY4ETLx7p/9FkIhGSHkWt
         LJ8w1Tt+PXy+PvFQzCFDfriXLuKe6eEpNcyTgFPuuU3M71z1O2G7u2lph+erSGGbXitL
         ySEl9XHv8Ggr8RmWU+y8aJPZ1wNJxam+CO7Eqcqr+U5kVVvXp9kf3qipKbksj6uB2cFz
         lLNxcrjK4p927L8q1ly1MYoHYYm3mgC5e6qH8G1psgT6Ss6kKc+iWPOh7smdy8lCEG1A
         FkwmIbw5e1IilpM4wdPhHAVUEgH3SVAb0To/e1WEBpBNqC8zd1jRj3p4w7opKhYBkzqK
         XfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=2VXikF8Xw6vJ+6+kgeSXHmVnUM5JTtt3Pyy2a7xEcKI=;
        b=bH/ZH3Y5slHPVdYQ7uN3bBo69eBxMctqD+mTkdVCSLdkPoLwshWaGOhnksgEKq16ow
         U4PvWvYlW1OGiiX/g7xbILTwsu6l5xHfqQbWBma222m6fbECAGesIul7ts/f0G6zkF0F
         BLKZwWI4Eh0C9asNlh/8NXQzcsnMJRQXwQ96VdhJQP+r+LMMj2nTEsqfrxJeJTnMUbvB
         Dh6TAeP+W0VZHWFklZUImr7teRDUlv/o95eUlrF+c5yOEZYCnQ+OrkmTwVAi2yHHZZBX
         L7vnYqw6TzHR/OTJZxRjnl8gCKFjr+Q8R16m1js4CxdQEKNbHY1GV7Z7ft4NM0LamSFY
         U7Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O8iYNqwZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l206sor655981ita.100.2018.02.08.14.39.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 14:39:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O8iYNqwZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2VXikF8Xw6vJ+6+kgeSXHmVnUM5JTtt3Pyy2a7xEcKI=;
        b=O8iYNqwZov7/pyjs2chM/fDvy0F4M9RKjN5LtRCG4Jqn2dvtWIM4+ZCvsy6dpONJO+
         KQNh4ReNODswydxIjI2DPvzy3o9EwBi67bPPweRNUkiNin+J0OWNeM01KBZ3DcEDDYAW
         JhnrMBW3GzX1VF8fYcaTgB+uUMAvIWHXxJPzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2VXikF8Xw6vJ+6+kgeSXHmVnUM5JTtt3Pyy2a7xEcKI=;
        b=qPExuYoqvPG6KL0M4l7qhp/yuwh1/AeCtTfEatdx9mJ6bMIvpeu74gvLblHS+CbmLo
         N81+Wzut0nTWwzoYwfuIVF9+C62xLF6/7LfSgB6m7/o+4VWoufx2MXI1JDjNBSLoJgMZ
         2IwvqqhsgZpf8Rq/AqDROyAqLioLNBJkXraPVd/EiQP9Wcw/LukCLheeceEBJz5d5l/n
         gjSdqAqL7b3V7qCJ/F5emnMxStlBCvnAJOkifZX7Wk5awMgrg4lxTd3Wr/zN625FV6mT
         r2Q4P9MhFXA4em5yxm4kqw1nqszmEZwuOJqhMli70MvnQ8/3Y1leAv4niKnhBNGWqWI3
         nPlA==
X-Gm-Message-State: APf1xPALZjATkb16wZcPkuUU/IkXoUV1ShXKlG8bj56gFMNZIM24BxMJ
	uNFrF5EGFyDRZBLLbhaJvb0WjxaH/LlKUQ==
X-Google-Smtp-Source: AH8x225o2SsJzSV0VGE1ZtEEiQasNAjR9q/SUWwZjncW+BHHI8ZkA9xtz/NijlBouTAqWTIOSNDhVA==
X-Received: by 10.36.178.26 with SMTP id u26mr1022974ite.4.1518129558851;
        Thu, 08 Feb 2018 14:39:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id m16sm803349itm.12.2018.02.08.14.39.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 14:39:17 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 20/32] arm/translate-a64: add FP16 FCMxx
 (zero) to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6f98bba-04ca-80f6-1fad-cfed416f4127@linaro.org>
Date: Thu, 8 Feb 2018 14:39:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7/XrJGMrBo/G

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> +            maxpasses = hp ? (is_q ? 8 : 4) : (is_q ? 4 : 2);

  (8 << is_q) >> size

?


> +            read_vec_element_i32(s, tcg_op, rn, pass, hp ? MO_16 : MO_32);

You already have size.

> +        return;
> +        break;

Unreachable break.


r~
