Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3018136wrg;
        Mon, 17 Jun 2019 15:29:04 -0700 (PDT)
X-Received: by 2002:a17:902:1003:: with SMTP id b3mr111862817pla.172.1560810544646;
        Mon, 17 Jun 2019 15:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560810544; cv=none;
        d=google.com; s=arc-20160816;
        b=U8h1hC3TQUbmnYSuo+w9dluZF3TYbkvJECBCnHC5Bc+16e6eTdEGNiSlv6iJd/bhi3
         DDGinHchM1bSbwUYuLPl28iOA2HQp/hJ/d/p05euETcUKqs7/EBGRoa+09+OO1+wj/Ad
         ktpkQsULu/eRzFxsvQcGGRrjVYq6He+0Fs/ekUrNOPiDOtwxmCrbX1Vp/9taGkwHMcgT
         UAQIXr6gIOjY9jMuiDrQrnZ35XS29ZDuvgcCiDpueZPwNPjjV+6yCk2nTIVOCl49UhqU
         qn1JjBk8ef8EAtQ0i+CmX0xFZO+E8NeoeJTac0SXFng+hxq6CGYcKA0gvNyfV9RD2Cbv
         6aeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=9Wz6MQyJCuB3y44HQbsIau5eV98wCB0waHFjsbiRv5Y=;
        b=zfHEKkvGgzVgYjVDqcZYkv/RGf5Ha0r9aZgi0UHYDIjMSG+X6x4KSuUvZIPskHTYAj
         m26j5ILXg3Y04jJGzduZ5og7Ieb31a3zaJeVlIOr0C+HoJMCrK3rx0/i0n0TLtFF3uhu
         a1wmW4BDTAgOxB+wL6NE0yyC5CKHK9aMRiHCLVFtURnNAWU4C19qm3CHi1K6HLCXSAee
         z47G0libp5D/u+L3RhCMKzEBhWeXASFbKb9THMmeSrKxjk7UZEZBfQpbQ7SmTvM5M3wB
         cz6nB2YGhrzRHW2/Jt5hIldGwgUx7JK9HaV4yshzOtoLMXmPajB/RwcRqPnVi0x3bqWs
         mVzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tC+meekW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r11sor818594pjb.8.2019.06.17.15.29.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2019 15:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tC+meekW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9Wz6MQyJCuB3y44HQbsIau5eV98wCB0waHFjsbiRv5Y=;
        b=tC+meekW+dRLgmkAxfC5PeECV2US8LjFqStc//T5rSpD00I2jqBAM3Pe0KLXM05hLR
         wbqr99dnN7XTqea2IJT837KSsWweyOPZPkNnp7o6bxVyW1mlSniwSGMipigEjEYMaKrr
         um1yMeHi49YYLY4zf3/DvrMaxCyNrZJb17EeCS4LKM6B5+Jxq8V5ziw9vSp2Yr+FzFUC
         BLhBo93VH3jB7AhE9LBnnlD9XDoaxH2puqLVPIPZ8rbejNu7wdkAS8DLSAu/Lxq2Vew0
         vOoEcpfKDIFfFcxpNsp923Vj/WmKQXuqFuWtvjLp34Isry6sSyF5uqTzCOhyqcwv083w
         wjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9Wz6MQyJCuB3y44HQbsIau5eV98wCB0waHFjsbiRv5Y=;
        b=HcHeh66oocxlMQOqRJbM19vy6zQ9Bz16hMGlTMPbhr8w0VAij5we5v+vqRELvZ7MxC
         sPQM1lZgAIh29hbmAQ+oy5zklyzY7xtiW6ArH83nZqZ1OI4T8Z6qN/6s7SaUscEhmt30
         FgnnDmO2aZLK2rNuPoB+hb1uZ8VBuBuT6OEXC3qJxv5ArHS2cTUb+21yl1DDjoQcvTvE
         JJ7nYGpq+TXvUCZ7pDBx6UeZZrMMi+k6Mdb3hS/eexK1Jispl/AFpI7BxZYvGOv46bRr
         fpopB+6UiTPcxTa7fe66jZ8GEEieu4jsGAT2O225kqE3Fc73Fesenf8e2OHlFJNawqnA
         Ps0A==
X-Gm-Message-State: APjAAAVcJrE+RMbfak0EEsVN1iPw4zYtRAmYKdL5TXAypwydlrteGHpL
	XwpN3fiuDDgpFs6+4KAJriW76pnY
X-Google-Smtp-Source: APXvYqx8RqUxVjdJj5HH7wCZTx+2WVb8l0oS20j8ae+zl2VX4lNygfxe5gEpe0HZL/lqIJXE2tsfqA==
X-Received: by 2002:a17:90a:bf08:: with SMTP id c8mr1451438pjs.75.1560810544108;
        Mon, 17 Jun 2019 15:29:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
        by smtp.gmail.com with ESMTPSA id h26sm21564112pfq.64.2019.06.17.15.29.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 15:29:03 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 26/50] target/arm: call
 qemu_plugin_insn_append
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, "Emilio G. Cota"
 <cota@braap.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-27-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <690729fa-ffc9-179e-28a0-451aac89c6e5@linaro.org>
Date: Mon, 17 Jun 2019 15:28:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: F7dVLxU7QSiz

On 6/14/19 10:11 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> I considered using translator_ld* from arm_ldl_code
> et al. However, note that there's a helper that also calls
> arm_ldl_code, so we'd have to change that caller.

We should in fact change that caller.

Unfortunately, the SVC immediate copied into env->exception.syndrome is
truncated to 16 bits, which means that the aa32 0x123456 won't match.

However, it would be easy enough to create new EXCP_SWI_SEMIHOST, generate it
within translate*.c when the svc immediate matches.  Everywhere except
check_for_semihosting(), we'd treat the two exceptions the same.

The BKPT instruction is only used for semihosting by thumb (and maybe only
v7m?).  The exception syndrome does contain the entire 8-bit immediate, however
for consistency it might be convenient to create an EXCP_BKPT_SEMIHOST so that
all of the checks are always done at translation time.


r~
