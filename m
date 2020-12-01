Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp255856lfb;
        Tue, 1 Dec 2020 07:23:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxsg+l/KMmdyNqrOy5eyZjeWG/qQlOcV/xulDTLNXTQL0k2Z523rw7PoyHTBAeyLH+EBT7
X-Received: by 2002:a25:6a8a:: with SMTP id f132mr4020161ybc.458.1606836217675;
        Tue, 01 Dec 2020 07:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606836217; cv=none;
        d=google.com; s=arc-20160816;
        b=Rx4OOcq2Qfc3SvV6dlcW//hpWSOgxs+M+M0gPP73LxpeKptzAEuDGCZK4HfG/L19xI
         Kg1eroWRexw+SXzzndLa1tZ8KmbAbQ7EXHh7jhdBagod9pwfkHKnqpgoV/tcnqjTDq/c
         P9n3Jhm3eGtbtyAcko/aRQAd8EDyIU6IewhSVdxdhqwyeYzO4H+KpW0vlqWWPGsoq6bq
         iVWR8qdke5+7KDEE6kcmidaE05XqPjJNCRV3qAGekbcViOmV3orOyILV8KWtBTDMn4Rw
         jrb5dvc4KR/4WRq/0g4j83C0zqisFlLQfUAARR1sOGaq2BWv4pdV+le6N+0JddZXqT5T
         RgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5B3yeB35yot3p12PYJ10IHM6JJWcgLJzOSFKLmKrIB8=;
        b=TPkPHMdhLBrhVxDSCFxv9nihWPwqEj30JiPJIG8FGUls9h/8izFfw+MdDB8drMU9AO
         UO2eyOa51aeRz/vAfm8rxhZOZYkHysZdIEj+Tn5dSzR/7qdk8rt1XanmC1vM5VqAcvff
         4p2BL9vT0pb4WW0V+WGHkKHOS+yfcslQi0Nyl4W/zWYmAdkHs6YNL9o8mmIkuvrMt2S8
         zQ13fcTp9vOKDE6zdvIn6zwB7B8esNCc0h8Cp1VE7ZoruqKwcdBUO8XMpDwGsV3TljhR
         ADxDLIOXwtey6u/lgyDPJOiLYq9uDMmqssvAeRlPk0Uv4ijKE6S7wEtPvDF1S0cJ4Xe8
         J7nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aUEfCh/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si75394ybs.147.2020.12.01.07.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 07:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aUEfCh/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk7VB-0000xo-2t
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 10:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7Rc-00058l-Rr
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:19:56 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7Ra-0003LV-Vr
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:19:56 -0500
Received: by mail-ot1-x342.google.com with SMTP id n12so1989705otk.0
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 07:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5B3yeB35yot3p12PYJ10IHM6JJWcgLJzOSFKLmKrIB8=;
 b=aUEfCh/iCA4FyfT8RMwfTwsQJNUP/V8MkBrqp1LrgdgYoR4FTq+x4zoihcFnAv3XBU
 aalNUEcYjH5uOi4HjWOZK/E6biPOc32fSUwa2tlK6xyKk2SUkJGU7bzw3vJ2lZkYr/Xa
 c9HZY+MYt/GUp4AP7QaMDbaZwbVjDnNit3B4RQgucnQvyugRu7IGolgTIImNb0lee0pE
 3o0a1WCSqTxn5zaFDbX0ahhqyl6GXg0DLgc6AZzk7YDuaLkOpSwCAYMtvFzHFZbIo6/F
 GXmNBOds0g1s81K+BO7coGAjtQEPzP8SLVdm0eE6V11koGbikLSbQKKWNjJNsYF9aScx
 frug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5B3yeB35yot3p12PYJ10IHM6JJWcgLJzOSFKLmKrIB8=;
 b=SMVdbn3xhxI/NRRBJFHkXy6ND5qUby+z5FkRTG4jwbT3wXJvXs1siLI/OZMTGUTGA3
 CDA5iHYxS1IHAfPTcUAyZKSbUmM18xqueqi12Qhd1QJevzviae+/iL2SIz2F5RiOloqM
 DZkzbgWhYV8Tu2sXwS9kn5x/N/zmQwWpnQgWvnzUlT31QyZGqjUMxuKll7/li8NTBmWl
 05aLbFflrUSsSoqKKzV3jcbGun27uW8slpOqd14ApY1eANnHdJ7urEBBcHN/aVN9iUA4
 Vj3p/+649B+3FwtLwlum/UNGZF73Se5xsHEAXUnDCtMcdgZoJV2lwTwg3hJpyEga0A9Z
 /5qQ==
X-Gm-Message-State: AOAM5309LUx5Dr/vgO8aPKF2Oj4xM5SU6O3Wp1CiKShIbL6qRDW82YAU
 +NFpfKmxhBa5ljhjYQzxB0B1Vg==
X-Received: by 2002:a9d:3ba5:: with SMTP id k34mr127010otc.198.1606835993671; 
 Tue, 01 Dec 2020 07:19:53 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id s15sm430914oou.44.2020.12.01.07.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:19:53 -0800 (PST)
Subject: Re: [PATCH v2 22/28] hw/intc/armv7m_nvic: Support v8.1M CCR.TRD bit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5a6d9ac-4173-8752-7ed1-560c7bd61614@linaro.org>
Date: Tue, 1 Dec 2020 09:19:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /7ZeiTRzVdW7

On 11/19/20 3:56 PM, Peter Maydell wrote:
> v8.1M introduces a new TRD flag in the CCR register, which enables
> checking for stack frame integrity signatures on SG instructions.
> This bit is not banked, and is always RAZ/WI to Non-secure code.
> Adjust the code for handling CCR reads and writes to handle this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  2 ++
>  hw/intc/armv7m_nvic.c | 26 ++++++++++++++++++--------
>  2 files changed, 20 insertions(+), 8 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
