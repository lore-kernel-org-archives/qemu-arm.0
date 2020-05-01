Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp187800lfm;
        Thu, 30 Apr 2020 20:36:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ40Uqop4oAc2ydlmvwq7NUevcbYeae0dyUJU52W72lQVITbCzFz1hQNdlCpwRlffS7ud18
X-Received: by 2002:a0c:f34b:: with SMTP id e11mr2163412qvm.76.1588304214394;
        Thu, 30 Apr 2020 20:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588304214; cv=none;
        d=google.com; s=arc-20160816;
        b=wLWx8hJKqJERhq1HDfj4V3Czid1selKaODDRKDJXo7ynYNNiqe5WtuvGnA8QTHaLdz
         qPcwWpW66rCq7GirOlLRR13QuvEdaqgDoH7dlEoJezs0HTqnqUjb+wobio5GVKfm36KW
         mu2K6u2C91GawufnFK3emXgYh35hkPHYtc074KOa3+3jMdclVE5DrSVs7ZlMxBPXLAWL
         OGyVYthsIdLaJs8lT5adcwNRtCggYkttOy7Y7cVTSYNZUW9eMD35UW5tayoOKD/obOEf
         XhSNjs1aFH5k2BfEOgoHsaSjG43EmyQgWNIwtNpCsP6lD7d1AbtSYATXvZtZ+B2IrFXv
         MGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0Uj6Xt+Ysy6EzXWRPhCgjEcA7gSi9B8i5OasAu06NjI=;
        b=Z8MHBdxc5lgf+BUQSRRYfH0yv5SsAy87WLxu3Y3PgOTRUxiWr6sY3WTrW0ulqSQJgn
         Fdeor0NI9Dhy44kLB5xbPEkouh5+6xXMM+apfH3GEgK1h7jJPrWDPjYx0GufFJVuTsBq
         I4lBjoguM4whQqEDDf6y81GFfc8iBJa0bcqfxxqJisiF3X0mI1IGrf6Bcd4woQv3dqVl
         2xO4xMaWk9t2cpxBnj4JaK/ZxZWxYAhkuO8960q52h8vVf808BzPHwAO7Ih3B9vmitT7
         hYZwKarC1nWwgjvIdnj1Br+TP38m9/fCagPAS1cnMGszlTz5wM8bXGh6SLisE8H16DZI
         GyvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fzbub2Yj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c68si990769qke.281.2020.04.30.20.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 20:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fzbub2Yj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUMTt-000456-R4
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 23:36:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMTm-00044u-G1
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMTk-00082K-Mq
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:36:46 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUMTk-0007ur-50
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:36:44 -0400
Received: by mail-pg1-x544.google.com with SMTP id q124so4012493pgq.13
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 20:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0Uj6Xt+Ysy6EzXWRPhCgjEcA7gSi9B8i5OasAu06NjI=;
 b=fzbub2YjtcR2XYpgKoLQhC9ITlL6z0WYsl8KN5cMCtPyQUgE39amg/aXqWRwXA/WDo
 Z78UnrbKkc+ajawhI4/9Jed4X4eq2zAhjT88owcBH1MT/TM2meApANUVSPkLPLv2Vlup
 2dzCN+z0Gc1C34XXwB+nBDMX4x8PVRJY+A3GOLGeil+tlN2tYXM28eT+APYkd0N0FIMk
 qENGFfM+MIJOydGg2jdnp9KatdCrKlUj0faaGdKkCReny5bVHNOd/SY6sxqo2rRxrtay
 U1naRKuLGJiANWSoEunSG7MnzakJCL/AxPE/9i7978gM3ueCVtSOxRp3pemv+FbUqXu7
 BURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Uj6Xt+Ysy6EzXWRPhCgjEcA7gSi9B8i5OasAu06NjI=;
 b=GfFH4p2JEUv/Fx9u7cIGXjbT81jzoi4LMEEkZq5MPoXMyFPRX1z3dmp5xlT8XG6NW+
 bl8zMSMJfN3UeydhtyGbDekuJtT0VRUwl39k5X9B49eWNtq508YnqI88SsMJrOWU69fF
 eEoIdk4/YSM5+6J9jxUJL/mSMoHzVJzAFNFh1H1ceWittF7bSDX21WxSgZO9eg7ELxIR
 9gK6iYfiLOAHvG2bBW540UYCfCcZRSR0vOGcGtG4xXSMZD2yjR/FZE3FCM17DX6G+pQT
 PgVNX8XlvdhrYz3hpF5k6Ti4OCdlJEW/nLBQMb7LByWA0Y9iG3ppytCfCuOLQ5bNqSp+
 aIHw==
X-Gm-Message-State: AGi0PuZt7pKvKuTNwFt9hn04xhE1vqTyF4BPGlhWM+djDDNuphAOyini
 ITEyEVFBqXPdvhcNcAHbJb8NyQ==
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr2243436pfr.36.1588304202190;
 Thu, 30 Apr 2020 20:36:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w12sm999739pfq.133.2020.04.30.20.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 20:36:41 -0700 (PDT)
Subject: Re: [PATCH 28/36] target/arm: Convert Neon VPMAX/VPMIN 3-reg-same
 insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c915d8e2-34db-ca42-45a0-03c20f8f88aa@linaro.org>
Date: Thu, 30 Apr 2020 20:36:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::544
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xm10PoYO2Xpp

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon integer VPMAX and VPMIN 3-reg-same insns to
> decodetree. These are 'pairwise' operations.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 71 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 16 +-------
>  target/arm/neon-dp.decode       |  9 +++++
>  3 files changed, 82 insertions(+), 14 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
