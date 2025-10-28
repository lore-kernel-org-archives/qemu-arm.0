Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6219CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 14:42:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDktf-0003rA-2E; Tue, 28 Oct 2025 10:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDktc-0003qO-Vd
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:42:01 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDktS-0004Kp-Ve
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:41:59 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7832691f86cso82594607b3.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761662505; x=1762267305; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iyKdWtJR72+snAX3FSL8Q/xq5Z9KLMJkUmvySwtMib4=;
 b=yiPJKeiRPn8We9E1WIRyRx5tSrjhq8hdwpBb2PtCijOwsdPvZmdrHCk6K4slbvtX2G
 L1SOzUdCwJgnp2bO6+F8n/jr2H3MSoE4/JBnTDSRoi6bZRyA3+A8tkd38vNi0ezXZ8wJ
 oPCAxiArPUY+DukEYR5KqPPeJVP1EdioNSXffKSGHUxDYGZN2Evr2ZVVM2AQoogVb71J
 94exRFXQ+bFQ3jkVsilWdbkGsRKwtTo2Ie8eOT/N+k4bYTrhrVP/DTrm6c18YQUT9xbH
 od3G2Vd7WM+e6KlcCLVJyOXFdbcSIRsC8NrbbW+G6Kqz4zCncECgNnBudzxZ4alFJGZS
 XQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761662505; x=1762267305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iyKdWtJR72+snAX3FSL8Q/xq5Z9KLMJkUmvySwtMib4=;
 b=qdFjSWnnxHnvy76HO0TsgMKnYosxG9A9d68HbgRP40Mlhk2z4h3bw3A7m3yDN2By6f
 Q8HtfqpWZLCsx8RfRIAXwvbGPAF8vamZ7dBU3LKIvtpEgHz3/7N43zzrGVRWNYht0jhu
 mjrK5QqcBQhWpGVNKIZeQKKS4/TQRYv5F7oqigF+1yweiVyGB3MPKvSH3AocNEMD/AFg
 SSzA0ZKJtv9R5/xdAS8bwopeO7agKrvRm/16uolBw6m0QiEZhg7s6f7mM7p4sPHsuug8
 x2XLEbmEiuUpo72Q9vRtre5gl6aZFYPrHXy1P71d1e15C9VcuLazfTKzV0zbeWm+tSTm
 7mdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEEzB7yoJKTU6uv6/qlcbqynQcqFchJrvoIDqFlDqgOr5XYRpRmZIp7iVpd84k9EkKQjkfdsHahw==@nongnu.org
X-Gm-Message-State: AOJu0Yw73nWHEtcQ/rtud4evTlsg7g4klobG1kIUiLyCdeXwSdUqheEe
 YKTc2calWxq2z1XimnZ/jd5gs6RNjhCgBG6Qlx0T9z8NFZW5MR3/1KY0mYsNLjtdXfRZCU2GC4T
 +Aw+SDgoPaFhXey1bGypaAi7i4+DfuqmtEdnU2dJmpg==
X-Gm-Gg: ASbGncuW/SfpDFUAgt4a5OeBLnBvpXIEwPoHJSbr+dC+LKTBDB+Epox/DCFnPYpcSdD
 W+KG39oDGb14Lu5zUr8W+EjysmzSWW8SvAAbuS74gqgL+ZrRhrLmW+CkI4yoBKpVXtyDiIF5A2G
 byOiKtnap3nFUkcOmUzUg7xWuwCIJtqpjo8MeGOYniFWaGx7Erhr0bKiPSb1qyNlS9lEJJxa+DA
 wYE8UvG7ZUsl5tS3dJHPLHQ/UuG/XQk+OOlDq4wy2Ociofx5uu14unrxLoeE4UhkGITC+7v
X-Google-Smtp-Source: AGHT+IGkbmNFb1Rha/4Nz4C+7L+BbIDopIj1HMt7ZG55RmNyXD0eno33viIVPklTmu0OkFPEVga2kwU2bFEnOSqQFnk=
X-Received: by 2002:a05:690e:1a98:b0:63c:f5a6:f2e2 with SMTP id
 956f58d0204a3-63f6ba47172mr2671427d50.68.1761662503902; Tue, 28 Oct 2025
 07:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-21-richard.henderson@linaro.org>
 <CAFEAcA-tVBn3g185gzs2uOCnYLeqWN_zwfeQ0DccLf0n8BN5PQ@mail.gmail.com>
 <686b4a77-cf53-45e8-9b75-2b8dd9c4a67f@linaro.org>
In-Reply-To: <686b4a77-cf53-45e8-9b75-2b8dd9c4a67f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 14:41:31 +0000
X-Gm-Features: AWmQ_bksQFuwuUmpf-dz6pDXgRpkcwgxaKEk4Q7_QQnndZXOkQXzzUZ-C8IiAro
Message-ID: <CAFEAcA_gczP+RbKUx_p28AWN=s279rPLYaZCXjy0Bpr0NqPnPw@mail.gmail.com>
Subject: Re: [PATCH v2 20/37] target/arm: Consolidate definitions of PAR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, 28 Oct 2025 at 14:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/20/25 15:31, Peter Maydell wrote:
> > On Tue, 14 Oct 2025 at 21:11, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Create a function define_par_register which handles the 3
> >> distinct cases for PAR.  It is easier to understand with
> >> the definitions all in one place.
> >>
> >> Make the aarch64 to be the primary definition, when present,
> >> rather than being an alias of the 64-bit non-secure aa32 reg.
> >
> > Doesn't that break tcg-to-tcg migration across this commit?
>
> I don't know... possibly?
> I guess we have a test for this somewhere, but it needs setup?

I don't have a test specifically -- I tend to use one
of my usual lying-around "boot linux" setups that has
a qcow2 disk file, and then connect the monitor and
use 'savevm foo' to save, and then check that -loadvm foo
with the new QEMU works.

thanks
-- PMM

