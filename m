Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp554977ejc;
        Fri, 6 Jan 2023 12:39:33 -0800 (PST)
X-Received: by 2002:a17:902:eb53:b0:193:1aa7:c7d2 with SMTP id i19-20020a170902eb5300b001931aa7c7d2mr474121pli.17.1673037572966;
        Fri, 06 Jan 2023 12:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673037572; cv=none;
        d=google.com; s=arc-20160816;
        b=HYZ1m8RnaiJBdY2UEzFJa2TTvKo7M7PH5PupvR2FoMr2E7skEjoDK+Yh33TtFRLcR8
         mnnOoyi3HHV2e7vgN0XMdsymnq7P1FtMlsvCecmH0GTmyLBbv0DBqQ2jegFCDeE6kJXi
         3f09s5BMXe1ULyMo3Hvfx7Fmvj3i4hSDVEEbQQSQXUIOYHDpEq8utBSnsrDLNyeFWy1i
         h/FH9jQGywU+4TCz5vlep9vdpEESy4Jg7gDiOU8VtYog2WrAZALHPNU1ghVJE3NMH7YY
         mAOl6JoNaSMB/ITKWRAFhiLpwm1IPERQ4d9cXfHWK/b03tmTEKeQxUIIObMJ8IFEvSRb
         mlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6+voQvns6oeouTZyhNJXTaf1ms9oOZAS7BFJe7KDG+0=;
        b=TeFyfneBBRzVF4vPo58j8Z27HlT/fitJSpC9liGUmiRidDO31f/e9HX2W1dgwvk8QR
         wx8C1Uzbz26Wkfoh7sI1bSEMJVDEJeMbg1OF+aQQiIxnkwPYbzy4p/biKsH9Oo4jCa+F
         mc/qeAkYnTildGaPASqZYoPUBc5fH6XYEmFGcXSB9zFF0RN+479ALAofXFAoclHbMEFY
         purcAI79lkqmB1M6a+CJ7psMLogzlo7WvpHizGLoM1JUPWzTcEjnilXlHC7A03FDo2u7
         LmuU2ixOP1TF5UXsP/cBQlUqd9a8fmOpK1bedVrhNy4oDec+y62YUmu6QNhkuLMTU7wl
         JhjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJCh+On0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w6-20020a170902d70600b00190f17f7464sor806514ply.177.2023.01.06.12.39.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Jan 2023 12:39:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJCh+On0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+voQvns6oeouTZyhNJXTaf1ms9oOZAS7BFJe7KDG+0=;
        b=EJCh+On0HMHCSilu6O0zQfvVXlCijIQaYI5PqhlDHbPnUqWn9fdQ8BdoavHM4oOoc4
         rOdP7JvBzjQDko9BcOWlLX8lGCJz7LfKSvurbO58DM585c5CuYyj6PoZHLpCD67rIoDS
         yTaRAhOHomkxG2Voe6MGTVHbgiPf9iiM4eLKA7iUBr6ldmAWHGou5vXCKTD1inz5XcaW
         2B4Ov6YapZYFFS0HBRyhRU3HN1GMaG+/vSIH40RWnVZ7Bb9kV07rCNXpZCMdb0wogLKh
         bddtXNCXtMvSUz318cLlPo5S1V2XWWmpUNXac2lO4b6ANSAYFP9GfyS+muYmvM7DS9BS
         iWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+voQvns6oeouTZyhNJXTaf1ms9oOZAS7BFJe7KDG+0=;
        b=bmhiXoCWLuoXuCTzZ9+1XcRfr/yEoc2UCU7juIofd8ZO8LPu5IWHY7Q0hwLJEdWkJu
         ANQG1dxJMrsPPydC5jg+Oj4gOTQ29sT3jKve+NjyP3spJ8W+2spBfH9smKCLNsQU9+H+
         o04R+Z/5b6GBobVKWmtAVaOcnaYIFaKo77cYmQJl17mLUns8qr/6NsGg9nZiaV+MHyHh
         12XtVGTbFEfyRqTILOk7GTCrgYZHLaWKmA5P9keLT0CjzDEyp2s/4tgf/FkfdMZy0vG6
         K7tyFLMN7BFw4Oxmf2JwzKJPltLyFS8URN7YhiykF3IYHm2biC1x4PBv+xML5Wh5URUR
         UWRg==
X-Gm-Message-State: AFqh2koLW7I7PXW24kc8W6HJ23YcWKIjPaxDjUNktAp5oRbXLqpyBWZj
	Ov8ACVCLqSPCi5De57Kl6f5T4s8SHF5CJofgOTI=
X-Google-Smtp-Source: AMrXdXvonP2GKbd2280IKM3iIRmBZzfypH3CAK2UyKx4Q/mlPVmpr5vcgzlTDyUkNCX3LF8Eyr5O6A==
X-Received: by 2002:a05:6a20:4995:b0:ad:9646:b9b with SMTP id fs21-20020a056a20499500b000ad96460b9bmr63894081pzb.49.1673037572469;
        Fri, 06 Jan 2023 12:39:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae? ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
        by smtp.gmail.com with ESMTPSA id d16-20020a63ed10000000b00476799699e4sm1283554pgi.30.2023.01.06.12.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 12:39:31 -0800 (PST)
Message-ID: <fd27912b-53ac-e22e-3d0f-d6dbd12e1c48@linaro.org>
Date: Fri, 6 Jan 2023 12:39:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/21] gdbstub: define separate user/system structures
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tOsrsU/5XdEO

On 1/5/23 08:43, Alex Bennée wrote:
> In preparation for moving user/softmmu specific bits from the main
> gdbstub file we need to separate the connection details into a
> user/softmmu state. These will eventually be defined in their own
> files.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 91 +++++++++++++++++++++++++++--------------------
>   1 file changed, 53 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
