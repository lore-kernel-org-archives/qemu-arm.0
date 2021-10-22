Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1788239lfc;
        Fri, 22 Oct 2021 10:49:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVUwJ4/3YQMySPLygAi2eKIE/1pSlZwYqhMcX/YA/zTWoHNecdoukULwWCIpxzuepIzVxM
X-Received: by 2002:a9d:4c98:: with SMTP id m24mr1061261otf.48.1634924975316;
        Fri, 22 Oct 2021 10:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634924975; cv=none;
        d=google.com; s=arc-20160816;
        b=m2TrEMMUXnzT3dkSHt8lEkLzVZJ11dLnHFbUUR0VWUGMUJFKcJBSFfLWahi6l4W76b
         upRnzYxq1h3aLcvg2302/z08NG0qi/gQyYU9nb/r0YSwp+bCNUL6mqwhmGgcdWDh4Xzk
         VIZk2/FoHbGYUMutzXe4u01D1+RHNoSpJA70Oki48CV4uv4xtlljRi2jr/8nc//oBg0X
         Q7IQktBeM1KKMq5s+uXssfA/aI6ojEkfHqRO8ux320f7RakvdJlhaRMJxUsFGEP3Xb+M
         66gjmjDbnzWSllO7JJCZ/1ON36FIlOnikdpGfpWmzWi7zogepA2ZjR6OL9RX1C3+ve1J
         q5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+qdx7TQBz0OHzu/+r/S2nWFPVbG1MWWPDrN/PubMRyc=;
        b=Ll7maY52q1CptVwfYMtzVVvDpck7eB/IJbewYd0b6C/mPreXYrVaCyJPv4FSDeqlvw
         dPNPx6/1DjuPFNIu8rQokqIPqiUdJ3EQQut5sWQdcJUpfU4zKGAyEf6YxfPPPVE2S9qV
         b4OB3Exc8wA6GBJdR11MxVTK+1YEmxhczBUSxGzVgWr2lfxSmZ9jS3S8H1Sj4jeF63xy
         2YfULRMvMyh5cY+TCst9zmveTU0+rkY+K3ALVI5Lc/RxjdDtqlW4aJq0RHzVJowpBYUO
         SM+leiwe3Q9TTveTDTThni2Iwbvy4Pvj7iX6n/L+8+Wx8eF7yVDOiqwpqpAFplhxu9k5
         Uxtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7XxUUKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si9222849oia.106.2021.10.22.10.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Oct 2021 10:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7XxUUKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdyfe-0007Gb-HE
	for alex.bennee@linaro.org; Fri, 22 Oct 2021 13:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdySp-0007Ag-6G
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 13:36:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdySm-0007lC-W3
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 13:36:18 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 s61-20020a17090a69c300b0019f663cfcd1so6320620pjj.1
 for <qemu-arm@nongnu.org>; Fri, 22 Oct 2021 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+qdx7TQBz0OHzu/+r/S2nWFPVbG1MWWPDrN/PubMRyc=;
 b=s7XxUUKk3t7FWtdJLbjQiFeBiTpEXNwGVCjSDdOceFxN/FvR2MzM5ht2e4BQHc4Or9
 QcON+DxRFGIIrY7QcZkLGuFmnbKn+RU9HNsT0KjAyLc38bjYHAvvC4iDHGvo6d3+z5Nt
 336DeGKUuEF802w06ds90fE1jDAbrXj+hBDUs8TdP/wRmxUwHsc33YS20NURIye7Ro/G
 PXJNXPU3tMiUUSbDeKh980ZS9skw5kUbs0B+NYI74Hrpa6+Y0VdJi5gMbOgmRdsaXV9/
 nuJzoVH8sKriCDtsNTlcFPTvYZZTzUwEJLhM1OhMAD9hVg+kdnO7WvDdCnarE+Qthi3c
 91dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+qdx7TQBz0OHzu/+r/S2nWFPVbG1MWWPDrN/PubMRyc=;
 b=sffC4zMPpcOCmq95h8XgkDqbxEi7cnD3qgqyDhh7JQahqNHog9EaK62IGG8fYspHdh
 F+0ZhMyQ/ns3X7dFOfL1ZuD6Ex6ccB60EGHUDYC5PPzAIRSgEjWFFD6ruKuQPeLaoYg9
 0mpYQ5wqY+JPigBjOZ/m5spFC/yq674L21b54VblxTpVI1PWxWJAI8fJsvM6nXqbfKBV
 QM34qjG2V7LAIEl38+1JW96yo+24oyeHy61AaJmkWTixp8QUNmGgRG1u2ryhpDvk7AhT
 6MsTMBSZz7j4oJAtnHP85gOaxghw9Lh/wuBAu82EtXe/mxFReYFr7OrD3of2YgwlEOpq
 tuAQ==
X-Gm-Message-State: AOAM5301E5+/Lw1i5opQL8PzmEbSBLHGe9haka60uYZESdnBmvVa8vDg
 8MvF8Gic6SO+PMvp6Ds9gi2exA==
X-Received: by 2002:a17:903:18c:b0:13f:255:9dca with SMTP id
 z12-20020a170903018c00b0013f02559dcamr1315229plg.37.1634924175172; 
 Fri, 22 Oct 2021 10:36:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u12sm3888409pfi.217.2021.10.22.10.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 10:36:14 -0700 (PDT)
Subject: Re: [PULL 0/3] aspeed queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211022075730.484692-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01b5e7fc-3310-532b-8607-5bd6867d7773@linaro.org>
Date: Fri, 22 Oct 2021 10:36:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022075730.484692-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vvCyzb/pwY1q

On 10/22/21 12:57 AM, Cédric Le Goater wrote:
> The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:
> 
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20211022
> 
> for you to fetch changes up to b12fa6118f4d838d19720ec6476a1666a1b43474:
> 
>    speed/sdhci: Add trace events (2021-10-22 09:52:17 +0200)
> 
> ----------------------------------------------------------------
> Aspeed patches :
> 
> * New fp5280g2-bmc board (John)
> * Small cleanup in Aspeed SMC model (Cedric)
> 
> ----------------------------------------------------------------
> Cédric Le Goater (2):
>        aspeed/smc: Use a container for the flash mmio address space
>        speed/sdhci: Add trace events
> 
> John Wang (1):
>        aspeed: Add support for the fp5280g2-bmc board
> 
>   include/hw/ssi/aspeed_smc.h |  2 +-
>   hw/arm/aspeed.c             | 74 +++++++++++++++++++++++++++++++++++++++++++++
>   hw/sd/aspeed_sdhci.c        |  5 +++
>   hw/ssi/aspeed_smc.c         | 11 ++++---
>   hw/sd/trace-events          |  4 +++
>   5 files changed, 91 insertions(+), 5 deletions(-)

Applied, thanks.

r~

