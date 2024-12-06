Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp974669njb;
        Fri, 6 Dec 2024 08:28:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWt0cWhVvc2CAcNh5SgtYiji5wEDNTtpunpnN1rh0wVJ4eI7WoT9FsqiyxVnNbCfmFlgTo7n2D7t95Qrw==@linaro.org
X-Google-Smtp-Source: AGHT+IEbM/GrkKgJCSK6cUZWjNb0KTVNN8v+ZwYiJ7tHuJyrgbEyIgc5JGHOnUYidH/c3BLDOr33
X-Received: by 2002:a05:620a:1b85:b0:7b1:1b47:213c with SMTP id af79cd13be357-7b6bcac8d0fmr566830185a.10.1733502533325;
        Fri, 06 Dec 2024 08:28:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733502533; cv=none;
        d=google.com; s=arc-20240605;
        b=R0oO7uL9ApigMDzmWNlPioe96JdZtQsicqSyBfyG+FEWYfSJaP4jDrmHyz5wqLn/Ow
         00J2wri8ndH1YZ7ZjbkUs/ejbOms06AFCv/n9WyG9JudTK9Q1a+79fD1y4cF8W2CuTLJ
         MSG63pP//IWKBq6hc743UE85fuFtzLKhefTpH7+YxjGg6PUavWgKtYoAq4sS5060Z/cO
         CXV84p9sMp76+qae3iCZ0EVeFGg8V6WT8CL3n6OEGK1N91jPKd2qeITw3qcUj+pCgwxT
         qypi4Z83f5d8PPMNCZCxPLhj/oyxtCeXbzNErxUMe8aHytUY03qevwVmAIrQ9LYwT3t/
         3igA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=n4zc+zFY1e53SiVqiCln0zF3iu9qyju5KxcsrvIDbsc=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Eu7UoNgZn3WACmWWyRcZP/BRt/u9P9a6Cl3rO+S6iqiiB9whaRAZhMBGizz47edaxx
         sr5V7+5ej/E/HOYgkYDkwC1lbardExYMhi7cBuD/e1Y/6emLLGt/Stufl8zU4Y2p7Rz3
         trRSX+KwuPf+YFDM4QKOEOPUPzrSkfkL3xLiUBlpi46Odg5WiR/AqrM+6iD1+Qwu1HHf
         WkmS6agN0DDfzY0PNuyysoGI9ofbbvn9MF3ggAELa0Tz2ZGQ80qa2Od0TA7C7IDtGFGE
         CnK05gvcRJd2Z3/d6vHI1tBet+yLH94s4+8jbP+e6hoLPvJy3/KGYtF3G9b3iaXGLrUx
         /uyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gP2Ydo8E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a51851si457394585a.136.2024.12.06.08.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:28:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gP2Ydo8E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJbC6-0004ww-Cx; Fri, 06 Dec 2024 11:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbC4-0004wK-Dq
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:28:40 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbC2-0005Z0-Um
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:28:40 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d0f6fa6f8bso3195846a12.0
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733502517; x=1734107317; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n4zc+zFY1e53SiVqiCln0zF3iu9qyju5KxcsrvIDbsc=;
 b=gP2Ydo8E7w4sa0tPrbSOrhq0XchvaoNVrkdE1x4Y44ZIYYGJADApGKSvJlPmcEcqng
 uMVZMkd5o5qnot7PfAj355doE1QFAX90+TYmWejpLbrf08c4ylBH2FiOQ5/3jOXmCOLn
 RhoBTulsSFZclHGtYlGBNpIamnrHxvmFyyWFKIoUihsVz1E7400b/ymjZvZKDbZKZt8a
 ZOkXxBhI51RDFk/IojL0+CCbU3PhSJ2d6OHHm/Ns2sFGTxgBNh/du9VKmzSs7XxZv6n9
 gjp6fB0vJcFnasAQg3jZdM/h9rUPXPUwF0PdQtEqBBjjwgOKRLg/w3jIgWQiARakOyZS
 y57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733502517; x=1734107317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n4zc+zFY1e53SiVqiCln0zF3iu9qyju5KxcsrvIDbsc=;
 b=GpfoFZ+f7P66TiqIKTKlh3DpLEzdhscUWnot4mSjqRjDofmUM0WdcKDjj3w4gdWYfR
 jeerBCjKE+rzDh6c18vwdDBsbbBQtRcvFNmrl3uHiKpwHW3/BV3fvyJ+T37V64LLV/aK
 eAqi8ge2K8lzGcNOymfYLKWUHgWEcl5cflGnsTGIMrM23BJ0vX7uEFpKQW+ABNNLslMu
 /8cmi9N314kFUKWOgnqebmMakwMY9d2NkZfK8paPWBsr2RbQbAqp1mmF7JIecXKL/zLi
 OkFwCnZiDWWetpIcf3Cs9ElfdDbomQbNRdA/+d4rSiv9PqLbUSSCB5qWZUlxBDc6ofni
 sG6Q==
X-Gm-Message-State: AOJu0Yw9n/CFZ8Sr0qMG4FIh0pf0T+Whlir9raGeaXFhaXvndxbJkwyL
 BV6C+azbTAYwjMAWZ2sAeX5dpFveKHBeOOf/L9DFIMYSyd+25wDYlX4j8P/5VY044k9tUXlyGwa
 yvlnnBpYMGRM2iM1rRX0cFsZhFgdaV6FkVneSTg==
X-Gm-Gg: ASbGncvNXo8ae7qws+zN4Zcvta9pHkSKMxhuahkjkl1fpzTUF2bt7zYqyi4tnMjqS3I
 /avCQVAItLzN890RyzM2G5GcrH1aQqxpT
X-Received: by 2002:a05:6402:354c:b0:5cf:d078:c9dc with SMTP id
 4fb4d7f45d1cf-5d3be763173mr3866365a12.22.1733502517259; Fri, 06 Dec 2024
 08:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-60-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:28:26 +0000
Message-ID: <CAFEAcA9j8qa6ciVVTdEUhWOBnOWjPudBM9e4iTwtHKNv_S9zJQ@mail.gmail.com>
Subject: Re: [PATCH 59/67] target/arm: Rename helper_gvec_vcvt_[hf][su] with
 _rz
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U1DEid5j03oN

On Sun, 1 Dec 2024 at 15:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that these functions use round-to-zero mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
