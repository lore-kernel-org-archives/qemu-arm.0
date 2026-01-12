Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B726CC9EC93
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:19:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfIlc-0003VY-JF; Mon, 12 Jan 2026 09:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfIjm-0001Rp-88
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:17:44 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfIjk-0004C1-Jc
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:17:41 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-790992528f6so55727767b3.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768227459; x=1768832259; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=reLixoQNXSvOf3kpvkUs9YMlVO2PhgqAdnopCWLR6ws=;
 b=CPnnJb5qd+c4gipykLL4CXsDm/Cbhp+xdAlEDdBaQeKBEg5xQLdLYfUCLk/uKFaaTX
 9d2Av8yAwVFAJVdBz5kognnOKV00RAGOG9Mn1AMGNSDTnX/EM8o7g9LVKUnZ3FkzoaWU
 eldpAbNR4Gnu9QyoC2/9fZ6LgKxmW24punzFMBg7a2ZUsKk74S0gaLeQxd+nPBXr0U4C
 xyjlJlOXxMTFZZ0mcFjIcXQnSxxT5+rP/KSKjHHEqC6fss8+Wq9+9hr4Ait4miPSkOdK
 5moksVD2ubGHgTrtmNT2dKc3dGFdD+mTub0BAKHc+ij5z1TCEpaIb+quX4IelhWEeZFI
 jFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768227459; x=1768832259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reLixoQNXSvOf3kpvkUs9YMlVO2PhgqAdnopCWLR6ws=;
 b=oSjLaL1j6lgSDnsMijX+EidrZdqiSAm1DOmR4eH8pfoUpDyY4geVEyD2qmRXvcxlqM
 n1TQ7edhX1yjz4XZOzkP91zTLyfP0GyZDs/J77D+MScIjZUqV7cTXs6fE0dIjnEHSqtB
 tnqnvlsQaL7rwe2os7mXVqNB2Kkd2DJxo+UBw/i3S3hDQfmWDvxjINyfTEEqSQ8hE8/v
 Hmrs9oHi44uISeP0N1+lCZUvdz+sNFUDR1S9xqma5zMKPexUzRDJ8hfOOK8Rq6WYFU1D
 +EGQBwF90/BZ5SVts1rlAtpmSmlNioN7qosI2hFHxi0Of8kYgE+xia4CBi7Ed86QCUFB
 iviA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzyJIaCU6eBUF7ro4rcasJSXcwXBxI+IQiWh/hGrC+3fQTcHsgUpuTniFFA0cnM50SNQ35VpLO6Q==@nongnu.org
X-Gm-Message-State: AOJu0YyzM8K7N8rQrvQW+odcXZkb2QlOAcanL+edhFF1bszD1ROkSU63
 KRNvk4OmdbrxXDPqedmo0gTtyIBGP9kCwMNNcOJ6HgURtZRVAS1ZWsxTm6oFAKGEOlevZwB8pTG
 abWMdBd5Cs2q6ESWHgv45aZzJ8v37T1h8u31USyqM0g==
X-Gm-Gg: AY/fxX4CJN/YVgmlTOpS/BB4NhhV6g6Cv4UuKtyF1xhRdeNR3WVu4bvVsD6oQ11HVXP
 JBxEzN1JC9vx2Aj7oXjPtRRAFRcZ2LupQn/4xNL+muFu1K8kmMiI30ftEr6PMRiOKuZ1lzuzajW
 tBIELF1eKACO+sF1/10+t9s7OgmlZXB7ikyS1WMi0HXYaTCvtLjLFZKi8U6lIShHeJwcbK5W9SV
 Pzz5xMunhWRVM4tKhbwAUo2RmOlVAOXeCz7ep160177ErXAu+dVejNmuulIr1yE0NfWdu2FFVJ9
 zK3K5st4O4N+aWqVjfwku4E=
X-Google-Smtp-Source: AGHT+IFXDsh4Jixt7X1mrgNx6BZxIY2voGrEOpAza/cVtfNjYkfnrin8gntvGbL8vHT5rC98blRDYsTo+EZxqklQUgU=
X-Received: by 2002:a05:690e:1654:b0:646:5127:b539 with SMTP id
 956f58d0204a3-64716c6982bmr12143838d50.73.1768227459331; Mon, 12 Jan 2026
 06:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20251217-cmsdk-uart-disabled-warning2-v1-1-847de48840bc@trainwit.ch>
In-Reply-To: <20251217-cmsdk-uart-disabled-warning2-v1-1-847de48840bc@trainwit.ch>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jan 2026 14:17:26 +0000
X-Gm-Features: AZwV_Qj1Y_pC9Vb4mWd2EUME0C_0PEHT2bk7a5F82YcpaIcr_Dlf4zzxGtNYgWI
Message-ID: <CAFEAcA-QdF3n805jDi4aJUbGu-nvqYrra4sz2XiSUEf21NwQEQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char/cmsdk-apb-uart.c: log guest_errors for r/w to
 disabled uart
To: julia <midnight@trainwit.ch>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 17 Dec 2025 at 07:10, julia <midnight@trainwit.ch> wrote:
>
> I don't want to admit how many hours I spent trying to figure out why
> nothing was being printed (as the enable-ing code hadn't yet run,
> even thought it existed).
>
> Signed-off-by: julia <midnight@trainwit.ch>

Applied to target-arm.next, thanks.

-- PMM

