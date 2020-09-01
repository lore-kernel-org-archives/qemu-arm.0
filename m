Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4426311lfc;
        Tue, 1 Sep 2020 02:44:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQk9dDGxVByB8zuNIOjO8o3W1V7FHMei2AAgcs2XbKgG4DZgoKN3axKlSkNdym+nnWzMDq
X-Received: by 2002:a05:6902:1022:: with SMTP id x2mr1386954ybt.391.1598953462141;
        Tue, 01 Sep 2020 02:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598953462; cv=none;
        d=google.com; s=arc-20160816;
        b=O+F119pwk84e7K2GJ24KiqK3wxLMUlW2oexw3t4RJqV46up4qYO7W4QE+rDWx6CIML
         shZA5wVVCQWwYGgkWvvw81UiutAql8s6MSSIopgckVf/4Lyan/M+GZr6wWihHsryNEWg
         gOU7zMHNnygJEtVpohDkIDGuXzvA5Z1KAMxeeKSfjqQSn9cRQqEuSs9qaql0PDzodx/8
         mhsYq3E12+jiWEfBWKMVdp1k4u65K5lSCoSOomyq5ieXydJlM/YpZtmuezSjqsZLWXda
         Rr5NjAQ2C1ltRVB3/SQ7pSRKklaqF6mOBjOvm9RCnTxztF9Uk0hqZc2tXNFfuFUyeQIz
         fbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tMGemdzIY8cXvrI0NskeWxxpDDZ5u3lB6tzZ7zTDUqg=;
        b=i4OIDFyLLU6CXa0HQ2DfPk49/OgX+oX1eQrROF2Wds5+R5BloS/iiJFNr71htlFuMF
         VmYiiPYHl5sHL/KVnFuMfl6GtuC1SMoR/a5hwRSEylf/nCTYscEyeQGCngHw3xZNtxvk
         z/PMZNk3OHlzyCPu02VhR6Xlgwuub8w5ySER+84zv5yzmHXAG+1h25lHxQcD0Tdp4zeT
         9nlPNSnkhK05YQzNXCH4auB9MV847qLcEZOQJv7t940V8sDaQQf0RekBNfhfQnr9q+Aw
         RnP8WGlG7q3awRGCoXqD46+tEVotA4y32APuCcsAKtXb9rKM1yRlVcHMqCfdkXpUTRMd
         4HMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B7kT67c2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e197si592928ybf.13.2020.09.01.02.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 02:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B7kT67c2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD2px-0002Ad-Iz
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 05:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2po-0002A6-99; Tue, 01 Sep 2020 05:44:12 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2pN-0002Be-UV; Tue, 01 Sep 2020 05:44:11 -0400
Received: by mail-wr1-x441.google.com with SMTP id j2so750165wrx.7;
 Tue, 01 Sep 2020 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tMGemdzIY8cXvrI0NskeWxxpDDZ5u3lB6tzZ7zTDUqg=;
 b=B7kT67c2dbVQeksS5sowaTTqUMcMVlrmDTVjQgGARnnw5UWYfzcymPY01YQZWebZzu
 WIyaFTgdtVzG+Wio1BPneh6GHZJ4Lc8CatUtSwzP7u46mPYFfPFCvnBpYunsEyG6krWb
 APbnQJXSLQKVKqDAiGTXLVkz4YsiCgIcg/S+aI7pZRkzo41oyMZ+3OOfi04jKl/UNOqG
 y5PrRJ7IyNNURpZnJ9eIehUZyRxxNJj/hh5wZxWDXnYGSAtrKiL4tK3mzYC4auHMIi+7
 H3DODKhmt5V3b2w5NG2u/pgVy/UbIDwgZId9OrhAGlNDQepIxbBBTPu7Yf545hal7mIP
 uLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tMGemdzIY8cXvrI0NskeWxxpDDZ5u3lB6tzZ7zTDUqg=;
 b=GFNe+iTsN8AkMlvmoZ+IeXXvWmoLZs2ObL/C2d37+3kIR9wQP2ghBjEETbUi0xK3+M
 k87QhFyFBSZtcTu6xtzic5zZJ1/8rHwX8ktlpM8CVzNRLvS4koe9TeuLad9Bh8Zjci+V
 l915eFpsli92/XELo5QdcBiY8rW5bg5u290EFoKFoatwgOIfkSgv5IHNvdEzqu1Ptikk
 Xp4/fMr3tGwL3WiJ9r9NFB5uxoBYGahholXeAnOp1KGMHv8R2t4biHFrFvAuCCiRLYUh
 hv/PReVtYx5RZLfwF5EJq5T4tRMnKvLOZ47Co15riwq0drawUe1jZ6Ea2HGDQW6EiJow
 vqag==
X-Gm-Message-State: AOAM530m4GqkbWGeQzQnYuBvHA9zhPnVT2XJnunQMdi4vrKZHpTM9lZZ
 KKTzLt2vcPtCVlEON61Ne2E=
X-Received: by 2002:a5d:6412:: with SMTP id z18mr966447wru.30.1598953423875;
 Tue, 01 Sep 2020 02:43:43 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id g18sm1571775wru.27.2020.09.01.02.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 02:43:42 -0700 (PDT)
Subject: Re: [PATCH v3 11/16] hw/net: cadence_gem: Add a new 'phy-addr'
 property
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
 <1598924352-89526-12-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a4caad02-6081-c0c7-ad2d-e10a75e1c816@amsat.org>
Date: Tue, 1 Sep 2020 11:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598924352-89526-12-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-2.13,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q9jc0NdwGajT

On 9/1/20 3:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the PHY address of the PHY connected to GEM is hard-coded
> to either 23 (BOARD_PHY_ADDRESS) or 0. This might not be the case for
> all boards. Add a new 'phy-addr' property so that board can specify
> the PHY address for each GEM instance.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - change "phy-addr" default value to BOARD_PHY_ADDRESS
> 
>  include/hw/net/cadence_gem.h | 2 ++
>  hw/net/cadence_gem.c         | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
