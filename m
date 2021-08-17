Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp341344lfg;
        Tue, 17 Aug 2021 02:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu1cQm7j8QWlSTLlWgbd4HyEW0rvuFNNjr69qcT16LixXFDm7HxBfYIP8GByyZNw5a7aPX
X-Received: by 2002:a05:6102:5f4:: with SMTP id w20mr1736181vsf.34.1629192216875;
        Tue, 17 Aug 2021 02:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629192216; cv=none;
        d=google.com; s=arc-20160816;
        b=oFLztVWKM6tGo0BkYcJytLy13IP+157szl9RBqWT7Y8yqVVQ6/INjH93YrYvul91Im
         OQsi8vGInnUI+BAa0P472pjnejqtSEqIY0vvlwK8zCuN0yNGVfBibqqpxFqGuOxjMay5
         dTLx1cTfp8K8L4io3+chyhsV3bCPP/dV0rLsIMVLHf4Bubc1dVzm6UFLG0dPKQH1fzQj
         D3mB1b7h86eMareE1dTGcVW0eb9xI6MprVx+1ufCaYxL0kw7bETYiIbqM/DNzmJZGYWa
         /T2ThDBs4Mz4pQjTHXZ240GFJMyJwXBgtJ4ywprLiMbK91RZIITIj/DcoqfpmMzUgpUj
         KObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xqOZ5KjLu1SLi4bTsqS+vwUAGZg1qKAO7qI48+vtFok=;
        b=kDly6dRM4OkVCubbXckvmpGNOzpAD4I2TRkbvZYtLgOWpBhc7nz+iX3aTHbmrTHeS8
         EgFUqVrM9PGe3S6O3Wh27q9b50keyy2Jp5du0fPevoEPcIZv9hf5C4mTbjO5C4uo397e
         chHnMW65pQvSBKLZJ7hhipCNOVLKv+L85vuo6xlIGqMcaLjMKViXMqrk7+rtHfH19TtI
         Gh22U2E6aGokRNiH/a6IbSa8xP1OC9a2u89cl1YStBx1CN58UkpAfbm5R+7jkOVvgm/y
         UCHbl05Vjvs0Ohf5C3YLpAk3y+GHy+IMPWMsLTMX7s1zk1u7sP4uuQOtw2WeRhHZfL+I
         bBsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=Mb066doQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si708489vse.315.2021.08.17.02.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 02:23:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=Mb066doQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFvJo-0008HN-7G
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 05:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvJX-0008G0-KM; Tue, 17 Aug 2021 05:23:19 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:53648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvJW-0002GA-3J; Tue, 17 Aug 2021 05:23:19 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 14876C6019D;
 Tue, 17 Aug 2021 11:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xqOZ5KjLu1SLi4bTsqS+vwUAGZg1qKAO7qI48+vtFok=;
 b=Mb066doQkd8ChP2ZyOSStFlWt2CSeKFN8MISloR+SAmySf/WuitGaEL+oPQy2DSuAyGw7F
 DemhYC4wR3AMafC1Vy4u+m5Sk7SCAZUGDGvWxu+6faEHY2etrCEgJRoKmzaTKX3S09nD2t
 m78s8RAXOjHR65MSwW6FD0JxCmfAbNfU0a2wve02ZC4A+qN72rVtxxRxuyxj1oVn8OgCpl
 p2eUB7gyrhYjvctwq1MaUEEMiG3kfuRWLLyfAI+PcKitpAQsGDWc3HmD4xh3McaEsddY3L
 bekL2+Tzu9GLKsHXQJxaA0lXI7Mt0lpeoME9MCd2lCxkfXWzVNJAfUHqG9ufgQ==
Date: Tue, 17 Aug 2021 11:25:28 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 03/25] arm: Move system PPB container handling to
 armv7m
Message-ID: <20210817092528.hj4ibea7rgfd4x5q@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /JWjfmQcqYYD

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> @@ -309,13 +347,73 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, "NMI");
>  
> +    /*
> +     * We map various devices into the continer MR at their architected
s/continer/container

Reviewed-by: Luc Michel <luc@lmichel.fr>

