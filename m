Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp981452lfq;
        Thu, 24 Feb 2022 06:41:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl73ZDBvyyhX2b+RmC4OgfQAKQiZJj2YFsEOgoHNxQj6C5Ht72Q6pDq6j7eY9Lw4VYVyMo
X-Received: by 2002:ac8:5b0d:0:b0:2dd:d863:8a70 with SMTP id m13-20020ac85b0d000000b002ddd8638a70mr2590008qtw.562.1645713710664;
        Thu, 24 Feb 2022 06:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645713710; cv=none;
        d=google.com; s=arc-20160816;
        b=sYsYcvjCtT6UICfcrUAcnXsAWbo/T/vmLXKJLKCvtBUva63EHtXDi5aRgBv2L3KydF
         jpiAx1wPd5LFCGai0F9mqoLQGQnigfpd1hyLU9o3kTL1gVG9T6MIcQSgQJeXBz73IvIo
         MCwxIEUmInnvJ4FMNUCy4E0AkLQLit/4AkW1a6u2pwKbwqo6YZjx3deCFsyGLnl1dZlE
         ifLsKdcx+bHRm9MeMiueTls4W7jkwWVmEP+MGlJUsWvi5psO6j1QDiy6yaDNiJElnBQO
         LQqzk/wd31z0Kwgf0rHTbqaZbS8cYMtzz1qxTMZ0l0Puv/1GEL92KPldWkCDiFTr5aWT
         VjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:message-id:user-agent:references
         :in-reply-to:subject:cc:to:date:mime-version:dkim-signature;
        bh=DLWwjRhS8yQiPjtMsVJtTCM9VYOmb4BHAapEKlvomqU=;
        b=nQV28urLf3TdnLZNdG9JkbuOn2oYaFW/2oMUW3/Bzbb/GtOU9gFrgy51bFsJBABJh6
         lYKPNA+HtnxCsuWkz1Sfv1SfoCXvgmI+3plUFLUE+T9db+Rw0gFE97PbC5A0h8ziu1jF
         TgmuPNSQjaH7TIEsB2gyntjJHMwUHiVT7liL01/rXnrgM6mjqrbimEjm1E46YoBJcNk6
         9ZsZiUxy5VZ6u0bCp3Dc4x+orgij4IDGVg9TWf4HaXFnkbNj6VyFY7ArZlKIvB9v8UjE
         zLDTkynXJ9tvAGeXsuxMs15TEMx2n+lLqDGBctJBeyv3rnOOh8Ns91VoGzHVqbuTN510
         oz7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@misterjones.org header.s=dkim20211231 header.b=s562ZlRQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 75si1126078qtg.771.2022.02.24.06.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Feb 2022 06:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@misterjones.org header.s=dkim20211231 header.b=s562ZlRQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNFJW-0006aN-6N
	for alex.bennee@linaro.org; Thu, 24 Feb 2022 09:41:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@misterjones.org>)
 id 1nNFIg-0006Zh-Qh; Thu, 24 Feb 2022 09:40:59 -0500
Received: from disco-boy.misterjones.org ([51.254.78.96]:33762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@misterjones.org>)
 id 1nNFIe-0005dF-G6; Thu, 24 Feb 2022 09:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=misterjones.org; s=dkim20211231; h=Content-Transfer-Encoding:Content-Type:
 Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DLWwjRhS8yQiPjtMsVJtTCM9VYOmb4BHAapEKlvomqU=; b=s562ZlRQDTsBUrW4bTO7X96pG6
 bFA9su5aBxvz4g+Ec/lqeJ+XItaqoDZM/dKZMchNESx9M7OrX/yAMjva/WKkbCfCkwfIOKm+0drqN
 SNeL+FkFcbQUIQrRWA93jhBGE9Z4AAIZKKLbIAtGij6Q3UTbxhVGqdbem3iD4TvVz5HspNlvjaFYB
 Ck1FPILTfv64k87bDogHY8s5xjItZ+1cGuvCna1G5M1+ZE0yWdpbcVMK9pAIlRXTRVlZCbcCH0YhY
 NuI/nrB6frMLC07wIS+lScIRq7EAs7EqM2Z9oja4l9PlOrw1n2bCVWfmt0BvACDeJGfw7S4oKCelP
 2kUqa5Fg==;
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@misterjones.org>)
 id 1nNFIQ-00ACsc-2q; Thu, 24 Feb 2022 14:40:42 +0000
MIME-Version: 1.0
Date: Thu, 24 Feb 2022 14:40:41 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Akihiko Odaki
 <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] target/arm: Report KVM's actual PSCI version to guest in
 dtb
In-Reply-To: <20220224134655.1207865-1-peter.maydell@linaro.org>
References: <20220224134655.1207865-1-peter.maydell@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fa8cb571a44372389e4fa131f4b1897c@misterjones.org>
X-Sender: maz@misterjones.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, akihiko.odaki@gmail.com
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=51.254.78.96; envelope-from=maz@misterjones.org;
 helo=disco-boy.misterjones.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Marc Zyngier <maz@misterjones.org>
From:  Marc Zyngier via <qemu-devel@nongnu.org>
X-TUID: wX3NJGRaXted

On 2022-02-24 13:46, Peter Maydell wrote:
> When we're using KVM, the PSCI implementation is provided by the
> kernel, but QEMU has to tell the guest about it via the device tree.
> Currently we look at the KVM_CAP_ARM_PSCI_0_2 capability to determine
> if the kernel is providing at least PSCI 0.2, but if the kernel
> provides a newer version than that we will still only tell the guest
> it has PSCI 0.2.  (This is fairly harmless; it just means the guest
> won't use newer parts of the PSCI API.)
> 
> The kernel exposes the specific PSCI version it is implementing via
> the ONE_REG API; use this to report in the dtb that the PSCI
> implementation is 1.0-compatible if appropriate.  (The device tree
> binding currently only distinguishes "pre-0.2", "0.2-compatible" and
> "1.0-compatible".)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Marc Zyngier <maz@kernel.org>

         M.
-- 
Who you jivin' with that Cosmik Debris?
