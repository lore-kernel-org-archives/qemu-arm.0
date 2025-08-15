Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236D7CA0EE4
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:21:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umuMo-0002gU-Ho; Fri, 15 Aug 2025 09:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuMg-0002ey-Ac
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:21:02 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuMd-0005Bf-SJ
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:21:01 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e932c98433dso820392276.1
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755264059; x=1755868859; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jl0r+rbUi+zNDnt9GYEcn4tCmMIlYQ3Y8PaQZCYiZIM=;
 b=GfcvhyW0I6w9FAsZz00qn1Q3/IBtu6v6HZioZfP0pK/eIrKLyFVybPudADy3MA1yfl
 Da4cvrkgV1Ka+ZHmXL4EC7luwLI3gzPOPN7wsGlEQxBI+UoWIyONCX3a6jfXQSnp2jIK
 +/k3bXaGYiBj6XSq1MtxAHGqBOBweJn5GqsJUsfCcvKmy9yJC4E3Ph7pFiLGiQYD/T+z
 3d/YwwPTv0QOSRx1ufm5aGBuT6h7VQ6cJMexzTTgM2EFblNWuTPBSIyaZclEBBUkEA7a
 By6ku0iLFLfVfWRiItxf6n/usUeK8/8gR0Axw1hASIxfO83mJpKRMJJ+bYTWF78XGCQY
 nshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755264059; x=1755868859;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jl0r+rbUi+zNDnt9GYEcn4tCmMIlYQ3Y8PaQZCYiZIM=;
 b=SiNE2xgJMnUq+BKsWXJKwPmZtNkzIXriJARK5SWj3GZw0Yfk0m6/bRl67JqXUgMkKY
 p0jthC9/sqSvnIIZxY4mcBkhXnAVoJmRm6xwqN7Q9IQjiyLOf3Lh4c1nB9m0R3tEHls+
 jWsfiuJLDs4v4pQ9a7TOjngorS+H+L1D0zZ+1ccODEHdo3UVfq/6LdPykSJKd2z1nqo4
 8y8aJBoCYapxiHA5RGTKHAhrYU1UfQq1ucj6nH7OjRacWMXYJKPCXikLhmQCH942sM07
 GTkyJXxgHOIl3LZCSz/DPH+VKJC2dZVS/lhGrltiIoX+me2DUrz46GV2+n+FxMAbrWs2
 LcJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Qypo/au5ReqxMKPGGuplxLiluH5RV4lqgkmiP6t/3W5r4UBuVXjtsOLRRFE2l7xlpJ1uY7GayA==@nongnu.org
X-Gm-Message-State: AOJu0YzU1eZAJSwUW1mhWS3irAuwSocBlcqYlX/Mj/GV3x38Sm6XKAkC
 R1V+uA6pc/VufCNuoegifb+HMuAzo+mXKxOOZydwhi1Y0inpDcJ0O6+GQw1OrXJUjH2HJtvJc1k
 +WMIMfhTY78v53s0tGI7zZAiRfDOqNKQm4Ec2G6O5T/uYXSNzg2JW
X-Gm-Gg: ASbGnctvz4zP14eKd73RZrqmcWF4CZP4pSsyUQjA+mIKFv3WvgtJ8Gr9LvbJK2Hn+Qu
 IPP+qHZ5oUQq/6qDB9zKXBYSOCMEuxckpaNRmYOUjq14LFTvO90gUX6E312rkCm6IpWFCsaGVGU
 rl7qKCFsH2IuGQb00/3gudPGvCQKWlbTU9GAfx5/2y5Mgmm37PPdW7O9bIavFvbqAs53GxAbRJr
 rjFp3ceJVrLHd27GMk=
X-Google-Smtp-Source: AGHT+IF3xZBIb4f4dFWr3FgwaXVQDjFfaoup0cUV+lCocecMX6jbL7H5VrlrLdBEVOA0pBPGIz9Z6Sv7JjvenmR3PSQ=
X-Received: by 2002:a05:6902:1024:b0:e93:11a2:ebc5 with SMTP id
 3f1490d57ef6-e93323be97dmr2111707276.17.1755264058708; Fri, 15 Aug 2025
 06:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-4-richard.henderson@linaro.org>
In-Reply-To: <20250803014019.416797-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:20:47 +0100
X-Gm-Features: Ac12FXzYCTmvypxVwb2RwwrMIVrSmTXIkrThYmX4kabbUNE8aSZD12uAlnCeNfU
Message-ID: <CAFEAcA_w+MsCYcVo+2m7FC0YGJfbJe6Hvz1WfaaAS_gXbqxAdw@mail.gmail.com>
Subject: Re: [PATCH 03/11] target/arm: Implement MIN/MAX (register)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Sun, 3 Aug 2025 at 02:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 22 ++++++++++++++++++++++
>  target/arm/tcg/a64.decode      |  5 +++++
>  2 files changed, 27 insertions(+)

(this also does the zext twice I think)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

