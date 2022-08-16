Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1496819ejf;
        Mon, 15 Aug 2022 17:36:03 -0700 (PDT)
X-Received: by 2002:a17:90a:8001:b0:1f4:fe95:c420 with SMTP id b1-20020a17090a800100b001f4fe95c420mr21564902pjn.146.1660610163020;
        Mon, 15 Aug 2022 17:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660610163; cv=none;
        d=google.com; s=arc-20160816;
        b=tqiFyTQD/jh6vZraMpgqj9YttXmlZ687G5v2Vv6rndtk90iP1B5dgcVyiMOmpDRyrT
         iMHe+Fw2lalenKyL2luiE7Lw/Ghq5axKxhO6UkxPUpvvsj14JUs08IEFJ3bGcsA2NBxW
         jqyiY9gsIMSUKPIiVBA8Ew1DsbGX2/jGIgz0j4pNqTJ9rOwqrum2T2sXcfqZfdk/Mgeo
         cE0IKSj4VclqP5J745Gfi0Zeo7CAXcXX7fvxYfiZvc2OBHEkpKSr277aZ2U14ByCj2h4
         0poNqIUxnuDc+IeMmxAFBRExJv3bYAi608GtMajC5vNOtKn+hR6YYO+l+Zoc0rXDey0b
         A2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=QE/9zaBaF5F3Z7zm+3XawoZwRFsR9FjiJhlar80nXaY=;
        b=JYiuJo895Nqg4HsIIKeSQEy+8TvTm+BleCaIbvRqOWKbFe4E8U2JyXsk3HJqDwKsgN
         kVnmBTtWr1iYgNWncRLBQYpG+VVNeqth7W4znI/sGkpp79ffpi11gM3CnCXw+AM73w8O
         8s7lhOemfmP9oyrGoU72rkmqjwc8I6aZ+1L6o65QOK4MCvWCZdxFHDG+UdOL/9G2coKy
         yZU2nTuwtPdP8GWGVt1rvlf4Nq1S6+l8REBiyO/VjfriOhg3VjRiCJOIi9T2LVAkneuI
         +OV0CdWmwoxvnOjDz1w+VwUq4Z2UIPSSJ3IrrqkgylL0MVlZYUByP5U+71s0maUgUeWO
         0mzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="GJ/E3j7c";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h17-20020a056a00001100b0052d98fba9b7sor4991725pfk.35.2022.08.15.17.36.02
        (Google Transport Security);
        Mon, 15 Aug 2022 17:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="GJ/E3j7c";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=QE/9zaBaF5F3Z7zm+3XawoZwRFsR9FjiJhlar80nXaY=;
        b=GJ/E3j7cJvqHbAfvEiCmLtt/DKIol+QqbaqLtTQseb5KGVXUOC7mdcwXJEoeMYEBwi
         pssN8KgzzlqiS+1hopRozMbCi0OPgbBkqJ3am9KKqDZmRXb3POzhd8+pGXns7nTfmSSK
         6W3z53XAZ3yHOmtbD7TRgGX/0H/OmB9T+2+9IR6UKljLWteWYtRhdqJUE++ELu38PLAx
         MRKYf11QjQGQxv3EKNFF7iyCB0Ls+vDYd8XEf+AcHN859eKYDBQhug6eFJmpeaA49Mj4
         c2k9WBjQCxONt+/5uV7fvvCILe2SYDg0vcCEUmHLLnjGPAa2qujPoUBYyjUwFzNPfGAr
         zzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=QE/9zaBaF5F3Z7zm+3XawoZwRFsR9FjiJhlar80nXaY=;
        b=D/cYS2n6H0v39UNeCUgEVa4xQVCyM6Ki8SvnNNKvI8KCeGdomvcqDsbbZeqfQKSEvZ
         rNGEKXJBnQ/9QjWyzlVFujxooNGfOUqFYZ3u+mR55f3iF7evJJzeB3uSq0/Z4yWBGw9B
         9KK9FZxRutFWSVt7mtez48kMSGSS3O3XMeQsM+vyUjcqT56Npypp02KFqZto5yZvF8nY
         /r5ZBqmWzRnAbNDe9ivi/V27+KFvGcqW51galjvPArq/hSZWxB4e7FhOcdTvouofrXUb
         BcMzlwo0Q+miZhIevVx2qONqFWPElVvTV+z1XacUD8PjMjsj7bCgYDzuZj9Jf5JrvOyq
         NYnQ==
X-Gm-Message-State: ACgBeo2kZv0IYtrLA0NoMnOlCTLRMmFQU9fds4liDhpUbKAFpQVSsqON
	ncEhBZxFG1jH4ooLFNIi3tk8Sxgitnk=
X-Google-Smtp-Source: AA6agR7CCRrGYasklM4iFsXHXJzChnMwctQDqoOZKxc6zJCn3QybU7f/vpu5k/djBA+I8tQD8iFIYg==
X-Received: by 2002:a05:6a00:2409:b0:534:98c0:e53a with SMTP id z9-20020a056a00240900b0053498c0e53amr12159441pfh.11.1660610162312;
        Mon, 15 Aug 2022 17:36:02 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id o14-20020a65614e000000b0040d1eb90d67sm6296479pgv.93.2022.08.15.17.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 17:36:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <5f5cc9f0-65b5-20dc-eba4-b6895a58de4e@amsat.org>
Date: Tue, 16 Aug 2022 02:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 6/7] target/xtensa: Honour -semihosting-config
 userspace=on
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220815190303.2061559-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8IRzFjuDj4R4

On 15/8/22 21:03, Peter Maydell wrote:
> Honour the commandline -semihosting-config userspace=on option,
> instead of always permitting userspace semihosting calls in system
> emulation mode, by passing the correct value to the is_userspace
> argument of semihosting_enabled().
> 
> Note that this is a behaviour change: if the user wants to
> do semihosting calls from userspace they must now specifically
> enable them on the command line.
> 
> xtensa semihosting is not implemented for linux-user builds.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/xtensa/translate.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
