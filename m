Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1612ECD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:10:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYyz-00086t-IN; Fri, 19 Jun 2026 09:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYyw-00085U-Ua
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:10:02 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYyu-00054F-Ds
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:10:02 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-660633a60caso184549d50.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874598; cv=none;
 d=google.com; s=arc-20240605;
 b=XDHbt9zqJR5T/b/bG7bCsEZ2QNzNDBQ429ygb3+U56HrSe0rUFmHKTeHNDwR2yiF2M
 BziJg+tx9vQSsidVwWo5bgnC5R+JhdhGV2XyFn5tGesrmmWR79rYTMzFRO4z4RuFptnI
 PxDlpCJsO8vYzicOHsgpw6liEooq2DmSpsc9H5qlufdQjCYeBtQ28MAPszb4rPYCAWKw
 EvPKlDqXyu4/s7gAQyMRVFN/jtC2xMSX1lb4n0P6byxAmn0fniyKNys4vzpYSzPUJmwG
 SXFYQr4OAJaOmdJb/JWnk7/zANWGfeudugv0XR4QQsMdlWdxIumS2OuiRfUvArCAnKAt
 s5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EyQpzKbExiusE9kCIQBpIVjezDAJyYtoBUFbitbxGPw=;
 fh=LePGKMxSch8QzG/w67lwGsW1AqdsFiLd+HK80l9JoAE=;
 b=fAhf0BsH8sMVurAGzbIh3qX9MwiGSkir7E+FSDbgTXd/DH5eK8faG8258EaIU0/qat
 D7Ui7dIJ035UR6b+z9kJTR8295rdEg3UpWSi7h0Z0YfmSE1GZNnbbhTGf3+0oixeqZpt
 di4FiZ8aCNvKmoncybplxXtOFZKKnXHI5dy/hQz0AplkBgP2uTouktJiUwG2/1IjJXBG
 fcqZEQ2LiQqUDsk8y2VP5tkiuCpgaenJhPyU+nnN+iPtvcSpc/B+9XVJt16ntZbiC6t/
 XdlepqgCKj807ZGNFZXDcbUOkh97/k9tg1lAy4KytLmQAbnCNbZNzWGTRT1AsTiNrhVg
 aQLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874598; x=1782479398; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EyQpzKbExiusE9kCIQBpIVjezDAJyYtoBUFbitbxGPw=;
 b=Ce2VGqpaBXgny4C0bd78E0tS32rt+jxLSlB3CUv3AJ/MaqWpyLp05LIXLfzQbOc8gM
 Iv9p83jtoaTx3BCwdHNgfc1S0Qa7h1hUk1NWKVKqNwvasL4oOrFlYzrgRwooIGrEsQJU
 ToRM/IbyP9Mc+2uJ58G/WGvw2L4TvN2ryxfJhH26aXqKr4dybEw1SYjFlZdI/+4ssYtg
 MO1n0McbpHzl8EjCbyPWrwbRqX0FfxGYJKYt7X1/7OQa+JJ7D0ifJKe8MfHoW9HDckdp
 HD8ibF9JfyhwwdPXZf7bUXFnTy+y/MSPSBIwI3u/3/WL6LmVOF2y79OYHwpbUmUSAP1B
 apoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874598; x=1782479398;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyQpzKbExiusE9kCIQBpIVjezDAJyYtoBUFbitbxGPw=;
 b=FN1OWZ1v1FQ7LwNv6xHH4TAvOFLibPylRc9nll4IfLBXZzXTVl33oUXz1m5t7HDuLh
 yjmsDFBo4BIgPbZloKf+4NySyG+XrlTeISJvZ4VOvGGKkKhzAPExtdXJlMkyD51wwnmg
 YFcVKUeTpuqo+i3wyN7jAT9boQKUWGLCfnafQbFJ1jDTHhCcOSQZpmF04VP0OmqWA3vV
 YhZ7S08ObQZ87zazLBe3anQ9gg8LEiOFlP/C+df9dZxT0C9fqiEg7t92qL8PMgRB8teO
 lDyynnJp/kA42I/oCphF4gdg4CvxgyXOt6CBPZselX4hxTzkHrqPvglpL7oW2PXsHxBf
 q5Dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xrzz81kg6iq66FKtETdjSzZnTHUTq81Pb2sC255YGrE3sp9HAbrxPcfyDLZZ93MUuHaNH8J0xKg==@nongnu.org
X-Gm-Message-State: AOJu0YxkuyQBS/68GdcWZE7ii57/IETP5PpG0Er3bEy98t7eAYxtilPP
 vROu5eEu672Uzdgr5X2bP3BEyEG5G2ojV7GzlAYdfG3onHMCGqj3EvwI0JlRo8jRWJ/pFMqi+k0
 MInkKViuOaBltOKJrY6ixmsxFPivsz//86SOAC6CAYA==
X-Gm-Gg: AfdE7cnrKciFl3Eyn5u6SCaSiV5Fg8cZyFIIHA3VitVmMvbDfpUDz+V0D0y9pI3AI4i
 rH6IG6xSIbhKEnoKn6PezrHexjw8svNHX5wCb8p3jPnf5gOaMVYBzztCErK1pz+0z/rgdu1iYpY
 p4krcosxht8Q3hH5XFRzrT/V3drAQZhFlztQ2mQrg3fUTtIGwRthhZIAnKlnmpPRMxyl69AkGAR
 dY3PsgkuasTJBdY4lRci3hvwwmzwQKYtF+40hwpBAgA68QwAhMH6HsAqXCsi2NB3qXcO8/5wWC9
 TG3tHksJ6dkbxd2t4fo0iahQ9mAaoYlNaHWeI2MCtFUu9f+RwdGfWwSXF/Ubks5MWt8=
X-Received: by 2002:a53:b00a:0:b0:65d:bbff:41c6 with SMTP id
 956f58d0204a3-662fc91fe61mr3175084d50.24.1781874597917; Fri, 19 Jun 2026
 06:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-2-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:09:46 +0100
X-Gm-Features: AVVi8Ccb6l-CQdHhaUjZqhHvT30ukc7maVpMKHT8uD79ZRXahJADRAtmjGwHLlw
Message-ID: <CAFEAcA9xiMePa58V78LumvGgPNu92dMbGHvPQRQop5CAn8TzUQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] target/arm: Move tile_vslice_{index,
 offset} to vec_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Thu, 18 Jun 2026 at 05:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move in preparation for being used outside sme_helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

