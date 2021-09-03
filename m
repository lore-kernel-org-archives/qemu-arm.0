Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1597640lfb;
        Fri, 3 Sep 2021 12:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA1QW3Oet91uhIQP4wkcPAYBmQhWg85m5AIehQEC+JVeDXdOg01AbMwTRCPPfKPofKEp4a
X-Received: by 2002:a25:50e:: with SMTP id 14mr773965ybf.489.1630697624270;
        Fri, 03 Sep 2021 12:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630697624; cv=none;
        d=google.com; s=arc-20160816;
        b=Hz3x6bjuEVNGmst0qLOHTm81Ho2gnleHCozBwqyjpFIpCYMphDmShS42Gc1gUlw4yK
         FFtdHNmHqZgVc1Cm9PMKrtG0ybfVEGedhfEJRzsw8Egdv/Y46rEiJdW0/brCgpqKzJ40
         4OWxoVPXNtNVXnmx1uXGhh4cemiiBL8KE4MQVe140wGViZBOflEWHyWUcl5fFtnWztLJ
         S4gh1wJ85476C982LYYZAz/Sw5/xzA9VFLw8+rOaF2hS2TiLSl0lTUMNxvIiw1+nBK0x
         EE5fbQzxpUK63t2FtPuCLEtQYkkk3wIa30FWut/hzMpDtueEe4kmJf3+MXWIwfjjTTQW
         gGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xhb2pf6dd5jBpxyqJzpe7xZ2wUYNv9WKD5LryijCpLQ=;
        b=Tfezg1C6NRbzAJBWmHKMhAbsImH0DN4z+DxbMDKHX9zpXoXjMWmT5sRyjQg2taHisj
         96EwxbZQRXu8WbuphqDyf8xWDDLof3kgmS1xnf5dweSDbEsxU1wD/gypc64CbapIpbdF
         9GY1A0j0kKN+GCwMA1Nnv+Sot9yYy+TSpthj0/PAn+mutA8NANRAPXEmj+3mfB3ICrcd
         pjxy42p/EFR4TfvkmkYzwxYsCMgt3Lcl+IB44UPKSyP1rHo+52c8iBskymYdPyB0B2Ok
         NLqQyXHCXznvQx2jWZyOTkE3ZXvDd76b+XgTGn+JOIkk7NNKX0doY+mpzOyc0m1uScie
         G5/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tfvs4zKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t77si214487ybi.21.2021.09.03.12.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tfvs4zKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEwZ-0006xK-KT
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEnW-0001Sn-1n
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:24:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEnU-0005cy-Fs
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:24:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso205088wmi.5
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xhb2pf6dd5jBpxyqJzpe7xZ2wUYNv9WKD5LryijCpLQ=;
 b=Tfvs4zKnJgWMA3WFUZx0NDZkNsbYyPdSxDeNP3eGb5mDuzvuAF81Kkf99YrvwEOvDi
 G8tZ6362/xRb2JFfAXTO9irr67uG4VGJxEU6rOH+ELsFMxKuLRrs570sQVN5s3KoNvz8
 2cRPqzZFNKp74aNav1KejQx6rrLZmQRJjP79crkXxCv4q63h3Sw293wUFlZ7ESe8doT0
 TuuuLSgibINIpvP05bcg48mB7LuHEdlsBuHx9lr/1wUtun6YOPUvYJST8/HZn/rtjZV8
 +TXoCi/mVqReoNbfKQzX60fk+ADusiIMrJSuBMA2Gqv/AzBJKk4bbplNI7P+GNw5ylBG
 8IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xhb2pf6dd5jBpxyqJzpe7xZ2wUYNv9WKD5LryijCpLQ=;
 b=Hx7m1s3MhzKGCrBsieuF08RSQdW1B+KZN3otIziH9aTcouzU9/RiB6VDJQtpJJUIDV
 HwOsWwqZho9IEcV5aOCguEb+Hbo3/EZAsdKlePiXC78JrcBF+ZMZkQUYphsLjUfZL1mw
 EWDE71HRV8IsaSnx2SBBialctNARJbGqja06x+WY6oS8Z/l7fijHSusDRWjkEquYi+2t
 jAGbR6zPq2xIzoOrcjnheXbueazFCXXnEx8d9Idl8NZbFzKUEYsA5zAgRETqgGe2FTV9
 mzxe2Hnh7Xabc8E/mEEccDHoocPbGruXVlsclesaEOtUX/MKpgCkNVZFzIRuVtwBcOfI
 2ADA==
X-Gm-Message-State: AOAM530Lqbu03I4irDwgD+5fHzW5CZ0HjdZb4/CjQnv71322ApaXW7jJ
 UP/oXG5EGx6LR8mNnhYvzfh50A==
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr278636wmb.57.1630697059149; 
 Fri, 03 Sep 2021 12:24:19 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y4sm207769wmi.22.2021.09.03.12.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:24:18 -0700 (PDT)
Subject: Re: [PATCH 22/24] target/xtensa: Restrict cpu_exec_interrupt()
 handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36e0fca1-fdc8-7353-759c-fca056e58b29@linaro.org>
Date: Fri, 3 Sep 2021 21:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: Rjq3OaWOIeGx

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/xtensa/cpu.h        | 4 ++--
>   target/xtensa/cpu.c        | 2 +-
>   target/xtensa/exc_helper.c | 7 ++-----
>   3 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
