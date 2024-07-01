Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1321631njm;
        Mon, 1 Jul 2024 05:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhZ0XNnxDxVA+fklS0Xlp+mKcP68wsQfDn01LpgmRkWOuE+lTL+zfi+WhNerL5XhHb6SKb7iZCjlJ3UXwJIwnYHuVtNVIB
X-Received: by 2002:a05:600c:35c3:b0:424:9f28:22ff with SMTP id 5b1f17b1804b1-42579fff3c7mr33928375e9.5.1719835857522;
        Mon, 01 Jul 2024 05:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719835857; cv=none;
        d=google.com; s=arc-20160816;
        b=YtqdpGyr3eDsqU8t/qvIS2qffyMsW0MBpeRn1KS3VhKwyB4GH2QzNDHQKoQSE2oboi
         nKcmIdPPjLtSvQIwxXbl8K0JrPVLSHJloO7FYlHevLkxpd22d1gM3ygXRkBV1OKekxJq
         jFBDNjScy7kPe1lIOFzL0ZfhiIpni4Sq5V3MkozrEU+b2TBSsAlEjLkerc3TcOYkfziT
         YjbTdQgieViSMtaw1/bGrhhYpTo2tWTo5joBtWOfE3w4KAdXOlBP2O+9Qyp0CDIWuALd
         DQdKsWfBYEEuie0A4qlMwZaNyAii4k01QcKiEvcqn+qmkYi3TbKQ/wFzbdLS4Le21Nur
         a9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZttrhoNCNlakmyB385PnUFz1M0dX0swYIZLIKEfToBw=;
        fh=ofFTH82mIr410mWkM4iE1urnbfoEwlJHpJ6rtnkSig0=;
        b=1If1baRkMN8whzeRW6C7QwwiHiSnJZwuClVHpaesLWOHK7etdUJudS+ZNePzi3DbwN
         0WUae9I4fqW0Lf2JjtFSU+53KT9mreDrlInyo0IHSxYwLyVgHB21MXQ6v7ApCe4muoGx
         MMF+dxLkqUmFDPmGk7zaYF++7Oln7cqymndYFN0Lv+rruOhZ2KFE1RpGaxveZ6ALiAVy
         fdnNSzLca1IiznJHfPRGeNLj5u0+cmqItwuL1KksjzaO9jy9PVaS4GWksxmHLIwUs/MI
         etTpgvYpa3V8Cn3KboGJApuCV903VKoNUxcWk5T1DvzcIedsKoLuYd0yiE76m7/X9rrT
         H53Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JMXVw0be;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4256562c524sor26870635e9.12.2024.07.01.05.10.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 05:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JMXVw0be;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719835857; x=1720440657; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZttrhoNCNlakmyB385PnUFz1M0dX0swYIZLIKEfToBw=;
        b=JMXVw0beOraprs67JihAfN6wj9Glwitx23XRCrrKKgj6pik21Ri8Jy3CYXZkrdWByA
         Iq2bc75a7aBJWWndai234WtmPWu3Tf2HQbco3BRla0TNU/L771NAW3p+xXEfddQut6et
         EjTDXA/Gc+VynkVZTBQ7DmUSPhZeW98VD9u+NqUKzf35n5yLy+BA8n/BmlEuGObUepVm
         zfQA8ZxXy17WyJ+FP1Y4ECNxvyalFOu/0VOD5Di6zBkJ3zGQp9AWlRJaBiit51c8gMOX
         Af6X8q8Hv464fHsIQghDDaiK9ySB0nYI9LNr3bdHdGf7jQgIDVGF8sf85LZ7aNwC+LRy
         ok4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719835857; x=1720440657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZttrhoNCNlakmyB385PnUFz1M0dX0swYIZLIKEfToBw=;
        b=KscSqkCIDmswj4AC6fSvluiNj88cRCs/gwVrz7XXKMRPPPaqM3q+bqJ1HLVu4CgvxJ
         a1WdotOPxWHKEX0Uao5s7IM1g5oX4l+x9RuM+wvtG4JZtv0ZZBMmtOvkmj7orHhPQYF6
         HEg2tyJmZ+cNo0FSLbYaRa9ADYqgMIY9MZR866iQWscl44VvKyjG1Q+hcyFlSZYWYIN4
         QJNOPnLBw6JWDW/7N3Y8Lj9PAghUEYM8Pek2TOhPyTRtLK/iBkompFdY0NningVhddt+
         Hnarp52kNZ6oV6FuWsrva50rot/fFieXZxZ8Kmn+rZh7PGPRBtn9EtO6w8AG9RShjEHf
         zdbg==
X-Forwarded-Encrypted: i=1; AJvYcCU3sD/bg63z8lvAWS9M+eKqIxO6Sk6TjgTr0vX6gWz2/mOJiIVwvxxxjLnXgaME2oRxgcB9m42okR9jvUk5IBLWG4XEb7xN
X-Gm-Message-State: AOJu0YxiyZMGiP5VbPNzf4LivTNQvkmydQzctGqfW9EcTV7+0N0zHFIm
	oGkA9Vs5l24Ccq5wJ30Dm4QqL1XK9KLqjblyWXm1Z//e62MAktxAc9GG8h6e4VKUvXNbLWCroY9
	KMaQ=
X-Google-Smtp-Source: AGHT+IHUaZ8mHX6jMu1b/sTOc7LuNFNjagB4aNHutN1ZgNgxAoXTptuoy/MGqaxBljH9wi3O+N5irg==
X-Received: by 2002:a05:600c:4205:b0:424:ac9c:71f9 with SMTP id 5b1f17b1804b1-4257a0282eemr31560755e9.39.1719835856986;
        Mon, 01 Jul 2024 05:10:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.177.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b068e93sm151981965e9.24.2024.07.01.05.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 05:10:56 -0700 (PDT)
Message-ID: <ae8a75ab-1250-4ac3-ac34-00121f6421e2@linaro.org>
Date: Mon, 1 Jul 2024 14:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] tests/tcg/minilib: Constify digits in print_num
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com, alex.bennee@linaro.org, qemu-arm@nongnu.org
References: <20240630190050.160642-1-richard.henderson@linaro.org>
 <20240630190050.160642-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240630190050.160642-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x0mNeyjcxVLV

On 30/6/24 21:00, Richard Henderson wrote:
> This avoids a memcpy to the stack when compiled with clang.
> Since we don't enable optimization, nor provide memcpy,
> this results in an undefined symbol error at link time.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/minilib/printf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

