Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp656298lfg;
        Thu, 19 Aug 2021 13:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmMzCknVWCDDH7F29j8VQQX+y14Tl8GjpDof9gA5ggihD+O6rxuDzSUBFeQmg7eec25Vu+
X-Received: by 2002:a05:6e02:1a6b:: with SMTP id w11mr10481709ilv.69.1629405294164;
        Thu, 19 Aug 2021 13:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629405294; cv=none;
        d=google.com; s=arc-20160816;
        b=ursYnmSTxeiDrrQqIUAKahNK6qfNC1LAd+kOCYdY2O+wVBcLLD+d00IKKOBQvR0DBm
         wU6J7uCqlnJvBDItN0a+y/cqsQWizLy+a1mJjpmPuRHb+20IvGa94CzRVTfV47ebeeXL
         oJ42InnzWmuKIlYBbLIzFpnJKt3ryZ/U+EW5gwhfuhB35GEQvjG2Ga70/5tCt4uLQwNI
         SO7KWlaF24usNhC9Ij2pFcRsFg7YECmauKgMDhq2U9SaETTa0ay18sjb0Z2UmIBUp3AZ
         022GnXZOG7jCeHmQWQYURHVlJORc7rSDX7/WJSwyipfVa5fS6imbeuWGYGCIP+o58P06
         2wSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jz3xrUvFVw0PU4oFrwDLmoESy2zbq1WED94qTn9AmsM=;
        b=tb5sN/hegAWYjN9Xw+t80O9YOD9SoiIb3tZ8tiNd/vUaFvnmoYIvFpgx0He/cPSh5W
         ByTKTCkF2L7/zxO7Zk9MuySfjbboJbbuqoeC8WjyeXn90/pFBbSlDWvXfoWbA4iCK9X/
         pV0LOep8zXe0YEP7yrxOe7ltIJ/bleUdnA0JyPVAuV9GzuiS9JcJoRXpEbmgyb9f/nu1
         yC9ywqsg/QSduBeTgTCkW80pmOmzItcHqv4kqaFGHzLTaekivYx3v2LsWlFvnogRFEfK
         QbLF3i0Y7Shjja/iAcLrnGtXW3NfzNtTzOYck6QE1y1Qj50bwv8I3Wl65q9SfwP/ICX3
         GN3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zrp1SPq8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si1603812jav.41.2021.08.19.13.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 13:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zrp1SPq8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGokX-0002et-Gz
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 16:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGokO-0002e3-MW
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 16:34:44 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGokM-0005RP-J1
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 16:34:44 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s11so6998793pgr.11
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jz3xrUvFVw0PU4oFrwDLmoESy2zbq1WED94qTn9AmsM=;
 b=zrp1SPq8HGwW16ZUEtdlv0jSrgYa+Y6zMZ0YwZ0lvwRThUnPQLbumjEgBCZUPpgedU
 pbJoQUFwFrRbl7BKL0XDcIBA1LLlggDKv3oE6LtsL03LMsmFg0sx9QADEx4VGTl9RFGO
 6qehaIjapiX1kcxA1UBbPrXnx4AQWxOfCbfBs0AOwSExdVuFSrrmCAQ9fgP/7vCSv21O
 dv7H9hRMa1Rte+V5CDw7PgJvS4q7JXsRFLZ9ixUh4fYeo4Kob+gvXFTX9pe67qfIYdDE
 OWVPcPZ56gP3ektmzkAbMh4tkNHTucLNETANjVpiie2qQ8JQ+PpBxOI7Y8oFwn/x8Ikn
 pr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jz3xrUvFVw0PU4oFrwDLmoESy2zbq1WED94qTn9AmsM=;
 b=iFCpwSohLjVfN2rijEysMVZX8jd+D1cwMcaGJIJdQ8hFVgU+FiQ8s5wnfIxUWNuoxU
 w2J8KwRd62qNpITplOozf7h3tXC2xfBUa7H/tD7Zop56RWY4z8KTpYzfiBhLDb3Wdi+b
 kFuVEoOYnVHQR+SnH2vs8k1uzR00WBjNDXziZrr+Z/YpxV6W8iEK4qex2rAypgnytQtE
 0hHa4bYetoCTAICWQIVdIVtMww8tp6zMYcLelECCIjAhxXLcU6FybrlVsZzP68ZVeYWZ
 BwmSlWvbf3m8AqgBmTIe359gIfAFUuqJXV2HDZ+Gt9Zt7/L5S9x1fbDy5SEeHqnZFesC
 B5VQ==
X-Gm-Message-State: AOAM532wKaTDso0M+hJTwV1JB/U4vl3LcgShn1R/ZB3M5hFkvZPKTlGO
 HGiNAH7PJoBtCoJZ4eSzPtq/4t9hIygKCQ==
X-Received: by 2002:a63:ba59:: with SMTP id l25mr15442702pgu.394.1629405280955; 
 Thu, 19 Aug 2021 13:34:40 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id o15sm5245355pgr.64.2021.08.19.13.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 13:34:40 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
 <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
 <b6754a17-7b6a-201d-6c33-7759ea8ea270@linaro.org>
 <CAFEAcA_p_sUJF2PFkmxS7LcB0ed_BtRC_VbF2WDP-eAPsZukNQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32debfaf-667e-a3cd-f4e8-e283139d60f1@linaro.org>
Date: Thu, 19 Aug 2021 10:34:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_p_sUJF2PFkmxS7LcB0ed_BtRC_VbF2WDP-eAPsZukNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dSf7SgRNy5Z+

On 8/19/21 9:24 AM, Peter Maydell wrote:
> (Did you check the M-profile code too? That also architecturally I think
> should never let PC have the low bit set; hopefully the code I wrote
> actually ensures that...)

Exception handling in m-profile is much harder to follow, but certainly normal updates to 
_NextInstrAddr are all force aligned.

r~
