Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED514C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 15:36:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whqnK-0007Nj-0v; Thu, 09 Jul 2026 11:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whqnJ-0007Na-7n
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 11:36:09 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whqnH-0004uY-K4
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 11:36:09 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664d7863920so1842606d50.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 08:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783611366; cv=none;
 d=google.com; s=arc-20260327;
 b=T7xcsSGr4jW7Nkp1lounPV55nxHFyxRxNCfF7HiRO+U6jATYq2ELOz7/OLKQin07o+
 0KvNVJ1YH+5Um1SCuwgto0zAEXsOQjFRjNfLPklaaY/i5ypkPnY6ogRem2NLtOZ9J7TK
 F+hbUPGh0KciF6RgmnHAGtbOwxMiMZxX6EiU7dOos1iLzDNj6UXF9/3G7FkRJWxuejYl
 b0IOFY+81gdj7xk9Apxlmj3lvIl5pY7hLFflq+RzISE4Zpl0ZrjKpkqO3xikxtE4Wtkq
 omE77VN02g9jAFijjbt1oVUkxa3NQC3l95OngEg//jqK4hQjIcj+x25UlEEwC41/hF8I
 ViSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KwEI7FceSirCv519qRyIn/kuOFSAWrpFnuPieG2C4N8=;
 fh=oR7TsPg3OTmNosGgopAXF0ZXV9nY+FQmXuneIKe+VyU=;
 b=Xfti3Px+fLt0PsXBYXR7RFJaru/Ds0f402zi7hhxaxsZEZiA1Ds0ORVasVPhVqEOBq
 TrgRqAiLpy/J0VEKRfkEsFZBtkrN4FRpHbSLL5Nskch7C6DVRQrqFtwMvNW4a+7fQsY+
 jJdW/9GkO8SZifd8/4UOossEYv3Lgp2PE3EhWyD/M5GZobd/56ZPk6oS8lCCq1eYMJ3L
 poiLWlvJ6B0bSi9KhVnR62AiOZaB+/5DiKt6ltkxRgLaYi0C5Jr7CQxbULdXq4j6Uj3Q
 99xQvfvY4mMy0MpzNSwGJJeJ7Ib1f135teW2MpR4/5cZy8rzf9RMnLN3JYpydoopZ0GL
 Wejw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783611366; x=1784216166; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KwEI7FceSirCv519qRyIn/kuOFSAWrpFnuPieG2C4N8=;
 b=QM+uNxThQItqFHZXFAqv7ZlQ/cSgNeiK5N8c8Id5jJP0USpyl6qSRLi3nHvcIgWwDc
 rng3AjEcXkx6VZfy8OdPCpu3/nNk88e8phvtJPD0CD8I0+CZPzvFO/Pbz548BgKCLdSS
 0caYTt/RyibxI4EEP7dtN7zQEzfFA1kGH/VHuobrlEwDbFmOuCa4XTC8QPR6ffE6RodH
 KZ/nYi0ZxhZXqhAIZ0DlIh+7K6UwWJNYS6vGWLdgPybNSEpT2GfhihK458zX+ejmeMM1
 mf53TKObTHHn2HCDu623Z8UM9Uvif/hJnIqcZ0dQpSDIXOST3hEYkBPrfMVg2dWWlRsm
 CqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783611366; x=1784216166;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KwEI7FceSirCv519qRyIn/kuOFSAWrpFnuPieG2C4N8=;
 b=AkcKYORAhyYGAxtJaghF4HSsfNRX+2Te+ik/Xry++MkFkFRM1XHMD+iu30fSpiCKdG
 FztZ6Nn7w0ClaRl7+3VHSdOBcYthxNGDmcjBIzM0Jp0W5tPZpeTrzfr16NpRRisTILy7
 VWnM2XXI+IbmGqQIqRe1NWW+nJS0UG3zVzSD8wnCJ63RCK/03HyRQes+2tvhHyW5Z+jQ
 aokUwPy+ZCXuSaAiBN27jEkv7chib0sReTgNAdQt6FK7Cq1M0StNVMwYWkGULGL28X1R
 lcESp61JgjXMsuq7GozXwkQMqUfLl2F8yIHpWYH0V/eXQP6psdKUiV4lt/cUUroHCI3g
 WTCg==
X-Gm-Message-State: AOJu0YznwK46D9uHS8t9iD4Z6mcexMGogW+RaR1iXihKLjUn8vW4ZGXj
 kVfRMQzm5EsG+bpvC3FecsAaAlTsmpXRTwSJ5A2AewxRqtT+r1Mr/iox8CwUeLVBxgxGgcuuy3b
 r7+ctq1EfDuR2rUxSB2aSN+qmAABiEUWfiDF4++AUDw==
X-Gm-Gg: AfdE7cntnbk+HmUXV22ewzO6L+8K5FWN4jcI2/wrxQumv8dypCz5ye6M9OTrIGpK+mh
 kab/Egr9Obwek0iHeBOP9KUTOk5qXWgu5egAQjN9X2tmEvUlLapNuo8OmeuiLQ+IpW0XUJzEbtw
 7b2iAgBq1isU1nIMXmo+N+WrHDwu4HUjTlcyoVgmEGk9ZhYnTEL07o3ZEkmwWPk1EfY7TiLWzwG
 81m2wBjYs9VeZqGu59CT6hmu71GGGdcOiFFXCpC1Pmzk654B0dOWMDfu6ewC2jtfh1AQBQrZoLF
 RRFgQbQxnlDq2jH6dy9dtkDuxWRiaBlW/q4SpO6SPmeQGTliEsteJ71z
X-Received: by 2002:a05:690e:d02:b0:667:bca8:a685 with SMTP id
 956f58d0204a3-667bca8a866mr1278764d50.57.1783611366173; Thu, 09 Jul 2026
 08:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260706230056.1888992-1-titusr@google.com>
 <20260706230056.1888992-4-titusr@google.com>
In-Reply-To: <20260706230056.1888992-4-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 16:35:54 +0100
X-Gm-Features: AVVi8Ceo9j-IbnSkrgLdqiHmoFCZuCmjfRlevj6CwfdZLuPmseXzgkJa8shXbVk
Message-ID: <CAFEAcA_6RgRbunqGvd2uPGehATNay6=Vh1uPH-yT=T+4NjXPQA@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/i2c: pmbus: clear output buffer on write
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Tue, 7 Jul 2026 at 00:01, Titus Rwantare <titusr@google.com> wrote:
>
> From: titusr <titusr@google.com>
>
> Generally we expect a PMBus sensor to issue writes after all pending
> reads have completed. If a data read needs to be resumed, this state can
> be tracked in the device model and the pending data placed in the output
> buffer.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>

I'm going to apply this patch to target-arm.next for 11.1,
as it fixes a bug.

thanks
-- PMM

