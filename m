Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp656047lfb;
        Mon, 4 May 2020 10:18:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypKU1UG7impacinpnV6WFGgC0VFYUwXkz2v9D+BcAad9ZYgutl0KoRfiszEx0KWHKEnBY2TJ
X-Received: by 2002:a0c:a892:: with SMTP id x18mr81613qva.247.1588612695411;
        Mon, 04 May 2020 10:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588612695; cv=none;
        d=google.com; s=arc-20160816;
        b=gUrjRy4cWNdDn8zEbKUpRtQQBjNHAFO2QLOyTrrV+euwmwasSJaSbeaMG2MAfI60iV
         cpcjBcbrS7xy7qOCmSNtu2YQ/UAUiygCoI8Pu7nGORASsP8nAC56rG8mp4W16/bKl1IO
         6878GeWGPYygEHN8TbpTM3gMnL9V4SBOV0aG/XicAbY1xNC5OCM20GVRaw9CwBgbTToB
         hVAZn2D9JRTIHLo1eqe5l3yffIi475oUn4vf8lpollgSxbYpOtD/ye7919NSLUYl5VQk
         5Xs9sXGO6F6doGugpIBI1LeYpHWQLkrpuGaHQcmd2ivdKhow4Hs71IobKI+fUo5UuozE
         WpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZAgT/N6VdVa2gcUEHlc67rQXtKYTDUFcbF1qLY4/QxY=;
        b=nUHON19sxKOWpNXpPZwtio+OBX6pXGTEco36Q40xYpcCkhu5IDAhg1ComSOfj+pl25
         tOnjD1gf6/ljgQd6rb48K4uKdOMmMnfF5PclXmWjjwfMLCn4iQRYM+qLyt4CQeGoSRvS
         BcIHqM1sbAI2R5KAuAOlbi+RHRLRCY6ywsA0S/aXug4rHGDWoEqNhk37J22AYbWTExo/
         D2p+7BLheRzDbAAOYuLhcaZA99Zd4N8AURS5XPgTVggnrM26d7rme3MPd1eBMObbdFwB
         9A7i9WhEo3vpL8Cu/mvF1K5XtXkgmp54JUK636J7KWAMAZCZgKVZxQJizb5sy2vlbjEt
         qZ1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I5z/4XsF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id f48si6744633qtc.250.2020.05.04.10.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I5z/4XsF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVejO-0001Tu-RC
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVehY-0007bP-3o
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:16:20 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVehX-0002ep-7l
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:16:19 -0400
Received: by mail-pl1-x644.google.com with SMTP id f15so1036plr.3
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZAgT/N6VdVa2gcUEHlc67rQXtKYTDUFcbF1qLY4/QxY=;
 b=I5z/4XsF7Xcb6+MFqLEvp9BfhJ2xKkrPkV8mUvHLei/aSMS2Y0ip5cfr4p8Mj7zRc9
 zhhW3BEf21Kq9bA9WPGS+gowESI6cIOatbnOWjet2yVpUcY3bAcGnzab8e+iJMDL1iOv
 FlMlG61aktw8Lg+ngkpTNLOjqa35aS0ukTQoZoV2VJGdZHgl9FLKore0wRRndyPWxO6N
 0ae5mPRMNAqI+B7Z+m0gQEhugM1hcEQOfmxLloWdw6uRd7ZCbz0zjakOw6ddWvcWlNbq
 E3+mSGeWCytH4TrXAkdAI95HN3dV7+mQin+3w2loRExdSSYCDaxizLOxOsomv5gyPW52
 RewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZAgT/N6VdVa2gcUEHlc67rQXtKYTDUFcbF1qLY4/QxY=;
 b=ifWNZ2Rtqh8GuKcBwLdljatzWG12cdQodAa6YajGaGS4ryvyuL4hNHCU6EFqLU63T9
 NGA0KVnU8/gwAg4Rh4weYvX+3JTudW41RkSuoV5N93oTyf+jBFmMvGQ2F1P4qPUYjL2R
 Y3Xstd9HfOiAwJfzvSi3yAxUNKdPX+hGmFRKVL7cTX8qDT0+8KSBOUM7X7aY1sGGP5/V
 8BKhJ5UXXTYP+U7A2GhL3Jmkdui9XcoX0wIgl1APk8tXMaNkl5hKz2BxImMk5RqF0Vuh
 qJXmXLw5tHkZfxRfaWMXLphpgwcp3Kn5+T2i65Jc68nPqdy+iJAX6CKhdJpLO9AWQLMM
 hM6g==
X-Gm-Message-State: AGi0PuZWcZWogSp5koJiKQZjNC1TSE2Wc4+5ROmqLgM7NiqhmSYhWFut
 V/uzevAd6yMnfKu/+Jyz5w4+1g==
X-Received: by 2002:a17:902:b48f:: with SMTP id
 y15mr232447plr.114.1588612577533; 
 Mon, 04 May 2020 10:16:17 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id i190sm9277842pfe.114.2020.05.04.10.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:16:16 -0700 (PDT)
Subject: Re: [PATCH 4/4] hw/timer/nrf51_timer: Add trace event of counter
 value update
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200504072822.18799-1-f4bug@amsat.org>
 <20200504072822.18799-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d24fa27c-f311-080b-bf9d-7150b23cfa41@linaro.org>
Date: Mon, 4 May 2020 10:16:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504072822.18799-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z0727imfsogN

On 5/4/20 12:28 AM, Philippe Mathieu-Daudé wrote:
> Add trace event to display timer's counter value updates.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/timer/nrf51_timer.c | 1 +
>  hw/timer/trace-events  | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

