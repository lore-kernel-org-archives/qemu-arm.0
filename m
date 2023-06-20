Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp181246ejt;
        Tue, 20 Jun 2023 03:25:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5nqxMZDfCSY47ETVNnf0cki/hE3P1ms6i6UdTqVw7gMNU7UhM5uCBSSwLkB8KdP/r6LDs9
X-Received: by 2002:a05:6214:f2f:b0:62f:fa39:cc0d with SMTP id iw15-20020a0562140f2f00b0062ffa39cc0dmr16268210qvb.61.1687256718240;
        Tue, 20 Jun 2023 03:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687256718; cv=none;
        d=google.com; s=arc-20160816;
        b=sLyB898fwiLJItxq4xFEpQseZ85/uDbpBAxmIwL5/vAnEEV1SEvzmqY7s0G1kzGq0Y
         uhwi3Nro1PfPP0mRuZ+yA6RnNQZLoi1NTdP1J4lhssF3lUFzoAX+q3XxnKmduSKtZrXN
         7vqmY1Voto5JOUzoL6VOuyjJ57s0NdQBEzu4qSeeQREKA2UPzScdXhpHpbZxlHLx2Kxa
         IcCHjtvnefHsi7X8aTWHh2L8+fSlXh76MiR8vAKoYjuZq0zvsU0TLYBaX0hmqrX5pPU6
         eIEbLgJ50+i2+GcXwoP37+UGhOc4tdRtb7Q9gZc756wds3dGav4tcI3qO8JZxBypDHcy
         wSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=e5OEfbuuH8T9Dcj7iOcZAlKmwpUl+YWfTb2WCDK4aiY=;
        b=C+xPm0SgUNkCmjGtpWOu1+LGH1GNYRNP39ig5aWM+O+IwluuAk7XI8bnS1alwIcUaP
         A+GbmOFEPLZLb8a6EIizQAnk0DVR0IbKpxcjnIgqO338qO0S1p39hYtXic5mzvDRVJwo
         BFjpPqpa/BJxrpveGk2SBbEbfC+VhuPtBjNZvZF/AsyNEeNHgTyJvjFGyUcGIBQMJplL
         Dxichah7uXycoNDaIzKYWtyHKXAQM6AyThx/zeNBzZ3uBLosrqcHfkEMKYbNbl45Pdib
         1RO7ualNKY6KkDpG2prTikCHCRziJl7qX+ePlrorBk7LwFos1e6eF9CI0PvsrvExp7JF
         jE6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVDIHwml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ad45baa000000b006301bb7f518si703568qvq.238.2023.06.20.03.25.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:25:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVDIHwml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYXv-0001ES-FF; Tue, 20 Jun 2023 06:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYXs-00018l-Iq
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:25:08 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYXp-0000hD-S7
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:25:07 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-983f499fc81so550624766b.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687256702; x=1689848702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e5OEfbuuH8T9Dcj7iOcZAlKmwpUl+YWfTb2WCDK4aiY=;
 b=YVDIHwmltJxXYbus4qlIPCDZi2RYPqpa6BNuJeC4x1QW8YToVyWWiq3Wp5KV26y8sl
 GsVpBFH/R5WsRMfwdcTDrwtH7EExNfGj+YxCI4LCf8Ch/yquEuFFhRDeQj3cwsK2t6wn
 Xx02QJrUDf6E8TokyJ6wPyk8XRcl9nowZyzM7tmEchEwwD9ubzV27h5X3czaiEHJhYsX
 nek4/lDKH1jb+3ZPQVL+YpU9nZcZ2fNRZ5vYqOQ7W8uCOorbYhTKbhhChGe0tazOOomx
 7mGNmDkJ9NyXBTccrWk3vozfs/7sw/fYyva1gxShXsWfekPSvIjqFI9ScxyIzKpQMFzF
 5x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687256702; x=1689848702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e5OEfbuuH8T9Dcj7iOcZAlKmwpUl+YWfTb2WCDK4aiY=;
 b=T0VMLikm5eIS/UyFLr2d+PX58gzLPmx7VdHbB3DP+agtvuCxV5XO7azJcHK0ln9C+I
 enE8mY9DGAaivSpBwz01g4AZ37IdfbxupjUKlE9qJFTPDTi4mwTbZ3X2quYoFXCYjZMl
 wHoNEWQZVPWyvgFdyp3Ghiuc9wvHwhsOyPGgzUUZw8TUc9bmqXz+98RLp4WyQtfyTHsy
 RnoJ8OFeEuXMbA8xMHCAF+DCvxvDi6Cl4V/JpURn2CgECvOG0envb4ojhTYhXb62x+1j
 mPkyricJrCIe0ZLZrNpU5xCG69jzRLnbvH5AQ/Y4rojCAqGbqXJQGHvSxMglHyMiBwls
 ji0A==
X-Gm-Message-State: AC+VfDzA0eOcBaM2MJCPpIQQIwldmnJZEV5WcpSpGbmUTV0fIEE+bB2C
 5s9A8N/ufXb/0+kAmSClV/xRKQ==
X-Received: by 2002:a17:906:d54b:b0:988:6041:dd13 with SMTP id
 cr11-20020a170906d54b00b009886041dd13mr7218023ejc.37.1687256702617; 
 Tue, 20 Jun 2023 03:25:02 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a1709066b0900b009829fcb94fesm1127967ejr.37.2023.06.20.03.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:25:02 -0700 (PDT)
Message-ID: <0244c5da-e901-e456-3e6d-102dd24c41a9@linaro.org>
Date: Tue, 20 Jun 2023 12:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 15/34] target/arm/tcg: Export some generic vector
 helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hs7R+cCxZD/K

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> We want to extract gvec helpers to a new translate-gvec.c
> file. Some helpers will still be accessed out of it, from
> the current translate.c. Expose their prototype.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/translate.h | 5 +++++
>   target/arm/tcg/translate.c | 8 ++++----
>   2 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
