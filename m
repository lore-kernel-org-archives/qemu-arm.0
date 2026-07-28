Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65055C54F4D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:40:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokrI-0001oP-K2; Tue, 28 Jul 2026 12:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokrE-0001kx-3H
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:40:44 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokrC-000532-Mz
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:40:43 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-81e6f2ee60bso15271897b3.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785256842; cv=none;
 d=google.com; s=arc-20260327;
 b=PiqjTXLXy4eE4Yk/C6DkEhl8RbMd3oIl+gzEv038LMWD6XWhQB49bsRP1OEv9G6fDV
 h+QpXsYKD2cWAVbHau/eTlXy7lsGZJch+Ca/qsi56BAK78xRNdLnenMQGZV2YhR0Nxou
 P4dYVfSGyM/sggJEcZVMhSLaD9wUB6DQByB+wzq6h0ALfnj4f5hT4Z3amME8sIUNnzP/
 7Vf+qgWKEGvcWxZdxrRWlO2JQYFFGGXRji8oC+o7J1DjZNf4r9Bt2P41t/RHGigLXQWt
 TKdlzmPvAFW/vyfWzwKR9COhnUF3OoKLzxi6MtOPdUcRpbqCpxbWjyXimYvW1m3Lwvhw
 wP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4xaLGyZJCLrr64KtVZXpMLwebt0UyZHPNQWzO5gDA10=;
 fh=FWg6HqwpqJqnQR11NTux1DiHljg14U8DtIWP1UQ6zJ4=;
 b=mjjdrOFBrPU7F3cUt9H6035uWsneIjxIU96tzzo7PnWl5J9aDkFBhsqf1fYrGgY8UW
 uuZlH3TA3ZWewVhAvO3+bAn21JSAYBnYuc09+l6cmcFeou2kjK8Pyc15XAJiaQIRZqlw
 fqQt+UW2BNW3dqoyuUn9QQI5CVWYhehDvxWuJMbVXDqslYAFNOl/viMdH62Bn5Bri0+G
 kS/e9U176tKHspaTkBUTV8RITGQSzXLwqqOzj3LHW2yd78FgE83JN7YIDK6Ik5GYhE9p
 fUvMxiDyW4jmUoYqhjVscF+Lq+Q/TY7fXIDBIIEjtV/KYGFGGPgyU5v+8txH1ctgPUfM
 9+Sw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785256842; x=1785861642; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4xaLGyZJCLrr64KtVZXpMLwebt0UyZHPNQWzO5gDA10=;
 b=f+3gBSo/Ch1TILzE/NyboOO8nUmsSXmb0XXUf8fvXQLjoKpvty/3TgxNagGvjLH8Cr
 7y10YRHlPCB0ynDC+PM0vA8N/S4lRL1unijQHTXm9F58nVWYJ4qZkT0xiGNnJE8RW/uY
 rkoXY56gzRRaZReNMmrAB1WRPvgfAVl2ordAWpDT09wMW469WEZJbNmxCDIJG05HROtU
 3nRQ/kttxvQis6NDlwAoLsql+db0LONul5B0iINVTsBV5di2N/mO/VUpV7kHA//37001
 cEMyWhei6Nn1+VduE8Tmf2Qa1mXP/XZZ4amnTZVTyomyjO2Y2883MLLZoJd7f8t26UGc
 zZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785256842; x=1785861642;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4xaLGyZJCLrr64KtVZXpMLwebt0UyZHPNQWzO5gDA10=;
 b=YVz1lvu9X4/Z0q2XjtyCmai793mel0TLgm+sVYpeE+sgoKdl4SrwIQD+1/FX9I8nWr
 Ljr1TwyOB/wYPPa3lqtYVLw4SbQkNDODc3YtlBA0REiYg2/KtM7wAS3Ifpd3P5aMBj0Q
 K39/RXqfgGBQ4kk/OSEuFPkJOFs378qP1c+pqlSuwfWsHcFM788Y0qMMkvtD/+MhYCiR
 TxdjQa39e40cM+UtFxB6p5Mqm09cAxIExeMdko9Ww6yNVFTwJTqCqb1TZWdO5x3+gTCC
 8ynuciQQoLQ7WQiHjItzQRSa67hslyI35CdEgI/J1RFJcGLD5HDDrSg4Oa5sAG2jb9Q+
 ifSA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro0od42jXqe4KmrpOMYhlT6ALHpnTRC2QNtDQpCBpFiVVskv/haZ3BmZmIcsYX59CbyJS2++N1/5w==@nongnu.org
X-Gm-Message-State: AOJu0YzgaNAbPRsMP6oKBcaiW6mtAb00k3R63uur9x/odPA81RLZ008J
 VBVD7mglZFpneUSMQciAI09fsSnCMWgQrUqqd2pUO2J3Oz7adGk94RKqtlUSinr0dt/RkJunwHr
 iAlWvkrhi3NWWu1cmq7vFrt8w/XxmX1/c37QfZ20/Bw==
X-Gm-Gg: AR+sD11O1fYJV2DyZhjjaq3/N6E6wTu5ES1MbEN8u40Lmu0Odbq8ODTA4F6djsTALwA
 5uZRzi07dsb4HyhtLY7vmyoqlJ3wcU8jHmvEuJmJTqix3fNUqADpDBPm2PucowwrCyt0UBmpjiN
 wOOS8oGZYPy/XRaS4QwoRkeXxu5Z83+/AnJyHco2MGcMnwenXbNefQ9Ngy4ZvGJ9kNMjoL7fZJb
 V9PLmsHO3oNlGHAIBab2bm9yfaDB8Uc0JqC/9tNzxUQjHJNzBgf4oDjN3aTj95mhs2IPRdcQFHN
 rKU2AtDtstXHdYUegzVbRz6l8CvbfbZ2xTFR5FaW4gV0Pw==
X-Received: by 2002:a05:690c:e3ea:b0:7dc:3d2b:2e94 with SMTP id
 00721157ae682-81f9925f965mr15419927b3.13.1785256841411; Tue, 28 Jul 2026
 09:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 17:40:30 +0100
X-Gm-Features: AUfX_mwFAeP7NnN_Wz4s0okq-OoazT8xWM-g3TVrt-5pna4ESXV1N_IMSs-HQkY
Message-ID: <CAFEAcA_njzMzV-9MqRLA-eY+cB0_y-fGB2P9DaMzTmyt1kuTzw@mail.gmail.com>
Subject: Re: [PATCH 00/20] target/arm: Implement FEAT_SVE_{BFSCALE, BitPerm,
 AES2}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 21 Jul 2026 at 19:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260719174905.420725-1-richard.henderson@linaro.org
> ("[PATCH for-11.2 0/6] target/arm: Implement FEAT_SME2p2")
>
> I believe these are the last 3 SVE extensions present in
> the ARM revision M.c.

>   target/arm: Implement PMULL, PMLAL

Patch 19 here is the only one of these I had any comments on.

thanks
-- PMM

