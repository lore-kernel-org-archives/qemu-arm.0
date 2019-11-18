Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2571630lfq;
        Mon, 18 Nov 2019 00:43:39 -0800 (PST)
X-Received: by 2002:adf:ef51:: with SMTP id c17mr15185732wrp.266.1574066619893;
        Mon, 18 Nov 2019 00:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574066619; cv=none;
        d=google.com; s=arc-20160816;
        b=HogibExEW+FiOFZKaBYWm3EZAWRSc2NT3gv4poNRnCzbyqAdt/hMV/mWtJPzrxZtsm
         5eM3UotuuEXTXpjROx4Id69LQDcVPnoT+5Nq8hB2L7JOIYo33NHWdYf+dqESFEvS6ZiO
         XEd5eH5Qpm/uVmOaImbbZHPP4xmYRCu8BCZS8eGmCqK36SVEnkzUo1sIsXbExobv+ZEm
         ZGYEiwbL2oIEvmh2byrFbd70c80x2unJt0idJvrfPrXGYPw1RV/i8x2cWsx2nYMg4jLx
         lEQdg77Nyq7nmUUfJ4Yodvyj4JltrLpKKNj1CQvc9M5Q029MuumS3DKHxgP0xaYQIGTO
         161w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=OThwzwcmfVdhWRvXT7ysvqywDTFm+pWTsMJCbHwbx5s=;
        b=XSdI7KfxD3P2xZhBzCk+1U3bk2sdyVfWZO37n2zoyceL1Nq3t05WZPvBz90FJ9nXS2
         Shai3IUUhVCaji6tUMn9zYD4oMgvp4q6O28EwVr/oMPe9/XtUfSMyCh+oQaINEX8tijK
         U7cRZ2qxDJx4geQPRJczMr3lPaAhJijVUqtWJ1XXYsW02nvKrcdF7ymDl3pevo85GqD+
         FvXZK+Bm2rIBqqW5JSgY2fltt8uyFwPYtS9vnGubvn25ZmjMeWmjdlg8CuHqJ0hnbVAP
         4D6SS1+thQCVVSe/QMjEcaXIHAHuKXVbJmajNXXwrIEBkQ23fT2MBcNkEM4NB7Xdd5QP
         uIXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U48cRy6m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d128sor2998853wmd.29.2019.11.18.00.43.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2019 00:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U48cRy6m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OThwzwcmfVdhWRvXT7ysvqywDTFm+pWTsMJCbHwbx5s=;
        b=U48cRy6mRRZweTCUpDWLJBdMBfqFooq/U5oMW5uYlHcnNPb8hHlnQICpqnp1LLzT4I
         Ehvtax1UK7zN2LV7iTJiwsqskdppuqeOnO7JJRB3+4LuuTGyh4IJykmFGcjfsPY8UKnD
         FYRUPXOm7Oa7wO8Qlw1md3zWdHQHh6mh90+k0d+H4lF+zgtSaDlgihs0YeQHgJcBCFIk
         zlnw3joUmj4qcpTfsHPeecdwfqT17xm7sq14KCbkXtVk0XLXQVCK9KRnLN/hqaRxLy9X
         /HZZOOE5waPwTjTnWAQNqUvsHIxvJFjwZXMembiE5Ss5IhKtPMackhB7rJFQSAkoLXp6
         kOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OThwzwcmfVdhWRvXT7ysvqywDTFm+pWTsMJCbHwbx5s=;
        b=nVYFy249ar6nl1+1t8FjDJimXQehJjRN9fz+dYKBAj4b3dTqF/uPg89dfYoStO8pzp
         plAkhh5KbVMD/vCCwRVi+FsOxQG3GXi+V8WHwpKGwco7HLHtMIpGy5zneWvUie+Q9uXI
         c85sc4w4/JFuDVgd9SKjo2LF98LUPNtMpMUegP7FWg/cqV0yGsh2WItp9lD5aytqRYbw
         wyz2Ifnip+CGAgxReidiryptfzSomJq1wXymUXBzaBLntdiWYYnKjKl3xIiBH1uSAoDe
         rCoqtom4ZjiSvHRg1MirwSX4CLT+zvb26AGA29n80Iq7a9h7d+V6dcqU1SXSC5NGxQ/N
         972A==
X-Gm-Message-State: APjAAAV3I3cCgTWE+ZGACJRb5p/t1ABVIOzIJ28uFg11rQIoYoEOKVyz
	Fn9+CDlsTIIW+Q2I8i/puOQIEGMS
X-Google-Smtp-Source: APXvYqz20zl4rmnZduEDPX62eX094sM8D1GenICsD68Nju1I7JuHhvj1+4XOkVZ6N7PFZOPWxGNl0Q==
X-Received: by 2002:a1c:de88:: with SMTP id v130mr29402088wmg.89.1574066619549;
        Mon, 18 Nov 2019 00:43:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net. [79.149.41.65])
        by smtp.gmail.com with ESMTPSA id x9sm21554339wru.32.2019.11.18.00.43.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 00:43:39 -0800 (PST)
Subject: Re: [RFC PATCH 10/11] target/arm: explicitly encode regnum in our XML
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2778bae-5d04-5954-e552-9a426683ed34@linaro.org>
Date: Mon, 18 Nov 2019 09:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115173000.21891-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HyWMAEFWaKaX

On 11/15/19 6:29 PM, Alex Bennée wrote:
> This is described as optional but I'm not convinced of the numbering
> when multiple target fragments are sent.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h     |  2 +-
>  target/arm/gdbstub.c | 16 ++++++++++------
>  target/arm/helper.c  |  2 +-
>  3 files changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
