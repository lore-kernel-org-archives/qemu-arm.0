Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1646216lfr;
        Fri, 9 Apr 2021 09:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVboDimfOC5vzTZbkCU77Iw2Rsj/MvYBpKRwTmkX0mOyg4Amyc4KFmMV1w1P4ysxUWCtNc
X-Received: by 2002:a6b:bf07:: with SMTP id p7mr12204852iof.15.1617986248449;
        Fri, 09 Apr 2021 09:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617986248; cv=none;
        d=google.com; s=arc-20160816;
        b=By0Jy2LaafzSFctuNS1rEalfN3HGBn2VLsnqKuppMCrmpdFjlB4K5j4TypadKNe58r
         IV2WHmFnUA0uSCIGy/KpHMfSCPjmGhss9HAKFWnRrOYSVf1eHu79PK1dEbolPNTmd7i5
         IjLnGlo5kPgQ5aH6VomgMlUqps5rSANXiMKd7tLAgNcgzjvXdQtDl+A4DvYwRt+Eq1O4
         RFFNhwLS4w4xMtGnUhqYiO/wk54qZ1dh/vJ8iOgOo+MCcHKYSv9lMwWDixhgCMZqi6oy
         jDtJLAlFATochF8SBi72hBEU6EZj83pd8ug7UlrcqDM9iIcyoGTRIX1mImFxHA26UmvH
         AiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vGf5PfG/yc4+TnlGhSXrYr2kEiIyr1bnG4XG+vvXUvI=;
        b=ePJAhvs1q67pq/URD3LOTmBtv6LCM7dJb5RK7+g1A5jzJkCKC6WXBha4DGddauO9Bx
         4qgynUz7C33PgRiAfgRjrHjqAIg2NFntgXmEcHI0r+73/JtpkM6pe2JRQfeOQYMxgu9z
         40UGDO5tP0VmYZ1tS4DbIY1lEI4jlpJjcOnNAvIwBTD6Lre9GPZ3bffR8rFNOcY523Dr
         fQbuUCO6PiDYR5/Grr4KgoENawV7m+SkP+1kPuV+kh94GGcNfOY0vNIWFOb7J4HrTM7I
         6gg5jPZphUq6b0ppey65rYHhRIALEa4MsdEyr/cdyEp0y39PL0SnR5ldfFWeo+88xAD2
         3u7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e330eHLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si3107398ilm.71.2021.04.09.09.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 09:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e330eHLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUu8N-00088h-Ny
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 12:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUu7k-00083q-E0; Fri, 09 Apr 2021 12:36:50 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUu7i-0002XO-T9; Fri, 09 Apr 2021 12:36:48 -0400
Received: by mail-ed1-x532.google.com with SMTP id f8so7275600edd.11;
 Fri, 09 Apr 2021 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vGf5PfG/yc4+TnlGhSXrYr2kEiIyr1bnG4XG+vvXUvI=;
 b=e330eHLD08J9X55WCD8KZ9wi07wpCYSS2RjXH+2++tbvcdZcv6+fyw4hAHbs2895JT
 fkwAWMeKjPigV7Z+e8tSFj4/ETQkw6KkObcdeAveCaKUYQUKqTeYgA2I6Ykyk/t/wW+V
 4Ud2QqWFRQmj11bFUYNNg/eg7/JTMk5OGtEhiRpfOK9keOZ6d/9J9t2WXUngTX/s072E
 yRUSxHlsN1Ga4/ZFfviehIVQ7hKyfjzgIJecxCvMTkhTh/JYWbkMYUOKdWoUeijXojUa
 WL2X0Ux810RxtPr0Kz0OLDK5z7Nsr2jD3cDnjaPZiv4KE+QMJnGJXwib44xZwaXPjSD5
 o4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGf5PfG/yc4+TnlGhSXrYr2kEiIyr1bnG4XG+vvXUvI=;
 b=ORWUtgdPCdpBdrBjXdXsmFfbay6esb3WwGmTh5fAiEKnNhk+M6GhzSGNK7wRmW9iAn
 QkZLFQBeReQb/f9zarwQOKIbmivdJeBpz7G9ktcBcutcEGJOTtkO/puK8R+2bK79V9aO
 gtEm7VmdI48FNiOp9VHpeXVhZqji2LEn8FSJOo6fQEJJUmLKxvEqu2jEFX13+mzVIfs1
 p/sjzwsMzyDh6I6r5y61a6BuZsBz7ttrypxP+inufIfnoR+haTJSlvHwrbfMLQtcP1R2
 +tNk5JQUx/9GNOOCZfpHSj6i35cAMIjniwgycN8BVNKPoftAuCzqqX+kHynlH+tlh9oV
 C23Q==
X-Gm-Message-State: AOAM531rRAt7UitAGq/39jd171YQ+4sr6c/BPrbgqlb0TqaCgzyzqgrT
 kP/DlvZnEa4l+5ENW73fpdQL6Iy3KM8WHg==
X-Received: by 2002:aa7:d78a:: with SMTP id s10mr18079154edq.226.1617986203966; 
 Fri, 09 Apr 2021 09:36:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o17sm1692493edt.10.2021.04.09.09.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:36:43 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] hw/i2c: name I2CNode list in I2CBus
To: Patrick Venture <venture@google.com>, cminyard@mvista.com,
 wuhaotsh@google.com, hskinnemoen@google.com
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-2-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da217b1d-52f8-16f9-7079-3042425eeb86@amsat.org>
Date: Fri, 9 Apr 2021 18:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409162545.3705962-2-venture@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LEs5waOMhyKB

On 4/9/21 6:25 PM, Patrick Venture wrote:
> To enable passing the current_devs field as a parameter, we need to use
> a named struct type.
> 
> Tested: BMC firmware with i2c devices booted to userspace.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  include/hw/i2c/i2c.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
