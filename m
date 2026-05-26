Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAB0CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 09:13:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRnqC-00039a-P3; Tue, 26 May 2026 05:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRnqB-000390-C9
 for qemu-arm@nongnu.org; Tue, 26 May 2026 05:12:47 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRnq9-0005Lk-TO
 for qemu-arm@nongnu.org; Tue, 26 May 2026 05:12:47 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso10678943d50.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 02:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779786765; cv=none;
 d=google.com; s=arc-20240605;
 b=XYT1mXrPpQ3lcM42ibxBRtEfrCPPkq8HcJYsSX9/i9aAfNyBE5EEk1rXLsmgICvA9q
 g7OmQHTD2aIGH9t2qRbX+POd1xrCv1QKFKMyPXcTAiUBh+oZrOGbfN/ZijjaJYa/jNIJ
 6Xf4gMNnmfUBdrWdjNEYnC+7r3lYDD6PY6SLsLEdm0+mXJUX9/aUP59Ou8sy5HdovWpF
 hYwClcgvmCA9jYsxkIBFXF6hBNqJ+rmpCP5BFzsKBhpZ3T1nT6DcRb1c9TYqEYFEa0Kb
 XPlrLyu/Jeb1GDCCKqdDynkbhx7mNTy8kwVxuh0CdBNfzerb71UpAFxuT8M4yC15YQKt
 jV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=HC8+meO32OsYOz+jIi6FNlPmw27OhwMZkgLT/F50Vbk=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=XVPE4NEm0pSJsElG+98n25tMZhn2WrYYJaRhC7MxBDKD6CsJWc606HNCknaeR7wDRJ
 HwUpx39CQHD0oHuVQV0galv0H04AfKBwmslmQ3HWOTzenamRMAZYlK3rWv24PNH8UMn7
 CErqDjup2WGlwa5SWb5WFlLxyEwulz0O6ZSd0E9WhlYzlkWQU8hSbtI2t1B4X+cKDqeC
 iW8eh5q7ZUXelBSQG57mZbS+36EessRRvhVdEbnM6M1QGoICcvIQlkdwNCN4Fg7UFT5Z
 XyeWCsh1a8hJlbzYXnywgTfXQDKS6DLKZtMrurFGqGCWEeGTfQErPhcJL5xS54Bw6lP7
 wHlQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779786765; x=1780391565; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HC8+meO32OsYOz+jIi6FNlPmw27OhwMZkgLT/F50Vbk=;
 b=rIxVkQrFFPylfmBWlSgXsvJk8KygkwD9oSsFDoGCUUQ8IWMy0k3AzBushl58O5q/0K
 FE4UJCM9gFJqOd3zVMtGuIj04y+agiAxmKItIX7JPUsqY5Xzkckvn1iNujfyp1XoJ/8S
 tJalmWtZkwQnr/ai48I/U2ASbzsKZfWAOsFjohID8ZMkcec/3BKtybheDMT2I27bWFa8
 f6bR+FAlDfU2RgqfyTU69KJ6ujwRVDPEu+wfZtLQhnPgHGoEhmC2YzfMLLKYbWyGMgaI
 gBIfyHnV/UMbTDfidTlkjH2T7hO4NDI0IfJ2WzVCkT56oFQZKayLpmYlpYG81mFDvnGn
 P1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779786765; x=1780391565;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HC8+meO32OsYOz+jIi6FNlPmw27OhwMZkgLT/F50Vbk=;
 b=a+86TUpVIl98h9ssNplrRPg1f38NjMi24qcEw6uSFktj8KeNPE7jxuPYHpKlAEk0A/
 MpzF3CSh2JJQ0YddCjXzZsmm7rC1mTUdMehA5WJH8wairqd+fr9TjOzhlj5wsXhH5dit
 Ovf0FYWzpWrcVV8GjBfc8mMP+/j0TQObslQP7dPmMbkAVY5ZLavQ3qSSdJ+e5L5l1uDh
 fE739WDWBdNrhSyjk/f9ZDpp2zqjbA3j4DfoZ1POxgsGz49l79Qm4ABbDWKamWbbqFR2
 wCtaI6tcYcO9FyGSE0mWnBPFQ1MeLgmn4FkKwQE/elSk7gjwQGGoAF5NTbodoi6y35Tt
 CdWA==
X-Gm-Message-State: AOJu0YwYYp9W3T0IbSqsAlLxUE+SKpIgMf8DmrmG8qpgSe8yxcM9pYyj
 f6NpjNvtwM9sCUOon5cTLZuCNR3PdLh9ru6ThsHV9zD7kENiN4m+mcWkktNg3ZIB6H2LJq8nKn/
 JoP1SbbHV3iGG0Cra9oYKgZE1mDdZrrcVftvXP3QnTQD3OACPQcSJ
X-Gm-Gg: Acq92OFBpl2tSFHiuVPJGCCdGHw4C+7wGhJY2uR/WpY65VNXt4ro7lson34yhB45EAM
 HMRo0T0csrUbNw3tX4H8fKlUSrzIjnCIR4SeWcQklbJ9+vxZ0OcVsEExHLt6tBAga54QlaGAmZA
 ecFUxrJbtbCMhe95aveInoN9YPq2v7F7bESpUdUwvvuqxmlpFOmmw0QSizlIyOw2BRYys27Kh+N
 sMVKAVdifqC+HAP5XjsZwTi8bQux2UogQe8aNqpGcQvfW+dcpK5Ye4TA1OVan3h1wpoZAqvV6Xl
 IcC7qt1uTI6w1zUQwekoSbTjx8HTsjQKCxcsB37IIuHEZ352vkJV1+0Fbc2p9SS9WgR9YwPsfXe
 QYw==
X-Received: by 2002:a05:690e:4814:b0:650:3bbc:5375 with SMTP id
 956f58d0204a3-65ec97ca8camr12366599d50.17.1779786764743; Tue, 26 May 2026
 02:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
In-Reply-To: <20260512203414.3633237-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 10:12:33 +0100
X-Gm-Features: AVHnY4JqbqpkaNYyzcpJbGnX2qAgK2vNjkBt7KywSQYX4in5oVb3UDhblChR9OY
Message-ID: <CAFEAcA8NnS99cGdAXja2Rssj7chS82iLX01WTzKxWxTUpxfG7Q@mail.gmail.com>
Subject: Re: [PATCH 00/12] arm: OMAP: Remove some dead code
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

On Tue, 12 May 2026 at 21:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The arm OMAP SoC code still has some remnants of support for other
> SoCs in the family that we used to implement, and bits that were
> there for features that were never implemented and we're hardly
> likely to implement now.  This patchset removes some of that dead
> code.  (I noticed this because I was looking at the hw_error() calls
> and realized they were all in code that was dead or otherwise not
> needed any more. Then I realized there was actually quite a lot
> of dead code here...)

> Peter Maydell (12):
>   hw/arm/omap: Remove omap_mpu_model remnants
>   hw/arm/omap: Remove unused omap_mpuio functions
>   hw/arm/omap: Remove stray unused prototype
>   hw/arm/omap: Remove unused omap1_dma_irq_map[] entries
>   hw/arm/omap: Delete unused #defines
>   hw/arm/omap: Remove unused wakeup irq
>   hw/dma/omap_dma: Remove support for dma_3_0 and dma_3_2
>   hw/dma/omap_dma: Fold omap_dma_sys_read() and omap_dma_sys_write()
>     into callers
>   hw/dma/omap_dma: Remove omap_3_1_compatible_disable flag
>   hw/dma/omap_dma: Remove 3.1 mapping handling
>   hw/dma/omap_dma: Remove unused ifdeffed out code
>   hw/dma/omap_dma: Drop model argument to omap_dma_init()

I've applied all but patch 11 to target-arm.next; I'll resend
11 plus an extra patch to fix the resulting misindents.

thanks
-- PMM

