Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449E606A32E
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tW56Bil6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpTi-0007Ll-Au; Mon, 02 Nov 2026 05:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpTf-0007Kv-DM
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:41:23 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpTd-0007zD-F1
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:41:22 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b056d58f2aso24959747b3.2
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:41:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793616080; cv=none;
 d=google.com; s=arc-20260327;
 b=MXiSp5NnGLUmaVQowFQJEDc0mbvdaNQf7jlOMl7aJHEnNm0sVk+WtrfCYjP4ryGo3Q
 vqgHLuqVg7NSHpHUmrF2lvjrCOPRH3K7j6W6wWIewXTX94BULPshk+xBjePAGLKyggph
 8rIV4ZCwrwZqh3FPnvhC1QFKf6t+c4YTOYZf+Jd0yDrJRUtLL/UQAcHJK2xVLk2YlJg+
 aIb76y3xxR+p50M/ayQFE3HHU2cBtXZENW6J+y7ftoViL5tAkylbR2BjRtR/ygJYYnge
 g6NBDXkZ5iDBQF0P23seFVDFiQ7YzrmhPWz8FpLYWvUU2OKobljJJmR1qFQcgCI9Qqbg
 nKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hAcwBoMkWZWMjtmooAgTPW2AvYPjmitE50OIa5OE2r8=;
 fh=9mJYA8fIWiCYXJAAo1ln12k0+sb+8j6zMjqd+J0EmsE=;
 b=qQfbr+zOk5l4eq3TyDOY5iWeMuCBBmVZLdKV3v1Ef4WvzW2V95muHY3Fli664zw63f
 vIMnOWXcCAlko/HMIznipYXakCeeidbEwKpqrAb2wOc0iz17Roz2MkSMFuvEQb+1/JPN
 82lUYTkNJZfZGk4aaz8ysSoL4IYmV1Ihq+/OIbfh1X9CmWnug8HruphYuWgy36inoW0e
 52LzJpunNY3AXw285/UdLU4q7tOctYZj9U10c/1v4B++4oktzvSbsdBzGpCKrAzvnEOV
 1l4xGSC4K+vXulaQgTZtqTT48VeCQ3rHGvCaeDzPGY9r1yLa9irHiMQYJ1YchhPYh3Ok
 hw+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793616080; x=1794220880; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hAcwBoMkWZWMjtmooAgTPW2AvYPjmitE50OIa5OE2r8=;
 b=tW56Bil6B39bW8SkXuJN5REw7R4t1FyUtXGHgBQVnOBdt50efJNDhs0FswHEHyqoh0
 /MXgue+2t3ANodoWw58+NDVurUGplEhf4eXzgHSntFaaP/tn9LTM4NymiqeLTCZMrrQp
 W0VtACfFCotpqIChmaW1Ep7QA7ShE+M659o4ZuFDrZbcH3sEfceJEGoO3Y/XkfC+UF0H
 TLStF1JI7gexOsn5N23LCTWnCHtVDpBYRM7BlW4epd/ZJ58dEcC1sFdkBd+RTpMyD92y
 Z5l77dBZWHmvkUHSBwuX85Kzk3QHpDuHVT5LbgFiOEnW1duOURjR1ipzDmeZ88K13Veg
 vCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793616080; x=1794220880;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hAcwBoMkWZWMjtmooAgTPW2AvYPjmitE50OIa5OE2r8=;
 b=noCmUiyweOS5Mf7C4IMKcWEfSTqnIF1o9CSETFE5P9aVfSUuj1eBSlRKNTjFOEwqsj
 q1QInIz7EMFWz5CgHgBkQ/7jkeI3spHPmuvM+4llLUrQDtjIqVSYGbavLnfFDmNsrLfw
 T8thMrZnXAa+2Yu8z6SiC5/cRYGx1+CBFCinxH1dYuYW4DKElSgefSyrBNpxWmEOv5XU
 p8qsGjQPRXv9pG5qYJgGJ0pkwEMgmjVuByUuk6ueQlG16sGzVt/gVH/64Of7fOhxSPRn
 pRNRIKW0R4A5NCfPFfbMU58GlrZrrwLXWnwMJemU9nD4WmOB126VAfMb/DUXDQQobgR9
 S2Sw==
X-Forwarded-Encrypted: i=1;
 AKwUvBypgQzlurtrDnRK0aD8quBsnjhCcBpljfAwrTktcSa6Vhr5jkF2GwIg4Cc5XHnCk91Vduewu7A02A==@nongnu.org
X-Gm-Message-State: APuU4Z+Ka1f84KPCs/21aOoEmJMxQ1Nc71VvfrseZIg3WcdELZ+Zcxht
 1bJtUcHDzW5woQq8zTmbuNt/1Fh6DHzJYgS4sp8elk/EU9xmSPF2ydj3WhNp6kx1Bv76BaJHXGV
 ZgV43RhTs2JBVpEukobI7ExthQbaCZ6nsBT9iaByVrg==
X-Gm-Gg: AYBFou2/02DK6vfaFiD0qGzVUl523V1hu4eicL1cNfDvTEPJSyO2xSvxJJCexl1igHl
 SptDZsPnvrSNLes9HO/HFsJkKE77DB+ORRXMnhxAjouJyDvljE5wloIfx4F401ZxUW//NaIUw95
 +ClFBGjW/PqvactNaEKDXXjKn9u8eb0tv1tIaIF3dT+3aTJBjrpZ7LukL9+cgp7RHzvkzA4W6KR
 Z8YKDo+hB1r60t7kOSe3xhCdmiJVIWZKCHf3tiSI8a+3iHEulAlwn+xltcmZdbkmzoqOxifeRnw
 Y1+dcyjzA8g9B5VvicbfXVKc+pSszTpCeeKfkt1cczJyJHRnhYmhsC/iYAdfiPfMeDuWjgt3cQV
 o3moLpymTgcLjgS2rgQpFjwavvjeEm0hcxdhze3VX4yHO/cB4SPTcBJBVWTEoouOoK+5fZY/Q/3
 ineaiNqAmliXRG5FbLhXRa
X-Received: by 2002:a05:690c:c18b:b0:8b0:e8e5:923f with SMTP id
 00721157ae682-8b2b676aa68mr45656237b3.67.1793616080240; Mon, 02 Nov 2026
 02:41:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
 <9c983d1ee9590f2dc2d373a4a035f1b3c1a04801.1793613972.git.lorandmarton.dev@gmail.com>
In-Reply-To: <9c983d1ee9590f2dc2d373a4a035f1b3c1a04801.1793613972.git.lorandmarton.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 10:41:06 +0000
X-Gm-Features: AclHuK9-WZ8bBMO97M9jp7E97uGMNBR2cblMSjFM0KZbtsz3QH5HexKSg6erIyY
Message-ID: <CAFEAcA8Nz0L3mTPq3aKsgnL158GK0e6ioaZ6a4fG1YCdwrFLKQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/i2c/bcm2835_i2c: update the interrupt when the
 status is cleared
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 10:18, Lorand Marton <lorandmarton.dev@gmail.com> wrote:
>
> Writing 1 to DONE, ERR or CLKT in the S register clears the bit, but
> bcm2835_i2c_write() did not recompute the interrupt, so with INTD set
> the DONE interrupt stayed raised after the guest acknowledged it.
> Linux i2c-bcm2835 clears C before it clears S and so lowers the line
> anyway; a driver that clears DONE in S and keeps INTD set took the
> interrupt again and again.
>
> Update the interrupt after the write, as the C and FIFO writes do.
>
> Test that clearing DONE lowers the interrupt.
>
> Fixes: 9cf3bc65afdb ("hw/i2c: Implement Broadcom Serial Controller (BSC)")
> Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

