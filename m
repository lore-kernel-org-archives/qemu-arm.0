Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1528986ejm;
        Fri, 22 Sep 2023 12:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXveylMEMc/TlEI6jez2S3wxYNJRxa04fM5lOeWKdg+DFpwLg0fW4SuAk0ekExMrWHp1QP
X-Received: by 2002:a67:fd4f:0:b0:452:7653:5e63 with SMTP id g15-20020a67fd4f000000b0045276535e63mr437414vsr.24.1695409280747;
        Fri, 22 Sep 2023 12:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695409280; cv=none;
        d=google.com; s=arc-20160816;
        b=n2I5iamdH6PeG1/inzb79Xm0NyK09/EjsPx34WO2OLXbTqeGIRt48GYI7jkN7umkgy
         3Nt46SCdS/nCSxQE6UOD5z/6rksE46OM4Fyxeg1hyNq4jhQ2mbOxn/QK6a/6MCMcsv4I
         1PGjztW4L6dg61HIuGczbVDofZl+NEXV3p45VTnHqrIdy4SP5Em9vk/Rf1ewngAEiMIU
         QVGfcDCvN5JlOyUO8cZPMyBf7nHkU+gDx8t3+51ah0P06ujxMEXdxBRge75aGgIgZbgY
         +O8roFLWf2xBt57/9IiNR7ZH/RQ7QmnapqluhsUgf5G2Nspf/++xUQyeHPkmuunMz6P2
         Vx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=j4kyyox1dufgr3oydRUszjDZLM4Ivy4BHBcPPtaj7XI=;
        fh=Pn0IKzRfq0Kqao6mngbBalr++z+rgeLlqmyhzfHZ9mA=;
        b=UpYPnpl2ckeEL6KCTK4GFzji5BLNLzxtwHpx9npF+S5Jn/Cafo+dSGcQYZJULUrSg5
         Y+1x162Nbnp+uMLfY0bVVO76aL5zjJTjISSwnFUOMSJKhKSbJ7bRz2uXyURDMY8eiOUF
         RS3CjjvMpyCmiJ0hUDiGeeHOH+aGM1ilUpUL/Tx2XruTv+oMI7TtlgXJSNhRX/3ksyYo
         2gc/k6R4ojWOAd8Xanhmzfg1jkPxU3sDp4o2SN7uTpPpdN3w+LQlALstpnXF8PyPNimE
         rBg5UcyVcxPljKNcIbG2u2jzN8aMtcx/A+lz97vsDYJfTUSl8gYmygfwBYR6f29LW06Z
         T7gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a67b24d000000b00447031bc866si498660vsh.578.2023.09.22.12.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 12:01:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjlOX-00085g-RO; Fri, 22 Sep 2023 15:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjlOW-00083e-DS; Fri, 22 Sep 2023 15:00:52 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjlOU-0008Qz-1G; Fri, 22 Sep 2023 15:00:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RshRw2gfMz4x5n;
 Sat, 23 Sep 2023 05:00:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RshRt21R5z4wy4;
 Sat, 23 Sep 2023 05:00:42 +1000 (AEST)
Message-ID: <838837dc-0d95-1d6c-3cfc-e321c9c01a7d@kaod.org>
Date: Fri, 22 Sep 2023 21:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] aspeed: Clean up local variable shadowing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20230922155924.1172019-1-clg@kaod.org>
 <f7cdbd47-1833-af1a-ae09-363c86c2e74e@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f7cdbd47-1833-af1a-ae09-363c86c2e74e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=/LOp=FG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: M+/vhiRUajls

On 9/22/23 20:20, Philippe Mathieu-Daudé wrote:
> On 22/9/23 17:59, Cédric Le Goater wrote:
>> Hello,
>>
>> Here are cleanups for local variable shadowing warnings in aspeed models.
>>
>> Joel, Andrew,
>>
>> Could you please double check patch 4 ?
> 
> Could Markus' MAKE_IDENTFIER() help there?

ah ! you typed too fast and I also read too fast, as :

   MARKUS_IDENTIFIER()

and I liked it :) but what is MAKE_IDENTIFIER  ? really, please explain.

Thanks,

C.

