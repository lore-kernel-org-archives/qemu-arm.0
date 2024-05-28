Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp48535ejk;
        Tue, 28 May 2024 09:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXm0BauFj0VsgK2CfBR4JSXy5HyR1j19NiMRtTWhJs6Gv5EkYZdT7sGuX/NK5/MVhCsKa7z6IbwOTDBMcjRZH2Q6nTYPZzL
X-Google-Smtp-Source: AGHT+IEiu3vCUYp5LgU7yIWx1jVfT21nba6VGJTLCvqJzXMifK0GVZkvFE/ynHv3yj8/D7WUcWkM
X-Received: by 2002:a05:6214:2b0b:b0:6ad:7070:4e1c with SMTP id 6a1803df08f44-6ad707059e8mr140992336d6.19.1716912171372;
        Tue, 28 May 2024 09:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912171; cv=none;
        d=google.com; s=arc-20160816;
        b=aHW+5V3LiCaBaGoJ3dE+ILm4ZyR4vfCovNp9iIlddDiGea8JGl58+Hb7jVCdhXLmA+
         glJBJiKXDIS6Kq/6arEACKl78P2XlkMw1oseweRzah9zVoGlIwbaVzxqrxmjUr12LLa5
         Nu4++ryBgx+Y0WuA5gWwIUW1+tYrtvWQQdMg5RiSBYuor1Jjxq42oY2Mr5PVWZlK/IUH
         rkwPExQk94Kuqtig+oZP9WKmOxFxj4LjXbJLZqwxrCmDA51AZK1nNkgqiSKgCT8uOdkW
         pNpAZCVbEn4AOUov+zKbN+v3gJiS4ky1puB4p6W0qAf3pnJ/E0JlslKd5wWXnBqaZz+W
         GoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=i0tBjJBheDwGGk/n0jw2aYv6JLV2VQU0vdOhoTSCcTs=;
        fh=lzqlxrG+sJ/HzncZeXBoH27IFPRJpcQOWLS73UYmnXs=;
        b=o5Djs1gbi7PP9AqD/U3ZerAbj8PBErfC3/orOVxzYSU3Dh+DwVEuUYWTsyF4FmRMXU
         4XlJK/JqQrMvVRcblenWkg96naj95Nq8M8V2tcdLl4h4B5F6W+PNn00eU34GpfFv4+N9
         DMKXFCN7f4+ATGJmKkh59xVbDyJk8yYnczKMTD6EgGig+jOcJhlYg4o9+zIh7BSqAx9Q
         vptP+Xl9Vbe5Sp+lVVy2kSvWC+u6UMTNB3BmMRwAN7RY/bse+inUbyB0ztisDAnnQLHR
         jjTPRe7s0vGngkKWU3Bh0T6hMGOnnfZLoUdWer8diNrdq5zUuYg6KMZsUYrOWm/zLAos
         GSnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D6pJWPHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b2aa9si106892076d6.471.2024.05.28.09.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:02:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D6pJWPHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzHb-0005kY-Pu; Tue, 28 May 2024 12:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzHX-0005hR-T8
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:02:35 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzHW-0007mb-A1
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:02:35 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5785f7347cdso1137348a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912153; x=1717516953; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i0tBjJBheDwGGk/n0jw2aYv6JLV2VQU0vdOhoTSCcTs=;
 b=D6pJWPHSytdHcc3DNfexVHzvhWWIOQSrsvSMoIlVwZjCuC9QlESNtYG5W7j9Ylh8nV
 ntugFhXQYCh7GHhqxK0K74whr8TtycA1vx2dUIdo2VI8jg+HOn+QO9fIskAH3+QpxhC1
 G8AArl7Co8Dxq6MuauF2bO0PmieRJv27QUrlP/SvLyzHkdc/E9L+K+gSHn7JrmelGPbV
 7/F9DR5/K42DkAAlzuGjc5Wx8+R7ecoXZMMSsVsCS3Gs987oFAzabPfYLimHNRJ5/Y74
 bzLLFwPVhM+AfpCA3dD5pOYLuxQQ4PYERikZRGzQd3TLxQG+PfGJNAKwUj23V+4Rr/rd
 0EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912153; x=1717516953;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0tBjJBheDwGGk/n0jw2aYv6JLV2VQU0vdOhoTSCcTs=;
 b=KFUfeav1cRCdv/OqaQxmnNj/IK/ZRx4nHfwj68V62KIxv0U2JkvKs7C5T4AADF6Ro7
 ZTiy+suFamFoBNbs7wxF7wjN8hQ4azv0n0+/znRdpp8BuE7sbIp069r+7ZGo/F8+Khww
 XzcMMu09optJS5FqeWDpmnYlDlmJ7NZCc9kxDd0v68DqKxRBcI0UFft8uWLdMwzTHjX+
 Hl/PUCaY92QzigHODe0eUY7XsyMStbdajF5dy1JC+xZpHiAxL3goKUV0oeoQfOTWqO9m
 XOfUckySfk4uBfui2U35e4EVt/55CpVn0Fk/fudFyJGn/09/UNqKg9HcsW0cSM1Ws2AO
 3jJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3RQLneyTL8CUHpRZFPfC+lHlP+lOuLIsQ2pjx2AtNNLI/2+iIRFtcilf5UsL1+KzFx+IkhTATId3TgnmuVgLCSkMT
X-Gm-Message-State: AOJu0YykqYmi231H3v8ehZ4+H1GViXmZgJgQMgV1gw7IDVaSnZuZqqpW
 X6L2o7eF9/Q8PZ1TuH8oY91Ymsz8wnavmDpb/aHqAST7D8Y9D1YmtQ9w9GUezatb1U15caL8SAA
 AEgQ7+UIseNVxMBM9akswqtNH1cQLNeeS6oLZIA==
X-Received: by 2002:a50:d59d:0:b0:578:656b:d294 with SMTP id
 4fb4d7f45d1cf-578656bde13mr6630927a12.6.1716912152777; Tue, 28 May 2024
 09:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-57-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-57-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:02:22 +0100
Message-ID: <CAFEAcA_pH+5qJQqNpwdiNMa+f8WPJFwKsM4URA9CTjJv3YzZkQ@mail.gmail.com>
Subject: Re: [PATCH v2 56/67] target/arm: Convert SHSUB, UHSUB to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eSowRfZkJbnn

On Sat, 25 May 2024 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |   6 --
>  target/arm/tcg/translate.h      |   4 +
>  target/arm/tcg/gengvec.c        | 144 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/neon_helper.c    |  27 ------
>  target/arm/tcg/translate-a64.c  |  17 ++--
>  target/arm/tcg/translate-neon.c |   4 +-
>  6 files changed, 157 insertions(+), 45 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
