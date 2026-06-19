Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BF8CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:55:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZgR-00066F-53; Fri, 19 Jun 2026 09:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZgN-0005tr-MT
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:54:55 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZgM-0005Gz-Ae
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:54:55 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66077e90382so2231132d50.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781877293; cv=none;
 d=google.com; s=arc-20240605;
 b=Snqk2OY+N/qd/3raG6rKGhSzk3szNB4X/vVIuVopY7Gt1tBg20JFFBDdqR9zX9yCCd
 X7esn9mwG43a21b7+tZQAe9IiV7ckFS/mfXpn3+D7dS5x6PiVh9iuV5Ny+oIX0ThzbJ6
 WRz0E/i/KL0Bkdl0sOKvRoGnUh+bHqLlTwN/T58A906WtyLzy7jJiFq1tIXX2JqOQqVS
 XWXAPwO/C8PfeQ84NMPQNOgkkzbnKW+YtZNazUoATM8fhih3e3nV1fCooWmMVj/5noma
 +PWQCZLnFXNxTVXCkjh9HNkKpXqKLRowtnDHWPg2vz0e27ongg4RjXkC/l9lGAkoD3Nf
 qNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GbMj8ohN5hSH5sEwG9AhdJgrUsTXPcM0/iSaYnRqT8M=;
 fh=tYZHfxlKHnKcmLq5WiZAmnVuQ+3t5IsQl0+Zg+y2lis=;
 b=c8jIRsAvSZvYtJl2TcLwzdog7vn/srv+BHwl/BGEERpSgrMvVxV3HrRZ4F+iWtf+2Z
 AIAOHYX9R5CG4GGZG1MXqN1V726UBMEAuaiGR4rgBG6VW6cppH2C8Q5LQVxwwCZ4zt4F
 e+GNwLkYU6nhOl7J77kDJ1/X6DmRg+s5phukWimcfBvbtzF3/VMsU9lFNwHR+X3t2hoV
 Rc0KmrgiTP3QY4fjlpubrBf7h3d+lGNXKgT6K5J4+JWBH3+iFntgfyr9nJTYD57nQGjD
 JjVm61RIeTAHvTfw8+H9om44cYAdqeduDjKzxFTwgB63W8wA5m2muJ+uUdwUEs+BnK7s
 M4Nw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781877293; x=1782482093; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GbMj8ohN5hSH5sEwG9AhdJgrUsTXPcM0/iSaYnRqT8M=;
 b=uJI1pYWvn3abWGfGvhngSEU9bgtkD7ReAYXVKtoa+7p8NIczOvfi9/wWHRD2c/bVaY
 dVyhbGJbajf2plbfMhTIbbYsocy+G5F+pxh2aIt+rG1k1hTcuJiIz2bUnCgaFP4OZPhX
 z46xEGGTr9Aypa34W/tzp7jR1M+aKG9QA5s3gBlAdiKNCTgHxf21cF13XZwqjVkQnYrx
 fqBmqiE5DxuWB+ffI5G/xIaChL1HsNjJi2vacnOBWPSkzYfiCoNdXkNwj+/YII2D+/FI
 P3w4cD/wfxSXjkdNwgoYQxFSvPs/KoVN5npItsx8yCzHYnhSZiuJUS2XZ6zSZ1YawWBr
 eaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781877293; x=1782482093;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbMj8ohN5hSH5sEwG9AhdJgrUsTXPcM0/iSaYnRqT8M=;
 b=TlzNm1g/gTIhBc9+2oWHKniIa7Bgu+rUsKalR8X8V/AdcHI2uSRo+E8W1dNgDQRk8i
 RXCPaY0dlWPBB94L9bWF9q1D56P+ve/4ZUsSHEM198cM+H98W5SbR6PhY9QyC6IRWgeT
 X6MIzRzExSEIO2RDBie0hACSIzV04E2z54yp+4m6ewD8Kid4f5183D7s+Cbf2OiJHn47
 dAVYxLPiurD4S4wwZN+NQsiXQG0VF3JNKCFUeXWJe8hvafmlkvQa5VncWqHfMJPzx5v1
 cD7vuB+NEkIfGeXsCZ5UJWFq4J/J1Ne/IW3mT9xNfCmmyNVe6b/zAX/ZhjwNQqxQJi4d
 hGnw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0Hlk3tzTsksGO7Z/zJdHnmrlTLYmcZJBn0Hbw6hDbz+H+hJnqJq6oErWAEekqSINcyTIEEusupg==@nongnu.org
X-Gm-Message-State: AOJu0Yz2SArd3OOb5Pqmq5L5Rls9MEd0IbUH/7o2UMDEHADgXYoYpoNZ
 9YrAAooY++v5nvSbtasxxL8x0etRYL2A7QQyRJ/V28NepRj7nyLUPY0kU6cRRT2dnAzRzToG9kp
 xpBictErD6dA1GzGKzL6FwOKqeTDRM7yh5JCDNNBFew==
X-Gm-Gg: AfdE7cklWs7s0qOQ2Yo2IPVyuc3uZaSuQUZFKAzQ3rwPgoEGNLXtzwPF4kgxsXO+NqU
 YOCte4DyEiQaxa/Cd/gnkJq5Woxcdx1rrzYwdxrcGuz1HwycUGmNq2y0CO/lXkcG1ByXtWXsVdw
 3sWQHMqHq5givsxcqGMQ/g8fPKBB7HZwc/WJEisBYCxBjpi7k6EX+KbUqnFmG7p4GWaYkvFdOQQ
 xcHCGtXEiA5EBOuPGKMICGONo6dQiQVMq0b3vN2Y2VBcqoq5gPay0lPsNkVFUUH4kILVZ32adDX
 UvgcgxkSoszDeiU9YjGUR2pi+/R/MgfG+d9j2K+M2dBv742yEqIYbKWo
X-Received: by 2002:a53:b1c4:0:b0:662:b984:a5c0 with SMTP id
 956f58d0204a3-662fc91c8afmr2915774d50.18.1781877293106; Fri, 19 Jun 2026
 06:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-11-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:54:40 +0100
X-Gm-Features: AVVi8CdQf0qlH-gfv9Zf8x6Ugw6eIuCufMPTh2iLLh6RWpdeCmqQZahl-FAXzhI
Message-ID: <CAFEAcA_K8C4x7jCy3afb-NFH==38a7-KoiwmwDTAUXY8qxfeJQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Enable FEAT_SME_F8F32 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Thu, 18 Jun 2026 at 05:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Are you going to do SME_F8F16 next? That seems to be something
of a pair with SME_F8F32: each feature implies the presence
of the other.

thanks
-- PMM

