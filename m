Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4EDC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:57:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDqr-0008BI-0n; Wed, 30 Jul 2025 16:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDQt-0002U1-NX
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:29:51 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDQr-0004eR-OE
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:29:51 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7698e914cd2so277924b3a.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907388; x=1754512188; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eGHDQF25joYQG8LGG7iGSytW5LjvWIxXMVxdggBFcI8=;
 b=BOHwymgt57Pidcr4oyVq+KdKxVND73UiD+thy1THQuCaq4DD1Dw1P45DQZS38Ani1l
 yHFMEZCNgML9uMTWTLDi+i87IBEpjps2YyEvtWvO1XFxcsn2QEiKUNCKiE/WDViJ27m1
 GCsbaWUz85mHlGYLCcccpr3wx2yuq2CmoY72ivtgM+kXG93zRSd65sUbwdbJFfIjGW0F
 n+BaJaXuXM8Qu4tl8eDTRLbw31QTJ6wI+j6h5+IqXoilKnq/2zKFAM1/AyocZUI8W3ma
 v4Xp43jriLx9fsmgIbAilNYY8Njv76QxJ+FH35Eb2tlp+KTAckMKtM2C2XLA3PZ1Ag7G
 F6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907388; x=1754512188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eGHDQF25joYQG8LGG7iGSytW5LjvWIxXMVxdggBFcI8=;
 b=cfxyMyQkfIt6zIiJXM4LScLfkfnIO2BnSMHXFe6P6QqAqphBF7hz1NhFvcvFLoii5O
 QwkUBEqNKypCAD6Ti7Q8d4py4kefmCWmZitHcdr8sN5gN20eHEaW89AtHxxZjNiBC2ZM
 QR6dUaluh4b7vMHQvOmRMD8+WTOKbblFBKalAPMOip1DKtDZcwHtFdKDffph61GfxGJ/
 O2tGNsVTHUQpMKarnQCJ0x3MLqrgirxJu8S/uts1FAKC8x5PNTZIwnyeZjSrpzV+kMuh
 2JcTZIwwlUd2lttH1SXUjb8RNVpGOKba8+fD0DxauO+36Iq32It4UCkfsNRJeDZ7Kuml
 ZWOQ==
X-Gm-Message-State: AOJu0YwJBxASbDpYrkB3KReLEkXquQjXnm1DF8lkr74VQ2UnUV3sq52J
 wRMdr5OEBa0oyBpuSkRXUxxR5/fLx0FplIdF3J3mjsErUxXcHcjgBWoWS6OLhEYlTp2ka/rYBE7
 Vmute
X-Gm-Gg: ASbGncs0GtI0tDqq/jkxR0YK1NGMU5EB+GfvOzI5mTbBCLetFlm9DUcERHxHCQUkNTh
 8lo2Uka5W8T2ROLqdghk8Utm04sI1iqfgBXG3uOfrkdp1cPJxo45Y4Q1ltYYpmzWL+fAY8Ki60t
 haal5tXQl7RKiH4Ygy3UqgJ6zECqyB9tyLGqfcTrRiYHOMg48b9nzIFQsqYowHsUXruZR/9Zbra
 /vEZbM6hxCISX8EFzMXJl7abZUrBBKIj3ubMLnBxafG6TlUHL5ooBJo2i+g2GrEMduBJlMPyoKu
 heU9uRtXsT57Q5Jj4Cn6d74EXHov0QForVu4FBWMzNk3HdnrvoGHJvnKEPsKEtEaF9HUYkAO6ug
 53hUd6EMjMMn5xm3DHxL9zKTpqOPhiS9DH0w=
X-Google-Smtp-Source: AGHT+IFECb6SqwznjplMi3I4Y/JdJx75oaIx/kNehFBisdyeY/kXIk4zeBvR9TlHr01QSVt82o6Vrg==
X-Received: by 2002:a05:6a20:a109:b0:224:c067:66f8 with SMTP id
 adf61e73a8af0-23dc0ec1f9emr7996516637.37.1753907388155; 
 Wed, 30 Jul 2025 13:29:48 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76ba34f5078sm1440655b3a.53.2025.07.30.13.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:29:47 -0700 (PDT)
Message-ID: <87c3ed32-21d1-41e4-b35d-038916d3b900@linaro.org>
Date: Wed, 30 Jul 2025 13:29:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/82] target/arm: Introduce get_phys_addr_for_at
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-5-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Rename get_phys_addr_with_space_nogpc for its only
> caller, do_ats_write.  Drop the MemOp memop argument
> as it doesn't make sense in the new context.  Replace
> the access_type parameter with prot_check.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h     | 18 +++++++-----------
>   target/arm/ptw.c           | 21 ++++++++++++++-------
>   target/arm/tcg/cpregs-at.c | 11 ++---------
>   3 files changed, 23 insertions(+), 27 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


