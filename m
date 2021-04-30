Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp148652lfg;
        Fri, 30 Apr 2021 07:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNzYqF9bqOrTD5f4eEUt0vqnbTcdPoAQbHtKa55Rglueff7BrIsCBnkgy7R66RL+VavHgC
X-Received: by 2002:a02:1c81:: with SMTP id c123mr5272690jac.42.1619791765080;
        Fri, 30 Apr 2021 07:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619791765; cv=none;
        d=google.com; s=arc-20160816;
        b=G+G6KBmPB4Q72xOUV+m+QA7slMtF74zZxrQ3tOR8JSk7s6a4iGq8+rM0UnVAI9yNVs
         2W3sxFka9NaOTEyP8s+/IEHxSW8yrX7KhzsEWAw0f27Pm8p/UfI5wXCl7Gz9il+2WNKZ
         P+g7NfHYWT9KcEbbyCxLAragC5O/OAO0gzWck4ZjF7SkvqfoplMPUqk47WtT7V5Wm5Rb
         V0e7Wwp3N3C/BucxpSV48XRYD55cL5nzv9R3TQ2IPqMHlAAXuH2HvjmS/X59Ag4HheRU
         lD1WYnFJ4fkl6gbtFwH+hHOw+GwrMtxZ09QVGxKiKnD+Xa73a2SrVrggV6PrJtE4AGb2
         YS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=fXU2uDZ4dSWxzq1N3G+ZDodfHw5wG09Vfrav6xSSpRw=;
        b=v/jBbFO6XiIgCSGk3A15KARtXoE86jiVlTOsaZ3CHCx2k4WN1fPgs+9QW5WmNRaaoP
         /wFOT0hh39j6QQ8iQAg/CR604KogAg6zvshwjJj6ythf1IG5IfFb/WG0Mz4dpjLKQT/J
         PXuIE6eciz3Bt2gJijucIJmWbBa5FQ3We9U7GRs35Is2J2oUx9zkpiIoDs1u15Npb0Tp
         /rkV3/35rps9LqykrQeQ4l3apQr/EV9qjYT6NC1QfEGVVNQKx1IMJhxvMVSpumTDMH1I
         HlPopakn9c5LQ1qsCnZJhCReYmfGviYkpeF55QBhw4Cg3Rx7PXOKuIMZ4qZohkDML46H
         THZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20si2426096ila.16.2021.04.30.07.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 07:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcTpc-00013S-CF
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 10:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcSzm-0008PI-8l; Fri, 30 Apr 2021 09:15:53 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcSzi-0005ZR-Sr; Fri, 30 Apr 2021 09:15:49 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJmbB-1lsDco48kb-00K7Q3; Fri, 30 Apr 2021 15:15:32 +0200
Subject: Re: [PATCH 2/3] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424222057.3434459-1-f4bug@amsat.org>
 <20210424222057.3434459-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2d261477-1c80-2bf4-b9a7-c4a8c6f96204@vivier.eu>
Date: Fri, 30 Apr 2021 15:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210424222057.3434459-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RwoVAG/kMqlrAUiGUgtxmkMw2dLGS9jKgk+F10RwzZgcWr334RP
 OYLNJp9uItOEUAoiyt52LZG2j3Kktl+NYwrc+3aeyGljgL+Z/aJongdSfV/mid/zOWVHsIQ
 gJJz4k99P+BZ0SSim8RZUEloRQ4O1WNa0GEB8N3e7p0rg/DOl6KMWV7WzONxL2wwSdUi14H
 w1Wn6yNjdUuBKYZEXoSFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J3+friCS7MI=:F28/MohQFr7c/3o5kjxOlW
 99Ts07lo83e+85emw9gHf2u7cbHzVs/ECH1MBTsU8+GP1PiMmE80hpATkPegcnDgWYx+bwoeN
 W5eKPcuczzv0ttEmBtTE7ZWr3k/lPN4Gnrt74yson8n/0By8oV67OsJCKnwPlZi2sQ7lrb3tl
 EKsjOEv+kYAvLrgie6eXOwnQiF7lCFBokdBca7fy2ls7sfrdZoTe0S0ndJGxVohbw7JUBT3ty
 z2Fx5a3TzVCVAfLbqqyjfJragfNuvnaE35qkjkctRORg6ymuz9iGFdDkEFM16ztowhXJseU+U
 OrIQUAmFEAIYIHckvc0qxpthY3wCbl8a4/zunImdoixYqNei2X0F2FvgYVnaplJ5sbg3SH8D/
 fcYoI5E2+4o9fua01rFyV73JNptH7uW7cM8VZgD6Dom5zwEXWwXt1FXEt1oaYG8A/mRs8yp83
 mi7FVZwnKX4L8q/KWSrWWKLwsBt3x0wkoD6uNy/24oH/XRNX6d3fvXkE8ckmu7VZ2rX1Vu9AG
 tMJO+xSehM//a9BNYh9MY4=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aptEFGwvRiIL

Le 25/04/2021 à 00:20, Philippe Mathieu-Daudé a écrit :
> The Microdrive Compact Flash can be plugged on a PCMCIA bus.
> Express the dependency using the 'depends on' Kconfig expression.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ide/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 5d9106b1ac2..8e2c8934549 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -41,6 +41,7 @@ config IDE_VIA
>  config MICRODRIVE
>      bool
>      select IDE_QDEV
> +    depends on PCMCIA
>  
>  config AHCI
>      bool
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

