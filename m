Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E023FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 11:23:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHK3G-0000yn-KT; Mon, 27 Apr 2026 07:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHK38-0000tm-Gt
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:22:52 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHK34-00085d-N3
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:22:49 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65318dafbcbso9800250d50.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 04:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777288965; cv=none;
 d=google.com; s=arc-20240605;
 b=MI4wogkXifdhrOUxWxManY94SC2qn0ZLE6Bsv+j/4dwsb+Z+qhMUVEQXjpN6Ip7ca8
 efqeSLV0sgRIeSuyVahJPaDI0rJBBUN5biUJmQtGmP7g5zEjn2Urqot4jT9bdphuTlnl
 OTvD1GYMYvU+ECtDEdudzb4FNjFbRomkc8nPZMn+K9cspn001Z7xefskB1lkeSr8/r6T
 vTaEyIYjb6oh85JOSQsBiDBPC2OGL1DaXWSRls51Cnew/odY9Y+0X4jMEQh4+QKWbC7u
 A0dK/iDRgKSyD7n0eGY9cE5zdliUfZA+xIRBFvp1NiOcfrnUKQ03TLbmZ6NVXvujS+ef
 UU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NKjhzn06sNkk8mjBc0Rnn3sUoHjtQBDdTSKSL9EnVqw=;
 fh=8FhWzlmNFPAV4SG4EHEEz2ct3B7ihZCpMeHR+ObKU3M=;
 b=DVljCa7yC5M1e+5wUik6WLAj7ycsQ8PHqI4h4cAEuUNOk+gn1EdzBJABJnm3kuqsMf
 a1EJ5CnoIctAhmkuJr1sZLw/0S5qJu2fp9zADKUKb8mac0GSfBmhbbrnyZ6sQ8I02duE
 HUbtpttlPo+Fihi4FgVmdeHodQNRvIVcVolhr77tYXGC7x4xob71/gX5oLW5na4HH4Fo
 xYldHzmJ0x9iwGV3O626QCkWtvOMceN01VwGir2RxZgUdoIC5f7GbdShiwAmr3G3J4dd
 Sb7YnUC+CGxtm2ZYFMLu7894EFi49q5I5ErfOIVonvRz1OzilBTpi0TB2y7nrHZ80yTW
 4enw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777288965; x=1777893765; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NKjhzn06sNkk8mjBc0Rnn3sUoHjtQBDdTSKSL9EnVqw=;
 b=wPc7xA/mbxIKfseVvwDlIQfj0eEdjjFsUcLAdd6/TBNMNxkOjAjkE0JkhkSgXOMZ3Z
 y5voXXtUz6uua+1q+xaejY89YkaTvwqxuT1QEFPLJvXZwC7V0qJUOFg3CPbkXKCNS/tB
 IbR+TTi6wmPw8Jjn7XavXl2YdXCW3bRSRdN35amSsgO8Y2b+72PffO7aDxOG6WJ7gtpL
 lwLntP1bnP1E1M2qz8BDMOd7LM2HGhWYg9eHkpajNJozV3L6Qxuemh/qoYDD06IEXWne
 EyweralRiTmoxbBqWys9glqaMBTaYRxf9bxmeIiHY3OavMGBDjaFoOZ6jZ6vfq6OKZbg
 c+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777288965; x=1777893765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKjhzn06sNkk8mjBc0Rnn3sUoHjtQBDdTSKSL9EnVqw=;
 b=shfKZG2TyXyvswfPODCpCi3KRROmry7NIRg9I800ZzMT05GM9TNI+kflUhQH/FoJLo
 Huj0o0MQ4kXwrZ8mDd3aLVIIq1X0uK1wnwtS22NM7ORCf9HgTVcCR7BVjdcteVY2r9CH
 0Acr82EmlihzMo4mWFKtLAix2DLFlXbF4LXMMErF2h67Bh0IoMijtp5aSsOQC+JJRUX+
 aN8VbLFVuM3jJqEW+ifIqc+VPEvXbr7yli0iQRjS58GTX5vIA9IASzeVGZECigerkaJv
 +d0oM4kBPrAlpqBu4GTkE6nJ2ibpRCR8C4vy3n08aaaBiHzY3toRLq334JWW+cO4rs1C
 Bqfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ddWTt1iuOFilyHd+jxKpMdngfhMjm98+CDwJHwIGus4/ZFjDAIXKRaAWybPg14JOrG7fdRnlrhw==@nongnu.org
X-Gm-Message-State: AOJu0YzZfjoge0RROCmN/tJ02ev6zPrW4DZu/ABN/823HeDykbfQkiBI
 DCQTnq2LzgaInUIlOKwg0zbzasyMKRdz22+/w5aczVPHkJxPa7kXckigF35/Ii+mqrT/R/W4mC2
 2AaGGGS3tHmNXigavyylhbrIvoOh4amezh3NAWx/edo/0l/t9yuS9fHc=
X-Gm-Gg: AeBDiesBMjqG9mJY4tHNdTJ1VX5GBZtX5YgbHXkoj8VrlQcpM+eLJXa4RepjIBAvPyI
 ZDu5t7cxxMAy2IuOV753vUet/Cqj0S4hEaFp+fOxSqx06TKWBDio3UQR9qCtBEFfKsI9nE8nifu
 CdkfRp3nZoyZyAeW4CpqI4uFBnvKQhJmxNTXodco9fB0Q0UBm08X9loqRmQMPrAsfOAYOxfcxt3
 /wgcM6NjoQnmiEZoAM+jg2xgKS1IVhokTJyHJE+sSNqxk3UOUs4VXtSBTD435Be5YQ8qNHqup5s
 G+zitQraoNtZeHddmUvf+0CDFW0bFbPhuBN5VCUjlI0OUi8E4hh8TL7KKs9FyaZ9mQcDXWauuZ3
 niA==
X-Received: by 2002:a05:690e:4192:b0:652:c12f:18bc with SMTP id
 956f58d0204a3-65310a3a628mr32618634d50.43.1777288965320; Mon, 27 Apr 2026
 04:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260422-arm-v1-1-106a9a9e22dd@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260422-arm-v1-1-106a9a9e22dd@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 12:22:34 +0100
X-Gm-Features: AQROBzADG4QwKVW78l2Y-krxUGH0JZTq2v5PrDXl03f_kk4zSO8vVSythrH3RFc
Message-ID: <CAFEAcA99QzC6D=H8jet0aLrp1BByhOq9x6T8bUJ7SY6qTvoWcw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/kvm: Mark host feature cache valid last
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Wed, 22 Apr 2026 at 13:13, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> kvm_arm_set_cpu_features_from_host() treats dtb_compatible as the host
> feature cache valid bit, but kvm_arm_get_host_cpu_features() set it
> before later register reads could fail.
>
> Set target and dtb_compatible only after the feature data is complete.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
> This fixes a semantic issue I found while writing the next version of [1].
> I am not aware of any case where it manifests as a real bug.

We're not currently consistent since we have one check that might
return false from kvm_arm_get_host_cpu_features() before we set
dtb_compatible and then several after. But I think that the
right thing to do is to set dtb_compatible right at the top,
and adjust kvm_arm_set_cpu_features_from_host() to copy
cpu->host_cpu_probe_failed in its "populate from cache" codepath.

That is, if we have an SMP config and we can't get the host
CPU features the first time we call kvm_arm_get_host_cpu_features()
there's no point in repeating that attempt over and over for
every other CPU. We should instead treat the "host probe failed"
indication as part of our cached data and copy that.

On the other hand, if we do that then the practical upshot will
be that we print the error message once per CPU rather than
just once...

thanks
-- PMM

