Received: by 10.25.44.15 with SMTP id s15csp1219023lfs;
        Fri, 14 Jul 2017 10:33:51 -0700 (PDT)
X-Received: by 10.55.144.130 with SMTP id s124mr12485569qkd.136.1500053631777;
        Fri, 14 Jul 2017 10:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500053631; cv=none;
        d=google.com; s=arc-20160816;
        b=Mn1iZd9RLnhPDgKTHz5ie7vCb2Wzd/ivtNCYJK5xvqJSfycOv9FHHD2DNKPnKAphA4
         nRcyxz/kC51W82Uks+bB37UVSnMklXtwl1gIcDjadLs0r6RwKz9BTFkJ7oT992SwIKa7
         ykM5FCF+6poVSfb+BW0gWIkv6t3Sh6CmLqVR1mm7IUHY3kn3y2UZC7TQ+/9wbG23odZR
         qMRO6/QaMwOuLrflj8gPgfotXZ0LtNOLp6YtGDJ3DAdLvDcA8QFXvMt/3HFo3+J9LvlY
         WN+SlJGhks9X+kayDAZaYUHXwHQpOvpeP3ZxyzgxpQMLg0Mvxl6lve5c8P8pqTV6weDW
         GapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=R7LhIdmlrvym7Hh1uYTJQ+WySA5/hHpGpVyHxxR0FVw=;
        b=zcStOCDYSxVijZrthbnC4uzjIJNHKzAHBdY+LW3XNP0Wx3XDiJZd3cou4VgmMUAV5z
         IpwOZy+MBJZefviBDZZmK10D0be5vTiTAF1XzWNHZfRbKR0WsrQIByo0/Uy5EpdHcqCx
         6g6xMICO7ur0ijiFRk9zaYNAYinV+Nv+dSPw2xmiq3dRUGfQ3wkvMbe2ydqedDbXF9Js
         r1TKXs1SHCgZBnpRzWHtFAuwql4/127WVh6C00dTYTdIXdqS/bSQbMfOK01tddTqHiV1
         fnI2pBGSt6hykAUByQ17/0+c2PM2rFFkAkEeKcLSC1uqdEFz0d/oPvZ3HBkLJatixmdN
         +wIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=tmiI5cvK;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id k1si8388721qkd.166.2017.07.14.10.33.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 10:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=tmiI5cvK;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id a66so11918068qkb.0;
        Fri, 14 Jul 2017 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R7LhIdmlrvym7Hh1uYTJQ+WySA5/hHpGpVyHxxR0FVw=;
        b=tmiI5cvKHGwZ3MJxtk7/r1R6XJZ5mLgtbhFwt+Ym2cHj66cbbawltTI8Rb2FyqyHDQ
         6p9OJLEPjL5TYmtwLjkoztQnuGObTB32o1bEWOKcVpmVsjtML6tsNtOLWUQuuP7BerfM
         ehBkdbrH9ue71+lbeWseFyIfOFk9GkDDYaaX7bL65CZtVcxvoMYv8uSKJgdnoRpKv63y
         EF8e2yjjVQWlvkIkbLcdH6aM9b1369UOeM576xzmMHgFdnZPqPWKCOCemRNEb6Je5C5X
         lVZXXnBHd5kpjGQLOlnQDJDrh3GrxVMeb0WiJHP0UE2wTgux06XPtCRoAM7qfyZT7mFn
         T5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R7LhIdmlrvym7Hh1uYTJQ+WySA5/hHpGpVyHxxR0FVw=;
        b=Ssyld9HVPhH0Iuo9EwFUYdAn70PHTv4nFCYC3yGpDsDfwOT3zPUEgXO9kq6FJ6n37r
         GTC3nrmtBn9y5tmGne7wBL+deWvtc8XW1LPDyniu3RpIMCyZ/N1D+NCCSrClFrj8132d
         zA+EiYLQdqv/0niYFJfPvrrs328JFG5LFeiTKr6r4Ctyyfp1IAvusCUbmRSvP5GKIrrK
         KMp17XIaU/lkh/Q20pud9/gtQWFZXk51FA7QzDqoaccIDw5nUHS9TJDNdrQU36cG8am5
         80rMQIvl8+tDqwLmGmJx/SfwWY4QS6HAsslzBuXw83Dur/Md+gp+Mm6PsVmIyTI5dlQC
         LxzA==
X-Gm-Message-State: AIVw112mLMU1op3J/AHSZHLRXrLAvgNKMAXWFaezQpjugymsHpf9GAyP
	FmYntJF98/q2Bg==
X-Received: by 10.55.112.66 with SMTP id l63mr12417109qkc.56.1500053631012;
        Fri, 14 Jul 2017 10:33:51 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id m49sm7622206qtf.32.2017.07.14.10.33.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 10:33:50 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v13 22/26] target/arm: [tcg] Port to tb_stop
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
 <150002534291.22386.13499916738708680298.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <28a48f7c-930a-389b-b39d-64c43654cd04@twiddle.net>
Date: Fri, 14 Jul 2017 07:33:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <150002534291.22386.13499916738708680298.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1Hslx+toPmtP

On 07/13/2017 11:42 PM, Lluís Vilanova wrote:
> -        dc->base.is_jmp = DISAS_SKIP;
> +        dc->base.is_jmp = DISAS_NORETURN;

Really should fold this back into the patch that introduced SKIP temporarily.


r~
