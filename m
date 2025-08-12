Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DDDCA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 11:33:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulnFf-000662-NC; Tue, 12 Aug 2025 07:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulnFd-00064t-Cg
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 07:33:09 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulnFX-00053x-5g
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 07:33:08 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e9028e13bb4so4384783276.2
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754998379; x=1755603179; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F8uLajb8uVosRY+r+zfXatqPbpvh5W7ipv3kpoiMKMk=;
 b=ftuXbseD06BUJy20flZlRSz0PrD4IhSFCcl+gECaJT800R54JrE7vbJKcJ8a/zvSpu
 zgwRX3Oew4/I5968JUeau9NK2TmmzPFykCnHo2s0aCXTaf1Lgk746dg76mUs0Op5dF3b
 888QiUtxtr+otX/QR6nsghC0QfgaUK/Ic/SFJyiE/ZGQgTdecpaf3jkYPdJ51wnD7l8L
 5izndtLBz6kVD05MxC3KXtONj9ehv30YaFmteXo1z5QWopDIhI+Fa6rTxxLjeNm+EJ8l
 N7YDqZfmgorDJhwCt741JIkrL2SwDcQWNVDwU/1pZ8sL+rco68pXxPnxyax4dXKWB31o
 n8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754998379; x=1755603179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F8uLajb8uVosRY+r+zfXatqPbpvh5W7ipv3kpoiMKMk=;
 b=AUXr8+y5g7PFAhVz0ZWOmVY1AyTKlyP4hyYlilWsmL1DKYg3K0IpVo6bYSB2VRCR2e
 yzCrTjYjc+5gzxWQHDx1n9/Lr3OZsquCTgz1Y2guENtgly/XReO8GqFEuVPwXBYOI8fu
 deSaXK7Swj6cwAC9X2na5FebyxA+jpn8qVZznppidy1aKWgo9j2I23f9GYelkyU+pQ0s
 hVo/xOz0IHyNC3hwjMpN3krM77f4a0ou0b6oJc+lc6ZJKHW4wPuN4q+akd65PC/sQbzF
 ShlmmBVmM+puCfVdHiTlyqo7svNCPslKPJH7IL7gWTPGv3YSNEG4WGbmskyQAfNxkz5L
 6ktw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNZD1vH459Vh4FCPFHtle7EVj7gP/1ixCe8MseEvmCmsVc6Q8TEECSusRijLug0rUodFVw1oR2jw==@nongnu.org
X-Gm-Message-State: AOJu0YwMCvODMvauXoJxGLLJHoEPy1IW5zhBYZJse9Y15s2SdcNzJzuA
 rGsD+ErxfBmmqPdIGgoX1jpeqPSd3noilN0fcERjAnjmHO/v28tRAjaF1r69ehzcBhewczALkGo
 ixz08IrTtW1WxyPaAYEtUHSh7PpFOD+mRo9jzzIDG/w==
X-Gm-Gg: ASbGnctsPjzwdtZn0xfUyMFx7M2sGZQ12fdcbIYlo/37kC8LRtZiJfKWG7AZf39EI24
 frq4V3T7hgq7fFljE0BixO/hiCc0RMNHRT9IsC6f5Pfema82IJT7yBhIHI/LOFPFChkGoI6anZN
 +XcRx/dhCXRvVmGVZRR0DqgVsT+v765nCf/mScJ0S6i3W3/yGiHodKpRjOvbSA6JuSvo1Q0+vtH
 iuuaKDu
X-Google-Smtp-Source: AGHT+IEaMmkBLkXtKtdQAV6kTvridDv5HJMBbFCG2K39nPYqGSDfMjviQqYzGKCJKlw/753l+GCNB989zMMHh4vBxwg=
X-Received: by 2002:a05:690c:308a:b0:71b:f755:bbab with SMTP id
 00721157ae682-71c429869e6mr38360597b3.14.1754998379214; Tue, 12 Aug 2025
 04:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
 <20250811193654.4012878-3-vacha.bhavsar@oss.qualcomm.com>
In-Reply-To: <20250811193654.4012878-3-vacha.bhavsar@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Aug 2025 12:32:47 +0100
X-Gm-Features: Ac12FXxFaR0YL4PCWIlp6U0rDb4lfqZWUiDcEfYktpFfwqmCLcG__JCjlZMZWak
Message-ID: <CAFEAcA9PXtsj5nAZ47Fv3h5gDdir_QT5pavUF6-Yc1tZZP26ag@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] target/arm: Change GDBState's line_buf to a GString
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 11 Aug 2025 at 20:37, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
>
> This patch changes GDBState's line_buf from a character
> array to a GString. This allows line_buf to be dynamically
> re-sizeable.
>
> Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
> ---
> Changes since v4:
> - this patch was not present in v4, it has been added as
> suggested during review of v4
> ---

Note that since the GDBState is a file-local variable,
not allocated on the stack, it's not an issue that
line_buf[MAX_PACKET_LENGTH] is large. So whether we
make this change I think should be based on whether
it makes the code easier to read and less likely to
contain string buffer manipulation bugs.


> -                if (gdbserver_state.line_buf_index + repeat >= > sizeof(gdbserver_state.line_buf) - 1) {
> +                if (gdbserver_state.line_buf->len + repeat >= MAX_PACKET_LENGTH) {
>                      /* that many repeats would overrun the command buffer */

This comment no longer makes sense if we don't have a
fixed command buffer. In general, if we're moving away
from a fixed-sized buffer we should consider what we
want to do in all the various places that are currently
doing checks against MAX_PACKET_LENGTH.

thanks
-- PMM

