Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp244205njm;
        Fri, 28 Jun 2024 10:19:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6zf+NjMwF96gP0jenE8VL9+4lTCSunH32Vq8IC3OS0kPWl7z+0eqIY7Hx5skgHx9IzELY9HqwbaezuoaWWnLGn6BViZQH
X-Received: by 2002:a5e:8814:0:b0:7f6:23fd:a27e with SMTP id ca18e2360f4ac-7f623fdabaemr183892539f.5.1719595153200;
        Fri, 28 Jun 2024 10:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719595153; cv=none;
        d=google.com; s=arc-20160816;
        b=T/UDZQOVNqw1w/7HW2BORZR6HhQHYlxWf9Ra3MnUxd0SZZeskrVHQwvQoLrDMCUywN
         Fb4Cx8cmuwmV0P+3PMz2oZ5NXhipjKpW9kWIlUQaPykNflt/2oWR9cdDCqxSDSJxoTXA
         AR9qZTKDhz32VVlBVqZX72+vNyzYakDbvlc7hWDndlOqDZua3znBN5olaViObwSQ0K44
         5pXsNCjwCY4t280Syv9GkZBjyn73JLAD8MljftDUpY6DMqNHmfv1ZbEvwYbIcKQ7JziO
         lMnK5HgvvQe6fBlqwWfCvb6bGs3wiSTWImN9+APud29XAYpXReUmlZxmTj8X0yNBXiTn
         gHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=V35V4xy/avSp93x6rrBNSgluMeGbfDaOeyRAKmwsNLo=;
        fh=ZD2iQStybad7+jVCWaVXHJG5WgQoFUV+PkJ+FFzY1fE=;
        b=1C5TYUkUc8lPryhTQsmaGHZMfiKA3340dfLvDsEZ2fHg/ta/Py/eHaaxPqPzYqiRvS
         EOhweF0E/ZDB3zXUV887HW6GVUItNvVCXDTrLI+4CPNmAOhqoS8LssJZ23Wg3RjUuyb5
         NqlkiCxg96BdOXfBnwMX1l+YqUbS2gi7YDtNb5iC57CXPiAFrwFsXuQutPHJzb4pStud
         j2VyJ540716OPvNz2btFatgFW2/+bsugbyewpMhWBcX/T6iQpT5ycVpG4rly1JXepSll
         4+EYo7/srtwvEfRppnSVVAtb6KBnT6UiA50Q9daA3vV7DsAJc0e44qynzHBJ30OFtppX
         542Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQkLN4PG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8926c6da1cb9f-4bb664a254dsor864652173.5.2024.06.28.10.19.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jun 2024 10:19:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQkLN4PG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719595153; x=1720199953; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V35V4xy/avSp93x6rrBNSgluMeGbfDaOeyRAKmwsNLo=;
        b=dQkLN4PGtlKkJGpnhxWBAkm7aXGeZGXxOSw5mFEfQeWbdjFNYcU3BlgMAMijHrBzHp
         5IyuqDjapFLkmasN78e6WmCMtOsDPI5PqrcXFMCwT2l9SKKJUNM/MNmEqP2pTQPWNXRV
         VihHtpgJwykDWYj+4o+54sXYGSx69gKOVs+VIfP5Do8EN7Kc5mPniDV5qGwn7a8C/BNh
         0cI+fd0Mq9oAsqjviEaijhjpIFqdGErz7a7zvdkCX6WcC7q2sJzZtY2EDhwK/Xb3RR9z
         zeYCfqF6s2xhfe+cfeJW///UzFiEffSrgB8Chrijq6sJonE56SEgqjygCy/lGmscwhJi
         wv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595153; x=1720199953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V35V4xy/avSp93x6rrBNSgluMeGbfDaOeyRAKmwsNLo=;
        b=AjPGuqIhO0H4BoPtK83pRqBRjNnKOVWH/4sz+U3pXs6wYTSXLV1BhF1UBCyNjZ/auY
         DS2d+rtU3PJRC+eRgbiFZE2MYZ169+zY95ONDUDzPdycxIV2SP8lIAe/ZTCQsJKXXyl0
         goxMxho2FZ93GROCAaLDbX9fZ+cP02wB/awoXrD+pqsPlQ/kB1HsEOaZNWrxz9bYLCj5
         OYeqbYfv5jNFtVhBMGAcsbSjBa08uAw+RDRvSLeGWaTsmDtAb21Gn+RLwfZIxurpvmUQ
         u6SoxO88IVBIl8wk1yafId8G5ur3XlZWvBdBfDQhr4R69A8RjOBV20t+EvzitmIsL5AG
         is8A==
X-Forwarded-Encrypted: i=1; AJvYcCX+yEz/FbcTNRtsAnUcGGSPk7NhsmjCuORACKQoeSC+5hiHMPkMV4gyUV2XnbFvPHtV0hTOAmsUEh6jGXbVUuAnxIDsMm3W
X-Gm-Message-State: AOJu0YzicXBJn0DTK+AyJDyR8tsUwVQzA+3ZkdVv2b1bLb3Pte889Y63
	qNYr4XYtHWYxutTPYn8GeKqv3ofJxfyqm5gwESzhlNV99eooZmBfczlYoSe0GOiF1pT7hcULtMx
	cjv4=
X-Google-Smtp-Source: AGHT+IF1OSAY+8F7kV7n7oDrfcKXQ9STM/c+975JkjXEXqUClz3ahiBdjV/lzIwAvW8EjXe79Xs9Gg==
X-Received: by 2002:a05:6e02:12c2:b0:376:40f2:9b25 with SMTP id e9e14a558f8ab-37640f29fb4mr228440515ab.0.1719595152612;
        Fri, 28 Jun 2024 10:19:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6b2a1b1csm1537515a12.48.2024.06.28.10.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 10:19:12 -0700 (PDT)
Message-ID: <2438d654-dd76-4555-98a8-52d0fa006d08@linaro.org>
Date: Fri, 28 Jun 2024 10:19:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] tests/tcg/aarch64: Explicitly specify register
 width
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
 <20240627-tcg-v2-3-1690a813348e@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240627-tcg-v2-3-1690a813348e@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OyNnxkmr8x2t

On 6/27/24 06:58, Akihiko Odaki wrote:
> clang version 18.1.6 assumes a register is 64-bit by default and
> complains if a 32-bit value is given. Explicitly specify register width
> when passing a 32-bit value.
> 
> Signed-off-by: Akihiko Odaki<akihiko.odaki@daynix.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/tcg/aarch64/bti-1.c | 6 +++---
>   tests/tcg/aarch64/bti-3.c | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)

This is true of clang 14 as well, so perhaps remove the version statement entirely.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
