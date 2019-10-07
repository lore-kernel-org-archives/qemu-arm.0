Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3792240wrm;
        Mon, 7 Oct 2019 06:21:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPKJu1BQQqsnE6VhFXMqkHIevT1BcBjlXC/bhxHdC2mKMSkihCYqLLuPQNoUxo8EtS5WoR
X-Received: by 2002:ac8:3927:: with SMTP id s36mr29187977qtb.215.1570454478429;
        Mon, 07 Oct 2019 06:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570454478; cv=none;
        d=google.com; s=arc-20160816;
        b=PD+HEiCmXzNaFjO2qNpBVnjMp+V86j8EevWgUiQVkydAeriHd+2ypqhWl7lbvorSfR
         LdGX5m5IBaPC7tdgpJlTghlphjwitK3FiwXO69HUkKFSY/zkTBbmiwXuZQklg78f7/lL
         3iTjbeUHQ6hAXfyE0ZBQ3gwjd6b07O1rmIo9xPJJPqCc5TSG1WJ87+v+UudOXPR8deDa
         ntQ1FxnrJhlql27xFG37KeGgfsGtDCoYDQGAgGwBpIJtoPx5q9mY7E7iL7RB6TsCpsXd
         g4gOt4ATn0gMfTVk0szgvIptb9IwzH1QS163asT/kwRoqGnCASj4n/gBHzlQKlbJHs1b
         6vtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=C+ot8Nq2sHr3ETVQasICTFOGE5lJWr4A2nrqF3GXIow=;
        b=lONVzUNeJmjlyDBvCqhyDhHe+WHeT0lU2H3vQNTgWO3bcSFYXTXR6tWYAV3ghYlp4n
         lhO+VuQadmxwURcVpikoGY3+rKerHkbaz7R5USaLJBhu4VsfCFHMtWT7RsBEImdmBmn9
         2NKW2KNaV55vhwA4Qi4sFI558XGpCrh5x8cD05ioMyiDVDMSEX5yqKzsRJ1J5gLfyMEG
         VPl8/mFgWFnouuiHPAjLK7ViuzsFbZ8CMZXk/C7l/Yz1aIWV3U1ExTfs4PnDhO/ygV+1
         vFoskF98WHa2x0EgJPu9zMfcIe3TL0kdeD0c7/TXZz422DHd1+uspQw574ft0dAc7ugW
         pKyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xrmPgEtP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c125si12106902qkb.283.2019.10.07.06.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 06:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xrmPgEtP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHSwv-0004fv-IN
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 09:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHSwP-0004ej-Kp
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 09:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHSwO-0000uB-BM
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 09:20:45 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHSwO-0000tw-7p
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 09:20:44 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id v37so4641289ybi.6
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2019 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C+ot8Nq2sHr3ETVQasICTFOGE5lJWr4A2nrqF3GXIow=;
 b=xrmPgEtPG/23g4fq/kw2XaRY2VxAS2HWM5BesdC2yVE6s0GEG90g4OGPbIAlBRFf6M
 p7QbrvpRtwhxJ5IFzh6ElgsUSjVbu8wtf74C5CR91QPYyoJrMNJAjK79b3wMuZg0sZqK
 D0zo3nklRnQKWY3HNxtGgSAU/w4fxe+kd42FjaxSCXf8+w3X2TC6Kiktc/BrdHpRn+S+
 fv8kZbef7zQtpqa+AY31X1tAOrTpxZccIC37pO8LGzagNKI1wu5qh5qK2R1a7HB8NMW4
 hiKbdKULsxhzh+dGmc/+vwPZ0T7gzJraYekO1Uc50bAR9g5y7DtDlaoRn2JauqrfN2DZ
 Zzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C+ot8Nq2sHr3ETVQasICTFOGE5lJWr4A2nrqF3GXIow=;
 b=DMXEYauHJP10Yg2PnBTcxoZYSAfW4QB2/oDNmtZeTXnhB5nWmuohhNtSAqV0tf2kxD
 hyfyiyx+ATO2fqPX1yfd0Awh9/Nptz8FAQbRQg7rmyOw29F/oyNenSgPlgc1aeXjgrkV
 StkKJ74YkKBFvoLOZTOSorKoperImW9LMP0GrWNBH1ezueKIF2bLAo9xQG37N6l0QRUQ
 7Z3W8RcVrokzcsCE31VV14gp9yVf4ur5qfH7wPQ/Prq6K0PVnMhpgCIEtVw98kPTUezd
 MDHf1U8J6AHUVKAoJ2c74vEfu7wpYqsi7hNJTYJZRjPNwciYR6eAepi34xwggQRJ2vuL
 e3Bg==
X-Gm-Message-State: APjAAAVE8II2lMziwn6Ue4s/hzPfGNwkFw8X3r8YvYQwsj4F8BJWlzSU
 OrL1oK0rvBOa+890GUKAh6O2Ig==
X-Received: by 2002:a5b:44b:: with SMTP id s11mr10623527ybp.97.1570454443176; 
 Mon, 07 Oct 2019 06:20:43 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id y75sm3773300ywa.58.2019.10.07.06.20.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 06:20:42 -0700 (PDT)
Subject: Re: [RFC 2/4] ptimer: Rename ptimer_init() to ptimer_init_with_bh()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191004114848.16831-1-peter.maydell@linaro.org>
 <20191004114848.16831-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8a973b8d-a53e-011f-6fab-8bb86159cec6@linaro.org>
Date: Mon, 7 Oct 2019 09:20:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004114848.16831-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b2c
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i1LAsl1jJSrB

On 10/4/19 4:48 AM, Peter Maydell wrote:
> Currently the ptimer design uses a QEMU bottom-half as its
> mechanism for calling back into the device model using the
> ptimer when the timer has expired. Unfortunately this design
> is fatally flawed, because it means that there is a lag
> between the ptimer updating its own state and the device
> callback function updating device state, and guest accesses
> to device registers between the two can return inconsistent
> device state.
> 
> We want to replace the bottom-half design with one where
> the guest device's callback is called either immediately
> (when the ptimer triggers by timeout) or when the device
> model code closes a transaction-begin/end section (when the
> ptimer triggers because the device model changed the
> ptimer's count value or other state). As the first step,
> rename ptimer_init() to ptimer_init_with_bh(), to free up
> the ptimer_init() name for the new API. We can then convert
> all the ptimer users away from ptimer_init_with_bh() before
> removing it entirely.
> 
> (Commit created with
>  git grep -l ptimer_init | xargs sed -i -e 's/ptimer_init/ptimer_init_with_bh/'
> and three overlong lines folded by hand.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

