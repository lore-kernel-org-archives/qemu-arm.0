Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3305721ejc;
        Mon, 16 Oct 2023 09:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyI3kfcZHKkjq01W33bABlZtiQOeACdvuMAOQfIa/4c9ZnvM9Jf93cc8MDfXYoj8U3Zw2G
X-Received: by 2002:aca:2409:0:b0:3a7:215c:e34 with SMTP id n9-20020aca2409000000b003a7215c0e34mr35727953oic.15.1697473872159;
        Mon, 16 Oct 2023 09:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473872; cv=none;
        d=google.com; s=arc-20160816;
        b=gS4Tq4hiB6PJI3gXVYYSapOfRBuoW8VfZ7BJOJqmZV3ACPsoUpHseX31o0T0EEfTBQ
         QfJOPjCIbLoyMTrIbjoapMMXfQn9szy8qu3vLcctorgwgHb7u6qhgxDNpGQ2HxnZKorZ
         blYPpBDCFNR0wLYvoKBayeRC909Nz1DPDTwwEAQ6sKSD4m3LRc7P2fH6SkK8UePrelbE
         J+fd4vHfUD80HsyuR+EnTffqmnmrYYood8IeYkTJ52ViXPdmhlZV9TADq3khej7FcZU/
         T5gtXBiJDnuQiQ3m0Muk8bcAK9GQUoDivYy7kAzl+RQzAtp7B8m7E44vRV7HPqQNeo4I
         PxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fK8Z1KINcqBmmet2bA4w1l6vKCDLUfesYnkmy2gQ4cc=;
        fh=j/v/ufwsVFWAxDisQ+bUJlpLZ9J2BcNZvMYjnEqO56I=;
        b=Qc5FNRJJDKcJz48bAkoRu3w0jN+xxC3vyR/Qp5D2u9cKd0HEOtDCgTWDGGp2lF5th1
         fxE4bWw6mVP+1D3+HK4fkIOpjl9V1suwNecbJ2FKpYq7ILz9N8wAlgmzvS+strPKFWrl
         q1N9GTgN2xkKJpWcrEz2G+oYG3FzVZr+0DMHZrrW3Gi4Bm/A8VaHbCBvzIm9mIU7gbVS
         aD0eyIkonZ/ve0Ieoxd2pE3ivTV5gp/vZD9C7xH0PK81Iysx5sEc5c4rx3vt7Y1ClqW/
         r+f3vm5HsBaMa01FXohfFXptwcLxNLzHkAH6yA2pZUw7Aptbo3Lbp98c4WJX8Hg+MJjp
         mpOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sk9HdzPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10-20020ad4414a000000b0064f57c060basi5470088qvp.582.2023.10.16.09.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sk9HdzPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsQUl-0004EZ-V7; Mon, 16 Oct 2023 12:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQUk-0004EC-MD
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:31:06 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQUj-0001Pm-2i
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:31:06 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so8061032a12.1
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473863; x=1698078663; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fK8Z1KINcqBmmet2bA4w1l6vKCDLUfesYnkmy2gQ4cc=;
 b=Sk9HdzPu9AW6UV0Py02+divzSOyZQ8U//p0FHoAcgXm3yXCsSCIo4O8EgfXAzwdSEc
 519itFY5CQ+ni3JA8uGJfbrc/bt2xLWIyKtOVfiTUmMFwAb+n6b8855b5w+NkQ1A3tyN
 vdvyKTYgyyX+UOOmxSwvM1QQ52KeOWSG/3LqQQnlzac0BNfhBaFf6hBVOaPo7hPhp2cK
 QZahlOB6XT+OvoF+2eQ2GiBxgqKm2ppwwQsvUZ7X9ze3o6t8BN/mFvWAxBCqXgUKenWf
 gPwTdU0Z2/b2PFPPp67BKPMR4laAZq6Yo4wJpXzplnoM+9LN6gmBZCMu5PGpib3xFLQQ
 7K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473863; x=1698078663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fK8Z1KINcqBmmet2bA4w1l6vKCDLUfesYnkmy2gQ4cc=;
 b=kpXUxqKSLddtQ9c6M00EdRkWQoro0eMHUnHx48WRgCXJWuISrMV9DxI9BrwIBhX9W4
 KO8XjGocmW6pKIcwXVGXfJAotC/K/0IKcpeaf/PSztSt14IF+yhHKunqwT9h+yRfX9Je
 QoDnUFVM55FRWO7WuShM/783hYvHMzBpnKzvrggUj3dILafSLF8dgZGFzwgVyLlBon0o
 nqc0wKA9bzsWSd46rW56UyAv21v+sQA24qTxLy6GQIfcsPKq0TsKFcwjILN4b5vyjYCP
 eqboPz3bGBwsWj4H/LmCzxqFmA+JfRhHUe7JAThkPM2KkcNf34Wd6JF2GcavRgYLnvFb
 MpKg==
X-Gm-Message-State: AOJu0YzIoaylGVjxm/U5/BadWBMpE+w4HzNJZzDNvAreIyjyjMIuO0Bq
 fm1gUCbABAIx3eCBxX3e21kpvhBGYgF7irgeB/dIGw==
X-Received: by 2002:a05:6402:50c7:b0:53d:ed7a:11f2 with SMTP id
 h7-20020a05640250c700b0053ded7a11f2mr14008388edb.38.1697473863644; Mon, 16
 Oct 2023 09:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231003052139.199665-1-tong.ho@amd.com>
In-Reply-To: <20231003052139.199665-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:30:52 +0100
Message-ID: <CAFEAcA9Qapo-JuO9ko1nqcAH-ObXOt8wjTvYb00x026S0pvyxQ@mail.gmail.com>
Subject: Re: [PATCH] xlnx-bbram: hw/nvram: Use dot in device type name
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 176nFEnTwPV4

On Tue, 3 Oct 2023 at 06:21, Tong Ho <tong.ho@amd.com> wrote:
>
> This replaces the comma (,) to dot (.) in the device type name
> so the name can be used with the 'driver=' command line option.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>  include/hw/nvram/xlnx-bbram.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
