Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2892ECA0EED
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 09:15:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoIQa-00079X-PE; Tue, 19 Aug 2025 05:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoIQZ-000796-19
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 05:14:47 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoIQX-0005Oc-3e
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 05:14:46 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e93498d436dso1908789276.1
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755594884; x=1756199684; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CESW7VGCTTHnAq7au0SyavWSIW2u3mzYgkLlj/DVA/Y=;
 b=mfS28n740q1lhBnmPCAUsdCPzxWTdfsLmmxww686aSplUCHdZlrdcK/KdggItA9Q5i
 v7b3AYd3bsskH2mb8Lonq2xzwTi3mBAs0G1/ijVv4fqxmqft6ZgqEjmTn5cgt91Ze5oD
 p8rvKboUWM6GvhTkUeM3FPEhOFcj7X6h4Cyyf0Sg2hB1yPNsGCVZrw79p5HOMYo2tsNs
 q4GL3vEwGwdV6eA7e1ZRP06OQwLtAQaSnoZz3thgiGfkBz/xqRZeuR4ETiLJAb02B52D
 upzm0NVr9Rw5C0hCtwRxhadvza5KCKJqCT2csHXXpR8EHxTq3sZCHYp1U5nnXaEKX3Iu
 KosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755594884; x=1756199684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CESW7VGCTTHnAq7au0SyavWSIW2u3mzYgkLlj/DVA/Y=;
 b=HNW+ut2oyciXBhPK8l7gYNdq4vtZDTqYCmrC8oTnChb6jyyDQNO8jIBtoRw7b8aSfe
 ByzIpnOj58ELwGeS2T4ekd5nl72yJn/dsj6OgX8fWiiPzxlEj8fekYemVBm+3exnUcv4
 tdWEQQv8tiirW+EFjki+4LHoY0yXoiPMTf8iNRlNtIZG6OMLtgr9jbIdOjtmeyHIP8bz
 INBrTU8CxsM9UqohxbarbR7z7ic29KZwpIWPjpj0pUISxSCPSkcR6RWA+tcvVM8E9iVd
 wttMlHcOb2LlfTxjD808GHvZsFCucly1FvH+qXbxdjr9GxiQEWrjmHqDsU1l2FFaGzCb
 ducw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxfaT+ehyFSXzpMPnKoVWCWYguH2g9FhRDwICn9BZLtsT5vpFmZy+NWhkuyw9EdHqwWLfOw52+AQ==@nongnu.org
X-Gm-Message-State: AOJu0YzQPOCFgJLDvOzHYbiAsaqrQSG+WK8Gbrn+kfKiHaImaQVmDkYY
 Dmak6yG6RzJmO1ha3F8bEeKXnf47Nj96OJadr3GoqLzv1lDBlLVyGtiCciWorUx6JbD+xFBVu2U
 FV5tu4V4C5lX2rpYDR536pq5RFBw9LO1aGqz69uVFRw==
X-Gm-Gg: ASbGncvyZF0FaJ4+CHxUN1XosWNFcRcODgJxzxwXsU1iPTG8cl/eR+qKNsA4R/f0gs9
 lCo+EvJclg6uX00S43CZ3/g/wfF1nnmP41WEurGLy4opagLvcaqLOn4cIqntdSg9IdF3RnDOnEV
 gDEjWr0o90EYE8/QCXwgWvLH0nOIz+7gldlfmLEWIB8MIzYKDpS0nmgvX0ihJ1S0tg0ODMMA8ei
 vrx+vrn
X-Google-Smtp-Source: AGHT+IEmoCDuM3gQk98t6riysE7U9ElvVemLAg02113KVnk6EXHCYnXxiM5MnL1w9fiJQNlsO61ZSsZ1RXdpZt2IuwY=
X-Received: by 2002:a05:6902:3202:b0:e93:3c43:543f with SMTP id
 3f1490d57ef6-e94e613bfdfmr1882051276.3.1755594883992; Tue, 19 Aug 2025
 02:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
 <20250811193654.4012878-2-vacha.bhavsar@oss.qualcomm.com>
In-Reply-To: <20250811193654.4012878-2-vacha.bhavsar@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2025 10:14:32 +0100
X-Gm-Features: Ac12FXwBV9AMK0jSwH-MAYhFWdW4E4idjQJrI9VqRKFN0uXsr5KZBtcwinaLDjg
Message-ID: <CAFEAcA8NxNssTqcE5rgeZfetVKbtHXkGEVLfHP0xyFYmayPU1A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] target/arm: Increase MAX_PACKET_LENGTH for SME ZA
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Mon, 11 Aug 2025 at 20:37, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
>
> This patch increases the value of the MAX_PACKET_LEGNTH to
> 131104 from 4096 to allow the GDBState.line_buf to be large enough
> to accommodate the full contents of the SME ZA storage when the
> vector length is maximal. This is in preparation for a related
> patch that allows SME register visibility through remote GDB
> debugging.
>
> Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
> ---
> Changes since v4:
> - the value for MAX_PACKET_LENGTH is changed from 131100 to
> 131104 to align with a similar update made to gdbserver
> ---
>  gdbstub/internals.h | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index bf5a5c6302..87f64b6318 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -11,7 +11,27 @@
>
>  #include "exec/cpu-common.h"
>
> -#define MAX_PACKET_LENGTH 4096
> +/*
> +* Most "large" transfers (e.g. memory reads, feature XML
> +* transfer) have mechanisms in the gdb protocol for splitting
> +* them. However, register values in particular cannot currently
> +* be split. This packet size must therefore be at least big enough
> +* for the worst-case register size. Currently that is Arm SME
> +* ZA storage with a 256x256 byte value. We also must account
> +* for the conversion from raw data to hex in gdb_memtohex(),
> +* which writes 2 * size bytes, and for other protocol overhead
> +* including command, register number and checksum which add
> +* another 4 bytes of overhead. However, to be consistent with
> +* the changes made in gdbserver to address this same requirement,
> +* we add a total of 32 bytes to account for protocol overhead
> +* (unclear why specifically 32 bytes), bringing the value of
> +* MAX_PACKET_LENGTH to 2 * 256 * 256 + 32 = 131104.
> +*
> +* The commit making this change for gdbserver can be found here:
> +* https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=
> +* b816042e88583f280ad186ff124ab84d31fb592b
> +*/
> +#define MAX_PACKET_LENGTH 131104


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

