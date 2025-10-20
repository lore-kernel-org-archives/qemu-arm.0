Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FEBCCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 13:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vApr6-0002zv-Jv; Mon, 20 Oct 2025 09:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vApr5-0002zc-RZ
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 09:23:19 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vApr3-0008NI-N6
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 09:23:19 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-63e3568f90dso1195140d50.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760966595; x=1761571395; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P9egt/9Hwhp6Onvn+4vsjbCWth6QxdvUQI9K6mF2srk=;
 b=PAa+brgYY/hABkHIW3U7QkH+z8HQjf8ljsGrx3YC3F6X2XFMAGw0PCQoPZgoeDcpvd
 cShfnkoR800xsr35nuXvAsI2Q5OnroM8Je1y0dp9lFyqo6UsTXiWNK+/BBSAwaAzWqsY
 izAneVK+Qs7PEe2BVXYNE1MydiIC7+NshPCLCXjf11oVUVHEuaEPrSv0WgcD20i5dcJl
 kNA5B+x6hewKqbCPmwclA1tjwudczx84i10vUBxm5xhooCqkynesCgSX5jQSCGJoBFJ1
 LJ/trZyq/yRBisQ5ucLCfFsLRo+DN3EkVSRTSWY+BDRDKjnkUJ/k/cLJnzlwIeBgHnw0
 jmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760966595; x=1761571395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P9egt/9Hwhp6Onvn+4vsjbCWth6QxdvUQI9K6mF2srk=;
 b=CP/rEjRJdt7yJ35nKlmSnl8kAdTSdDV141hiRRoqn5ZBiaV0nEF4bg44fdRIKF8C7O
 dYPzSOKDCGssBnVNkogFwGUOoHJaPiKJ+J0uyL0Sx8GJ+GgIn6lr4JRy6XLKKKezjRbl
 tmDtk5MiA8/G84iOGc3ZRm9mORnG996Ii7cDRGUpyHYvofaxaYQ2RKbIw+nLEYNAJRQY
 n92JfRtW6o3PS+gtqViaqHalNErYBcJHhlkV3v0Ju8Ueu1qUFtHXOAQgVgc/rU/lMMLO
 PWMNuK+/wB+qmLMOs3mSlx/bkNovU5ycBfGwwqSBeiyBEjmNJVKaPEddFfaPn08NcLyC
 zpjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn7ZFv6T78GlaPpc1O/8CwS4fblmXS18MF0haiJK5TPRFhpkwuooEjZmwlFjcQ5o2jMAffnXZOGQ==@nongnu.org
X-Gm-Message-State: AOJu0YySykMnRIZXLHxr2wiU3hT0DJCwQ7tK405tSQ6VNLlT1t4BVdbc
 9QoXjrvo3fOwXXRFd6Hewt6jqmPnfAS9pNy0b1wpD6FROhYkbb+JQPazIGvwxPjZNVvhJ30d0Gy
 /HS+LRC45wE/N2BvVkmbjixJ3a1WkSwRRUyns/jzVBw==
X-Gm-Gg: ASbGncu1d/mXv4wx9RBYLuHwgzKDTTrT7m18sdLq6qQQiWoUkZxoDVqS9FppyD3db1U
 Sdp82NMHMZFAuQEyD9OI6OOolNQaaOTz2+EIy5rRyr/sfcCLp+P7kCZQv7cFNBxgZNRn/CbrcCv
 b2wSIl6BOZ0gdmc9ooHQ3cXYt1PubpbcbH8ViEW98dZMVsTMIIYnexRPiA9vffeybRRuVKC7CLq
 yNf2e6iK+3MTiv8G/WC23ARctTkAErj8BGb67zkvCG+cO72wTW6QOxQYdVhFks1y1xDoJDq
X-Google-Smtp-Source: AGHT+IG2dPtNBdhu+MWiLmeQmudTw1vZny2562UyoBM+bqLvvazAbgF3CDI3g6RP8F+3zo9+DjQyabMQWQZLRC7X2n8=
X-Received: by 2002:a05:690e:4086:b0:63e:1878:b951 with SMTP id
 956f58d0204a3-63e1878b9dcmr9583968d50.64.1760966595297; Mon, 20 Oct 2025
 06:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-8-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 14:23:02 +0100
X-Gm-Features: AS18NWA3MraPAwaI5UA27UVboQa0HDxR-eE6mwmdYplIlkFZgL3dOl1o7Qnn-NQ
Message-ID: <CAFEAcA8w6XV6AAycu1nYSqhpoOr3BsYn-x6Bk=Sybz0=FWK5JQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/37] target/arm: Add read_raw_cp_reg128,
 write_raw_cp_reg128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Tue, 14 Oct 2025 at 21:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the functions and update raw_accessors_invalid to match.
> Add assertions for !ARM_CP_128BIT in read_raw_cp_reg and
> write_raw_cp_reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h |  1 +
>  target/arm/helper.c | 49 +++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 46 insertions(+), 4 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

