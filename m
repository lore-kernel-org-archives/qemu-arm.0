Received: by 10.25.44.15 with SMTP id s15csp2543149lfs;
        Thu, 20 Jul 2017 12:37:18 -0700 (PDT)
X-Received: by 10.200.48.170 with SMTP id v39mr2397376qta.114.1500579438330;
        Thu, 20 Jul 2017 12:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500579438; cv=none;
        d=google.com; s=arc-20160816;
        b=GSAEVropDkca2kefGCHHZYBy+qVD4z0anXGnIdKp61wCacWAR97Wfe8Gjhul5f4BwE
         UWn60+Qo3AMNZVW0vc437I2Wz2+bTWWszj0wpx9jf7a7S8JIntU20biXApW/MYeRrhmE
         cJTCAPZTEHO97NFl4K3/KMmBmnQf06zrM7hZ51a+sdn4FTessrm5n7Rwk1MgV0puaorH
         Sx1T78RAa7KHrFcUMNV29UzBJfBA4J5meVTTRf6n5zWRDquqvw68v8bKYv2M8B7OMZIG
         pq6SVixtm36fY4/6nvPToZFLLcW5wjgLaYiT6DzgU+kzGBhioZ8tQES31hEbGWtrb0OJ
         vQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=+p3F3blC8ElMP7XXAZ3tOiGT6j/st6R6VhxOtsdpVNY=;
        b=Y0EVxvxEotO07xTlfokTqu60njtQ8TIpYS2LE8o/V8xx8YuOU1xjJDB41bg8ZkLICp
         WeIRaIrTJeemNlmFQ3k3SrJd5InyZa2ydQZfExHQpyZCqnKHbBEYKSd2+OGxuq6wjFdP
         6Kvf9W21CXd/DIEbSNJIYnYvHY0Oc/2bAzYHZM5nMy+GwaTak10A1m3OwMwURVKgqGaP
         Px5AA0xagScqLEnv3c3ciBL1c5sAfWLrd4T7mn8qKAlUKv4x1zzoXIoGm3amG78emNgK
         5PtyA4tLZDV5/plKhvxvdIU3b2N1NgnUp5sEGThm1DioqsABe3mlbber/ts7gq7JnwTj
         Zn8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=pIiGd5cE;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::235 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com. [2607:f8b0:400d:c0d::235])
        by mx.google.com with ESMTPS id j195si2570107qke.166.2017.07.20.12.37.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::235 as permitted sender) client-ip=2607:f8b0:400d:c0d::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=pIiGd5cE;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::235 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x235.google.com with SMTP id 32so30348430qtv.1;
        Thu, 20 Jul 2017 12:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+p3F3blC8ElMP7XXAZ3tOiGT6j/st6R6VhxOtsdpVNY=;
        b=pIiGd5cE7liLRss7fLf8Y/swORTzjtrcEX+LPIIrAvaqnEweyiQdP8tE/8mI3L19hu
         z7GiZJRcpeNK+1E7nr5+wlwWJ9lOHTzeWMnnffqqdyMzqArIARrHF5+fwyKsrcqRgmjz
         yzm5h+VTGOYM8v0HsYuRrbINNKxNnSLmb+AGOM3YzoLMQUspASPjukAaCLHpO/5S5PQT
         Z67/FIwlHkda/Sy8Y6qcpKcOYOsjpSRYLdIAL0Jq+txfyGeF46whh5S/Sbl/tI7A/O4X
         EUumTlE+JUnoLJyL9Xv+dN+HHxTI+hoolvLzKBRRMCmn4FrKZev9YhyFymtxBD/0xBAo
         VW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+p3F3blC8ElMP7XXAZ3tOiGT6j/st6R6VhxOtsdpVNY=;
        b=faTCAxqxRgoIT/ojapsy7dZ+UKRtvc6lxI0lB4JBYqrBOjMd7VNwILuOvRPCKzz947
         9UX0XaWBXCdE/3Hcr0nmrvj64nzVEpKO/1Pt3bfIwU+MGBMAeReKFsHLT+HRu72nzF+9
         D5/44t67jY1V2hprpWGr9unkuBBmfQxh9MFvgawvSs0xOwK+yDbDUOPO4cytAEO26612
         4s0XHAPDS9zo42ZQBcM7W/6hGunIEhudp4bBPaJaa7Hwu7TjJbKEYU7nVEmPZKWY7ECk
         TGIrj+AdY7vsecuHtWUja+WSfsvZFxSOnknAVVHJi4NG+9fPl9OBZd/7HpGqmAGtMLjS
         cnvg==
X-Gm-Message-State: AIVw111FHzQpCe27C8QW0Al/4xOSCCZUXevelTp+YqPE97uyLNeJyp4B
	DcS1iv3yyK4YzGqob/g=
X-Received: by 10.200.33.209 with SMTP id 17mr6301932qtz.189.1500579438031;
        Thu, 20 Jul 2017 12:37:18 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
        by smtp.googlemail.com with ESMTPSA id o20sm2361171qtc.23.2017.07.20.12.37.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:37:17 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH for 2.11 13/23] target/arm/translate-a64.c: add FP16
 FADD to AdvSIMD 3 Same
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-14-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1d326bd3-903c-29e0-ae47-995d815c2e53@twiddle.net>
Date: Thu, 20 Jul 2017 09:37:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: gHBMb/GHQaS6

On 07/20/2017 05:04 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/helper-a64.h    | 1 +
>   target/arm/translate-a64.c | 3 +++
>   2 files changed, 4 insertions(+)

Implementation of the helper wound up somewhere else.


r~
