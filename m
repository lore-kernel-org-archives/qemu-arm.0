Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1582543lfb;
        Fri, 3 Sep 2021 12:14:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymlkGSiHD6gTQIXlWapOksFjYYWvhkg4qDiT1aYUZ/Ncrsc+qdSntXXAsqE7WtqgUu5DdK
X-Received: by 2002:a1f:1157:: with SMTP id 84mr248391vkr.13.1630696447426;
        Fri, 03 Sep 2021 12:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630696447; cv=none;
        d=google.com; s=arc-20160816;
        b=RaQAglWfYhaI81df5crhT+YH41jK2dJDM93AnxPkT37BjPuX7cVvGE0IPOsrAkDEuQ
         Lr/bADhdfN+y1QGs/BPeu+nFXvKKNEs3eypZN29Hx0E/kciNNLfTxVBiKoRbH8fu4YEW
         QGtu4aEbWC8mjCJ9DYnOmeFPDVAPpyq35vHS05s6I1qB/iSbn3mnEbynQ1X+I48BzFzl
         5BGkbJgEdTFEQx+p6o2MUT63RrkW2B2nmh24ndyvbuX8FygOrpbpTlAquTnUALekSyXe
         HaZc3hnLIIGVAkLbUvaGM0n4PbeoYHoDfxCf5T5sxW3AL4aq/cs0CLs1HzTt6bLw6Mvj
         FFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NPiRm6rllmea4selmN12leDe5rPLarTMpyZQiMtTcXY=;
        b=ajDBfSQY1BH92LxboCiT64b74/N4eOeQ0WFzx2EkxGhi3iw9TpvNipuGeT34DZ72JR
         wSqXkBmdKsnvUkwpmZI+z8s+IAU54uD/BgwVYQ9EiXtBYCfvKWuPTP3kqcN+2Bz/+FJ2
         nHnxj8AIuCEGpKs4u4RGcizrIGNKL2fMtG3/X2stflOloq5I74wwDfLW5IAH3HbYtfnV
         JTTWaTs78JKsZVUdVEa/PJsWX5Jy2SUbJEGuA1fjiz9BEh4kw9clrt9jUrIzMae3hRnv
         OJylI3qFv57Y1oJnG6i95PV2unzFXj18sQtFLta/WC5qSBripAESrLOhylyHlQvgW9SC
         2ngA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O0oiDP9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23si75420vsi.440.2021.09.03.12.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O0oiDP9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEda-0002wF-PE
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEbm-0000Lk-Bb
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:12:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEbj-0003z2-Me
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:12:14 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v10so119258wrd.4
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NPiRm6rllmea4selmN12leDe5rPLarTMpyZQiMtTcXY=;
 b=O0oiDP9XLH6m1jJ60jORhbqAzHtiDwgjHsPexg4wVg9DYzfoyZZTY0isnh8vLQTt5S
 K4bvkkM0pubDeXZBOhP6zJDaK7eDtCay0xDiylkxYhzJd7LWuefSMT5wYPsxIsHJoNoq
 ihI7dlqqxI6yrRcBzr9H1FCSap0x/MZ4/VEIQzraE+QksXeiLXYix3SlKFFGF3NbQnKw
 EAIgCtUAZ0u6ct38Nk3XU2S5d3KPSY9odwRAAgFkj6aXU6MsBATsZp6B1SkeHSueN58y
 zwt5MIEzLE+gUqGoYeoMQnYco7qLkGrSFu4EgtSQzkXRPihZXSHClPlbOFYK3wkYB6ih
 pDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NPiRm6rllmea4selmN12leDe5rPLarTMpyZQiMtTcXY=;
 b=WdaLEJYqmvvEUz0y3vQLnBTuZo+xS6M4iTQ3popp6Wv8CJLMxKJF8n7epQ8U+5lXHC
 cHOxZXQi01RJeZPOSa0y0LDdfDb57+c/2tdP2TyqvevpK3hrrCnocA44K34SYsrpWuEP
 U+S6Av1f/03DgXy9PZ1uiXco+JSCAEYZi179if2EAno3kqrCwf26+yTxQFlqq5fg4wkt
 fzm+rzRcGxptxXPz/5qC8FEjRLNabaqcCDrMyaILk6gFVfp39qBpFXa0LPA7sH3HXNvL
 eskOSBa9iToVNC89Nv4xUVorWmgvVvePiicdj3XMtbChQftwvWLMs3Omn9Ldg5MFV5sp
 tPOA==
X-Gm-Message-State: AOAM5312atIMBDgPhvMjQe6O9chlwNsNDzxREFFWgsXWeo3mEy6MxiTk
 rMFn/AOY/lQdhTescyX64TCXVA==
X-Received: by 2002:a5d:4844:: with SMTP id n4mr563573wrs.191.1630696330232;
 Fri, 03 Sep 2021 12:12:10 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c9sm89871wrf.77.2021.09.03.12.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:12:09 -0700 (PDT)
Subject: Re: [PATCH 08/24] target/avr: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6ccbd42-8286-6a27-7bd9-e0b1ff3e96d9@linaro.org>
Date: Fri, 3 Sep 2021 21:12:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mBrb04wd43l9

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu.h    | 2 ++
>   target/avr/cpu.c    | 2 +-
>   target/avr/helper.c | 2 ++
>   3 files changed, 5 insertions(+), 1 deletion(-)

Well, avr doesn't support user-only. So... probably any instance of CONFIG_USER_ONLY is 
already a mistake.


r~
