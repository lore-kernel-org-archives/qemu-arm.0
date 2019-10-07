Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3853576wrm;
        Mon, 7 Oct 2019 07:16:45 -0700 (PDT)
X-Received: by 2002:a81:31d4:: with SMTP id x203mr21153903ywx.429.1570457805329;
        Mon, 07 Oct 2019 07:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570457805; cv=none;
        d=google.com; s=arc-20160816;
        b=F1fKxpI14MUBtHUxjjzXZnksG2/9zFVFM8dE4NVZsReQ2NtXK0nwjLjud8kP0Ogj1d
         iHAvn8HVRxFpb39ILXLdlFP/xuCbCMCPvtq3oko/uBLqJC4ivMl7xCBkpT+ITpYwOXEG
         1YV7kwTDco1w0aM7Yr1X9wsG5i9qJwFSGJA+XJrMgr5T4XoC1PqQacFjoLBKWLqT2I+C
         TCzC3yzA9aygi8qiU3s6SyWA5TdxdHNL/D4IcxT9QJTOghkHGANJl6IJaTYozUBhBual
         Lbvh9/CSveZViKDzu54rGUaOuexloImuyF2vs4fwNsWqIvMlKMr+pqiMJUOTEA+vY0yu
         wDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=D2fH/cmrMzZjSVJMQHsoQKsskEG8ZY0/4HJJKdU+6YU=;
        b=G8OrORem/XF8uuvkKzwm7mfLJcobglOAZdIoSMo4AEeIXwsciYfKBZDQBiICD8X1dj
         IAwRE7Vnn1E0PqSlbHbPMfXTCJ4Kc+AxHfDzEzr0iCAujSNhFi9UttsaAs9XJ/s1VHAj
         JY+QFc51GoVPlUBYlJmR4anEhs7RYbN8x95YDrws7MLQKrgcx8L/9k2oF0FMw9LEIiJb
         epODJVdupD+0RH/IzfkpVhImcxTR1TGJZBmVuMKNC3lItv/8XhYPwFzdKeLhg9kyrS8G
         kCS5vjCWy2dyzCvePYFxDxX3S01dfmO1hCaBSUot7UIsAZMj6uF79lLL8j5xbOLgAj22
         /bWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTJR7CJm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n81sor7684164ybf.0.2019.10.07.07.16.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 07:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTJR7CJm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D2fH/cmrMzZjSVJMQHsoQKsskEG8ZY0/4HJJKdU+6YU=;
        b=wTJR7CJmffBZmM8t9IwKFp2iJ2VSe+6uBLddQk3jSo+LONqU1BvQNOTB4AyK8G5mSQ
         xLVrD6TEA/qQXhCCXCVrDEj3JomWzdZgrjz2v2TceBfc/w6zynN4oc33iuHdBRXhQ7Fo
         pCAXF62k7mIvlB+GLrGzROYsRIFCBBpuvc9I+QHT6s4Fiygq9Z4UBDOjzTKEgzHAtspO
         XnZnRJsz23DFvmOViZButicrdjioZzsvMMt6L/Kv3ANtooFzd6N90ROJnFo4N1GHdvid
         wBcfou1nYvsagSQnzuNoT0do4XjHC/yIYV0YPWGsGbiICWS6l7EOFwu5dxON4RKsuLhx
         GwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D2fH/cmrMzZjSVJMQHsoQKsskEG8ZY0/4HJJKdU+6YU=;
        b=HQyXdOjydcG8enZPJqA4opb1S1iKUEjjCKukHVqgdAGCX/edZFcbAz+BdpDKcjy6Gb
         RI/j/YYhaoZ1yg5ODAGDcDjavFB4/3vy7ZItUvisGrXU4u5SsYLfOC6uuJsDOQ3ZyZzr
         pAAxHLONVpZZNx1h/uhsW2ClIkJBYo6ane5TYoKpdpQ1NkhPbkoXxcb9Fw+lX6TbORUQ
         BM47utz/Tp8huhePQJvz+9H2dRGYacJmCe4eDxi90N7TwK/YZU2MQXsz45hDTPow66p3
         nkAbG7im1tumr4lP1cs0tX82yUfBhk8y1O6iCbVKkwqsTbl3sxOZRjBDNWnoo229yF/w
         AwDg==
X-Gm-Message-State: APjAAAXQ9MV+XXssJ/BccdJlVyRqAo7DVtVMeUrHp85ICOM2/460RwGP
	tTrEYEVgKiMJnuvXAIJ4AaQ9ljpostx12g==
X-Google-Smtp-Source: APXvYqx7oSmoXKWoMgSALQ6rPYuuvXNJ0DPX93CoJCw1iCpblizvw9WOYm3Z7cZLEKe6rs2+dg2U5Q==
X-Received: by 2002:a25:2582:: with SMTP id l124mr10616474ybl.42.1570457804520;
        Mon, 07 Oct 2019 07:16:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id d123sm3751214ywb.11.2019.10.07.07.16.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:16:43 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 08/15] target/arm/arm-semi: Factor out
 implementation of SYS_WRITE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c6ef2b34-b57a-8fd5-2fce-5f5e2617ac3d@linaro.org>
Date: Mon, 7 Oct 2019 10:16:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Gyfe4AMht3Bq

On 9/16/19 7:15 AM, Peter Maydell wrote:
> Factor out the implementation of SYS_WRITE via the
> new function tables.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-semi.c | 51 ++++++++++++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
