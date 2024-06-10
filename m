Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp550592ejb;
        Mon, 10 Jun 2024 02:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtnzVNYgLr4Yob4ipGZ93hiPbKAFniymFdesA6RvGB4/YrLciLpuYcO0VJon9c+zjzYci8xgcMtIb2iGMddn8dtOaEY0g6
X-Google-Smtp-Source: AGHT+IGJRfe56s+2PMvWJ/DA7DnAkQgwUVMIp65EnAKPv/e5+RfOBYzADhMV4xrSklMvWPthyNT0
X-Received: by 2002:ac8:5d01:0:b0:440:6115:ad4e with SMTP id d75a77b69052e-4406115ae02mr66844481cf.2.1718011483917;
        Mon, 10 Jun 2024 02:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718011483; cv=none;
        d=google.com; s=arc-20160816;
        b=Xfnq+x2cNM6AhZ9RDbGh1BSR0RpPmKWSxA+9gP3Bx06cmbcyQrTjsYNQZXZ2IKeWrF
         V9Qsx+qJzdRDN7WMqtiX9a1oSV0UQNmzXbf+82hNyeE7b7NDu20rz81UsWlwWNScoLjV
         ed7cTK4781CqqVUXVT/ap1bBCMAmpytWiwKl3FuNx10x3jJxvPKvIaYZGqb2cAV8Uvv9
         lmjirsMk8V7bVGpaCVDOgLhjlGdjuPTJ+7GmMxvwRjUgyZQCBA/b6p9POTSLxEDYKwQX
         JT054GQv02bskL82mYzJYEqfIxStuMe87vIXvy+Hjbdzb7OGXmO6TzNk84fSDj08nOjV
         6Z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=dvuVN3jxnXBxNjkLCA7Mdttc2nc3qwpapHxAAxAqO/o=;
        fh=GFN6Y1WPC+/eoxgviPbQjxqIdT1U1VoJGM2w+bjwVr0=;
        b=k/6Bq9XGyO7PvrmOVwkqps8oHO/UHWDlf0NYvlYSKGKGzOXj4giDV8Fxu7me5hsDhQ
         LKbbXriqmwebNZ4MPlZGk3UjteXWyXGZByOgEzXSYqLV2jyNnC42vwJ0B6hKtkDfLfGY
         hzqehNXdMc7DOTaxuWJml9YjlKpDPDdXzT8e54WjpT0qqWhKofyMwfI7yNDVccwfs1pt
         HXQfzmKzOg7T88H/9O+uktwMPwqIr/d9G5loM0RDdeTmTscweZ/5B6s3MnfysXkKEye0
         iLguB6DhLceg4trg/Qi/whkTY4GH/tjdxKwcVV3XPfLm7oDWuHBBw250H8xhjIBcVocn
         LCpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-440649a1ebdsi30588101cf.139.2024.06.10.02.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2024 02:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sGbGA-0003FX-TD; Mon, 10 Jun 2024 05:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=l9v5=NM=kaod.org=clg@ozlabs.org>)
 id 1sGbG9-0003FD-52; Mon, 10 Jun 2024 05:24:13 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=l9v5=NM=kaod.org=clg@ozlabs.org>)
 id 1sGbG7-0003Xq-IV; Mon, 10 Jun 2024 05:24:12 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VyRFb41Nlz4x2M;
 Mon, 10 Jun 2024 19:24:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VyRFY3hQ7z4x4T;
 Mon, 10 Jun 2024 19:24:01 +1000 (AEST)
Message-ID: <c8490af5-466d-44fd-ace5-2b32f653e4b6@kaod.org>
Date: Mon, 10 Jun 2024 11:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed/smc: Reintroduce "dram-base" property for AST2700
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20240527124315.35356-1-clg@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240527124315.35356-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=l9v5=NM=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: soIiXip2AGiQ

On 5/27/24 2:43 PM, Cédric Le Goater wrote:
> The Aspeed SMC device model use to have a 'sdram_base' property. It
> was removed by commit d177892d4a48 ("aspeed/smc: Remove unused
> "sdram-base" property") because previous changes simplified the DMA
> transaction model to use an offset in RAM and not the physical
> address.
> 
> The AST2700 SoC has larger address space (64-bit) and a new register
> DMA DRAM Side Address High Part (0x7C) is introduced to deal with the
> high bits of the DMA address. To be able to compute the offset of the
> DMA transaction, as done on the other SoCs, we will need to know where
> the DRAM is mapped in the address space. Re-introduce a "dram-base"
> property to hold this value.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   include/hw/ssi/aspeed_smc.h | 1 +
>   hw/ssi/aspeed_smc.c         | 1 +
>   2 files changed, 2 insertions(+)


Applied to aspeed-next.

Thanks,

C.

