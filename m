Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp889079lfq;
        Fri, 18 Feb 2022 09:51:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU9q8nA7WoGkUmP8Ev8LOHNi6Bz7cTKvH9j8otJLwW2bODS2gL6YX3GP6n0Rpcu+3oPUVY
X-Received: by 2002:a81:2450:0:b0:2d6:aee8:f0d5 with SMTP id k77-20020a812450000000b002d6aee8f0d5mr7612456ywk.81.1645206671619;
        Fri, 18 Feb 2022 09:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645206671; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/UsQjHznlGatWnUDz7uKaHKuJpwtdz86kiYW53rYs/Ffv8/ltRsiAE9yyJm6FTh74
         KX8Gg9PLvqAX6Ci6Zd9m9nYwhh9V9np5DdDn67D14d543Qh+GcHJ3v9xb/5XP9ftiZyZ
         fQ0yT6oXBd5ZSNOhlJRJgIVi6nRmJ/QMVymbB7mQpIWF8p3TMFDZfPMksMDRl4XBTbQU
         yPZIe57Q2U7HmmBTMjwFc50XSaXrIsJkKB3uijDnk6iDvQ4Q4RkMmSCS7EjUxYrDqNqG
         12WWEgaGYlQ62JJ5SSOCf5roJFP9fC5p5yLb/t88EHKBN8O9wnl6x+4pSCoBN1bZqbkJ
         Vnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=z8xF7F09+ASZRQeAFnMumuZJebLhU23U8TwXIiviPHs=;
        b=MzEOghkRhJExI37EbS26H7jxcLGcJUoj9qDweey0sCD7CbJ75/1skU/IKBdyO6/R+P
         duKR8CwMOaU7+3hueYcKGSKN+qTXWNoJn/jaew85JOP2vhGadxB7RFPgWdPDQT6G4BUx
         pFzVehM8DM2T4GYyCPWKJlKcnhryam9WTHppgjuaPTRMkQ+8U11R57+z1eeGvjd/hj+v
         rBvymTTVgaC09a71S2DCY4+62u3kq5C/DhL1JDNh8YHaI0522eZnVjEMEuqBQMdFc9+N
         K62Qgtzyxa/UywvifRqHd4B3ZdeQuXmqZHVK/7VJNHRmt9yubsjjmzhXEJ063wfSUamO
         bUqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TjGdnzoC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si20320639ybs.308.2022.02.18.09.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 09:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TjGdnzoC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nL7PT-0005Ed-2G
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 12:51:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7Ov-0005Br-HD; Fri, 18 Feb 2022 12:50:37 -0500
Received: from [2607:f8b0:4864:20::102f] (port=50957
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7Ot-0008Rd-M5; Fri, 18 Feb 2022 12:50:37 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y16so1042502pjt.0;
 Fri, 18 Feb 2022 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z8xF7F09+ASZRQeAFnMumuZJebLhU23U8TwXIiviPHs=;
 b=TjGdnzoCNTRtyVze3Y/iVQN+J5nKsmo0Ky+lT/gzxq2SDvb4YpaQ3jlr3rKrxDSTh8
 iUCkoGPN1n2AOZz/+1PKdlPf8rRDqeM4V25906xVmQ7o0Nl+vmwvQlgcr/9wf6Z0nHPX
 RD0O+qUfpHoIIFlNgHOkt+6NVnHzYJcRNnAJW8c4AMrK0UJcbA1bh33mKqb9/2CosT/v
 ravhsIsqn2gTbadIZGLjpqmN2skqoYh9Vy20Vsr/Fyggsjbp02swPz4ez4Fqh7eWTfOo
 MUeNeYh9mm/nsAahTJmIgBUz8EvHOVfOxb5j/MQZqwxh2jIJ3a+N30+Ci19CQ68FcH5c
 WuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z8xF7F09+ASZRQeAFnMumuZJebLhU23U8TwXIiviPHs=;
 b=zbJUfOCspnaFcm8FaKGVRdRDjLB/cd68Z4pJAJhD0azHdDLnxc3yJUAG60U5mVonRC
 3fcvWibA9zrQRYt2VWYPzMG/qspg8v4lE5VuZV5975sKQtnpgYpaEVatFPbcaGL/GKZt
 HLDTOHPtgEN4mTw9lVBE8OqPDwXaS2LJJ6E2OMxPKLZCKPu9dskaETeqXOmOSSDEvpD3
 vEJnHScD+bb3KRPXcHTFFIm21wiNdRpbIT7u2URR/nM0ThLSnStbhGFRrG9uIvjgvRFT
 IyIy5ZHTo4E/6adHOiLj/BxGm1lnrXxaNlv1zO2mQN+Z3kUis2wqJnAW2fINLeU7bsWv
 U0NA==
X-Gm-Message-State: AOAM530ojfq/8idOa57re3L8k7iY3Dyjq7wvQcYCVvwpA58r/2h4px2q
 jYLG3dzyTdvCSC2n/kZRdUI=
X-Received: by 2002:a17:903:32d1:b0:14d:3bda:1144 with SMTP id
 i17-20020a17090332d100b0014d3bda1144mr8449771plr.37.1645206634124; 
 Fri, 18 Feb 2022 09:50:34 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id 69sm11736985pgc.61.2022.02.18.09.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 09:50:33 -0800 (PST)
Message-ID: <0d07086a-dac6-1a32-acf1-95aa81d2e816@amsat.org>
Date: Fri, 18 Feb 2022 18:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/7] aspeed: Introduce a create_pca9552() helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20220218081815.641169-1-clg@kaod.org>
 <20220218081815.641169-6-clg@kaod.org>
In-Reply-To: <20220218081815.641169-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: vqvKNiknsend

On 18/2/22 09:18, Cédric Le Goater wrote:
> This unifies the way we create the pca9552 devices on the different boards.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++----------------------
>   1 file changed, 27 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
