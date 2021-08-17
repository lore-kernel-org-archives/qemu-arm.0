Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp652384lfg;
        Tue, 17 Aug 2021 09:04:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc4Z9jcfXs4AASNlUf55fYdeZj6/T/eXVOgCJvp69u5QDk5XqyBVkMmCwHilL7JXg9/Hnl
X-Received: by 2002:a05:600c:3212:: with SMTP id r18mr4088728wmp.161.1629216258862;
        Tue, 17 Aug 2021 09:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629216258; cv=none;
        d=google.com; s=arc-20160816;
        b=IQfg1LqywLoynpM8NRUmPJ6wxNhcxv58XVqtvVf/T/YvgzlkZogdQgxi0AM1w842xv
         vZ+5ReuJL9XLTkJUU/MX7YlL4HV3atRilP494OE0C04c2H90a4gCsxaKqGM2xC0pPsVY
         4rEAcT3J58ZbtphkX4iVBx3Gv8o27cQzRxNhoV2vXxYwAGxAkoLJJClYSaOPUzkeebdG
         mPM6IuZ+US1YVpVWdcqCjDDL0VdN2Kx2U50E6W48B8mlSM2QxnNGl3X3WSex7TepfJpb
         s080R0A0KmsQBcNnScK6I6rqCjDnC6739wZ5ehAS9jdnw6OcPINJ864sxk3GyNVUxkTh
         IyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=az1uwNVmtchxfKYOV71uHjwQ8xcWiMYgPqq1j7MCryk=;
        b=dR8wTAaJYT/Reh/UWJM1q7r77D1UvUClyK8eSmua4p2H2dLvm17yh8aYUx5t9y32HI
         gQzp4yhzZS3Z25ktfwwRKSqEIvZ3Sc2uSPkpoCs4luyywR7OViTEjCX6I7Uw8LcKx2nt
         zf9xWORaHoqNtyH9LtDWiPJ+ExEIdSGJ9YZEVE5EUdf6NWEVEEnz/0+1Hp0Rf9JyIMOo
         HbX1JliLjwAnud2DWtXWbGXiUsqAqgELRp3lc9fY5TIs+8c1EF9n45hcXpbmz6SRj13o
         tEob55qFKk9CVuWx2HYv14CRZy/SL/2m1zcF3HZ8X+LL0RKztj3Xybv+jmATLQdw3qzb
         xjkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7btNgDV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si2621243wrm.371.2021.08.17.09.04.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 09:04:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7btNgDV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG1ZZ-0001Hp-Qz
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 12:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG1VU-00054Q-B3; Tue, 17 Aug 2021 12:00:04 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG1VS-0000m3-IN; Tue, 17 Aug 2021 12:00:04 -0400
Received: from [192.168.15.170] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4EE3921A87;
 Tue, 17 Aug 2021 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629215999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=az1uwNVmtchxfKYOV71uHjwQ8xcWiMYgPqq1j7MCryk=;
 b=7btNgDV0f8/AXDyPzIRDUEeX9RgY18r9lqHT3rYBcyRGB0nwRW3+jTmb3zzJbzKaKLY55k
 NNDtvPai5bUFQ+TNRvlugdXVwPQ4Ee1hw+s8iUlPN9ws7xCghUg2saxYXFZtJnwnv4J1lR
 1UrF7c48kRmBf1ZHOLrRSII5BeO7C8k=
Subject: Re: [PATCH for-6.2 23/25] hw/arm/stellaris: Split stellaris-gptm into
 its own file
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-24-peter.maydell@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <57a6f01e-9214-20ea-2016-3d40f7e2d029@greensocs.com>
Date: Tue, 17 Aug 2021 17:59:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-24-peter.maydell@linaro.org>
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
X-TUID: BHO9UUFaWDpi



On 8/12/21 11:33 AM, Peter Maydell wrote:
> The implementation of the Stellaris general purpose timer module
> device stellaris-gptm is currently in the same source file as the
> board model.  Split it out into its own source file in hw/timer.
> 
> Apart from the new file comment headers and the Kconfig and
> meson.build changes, this is just code movement.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

--
Damien
