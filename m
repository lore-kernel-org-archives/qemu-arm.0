Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1925472ejb;
        Tue, 6 Feb 2024 08:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/AB3v7Eu+EFW8cpSZN+sEeQNgdtPNuYVDu1da1Tgyb7DEIR9OZ9VZXbg25rKk/OBcPPVT
X-Received: by 2002:ac8:7c9:0:b0:42b:ee7e:8876 with SMTP id m9-20020ac807c9000000b0042bee7e8876mr2569978qth.24.1707238026237;
        Tue, 06 Feb 2024 08:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707238026; cv=none;
        d=google.com; s=arc-20160816;
        b=mEj9Bgk8S2kaASveyi8F6uuZpq+JHaQxqsJMkE9z7tqQtFh91MF+2NqtNWzUbu1oNg
         z9xjUQy59za74to0b4atL9phfhSA0haQb96OleeWnTOrcFZn/G292SNy0iq8m4n4DnqI
         lfOHxKHgpfrOht8nA3pLpggnpfzKkUzO2qkl2frJdpKWDeOXcGqfc4BhnoxOwSFFdyWa
         +MDYxn10zIOAApS+nLlHVn4o9Aln8gett4wXzPNyCI7u4mZcnCBXysYDms6pGBsKq3rp
         4wRMjT3X2Qbs9s7juR6UW8j6TDimtKDBJxOGvFUFp73zBW7JT2LUc4JvZMJupfkpIqE5
         HWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=aghLp2RTWpj/DkKfPNAKScFvfco3FiAJ6eyEer1RpJU=;
        fh=iTGnywtapZSUh5YOKt/ExL7t7C7iLq/3Lvx+Hjvo0tY=;
        b=GA9J6zJjR/RJGO/ZxrmDJ3YiN9SJddOeOlnAbuA8yqMw4xXe3nxRuLm7TL39yR+DaK
         kPOIDsvcaZ/CLFDdKxmXi5fOiNCOQrFYJX1EEeBX37enUmltW5qIckw6kxM86ENWSNwJ
         SSsTlkiugowiea4AX1VqznsfbAFpejNSW7neIdRKfWXWP4P/EvoBWDpgEqtLgwabYrSd
         5OUnw1GwCTD7gRMri34l3BA8S7WLst9EDqvkmmwCSEDzvd/CusshYnCYglSzNRpbmsqS
         e8H1XzsiMNCZGZ1iNE6MPezWPW/c6bbefmovpOutlaC5+944HwXit3BDL9AhLqF2C9TR
         AWsQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCWEWW25/4DJyCjTIzVsuB/RdDmsmi0MW9hEanBuVjWKHgHLyuJ8CuZDzrlRDUEytwyfUP8sDrLgaA3nzEVwBkXEoMKECt6o
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp18-20020a05622a1b9200b0042c3843c3d7si1196247qtb.188.2024.02.06.08.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOb4-00043A-7B; Tue, 06 Feb 2024 11:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=f3tV=JP=kaod.org=clg@ozlabs.org>)
 id 1rXOb0-000422-Fo; Tue, 06 Feb 2024 11:46:54 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=f3tV=JP=kaod.org=clg@ozlabs.org>)
 id 1rXOay-0006Su-KW; Tue, 06 Feb 2024 11:46:54 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TTq043wFTz4wyp;
 Wed,  7 Feb 2024 03:46:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TTq0200Xqz4wcC;
 Wed,  7 Feb 2024 03:46:39 +1100 (AEDT)
Message-ID: <39340aef-9560-4b10-8ced-58b84fbf2746@kaod.org>
Date: Tue, 6 Feb 2024 17:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 1/2] aspeed: support uart controller both 0 and 1 base
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
 <20240205091415.935686-2-jamin_lin@aspeedtech.com>
 <aab5b2fb-e7f0-434b-935c-ff5ad5d39f21@kaod.org>
 <da2708e0-c3f3-4e11-af24-07817bc0cdfd@linaro.org>
 <SI2PR06MB5041B14996B7E258F54AEAF9FC462@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB5041B14996B7E258F54AEAF9FC462@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=f3tV=JP=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YTtlg7Vf6xlq

[ ... ]


> As you said, uart12 mapped ASPEED_DEV_UART13.
> The device naming will confuse users because the device name in qemu mismatch with ast2700 datasheet.
>
> That way why we want to add ASPEED_DEV_UART0 and set the memory map of AST2700 as following.
> static const hwaddr aspeed_soc_ast2700_memmap[] = {
>      [ASPEED_DEV_UART0]     =  0X14C33000,
>      [ASPEED_DEV_UART1]     =  0X14C33100,
>      [ASPEED_DEV_UART2]     =  0X14C33200,
>      [ASPEED_DEV_UART3]     =  0X14C33300,
>      [ASPEED_DEV_UART4]     =  0X12C1A000,
>      [ASPEED_DEV_UART5]     =  0X14C33400,
>      [ASPEED_DEV_UART6]     =  0X14C33500,
>      [ASPEED_DEV_UART7]     =  0X14C33600,
>      [ASPEED_DEV_UART8]     =  0X14C33700,
>      [ASPEED_DEV_UART9]     =  0X14C33800,
>      [ASPEED_DEV_UART10]    =  0X14C33900,
>      [ASPEED_DEV_UART11]    =  0X14C33A00,
>      [ASPEED_DEV_UART12]    =  0X14C33B00,
>

So we would prefer to keep the QEMU IP names in sync with the datasheet,
and in that case your proposal makes sense.

A have a few comments that I will make on the patch.

Thanks,

C.



