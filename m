Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5074207ejb;
        Fri, 30 Dec 2022 10:30:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvOz/a++Amp8K+0AFLIGp2SU+1Z1WXcf1fcoV3On5VWyrErT+kZi/5pwR3ECdg5pY8dvlHC
X-Received: by 2002:ac8:4f4d:0:b0:3a7:e66d:a97c with SMTP id i13-20020ac84f4d000000b003a7e66da97cmr52771788qtw.4.1672425017226;
        Fri, 30 Dec 2022 10:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672425017; cv=none;
        d=google.com; s=arc-20160816;
        b=poCoG/34LwkcO5xu9frvVw24kIVN1xlOVAAIiB5vuZmmu3f1nMjy6BQsZFx2IZaXXM
         HuddSYdcV0wLfLEYZ/v/d22DrW47xlFCeuu2ym2UbEFriVMWj+RmKWfQHNGS8gku+9vL
         uRleyv9wSX1MkehOCJJUEMi8584RhINPnTe0MEYBk6BwSzT9PHRyigo5OqBCeXW1c1EG
         WMZHt4CztZMK4+dOH08d3sBNniA8FhiPKtcHIQrp1AHcxTcT8mPam1b5vIBWwffdgEMx
         TrF5xi7Os+xdU5eh1bqox9500og92LqDc9K6z+hlXhjzJCIOdGlQAeURsfDZnQVaphgl
         TGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=l8l1mH/mawDUmBkAKZBqpsTax8xbpGOjbus6WTmZ/mM=;
        b=geS3tp/pPUmFBNdxYSw7US2YoLa7GMYmoK+qrfUAFJFcxGBqxyZHFU56BI2eQDqdOq
         zRN9v7hooTgsGgVrRvb+CEnmVUedijlJHh94Lt64PGT/3e7B/S+2VHsTrKpZi0xSUrse
         j9DYo+Ai9q40fkTPxVECA3qnfLdHfE+OXpfTfBUL64a45FW53Md6fwqE+vg2I15Tau/f
         QYPLDXw1H716UxL4jCDqCUxDlpZul/rim/chs0RZX0JPBrs5nvlRFhlLnhXUAVUcbr4F
         nK8UsOLMamHJI4A6hCFgYJngA+ExaenmPLx4j5pPlMn1IAcY1z45HjJDAzdC/GHY8b40
         ShNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b="XP3/Tud/";
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=KHYFFXaZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b006fcc01875c9si2117470qkp.201.2022.12.30.10.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 10:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b="XP3/Tud/";
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=KHYFFXaZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBK8g-0002eA-MX; Fri, 30 Dec 2022 13:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pBK8d-0002dr-HB; Fri, 30 Dec 2022 13:29:51 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pBK8b-0005vZ-N2; Fri, 30 Dec 2022 13:29:51 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 792345C0114;
 Fri, 30 Dec 2022 13:29:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 30 Dec 2022 13:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672424988; x=
 1672511388; bh=l8l1mH/mawDUmBkAKZBqpsTax8xbpGOjbus6WTmZ/mM=; b=X
 P3/Tud/sfpMDeiTT0c4HZT6vSuHbI6Z20QU9ZU0/9ugjXvE++dHJE5NjXKIvD3YV
 B537vauhIUhdIuRWDxfJS7BT7LY9jV8Q60ywnUxLbfUvc+a3VZtIbridCRYtWMDD
 ap12gksHrARao1bEiz+vlLYSIHcLiyMhmhqC45qiKzun/Tfx2rOPtCcqJgkVi6hr
 SetaoCG3Hnw0lfDCTD5blAChDEykROJu79rfcWCIry/WLfocFGuTf4HSelrSGb6v
 SU73a6s5y1RgOXvFQq3pLgNFsviUIBKRvhA1C/bsNAqEuhtwa+Kvswj6bCjnQbyW
 Gra3cBziimmxF3cfcJ8eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672424988; x=
 1672511388; bh=l8l1mH/mawDUmBkAKZBqpsTax8xbpGOjbus6WTmZ/mM=; b=K
 HYFFXaZNvVu5sIatjUY2019kKl4ZVEik+uZ0dLzmYdqJg1UbnfL9KcnZn3RZXoo3
 7wtWV/4tSnmp6cCC8A8D/K70OnpHwJ9HDkjHg8J5tyiCGfwJEGKAw5mALihbzxIz
 Bl/NTTOUbVkLmbRpzJN8xtrdyLvrmzhN44cR8Il+FjRhZ/NmbNBwdbPof1h5kALf
 Btq1LiMckRkqOZ/8f6f0hJcY2HMiexetrYDQ7ml3qkcNPdxE4nU4+lTmQ3flURiY
 pdGkFLkchx9iQdRhdsBCAccJdD3xScKOAs5SWhMCHQIL+YQ+fuvbATLYcG7zsHOx
 u7ShgxO7dIz0s3AklvhOA==
X-ME-Sender: <xms:Gy6vY-2ajBhTa_9OVPAxqaJPQvZvf3OG-hLpVDtzoCWDxJiaddk4Uw>
 <xme:Gy6vYxEBgWfEQ-96ZqcDs9y3XEo77HB1vlIV2O67pCo3I8O4dE5aLxMlsja2OS8hd
 7_VNzS4nHTL2D_Neug>
X-ME-Received: <xmr:Gy6vY24S76kQySO3m8c6tO2Yqs2yU7GpdvmwKwtFDUhlT-MUkXu_wYWKaXpx-vL7bbyZ0pXCCeGcqpttpIZXRleVSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeigdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefgueekffdtueetgfehteffledtueehgfehgeelfedujeefhfffteekvddt
 feetteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:Gy6vY_0YpcvGTA-aA9OB9vBjH5oGBhHgoxdIGtls1_BMy3ZMaT0cBw>
 <xmx:Gy6vYxG2PrVkeI2d-mGbo_9_8igdbxWDFpfd5NU1Bw0lYy1pzsaCBw>
 <xmx:Gy6vY49n2Zl3yCfEX0-tXUDrbBpgWJASQUAO9sGd49kkj6qZUqo5tg>
 <xmx:HC6vY-d8tYbzsgt1H3ugwGugr1d4e4FVTMiheg3fmz-SiCgOreyNsQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Dec 2022 13:29:45 -0500 (EST)
Date: Fri, 30 Dec 2022 10:29:42 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Delevoryas <pdel@fb.com>, Peter Delevoryas <pdel@meta.com>,
 qemu-arm@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 03/11] hw/watchdog/wdt_aspeed: Log unimplemented
 registers as UNIMP level
Message-ID: <Y68uFpriqi5gEUBR@pdel-mbp>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230113504.37032-4-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R39o0iQz8hSe

On Fri, Dec 30, 2022 at 12:34:56PM +0100, Philippe Mathieu-Daudé wrote:
> Add more Aspeed watchdog registers from [*].
> 
> Since guests can righteously access them, log the access at
> 'unimplemented' level instead of 'guest-errors'.
> 
> [*] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> ---
>  hw/watchdog/wdt_aspeed.c         | 13 +++++++++++++
>  include/hw/watchdog/wdt_aspeed.h |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index eefca31ae4..d267aa185c 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -42,6 +42,11 @@
>  #define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
>  #define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
>  #define WDT_RESET_MASK1                 (0x1c / 4)
> +#define WDT_RESET_MASK2                 (0x20 / 4)
> +
> +#define WDT_SW_RESET_CTRL               (0x24 / 4)
> +#define WDT_SW_RESET_MASK1              (0x28 / 4)
> +#define WDT_SW_RESET_MASK2              (0x2c / 4)
>  
>  #define WDT_TIMEOUT_STATUS              (0x10 / 4)
>  #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
> @@ -83,6 +88,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>          return s->regs[WDT_RESET_MASK1];
>      case WDT_TIMEOUT_STATUS:
>      case WDT_TIMEOUT_CLEAR:
> +    case WDT_RESET_MASK2:
> +    case WDT_SW_RESET_CTRL:
> +    case WDT_SW_RESET_MASK1:
> +    case WDT_SW_RESET_MASK2:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
>                        __func__, offset);
> @@ -190,6 +199,10 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>  
>      case WDT_TIMEOUT_STATUS:
>      case WDT_TIMEOUT_CLEAR:
> +    case WDT_RESET_MASK2:
> +    case WDT_SW_RESET_CTRL:
> +    case WDT_SW_RESET_MASK1:
> +    case WDT_SW_RESET_MASK2:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
>                        __func__, offset);
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index db91ee6b51..e90ef86651 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -21,7 +21,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
>  #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
>  #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
>  
> -#define ASPEED_WDT_REGS_MAX        (0x20 / 4)
> +#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
>  
>  struct AspeedWDTState {
>      /*< private >*/
> -- 
> 2.38.1
> 
