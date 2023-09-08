Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp678314ejb;
        Fri, 8 Sep 2023 13:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr3c4RUsIPU5g5iRLLiXOD0URgvECm1eXUbUV0rzvFdM3H9dcwcVly0WvOQIIX5/Fxn/Ye
X-Received: by 2002:a0c:f50b:0:b0:64f:59b8:cfd9 with SMTP id j11-20020a0cf50b000000b0064f59b8cfd9mr3387779qvm.18.1694205969369;
        Fri, 08 Sep 2023 13:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694205969; cv=none;
        d=google.com; s=arc-20160816;
        b=kYo9D1ALEvw63ZzPpPw3kb0WMFmrtmIRfznLEt4fqSkUiMCqBjytLsK5EK7a5uPdAw
         EvvoOc7zxQEgjdQSgw51JQLEdKAXcs+XqFLLFWzTKyFQdTN2TXlGNauZc7UWILReAbYM
         t1n3MYAOk/2+TfoE8BvFdiP2YSBGVr0HafArHi8fv9Gm0Gk10D1ElvBeQLQd8bR4c4+U
         VgU5T+Vh4muC3A+vojo1TlqM58y1o6jX+Q/cblRlLe7Ybk+4jfn3NoW6+Y4mPxjry5uY
         8R9ZkIK36h1+nONwvIbltnP8S5YWqFm4RnJqu1fLD8UOO1VR3VwTu+8RyV10zZKLZTIN
         PC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pEjfTff5Thjz0cGlkvjaiLwfcba1q6PPgBDqP7jNrYM=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=0vgvKzpSJXjCTkpcX6fY8I4B+zJHsV8GwXJ0gfG+F4wJXcz+VD+i3gbxJ5Qma8W7ib
         +WKq52XCvZQjOO2j1FsKUMvAcy/83IAele6y0GAvTMoDxg/kbvO5uz17D0jmph+sEyq0
         0mmgjmoy58yAWUIPeY57f+Yjb4zvxdC4iCMjbEwF8TWYe1GI7tC9BgM1/YBiv96yDe+a
         UIbL6oHMZwUxpFl6jZTf4slJjekF/Q53xK0Ah1GDz3Ve0tKvy7iQcpGsOiuNv7AD4Mv4
         f9WNZyfAbMJHOdqfiHGQOEEIbkQYp89N5yGF+dKF11ya2rCV0EQ55tnJO/xWE8HymkDp
         O8bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=knVxjvxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a0ce3ca000000b00653589babcdsi1516750qvl.415.2023.09.08.13.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 13:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=knVxjvxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeiMa-0003Iz-9k; Fri, 08 Sep 2023 16:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiMP-0003G7-VM
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:45:50 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiMN-0005N7-SX
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:45:49 -0400
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-76f08e302a1so136245585a.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694205946; x=1694810746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pEjfTff5Thjz0cGlkvjaiLwfcba1q6PPgBDqP7jNrYM=;
 b=knVxjvxLxIJrXtuyhqYp0f1coCKJcGIkzi5yWZIo/PjVrpQuZNyyeZnXm0zemPExjg
 MsO6s5zAgarB49Lo+N76HMSjVvH9907Co2daqaPG1JHb0iz/8jdgIwMbF3CD2CHzPMss
 gByiT9w2M5SGlaDFSZcJRCOu/weHAXm5YabYb1ArpFUG/JsbGIcea3B/EIsECsdCGePI
 Jt0rUCf453wNFM0NwLUYi55fz1a96bziP32T+nzJyAJQSNCTN3CgYJy2LDeVpjU7UyTa
 ZC2f+SptaCQTGuBCejXIqDg6/ggNN1SrAwWjv8AyWh0hOsuF2AZ3e8UbV5ttDt7cVC6C
 mMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694205946; x=1694810746;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pEjfTff5Thjz0cGlkvjaiLwfcba1q6PPgBDqP7jNrYM=;
 b=W21m7H+EqoIf/+JG25tEl2/rMODYSxJFWTWbCuV+jmBbhG9/F+RMz5CGoL1yPsCgaC
 fUBPLMOlatsINPaayoiMkMHStAaorT8duUMhlivnrqiTWCHiPB3a4CF37/havGBkLxHG
 FWDYlDc9E8o3KGarJ/QMO9b6x16YvWlZrBe2p2X5KRaax0+3AHE1a+pYGK5QaRcnS5Jy
 0fk9QGdbliWzmqDWVVv/qHw9/iVJ1Rxvbio1OopBBRvQmy1CvWXQJNPypBi4XFBO9IwH
 vgu3j33co+EGibD/20i12/ZGCvwJ3Kzhw3yLa+JZnT62POm3o+Fdj5KP6DGqq5NG76kM
 Y0pw==
X-Gm-Message-State: AOJu0Yxwym4UOEzglFkZjBBx+sK4Bz/lYTF8vM+kkpjs7E1Kx10d3jNE
 pj5RUXV+4Dn5zU5jCfdJuVTzsxN0riSj8kC7bdQ=
X-Received: by 2002:a05:6870:310e:b0:1d5:3389:8a01 with SMTP id
 v14-20020a056870310e00b001d533898a01mr4116515oaa.34.1694205932214; 
 Fri, 08 Sep 2023 13:45:32 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a63b207000000b0055386b1415dsm1540971pge.51.2023.09.08.13.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 13:45:31 -0700 (PDT)
Message-ID: <4411fac5-ad3e-bd0d-8e80-6c1e9acfa859@linaro.org>
Date: Fri, 8 Sep 2023 13:45:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 06/14] target/arm: Define syndrome function for MOPS
 exceptions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 03Q70L8Tysfb

On 9/7/23 09:03, Peter Maydell wrote:
> The FEAT_MOPS memory operations can raise a Memory Copy or Memory Set
> exception if a copy or set instruction is executed when the CPU
> register state is not correct for that instruction. Define the
> usual syn_* function that constructs the syndrome register value
> for these exceptions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/syndrome.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
