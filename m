Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56879CDB46B
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 10:19:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbbjv-00018A-Gi; Mon, 22 Jun 2026 06:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbbjt-00017s-Ea
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 06:18:49 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbbjr-0007ZV-TG
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 06:18:49 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-662ebb1329aso1784059d50.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 03:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782123526; cv=none;
 d=google.com; s=arc-20240605;
 b=RuAOvy/dcPaxOJce/atRhtM5TYf3qyw7b2VDeJtZFkmFcax2akxPZIXq2BXqBOC0mm
 Zaqq2aTJ+6SYfbKd7HnoPerq2xrbSZd/THMcaCjkW56/L1jKGHq8/k9nZPIK4X6XzqlG
 bgW00AnEmAqhc+On+gdB/S8js8ELLZQ0XM2rm9zhOnJAO5gtFxmmYZTTsATQgXHQ604T
 6AVb+JhlHC8u67pzeGyuw2goNQjdko+sDiTDHH/FS1kLAeI98WLD7akDn0+IgkeDtIga
 TGG6araNixDg24iNu+B3Bw857g4Ayhf+5qJS40EV/n86y8TuAITLTADH71hWWtPZh8IX
 bJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=B0Y+v+d6Wbeo6e4sE3jvGSH9/P4Ci+unxrfGdhbru4w=;
 fh=n82Vl0oaf3o/H585N6T70bmfKvLGwIPyev0mF1CnOWM=;
 b=lzhdZMe1pcskXixTgXqPrTNJOb2xX0/ZzhEnVM/vu0QGpgTwv5XSoEMwsvA6Zw8Rsi
 vz2lrct/gISF8ZUTOy8qW/PS9oC8XKxP26gmmgAXB6wJElaqcEov9ZQRwxvMkmDs5uBG
 4eNiYoIgQgLeBDyYyFeKu9lQ+O3e3MAgy/+nKSDLbH0XoDv+pkugwNBKbSlGPMc+EsIQ
 zzH+uFyzA+p9jg1npvPg6RTTRc4Gp0HITQGx2EYeLM6lCUOC1D7QhiijPx2a5SXldKho
 R9uRaz0t2+8CmxI4NZjcSHynPDsuiYVkPId8Gkaf2a8JsG3TwCEocA8QgSe1XL+zJ5D/
 2Sog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782123526; x=1782728326; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B0Y+v+d6Wbeo6e4sE3jvGSH9/P4Ci+unxrfGdhbru4w=;
 b=h6STuFLl5BG24AKIPoQNogRwvSZ8HL2owld6PtB2fPfPd500Mt5LOV2aiyqRifx0kZ
 fmsuUJoKGU8vWQiVlNENmmgV+JaDOYicu6f9mq+4sHt9eOMmY/9ZdYcxm2XKccRuYD37
 W1es6GfebPPGvqzrXja+XHbU5+AdjQYWPiteuBByHhBKIWjFFZ0G/VifYT4bsQ6AP6lJ
 r8Py/wZ978111+PhfOJ+6+LlZxOHZbEGa5qDX5Rcs2y25JS48NsCn66kNfGxooCP37O/
 jKRTXmw28FBCI6gZiWK5Mo9rWvqNrgcPL7eJknmUPs6GhLjGwIR8AQbCWaOAbst0VF3i
 Lzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782123526; x=1782728326;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0Y+v+d6Wbeo6e4sE3jvGSH9/P4Ci+unxrfGdhbru4w=;
 b=CYgegitDa9sV4yIO1QUpQkTXDObCaPOrddtzx9SWe9uyWfDYjXFoDw4IsaYNqD+GXA
 xZvW80JOh4FDqGYc/SAmjVYTPKbg16u9JBg979dCy1pITHpilpq5wWwsi6gen93Ge/lt
 DDLgF16O2hxpFkDMI2MDHAkS4TcIcxeblGHQb8YOpwgjCizhacgDX8PJxnZb+b4IZ3zC
 v84sKVz6VN2/jiz8wpGP0V+JIRRtW0c4N46H5mxb9dc0+rFSD/C/I2JbzFAENLy3PoKQ
 fy037SISDkNvJDIz/TYr9G7RExQW4p4I88p0G/xXu01RkFh8N2m5EHfMpmwmjQjGLeqL
 Wyrw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpO3QpuDc4jCsUGXIxZp9jYoUBLqT1BRKDsIX3rXjj2zy8c8wArnSWLV89FVCMVREyuCdcYZuAxlg==@nongnu.org
X-Gm-Message-State: AOJu0YyI36B4+vajTOq1vZd1YCfehcNB9r1D80EAz6F+qVRqr5+UFkJv
 IbXj823ECz8WfOq/6GBJQRF+/zgjXQNC/MivEQ6kld3a/h+VMQXQcr93N/+5bfWHq8AU/L/sOfI
 YDcfxeZlwUtlriN4NxoStDsB+rk0pDt5UNLjw1BI+5g==
X-Gm-Gg: AfdE7cl0oEmssSR9V49mmdYao5N1x+hJd84t9EXtwbzk7rH8YEf+WbQDkUohej4Kdia
 rVmEkYwz9lBAXSadp3eWhHgp57klJAjy55YNtwLOVOeqS3IK6qg+HZpPDhSCBYIfWczuTBI5GKj
 s06Em9/GAp6Mw7TijPb9g2xqCKK/nMQCRjveLHOYTWY7/WX7IuOpV1QKc1vIT9F0kp134dwqV4v
 ZdcwRku4ZZaIdffMB7a6ReFFBZGSgCta/7XPnxQIQaxmehmGFSA8gTEvOoOJx1Sy/gg5jP5zhGw
 f3kMXma4ab+qJWSL2zM8vVxtD3tbR6FTZUV+yHxv3gT1DX0awAbLAc0a
X-Received: by 2002:a05:690e:488c:10b0:662:f28b:7c6b with SMTP id
 956f58d0204a3-662ffea96e9mr8253701d50.62.1782123526167; Mon, 22 Jun 2026
 03:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260614222131.5795-1-imaginos32@gmail.com>
In-Reply-To: <20260614222131.5795-1-imaginos32@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2026 11:18:33 +0100
X-Gm-Features: AVVi8CfVzsIwfHqz8sQwNEfORvuodRiTIQbxY3HZMY8vwi3bzlk-JUGm1Byf784
Message-ID: <CAFEAcA-GGP6aALn4Az5By31q1R3d75Mm+p_YXN0y=tO3GxDYrg@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: pmbus: NUL-terminate strings received via block
 write
To: imaginos <imaginos32@gmail.com>
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-arm@nongnu.org
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

On Sun, 14 Jun 2026 at 23:22, imaginos <imaginos32@gmail.com> wrote:
>
> The PMBus string registers (e.g. MFR_MODEL on the ADM1266) are writable
> by the guest. pmbus_receive_block() can fill the destination field
> completely, leaving no NUL terminator. When the value is later read back,
> pmbus_send_string() calls strlen() on it, which reads past the end of the
> array and returns a length that trips
>
>     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
>
> aborting QEMU. This is guest-triggerable.
>
> Add pmbus_receive_string(), the write-side mirror of pmbus_send_string(),
> which reserves the last byte of the destination so the stored value is
> always NUL-terminated, and use it for the ADM1266 MFR string registers.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3388
> Signed-off-by: imaginos <imaginos32@gmail.com>

Thanks for looking at this. Notably, the bug report in #3388 makes
a completely incorrect claim about what its repro case is actually
doing. The repro case does the "write 32 bytes to trash the NUL
terminator, then try to read back", which is what this patch addresses.

I'll let the pmbus maintainers review the patch from a technical
point of view.

-- PMM

