Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E90ACD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:15:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSgy-0002yX-4D; Tue, 16 Jun 2026 08:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSgs-0002xO-6q
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:14:51 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSgq-0007aG-K9
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:14:49 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-662bb4dc1d6so503129d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612087; cv=none;
 d=google.com; s=arc-20240605;
 b=deQ+XuAYAZfdtpm9fNX+zSrFL5k3MuofSnxHgeBZpUlEhy0+SR3G6f8K7/qx0C4Yl6
 MY+tyXRhOrBoyr8tkQvKPDShnP6hwLYAqCNNQXarxC/e7c/r8id+Dv/d8QUUSQ5jM407
 +FBmVLdL5yGZBnww0vq3jVo+b1j4c+i0MbxILNK9z0sPDKwYUVwX5bGUjz+LrR2Fvk9O
 ARnshA0VOlzFYx8FXd/7w1lWPh/W9/ohagdIepAI4UZQhuEZr9Q2ReKqA4wLIJdB11EV
 YHORZJwx95EKLkPGMguOOrBNgDYHhyjiDZNLMQLTeou0AQvvkicCJpN25UFXpsW9spQh
 AN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cXEBmNZ72Gr0cGRXJ3F0v2vBeO9CtcBaEsgSWNI416M=;
 fh=K2VpQFeigXH11n8PnBTq7moA4E1gCR+EDlQ8TE8wGeU=;
 b=Pv7knV1ZjWk6d54zX3GuuSFS3exJfv/bnF+hLfA5WGOCDiF7y+fXlkZKES0EE/QFTm
 fWTbNnpAAe5jXdBdwSHvFjE6tNOrdG25tgyu4tVTXCEq8nkdI23Fm5/un0P0r9ZHo+0Q
 rdMrgTkd3pDY5Da2GHGhi3CMv1dlPW0ynVynqBPT2Q9jQrwqvBDJ+LYZNLA3vPvll9PP
 Gv1zkN4XWZcyNAo0JYS/vKgA8o4T97cw2aUIS7XC9sESNnO/zGkZc9PuAfbAtOLNK9qa
 rhja6ZVSXua/tbriJYWlOpOhQXEwgJS2ADL0/Y4MCA2+aRkFYYucxripudDRSfdNtaYp
 0/gg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781612087; x=1782216887; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cXEBmNZ72Gr0cGRXJ3F0v2vBeO9CtcBaEsgSWNI416M=;
 b=DFIj+5FU8XsJdnE0H6OfnTuURY52jfa9ekl1SF5np+qm/ih7Mj6SY9ZXCba4jtxXxK
 gX4lzxnglgniJTXagMBKKpHYW52CYVQyC5yiOiNF80fADYe0RrnuRxz57/PrqE5VkA3I
 KXj1j4VU8qFy/v8q/hYWeeE6MCQH7ImQTvbsBo3amg9x50WfkcrhwU3QYxU3Wvxw70ig
 KBGE/C8ZOERa4efdBkC9fZs60gzBeDj9FvFVNEvLeaeJwAkrtdee1evgTpLpHOARLUj8
 3vpVLEhHqmgv7+TnxHAVjLD5GiEu2vuu3jReIVtf6SbGvWliH6iJjq9WpIvj5dUdqqr1
 HtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612087; x=1782216887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXEBmNZ72Gr0cGRXJ3F0v2vBeO9CtcBaEsgSWNI416M=;
 b=gubdaxvxd0lJMSx9Re4pFP1A2384j5Cqg25k+2H5lr9BfCw2vdbsKMmzxbzYJYCfbh
 elUBbn/gDg31Th45/u/LFMWip+vMSbeXRLb1z5eEpDQ9Wtpklmwfr13tkmHgseS+Aetw
 sIkTCxOXBrpNAdZGjUzqB6SFnB6YCpybe2qkjX0j4gc/cyZGYcw9aG+FcKUcGAVVQqRl
 PoY7zU8xKGYIw5OLIyrPSZ8FSSgiUZtIIO716jKT+1PEVUE1TObCG53NT29+enRcw/PA
 JFlzc/ekC0/BSm8Dg2Ro/D6WRf0w/CIfJjtSKEjQJSiQf4QYVICaSefWsw3yP6B8nZyO
 YWSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8oU/3gJILsXB0736S4kfLwHQIIZEgKyjgL2hfg598QGJoeep/QGdDVBUrENVo9IDemfkXZN52luQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxat4QkeOUBp46jLttzaZV89JVKPEPr9rNiV82jxfbsJkYZnZrc
 LV/JDJgeFqoZfe+O1kSuxA6Y1BeGB2uxCNe6wIzcpjRsoJaKR/KCwU+D0KDD7X5DgsrFE28fQpM
 KKdQJVi91y3AgxfZ7QDCi9q9NIX+S2Ii1gdLBEq9Ey3PcnFjf+E0p
X-Gm-Gg: AfdE7cmNUvy3zAYDKicmhP9oPPUZ7nJ+wE6+fjSdJcGSlTMZwACEzPzV4H9IId7GyJr
 6SpDjX6FbMYoi5i/uBoTnVTMv7Id5hGjNg+yJKnz6X48KQeQ6xtYWTO/GUzaAHWRpo0VYCqmdgw
 JnWPvwd8sJdy5BN4lmrXOPgpyWWZDQmWYu4PGJ/wZiKcyB+VRF83Dvj8HPv7USN47cXgpLUIbN/
 suuubcxM9f/o7KShZ5LjqVuQ6ASAX5Z7E81lfBAHGn6atgD2jj0ZqTewAEgXsdBYt4aBqIWRtWb
 zr3YNGb36YoI3tpnQT/s1YPQwO0b3JMo0gHExDx8AUn/lH5fDelbN2z9aSJpGxWtmYk=
X-Received: by 2002:a05:690e:bc8:b0:658:e2a2:dbe0 with SMTP id
 956f58d0204a3-662b606d842mr2548773d50.5.1781612087526; Tue, 16 Jun 2026
 05:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-3-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:14:36 +0100
X-Gm-Features: AVVi8Cd_XrpmYvyVN11Wx-Hni03nHS6HgS-8rmJez9SHz8EtCSqYwRevS1mckME
Message-ID: <CAFEAcA8hPoeHtjyMkHSHLH=2eoQwn7idSOKD7qb95FtGQQzQ8g@mail.gmail.com>
Subject: Re: [PATCH 02/25] target/arm: Rename sve unary predicated patterns
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add an "_m" suffix to indicate merging, in preparation for
> adding new predicated zeroing instructions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

