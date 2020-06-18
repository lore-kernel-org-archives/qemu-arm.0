Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1803251lfm;
        Thu, 18 Jun 2020 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCUsuZ4zEblHkO5rA/KF8AHijVJ0y67rr4NBKwQykoJdfG2JK6wcYz/fIW8YYRfcmYXnzM
X-Received: by 2002:a25:fc0a:: with SMTP id v10mr7342369ybd.119.1592497743306;
        Thu, 18 Jun 2020 09:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592497743; cv=none;
        d=google.com; s=arc-20160816;
        b=pHygP3IFfd0OeiOCDe/P36nPhM0xVwNsRrKt1cbuX2hlYIuZsUbtbQ2z3sksJCoGMD
         B7DZ+AeDrxWVgJ5JikWCVpCkHW1pSzEf3Kz8R+lE5TtNqgGAC2CY8sAZ7HtT0Woseb1E
         iui7ccfT1x7WAsk4b9zg3NYlEyWh1Ri4phgAlBxnhRSCgb6qL10kPqmBKbuMGwENL1Cc
         +luJZinsVQAM/VqgdytgHdyePjKiD5/DKY6PFGRIP/RkhuTJtHqkbqtkhAb9uqCzzB/o
         xmMxaO14+Ae+DHfWjGy/lhuRUbL6UMRluoXWBjaGG/fyWEs70W+VrqwNyMejWH4QLMDZ
         yCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KOZc7w2xFsluC74qyPSUVXOw/N6fRxF3MLKa8m9157Y=;
        b=waLH1oPq5G9c3MyWxGkef7Gab5GIJQIrL4qP0GAGvAerYWDNUF8y1eGqzvIDhHPJ3d
         ezfX3jsqikiUnFlxHUsSpnCaHESI3Y2WLKsDlsVHMBJCha0hrHyldJyqeyHswpgYx3P4
         WbM91IPJ/gfF7ZMASknLZya8MV2phUm5QmaSN0ZBmU1zUdORdWdT1OkJG87dy3g+p2tI
         z5ggxNOag733U0kxU5mLPBdbA4l/RhFrMZwZphFNmroInyCWUUGfmxSxzlTX3HIuX9Q/
         ZGZl4+7eL6riOViOLIXM5FNYF5rA6Sb8sGdgj2QVdFyiCQtDbdCZeDaGDOYuPHP6q5K+
         PKBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FmSyCUxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si2802043yba.198.2020.06.18.09.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FmSyCUxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxPS-0004aE-Nm
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxP8-0004K6-QV
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:28:42 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxP7-0001nq-B1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:28:42 -0400
Received: by mail-oi1-x241.google.com with SMTP id c194so5630683oig.5
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOZc7w2xFsluC74qyPSUVXOw/N6fRxF3MLKa8m9157Y=;
 b=FmSyCUxJaFrXXTaflf8CIKAEHBtCJ8vmE2LrR1Sw3DoAKJ68ocV+dhg1tOITCC38nB
 dcEefVjTyLPoZ9PtqdA6QJ4C99rK3ZY2ZQPKbO+ZmjyH9OhrE3ynA/TaHM/YRxwGvHRv
 aBTQNi8GXZNh+Xxz/N9rUyFO39A7Ihv2FxQ7MU0wqLZNTWV/pryMsef9rfHKYeb+2Vo0
 d+qzIpowo15bVZBfPsa7Bx9Oh0H0ncfZWPWNG7+wI6uFP54Vtr9sqhOBf9bUamA6U3Wm
 scaql9NeijNzbbvuuNh9lVuvm+kQ3c3q5fZg6DeY6IU3hVPNTsE52m3XYLQ/ozVfYY1C
 i1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOZc7w2xFsluC74qyPSUVXOw/N6fRxF3MLKa8m9157Y=;
 b=Jep5RsofAWJEQJ0jzpcUKBgK8UePv766WF3g+5zvEevmtDpu3zLTiIhnBCPUrDdkYo
 9xw83Jq73SvGsZ3013YqsQD0w7/VXUdq6V+0QLW1HlgRuKvZtzDznmmuOZ6e4JKn0/K3
 x/hbmEKQeza2CKoOXo20/ASg6cuBOVXbM/asNLtjIN/9my5o6D0hsIo2VPhCFQXmuiCp
 iCxGfeiUR5UaNSokEr+IDwZanHGlSxaawokr8ZRE8Ewvklm70yDumIshsd6iJIiRevPt
 gNI2E4VvVp9tuI3IJ6qyfXAcOEODU9xvdcJBgsI/xBRAaspJgEMV6OPMjVTQXPIpdjdU
 yIGw==
X-Gm-Message-State: AOAM5311VgoInPYrlj1a630M0ZZ6jxt4JhBvt8ka6OdLh+daKxCdcxXm
 44ZM8IV84IfQZ9N0inxKvafJ0m/Rhuiodgqm5NP3wA==
X-Received: by 2002:aca:5152:: with SMTP id f79mr3545603oib.146.1592497720112; 
 Thu, 18 Jun 2020 09:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-21-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:28:29 +0100
Message-ID: <CAFEAcA8B=DQH4h-uTV7veaa-bCVsYjKkHDRsTj-zeU-7Zxg3tw@mail.gmail.com>
Subject: Re: [PATCH v7 20/42] target/arm: Implement the access tag cache
 flushes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ika0pUHJu9Ef

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Like the regular data cache flushes, these are nops within qemu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Split out and handle el0 cache ops properly.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
