Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3548475lfc;
        Mon, 1 Jun 2020 16:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg7iRQIGuhs9zWQOtAAxNodZx9vabi/9PqdNodNbSxvP7wWSFZUaIqzMsuRCYax+5iA0zK
X-Received: by 2002:a25:f20f:: with SMTP id i15mr37417942ybe.72.1591054870763;
        Mon, 01 Jun 2020 16:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054870; cv=none;
        d=google.com; s=arc-20160816;
        b=CD114gh6hancSmTx7IOGYizP6Q9lwBkkVvvtD+GizF2hGbPEPFPFMmcO/IXBvdAolQ
         ibE0IwEgLQFLDbmaPJpqNef2lALmFhBcaRFksILy9RuWouhRs9wYocXPQfbGwR/gLsRu
         SffvXVsHRwHaPcBlG4RNX5lpplvwHLFcq0is4gOLIPEajavpzDcQ7xuzxx8F6IkiraC9
         ys4s6xenxVPo2p2wnR+gnCtLDV5/9NQLNLngrQ9DH7NDMJ2uevmjhqVA7n3KRVKa3bpO
         ebCbckqo2mD+qIP0qU5yMq3U7ykPanXorwmnIV6E1ur4/QcrdSEbipgYmD7MqjuGb5bo
         sA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PlBT1B/hjs0RZ4Sv/xaBn5v/munjW/EVMnZ0HWetFtY=;
        b=CeupT6AioWIqh7bcCzBDSWDPyoqDy5plCnToisfv4q8IeXxqqmhuDTz1Pi4L2iVWJr
         9JU2fbA+2WkqEJRSvPCSDVKvovIpNNUHuSFqinJZkrmwoV1UDHB35lvuboLp0R06hYwk
         GTYxk8A+iJvNcMTzMCZ6T4RBOz1z+ooxBMW+SdaCT6DveY7OQ1e18SU/7bUlu1S0pCi5
         yqxr0N/y47v7AXcHfQTHp/GhPvgEZPjf4UIsH4RhDg3wqol3TWC/ZV86km/3h2M83erx
         u4vlX2FC/jZMzp/4zEVu+Tn4UspiCMaquAmBIY19uOISEm4VEEIxebbM/10kFz5FnQ6L
         /ZIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="h0ouO/8u";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si676635ybo.233.2020.06.01.16.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="h0ouO/8u";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfu3K-0006wy-2n
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftzi-0002iF-Fo
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 19:37:26 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftzh-00066G-Gc
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 19:37:26 -0400
Received: by mail-pl1-x643.google.com with SMTP id x11so555094plv.9
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 16:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PlBT1B/hjs0RZ4Sv/xaBn5v/munjW/EVMnZ0HWetFtY=;
 b=h0ouO/8u5iRqZlDoPrAMhkSSqFRTrfSwQdo19a4i9ahzvmGjW0r6DS5w0CXaMbbJtL
 /So9QK85DTtEQdWnTr0axxftFQZvGnF2jLt5EJ82ylkw5vJgvgWrdemTxnGl2T/EDVPy
 tkR6x9ZtBtuv7G7WnqinFAypKDbsLrHF/El7N5SmOAmTwcd1ObkvDQR+XLnQz3/9dSLv
 0ZcCXDtQJwZmlIpqQUJaKcsDiDMKHRBkg+3uD47Izs61TD3fhbbFgPUiS3tX1lMruyO8
 oXK1ML5f8Zah4SLGKt/6mY+IX6klJBO8Hynj6yjeHoSrie0ul9t9XWocNqYuw8RjfcaO
 h/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PlBT1B/hjs0RZ4Sv/xaBn5v/munjW/EVMnZ0HWetFtY=;
 b=MTQ8iuIV+RXCRnZ+fRrVqtRFfyyF5fsc96ZPQg/Co4KeKMix3r2Qoo6VU5WRn8X9lx
 GBtC+f4x7USAaOChAkcmWCrMj6yWdncpabPEr4i2+DPLSOMFxAFhPy+mq3pI+fQG+Pzy
 Ow8BVrakMvaibermxvwCiPALpU50zZUjn1GGhTOau/bT4J5xwUKAul69ep6BbMyLt4S1
 aipbA0aOWFSd4nc5kzd59R3daMJ3XbGaUSDSOrZDCWeHNuwtLoDWq1cEGYbJL/jkpLU6
 MOxHb9/XMXEhYueyUfkGATmGfs06WzOAE5ZyuzH6stg0hul00p14uBoxxIKbeNz6JCbw
 taBg==
X-Gm-Message-State: AOAM531NmxubYCqUlCAKr7lOkXZ9GA2paInfDhIwi/vFAszdseVrSCbl
 9kOcGqfm0qUQoV4En9q7hb4Muw==
X-Received: by 2002:a17:902:710b:: with SMTP id
 a11mr6593788pll.156.1591054644135; 
 Mon, 01 Jun 2020 16:37:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l187sm400253pfl.218.2020.06.01.16.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:23 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] hw/hppa/dino: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57783e28-09e5-8545-7a90-e52ad0dac9d8@linaro.org>
Date: Mon, 1 Jun 2020 16:37:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NpcQY/yWAwNa

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/hppa/dino.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

