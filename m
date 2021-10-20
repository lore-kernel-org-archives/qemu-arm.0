Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2053916lfc;
        Wed, 20 Oct 2021 14:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwsCXsFLnqinmG5PxOuQPmr4HuduyLL3M6+v2C6CeJbgw1Mlg7XYT3oRIvAbAQ/vp1E78+
X-Received: by 2002:ab0:6942:: with SMTP id c2mr2619515uas.120.1634767142328;
        Wed, 20 Oct 2021 14:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634767142; cv=none;
        d=google.com; s=arc-20160816;
        b=akHfQKgGdxUggNKu55+l/+wvNknPN/qifHUNeIYDK4z6s9plpq+9B6JU09dQ93Mka5
         ilEEubOpNad2rgXLrwOf1zEcFPgMT2VoKjz3/4WZ48rTl3R4tKe8zaPDO3eVor0nd0zG
         Rdn1XJZQrIshmhg4vyVOMXXmqcPJjwEvzKHEvYxEscw/PZFFSpDulNoepIpEI5L0jIlw
         Z+zTtkPaMYK2ggStkRYrq6z1jnjqcsQGvAzmrRJVJ9vKO5OC0ndXMcUM8lC52QbLnRj5
         dR1/jAOkisAbnxe8RF9WatgpHgQXAeVn69zs7aKjEfcwmatmNe+wkpyazjZDFMS7N6Sc
         btQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=GoCNeXkR2UCXjoOVWE4nwolB4oZBsJho/sydr7rGtvM=;
        b=D720aqR8WFEufw7nDovO1rZJQCLWc6IyC9VoETsw6N1neLdQfs1li1O/kM/h2BeUKU
         twx4+n6NLnuR6A5qVc0vmHm/xS15sqDDP+KpI1ueWXz2X/s8BQtW8MUVuBE+UA+57w52
         Z3e2EgQs7oNZ2k+X/RixPht+Z6FLJfAmdRTtLRNu2igq2vq04cC9uPeXbO1JH0usiHhE
         S1fq2MXiJL0b9+Pq97oAvI+PHhqrgBJhhSM4nq7fI8G4ddVa1bdPiDLV5uluRHZHUtvv
         +uoAmWgIoVTd2Mhh/UkjZUT79PX4cinqg+A2chW+xjq/lElGxc/dj1Ah1DucelHUGeqC
         Fx/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=C+HKhkDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si4949903vkg.88.2021.10.20.14.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 14:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=C+HKhkDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdJbx-0004xa-NR
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 17:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJbG-0004SA-2g; Wed, 20 Oct 2021 17:58:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJbE-0004by-Ky; Wed, 20 Oct 2021 17:58:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v17so452959wrv.9;
 Wed, 20 Oct 2021 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GoCNeXkR2UCXjoOVWE4nwolB4oZBsJho/sydr7rGtvM=;
 b=C+HKhkDiPLZW7rCA4fL504X6krGTkxiBqj4ct+Tzt/LfuihYMohFuA6XKXqvQN/5f9
 OKob7WBITx+QHwkzLi9VvW1+ZuXFMsEE8D0YvXNLC9Fu19o9oEn1wyD0rJhSE/eolnSX
 SzmSycEgsBf8ycC1pU3pFsL/hwXQEabCWF+j9f97eu1Ix4WxAQ3DyFqcccWk5AIhZk6D
 alPVUm1JKRb8q3s+itBXODFD4HXQrFMH8nmRpgfS24BM+4RHKIUzlCJTP5kyD7fSrzd0
 5jOwQb/DsLaddk3tlAj01CicOi7/3sDEgZYIbQjrQFa36IdeiE6PLliFlAJL2WgMJjR6
 iyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GoCNeXkR2UCXjoOVWE4nwolB4oZBsJho/sydr7rGtvM=;
 b=gr4wMsPilvvBnSEUlVhnzThKuY6kQKHkTkT99wYpqYAzEvRGjiNGW0oTqXR/wBrFGF
 7zzmwVXhAtJkmCS2MCtAJP2wvn/rqPQtvKwAJu4cbD4PLAdubEwxYUsnrvCPakPpqMnN
 wu0paNjJ1uVHvE4cMmFhgxQSCDHC+ylCyIzEO+cIK1h6hJsYJQ81bUDVQb2OziEL9kDf
 238u3Kb5tw3DLIqckXfr+LhWoXaWScYDpq9HMjgRmOUSsZh6lj/aM4YNckYnUDQvLv8f
 h3hg5zOgGMVawi4RryI2hSb8G0yiJVjhVU7wqZU/vZ0PFzBmUWHm0HB6tRVp6IQapuOS
 OvvQ==
X-Gm-Message-State: AOAM530nd4F4y2GgbhmXacHd0AeoEBjcszQ0jhsoWgOLvITFx5gZlri4
 xnKVWxS96GTN3X0FgH/Mngw=
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr2337228wri.394.1634767094529; 
 Wed, 20 Oct 2021 14:58:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm3867826wrs.90.2021.10.20.14.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:58:14 -0700 (PDT)
Message-ID: <a42f6624-9bd3-609d-954d-be9fdf524c95@amsat.org>
Date: Wed, 20 Oct 2021 23:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/5] aspeed: Initialize the watchdog device models
 before the FMC models
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211018132609.160008-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.267,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sgcXpVMDTLXF

On 10/18/21 15:26, Cédric Le Goater wrote:
> Next changes will map the WDT2 registers in the AST2600 FMC memory
> region. Make sure the MemoryRegion pointers are correctly initialized
> before setting the object links.
> 
> Do the same in the Aspeed AST2400 and AST2500 SoC models for
> consistency.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_ast2600.c | 36 ++++++++++++++++++------------------
>  hw/arm/aspeed_soc.c     | 36 ++++++++++++++++++------------------
>  2 files changed, 36 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
