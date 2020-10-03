Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2335873lfq;
        Sat, 3 Oct 2020 02:52:28 -0700 (PDT)
X-Received: by 2002:a4a:af45:: with SMTP id x5mr5127965oon.86.1601718748583;
        Sat, 03 Oct 2020 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601718748; cv=none;
        d=google.com; s=arc-20160816;
        b=lt75Nwq71H0JXV/3gsRscP5umUqSEmi4W8azKeqZ3ekVYX48cs0EiwfFVuBso/ndcA
         RDNI970g8/9Q6gJLcNqyv9b5fMDMY980LljlG2fK+HSEjbuLa6wNCZqDce0YPE9JyRsu
         ETTHSG8d0JIohf9icQ+/I38FDjQ2zv7H+TD2WWq40lQaof8RVu46cruvW6G0cQdd3a32
         PQo/UDw++Cgf86Syf2vzPwZSKp6+4uhrKsYXy/5ETJw7QfZ5xGaQnvRTbVvEgufblHo6
         b/+thP14qE53LzKbaClzvu5QuE2y5fvrDbL6cQPZMgOeIaeWkk+q1lxnZpO+mdrJZLjZ
         RChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=dI6MSQceoyGQyNafcDDo8z39Xp3NtkmKrboZO4BdFlk=;
        b=s6W1zpLxWazH764EgpAZGxNou9P2ivVW9iHEtVuY9V5qlqPONjzsnbQ5KB6Zbe/5XK
         gxB5b8dIXALxnw2QYgmEItNbtd5R9pWNlLPQtiTbWdZPkSXvn+0Osiu3FvKZt9nJymb/
         WmP1RSf2qU7IuKpqeqYgc2oKqxtz4iLU5S4epGC2ZYb0J8vUi5phpvh3DmpYST8QtbzF
         kKwtBsm0U3UnheBnqlIz1nS0wVuObNsdzDOaUPDZvDV/NQFS3oHhVxbq5XB0FV8TN6SS
         nJE4qRR2HjSBD40ddr19q2OdvZWrbtRNx7tq/DYxL/0VyW9PUHSxKW6W2RvRzGwqzLDn
         BB4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AVr+lCE/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n17sor832242otf.116.2020.10.03.02.52.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 02:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AVr+lCE/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dI6MSQceoyGQyNafcDDo8z39Xp3NtkmKrboZO4BdFlk=;
        b=AVr+lCE/snv+lozpJPbVz/EkxCcF0kdHV3N5+gfeT20nS0trBBohCQvjOAEqCH4Sv1
         sWJ0AQbReEfOZw+0K2ysVziBRY9bm53Z+ea9MUOPxph+oNNMgQz1m0qsLLtB9fyeJyHg
         MIjd55Yoag32Grnx7P/N64EciS/fDgCMkvA/LVgaxPRuJEjQpD9yBUaCLtGN3ZT/blsl
         2fCU8a02Aq+ukFN6WzYxtG6U8dKqegI4GjzYtKmz+i+p7daZLRBEgFz9Kwrd29u5ke++
         I1kCMXfkektIkmbnFAqOQlo3Y/vEyhuXvHeL+jSL5OfFOAImYo+x9RPMlWnAeFnzbkKB
         U1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dI6MSQceoyGQyNafcDDo8z39Xp3NtkmKrboZO4BdFlk=;
        b=MuHAxfHFXBWwJ2zXNs//sMFTZgDEljqUOwomBAPA8J7Xj/u4XNenJRZegk9pzvKWx2
         OLO7Uoj+NpFvyw4i60MURz+WW3EkCUql5oehXungkzwhhJpNZvb/eVaNz7KRgEu2BX2t
         1zJt9lwWQDEXeRfNom6lfhedNnqCP4q396kKKcQvBMnMNxq8PweeCv989Uz94+il/htL
         jNmBppsr8LCzKE3iMYFaEpQ+if8gq7UasaPKGNyzCo9lzPXGiSWkVv5l2QPxUV3e7fCZ
         rvJ3e7mWc2klNtLM5PU5O7jsR9nUxamLaRlmrJPvcMMFUJjXxcCX5DvYtPOqITUXVUpr
         rHUw==
X-Gm-Message-State: AOAM533kPsFCJrxjaYPyOB35YX+M5+twXxBR/f1iUzAqCRm2hwiU1sGn
	FdhDLXSuvfu0cOSZvbQYmm1Y687h
X-Google-Smtp-Source: ABdhPJxD+MErIQ5oDaFwq19v45SWlpim50VTqiCPIanBQsgODnWQ97qXiW4/uYJQvwb9yxEZEhm4Wg==
X-Received: by 2002:a05:6830:188:: with SMTP id q8mr5046280ota.278.1601718748230;
        Sat, 03 Oct 2020 02:52:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id i205sm882668oih.23.2020.10.03.02.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:52:26 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] target/arm: Do not build TCG objects when TCG is
 off
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Samuel Ortiz <sameo@linux.intel.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-11-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59ecbee0-3f6c-d63a-13c8-01b47de4c78a@linaro.org>
Date: Sat, 3 Oct 2020 04:52:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3eDyVL9qJl7b

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> -arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))

Aha, so you remove the line in the next patch anyway.
I suspect that you can not add it in the previous.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
