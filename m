Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3239990lfq;
        Sat, 10 Oct 2020 08:17:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc7YmhgmgYzsXdrCBNVJXU4ya+62zpmblEXUJBF0jrYL07IF/plawZIs1qsp4tMDODLomP
X-Received: by 2002:a25:8541:: with SMTP id f1mr21280148ybn.230.1602343073114;
        Sat, 10 Oct 2020 08:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602343073; cv=none;
        d=google.com; s=arc-20160816;
        b=Kd1HG6cFa58RPnr3vslG82enBhv81MEDKBsBvFIkvSuuGspELqwrW0vLoy9noF67xt
         udXB37k7klQRDER+ajADuA56RDbPbhue7ubKdcYPjPS36iScxBBtHu9UDDTCISc0rsRG
         zt4XYqwBoYylpcftOjYnV3kR0Samo1bBK7nGXSMwOTV4E9h+RQpSsQ2vNiYj7BswBqIc
         A7yHnHxd41Fk3ccTfm2/PJWvDlA4qgLh6gfsrncni489vmX8t80mVtr+UuJ8A3n0v8Cf
         +7YcdQqyssJ1q3u+OMM1eP8UEFK6ybFFZHLqEDfnxKi6OoEWMy0013ONZ+V8/pHbQqnW
         c/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rZUK4OpgM9LDSuM+PftlglNnkrsDkN4iy8skrvx7zaQ=;
        b=rv3kYQg/HcZ3bZBYtIH9PPH7KYQLogO8O0H4xyyAiRDtBNAS1907D155EOzWI5HuIN
         FEvr9OfELUQdnDsq4uihMIOwdZYGQ3nH5dgg2z23ndvaSA3xPW+BPdT74XbgjIwxtJxo
         57VANR5WqPM/q74YfmvWNT/Q83uVfoYCfvUgFGA5Uw9TkN/PWOpYXl5zo4HLHsK7CIUR
         iJtUGgDd+78NTC8x6c3RFJp7lxKrlapFLLe4CEy2eYVUzgy34CiIEBl5w2SVNBZtKEgX
         UkUTX7bb/9rwaqLTT4XvTOh7uNRyIe5fu2van5YRNd+VxhgVEfCJ2Cs8S/JKltkWxpq+
         OsRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6yY7bpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c62si316772yba.75.2020.10.10.08.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Oct 2020 08:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6yY7bpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRGd6-0006E5-Gs
	for alex.bennee@linaro.org; Sat, 10 Oct 2020 11:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRGcp-0006CF-Tk; Sat, 10 Oct 2020 11:17:35 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRGcf-0006pd-5f; Sat, 10 Oct 2020 11:17:29 -0400
Received: by mail-wm1-x343.google.com with SMTP id k18so12610109wmj.5;
 Sat, 10 Oct 2020 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rZUK4OpgM9LDSuM+PftlglNnkrsDkN4iy8skrvx7zaQ=;
 b=a6yY7bpeVfflurfL3PA2HjXerIF+8xFrpPC2IekDNjdKP39IgixUjUQWkcC3R1V7fY
 pGQ54AfoO/tSa36JWtFMSidUKg2bTYWRsD3OOHDks2AjZlPF72LWkWqf7SWyAJB8kB+q
 xgMqzhbJQFO3tZ/FfhvXA7nVQNWrLEG1hMIoL6ZawOwFu598IaLAQI3XH5DXdnT1gcxY
 iPfJ6AEmHXdNpqc3vF17zNtkbpZFEqDy4robbE0X4M5fTLW7q1qxDADH+FNsEmkh2UNn
 K7+Mp1fTG7a+tFoh9tufu857NjqN+n4dWzjv2ERxp/eA1oIcdTUXPnYsB7fwhRPwgSPe
 IJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rZUK4OpgM9LDSuM+PftlglNnkrsDkN4iy8skrvx7zaQ=;
 b=CEret54jJkUUlfuLOxrNqSP1qf0sdYFGZ6Zm0Htb0QPO+q+kUqjl6OJdTbdQC18LR/
 TvVJ/073BYgBWighT5zCREHe+pXG52HcS9YO00KveM9c5sSBwTLgz863kkh10dCIhWQm
 EGgp2IwAUnM09krJrK17a2F1cL9qqVgRfzprgMPiRHHBQI+cV3Cgnf3sxwlGOzHtTMNO
 HiQEOuvsUH2Sq6lOjnrIOdqvw8R1mdd0KikcP2Ql80KxU9UR74U4bDl7erH6dX2tJOQm
 o5Y/zSvYDCDXQFUniT1vqmGmZSqcgflf44b71cTmjpBUHznrox1YuxFIv/aMBLIElheP
 1ing==
X-Gm-Message-State: AOAM530KFjD782GRBbZ4hGhjBRZzy3yJKN/nBJSOUtlfJd1GebBukmqk
 EnAE8ndnv3V2uOVQhv/zysM=
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr3313045wmi.56.1602343037794;
 Sat, 10 Oct 2020 08:17:17 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id g139sm16781658wme.2.2020.10.10.08.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 08:17:16 -0700 (PDT)
Subject: Re: [PATCH v3 03/15] hw/core/clock: add the clock_new helper function
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20201010135759.437903-1-luc@lmichel.fr>
 <20201010135759.437903-4-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f49f1c17-9343-c5dc-51fd-da0edb208314@amsat.org>
Date: Sat, 10 Oct 2020 17:17:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201010135759.437903-4-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.207,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xnnsOVZqNBCD

On 10/10/20 3:57 PM, Luc Michel wrote:
> This function creates a clock and parents it to another object with a given
> name. It calls clock_setup_canonical_path before returning the new
> clock.
> 
> This function is useful to create clocks in devices when one doesn't
> want to expose it at the qdev level (as an input or an output).
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Luc Michel <luc@lmichel.fr>
> ---
>   include/hw/clock.h | 13 +++++++++++++
>   hw/core/clock.c    | 15 +++++++++++++++
>   2 files changed, 28 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

