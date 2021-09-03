Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1598317lfb;
        Fri, 3 Sep 2021 12:34:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRk7/2WhC6HTCJVD7mH+UCkYfGCe1AlP7BGn+jvX3Mpp6DbkFo/wCI7OGUNRsrhS3ovsUs
X-Received: by 2002:a25:d603:: with SMTP id n3mr906716ybg.130.1630697677253;
        Fri, 03 Sep 2021 12:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630697677; cv=none;
        d=google.com; s=arc-20160816;
        b=km0+ExcTjDzlPAdzVbmlYnTP1C2TIDD6BedH7/MhVHMG0L6dqoqKzwEdDJ3JA+ORCt
         n+qSs2z/gS4/Yfiu9taIyUIRVztz5AsR2vaMXnE0Ao1B7A0SU0rFOrwY9PxWxfrG8Fz3
         1APsDPFJ2AKghl8vD+yazN7u8clYEF7LifRi5vxaPfFWCISipjX0atxFBD2SLHh8maBN
         TWXc3tLOoVNxcVkEmbYpdMtoMPhJlSqHW2mKuTBMhk/FJ+MjTkWbz4Cvs1W/LJO1mwcW
         PqR7QRmzW3X2dzlcv6ux/V9mES47iUioyeEvtXFDwXgewAlknqqSxR2EK00k1UFjYadT
         pKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AvOkOfxkdjDhX5Hr5pmdj5uo1fcSJm4IVvX1hwx97Ao=;
        b=AmZZh6+2sphOGx8gVsvgWg01XG8YOVWAxfDYThGkMKk2HAfW2TdUlUy4ntS6pK2u9k
         0LzYW57WRv+LthEh+BIUnWZFfXZr3vQAIcW2IIKmTmJXalPYYVg86qUka/Ji5YG9GUjJ
         JrD/0hdnXLcodLoqAec5EZn9j4C1Od5WQ7ef/fQSWjj6VeUHtANmg9K4NbQuRQGTZT6X
         8hw4zmRG6DAca7gWq0cZefp/DVBhjZOFJScL8LVhAvG5wDDPeSxsJhA7K9MAasyl+YMW
         bLtqCEYwk8iQ0X57i61ikAa9YjsKj14tMsj844dbn5Kjiopve2St/Flh97D270uAj54o
         VXKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bg+OFO0j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si135559ybo.267.2021.09.03.12.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bg+OFO0j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMExQ-00004q-Iv
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEqN-0005fn-Aw
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:27:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEqL-00083A-Rk
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:27:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id g138so4150207wmg.4
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AvOkOfxkdjDhX5Hr5pmdj5uo1fcSJm4IVvX1hwx97Ao=;
 b=bg+OFO0jqAgHpuoaC0WJbFBZIOk5qGYibVH29fChJgML2kxJWhKF5Jxc7LLSTQPRTg
 26syI9O8VN3Fm59ICWq35/9jBjTtYzjL6cI62D3J0UREhARdJdIFlLS+P2CxzspRuf1h
 JLUrMaFBOh5TAsSu3T8T/zJZ070GAAQ0N6l+g4N681MpHCf+7Ci5Zyn7sENEEF9FCoCY
 biL7rLxIoYJJkISAQ7Fj0YlWWWULMzJMQ0HmocJN1ywsf771paJ6Pgk8nJyRea2+3LTl
 woAih8woFSfHcKgqmE+pI2wqoGmbWaASbrGCZS16i8YkXZR+AMxemau4GbNlT53rJ1AF
 hAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AvOkOfxkdjDhX5Hr5pmdj5uo1fcSJm4IVvX1hwx97Ao=;
 b=Vkl1ClumgxMufpjalMmPEdBVaZqiT13/noDBnFldWUjr/q5U7WUbZIObR4Zn9QzE6Z
 CA6Y/Te2ijp91TOSFkHuhnTKiUzfHCN+ynyo1GiyZZNm5l6aVI7Dxzf39NASqCsV5Jb9
 nx85xwWaDsmdsXJW3lSS8sLH+lMpREtr8dUYQLN4MAMdhWmydsrnOejvwOyM8SB7PGT9
 gdROhPuSCWUnOSQ9BMba5XzaxSSzEnAtRG+qXszYnwQ/tMEzqDIk2uDL+ak7VRD2oGQW
 ZWUeFrAw0VI/8QZbMJK2aFggDg6QHXItyigaXM3seXnpk/6Uokh2EUPKQZ8bFzXylrkN
 A4sQ==
X-Gm-Message-State: AOAM533HKc1wU1gR4yYIecdotd9h80suc0bNxhSilI+xuGxcNPrRvEbR
 lBr18XOdqUHsh9j0gxE/5WfVtw==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr333732wmc.23.1630697236443; 
 Fri, 03 Sep 2021 12:27:16 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s13sm248122wmc.47.2021.09.03.12.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:27:16 -0700 (PDT)
Subject: Re: [PATCH 24/24] user: Remove cpu_get_pic_interrupt() stubs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc9cedf2-cc77-bb8a-3097-0c16b6912042@linaro.org>
Date: Fri, 3 Sep 2021 21:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5o/vhU5vqe+4

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> cpu_get_pic_interrupt() is now unreachable from user-mode,
> delete the unnecessary stubs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.h | 2 +-
>   bsd-user/main.c   | 7 -------
>   linux-user/main.c | 7 -------
>   3 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
