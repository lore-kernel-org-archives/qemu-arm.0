Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1128ACD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:47:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZZP-0003dO-PI; Fri, 19 Jun 2026 09:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZZO-0003d8-Dl
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:47:42 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZZN-0001jM-6l
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:47:42 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-662bf1dab83so2599680d50.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781876860; cv=none;
 d=google.com; s=arc-20240605;
 b=FOi2XSFzlHSks13b0F21gIGAPuCrWVbHz5G5WjzGYjkCUbCOOv9e6qGMSDSqI1U8Ge
 ncLPz1vgtM+yMim9lNcLMZwlVVgdWDisZmZafTRePzlfwFk4lyv8/0Zgz35j1eo3t6xm
 ThwAR8ytihRxQdmBBJBpnpcq/pGSWe8BBS/himVTJO2ByGHhj4GeLtlNwelvYqmw5Y3/
 T0iD4oyqUcZnweehaUFvfx0X2IDHSG5SOUkl9Z/DqyCs7p8E7SkLWC75wn3h6sqtiMEu
 WXZNPejHFtcAqidqB3SYDBphpT4c3r8PbrxU/QcHtAqSRf9QM8jwUA0N2WVbuVOyX4zw
 zhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=URQzZS0Jl8tMQUwbL1jRpdDDy69l4cqlAxrqHuJCDII=;
 fh=jb6Xvxuyrik4N4llOObz4QfH8D5IhPPBQ5AkVRnwsyQ=;
 b=Kp5tbUhBlBOLy+JWxHx3uXE8aqm57ye1vrqWW6SGf4iVTFYjQ0Ma7lYGomV6D+aZwk
 5bKgV2ZIKQSalOFRtJ+OUKldKaPMA1XmgwGsBpwtfIbYMiLpb2IZMzaAv6j1MAS117Rb
 CvpXHQ8UnqB0KNu7PD/3FCd85oEUIBwp1nFIUi/vhcx/bSYhSf0eXPudXMcAv3+c7SgG
 sP5lqHfoLj2aVwrixATp3waaMUUHl1P2EV0AbnOAVoOBQqraUj++ojZE2ijqrrg3dybc
 p+WI40k+URhb9SfRXim5AN5qt/xU8Q9v5YoQq13HPy15C7FUHmLAnlSmFdgoj3xiI/JT
 yVXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781876860; x=1782481660; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=URQzZS0Jl8tMQUwbL1jRpdDDy69l4cqlAxrqHuJCDII=;
 b=vNER0YcyWGUXgl/SvpcUbk7llkfVXEgOf1xns4qmU9MrpEQpm4Wgk0EbCOQbzh8iLI
 MYz++C3SJKK0zE0rAuJ7m0ard3l8JJQzHnFRYhHlB00MCvEaYMKK8rPcEtx/tkFYADb9
 ncZTWxWcsVbIHWaYaC0jgmZgz6FPJD+rPEueur398xELyhIGObzapAafxa4B/l65DvC3
 PyxBQtjT/NzQx9Tx5e6YZPT/qLzDaCPw89K6Sur15nMbj4ZMemiUq9uMWKNtKinEZZTB
 Jxi716wQh1QliWcvN7uMZ6XW9A7xoJ+Pqj4vQ6T8S3n/iDFHSTIVOTMNMA+LKTAp6QJV
 0UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781876860; x=1782481660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URQzZS0Jl8tMQUwbL1jRpdDDy69l4cqlAxrqHuJCDII=;
 b=eR5tHVCbJUXoa5BtfAHUMIZPgi4ZFrcf2fyN/f1sf7G8cPNxQiNTOyLUDP+QHWySuD
 gjeATe5TR56tPg0wy/ukJ3JRl1NxX8SFu5qBRPZJkEvXIyYm5HdzLrDWoPDWQWhalqQz
 QcyV/oiy6VHEtWWu5KW4/zv8e/IfDQpKZVxqzVwdAZFHbO0lXd817sK4oPPKTacvYfAW
 26uMp/WUWVirItEAoq14FSVBz6nNiEMPtJbfiOSJozoQ8EuOJ+SCEwN8VaHREm/EnFzf
 RBayIsGSE+X8GEBetlicTfm42fPWi7f6CbOciEhVMy+IJwNgMy7ncJQgxLHFvdKlbEbM
 AcBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KHU28ZXgyeFea8vgYdrTiD8tN+8Y7tbWpT4/JUJfQ+6ZOKcXbXHgxfuO6ZgYoaljo1TgarnLqyg==@nongnu.org
X-Gm-Message-State: AOJu0Yyb96b0BWf88hlTLsVDKwQhhpCSfEcZBlTGOi5u5HKfLgnmOnd5
 7t+xPRjC9gyOrU9bXnSL1F0jtGDTokYV0NFNwXW75q7EWfeQLZrapynpfNPrx1JFvTaO9VT55gp
 48IFl/mGJnlersIhFkZ6kBnmmJFbNuWM/lTO5z/vq9Q==
X-Gm-Gg: AfdE7ck0GVaeDT9AIKoQXZgVTp9UBc1iX5L+UL9BKwF63y1F9QQhe4K03gCwRhj2U8z
 iXcqaU6rpLn8EU7f2v1LzOyckAPh6+Daa9gR4kcb511mewvzZxc2i6AtLwTW9DpXdwafafy0AnU
 EX1fullMfD7u3IIznA38eW6XUMD+PYkFZdDG37pkz+7hUJGATbG28t0LJyb6rvMgqtp8C8Qdaab
 6epM/lhPPjr6hzrBY4xdIPX+YGsq3fyWXOb+qzRK7oT+NDg+cvLtgnS6ncMVeW277086l0nGyWj
 4KYJmgzIvVIzTpiuL2n47E6T4tVyiMBWfy58INfKCyaqTWYn4MpGTedX
X-Received: by 2002:a05:690e:d04:b0:660:6199:2278 with SMTP id
 956f58d0204a3-662fc252ffamr4089022d50.0.1781876860108; Fri, 19 Jun 2026
 06:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-9-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:47:28 +0100
X-Gm-Features: AVVi8CfpmVV_8kk9FMwZx4D0NypuGFpcasucOVwZdz76jUv0FtPc-2e3VPkLS5E
Message-ID: <CAFEAcA9UwdvcP2QvXThe+God_z_6wH1T1XfJ26VYON_hYTh-9A@mail.gmail.com>
Subject: Re: [PATCH 08/10] target/arm: Implement FDOT (multiple and indexed
 vector)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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
>  target/arm/tcg/translate-sme.c | 4 ++++
>  target/arm/tcg/sme.decode      | 3 +++
>  2 files changed, 7 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

