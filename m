Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1342799ejc;
        Fri, 13 Oct 2023 01:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7iJtJ6QUWUciipJkno5EPA15TYziU5em1tX8RSFggsPzaHkVmVnZM1S6oxJXYRxoSXbt+
X-Received: by 2002:ac8:59d3:0:b0:418:154a:dab6 with SMTP id f19-20020ac859d3000000b00418154adab6mr33762290qtf.62.1697185097729;
        Fri, 13 Oct 2023 01:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697185097; cv=none;
        d=google.com; s=arc-20160816;
        b=BGBKNluBXLLVrkPJWOVOUpMAaRreaQ9NUTNH2KFcY4jv3PZGxtzXptfc59YYiHNK+5
         g/ecrk6yrHoFfI7frvG+os8pujCgw41IojqBCyzo+pet9olFXnTV7d6N5VWGEKb8q9Ii
         1mDP/sghsabnpUFp6GGYpiHOiolNc5JGXLqfR6GvpgrwXBPm2T6Ed4bJQGP4K+p3T+TT
         AmyCUkuso55CNwTaE9sr9o+vcfCeB3TQHnbveSmGnHQkz0Y+ILRqWjbn/DhdTDN3rTGH
         oWHvNK7Lv7KUARb9KJE6XA06I8ybCKfPkBZaT9gZyIuXafIRJdoVQPqFRdp3OImwnQRb
         IE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=g/wYDCwds+ToHGDvBTkhEONc0IEekl+5QbrhY2dRzOE=;
        fh=BcY/m3jLm8r2sICZFJx4ZQF0EBndPaOBr6kPvk8HhrA=;
        b=QS1VgtbvUAQcUW/7ZjocHiOQwMZhqd0zYO8NVP2r8HbLEXu1fKVQfkgyi+oh/AdyXx
         Xl9u+1cRXR+UIV6Qbc3l2p1JeJObtcgwI34cNYti+ePTVLyLs51CyT2WMnJx7OxpXt5X
         liWiZwSrp8y7hOxndCqA038fryFii4r9q1odeDKVhWDeN6Px3ij3AzKQ0bCbLtx2TAmZ
         2BrE+sNW6O0anI09s7oCXB3+HBbeE7Gt1Uw8dXnbgxK65Kxy+FfiwGYylVrlsI3SNuEu
         mKKdA2IZChRYvx10A/M9HQlLA92Ghi1VGH6eiyiW9R7tw+BPf2w4n34/iomfTIWJDpHH
         qicA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05622a049300b004180fb5c6b6si843617qtx.52.2023.10.13.01.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrDHv-0005kZ-J2; Fri, 13 Oct 2023 04:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fS+4=F3=kaod.org=clg@ozlabs.org>)
 id 1qrDHl-0005Sg-4D; Fri, 13 Oct 2023 04:12:41 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fS+4=F3=kaod.org=clg@ozlabs.org>)
 id 1qrDHi-0002A7-EG; Fri, 13 Oct 2023 04:12:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4S6K4J4Scmz4xZv;
 Fri, 13 Oct 2023 19:12:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S6K4G4BxNz4xZf;
 Fri, 13 Oct 2023 19:12:30 +1100 (AEDT)
Message-ID: <ab1beaf5-d402-4be8-bf03-ccad332ecabe@kaod.org>
Date: Fri, 13 Oct 2023 10:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/78] target/ppc: add fallthrough pseudo-keyword
Content-Language: en-US
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <7572c79bc63f4abc34ca319306dab2c40eadac98.1697183082.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <7572c79bc63f4abc34ca319306dab2c40eadac98.1697183082.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=fS+4=F3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bcgjJufyVnQv

On 10/13/23 09:47, Emmanouil Pitsidianakis wrote:
> In preparation of raising -Wimplicit-fallthrough to 5, replace all
> fall-through comments with the fallthrough attribute pseudo-keyword.
> 
> Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/ppc/cpu_init.c    |  8 ++++----
>   target/ppc/excp_helper.c |  6 +++---
>   target/ppc/mmu-radix64.c |  6 +++---
>   target/ppc/mmu_common.c  | 12 ++++++------
>   target/ppc/translate.c   |  6 +++---
>   5 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


