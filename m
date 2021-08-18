Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp289096lfg;
        Wed, 18 Aug 2021 05:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI/0rVgkSzGgR5jSiLDbLodLIr/E74uZIAMsgw4PyR6Tqb7EZIay2BFukwohZL/2T8XvHJ
X-Received: by 2002:a05:6402:2794:: with SMTP id b20mr10051905ede.126.1629288266448;
        Wed, 18 Aug 2021 05:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629288266; cv=none;
        d=google.com; s=arc-20160816;
        b=jNnaBPo6bDbhlXHzMZZ1pexQcBz3uG/9W4IegRT6KvsQbRglQm5MBcp1nD3NDBtzLl
         gcezzkY/0e9AV/exOypa6NiXeWZPXX42fIY306NU2I3E+3NAR71W5pwncTlwR7KrKdkD
         DWF5eKUcoNzF+RCUrag0L24qRpY5H1tfvAbxbFDsqJ1+L9TGmCgV22+g0Zpyizk2Wh4a
         TrIu/3/Jxwq4f0EvP5mHxLaXWI1+XE4eRrgehAS7T5RfUbzdaiyVfmY8mKLLH6qaBufP
         4HI3qwqBzIF4UA8lXLLL/3iI42cfoGgWqVdQ0UXhUQRG7PVgkJKVzvoGR18bqkOatbUg
         O+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GCPClIadaSHLoRtE8XPqz88rJHF0fVEOWxuu86gmRAc=;
        b=k9L5W6pR8v9CupWgllVXXCltte+Y0MPCaZe5WaBNhMqJs1TD1xAyEkSPaowb8MWqVT
         2xNUaHdbvWQbL6fbFTqjoD6AhuraaLQ6GE3WxYyFfCC2m/1Z3o9HBDr9GXh4ektBROYD
         6+0rXxYl18eJjurVSQowxx0UyHqeAellpgEULNufFIzugSjPhjp4l218IApJw0VGTeQb
         YFq4r24giXLx3mMhA3DOUDxZ0F64lRbqLLvRjSRMgXAQZmvRUdhpwWQ4Ktd2TpZ1wlbd
         yA8h6PG+msuoI1+IzxTioixo5HPHTp3Ctr0BypF7uMLRAjBdH70EYj1Xi0ezrMzsuU2p
         +6VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wLeLPFKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si5934512edy.42.2021.08.18.05.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Aug 2021 05:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wLeLPFKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGKIz-0001Mv-8G
	for alex.bennee@linaro.org; Wed, 18 Aug 2021 08:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mGKIQ-0001Mg-B6; Wed, 18 Aug 2021 08:03:50 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mGKIN-0007sf-6Z; Wed, 18 Aug 2021 08:03:50 -0400
Received: from [192.168.15.250] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 79E6020783;
 Wed, 18 Aug 2021 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629288222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCPClIadaSHLoRtE8XPqz88rJHF0fVEOWxuu86gmRAc=;
 b=wLeLPFKrnurHxohlPvNnLPk44a5o/05w/puud1sxsakQje+pjpkMPr/atLZgrzsFaM4aDx
 JSq6bMwQdu/mxqN4nXewmHubUoO+KCLYNH42yTwdJOD2dlSBzmxGrynLoRBzeg5P2ae0z7
 JZmkEbVC9LWuVsWj+t5yTmGRArVnCzk=
Subject: Re: [PATCH for-6.2 24/25] hw/timer/stellaris-gptm: Use Clock input
 instead of system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-25-peter.maydell@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <6fdf26e2-7d08-0c3b-baa9-666f0a2419da@greensocs.com>
Date: Wed, 18 Aug 2021 14:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2BRj25VEg+vG



On 8/12/21 11:33 AM, Peter Maydell wrote:
> The stellaris-gptm timer currently uses system_clock_scale for one of
> its timer modes where the timer runs at the CPU clock rate.  Make it
> use a Clock input instead.
> 
> We don't try to make the timer handle changes in the clock frequency
> while the downcounter is running.  This is not a change in behaviour
> from the previous system_clock_scale implementation -- we will pick
> up the new frequency only when the downcounter hits zero.  Handling
> dynamic clock changes when the counter is running would require state
> that the current gptm implementation doesn't have.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> As noted in the comment, ideally we would convert the device to use
> ptimer for its downcounter, which supports frequency changes while
> the counter is running and would also allow reading the timer value.
> But I don't want to make and test that change to a minor timer device
> in a board model I wouldn't recommend anybody actually use; this
> series is long enough as it is...
> ---
>  include/hw/timer/stellaris-gptm.h |  3 +++
>  hw/arm/stellaris.c                | 12 +++++++++---
>  hw/timer/stellaris-gptm.c         | 26 ++++++++++++++++++++++----
>  3 files changed, 34 insertions(+), 7 deletions(-)
> 

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
