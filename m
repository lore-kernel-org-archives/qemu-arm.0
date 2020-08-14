Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp441418lfy;
        Fri, 14 Aug 2020 06:23:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeQoR7DB3PbBlJaaehHXdIvqrw0N5lubx6JuJyybuO82BHWuZmyyGp1ESVpu5HSLR5pLix
X-Received: by 2002:a25:60d5:: with SMTP id u204mr3649525ybb.44.1597411420608;
        Fri, 14 Aug 2020 06:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597411420; cv=none;
        d=google.com; s=arc-20160816;
        b=I1rsGeR1Fi0mHO/sdl8/EN0E0vrKlBvwDXJGtmS6yLGuQOdBim5u1BaiWlgYH2t3Il
         HNc77eL/A0oJk1Hhr8leWrDxeyySTkxk9E3v3C114QPcCsaQEnH40zS9pSZCwqTXImIY
         tCgU7OSyJ4NrcosxpCdOv8s/le/C6BNEIhSDQ1X3Q55AhR3JtC8S+PM+fg6c2QuBE1MR
         UmyG3ACOc/+KWOHpoD5zFqFEoPlTpb19pjVnUKLGQ8kGhLRe4RwivdDrAz71rV5TBYjN
         EEQm1hkZyvUHrkBGCU7XENluKMs82eTRwz1IYT8YG+0gEd6Sx9d+VjkA/tIxFAhoW/hu
         qZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ckF2DqXRF898Cr5olz33UXtEKnXaCp8Tdxdp+D4NReU=;
        b=CDUmJwQGG/ShUKqXdCXekisgYRMdXsUEn508qLFPEKrpR35oUqaH46tULiJHymHpeA
         uJqROng8IssLeCeoRGSo3FwsPQoWgZQog8shLNO8uAKL+cGnanMoOCcfCmchCJmCHdin
         TEWMQ840WXZ1NTPQ7McEpSrloVccRnUSuPH3y7qm2qYjby3dk0SO/8MNLTaVItYZ5YvR
         DYLk+ZNiaHUoBMEmlekkech6+Qyib7h7B0qOy8nOpecux6gy+YwboB6kgr2IA077/Cvz
         QlWH4PR7Dk+2mTUssnjIT5xfKav0eA9VWwsA+Uli7Wm0BSBMM1Vb7dxFYXDYAqkWn+rG
         Ul4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SGDmECnX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si7638471ybl.484.2020.08.14.06.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 06:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SGDmECnX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6ZgK-0007u8-07
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 09:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6ZgC-0007tn-2F; Fri, 14 Aug 2020 09:23:32 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6ZgA-0000Vl-IM; Fri, 14 Aug 2020 09:23:31 -0400
Received: by mail-wr1-x444.google.com with SMTP id f1so8356695wro.2;
 Fri, 14 Aug 2020 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ckF2DqXRF898Cr5olz33UXtEKnXaCp8Tdxdp+D4NReU=;
 b=SGDmECnX8wrYZuZ0Jj2igl2UGhngRT4SbCwQFCAlT4B7+CiWBVDtLNQPV1YCTSGK/W
 zzzPMMBnQ0zRE6P4JM8Q+qnX1IHbM8mLbcshYI5DULwVh4CL0edd16CWYPuNPQSqp7mK
 G9rxUZsLHM7LRDjUFqzTxFEDcZw/eTbFbUz6YM0n5/FJAAXNEx0/ia6CIM4ZMdzDLZr2
 oBxsscVRmFuuyEU5jyz3k8TphIGG7+O0la83LEVR93tMbQG6ZdshMEb28JL2qAuPHiuK
 b/cd2i/ljM3ZaWNi3cUDSxRI/a9AHgd1liv1+SqImnf9/BQtSzNPLk7yfGjW/f5YLokK
 Xpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ckF2DqXRF898Cr5olz33UXtEKnXaCp8Tdxdp+D4NReU=;
 b=ZgfDsqffT/nqeWNOZjRw7pg0u4KRto6B9FcptNobLSJf1ce4aTQcIjTssybl/ejPlp
 UrKKDRWduiEwo4kCfnurybgb7hxb2PT1gUjdVdZS2yZDLHjUfsymiU4fKPX17ICqE/Qz
 GKkv15T54SNQBCTfrDkr0a9eUIaERFL9scLGGeW7XJlaxW7JMZclnls73FKp4JLqcGKn
 bAV8sKYat1LIF5+8qcoefTNRquLioNRxdU2aVSfbEUbBtNd/S7dcCyjKy4C6A9Yd6q3A
 wuFogrUlJLdAUA747NILUEmAqDq0w6OxmlhyVrptDF0jrJkDfu35/tScJvhVScNnj732
 TbYA==
X-Gm-Message-State: AOAM530rNin7VQEByDfqEAinKczOA8MpfU4hE9256Ju3MjO0djr/km+6
 4YNjCijEK54XCqc7kixf3R7/HwxUe5M=
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr2650817wrv.160.1597411408027; 
 Fri, 14 Aug 2020 06:23:28 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id g7sm16284338wrv.82.2020.08.14.06.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 06:23:27 -0700 (PDT)
Subject: Re: [PATCH] hw/block/nand: Decommission the NAND museum
To: qemu-devel@nongnu.org
References: <20200814132118.12450-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75f7421f-3ea4-ff6c-2c92-0ea9b5b8fdc1@amsat.org>
Date: Fri, 14 Aug 2020 15:23:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200814132118.12450-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zfnzv8vV3PBr

I forgot to Cc qemu-arm@, doing it now since most of the users
of this are ARM machines.

On 8/14/20 3:21 PM, Philippe Mathieu-Daudé wrote:
> This is the QEMU equivalent of this Linux commit (but 7 years later):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7025a43a9da2
> 
>     The MTD subsystem has its own small museum of ancient NANDs
>     in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration option.
>     The museum contains stone age NANDs with 256 bytes pages, as well
>     as iron age NANDs with 512 bytes per page and up to 8MiB page size.
> 
>     It is with great sorrow that I inform you that the museum is being
>     decommissioned. The MTD subsystem is out of budget for Kconfig
>     options and already has too many of them, and there is a general
>     kernel trend to simplify the configuration menu.
> 
>     We remove the stone age exhibits along with closing the museum,
>     but some of the iron age ones are transferred to the regular NAND
>     depot. Namely, only those which have unique device IDs are
>     transferred, and the ones which have conflicting device IDs are
>     removed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/block/nand.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/block/nand.c b/hw/block/nand.c
> index 654e0cb5d1..7d7ccc9aa4 100644
> --- a/hw/block/nand.c
> +++ b/hw/block/nand.c
> @@ -137,7 +137,7 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
>  # define ADDR_SHIFT		16
>  # include "nand.c"
>  
> -/* Information based on Linux drivers/mtd/nand/nand_ids.c */
> +/* Information based on Linux drivers/mtd/nand/raw/nand_ids.c */
>  static const struct {
>      int size;
>      int width;
> @@ -153,15 +153,14 @@ static const struct {
>      [0xe8] = { 1,	8,	8, 4, 0 },
>      [0xec] = { 1,	8,	8, 4, 0 },
>      [0xea] = { 2,	8,	8, 4, 0 },
> -    [0xd5] = { 4,	8,	9, 4, 0 },
>      [0xe3] = { 4,	8,	9, 4, 0 },
>      [0xe5] = { 4,	8,	9, 4, 0 },
> -    [0xd6] = { 8,	8,	9, 4, 0 },
>  
> -    [0x39] = { 8,	8,	9, 4, 0 },
> -    [0xe6] = { 8,	8,	9, 4, 0 },
> -    [0x49] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
> -    [0x59] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
> +    [0x6b] = { 4,        8,        9, 4, 0 },
> +    [0xe3] = { 4,        8,        9, 4, 0 },
> +    [0xe5] = { 4,        8,        9, 4, 0 },
> +    [0xd6] = { 8,        8,        9, 4, 0 },
> +    [0xe6] = { 8,        8,        9, 4, 0 },
>  
>      [0x33] = { 16,	8,	9, 5, 0 },
>      [0x73] = { 16,	8,	9, 5, 0 },
> 
