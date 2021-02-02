Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp190400lfo;
        Tue, 2 Feb 2021 07:03:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl9m6e3gzOS/IODt0WAvtMTR3e3aXKB+R/eHAhGnkTRhbiD4lUSrMf2eEOCHY9kO8VBkvH
X-Received: by 2002:a25:b9cf:: with SMTP id y15mr34888132ybj.43.1612278187605;
        Tue, 02 Feb 2021 07:03:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278187; cv=none;
        d=google.com; s=arc-20160816;
        b=PxXisr1KOxMJ4y9gNzmr/zOBnYW8pAvHUWAVWGQW7qDBhZjc1ZlaUQr44h1aVihnsS
         NlqJPJjhSV9E2SHmyLdJ1Wok4lGuyLTO8TmoqS9vHKAsTffcUreaL+c38oRCG4jFOAqf
         Vgp5EZvCb8w1EnRvF9/sEpODmbdjgmlE9e1mWCEGX+ME0jkyVzC10EQWKYyf+6KAFSVh
         9saGCuLh5zHGPapNPzbtaxxpTi65nqRL1Ne6YxUgPgpKPDMx2xGZ5IDJR5iOTjsA7qQj
         ZuOqTnqy2GfXMAahJKXYn81cUeuwSMmf4kgEdc6YzyXxYdtVe+nHo7q9FcjfmQK0yVuh
         eYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AGdE23kxnG8oVtrwvvoJyRrj0ViisTaIiWaDd79tTYY=;
        b=UGWaNkQXdAbAoB/ZxzqRRTGPcDodpGe55SMA0YLTg04IQJHIU9IcxEod0l63lFdTV8
         4I3mtXVsU9yE7TxeufQkeO+pWwgO0DTcg07Uc5kYntYlppq2HbVsaZ8hn1u/f12jVRHK
         Gu8t+IlwSfm9jMGprGPObADNNWvc1msSqvQtHRQDTN/qVTwucsOdFFmgqOd2ju2NPJOF
         o7H8KcNBGPwNMighj5NBzPEfPHYg6ZDmMidfp1n4Le596Res+OT5CxFjIgeohMhpRcyr
         N1WMs1scXtzqp41fXDjEeku7I44e8BkfnwlXPMNNTo7xPBirKnEE9YcoBzA+wE5zDUbi
         QlGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zexwnsEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si3082306ybo.338.2021.02.02.07.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:03:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zexwnsEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xCs-00022T-T7
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wuq-0005cT-RU
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:44:28 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wuo-0002Ad-Ha
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:44:28 -0500
Received: by mail-ej1-x636.google.com with SMTP id rv9so30309244ejb.13
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 06:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AGdE23kxnG8oVtrwvvoJyRrj0ViisTaIiWaDd79tTYY=;
 b=zexwnsEM/ZPxYnQUmo/9t4V4OU0Czctskb18NjPHVgGH/GYENZIFgjQd31BD5FgdK1
 PZ2AcUtn+3Fuxq577w31SeCNoH+/kQybwjczOLjsM2zvWpE07mbnlUHRpJx1fi7p/bxW
 okScuitP5gdhXGFHpLR1xLWmVoTOnXEgkcdVpXYeYH4J/hxavUniQ0bgR8j4cxi+Elbu
 lf+LqzKlOp6wjrksI4gFpfclbCdeqkrshd/sC/L99mFsZgl/WMyEVoT1Kxo5eGnGc9J/
 gKB86kiusXo5CPnNY3Cm8zNgXg3qp1KXweyQw9wiyXYS2LvfRmUO1WVb+ZMe7DSrXBTX
 US9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AGdE23kxnG8oVtrwvvoJyRrj0ViisTaIiWaDd79tTYY=;
 b=IkKYRhHFacVJNtW6kod99fz2oAE3P4Ei9Jj9gx900XCGLc6KNNr6mYG0WSk7sXa0m4
 UQmFPmI0bmAVfh6607JSDJXHHDvG9MgeVAETMUbBO/SRtjmQUnnP3zbjXgOZxFSMtVBF
 y2IAwo95NVpJhADVpwtbBEm8roWQT0scQ+0+rp4/NAxQBQSR2rr3h0s/eQSKx4rrh+2/
 UKSBE9cpCPl1TvYrQ3MaECoxnkqmJfgwBYN+V27mlZ7S1aaqPacwggn6/Z1dF6OVmxy+
 LY3aY6ODqb5Wh8IAT9FO4AYcLBqRoqQnJzMh4es+b6Hy7JkBFxZs39e4qG6h+IFCgNoR
 lGmQ==
X-Gm-Message-State: AOAM531BmkS+O7KAiFWQXbDU82VJcQVxi7JeSO3BWljWwQzdolMIS05O
 Kz7lAECqQrLEE+neXYtcCy94tIFKt2/MLcgThjaTWQ==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr22981846ejt.56.1612277065284; 
 Tue, 02 Feb 2021 06:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-18-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:44:14 +0000
Message-ID: <CAFEAcA81humuSWJeWDzgqoyw9MqwrwCYJfu-HVOtzTXnet3iUQ@mail.gmail.com>
Subject: Re: [PATCH v4 17/23] target/arm: Split out syndrome.h from internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wdyth0K14H5P

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move everything related to syndromes to a new file,
> which can be shared with linux-user.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
(another dropped tag from v3)

thanks
-- PMM
