Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp152212lfb;
        Mon, 11 May 2020 05:24:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlqHd1lQC2REknuPJuBcuFsCiydgKtVW/QqDeoHtGvgLI0R37+SD0anf5678pByGPjvJgx
X-Received: by 2002:a0c:c190:: with SMTP id n16mr15430110qvh.107.1589199885452;
        Mon, 11 May 2020 05:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589199885; cv=none;
        d=google.com; s=arc-20160816;
        b=VLn7+oeKVKJeh+ziQaQfaQidMFBEc7Lg17kY7rz7Itq/yjGhRQTdmY3KXrOZ0VSSef
         IJj1UJYPCjGRCGeM4EjlyisYIyoUcSfCpEWHHzdZWxkaV8iqyrJYElErhN6EbxBRjTuR
         gMt9eJkDUFE0t3596jh3AuTNoVPcFmHyFC5eKEuIn1M/GO27bH6aAhgAzOaOL/s+3x+c
         m//dO2kcp2cWP3V6KjxdgTkmyRsmYuZcq/NroL6xs4Ensdd4coSOlbJTfOovtBgmMSbt
         yT4Zvf6TiRmCkk+1JIUlHGmHro1vf+Uzz78pD9RGuXx4Zt/1BbMZxeZucbmYuK9iIt1W
         bnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vAPfxjqThNPJhfJkrO3DuZdVyej2WKzeiTE+Tbap9WY=;
        b=pdS2zgaLzknKY+GPxlNBeJZE/+GotpxZm8w6KhXrTY8c42Faj3bYfxcFdIh0DJ5lLs
         n/+Fkv+6/lwzrYusS8BjhCS0P4w05oOdBEoXzWWK1xZODwKK+JgLCVxGtAsPMCK4tgfK
         8ow49CJrD+2nfvRW3u4sOYzMRVNgEKlPp4ZCcq2eETFkliYxEenNWWh5bcscCnl9I51B
         V6lWfoH6udMnT7cf61mvV++AHAE0+HezM8jGfx/EiDRMIa4ALusPepRURe+J3w9qsof4
         U4YiLAImSsecL2NL/AlvzClkpzIpKHm+8iX6bt2wzYEf2Et+d4Zxq9GWSWO6yUGT73NW
         lMZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GrDaCS2g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si61107qvf.97.2020.05.11.05.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 05:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GrDaCS2g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY7UC-0003C3-SJ
	for alex.bennee@linaro.org; Mon, 11 May 2020 08:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jY7T0-0001s3-3b; Mon, 11 May 2020 08:23:30 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jY7Sz-0004db-7l; Mon, 11 May 2020 08:23:29 -0400
Received: by mail-wr1-x443.google.com with SMTP id k1so10705080wrx.4;
 Mon, 11 May 2020 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vAPfxjqThNPJhfJkrO3DuZdVyej2WKzeiTE+Tbap9WY=;
 b=GrDaCS2gVl0Ais9EHxzmojL44v+n7eSQUYETJRuT6UubKMrwy8qgxdPFB9x9Oq2alg
 joFamIeIfu3fzJdWdzQblpZaYx9xXyHG+ZxfNPvm7kMi6zcsgCaCdjtrWtnkH1EpTaoJ
 stk3TS4ZLiZgPus/YjsRVB47Yn37AaUDgCopWIRIvOJvC3cI6IREzf67n6pkPhvbjCz9
 /U3sYtsUen2zLVQnLQG1yvfSeKe9N+U4Jnx5YYNDJ3ZNWLDszvypzS9VMKLLxzBQcbDQ
 5RzcSZil/aAcVV13VrwbLsP1AVp4PIW5CicVEpAAAwaUQGubW4TRGnSv27778jxQ0tzo
 2dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vAPfxjqThNPJhfJkrO3DuZdVyej2WKzeiTE+Tbap9WY=;
 b=sO+ohKxTKIf1+YwzQcXLWXFBJUwt1tyPYlhWCzL+h89TCi+jGBWpRtCH7MJ86YrGo5
 DDBbD6I7vqwDnC+vpjkgXImRDmx4DhRIhMtWMJ7HUY3bwy88QILQw5uUgbJjr+9jjzIh
 6ZN6Q8r1EKrYc4K6MTP8BinUvFOfR7W6Z+fv+22dj/xbZKEvcvBR6ZmaZCqwOq4clFbE
 wUe7aG5QZP2JHXmQluO5Bsq/feUhpHxtczTMBN7jXks/qyx8xB2mTTz9itT+Gnna3aV4
 6XxcuHERmGxTQl8REBmzSocl2GrwBddCwu4RFNUyok0jFGJeTwyzifhueK84zsQbVCC8
 +NHg==
X-Gm-Message-State: AGi0PubjAPCrjLmGWkkEP9JxND7YQSjZJSYHyTJvVt37+BZgGko/iSbh
 QQPPWtdmwTywwlrfFxtBixk=
X-Received: by 2002:adf:e751:: with SMTP id c17mr19841001wrn.351.1589199807105; 
 Mon, 11 May 2020 05:23:27 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 32sm17695700wrg.19.2020.05.11.05.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 05:23:26 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/arm/nrf51: Extend tracing
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200504072822.18799-1-f4bug@amsat.org>
 <CAFEAcA99uztOyAODdb=oGo7XM45dj-uWY6yiMW2LBACQH5=GUA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e605fa67-f11f-f327-7e9a-040d49a4d57c@amsat.org>
Date: Mon, 11 May 2020 14:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99uztOyAODdb=oGo7XM45dj-uWY6yiMW2LBACQH5=GUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9aRv90CMQPhD

On 5/11/20 12:45 PM, Peter Maydell wrote:
> On Mon, 4 May 2020 at 08:28, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Few patches while playing with the Zephyr Project.
>>
>> - better display of unimplemented peripheral accesses,
>> - better display of timers use.
>>
>> Philippe Mathieu-Daudé (4):
>>    hw/arm/nrf51: Add NRF51_PERIPHERAL_SIZE definition
>>    hw/arm/nrf51_soc: Mark some peripherals as unimplemented
>>    hw/timer/nrf51_timer: Display timer ID in trace events
>>    hw/timer/nrf51_timer: Add trace event of counter value update
> 
> Hi; I've put patches 1, 3 and 4 into target-arm.next as they
> have been reviewed and are independent of the unimp-peripherals
> patch.

Appreciated! I plan to respin the unimp-peripherals patch with better 
description once I've the PPI peripheral working.

> 
> thanks
> -- PMM
> 
