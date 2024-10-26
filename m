Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp254276njf;
        Fri, 25 Oct 2024 21:40:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:178f:b0:71e:594:f1ef with SMTP id d2e1a72fcca58-72062fdba89mr2961104b3a.16.1729917608797;
        Fri, 25 Oct 2024 21:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917608; cv=none;
        d=google.com; s=arc-20240605;
        b=Zl6UZg+09cnsCeefhiV4oXkeOg+luwSoLgTcHjdWeLThb6I37aQObuULVJycAOkZzp
         AfbkKtOfb8wSmOz2mySDRatSPaXaUUN182/AKuBGC6mI4a/jn5tfj+E/rOFZGYzZv09B
         sGI9IHVwpxc0J/NWPkduTH1XmAdJCT2R1cm9voAWgiyndk4gD5+xCyz/6hhJUbEUjTUW
         TB9aj9/pRAbt3JkYr6j1TPDFFeh92RvXss2tzwxbogo+qLDme2z8yAIlgPE5XcZLjRMT
         /NKvadex8m0TzDu+hmTs/sHHN1UElMRvr8PKXOXasKvhCwCebnoAfrHX1zeJQsMio2vV
         OeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OKvTzTd2ANidL74ryN8G09s4Libe61Whgnlswc7fVp8=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=MmvZGc2db1wz58OMXV78V/OlUsgL7Z0Xc2tKG76xHebX6miJIyp8aAL/XcDbNHJnml
         E/b2FlomOqzPyK+C1+E8Bfj2C8nxNDtaRenpWZpk/BgOq1vvhx3NnD07hBJpVIS7vq35
         oZ8aGXhHu9kSipIS1dXc6wQA4RNkOpIFkMCE3WzTsMRMd4ctNdGn7kJmkS/Y1dmm+rD9
         lEk3c5otg6oDG+AKuqTOVTTRpP3zRYgZrWoA5Dmf7/X/datDlysTTSHmxCTqhhXQdiy+
         EYjID4EupNQjX436fnD06SQxx3fUZS/+9eW7Qzyj7s+wDwOs/2NJ2JNOr/P2yVyOsUYh
         x5xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FO47pewJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72057935c3bsor1433221b3a.4.2024.10.25.21.40.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:40:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FO47pewJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917608; x=1730522408; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKvTzTd2ANidL74ryN8G09s4Libe61Whgnlswc7fVp8=;
        b=FO47pewJuJahZf1SP97iEY7sNqJWWJ2ml3Th8MdWZVUFvI0qKJESKUIpTCIeNAfEYh
         OKQZuzfslR5tRlar5uXGRheCeY4gIrZgUVUUhWrC468xTIP+a6LuJn55fEWED3GqntJw
         5kIlFpIX8RTgdp3Q5lilhB3buWLewb8bKp1PrJNQWzypSp5sEZZTva7NO1yp+Id8HQHG
         NQQWZFz8kCDIPiFW8340jPimcg0iYNrnHzvgXIZZ0j4ZghUhToH0ZwlSBAzsWqHabMtW
         tjzQvuVroNMdbu3fzDo0UxaX0gGFvKEr9nNNXj3SRMRdSdDa6r8Uag9+q77J6Sg9OXl+
         Fk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917608; x=1730522408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKvTzTd2ANidL74ryN8G09s4Libe61Whgnlswc7fVp8=;
        b=naBLWMCsDgeL+BN8WgcRnpmK9Th3hsPgU0sOBKs9YxrU9KVguFUTUpfM6hofwJNN1y
         oqyQhpepvydH/20D/4g5tQSGvY/PBqVOYCC4m8RdPHnmndFq88ufKiPgUhKPeSjkL+D+
         bnA1vSaHqM25f2PEqEWehUsercCl3NK5pMX1XAfliA6M7dm7by38jCLU0D6i/zSx9c/V
         cMiapMvGaIbAxPvYQ4+ZRZBB4BIq+jWwTcFJTwIxmyfnxoy9ZBQgLAtKYaoD536Vw3J1
         vAtsdDROWJQaHrMlohe+cvjlss5/FZHBwh4lAzBY90PVQr3fHMWl+uNWjCySQEm2GcQt
         bXDw==
X-Gm-Message-State: AOJu0YzacU5NXM7y7YSQ6ZSBV+DIooS6S7BlQL/WD69J+7PvQgpaGV1s
	0L3nHpfqs+zGfZwqEpa1NOrkOQCawRHRKKZMLfYq5I3A3XcwYuwhN4e87EiJYlFX7g==
X-Google-Smtp-Source: AGHT+IGcMwTrhA4GquFtAw/OAkU/5sXiscLyVf5o6L+IC0teyPNwdg2NJVY5QYBPMx+soAotXkJoLA==
X-Received: by 2002:aa7:8891:0:b0:71e:44f6:6904 with SMTP id d2e1a72fcca58-72062fd9eb7mr2854808b3a.13.1729917608339;
        Fri, 25 Oct 2024 21:40:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0cf09sm1952054b3a.135.2024.10.25.21.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:40:07 -0700 (PDT)
Message-ID: <3ba8e29f-0e23-4b8f-b654-8416b9725fa4@linaro.org>
Date: Sat, 26 Oct 2024 01:40:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] target/openrisc: Explicitly set 2-NaN propagation
 rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
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
 <20241025141254.2141506-20-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cslRzBNskrNu

On 25/10/24 11:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in the openrisc target.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/openrisc/cpu.c          | 6 ++++++
>   fpu/softfloat-specialize.c.inc | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
