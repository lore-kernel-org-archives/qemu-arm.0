Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1343315ejc;
        Fri, 13 Oct 2023 01:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3R1FbcO7WtYtQ/uryYcX1dMcthtJ1gl1IQ+O7i/fEVazg2ktOHfc7WJqo++g+0cBQNQKZ
X-Received: by 2002:a05:6214:5004:b0:66d:20f5:23cb with SMTP id jo4-20020a056214500400b0066d20f523cbmr2817050qvb.5.1697185178226;
        Fri, 13 Oct 2023 01:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697185178; cv=none;
        d=google.com; s=arc-20160816;
        b=K00ZCl3srLzTOZiRHDq4W0NkPhzC6kuf05dHEGwYMaNaLdNwzWArnxljbmeN/ojuoR
         1hkHG4KoZiPWyzW6T9t9oKQFI4dy3P7MdnzxeHDxwEU+UUfeKb3VOokpGVegTJ66Ej70
         nYwrVzeSg40j9fIHx0tJW2bulUbVtKGpERng4XMPx18Ymhgc1QNzRKzWmjoGru23s+0p
         qdrr+6icp+2kk9wN2wz1K9mb8sohW+N0RkYBlSdxmn2f57ip9qqReFTJ2xSIPcgm7mHH
         omFbggk3+7xQMADzpe5BLbGo9U5nr/PCHfGNanvWyzWFE3Mp487glpLPwpJ7I+ZEmz4o
         gIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=IYj6spYS89KMXhcs8aN2fWKxbws+j7PR8wMYf4o1hUo=;
        fh=5vA2muZswkR1q/roLr6uQ8j5AhqJA6wEjM94DXDXBZ8=;
        b=xb07Ea44lW+M0m4ddBF8ws7cTQeA5F08bKKEWcz0PmiFffHU6z1AMmBKBGzMY/3+Rn
         SFDseCXu82NjFYhDqYv+DscronicorYGJ4tQ9L+tFenJ/Z5sOC8JacS1j7KpBCf1A/N6
         ZnHosM6L46vQCBZ87xFrf039pSv709Mu/EBDEUCiSNVu7HGi2126phbzqEOYeOI5EyEQ
         ovIIK1A94KLnwfg1Is2vZlqIJTZWo3fCBtvn9i8ODQn+MG6zR6hrHuJWsEio2UOPs0A8
         OwVe7W4iJRS9EkWfT0/xNMQBiwGvgric3QeE9nw1+AyLLHySIOMGqNsweCtTWO7su/vj
         GC8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee16-20020a0562140a5000b00655e555f3f8si846817qvb.566.2023.10.13.01.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDIm-0007H4-9x; Fri, 13 Oct 2023 04:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fS+4=F3=kaod.org=clg@ozlabs.org>)
 id 1qrDIk-00078p-Mk; Fri, 13 Oct 2023 04:13:42 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fS+4=F3=kaod.org=clg@ozlabs.org>)
 id 1qrDIg-0002Mw-JC; Fri, 13 Oct 2023 04:13:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4S6K5S75bmz4xYc;
 Fri, 13 Oct 2023 19:13:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S6K5N3NN0z4xGQ;
 Fri, 13 Oct 2023 19:13:28 +1100 (AEDT)
Message-ID: <d3a98f5b-e95a-4824-a12e-3659e2d13e09@kaod.org>
Date: Fri, 13 Oct 2023 10:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/78] hw/adc: add fallthrough pseudo-keyword
Content-Language: en-US
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <5bd9400e01587cac991c16c51ce0f89982f3d529.1697183082.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5bd9400e01587cac991c16c51ce0f89982f3d529.1697183082.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=fS+4=F3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 6RPHQs2IPU+9

On 10/13/23 09:47, Emmanouil Pitsidianakis wrote:
> In preparation of raising -Wimplicit-fallthrough to 5, replace all
> fall-through comments with the fallthrough attribute pseudo-keyword.
> 
> Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   hw/adc/aspeed_adc.c | 12 ++++++------
>   hw/adc/zynq-xadc.c  |  2 +-
>   2 files changed, 7 insertions(+), 7 deletions(-)

For aspeed,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


