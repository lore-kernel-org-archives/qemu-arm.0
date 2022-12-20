Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4122274ejb;
        Mon, 19 Dec 2022 23:38:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5/XLYDdMbi3+32T4kk6JDzaHB2bSXTiM+DwMj5Yy9UkCoNk/EOPpM2QY/2Eu0D/dkGA1W2
X-Received: by 2002:a0c:e991:0:b0:4c7:4b8e:cac1 with SMTP id z17-20020a0ce991000000b004c74b8ecac1mr54257223qvn.26.1671521913495;
        Mon, 19 Dec 2022 23:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671521913; cv=none;
        d=google.com; s=arc-20160816;
        b=b0/wIIRCx+JrRnY7ePCYexeotqvkDO0CMM41OQdJH2gOoSuwPZvzVHMKdhObsi/q6z
         mpQXOHnZYKoidROBbAYg7bbZFHRcOVQZmZHaggKW2JoFQyWO5roMMWfZ5HIzAaawqtC/
         x43eoa//25p5Fy734FA0IC4WHSx9aE6YRpk+sdP5YS9swuvDW9KbbxS9oVPrHjR71tpM
         BnyWxppsiMkK0Z0cMfHtPJu3PCcpNKFwnnDnAucvwvEthT6DuzEkrxWDsP+jY+qdPRFL
         N+sZk7JkFMfOIo3qn48PBhPhPfYAGa92xTSzp0MtGUtjWszoxok8WSkZCFVR8P4vUZ3P
         DAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=XMqfcWzgKia3izIatipjpuJS44sSyjehcDvxxTHgyxY=;
        b=02CNbUG1pe0Y/7qcy+E4YD2Vpw6s58MeDnZr29WitBwUhiYewZvTqYwqKfKwO4jfGP
         oLwpRGPdRiShuYdPTbs4G86kzxU+GmxK6KOBHKXX2UFYjTK8ExOIO6t0eTIixF+COdbF
         PG3yxVtUH5P7IOTAwDK/o1SzfOCKicnsrcN+cqYcHRCGTumzBOHsguSIm7kfg/X8FSGx
         77YLnfVYI148cJ3CAJUScsbPd/5580iXJ7U4A92Fa+cjDuidzGvVggT32vTprp8tMJYd
         ne8LmRo1C2ckojNzGOahASV7ZYySwksCILcEWgy+Q068O5q5BJlkZNA6Q9Od8Pjhu4Va
         RlHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20-20020a0ce554000000b004afb4408301si4614768qvm.520.2022.12.19.23.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 23:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7XCM-0003Rn-HG; Tue, 20 Dec 2022 02:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7XC6-0003Nc-Dc; Tue, 20 Dec 2022 02:37:51 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7XC4-0000L1-NK; Tue, 20 Dec 2022 02:37:45 -0500
Received: from [192.168.106.118]
 (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
 by csgraf.de (Postfix) with ESMTPSA id 757AB6080366;
 Tue, 20 Dec 2022 08:37:42 +0100 (CET)
Message-ID: <ceeb8fef-f0dc-eac9-8b0e-e28735bfdaf2@csgraf.de>
Date: Tue, 20 Dec 2022 08:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20221219220808.26392-1-agraf@csgraf.de>
 <d848e536-94ba-7f2e-ad40-026449fa63fd@huawei.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <d848e536-94ba-7f2e-ad40-026449fa63fd@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WRgVUUbpxw4L

Hi Zenghui,

On 20.12.22 08:14, Zenghui Yu wrote:
> On 2022/12/20 6:08, Alexander Graf wrote:
>> We currently only support GICv2 emulation.
>
> Before looking into it, I think it's worth finalizing the GIC version in
> the hvf case - only v2 is allowed and fail early if user selects the
> unsupported versions. Currently finalize_gic_version() does not deal
> with hvf at all.


Currently finalize_gic_version() treats HVF the same as TCG, which is 
incorrect. However, with this patch applied, they happen to match.

I don't think it's worth changing the finalize_gic_version() 
implementation to reflect the gicv2 only state for HVF. Instead, let's 
rather get GICv3 support in and then add explicit handling for HVF on top.

Alex

