Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1590521lfb;
        Fri, 3 Sep 2021 12:24:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVpAsX0S49ayNP1+AtNtyfdvaE1IJ7Q/YL7UeNSZr1z32d8Iq61dQ9pPSTHOSiWbYL3QmQ
X-Received: by 2002:a6b:8d8a:: with SMTP id p132mr392367iod.81.1630697079891;
        Fri, 03 Sep 2021 12:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630697079; cv=none;
        d=google.com; s=arc-20160816;
        b=yCGkUDVXYzG+QKdVQ9Z2RA5DdGXFaLZUpUGFcj+WXREsLjO6o6q8pZiT95roExmUbH
         VM8nO3VtOp9yBu0z3VU08d+KMqrznuMeyZcJIgyvtvxPdEgKTKmOnwHTeu5U9kvLzmMG
         G8ghpR6frHv3+9syf8XmFtGWdTSXO+sHVnV0JDRPf8fkMO65ZZ7l/7IAHNFp2+aivm0q
         xFdPKQ1VVCh/hjAPWoOWgeynFnR4WSWOwVkAd7e/dlv9q0eRZ7uu0PR+hifEKtstrt9x
         jsDBzHX6eSPugovo8DfBxxHKIe+lw1P584vLNkZO7VM+MmkCxbAPm94riBpfglUlYqj9
         +bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B2g8xr6ORMvXj7zL/agIvKeijRHqKaWp1feA3q2tJ2Q=;
        b=y4Taor8u/8oiw8jxPJunHWYaow2x0HjiqA856C5QvjL1/WYvax23FRz2zNj2Rl2lDp
         o8GmJUkL11MkM5uvk9oPi3yaTfURmlfWtkyGNeGrX72Y8VMYcAfYnQgEPpG14+Hc7e17
         Aq2utvxrP6vDUljZs8Ixb+JIkqkbpge0cKQBTGX8Xy3QHprgxH0HEpGe0U0giExhlli1
         K9Bc+vVrFRZYtWp8rzFmR7FcuC5y6yvslCoD8QEvgQ2FL1CIp+OFDGxfejvV0of6GFp7
         oB5SwYJE6h0IqYSK8IXPPSATktz0gUVTzvx5l9V2jwze7cPX6eR1J5XKEwyjcBrq98yk
         57hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTZJSYdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w125si262029jaa.84.2021.09.03.12.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTZJSYdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEnn-0001uI-7D
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEij-0006N0-C4
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:19:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEif-0001P8-Pj
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:19:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id v10so141372wrd.4
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B2g8xr6ORMvXj7zL/agIvKeijRHqKaWp1feA3q2tJ2Q=;
 b=HTZJSYdCYVcWzWgpyaFzoRVqlWweDFYNI8v7LCQcNqDS1sIkwWVt46k9HdpR3nk4eu
 rppyZnEWib3ZC0lKRXOPUT84wDV28zkhITv/lhlnWQiVfCHU5RkFOK8wZ6WAk3wzdm1A
 0SqF/+JuYO4p49YxOG2YaOJUWiFPMvHCtziFalpeh/5jAjapqXZUwhnAIeWICAAjY/ny
 znSJwKCfOY4inkfaoPxWYg+eezoW1OEcMADSyEuY4T9m8mpLTHJ9+t+sby4eIKiwwHmo
 jlvThXw4jqfGyNOyY39Gtxh5festXfctGOpfiJcbKnQaoVdRonpRgJS+L7fxoS6DuZvs
 nqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B2g8xr6ORMvXj7zL/agIvKeijRHqKaWp1feA3q2tJ2Q=;
 b=oEGNb7OvGAUW/Q+S33OfeVf4yPJSgsmaz5eS1l5c44m5k7//Oi4B1/F2p3wBCxLP6F
 Qbel9HsbEGF5qKQq+kf4wUGrrFb90Z96Xu3ji0e8fc0+aSzj30XU/44kEU41i3yW1OFg
 ABRZF0gvPUh8jNqNqvN6cy+a7u4woZXLPiNJlA0lhHXeWYPZ4RO84RBnA9jmduOBsVKP
 Hj0K0MBgWKdaqYws7qmkOiIUF+TkXWfXhYbr0KZ2fhyrhDkb/Q7OMbL/JF8suazDz08F
 BlCnswvSwr/xz6b9X4MqY0479I3cOuIBl3xiLwRznCgCmd4WkJdOp/JXiTuM8ZXuc3v7
 ScEg==
X-Gm-Message-State: AOAM532zYPilKYdAYZgFi/UHaB2Yioe2f9+YxT7XMLHsSjggFQsXmozS
 KaS2sj5bAb1yGiJCs3hJUG+GNw==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr642363wru.80.1630696760130;
 Fri, 03 Sep 2021 12:19:20 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r25sm122511wra.12.2021.09.03.12.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:19:19 -0700 (PDT)
Subject: Re: [PATCH 17/24] target/ppc: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42c8e86b-64fd-05d0-cbdd-c47558986b64@linaro.org>
Date: Fri, 3 Sep 2021 21:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: opIDw6t3ZGiy

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu.h         |  4 ++--
>   target/ppc/cpu_init.c    |  2 +-
>   target/ppc/excp_helper.c | 21 +++------------------
>   3 files changed, 6 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
