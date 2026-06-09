Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CF8CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 08:58:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsIE-0001J4-FT; Tue, 09 Jun 2026 04:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsID-0001Io-Sf
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 04:58:41 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsIA-0005jW-Uy
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 04:58:40 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66062a414fcso5813996d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 01:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995517; cv=none;
 d=google.com; s=arc-20240605;
 b=GbzDvu14GKlY8VJW1iCF2HDNQafL+d7vCCkKquFnp2eCk9AEK/+7aGY63zUMP5YptE
 hCmnTp4ejxBkTM1w0nO89qO2Zr2kmFcNHynyNYrmZUNBLf16B2EkVQTypIsNnIKGz58F
 m4zJ7Hw66QHuuOMvsB/Fh1ZqKe6UJemRC+T4xMCd7JwBLzY++qKitz2j83rzYdQZoVWZ
 pSK66lAlConqeajXSdTn92g0ZAGTcbxnCd8uuIViXUXs7TIKyreOcVmrUMJQVNfyzj4Z
 TcmzlP+WQLEGZcwHGfM/c6XdIsh3SXD0EZzPfeBU46ITcTPn5hhZZp6IyV5OrxzociwD
 o82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 fh=57ri5pD60dkwwEbXJPw2+rdAldqOs41ePCI2fF6bxSQ=;
 b=Yn6c7abynD/KeRhhiWE2M2L6QTlsOzt8gfLb+wiFCpCFEIqxYubi+cwM+fkpxs65kH
 55bj+8QD2cq7a6wR/TZvRxHDAdGPAAd3FZFYjKeA7z98xWwQaiivaOMcChtd90hoMiMI
 4Er7JYcWWgXDrDZKA3E1a681ZiCdqhXfYxhdGiF5u9frl5AY/n26Hw/frvULLTazn+jG
 lI7TLgEjaJki/gZ7G7TuQg8xgZpmkX32L6umrP0y52q1ZyuyVeulmRyo5TxsEYt7Qb1U
 g6rQZ6h5GECu94y/0AEgv2ytGPa3FAyvgEQropvuyZsvAq7/+MCFPvpZ0n9Wkfh39Kce
 2xCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780995517; x=1781600317; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=OB/9kvzc3JdVAWuFzDO61ES9i4ektEYcqQB1YLcVT81EXbVs6vTf5q0mxtZc6lHkk0
 jLfFovCvj6thFHDJdGf+Eh/emJHF72SjWX9U5D56y7iK0oZ23KFAtq0aL42cmJYAoyIh
 MNohCZ8v4yqYCERgcDhIp/KLos1bjlgylwpvlXtQ6RAM60SWPrYZdTodkzd3y7bsmrbs
 slvOAB1vYy3i6PW6NwD4v6zXdMLlOhLaKX7PcgqRVHYfdPWB12g4WEEHG956zlIP+Aac
 AkNFz/h3EPZTQ8SiP7G0filjLcYORl+FXRvc3dWSEmlN/XoCDHY6JPGlvYs5vadUAwWY
 FgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780995517; x=1781600317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=j/JWQq2E/47gxEGn4XT5eVsgaGdeGPRgnKER91hHfDZRE34LmuI8yOUklh0ldL2T1Q
 l64I/srmKy5ApJJKJevaoO16fH2NaiFc9Rwx1wuyiAX2jwpQOwTT7+j5ykdOMWeD6HTR
 VSiEIoeAhd2I3Jn9G5nD9FvEA2B1Vlxop+5EzUm90aCKDMBgrfSrSPBsFTBh27hMHOD4
 LRVnU3bjj8m9j/BQ9nhpMZCgqhOEy+DEtYe/nP5W5uTlgz8CH1AgPtmGPeazoQD3qAyA
 jEAyWm9Lq4R68HAp2y2OJ9nnSUbQH2oaN/1A2flGg0zRTjYIWvcUcULp2dCO7X5M9ED0
 D7dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BxQCVnPG3bGqaBvVDw1U3K68sLObuXQgviV3497Lrp3VDosdA480uBExRYXxTqy0cAQhUeD2sZA==@nongnu.org
X-Gm-Message-State: AOJu0YydP8srs5v+bKWtp6X6ueqzzrVluJuObI77ybhpZf6Kf/i2x+D4
 FeuQ41o2ZVG5asyHpLlnUQKiKsyB1XaPAoaCW/Ug1dwbAJcfTbcuxc62pJGJ/8Pg3e5+jG10nwy
 +A9NgZvbkEEPz1u4W9b9V5Q8rLt7cdfjHqDrfmv2lLA==
X-Gm-Gg: Acq92OFxnvBxH38+6nciGsAFyyaA17AlVajOvejh8m5v/HsReHd1yLssY3UCVRlNp0j
 I5AYz2Fwc6JzzVT0fqxdR5l/tCR5qHbWnBsE06Af/Muh5JH+r1K7CjXT5Gk8eSF7d7lLEchxosq
 u1dbwSTkhTcouIjas0kISJb/uvjRmfRCM99bO0cjQyR2rNzxDK/hneM0qBrKKmCxjzBuymDD3E4
 i6cgr2KjnjqTVLMMPSRowey7UUhgjQS4MQRBhtHLbZKsMxc8aSOeC87oNpzMArbPFWp+J29GAoF
 /08+IHNCI+dJP0+COVKLEB61GSprNmSDf+7YkhY/hqpZEhHlOKlSdNX2JyJ5GkXt52xJfwZzgl6
 RFA==
X-Received: by 2002:a53:ac89:0:b0:64c:b81d:2cb7 with SMTP id
 956f58d0204a3-66106f42dfbmr13753643d50.39.1780995517549; Tue, 09 Jun 2026
 01:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-17-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 09:58:25 +0100
X-Gm-Features: AVVi8CeKdZb0KOtwk_A8HvaMvOlQieBmiSHTNTY5q6tmQcCKj7K-krES9-JlxNM
Message-ID: <CAFEAcA_+Dhnco1c_-soOnkzuBppW5wzSSn4w_S9n9o+hBURcBg@mail.gmail.com>
Subject: Re: [PATCH v9 16/45] target/arm: Implement FCVTN, FCVTN2 (32- to
 8-bit fp) for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

