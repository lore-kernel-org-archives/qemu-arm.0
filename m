Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1972CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:14:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz5a-0007hG-EM; Tue, 09 Jun 2026 12:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz5Z-0007h1-Rf
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:14:05 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz5Y-0006j6-E7
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:14:05 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bec405a6ea5so828635566b.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021643; cv=none;
 d=google.com; s=arc-20240605;
 b=aiz+DA+m/qxoMuGmDSqEzFwmeVTdnbrvNyGj9DHcG71LfwDbd0+14R0m0MZAZ3Hiti
 26k1vZfTnsfd7oBagaEv40c9Lt36dKJiIH5bu7aIfaRh8s2vjLM3fNk4kKrM9/34cB+e
 yqgPrzEl0pWbaMS6Tx2QgXk3HmA5a/Cq5cM4FA34U0AezqIWUalCpVil0RQoytnbYwUj
 v3duHtPRZWl8YzUl5J0tNVJaVVHR0MtU4akwCm5xue4lyo9/mdR+LKmIuzoB7HU4NVM+
 35xUoNI8Yh5zJr5Xb7846v+JTyGd6h3uIBMQR8KIbs2MML6E8fFpNqmzWzpcIAZ5h+8o
 IDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QH8QnGRoMGOpdIvL0G00X1FWB9M3SwC/e58ot5dOTso=;
 fh=VwHEyie/BokBUUADCgMIZ7haw9ep6ATaWNsP8Jbyy6w=;
 b=XzDvbLO5h7xEJGO4vqgwt9C0Bn9pe0gQcI2U5Z+WOrQ9cuOBYbSUQ3LTd5BJ6pTJor
 UDfSpsjV+SFquRGeI9sEVwMZDBYmNv/zmIeCgHWMbbwhhyM1xiMGkJkFTid0/TKHouNJ
 Of/YlBrjzi52nAX4HROBc8UQ/b+UJiZs1gLCFG9C+pWMMuMxc4UQvTbNoZQXbyodERmM
 ykuFX+dNbrTow+aGYK/Q0hF39GzUl92D5NDhvcPtRUjwMhMRFx3KynGFDsD/yeG5GS8L
 U9jUM4u0QTOMi/S/vMzLTtrI87ock9Fu6eQ/X+LozeoQQGdxbjzEChxoQn7oqTt3iFxq
 +WfQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021643; x=1781626443; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QH8QnGRoMGOpdIvL0G00X1FWB9M3SwC/e58ot5dOTso=;
 b=FYndp5Kv+DFsNJ+TfEy+aI/t0Mlva4pWwKa7jeeCYIJUAt9o2J2kAKYB6jfPRxBlAx
 klnZliY0D7TXuOwaj199fduH7XItXEGsU3N5hM5W8oJSniSOdQfKZ+OG9hfnBi1Z7TpB
 ZsDYzGe8gITVzmQ/SCYCuYSGJncjRFuSCyK2gwPtONVrvzrfcHR/iFD8oPxEFlLrsiqO
 V2Z/+KrazbkN8+o+GxuReAaMQErogVEx27HTO8aSt3siMmCD/yMTHntGaUg2O/mmgjAp
 H+UlOJXSAcHW8pd75kg1FZdh1WT4T4fmoovHCdfrexl6Xq+eZC8nNSqGKYA5AzgVIEBH
 r4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021643; x=1781626443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QH8QnGRoMGOpdIvL0G00X1FWB9M3SwC/e58ot5dOTso=;
 b=ii9YUAjCDyd/33TYAgASbbQdIGX/LgOnkmFvOP7iGZoVTNivRCEu9n8llCElefy9cp
 mYVUw60nOQY8pf3MIOLenjVUj6IDjqB4SQdOeoTrEcPRNjn5N1ljCnbL5EdBsl7YDb8d
 dT2HA9308Wpx6RFxirc1SOQYzbx/cc/Vo+Gxz4bePNb/uEetkhltkbhrMq8bM1RxGiz/
 s7a6NyyjQmyKAITuxKQvNL5/mG0AdMdUxxt83a1/zFWMfXWhVZ+eMTNgI3SGbOYhGkZw
 UgeKx17/kluYrYj670m5hVn9xsPqL//rIl7k/AINeFlu3zFxwIMI6uy1bNFp7Bmn5kcl
 cmqA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ndqGVUQ4SEiivUtwQakl7k/MkJtiANiOe5R0ANueN3lxvJVQIsqNjXBGL/VMfEbSucPK15kvw2Q==@nongnu.org
X-Gm-Message-State: AOJu0YwtlKLAp8fc8j6CNC5x0RfMFPkCXNbAsLqRlZS8/R0AL6c0OtuM
 qjuhDuSMevuh1fjLyNcfd9jOb374RE3mTzgEkV6gYTOWUSItfQM6JJji8AK43l4FS5VDp9CCCtO
 mrqRRFNGbI4GlytRoKkxX7Bi7tyl0AUafd99RlrE6mA==
X-Gm-Gg: Acq92OEAo1qf65m9LzcpFzG//SrCsa+iPY5KZCwh0ynAq319GSsx9Ghq8dEyykBB4Qy
 1WiANImI6pNhhQw5ld/8TWcMsTMW2/wuktDXFRzEA7yhTPGwmjlCvnUtnw5wEaj64zy+ZCPjjEN
 JfgDG7sCbQ+MXh4hoPyFKMdfEEkdTxSQo0iRT8HWfNF5QcHpdsfZ2W2TeGA9Pgk8csmQxZ6VQUa
 uCTe9lr93rzZyXLXgX2W6Sgnq2BZgYuPMukREmRMzORYGP/9lhtM5FEpqX4VNuPglp9Ii3KNIhy
 fKg0jcgQPZX2uVuulIpKk4nzmFbzgsKvfmiK6PEOgE0BK9zpnMXom/hu8RLzhCLg4BDV9PxxB5Q
 aSQ==
X-Received: by 2002:a17:907:c398:b0:beb:5b37:751b with SMTP id
 a640c23a62f3a-bf372e22c07mr981693866b.37.1781021642998; Tue, 09 Jun 2026
 09:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-36-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:13:49 +0100
X-Gm-Features: AVVi8Cdh5j0xz9JLrtykdZgFzsh3VbsTlWQ6aQ7bnXJveUvjNC5D5h0tsndj2UI
Message-ID: <CAFEAcA8fCKHkmpedmxKLLrfEU6rMJO9iUU-pwTzdTnFuoRiKuQ@mail.gmail.com>
Subject: Re: [PATCH v9 35/45] target/arm: Implement FDOT (FP8 to FP32) for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

