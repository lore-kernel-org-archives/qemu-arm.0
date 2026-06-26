Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7579CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:12:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2bw-00061h-U0; Fri, 26 Jun 2026 05:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2bv-00060z-33
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:12:31 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2bt-0003ny-Ow
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:12:30 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66388bf3793so772532d50.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465149; cv=none;
 d=google.com; s=arc-20260327;
 b=rQrlCiKCuQQTGbr1CPLUIzjEmugXrQ0C642MNUkoUy+5LE7Z+h3QYmGePJWGcui5Kj
 NWI9tbyH1Ot16yMm+NIJBPT82kf/vj4GXMKXk2xgMD1p8DW/lEpBki+Qdy/P6jI/S6LE
 oyfoOknPSwbtejlpXKJjmPBfh96gSx4peMTfj6w1UdAtzltvQY8Jqmz53ilnWpf3qs1E
 BPYLOIAIWVdjZI/sugiE242pPSDNi8Sm81GFGCgnKfI5SOMCAkWCe8jJT9gZvNnQh9hm
 cZtplZVaeCRO9fEdVD9gQlYDbYKTjZUrlI3fd3haWNutTGGqoWJbBUxye628W5SOEEAe
 5HhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=O9cu0xvKU//LJO0clfthiM9MnPHVsDl3dp3KuEb/oAY=;
 fh=Mr2jGqvQQEExuQ9gZZoKKvwKXy9UWYOCSbzOvSSgiO4=;
 b=FH7yLSCgTQ+xHHK9PAQE/FEXAfo2h3f5K+sHjJh1GQPyes9JIVUDeH19uvQR1R3WQT
 dyf+UWzMfBMtVRxlOhCZJb6jcckI5jbi06qnxjE4Ch0YdEOs4/vTeAAhieEkni9y+0lt
 1nzfoyVEajggCdoNEFyl6YII/lLSLnv3zrdMBN2s6SAo1IkjtkLscFqy/FySJ7vyRTpL
 s0S1ZtwrIOiL9/xQneFdXRzBEWBesCcqwUY9yZAGEXAXMZn6WXGDOLUJClT8BMQuNiNv
 5T1x3qwez8KmHiU/yAOnTm/5gjTwB6I3i7JXpIgyzoJB295N+IdGN4DnUcDrodXLzJtz
 yoLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782465149; x=1783069949; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O9cu0xvKU//LJO0clfthiM9MnPHVsDl3dp3KuEb/oAY=;
 b=zwl9pU7wAK8zDiqIRUoh2kaFAw54yFyTAPOewWq6TmZ126L5za+021hARrQbQbssDU
 gyL00Gzl9/fkTk6tLya+mqZ01/aQhBCSEKeD1ZHqwliGLsRfafyHKHGARqXSRT8G9Rwn
 2TwlaZqWEzEZ6NaYtc7hsbydWPBX2lJFYWOBkqu95q7yp2hhasv/xaDCHasRoYxWMSWP
 2lSrwla9ODIKMMIIoPzk458YZ6JE8gmUKUo8jM7qL0VmBmK+JW1o61twOv0QFR2PPmLo
 Sqa7kgQ+eM8slcQgIJhoQ7EEEfphgyUVNIoy6HJ6ynSeF8U9dlp0ek3cfiWiQAGQE/zT
 hgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782465149; x=1783069949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9cu0xvKU//LJO0clfthiM9MnPHVsDl3dp3KuEb/oAY=;
 b=ONWNTe29wwZdRqRsWfOd1nE3pT+L54xbPQamkLSUIHWIzr51zwciSKcP41TJ7qv7X0
 cAGb4pbEQb/ADT2hl3DG7EzGmVE0QsD+55YyLYjyySTNxNOctx7Xld2ACgPfj22emsb5
 KzfPBPDuKsOByBIIp0XDi0+D4jCAhmy+CRD02XZSniTMvYwRv60kaHEy5xgrm3MLHuA8
 DQS9DK+thj8tHbyydgEUmOq3UHZSwVkiOSohA4xzBToCACcccxewTl2WzV1p1wXgZxol
 tzgSULFaoYnzppQ2Q1F7/FHUsUjpksw0GwSkQg9P8pVdo3ZbUea7OX3E1m6rOsIoTjmf
 283A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrp5ZJyG+dAPfaHAf+Bdh9jBHuWvd3XJX/FEtPvjnlfhmOVsh23wqXPqRW2gjy8bpr0GEE7UE1hHQ==@nongnu.org
X-Gm-Message-State: AOJu0YwgVnqhXwDtz9HnqX/CjHEYvB8RNM7k16rXBHbscjM+3q7F9mCG
 DTrQZygiBEnN/7awyQNVgWawXEyxCOkC/aXs3rZx4PecGahTl4HgtlY0aYn4aT/JzsIh4sUJ40e
 2Y6/Q0lmjZV6rSRq1EcVQ9hHVKZuEv8PXQCgWmG2iwA==
X-Gm-Gg: AfdE7ckVDJe9bZpkG3ewUVOFr0LjhaUl6i7XkTUTAfRR8L0PHFm/vE9IAHW5vI+ZsIY
 xVMh7x9SnZzwLwDTh+88sVUs2PAvzCd6r2AaSCPU02qem9HbFIFbrBOy1gTGfy2O23C7cUf5rit
 Wz6kxT8kfJMd/k6v7/u2tgOnflgga7Ny1HcL4lSlPjqAkY7KhkGAfi7/5ZK1RPUZlqnx9d/dKbZ
 8JhWYcLOS3U9GHywi0wZzjiid9AfEOew30Pg/XDW3Wxkkcup6e/H1NjsJvToSPTyCctdPYbE9xZ
 fpOf2hi4ydaYvQNK/mQczGLSZ5V8V+MDa/dLvc7Ss5qxpBaPuZVPI7zc
X-Received: by 2002:a05:690e:d01:b0:664:8d16:8cd1 with SMTP id
 956f58d0204a3-6648d169dbamr4408926d50.46.1782465148733; Fri, 26 Jun 2026
 02:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-5-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:12:16 +0100
X-Gm-Features: AVVi8CfwdP9Z1ZCiY3efh3Unju55KO5-LejBEezawgyJJDsxZbSRWiXiZUW15bU
Message-ID: <CAFEAcA8NiFxqBeAMFSWp7qvVtxKpVgDXzDDS+vcW04mq2wVz=Q@mail.gmail.com>
Subject: Re: [PATCH 04/10] target/arm: Implement FMLAL (multiple and indexed, 
 FP8 to FP16)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Thu, 25 Jun 2026 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c |  4 ++++
>  target/arm/tcg/sme.decode      | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

