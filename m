Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91847CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 14:00:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZlF-0007mf-Du; Fri, 19 Jun 2026 09:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZlE-0007lw-81
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:59:56 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZlC-0007kf-Np
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:59:55 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6611689dc10so2438718d50.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781877594; cv=none;
 d=google.com; s=arc-20240605;
 b=lfQXEZXkA5fNqR9JoqzrHr8VOT4pYmc9xatOeAfuth2hoD2zUCMnkerBuZBFPFXF0h
 i/z2z+4ywGzg6otcDqRo0jLhHZHNzArQibslJ3NQfFRoln1gMYD/f2W0O6L7xAD6NXIF
 t5rxcZqHhUdYBv9mJlLMWGVMvgwo+uEB+jssXoaVinvLOxRYX9iQvBYYBhrhlMs5/mpD
 prh75x+GEsoYwm0ZHuiSWxiE9QqyDFXKaXuB6ixFoAdx8EzlCyAVipYY/NtHhx5zuHCB
 AVqEd3TOJtjx5YZXl91EkH40+j3E0KYNB2YhWpe3tSl1rP67H1TA67IlL2TDNxgF+vek
 yrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qqXf/2zUQuOG4WvhbjV5Xtvcxhzrfyvur9hCrlONaFM=;
 fh=j9KaGMZ3HBBTrzYYCK3LEs3t5Sumg8KGXuW4AdveNMU=;
 b=SNXsIPB82JeHFQO1UB7/tEbm8zHBcIRGZ3JFqSvwAKeyuvbx5G+z42zo0g4wvEjTR+
 JHKj+N2WPn9ed77VPjwsitTcnNL+n6E2PgZSH/wIPiNk8DfMfICRK49i7Z3z81ZxI+Xy
 iSCKMeZobWVroJoXYspHqFKkPPR3CSDTbZE73jjGmb66/n29TdoJfNU+7NNj6VjavMFM
 +Vd0tPzEefDNOFlOJAHNVTcSUTD7cV3pgzKOdvnwPbOJlJI/n+P2LFCa81Ut19ntiKrp
 YG6mJOgJmq1P0kRVMRpby0AhZQQwWng+KNq06y9KHBiLuJcl0mBoPeC+3WqmWyE2kyHE
 u8aw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781877594; x=1782482394; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qqXf/2zUQuOG4WvhbjV5Xtvcxhzrfyvur9hCrlONaFM=;
 b=jTzWsH8yy85A6DTaLC2L1qXhAqa8Io/z70tskmsBij2TsXu1uZJedBNEV1o9OUZQLj
 2ZXb2NMhJZ5uJmJq69P+zTvoQ+K/wxpbPVCtjDtAoW/9p9y1KZm+KqassHtZ82QIYc6m
 DLXusyKUGmOJO6/bXwyygIaXnv+3RfN9w+uKazPBPKoeQfbNxDGgxFPS6wH2K57p30U7
 ENyyL+Boz28xT4oO4Ie75NOqwixrYfrJV1VKU3Efz3By8DvVphyPI58n6UN502y2Bglo
 gYrkswzFmJN1ugK0UhjthGTvnRF+jsda8ouLr4RITi7w/DID5/sHJ3b0mx5e7/q9dryC
 7VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781877594; x=1782482394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqXf/2zUQuOG4WvhbjV5Xtvcxhzrfyvur9hCrlONaFM=;
 b=NMjRn8oezylwoFvmy7WPv1NJqxVKNsSCd8Rnm/xB8Ycg3YxBP/Eeb6n9UplC6dFxwW
 AYo3fvxz+uXpuNCmwweDE4/1RhtBU2KV964muhWFedZi1sg3k/g3TDWFdXEd9dMHDjx8
 6T6ohXGYnGJghLQgPBt2UKGaCbyoCdPvZhepydXMxPvMb/eOtm0ABS9O0h9iQ/Px/XAO
 tLDLPQ/rpdRm3yNrgqnbBrJYbU1kTQ1QsMrhrOvJzme6h+JDbyCRYjOkAw2YFAhrbwWE
 eGyNu89o+/IODeyBtxJKXyW0P9JrheqBySchl9j3r8b0fwVe2MgOO5jXINc70xXOEbm+
 FAHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ90UzYqkr/FjLIAHazQA8Y2g+T+yethHuzpgclMJlZPmQd2MOScmtY6UDhNtyUvgfg/24/NyrIWPQ==@nongnu.org
X-Gm-Message-State: AOJu0YydI4ykYBmqZh6vduF5Jercrm8eEVrTTrzCFpnFYDgthbqMYkvB
 w+yoggUeyl/9xocgtDZLMJxRl4OFKMSqreSdOUqCyT0jwGhF/7eU9CZEI5aNMdqlsTZedqTFR6J
 ueqHgFboE33lmdM366OBQcn12O9/frNjDB/G6btKyAg==
X-Gm-Gg: AfdE7cmsnUFmK/BqY+9Z/d4WL1xm0jTkBhj25uN+OachlDvNZZfiKJ+SXMesgY2TcbF
 nYCgLweNn3WgO5nSdCltZ4N4ywgSjYhT+QCiH3rHRx1k6ViFe6+MrZo/8c5p8Q5gGbMfqkWVpqu
 9bK/joJElZtqTQB+0Scmrqm3EbtUDP26aWV4WwqyV7Q1tt6sFYBakNYoV9EupK9chPrvfOfOGaw
 hnmNsw3oWhruPkY6u1oWoAthUX+/y/ngzI9tkID7XKvpQ2IEAIjz3jwd7gmnSkxi6CgtbfmbYlq
 aPNpNQ0Nx1U/yzsXDtrY19qOohg+snrdfd5/GBkw6Okhr5DBRTvuugzF
X-Received: by 2002:a05:690e:12cf:b0:660:40a6:4c9f with SMTP id
 956f58d0204a3-663035f151cmr2049130d50.54.1781877593729; Fri, 19 Jun 2026
 06:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:59:42 +0100
X-Gm-Features: AVVi8CdBD6C-wfS9OQSuwmTJZRjBtEqmfUyEyG3NhnfLq8YsXiSpROQOhuloIAs
Message-ID: <CAFEAcA_k03TSrmLtUqYO7LiVat6oYSrqZH_wX6a-+O-KUqd6DA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Implement FEAT_SME_F8F32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 18 Jun 2026 at 05:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260618040718.572950-1-richard.henderson@linaro.org
> ("[PATCH v2 0/8] target/arm: Implement FEAT_SVE2p2")
>
> This is (kinda-sorta) a prerequisite for (parts of) FEAT_SME_MOP4,
> which is a prerequisite for FEAT_SME2p2.  It's fairly easy because
> it's mostly re-using helpers from previous FP8 features.
>



Applied to target-arm.next, thanks.

-- PMM

