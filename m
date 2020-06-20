Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1069345lfm;
        Fri, 19 Jun 2020 17:20:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuWiZNE02HqQZHwF08uBEmSQ2UA22VyFmhfDL7gXqy95ZcIln16P1ATG1xW6q6ftugP3Dr
X-Received: by 2002:a25:ca8d:: with SMTP id a135mr9011237ybg.382.1592612440638;
        Fri, 19 Jun 2020 17:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592612440; cv=none;
        d=google.com; s=arc-20160816;
        b=oQFYm8KfNTGp09esBuibQkOOcPTIB+5NEdZZMCgTxMO6aUx5kv82RRaHuGnZ70vjhO
         38gJSpFh+01EIRu3AR1udLcRBd4Xf7R3sdz1QYiKarpR3wdhV+N5lHtcQ/seBQi8G/FZ
         YfoxRGiP8av7HgDFV3LOsXz0gxIVzChxgQyK/Gr3+FnLzhzSvhN83CxRMXwwWV2rq15q
         UHRJdsYte+xbsficHke8V8U+PPJYUkVfa8k7OTqULuG8XQlO8N0R8twBguw5xd75aX0C
         XV7aOpemllwzvFRR2A0ZuCRWTl4Uc+Y0SQ3Vz4n46RE1yjMYCbnAdn7yaVzUn67U5b8f
         XHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=n6p6/2HsflTlF0NP/E8+DuGE3ZwSEEr4PTYR+4kWUjU=;
        b=ogVPS5nQ/fFieV1leYGKvVbCvKDNkpxkSch85Mhh2pHpqH4vusudkPD4XEEpLKhu92
         f42j69pWQM0sHYH6qgYaZTgKAWda7gVIjA5hbaeftnnmrSCg/SGSipBJQkTwcaIEiA8r
         h8I5YBmSebf93dSv5Nm6OjjwsCHfH1NFNjXJFJTc6/dCxgEnJxXXMvRZMVp6gjSdbC4u
         zeO1X8pQsdasbby7NibP7wjNAr1m5QwbU8uyOh7Z6ibeLx5pYVen5ZoxbMPyOo1QGtEa
         t5hpxID+MMbleCsC3cZTfudzQTWaZ1NNoEhCH1HOXl/rmx38I5lwIqQ610XcwDWbEhLh
         9EZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTu31agN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si5863035ybo.358.2020.06.19.17.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 17:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTu31agN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmRFP-0005wX-VB
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 20:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRFG-0005u6-Cf
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 20:20:30 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRFE-0007jX-MR
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 20:20:30 -0400
Received: by mail-pf1-x444.google.com with SMTP id d66so5183868pfd.6
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 17:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=n6p6/2HsflTlF0NP/E8+DuGE3ZwSEEr4PTYR+4kWUjU=;
 b=MTu31agNZDHK4QcIA/OA8+LkQdcQdBN0o7QX2DLPW2iO/0vEk2cki9ET1vXkE1GtIU
 ZNChzEHtS/TVVqAgYQljDucVasfkU9h487NrzTYSwglvjWWfpX4bGRgNjs+NrE/AVKD9
 g6ZmzEZ16m33icoE+OFic7HvfPJCEPOjP4PDkxwfHcVcU8S4uw/g1jsPshgSewkvP9no
 1g3cFTNBbtx6eKAPCE3r1sINfkFpb9cQqYtVpttsaOYf6Czwg2jIlC/4hgdAxT3y6Zkq
 9/K1yGlBIJlwruecX1h3gG/ipcGVlNslRlCfWRmIZWO0HyZLlOY0JR+04XIylEwtJLuE
 YT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n6p6/2HsflTlF0NP/E8+DuGE3ZwSEEr4PTYR+4kWUjU=;
 b=Fh8mHMEjCt471jnOifkPfVDLTsOrpUpN1hJUHKWkDbYnjrgv2ItJsXZzO93r7pWWRm
 U5ySc36ZokMVkQ64dUPIHtGYGicKyVA5TR+/dDdUj6tYGObWCRO2HQtoQDmX3ZeXXumI
 SpBLE30nfbjz5vQOTVO35l69yrIr8iRjmRfaoyv1XmLmM7cFfdkj81uIrvoICj+d/cEp
 5VNMdKT8mDTBJf+M57tGkHx+2TSzxeYbF4cuVldfJO2gOHF6EW+7FYo1QXKtlnIvBw0O
 viE6JF2xsXm6DrMQtsJo0UioEDBDv3VP0wp7VZSshU/RKaZB7F4ehFZQAJe83Ne3inhJ
 RUGg==
X-Gm-Message-State: AOAM5311UHgSqzy7a8sgwCE/sVfjeYtmwoSWC69A78FwDMr4nMb4sH3N
 pjVmblbQU6mLZksvCW2XxKgk9Q==
X-Received: by 2002:aa7:9818:: with SMTP id e24mr10646998pfl.30.1592612426988; 
 Fri, 19 Jun 2020 17:20:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id mw5sm7105235pjb.27.2020.06.19.17.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 17:20:26 -0700 (PDT)
Subject: Re: [PATCH 20/21] target/arm: Convert Neon VTRN to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <306a2904-eea0-8d9c-b7f3-931734d68ffa@linaro.org>
Date: Fri, 19 Jun 2020 17:20:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJSs1jg2Vm34

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon VTRN insn to decodetree. This is the last insn in the
> Neon data-processing group, so we can remove all the now-unused old
> decoder framework.
> 
> It's possible that there's a more efficient implementation of
> VTRN, but for this conversion we just copy the existing approach.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |   2 +-
>  target/arm/translate-neon.inc.c |  90 ++++++++
>  target/arm/translate.c          | 363 +-------------------------------
>  3 files changed, 93 insertions(+), 362 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

