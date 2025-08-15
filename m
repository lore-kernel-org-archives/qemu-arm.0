Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A8ACA0EE4
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umuCI-0006bq-LH; Fri, 15 Aug 2025 09:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuCH-0006aO-DC
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:10:17 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuCG-00035d-0q
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:10:17 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e932c984249so862615276.1
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755263415; x=1755868215; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5u0lCipA4X+GACjgF7Ot4lRwzxPciMAuQVdFOtkb0Nk=;
 b=MuxfAe7V8GjqVyIcjiz7rJKkztooDXThHUAcIgO57lMlNjXr5l363xv/RQQnRxA+F4
 UCuX/9oYpNkcr8OCsj1PLEASFlM0oqKtKPtR17ISkepf0cG5tkWdJwfjjgh7qMYOV0CG
 +Fq3MD/CHlnjEpR+zMRvgH8HxU3Gt5Yt0OeWeOMJcUxuc+t8oKNtIXVEuiIL5WaiKEi5
 qQlbIlFRyOEbS6H/CUUQa+HDFPVxf7q6mGqn83INGMjYFmByVwgyvgv9JkcAjNX55e0q
 58utb3RUg2YGPRg+3gCIEXc5H3RC+ko75QURw6wZ/m0W1Eta1tTwemtYjbHwDTlpq8Zl
 quMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755263415; x=1755868215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5u0lCipA4X+GACjgF7Ot4lRwzxPciMAuQVdFOtkb0Nk=;
 b=FY244poaMwmJ02EEAphUdEM5PMqYAEuq8duC0Si2fnQjzcp9kLzF7b6s1Mk6XcdDK6
 wsz8db/LIsQezGuuuDReBCssGKQK3+oy1b1+1taFwMykXVBscXiWZxVcayGt4PJTrW4j
 qvrl4Vi2mOXrPv9w2gwZL/nLm1RPqPH3KdXwrtkjbGBBEzLzcadM4asmsNdVcZTgOO9p
 OXmuyDgyXM3t6qx5QnErCrHBUN80o8JnOuqBaa7yBAu7gw1971/mKmnAyY81Gl2PmWVy
 XIk+xkUmMNhvgJB6lJ78gP2xzAfNmSR8PPBEH6uWliI4aN4wV65mspspw2MMupD0TGne
 6wcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjQoPBr1VtijgdXh4uOVbsAWSbUdQnWKP4/pdscpiqC8B8g8mWzw04Jkvw2zNCqIrTtTRiDL6vvQ==@nongnu.org
X-Gm-Message-State: AOJu0YyPmf4+yRX8jzDPYa4E/TBWOhubmYseU9aO43Gd65Otqj6C6S3S
 +CDp2UoWYpsm2WSrt7Zt5kqmWV5BCXcx1Lo1ar30OVvKMRBwf2GPNp/+d+2i3B8zOqp4W85i9SI
 KQNAXEJXOYiOmwJDBPB2CfjYJ5viXDuXI9CkVWOUGBg==
X-Gm-Gg: ASbGncvGihDDyjt6i0aadJpgke9Ku9cF4lXkuWXiqfe5fpmz+7PQhpbGg3Lispk6ZHh
 z5ncXeMfMpEHxp0ltshiawt2Ex6rvazipq5HIjkKR3+30oLeD2v4hBY4HuvOBMWM2AYcI37VyEo
 btLHaLMPuMH1gdvjvW7nvO/z95Od9e75U0OEFTYarW0fF94hAzCkcgG1GhsBvwSXuvre1JJ9ke7
 iPmWaND
X-Google-Smtp-Source: AGHT+IFGOjnGrQjo9yDoRhI8Vswbe/TGu1kpN2dSYRSeUdFrMzqa3gYfcNivclhFP3Fp2y5t/ph6Sc0ecmROjxLk0yo=
X-Received: by 2002:a05:6902:161d:b0:e90:5bf0:12bc with SMTP id
 3f1490d57ef6-e9332502088mr2624587276.41.1755263414659; Fri, 15 Aug 2025
 06:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-7-richard.henderson@linaro.org>
In-Reply-To: <20250803014019.416797-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:10:03 +0100
X-Gm-Features: Ac12FXy4mweU9aRbT7i8qM0Ol7pmx-VAU6gaBMz_GR76JK-8nEAst9LJrqH6D3c
Message-ID: <CAFEAcA8dpPXVWib-0v-tn8QL7QXfyiGJqhvbykcp1YWOgUE=2g@mail.gmail.com>
Subject: Re: [PATCH 06/11] target/arm: Enable FEAT_CSSC for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Sun, 3 Aug 2025 at 02:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

