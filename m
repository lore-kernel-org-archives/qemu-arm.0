Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF064CAC59B
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:32:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWiv-0004uh-U8; Tue, 16 Sep 2025 10:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyWiX-0004aD-MQ
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:31:39 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyWiR-0001Bs-M4
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:31:36 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-71d605c6501so37683647b3.3
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758033090; x=1758637890; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jw4FW/YIYVcsrY3eYPQ0oFEdQft+o2Z92VCWpTv71vU=;
 b=BkWsO+kyGpntYEezDNnNj8rwLh907CHYdqDqJIig6zRDCp+tGobjhUcObrlkjl36Xp
 egc4vwe6pQQ9fqnNU3Jxi4sotUDt6x6B8Lxj2PI9AIZZSHIMwhl2UFDLZMSe8OiOl3qo
 +SWYuAhbXQCRzwA40WQeZD2l4vZNKPYNCnpeTr7pTtP2C/V797H0L1wT72cJbw1UR62U
 XiH4YNenlF0Q8VVKht1iJK0kxE7p4wgSha9t2JiKOYRsO7DEG+JgjPCTt4AKbs8cR+yu
 U2evSbNPhfMy3TLhf+dXAKhzGMox07nEfUTzJQc5kFLCZfbHbi487N3ty3g3NK2Sn/PI
 zV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758033090; x=1758637890;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jw4FW/YIYVcsrY3eYPQ0oFEdQft+o2Z92VCWpTv71vU=;
 b=RZMDIj+q6L/OuLuVOOoUYR0n4+AaNSh+dm71wFUXUQtzSTUQ3g/7ta818AGw5hdT8f
 +6CMXs6TXIksVQFvTpwWOZcPE/qm2sZ96KovtbEjogb0Y8f3jyJfrPEISmdeBk1Bw6Zk
 073FeaVfXSuv4uiVvUg/Ex9LfKvNzY632SR9iAJS+qx85V4VdyGireGo92RaRi/q3gos
 MUqyWZN1OVAyK4Iut5X/BC5MH/xWkIQ6EWQkyclXLDJta+v1m8I4Jy8YPzGu6eU1FNb+
 hw0EOUEyb6ZUgffKPlx3p4jxWQbF9VhEuxfI5BCls+BBCmA8mYxrE1skI2aGjimo0H75
 PdGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBU/YOHlYoZBhx7MKyRowknTMUoN+lxxzORdgtOrTj8gs90i53tukrrGXO4k1AYiYla8S4j4/M0g==@nongnu.org
X-Gm-Message-State: AOJu0YywtMqTK8mE7zW5MhH2d18VzDQaZyPet3kTmO+e/mShLFinCP7Q
 49ANKJVFvhDJG841+lB4b31RQ75NZIY6dea1W3HeiOvKBc1WAW/u6qym5y3ds1iVcnzIOVNbU62
 1jMK0vuChHTgjZ+/JXU9+CTTjb4jWkjUdcp1YnV1zeg==
X-Gm-Gg: ASbGncsaEvT6LllIKG+0OrJBMcH+J2tgKy7Pu55bjoFqkvJkptGrvpqJkOHg7AzgkZd
 CZdl0/thVtoRfOXVRiKGHMUm55pq6xF910zbBdCesxF+kimxPuTRHl34f+4pRmG+7vevcsTFDq6
 O9b7dPSo73LaJnSAMDE7ROWjJWcSYjUpjqkYj04NjHNdD9B6YsO9yPfnJqfjQyD8lEi4hECUsMY
 sjQ+XdQwFqTVpYLtrw=
X-Google-Smtp-Source: AGHT+IGmhSpWgOrpui2ZyomB3l5pF7m6MCv1LSdbkn8tZpwwEwtzGFb1S2sFUzexa02nI0Ig1bjckHuR8zeG1Iuu+lw=
X-Received: by 2002:a05:690c:ed1:b0:737:91f6:3f7b with SMTP id
 00721157ae682-73791f649e2mr13295707b3.45.1758033089714; Tue, 16 Sep 2025
 07:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250912100059.103997-1-luc.michel@amd.com>
 <20250912100059.103997-40-luc.michel@amd.com>
In-Reply-To: <20250912100059.103997-40-luc.michel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Sep 2025 15:31:17 +0100
X-Gm-Features: Ac12FXyIZ_M7_l4mtZuzHgqidr-i53y5NlacE9gN9NtnIxirSGKnhW3Qn2gWb6Y
Message-ID: <CAFEAcA8gBaxT19rHHBn2SQZAQvTjA==GNttmtndQ2oWgmBKP+A@mail.gmail.com>
Subject: Re: [PATCH v5 39/47] target/arm/tcg/cpu64: add the cortex-a78ae CPU
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Fri, 12 Sept 2025 at 11:03, Luc Michel <luc.michel@amd.com> wrote:
>
> Add support for the ARM Cortex-A78AE CPU.
>
> Signed-off-by: Luc Michel <luc.michel@amd.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

