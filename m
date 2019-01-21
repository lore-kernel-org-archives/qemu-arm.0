Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6226631wrt;
        Mon, 21 Jan 2019 08:15:08 -0800 (PST)
X-Google-Smtp-Source: ALg8bN458BhiVGF9TrYe5U5FU0DZqQerf/LPcUzb+ohgUULEseRxjYfSZPzMnKGAMlGzpYZAvsQJ
X-Received: by 2002:adf:fa83:: with SMTP id h3mr30565514wrr.173.1548087308671;
        Mon, 21 Jan 2019 08:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548087308; cv=none;
        d=google.com; s=arc-20160816;
        b=J8CombYTv5RKDzpwcKP8HnioEeYLOYIOdLrMvW1mKewJ/zve/CjGXhqBEaaUwgj6dM
         FhYNHnyqsGwRmcqjXauj9afGe0lyUGNy5fZ6bi++fvAEqxt5dAoa5157Um9gVzvs9fLs
         QNGlCaLW6AXKcujpxcgOuqAsgsEBw8I2iiEdkaYuKgh9RBZc6nwme2zrlX743VqhKDzE
         kyHRkEP4+hClMwdweIG0/P/1GQxoKbxoP2adXHpBDPCNKwKLoKoqykwGhTfivEAHUdzV
         sbE0MWKtIQeDsXrbV4YIHRHPqZ6vknLXYq2Ycs6stU/hSIN8H5xYDex9Xo3AJiiSZaSV
         L8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uCJFhsKnlRJKIzcU6m/G7v7kQyQWYQhna651dxT4Gl4=;
        b=RoVB8DIMzOpVaxgNVPY6xNljRHvHQ1brI7QMmP1jkqu4Bdh5pvO7of+a/yTCzqOHzk
         TEI+C8YtJVtWlWqLqxscEKaoIX00J9TVCRJn9roX0/79p0IQjnWxSdf+X5obzP4YbHUy
         ndk1g2OxBaH/v8nvX3Fz5STAZDlwtPb1Nvqq7A2QGG9WXKRHiR/2xtzU/A2ug24Pe+d8
         F+RBl1fzkTKLTJLmOsXp1lXvt5bzWvg4e0S6Kh/N20ZT8EXa5CVyJyGLusgnLE6zLkq0
         dPRh8bzkbWCLvRT5tjGE2anDX5zxNpBYAB94SKqZ2Xgmlo9YpH0/rhdrd/j/jBXhEJnz
         aWeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kYHw8mM6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si64561961wrw.135.2019.01.21.08.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 08:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kYHw8mM6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glcE7-0000yL-Pi
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 11:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glcE1-0000yG-Lh
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 11:15:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glcE0-0001mD-Re
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 11:15:01 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glcDy-0001jD-8I
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 11:14:59 -0500
Received: by mail-oi1-x241.google.com with SMTP id j21so14935776oii.8
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uCJFhsKnlRJKIzcU6m/G7v7kQyQWYQhna651dxT4Gl4=;
	b=kYHw8mM6KmOyHcdO9AfsVgg9Q3l2jZuWAEiFrgA03pheGv19Wqy38+EFyFG51LTpJV
	837lt1IT/6brPYiLRybRf+dr9455CqS0UEyI+V9SBvee/2oa0peklrwDLihqUeufPKrM
	nL/ZWL5dLSLHLinZei4C1TlOB+o8sGSBHvrE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uCJFhsKnlRJKIzcU6m/G7v7kQyQWYQhna651dxT4Gl4=;
	b=do1hic09O2LdAItqzuk6/QnzwromfTIEgUm0KDE1DLD7Z0vX4pTXCPAZDKYcldxB2t
	oW5jnkX0uDt+0dPKS1JAF8tmBXOVhK0De+UpaLjvfG747UPOakXaV0J3zV2uyaRmTWf4
	MB41ISO5uH5K+5+MRDsJglcY4JwbCCjHNBIDeESxoNLPU2MKx2R3gDbocblBqpjhrTRe
	FYuv5KN7Xaz2dRX/+BUuTCU6Jk4QBA6sVUp9zhABxo6LNd1uq64AegSX8nXFs4wcEBZ4
	amOvUEQbFFKw9AJxiBIcHQpcqjWfTVG44hw3mabbFY8eB1U9IUwsFkJM1V03ResGklSk
	3nOg==
X-Gm-Message-State: AJcUukc6zK0TIS7w/W9n5BbOsoO/ip4jvbLQlxRfD5ZRYkUPyBNZImiz
	RyR9KkAPsI0liopTMFUtaHdsXRRqV/zjF+OUJwsk2A==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr6258848oit.325.1548087296522;
	Mon, 21 Jan 2019 08:14:56 -0800 (PST)
MIME-Version: 1.0
References: <CAGGekkuc+-tvp5RJP7CM+Jy_hJF7eiRHZ96132sb=hPPCappKg@mail.gmail.com>
In-Reply-To: <CAGGekkuc+-tvp5RJP7CM+Jy_hJF7eiRHZ96132sb=hPPCappKg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jan 2019 16:14:44 +0000
Message-ID: <CAFEAcA_W8t3go-QptcEEUenWMVqGNGxsD+SJmgELTTgVktmbPg@mail.gmail.com>
To: Thomas Roth <code@stacksmashing.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH] target/arm: v8m: Ensure IDAU is respected if
 SAU is disabled
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x33lktUMM2qR

On Sun, 20 Jan 2019 at 14:51, Thomas Roth <code@stacksmashing.net> wrote:
>
> The current behavior of v8m_security_lookup in helper.c only checks whether the
> IDAU specifies a higher security if the SAU is enabled. If SAU.ALLNS is set to
> 1, this will lead to addresses being treated as non-secure, even though the
> IDAU indicates that they must be secure.
>
> This patch changes the behavior to also check the IDAU if the SAU is currently
> disabled.
>
> Signed-off-by: Thomas Roth <code@stacksmashing.net>

Oops, yes. In the v8M Arm ARM the pseudocode function for this
is SecurityCheck(), and we should indeed not ignore the IDAU for
the SAU disabled path.

Applied to target-arm.next, thanks. (I'll tweak the commit message
to add the Arm ARM reference and make the block comment follow
our current coding style, since we're moving it anyway.)

thanks
-- PMM
