Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252FEEC1433
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNuZ-0007CN-47; Tue, 03 Mar 2026 06:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNuX-0007Bw-KE
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:27:33 -0500
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNuW-0006aE-2Q
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:27:33 -0500
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64ad9fabd08so4485252d50.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:27:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537251; cv=none;
 d=google.com; s=arc-20240605;
 b=FGTQGqEdJT7vm1/nIyr6FsaIvHsM03MzOShDX5xeLjop8bVwJAYMnD8hEtV0e/fS6t
 fdL2PWkKkCZKi3qGEAZP8cCLhGFb1/D6VlPy2L3jhsBEHJf1B7ZV9uJ8FZwQyN2hgRls
 rlXB83iryRqQzdzPW7UoRHLPZmDVbCvzBLOE2Ri+OwCFW8501nwKdEDlBJZ4kDAjSgl8
 cLe26OWutwMLtqC0H381mn87fSjswHdAPzjbM76nt/JowANr4y9RbVkQILmrrDJDO1b2
 4Ceke2qZk1DFsJB50PKk7/klt1l4e/yl4AzpF7khK9IQ0BX2YIyxnIxB7rPB9e4Vn8Fw
 6jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bwl/UmuqhM4/g/IhuVmS9Kn5HzDfeBwe3PBmNPfW3GE=;
 fh=Cxtn1B0HozxY6XY2nPp3WbyFlDuhGu2mywMp8FChY9Q=;
 b=crcLjJMFRiZ9aZzvKhqZdyzf9mg5qQSRKHa4jrEoIFN3cTSWuzKiaN+6vilIMXW5zd
 3FpFcYZvVdGKUr+6CSwRpLjhaSRpX5ZA52guYC9v6jl/jKCG6gJOcgbH40cDAydndgSN
 0ax/0LhDlNwAkq4ipCPMZTySysFfJF7u1Xxcx1RqTRwsLvgWVedFSiwuO3Lmtk13vBHh
 Px1hOr2t12QqLLRHqZPPlJJlts7gSEzaH3rP1yCDdWzRBDUBhkk2oHoSfuQPtltn0V93
 E8cGEsmEQpRcC6yUwE7UQZEqPHlCgaY1TbKJndkgBFWThUGK2Iv6gjcgbTcUs1qyOT+k
 2/ig==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537251; x=1773142051; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bwl/UmuqhM4/g/IhuVmS9Kn5HzDfeBwe3PBmNPfW3GE=;
 b=aRurYto2Ol4H6UgsUYDOSzQmcB4evoSjbaTqgJYgpuP68SuE1NXblDumdVcapptdDl
 r2TKvXXmIML43YZ2u0olz7DFHwpsK9UmzNvugKgdP6mVTY8ewe0oEUMbrBGtO2SIUA1F
 3sUYqTzFhfLrVEpI/d5dyAeAdr9uhw3ApTqC8aEMfB9PifgoNjrrJ44kEtFlZAN6Si+t
 UbNKjOcb3mbGU/keo5v/l0djfqNnVkzMlHdIdXTb/pKPg5r3F73BozpLrEdoGMyC+WiD
 Wgnz20VIsziBF0TdauTpaLIk4kg4wRbnYqg8UbecYToN5RuiSyHrPGnxK4qevq5N5BIV
 UmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537251; x=1773142051;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwl/UmuqhM4/g/IhuVmS9Kn5HzDfeBwe3PBmNPfW3GE=;
 b=Uil36Ugn2ASbzh1ERRTHQL3xuHi/jwzXoODGShosiiRw9e0mpoDg1Y22+BXSxnXtOp
 K2uyqBN9PefdBvWute8JEeh6uFFnPvop1vGVvxjCmFTBE53ceLd5bI1yekoTJIgHcNAp
 IRIRsQNPbLtkc4OH83pcJhPe3b4ErlIu18LrMrSO/Cmx15yXzYf00fD3i6QBBXGbzRav
 MqI15io6ofTZbTvDA8IWgGBYAu7jKT2ACY8buClVPHgFnaN26oNXsYjV+t+f2T2+7qVk
 V9gvdvhR225qJvcA1mJFmR2uJTM17UcfFKKDic512ZHHv1tpxYO4dNHj0LU5todvceyl
 77Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU02dkKZpj3/O1gI80jpEMuR0i6TWTBdLI8QLShROJLb9/JbdEJTCh80J7sawkdettmPlqAvJiORw==@nongnu.org
X-Gm-Message-State: AOJu0Yy+w9vIBiB4F2wxbaneQqS6vENAXG+sb1duxZCqfhBlvf8fESlR
 udSTaGTbb9EuNeSWpS+SYKrzP6lin2SA3txm5ooZSTu3To5qLwG+ZhmIGVin5vyPLqe2B0bgQEG
 HNql9Cnic3jHdLovqTJI4WCUGaE3LKJAVtxTIwZidwA==
X-Gm-Gg: ATEYQzywG1l3tmuifmc+/CooEz2GR2OYCLQOTYwpCTt3l0eoUb6Iw5eZM/ONQOmQiSP
 fVZ8x5YMTnch1pZI7w9JycSeejVoXIRm3haIXvpnUTf+1AGVIVHCGMq4WZJpmViOSo2j/F9QmSC
 19HZNr0Kj5ULWyAwikbzPzG+mVCl/vfhiFrPPmcwSMhvHdQ3GEQZ1eBFkHMsdgiC2ZSiKWScky/
 omuXAj7uI5U4Npv/zPe/JU58+zsZOr5FbIu1KocquFMygEmtgBeCmvwS735V088Xn2nA62rBlZ2
 28cV71kYWXg65VOQhFCO2D8uS0NKHBxqaD95tTUbuzoUh1rkGvt5CJpYn4x0A2gooqg=
X-Received: by 2002:a05:690e:175c:b0:64c:97ad:17dc with SMTP id
 956f58d0204a3-64cc22c28damr9071813d50.66.1772537250860; Tue, 03 Mar 2026
 03:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-6-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-6-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:27:18 +0000
X-Gm-Features: AaiRm51fNJHF0Io8q29dac6SID0toyi7KasfV9xF9UX8TlFCT4VmH-QqA6xZEyQ
Message-ID: <CAFEAcA_Y11BUgYZ9erfSgDmak5E9CdxHaAemj+7ntscDGLUTVA@mail.gmail.com>
Subject: Re: [PATCH 05/12] hw/char/serial: Remove unhelpful comment
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> There is no "is_load" flag and one can tell from the method name what
> the method does. Remove this unhelpful comment.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/char/serial.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 2c558cb9fc..f73de1ae4f 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -281,9 +281,6 @@ static void serial_xmit(SerialState *s)
>      s->lsr |= UART_LSR_TEMT;
>  }
>
> -/* Setter for FCR.
> -   is_load flag means, that value is set while loading VM state
> -   and interrupt should not be invoked */
>  static void serial_write_fcr(SerialState *s, uint8_t val)
>  {
>      /* Set fcr - val only has the bits that are supposed to "stick" */

This must be an ancient stale comment from before the device
was converted to vmstate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

