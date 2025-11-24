Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B6FCFD318
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 17:02:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNZxc-00049T-NB; Mon, 24 Nov 2025 12:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNZw5-0003PA-SK
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 12:01:11 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNZw2-0002fo-Gj
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 12:01:08 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-78a8bed470bso26199857b3.0
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 09:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764003665; x=1764608465; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jDye0m6Qzw37hhJGLyIViZrhdQfvJhhiOUM2fe+/k4o=;
 b=uTnd5QMzQDvWmyBsedgtHYbAGYkN/e61qMPFiIhR+VnBldyyCFzoFayMRX8IGPYbZq
 lbAZXe9n42kkuZFpPLb74LzCoMmXPrH/nZerKz8QRYbHcEwEV8xgxg15vZPGhBTgn3LX
 dYHi6xdGFALFN2Azd1/nHoMivWUCciVhXca2upibAwRkjYWEHTIKJGH4uVSo9S77yg6d
 wv6qZRmiF1sTby2ujZDewidBA4Ous8e5WB6g6yOIGoEeCF1sjTXevEmzT61UrFfWfJ/F
 TBlZfaWBiVAQt8Tc0Zm+Z58KX/eslVW7Z+reuCjcufkfJfCT4n2pZpB7TDp6m4o83w0k
 PZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764003665; x=1764608465;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDye0m6Qzw37hhJGLyIViZrhdQfvJhhiOUM2fe+/k4o=;
 b=HarIwwtd5bWKshZ+ksUy00dhRd1O8v1g0uRR27BxbfBchPnmuzxeMMV8RVujA8LNaq
 npKQVAsVKwkIsKk0zH1KfRpAyTAohTYFqDJjO9IDkI70tdJYEaeamUaaaoDRknnZd9v7
 3vRz8KrMwqkQySNfPX2LZLmNA1IRxsvl7ndCv28cDCpC03rFSDqyQnD5C8KL7MskxAio
 ZoIw8/wNHAiuCVhXIqOD4BdXb71dyrJ2JFx+B9Kz2sLHERAeMXlpqTmUAEyZLKX5OWSV
 WxvxRPFhgw7BEErxHohG7mfORqKGO5h8nC2R7HoIyS87hIQIaXA0Sfeolqgq3KY2SdQ7
 Qivg==
X-Gm-Message-State: AOJu0YyElSmP8LodRp4OX15jPaotHfGuMT3FDCd+JsP+KPtRBmQa5J9u
 bjaCTAqB8Js39ty/l3HsU4DX62GO8PVgxGjx34Au/yqjzrkMcHiS9H+7sAP5+TSM/uzCDjAxCZs
 P0slGcXLNXVneRzSvjwnqjghVPzDF7mU2d+mlXFumhg==
X-Gm-Gg: ASbGncuOnacdTeSkUSJ9OvFiX3oCJcaZPGpbg11AqT6ZoCRSct5fTTppRc00PI7kL7f
 5q0BjBigubZDx8d/MvyUMQR9tsyduzH7RDWzEy+XmBiebrPsYsCXZ0qNpimp2ZI7gTRV/ZXqHLf
 i/0h4RYdISviEAloXKJW8S7FrysJaTP1LC6eaqpKRZms4jUrBT+uQpTnfYSQ/vGdYb862lDtOZ3
 cRvndvQER5pKp+c6RlNdpuin9j7aneIZFLSIc8LKubtYFTvz9nvbEhIuHrWipe/t2ys5fT6
X-Google-Smtp-Source: AGHT+IGM0x3utzQ0vrlbkMXn+5/5YAtoOpt2Im3kzH3pFHr1BKoSulD4sr5Hoi5Li8X0kTFnwWQqQs7yyFJJxsb80VA=
X-Received: by 2002:a05:690c:dc6:b0:786:62bb:f6f5 with SMTP id
 00721157ae682-78a8b496cadmr204303437b3.17.1764003663411; Mon, 24 Nov 2025
 09:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20251119134414.2892640-1-cohuck@redhat.com>
In-Reply-To: <20251119134414.2892640-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Nov 2025 17:00:52 +0000
X-Gm-Features: AWmQ_bnWyvrMLAhUYFB-wo_YaV_sm7RBdPDudiG3K687B1RuzP_ckKApIYFUNaA
Message-ID: <CAFEAcA8r7_6fbEFtkEL4vi-wqABewcPU3P73RWh08RRQnQ5Baw@mail.gmail.com>
Subject: Re: [PATCH for-11.0] arm: add DCZID_EL0 to idregs array
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Wed, 19 Nov 2025 at 13:44, Cornelia Huck <cohuck@redhat.com> wrote:
>
> This requires a bit of care, since we still have to handle the EL
> specific part (DCZID_EL0.DZP). Callers can set/access dcz_blocksize
> via a wrapper working on DCZID_EL.BS.
>
> KVM currently does not support DCZID_EL0 via ONE_REG, and actually
> does not need to work with it, so provide a dummy value for now.

That seems like an odd (unintended?) omission -- is it worth
adding? (We would need to handle older kernels that don't
expose it anyway, of course.)

thanks
-- PMM

