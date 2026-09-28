Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9196BCA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 15:44:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDX4-0006r3-Sr; Mon, 28 Sep 2026 11:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDWy-0006pY-Qz
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:44:41 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDWx-000508-Eu
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:44:40 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-67109935888so2880424d50.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 08:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790610278; cv=none;
 d=google.com; s=arc-20260327;
 b=We0BBngJvdA5qUTo2aaTnt1V6vcnFLswcD7NyJ1N0/VskoAwx2ZJYpY2tmsr6pTMYt
 qr7tAu53zGJhaTJxlOQtPKIQd4bGh3tD6phvZruEv4qTKZ5io/NvuOmag2Gs6V+hsRn9
 XlkCxNpXsGqkcu3SnDqafcG9r0+rgyPilF8dqS06NY30u+LfX7qIB9wOSRnRiPlkrVt2
 KjEyb0ZjBpLgbCe3P47rLb/8ORLS6qVfKswVa3D4f1ZDcSfw1bDWAQdtW3aZ86kFCrmO
 zwbrhaxBVu8qxSksfm9kgo8YSLar8e1ZiJXvjrJS7O8E56QZAATD4Eia9TsX0LZ+gre3
 arWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AiQtjNiunrcG/8J5YHHMQrio8j+Oayk+13IHAt1q+Uk=;
 fh=HSc+crLE73T5IFFSam4nzbjpfm5ZtS+R7PgjRkiVbuo=;
 b=IW/ozG+n3BUXh/UyQZ/QN/49IOLJoISfaEW6UiSJE5rvqE/VR1MWcwE+BR4IGxnLKy
 SaQR/QfV6Ku6zf9FMfprMDKxUPG6TF8NwRVB5zZAqq7rvhH0djVozf5VhDoE19G2dUdy
 jV1wbYi6zfJd/N0zPp+RkMcHCFWha7ik5RHncEcXD7FSaGMFQcmrTmlhfwXLagsHTf9l
 EKLkKA2tVmgaU+Nzuz+Tz0OL9M17M14mb3JqLrb5iGnvogTcf4sQvFlaA+kCpmSKByql
 VGojI2dkjYB8ttJjgq3kjOjeuntj8Uf0bZCWOGFb5CsR9pRA8mKRnBtfCZg+qHiIIGuX
 7Bwg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790610278; x=1791215078; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AiQtjNiunrcG/8J5YHHMQrio8j+Oayk+13IHAt1q+Uk=;
 b=qtXeJdDuYtaA3QJQ1X9bn21wUTVl75y5+iPHJm0z1O6m92YSP5DFK/qfk4ElGqLZRN
 cWJulo+7+IGaU/WeDaEW8/ZtdshpbnrwnmEXef93aOIgzMSPozUjQAvDvqzfDTSK4C+w
 p9c+GBUi44GesuQ87OjsjRp5e3f6bksu1qEO4ipXA+BF17VaZgkTZgcbrcGRB7GXoRi0
 6XMqTZ8sxhm+fCevijoNbC7wy4usMfrYfJNEzUom4YSFtMSo/zw72uQMwMvNkSwGQYZo
 NwxkQx/fEydfRCbO9cXScJiycCXKtpG6eb0l0PBrqHvGxXa5bJ0gufhN7GmTO6/osqX8
 r6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790610278; x=1791215078;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=AiQtjNiunrcG/8J5YHHMQrio8j+Oayk+13IHAt1q+Uk=;
 b=Ues1skXyPvaeKd9thdJ3r95Kb316jh4gQuKiPT9CqQ5ZoCKh3FSJJO2GfVwACiPdlC
 BTczhvqTo15rE9EZtR4k8CVPAfN1hvQuMDj7eWB0Z1/05sVlW+0QXPbygdDPerUsAA2B
 IfgCtv6Y5E34r2wm4GKSrGB5CMGhjGNASrWLX6v2KKd1dzDhgQl3nrCj9JSOmJ6bsfGu
 gzga5x4d1lI1tyoWvlLyInTspc1E/1CVAshS3/pLNYN77lMeardqq/t5w9SSUwUWRq76
 EnTmZHN77iMWTKzcuEGwtkJqbtKgK5OoTFBILYh3cYGjoD47+gq8YsmX99qhpbeA9gRk
 safA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw7hEJHXERxFtZRp78dSVPwSI9v/XKVXIUIrVNZ9oZqeFIEoqzz0kYFzG03Njw/kLmdfh1tD/Qgvg==@nongnu.org
X-Gm-Message-State: AFq9FYIP+xd2TZNfXBVZ41ZVNQi4cTmKbiRkMK8irNu3Gvr3bZ5l0MpG
 +b7Audk3RNTWdBdjZHwbwXKpVqa+/NY7AYgR97ecqJjxmmIo2hcktgB8I8iS6xfroLkDoQIrNLl
 GYRSkKK9VOKbEueG/nFbS6Z+3pp2oGD51tcpY00ViPw==
X-Gm-Gg: AYBFou2TEO/hQ1DVmgZ/QvPqxup/wjBjASA7tS/ZoCJj7iVZfTbp1u7B7raD5GKg+sm
 i2qHOgaWMKpTRdccwIW4k3qSDZElKXBERXDdT25mB6Dkdq4TG1qstmfNa+HeC1YuBy5JDOTz81j
 dUHlYfoPn4s+9xDKksB+3VraaW5EGhMiPH3gWPg+SsEhH3c0Q3HUgaL3FD6b/Qtj7LETWsAzvUR
 uFy+nPPIpJvHYzSWCcPkb7LiZQ8c7BFCfqVqoNyXNicIWzkfyWM8k/e5qnpFIAq2GwV8JaxrtfP
 djIQUO1CD18Kg+LT4TGOl7aqwmDn8FDEzYlL+gZCvujTEG3StNRKjU13z6iojzDuSeRxvxu1YE8
 42MuKo3nsQ4jdeWhwvZwZ5tEnd4uRqujw4pFlJaA=
X-Received: by 2002:a05:690e:120e:b0:675:4713:1f9b with SMTP id
 956f58d0204a3-67547132576mr1622260d50.39.1790610277942; Mon, 28 Sep 2026
 08:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260925215004.456336-1-richard.henderson@linaro.org>
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 16:44:25 +0100
X-Gm-Features: AclHuK_pJRuo3cwfBVjfj_yKldj4o8JhmMgdYFWUybLz2cfhYKZ6xj4igMKumGw
Message-ID: <CAFEAcA-uu-v-xnNH+vihOvccwobHbLpo+frhjm1_ZNKv4hCiZQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] target/arm: Implement FEAT_UINJ
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, 25 Sept 2026 at 22:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   - Reorganize rebuild_hflags_common*.
>     Trying to force a tail call for these was perhaps just confusing.
>     Inverting the order means that we can handle initialization once
>     in a common way, and the lifetime of some of the parameters is
>     shortened.
>   - Introduce rebuild_hflags_common_aprofile.
>     This gives us a common place for the new UINJ test in hflags.
>   - Introduce check_il_uinj.
>     This gives us a common place for the new UINJ test in translation.
>


Applied to target-arm.next, thanks.

-- PMM

