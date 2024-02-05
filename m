Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1162924ejb;
        Mon, 5 Feb 2024 06:25:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSq6Zhf7IY6qQfgnr5ZDxRWbmCBxyMlSqeaEaS5eSUbUDqXWKq9ZzbLhsKBSeEhLkXIXnK
X-Received: by 2002:ac8:408b:0:b0:42a:ad1d:e6f9 with SMTP id p11-20020ac8408b000000b0042aad1de6f9mr6572012qtl.60.1707143145571;
        Mon, 05 Feb 2024 06:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707143145; cv=none;
        d=google.com; s=arc-20160816;
        b=e1MAe4/mj08vArjc1xl7d1YgawWQCmKGIntByzO7myY071edsK5bwVcWj9qg8w2wbk
         Wtibx4D0d6s/NygiuGirvDjS6xHqYx9Pxr/G/srmN9lkUt8VFqt4DpCIqmSFVDrxVgwL
         BrS8NB5tIb6QhKNQdjuXhGLz0/a/CcETr8i8COeJy/KoyIhzNGQ9rUHQMDsgKPQ0btkn
         DeE1iioab7myKgqrItk/vfOZAuBJfXiAKBIabXS0zRYkp6IOb2i5ddp6RZeq4/V+ML6Z
         f982fQZ1WKQQEB9s+s0qP/qGcXintK2t/PSPRj+B0HO1V3ZN4xINWzb1X+DT91N6gjQL
         f3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=NhRwfXN0hDUwfush7jIVHmU0MYw8BgomwkSFxxTx92o=;
        fh=BzWVr0m8SwZyr3ia/Ap9LWIw/XoHYEvEjJDa0jBLpHk=;
        b=MEGrMC5NQPQfrLIwjhYJs3wDnMj97neub1EsSPi9ieHgTIJGK/5E/CjXvSmhf2y5Hx
         B6QV2iUylQY8evV5N676VnIvV7P8hh20z6jMawuJirYfD5SSEm4TwjjcXY5Ed/I+y4Aa
         0iFdScSMv0CiWXEENRNfoXR5LZ6ysT/uvr22A2sMUHGyZ45qw2g6eaZBQH0GI/Zf8EAJ
         UmkCLSedJ4p6M5hhBjl07/HTdwqcAZ71L03SbmJ0dv6RuYyhzJ93cs9uBrhHZ0Svs3nK
         QZ/MDjHalVfVIPgm3OSNYpNVRioLBvaPLnWOXQMSxsk1D+jXQKFbgGJC0m319kAj2t3u
         Ha2Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCVEyDgp061gZvqNdxcrKRPAzWpzbWSTfN9qTtZsQOs0jgrm6cu6iNPUiyi7M+xD0VEhQx6BHyNmkDr8QFHzOW0YQG1M4iEm
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020ac87f94000000b0042ab594e31esi8773916qtj.361.2024.02.05.06.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 06:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rWzuZ-00020X-Ek; Mon, 05 Feb 2024 09:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XBpg=JO=kaod.org=clg@ozlabs.org>)
 id 1rWzuW-0001yN-CV; Mon, 05 Feb 2024 09:25:24 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XBpg=JO=kaod.org=clg@ozlabs.org>)
 id 1rWzuT-0004N0-IS; Mon, 05 Feb 2024 09:25:23 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TT7vH3vF3z4wxx;
 Tue,  6 Feb 2024 01:25:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TT7vF2nZ7z4wp3;
 Tue,  6 Feb 2024 01:25:13 +1100 (AEDT)
Message-ID: <30e7e323-369b-4ee3-994e-a6cb9205a4f9@kaod.org>
Date: Mon, 5 Feb 2024 15:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 1/2] aspeed: support uart controller both 0 and 1 base
Content-Language: en-US
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
 <20240205091415.935686-2-jamin_lin@aspeedtech.com>
 <aab5b2fb-e7f0-434b-935c-ff5ad5d39f21@kaod.org>
In-Reply-To: <aab5b2fb-e7f0-434b-935c-ff5ad5d39f21@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XBpg=JO=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QyjTRE1PlHRi

On 2/5/24 11:46, Cédric Le Goater wrote:
> Hello Jamin,
> 
> On 2/5/24 10:14, Jamin Lin wrote:
>> According to the design of ASPEED SOCS, the uart controller
>> is 1 base for ast10x0, ast2600, ast2500 and ast2400.
>>
>> However, the uart controller is 0 base for ast2700.
>> To support uart controller both 0 and 1 base,
>> adds uasrt_bases parameter in AspeedSoCClass
>> and set the default uart controller 1 base
>> for ast10x0, astt2600, ast2500 and ast2400.
> 
> The board definition can set 'amc->uart_default' to choose a different
> default serial port for the console, or use the "bmc-console" machine
> option . Isn't it enough ? May be I am misunderstanding the need.
> 
> To clarify,
> 
> ASPEED_DEV_UART1 is in the first serial port on the boards.
> 
> I think we chose to start the indexing at 1 because the Aspeed QEMU
> modeling began first with the UART model (console) and for simplicity,
> we copied the definitions of the device tree from Linux :
> 
>      serial0 = &uart1;
>      serial1 = &uart2;
>      serial2 = &uart3;
>      serial3 = &uart4;
>      serial4 = &uart5;
>      serial5 = &vuart;

The uart definitions on the AST2700 are different :
   
   https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v6.6/arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi

	serial0 = &uart0;
	serial1 = &uart1;
	serial2 = &uart2;
	serial3 = &uart3;
	serial4 = &uart4;
	serial5 = &uart5;
	serial6 = &uart6;
	serial7 = &uart7;
	serial8 = &uart8;
         ...

I think the names in the DT (and consequently in the QEMU models)
follow the IP names in the datasheet.

I don't think we care in QEMU, so I would be inclined to change the
indexing of the device names in QEMU and start at 0, which would
introduce a discrepancy for the AST2400, AST2600, AST2600 SoC.

Let's see what the other maintainers have to say.

Thanks,

C.
