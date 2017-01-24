Received: by 10.25.77.65 with SMTP id a62csp1925109lfb;
        Tue, 24 Jan 2017 11:33:59 -0800 (PST)
X-Received: by 10.237.55.97 with SMTP id i88mr31734092qtb.143.1485286439102;
        Tue, 24 Jan 2017 11:33:59 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id w29si13844636qtc.100.2017.01.24.11.33.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:33:59 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id n13so27596239qtc.0;
        Tue, 24 Jan 2017 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=bX24UBFLMWzc3OTrIP8YezKiAjHGl2zrGrj5BJ05pIM=;
        b=m2OVIHyjez2HPCmCcvmw5AMNf9iB6ONxr0oeyXQL1Cj3/aYkDvwK8GXSJ9UmrYqBYQ
         J3ePhKxytVi1fHy5LveVrzZHcZdJzONZfTpS0sn4TUACDnf3E3k/k4W0LnyfdUlYS4Jw
         x9Nz72Nzyju1Bf++PxqGrNtETSGiD5rXOoHrqGfW4AOpklDZgYZ9Au7UVoxttzYh+Lds
         305fNfFtGVaNkmBZmRQk5phXvV73Kwu/I9SmOcDUvN3ggzAq7Kp1VFuWbEYaF4xVIROv
         JAt9bzKV3yMrOFYr0S4phEqau88wA6mfB247Yd6IAiGvPlMNUY9d3mAbVE6hvEC68nZE
         ngoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=bX24UBFLMWzc3OTrIP8YezKiAjHGl2zrGrj5BJ05pIM=;
        b=OjipoMckiG+Xbrhv9wme9xVHw/8NpfhO2MgNWkghXCpR+vgzrMFDa+l9tpu2Bq1EjF
         9pcbLOg2qECAkDkGxB3nrlrepOQnCHat5Fz9e8Bwoca/fcKZo2T6AmpQ7ktip9L1ohbc
         hbaNfY/T6zY5l1mEP7imQzkghwoavEanIXpVksv67IRCwNnUufdn0I0g0qOGxGvas/fh
         8MCGempCXE5wO2Lb9Z9omjdVidGOOIzry/XJ0UNGPmQZle2caePrfoVyQpdv2XBrZeET
         wu78PzKriPveLnwt9MRPm7EjVp+cR6fTHMtyLGvnfV3kAfqYKIDwsoLg7IeGiSCBo1FL
         odqA==
X-Gm-Message-State: AIkVDXIC1s0deFN/hVr5rxQimVTaj5RTfgLpV14jcUPEJw2mw8UXj3oppuOW+v/X8E7DtA==
X-Received: by 10.237.59.28 with SMTP id p28mr29597286qte.222.1485286438706;
        Tue, 24 Jan 2017 11:33:58 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net ([2602:47:d954:1500:221:9bff:feff:8add])
        by smtp.googlemail.com with ESMTPSA id e3sm16848371qtg.7.2017.01.24.11.33.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:33:57 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/10] armv7m: honour CCR.STACKALIGN on
 exception entry
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
 <1485285380-10565-6-git-send-email-peter.maydell@linaro.org>
Cc: Liviu Ionescu <ilg@livius.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <649a4b6e-2c7f-cf2c-5fb2-9213aaffd34a@twiddle.net>
Date: Tue, 24 Jan 2017 11:33:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485285380-10565-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: FCTzqEE9xGiQ

On 01/24/2017 11:16 AM, Peter Maydell wrote:
> The CCR.STACKALIGN bit controls whether the CPU is supposed to force
> 8-alignment of the stack pointer on entry to the exception handler.

8...

> +    /* Align stack pointer if the guest wants that */
> +    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {

4...

>          env->regs[13] -= 4;

Not alignment.  "&= -4"?


r~
