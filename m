Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5805229wrq;
        Tue, 26 Jun 2018 22:27:14 -0700 (PDT)
X-Received: by 2002:a62:fcb:: with SMTP id 72-v6mr4359828pfp.231.1530077234097;
        Tue, 26 Jun 2018 22:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530077234; cv=none;
        d=google.com; s=arc-20160816;
        b=NHaRwFhxChnuPdxTSvYibE8JT5P2sKGAFvqDwCVe65xXQWiXkniT98K0v5HEJExB93
         1HgS3ph/aj6ZtiZ4boDpzF6s9uwT7Sw+yrDAbJ1gGZM3zZSmbgnsaVI91V2yCg5q3Yz9
         5aSrnw8Ub+FfULeCEzjw9mPyWmtMXLZHlu2F+qq8nxw+xn2O3a0zDJkd5PX35BRnIxTY
         rNjDnRS66Zf6avAkBmxxcjVhBZ6XmktmLJihiSdaOl+l8xwNt5aOAf4k9aGFHujtOUMY
         BnAk0wQdxHlspI2sLCtEEsrtlC1RvVEpX8tXUheJTFiNGQMbT8p3k/cjGqIPsHV6I4DZ
         HDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=7nWS+GVB74gp1JAI8V9LwyLXio4GNjY8qiSfu1UJ3nI=;
        b=pOqROmkUSacfUkDFSXojbCgBXxWB3lLfYz1wo+fQu0iV9O8s3FLvGMnkKgTErotz01
         u46/B07uW5e46wkZkxmQ7b7euNGlcBk7Ftw1otr4fCu9b5YPcziMxPAZkxex1HgKaCQm
         lrTTSgn5klP+uDQaFpYBBCgSr1MeD7UgDgcdcZo45zycQrDzGohjIR07CNu+nrLtUwhN
         qVPXL0W7mUgt4Tw3gJ2U0y/7nMtzywoO19SLQhMmWvJL5bqXtI5JZXaLyxsyc/RlY30p
         3h/i+kPfNzNp8v3e/JaNfGaohwaLTQmfLnIsRPQdUco/9qU/Uy3mNIjrMFD1wb4gxHSw
         qtpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpYFmUdg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d5-v6sor1069600plr.18.2018.06.26.22.27.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Jun 2018 22:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpYFmUdg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7nWS+GVB74gp1JAI8V9LwyLXio4GNjY8qiSfu1UJ3nI=;
        b=cpYFmUdg9yRlg+m8vHIIsncRZzoHPVsa/58LV9iYSzHc1EBugoIZPJL1Wozau09ViV
         xJBuZMFA3pQPPndoLfpr2quyl/2JYxVDFUuaz4w8QszuBBPTxb4On7BwCeN51w9qLwNS
         osGkC0EP8PLNKXrFd2AZhwUCMiBlf2psCZJIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7nWS+GVB74gp1JAI8V9LwyLXio4GNjY8qiSfu1UJ3nI=;
        b=s7CwZ+V3TcceR89HTzymyZrcCA0B8m9P3v5AM/6vOr+tgXq9rWxZrRRFmgLR6QnokI
         e2NYJ9LfXPYolZ+M1D/horHdUrQVCaJV4hdf4sC2wrljyYXi9aYLEG3M22WFvf7FHc+7
         mxvWm+n+xX4sGJmPYVBA0Kea05Z3cNTVBo5Bo8gr4NQ09yKZno76RbP/CGSXzWOntnpg
         DPHqlLpRQSnyvSu4Em2GSeM0zicjj5rhvjyfgO9IdgGe1XASNIfXyF86rO/D3Bm+N/Gq
         pKwwsuCok3f+jEZl0qnJM267tGvB1pReDA/omc6ngq7xLM7e4UdRm1yDXtdTXVmbJYtS
         LTIQ==
X-Gm-Message-State: APt69E0169qoi0h+HnPBicn5wf0xXhwJ2fb2YzwtzEg+0dHSkV+yUCri
	Ky9XDtvfNRwsIC5JhWn3oStNwL+9dabIWg==
X-Google-Smtp-Source: ADUXVKKCJtQFJloTnE1OhRd7eRKYRWN6faI636+nfKE84TtPUMuYs0Emf39ZKOhFo4AOCbJHWby0UA==
X-Received: by 2002:a17:902:8210:: with SMTP id x16-v6mr4570943pln.307.1530077233712;
        Tue, 26 Jun 2018 22:27:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id t4-v6sm5519553pfe.91.2018.06.26.22.27.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 22:27:12 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 4/5] linux-user/elfload: enable
 HWCAP_CPUID for AArch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20180625160009.17437-1-alex.bennee@linaro.org>
 <20180625160009.17437-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a9360a8e-cdcc-14a1-2fd7-623faf779abc@linaro.org>
Date: Tue, 26 Jun 2018 22:27:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625160009.17437-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Hu/omZE85yRG

On 06/25/2018 09:00 AM, Alex Bennée wrote:
> Userspace programs should (in theory) query the ELF HWCAP before
> probing these registers. Now we have implemented them all make it
> public.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/elfload.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
