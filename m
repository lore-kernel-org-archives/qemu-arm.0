Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1251465ejc;
        Fri, 11 Aug 2023 03:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQRzs9i9QHjV+HUnoLehxrAdF9dTfdMmIf4VYKg6cpOrjvtUtX5+vk+oOKE0u0iNdwo4ZN
X-Received: by 2002:a05:620a:450d:b0:76d:2f15:56a9 with SMTP id t13-20020a05620a450d00b0076d2f1556a9mr2108985qkp.31.1691748098307;
        Fri, 11 Aug 2023 03:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691748098; cv=none;
        d=google.com; s=arc-20160816;
        b=XARYht5KGvLz7fiHf0MVknqAel7y5kZuFP+lKZp8MkGke27gEPL/kJKKJT2SC60iLx
         hQZd1sUzpp0eoQGWQmRyFFbnBOEPt4kwSQIP0Q8ecOx0eya21HtuH2m+5bH1zZUAXef0
         b5eKmOpkApr9dT+Q5swhlUtWBmRVnqL82iGijiWgSsTnOwZ1R6ozxkhQqdlNg53D8vE4
         A7QGnteOCw4zMMnLoDsYjkraT4AQKgEPwnf7SeCGOsjr8T35h/iA4ba9eWvBIHctx4++
         0dQNJLMRqV8qQYpy6l5Swu5uwnnk0cLx2RwO8T2iDYQz3evMv3XCoPcD+eA1iXGH9riz
         WtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=KCVAsstOROcoUyvTOUJOR1x2PMA4UeN5BDLyazmB0jI=;
        fh=ouI/CTV8T8JGLwq0IhyvUdDthdq3y0ytmdmdcKFBnKI=;
        b=eX8q0iXeW2hwGGRrkkd8E5rxPmX2StctFc78AuFwWnymlDWs+QdNwlkSTuMwq28UZR
         ejD8T9fISse1o3S/sjZb+mwrff5MGsIc3ZMPEeMTryUgHC1SMWjDBhJF0O2ayTgNjlEk
         sG2oQkcCEjjvtdW+N/gud+kCvedON8NuXiKxR1EHt0nuFICXB74orx62nkgX2VoyQAfx
         LIF+l28KquW67bKNoreGr1kLnNCa9zByp54HRpoZd1IuWvWUcvT6pekXwtx+yjxmV6Xu
         0B7aWWMRj1HY8TX/XVZemUTzjpwiluqyaUXOUVzs9rycUVzAQkvaMkEsyelE0qYjbFwL
         lgGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a448a00b0076cdf0d3eefsi2177842qkp.245.2023.08.11.03.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 03:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUOxM-0005g5-UC; Fri, 11 Aug 2023 06:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qHib=D4=kaod.org=clg@ozlabs.org>)
 id 1qUOxL-0005fA-8I; Fri, 11 Aug 2023 06:01:19 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qHib=D4=kaod.org=clg@ozlabs.org>)
 id 1qUOxI-000220-5H; Fri, 11 Aug 2023 06:01:18 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RMfSZ3RT7z4wxn;
 Fri, 11 Aug 2023 20:01:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RMfSW39bPz4wbj;
 Fri, 11 Aug 2023 20:00:58 +1000 (AEST)
Message-ID: <5616c9d6-315f-dbe1-3c75-d5b931277714@kaod.org>
Date: Fri, 11 Aug 2023 12:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/4] hw/i2c/aspeed: Fix I2CD_POOL_CTRL register bit
 field defination
Content-Language: en-US
To: Hang Yu <francis_yuu@stu.pku.edu.cn>, qemu-devel@nongnu.org
Cc: komlodi@google.com, peter@pjd.dev,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
References: <20230811054220.99562-1-francis_yuu@stu.pku.edu.cn>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230811054220.99562-1-francis_yuu@stu.pku.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=qHib=D4=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.156,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-TUID: FIFO0mg79FR5

Hello Hang,

It is good practice to send a cover letter giving a quick summary of the
changes.

On 8/11/23 07:42, Hang Yu wrote:
> Fixed inconsistency between the regisiter bit field defination in headfile

Fixed inconsistency between the register bit field definition header file

> and the ast2600 datasheet. The reg name is I2CD1C:Pool Buffer Control
> Register in old register mode and  I2CC0C: Master/Slave Pool Buffer Control
> Register in new register mode. They share bit field
> [12:8]:Transmit Data Byte Count and bit field
> [29:24]:Actual Received Pool Buffer Size according to the datasheet.
> 
> Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>


The initial macros included a '+ 1'

  #define   I2CD_POOL_RX_SIZE(x)             ((((x) >> 16) & 0xff) + 1)
  #define   I2CD_POOL_TX_COUNT(x)            ((((x) >> 8) & 0xff) + 1)

which was not reported in commit 3be3d6ccf2ad ("aspeed: i2c: Migrate to
registerfields API"). I think patch 1 and 2 should be folded, could you
please respin a v3 and add a Fixes tag ?

It is too late for the 8.1 cycle but these changes would be good candidate
for QEMU stable. I will queue them for 8.2.

Also, they fix booting v08.06 SDK which is great. Here is an extra patch
to change the QEMU tests to the latest version :

   https://github.com/legoater/qemu/commit/08243703f48f5e9c263773a846f7dc655cd64bfa

You can include it in your series if you want.

Thanks,

C.



> ---
>   include/hw/i2c/aspeed_i2c.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 51c944efea..2e1e15aaf0 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -139,9 +139,9 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
>   REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
>       SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
>   REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
> -    SHARED_FIELD(RX_COUNT, 24, 5)
> +    SHARED_FIELD(RX_COUNT, 24, 6)
>       SHARED_FIELD(RX_SIZE, 16, 5)
> -    SHARED_FIELD(TX_COUNT, 9, 5)
> +    SHARED_FIELD(TX_COUNT, 8, 5)
>       FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
>   REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
>       SHARED_FIELD(RX_BUF, 8, 8)

