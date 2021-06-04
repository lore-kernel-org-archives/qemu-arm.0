Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1490689lfa;
        Fri, 4 Jun 2021 14:02:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id g15-20020a056a0023cfb02902d5302edc77mr6565748pfc.63.1622840549058;
        Fri, 04 Jun 2021 14:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622840549; cv=none;
        d=google.com; s=arc-20160816;
        b=nBqP7P9ZjJeX8ckB4giSwZPreBEfdAunh5tUWb1JhwopkLPYmnd/jUhweqzKebjwJc
         oQqk1++9J5C1D/LbAak/1fovrCTjQvUgg//S6x7Rbbh5iAsticbBRRh9RnYA4UKBsOlM
         ye38fROq8UgVK0S3Y0HD5SFyf0RHEJMku0unHRjvTBWXVHIJuENCT/dZHtaJJExaQMwE
         8ZjkRil9Jn22Y3Yr2fHmBZaflAFGrsHXaB5pL235T7vd/9WDmin0c+Ocff9VtPang7LA
         a2uku2PikyG9RAcBXCYGS4eNez3P+rHOUgCAygKFUaF7q/tQHthPNU5R0P+9QVVlEmgo
         I+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=yvTv8Y8/BdcUEM7ioKdAIWlmTM9pFf3um/BRm6uVHWc=;
        b=ovCjGQ7FEe8jh8dgw8KvHOLMPDxQ+KSlEvpgphctXkvLAK2Rs64yFGOhrgRevzrGz2
         JaVrA+FzbKPNf9Q2AJsTuBtzRecSRcE3vWdI/f3aM+ki5YiO9shc2rfkWAY0vWTM1UO8
         7koEQLgRzPYZ10l+yFCIymejYuZuomaFIWrpST+EBvrsYrHlqs2FBIVsM9iDZc+qQARc
         LXic41L6Zi2ncweEMTTiO4SS6QM0qLMBa6xWntJol5EUaHCbzP0A2wxQMInNLPad8YjJ
         u0faZvUsQq1WPxyZBYxmqgn1hZooUpj8cA6IPw63gfd+uGHNPXOnXzG9ZVBlyWN+Hhyr
         0sqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZqF1MQ+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p16sor4255545plo.27.2021.06.04.14.02.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZqF1MQ+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yvTv8Y8/BdcUEM7ioKdAIWlmTM9pFf3um/BRm6uVHWc=;
        b=BZqF1MQ+mTnSvclflnCHaquHAXrcrUU06XSvYMx0Sk2JndQzh/HGugK/9WZvSx+C5N
         rPLMH/K1TnwSjdd/sKnKZrBCqAFr55CMa7uwReinTO2lE0y1GsYZbgSA6xj38E/vwnP7
         EFtDHpBdPGoqyfitWQXZi3fvpfR1lu72NLRRWEsc4wVXvASIe5tn/jnJe+CZp5nEPKs7
         9SBOXiDPmsuodKx2nnFO+VoqszUVnribwy4dHV0WhZIvDu10WwSoPC82XKTXSkJBf1tm
         +yjJ0nHZ4NazJZKBE65sFkewwpBEsf9voMCPiyFjIkQvjEfaAbsflH6oPsi66Los60Jp
         m5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yvTv8Y8/BdcUEM7ioKdAIWlmTM9pFf3um/BRm6uVHWc=;
        b=AfZvEOcYRLU2v6w96OILK+BV02qleDd0zya3jXaKR0JU2pEEQ1IsLAFAAjE0czU2Wp
         pZgVgHOfXSagPZTtFdY+fDRxC1vWfmLRNgN0pD8GTgnK7HJydNa/e3kUI2dxR3K3D3Ig
         FA20A7rXezSTn7bRxBRYdmeba03y2k2y6D5o9Luq0S8jWozWFLxeJKwdMECgvfK2AdKZ
         VcZiKi7NpUGMkOppvzheFQ2aRORxUOsCIFRKRkJlMbpdnC478dVUI1VlcuIT75DibD0L
         DXu5/kcLxfxz38eg4ebxqcNGgbQ62re5fA4wdNZ2tZ4TEZHQK5IgPTTEzvK2mH6TdVkM
         ni4w==
X-Gm-Message-State: AOAM532YApyjb3NGUoMhjkUZFnw4YQkk1lH2KyYV8TkbX+gYnGj3XkSN
	/OzycQpEIcY6r5F7GzmCOUXwG5wq
X-Google-Smtp-Source: ABdhPJyF2bOdx1MnO/uQKRzIl7jOfQhi6IJiNs6VWXBbzApE4VZtKhOFYfyCVpnpqJ1tH7j2uGlcDQ==
X-Received: by 2002:a17:902:ec8e:b029:105:5ab8:609e with SMTP id x14-20020a170902ec8eb02901055ab8609emr6203130plg.55.1622840548554;
        Fri, 04 Jun 2021 14:02:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id a9sm2710172pga.43.2021.06.04.14.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:02:28 -0700 (PDT)
Subject: Re: [PATCH v16 05/99] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10d89e8a-c777-c1ba-f62d-ac3553c98d93@linaro.org>
Date: Fri, 4 Jun 2021 14:02:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: avqswVCkVh55

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> The sve_tests_sve_off_kvm() test is KVM specific.
> Only run it if KVM is available.
> 
> Suggested-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-6-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
