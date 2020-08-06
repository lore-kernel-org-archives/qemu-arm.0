Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1639637lfy;
        Thu, 6 Aug 2020 06:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydUYIGI+dlHKGJT9xJIBp8Xb2n4o6eyLAxLV+avPYUqjU230XCTu/ehj9kWglDvyDuXABC
X-Received: by 2002:a25:7007:: with SMTP id l7mr12454443ybc.85.1596720855739;
        Thu, 06 Aug 2020 06:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720855; cv=none;
        d=google.com; s=arc-20160816;
        b=uX12Fdg0a1spuz4PR77nsJOtdeDIPXMnMV1ine0+K0max/iMjayXbFx3Ap9YzCSX5H
         LcvHSp7D5i9ZhAGyppJVkI8H1TpKfyKxrrzGKsAINq/Te8+sdSHNul4awzCEkdOVOa8y
         yCQZLyhGhUHDOifUUqM19qJXX83ChrS3MzRwdei4XUr+VVq/g9aZ68ZfGOAWB8W3LtOC
         puSRDuWsA+LqK8j1wxJk91YS43cW8EmozQbJtAD0HRDj3VCrip5ilokMUjuyuYIvOsfw
         gRNaKO/G/qzJXw17Hq9V20BtxGntjJ8oj7i9RsMqAfhJZvDPUFG40PzwALJy1Y/Galhj
         N4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=D9NfrfC0Ig01+bi+8DPpUem5HnxjvhzhF8q23cyqaA0=;
        b=JXcQHsXaW3nn0+0srqyQGT8S0YntQfOvaJD8dnXJFGs9CIK63h2BTKZBSP444ECbkl
         ScjSA3v6OlNKuepxwaHeozLoKLTcJk3bMWZHDVCpDn5Xj6z4rJobeInBWLuLJsHsfoIB
         ZO9Vc+Ck8fTBs+cHbFlzQ7t70601AeuqgWWg+P3RcASJwmqv67lzeobDslRQpGqyGtJb
         8BT32ZvUy/w/4VTyYCzmS2EsApdWIF2ElpOOqFWnQg6rm33DAa33qjQYj0jA1xuVJ+xh
         XpPEt+W6cenKqyBiPKcUSH/5ui3upb234JEn73pshDhuFHEFpbU2MIbEgnui8dBaPzM4
         VrtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZPwcpg6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si5132230ybh.9.2020.08.06.06.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZPwcpg6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3g2B-000820-4Q
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3g1v-000802-O1; Thu, 06 Aug 2020 09:33:59 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3g1u-0002Nr-2a; Thu, 06 Aug 2020 09:33:59 -0400
Received: by mail-wr1-x443.google.com with SMTP id f1so43484499wro.2;
 Thu, 06 Aug 2020 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D9NfrfC0Ig01+bi+8DPpUem5HnxjvhzhF8q23cyqaA0=;
 b=QZPwcpg6ozffs4LvP8E3MOi2QTuk4e7khLtUzxKDhiNCpC3vuPFEmOoHwdHmJ4ZSrC
 qXGlbMbj0fRmbK8UmyAlccDoP7Rnw2zljPCKS0cQ/sWomCdLuIWsgzdyA3L2cXUCSHHr
 gZiUi/jxtkq+CQp1lguApZOxkm3dHg2sq/W914extDkCM7q7JJ4CZX1RhLOPhv3pYMhy
 pE5blyKl0ZJ3bxZONCvlYTXmRlMxTGfCa/8awTau/d0lvJDPsbd8vtufyJKGlvvdPmlo
 mMUhdswiK5wKdvTxv0piSWAiHNfT1q2qE7s/P2+4hP7k7js9m3bqd1xmh1uA0RSeU++Y
 /5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9NfrfC0Ig01+bi+8DPpUem5HnxjvhzhF8q23cyqaA0=;
 b=rszWVy6RNU13YRZBAaYDhAXeQDc5QVfOzGNiWyGe4E9DPk6BwGr6xsqkGT3ONgNNnu
 hkQnowYSTud+ZZOeiSNVt5WK8rJ26ZOEXIZ5dS+5ty7c+d9Gh1qqqra4ZM/6y7//hMID
 /AkuC4ZgD15niF5sPyuCuMtjsycxV2MxL0JZM/3HP/R9jmT4F/x2QkltbgN/nCPY4C8a
 mDg3LMoZFtGzTCbsz5eIjpYM1Fb2oyWBjLlwb3+XLCk+lEE1xWktmsfJZ9zH2rxn1Glw
 iu8yFtAkgK05HZl6usr74y2eQjKxi4Y93DCbbJX6ojWYD9Q3oIuOrRMFm4J5+7W4R/5N
 VP9g==
X-Gm-Message-State: AOAM533+OwWZT5i4bDco2LGjJqlJW702n6v845RAd+ppyCZ3yjzV3HBj
 PctK6T9JDD4H6I0J1PlY5R0=
X-Received: by 2002:adf:a3d0:: with SMTP id m16mr7095362wrb.232.1596720835989; 
 Thu, 06 Aug 2020 06:33:55 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 69sm6914842wmb.8.2020.08.06.06.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 06:33:55 -0700 (PDT)
Subject: Re: [PATCH for-5.2 09/19] ftgmac100: Fix registers that can be read
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-10-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ac8565d5-07ee-c8e1-88bd-be5e19135489@amsat.org>
Date: Thu, 6 Aug 2020 15:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200806132106.747414-10-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C9HV+E4T1pc8

On 8/6/20 3:20 PM, Cédric Le Goater wrote:
> Receive Ring Base Address Register (RXR_BADR) and the Normal Priority
> Transmit Receive Ring Base Address Register (NPTXR_BADR) can als be

typo "also"

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> read.
> 
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 5f4b26fc5f3c..0348fcf45676 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -669,6 +669,10 @@ static uint64_t ftgmac100_read(void *opaque, hwaddr addr, unsigned size)
>          return s->math[0];
>      case FTGMAC100_MATH1:
>          return s->math[1];
> +    case FTGMAC100_RXR_BADR:
> +        return s->rx_ring;
> +    case FTGMAC100_NPTXR_BADR:
> +        return s->tx_ring;
>      case FTGMAC100_ITC:
>          return s->itc;
>      case FTGMAC100_DBLAC:
> 

