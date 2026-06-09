Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA7ECD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:23:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzEl-0003mJ-EB; Tue, 09 Jun 2026 12:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzEh-0003gc-9B
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:23:31 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzEf-0004X7-Ke
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:23:31 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-68bac6e24fdso7765919a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022208; cv=none;
 d=google.com; s=arc-20240605;
 b=jdVMxRrrl/jzSvnmfO8+Q3/Q7eag8V9ssm/gm7HdWHK8jh5fJhuON2q3/6UYQzFytQ
 v3XqplFAKlm1SRRrbElKpMDxWlpfyhe+O/cQLalVrdIQdZyjXyqov2/ZTCYXNK16efh1
 xkhGRAEdfQOzJcTxLW0f2sieDz03S5rCzDZAaZMlC3ndSqV9F4r0UUERhIGu4zHX1xhJ
 qOiEer0bUOEsZZyslB7uOlvQ9BH02ipVw+ujiP7YWxNoMqftZZ+iDYHqmfatLA/0drhs
 Ourl1WjGOeGiyNcoaPR09UTIsY/j0DIsVLx8h1Y7VxYDDZGxMIM+dwpJMyRkGdicQ6OC
 +/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SxiYm5raegKEbr4MLYobMfLonVsnFECSi8isGZ2K6E8=;
 fh=yMUWaUQCnI1/3H4HEUUFg2c3Q5JqyKJun9Z52VYMClc=;
 b=bRPOL7/v3T4sbNMWsp3AcPNelmHtdvxjpT3Q6t1JKcQEH7JMdmcqZ4yR4KW1xt6rsy
 fu4w4/KSH4lhVXt76SWj1HZ9JE3LFHgIEXfgwbimhxTncj3RPFnqttXsDEErm5xjjjIc
 6mi7iAvnS0DKP9YguqiCUSKCOZfej9PicSsKHyHZu8ZMPP2lP1IAhg1mSu3Bs5daJfG4
 q8pIlQF9UOj/fjOV+hOqqQ+GBjU3nU5DLD1T84Berq0/wvjuYTjE1sSmCZR7DWuGOs0Z
 uxJB/5LU0SxLV0//DMZjMFvS9X7zUdkLVM1doa5x8rFK0VsgHPhhUAffCTUpVwtZxBsQ
 9s+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781022208; x=1781627008; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SxiYm5raegKEbr4MLYobMfLonVsnFECSi8isGZ2K6E8=;
 b=KDhn1p/90F6PdOGBWBPhqTlvkuMO5I3EJsRQnmqiFxyFktbKfVgwl4EJIiI/QBwYiM
 Uj4lGumKa+SbFFGoBF2hQVM98kuhqSR/DsWR/eUnpud36pcNvNmqlnhHe/C/0ho5jJPE
 RtzOd8iE/WA5FVRNDO/O4eFjCtcFYDuz+EuYoqfX40JJpAJwkP1t9/+ZUJZEEgRxHC9p
 3atlgP2pB23Z8xeJIzDsWDo4w3vuvt4OYhIMrBm68JGWKivx89hgTAsylobhoC7MfKic
 QR9bhjEzvHx7O4OffXHP7nFXYwXSeWiTMMelGx/BrnzpQ1u/93182BaZIaeGpe0YipHi
 nQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022208; x=1781627008;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxiYm5raegKEbr4MLYobMfLonVsnFECSi8isGZ2K6E8=;
 b=IAVX6lQuFn7/eWpTR/rHXHqZWX34ghbO2oms6kWinrDZs59oqNXfTOsDCu+HqWjMhZ
 zibOI7rDbtjndqhun/TWDET2npLML2AjpYbGCc7mVjp3CKayXnnZZOTFnybwwiWZxAV5
 0F3/CJBHc5/Fs7GScVIz8sxHxFXNzb5nMazAttg+eLgZ8HuWMIP2WCU2Je8w9qzIQxAu
 g89L7cp7gsXCVVNXCA4ecuPot8R8cTj9caUvf8cuuhRh+OuTTOIgkexNOpLUmbDai5c7
 mPk0RAtsuYK9pM+nRg4CTF4PB8ItGd14e1mxrw51sQCy1AFAIUh4G9HCrFzdjUkYQCTx
 FNMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8x182i6nuPGrMk3cKUqqzoDMuRN75nrwY+VH27AZhfu31zfpvgiiUZ2HdQhV0+/aVmQW72LmMXYQ==@nongnu.org
X-Gm-Message-State: AOJu0YzmGDE+2TLKF+8twqM6P/9LdiM+4Cz6r80F4ZuQ8RgJgiQ5m9sj
 JFuk+goj5Ecvi+/FYR4OBbCK/uMYSecO7ZPFun6qzEGxlH8Jk93kdFZx3aX8rgFWqLhpXK0JfhD
 oKgI/Pr9TyMXQqsfUdNzwZ1z0H0ToZQZ9dw6kNV9ahboij2zuFuWr
X-Gm-Gg: Acq92OFlCJPMVe/f52TYxYQ+MapMaHiC4lDwHSIJDYeQsthCE+p79ZW5OKOOg84KlFq
 eBB1+JfVR1/7a64op0oaR5ydepK5Nd4sAlgsVeILh2+kZhRUW18wzuKsX24CrYxRkMiRUsdzCtf
 BtZQwV83i7WPneP+OU8FV/CM7VxetHS9/6stoQ+aAOMwQNIjZeZpv/K0NEJKOxe8pmzJnUY49z2
 J16KqF44su+4RwttQbjW/RQNcbT47+D0XPYjbqsP6aUtv7G/TITznIuDQZX6y7DD+Ul1DmH41Tq
 E15H9OZWPE/DrtpjrP7Q/USKUgwQ+Wg7ZyckzXJcAJ34iKUjnkcDpTViBfiayahQEY4Lj+0nwcD
 OOg==
X-Received: by 2002:a17:907:986:b0:bee:c13f:7ec0 with SMTP id
 a640c23a62f3a-bf370180feamr1028239766b.8.1781022207629; Tue, 09 Jun 2026
 09:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-44-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:23:13 +0100
X-Gm-Features: AVVi8Ceae9djzM7oAORLhHlHX6Qhio10ibmiMJa21M7KKWTshm0u9Ct5Da9nLNg
Message-ID: <CAFEAcA_i3mPpv32u7T2YxUiZTU8sjN+pPp4BTomHA02PNvu-HA@mail.gmail.com>
Subject: Re: [PATCH v9 43/45] target/arm: Implement FMMLA (FP8 to FP16) for
 AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 +++++
>  target/arm/tcg/helper-fp8-defs.h |  1 +
>  target/arm/tcg/fp8_helper.c      | 25 +++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   |  1 +
>  target/arm/tcg/a64.decode        |  1 +
>  5 files changed, 33 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

