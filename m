Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFCAC5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 16:26:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww0AA-0000M1-3j; Mon, 17 Aug 2026 12:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0A8-0000LW-GV
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:26:12 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0A7-0003gR-2p
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:26:12 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c15cd3fd760so442078266b.2
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 09:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786983969; cv=none;
 d=google.com; s=arc-20260327;
 b=h2UT284iZYX0wXf4fPRfylYHycfuDOabD+WOExn/eLV7SeMB3zeXK0Fowk9Tr64Y4j
 +vnK5uJBWgd75Ri5r318sAkjx6B6bYHzRdJ0A5FucF5a/s3WdwPYT3ItQYH69bSwzDfx
 APaoyMdabvpKvmfxxJq9LCuuWDEZlAIoEnSHVIaOtavQ4E3ZZ5MzU0IJAZRMHCi74WZz
 PCMj9aN9W/ip34HT32rWYQ84XPwlBm5FJWaxnUlod4x2LAI7VTTsiFcdp6QlU9PAMWYy
 lQVvRgCtCG1ZerGD8W9uTZslJqQCx0UCbquimHOum5izlYWd1E6aHK7GI/GYn0jcHE2W
 dChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9LnMnLZVxuzwQuaLmrxGTRJckzsfF9pcE6iEShuCdLM=;
 fh=ne2b1Y/LDe/bb9qDggMu4+dSs3PFKxW9js5FB3gijCc=;
 b=MzU/vYTe8vZuYRj4WYGnvjKOkLKlhMk6u7gIjEt2FjxjqHCtJDAqEzlI5ENNOzkCd9
 ypq5kqs41D48TGVgSig8AsxUijyIEru8ZKw8ZnvPY/KUCx1D53jwC7Zcmw5Kz0WT32Dc
 1umH1b110hb01l6giXwbxqJocfLAXelbzpJr/0Vrx0lZymn94n3ZaW0133lakLYt36f2
 SBYmsbwju+WLnhJiTefWjQ13uRNNLy5emIHrjk2V/fKzOlEBB7QJrH1x6vrQUJAVdXwH
 c5sB9Dq5x6fOXD7GTIVwMzYIPbnkU4lbiJufsaVrKna45ARMVcWDsqmZnH+L3TMCzaMO
 TSEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786983969; x=1787588769; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9LnMnLZVxuzwQuaLmrxGTRJckzsfF9pcE6iEShuCdLM=;
 b=CyQtNHgzlUMJiAlBh5hgHbWhL8HswmcTzK8JwqGAEaqzsMmlRcgGwxFbx+TrNymrTl
 hBSPvAPUzfcmd61On6Em/XkDTNwJhCpuTIeM2vzrUPjn2cUO7aSZzB28sMvPtRg/Ui6O
 0xY/LR6R3+/QFFgU4SC6sNkCIuHh4w31tafi4MpbvtyuPCOn0ivBmj5K3lR9d2bdbUCK
 40dcl3tetxrsOtA+ni7JLKfaUeZpvoKqZI87UvLtU2/SGmAX6V8PzLl+ymd5QSNETYFp
 xZNqmAFCMJPVaIk0k9sYHm4xKkmWDKD5WVImHWohuPcIbfLOrAte9cRaRJkpae9DM88d
 VM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786983969; x=1787588769;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9LnMnLZVxuzwQuaLmrxGTRJckzsfF9pcE6iEShuCdLM=;
 b=Ir0YbC5oRgMNUcpOV3r0r7UyvYzSZt0aSFbRmOv2n72KfMzNFuvndad7AUSSp7IvwK
 EJzAuFKxxC2coOcqXZ7igJ2Z6AsXFb3wNEYAaYh0ph/jFVOA0DB9nGviI1gyFtMVjYSs
 Wv7KSX8qniWV3ro9OUIOMG9TYMg9bC1RC8KSOs0dLynAwv5J5KaaDOqlzniNAqDWk1px
 /K6aEgUYIVRAdvvkK+DzB55TZoB/8Uc+vqj6EU0WD0pnyCvF+uHF+5xzpn6rOXet4D4a
 bHWfZ1ueNL9Za4uBHYSB18d+Kqw/RsByhhCBq6QJF/kxQb+cG6gO2AflXVvVy51Axl6k
 yOJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpLZRHyxTz/tsOmj7+mBqGg1ud1GzJK1cPD775y64YLGi/LoMDBKdKLVZ+JaWpUMc9VJjY74CsZoQ==@nongnu.org
X-Gm-Message-State: AOJu0YxcbBzt1ZpGtncmDkLIEuVRNtPvpkM9wxgPYO+vLUXdNmebjrNB
 r4TKaLrJYWcfJMdu6FZe7hBYh3VarpFtCxrntSUpSinMva2RafCJtAjeUEUancBuGPCMt+XoSbQ
 PWKKD8CcQ9Xn9HoGFKaJzE9T+XkcHsm++KOnHeY2WQA==
X-Gm-Gg: AR+sD129MBd1O1vA8+WZTrRYkqTMGfE7y6zm0N8nqoVvtZSRK91arVy/pI885IOILQ2
 MjId6SwN05C6s40HOd9POE9jcOcGG/3nU2MKXahcKOPu9tvtX4d8Gd0ksG8g6ydVpERVxx2NRzn
 YzQ7pKzxfgHmsX4esXj2qEgUvK27dPmvRWVWkcxCZN2xvcu8RyEECpTHqXiF6mZT92vLbYaXX8A
 U664vHT+7pvC57c6445fc1+FXKh2XMWbj3E66T9fHDbjiMl0PxmPS4oXNoG89XnLNTWz3Zl5Gse
 PbrHJe/2UKK8zzeplDA6jSSCX1cBT+visv0tm84jVnBQzYPV9Wgvk904Kl0sU6OYcTmLluPnVqx
 hrJ7SHJo4tAIQXA==
X-Received: by 2002:a17:907:8993:b0:c16:831c:427d with SMTP id
 a640c23a62f3a-c212a26f3f0mr1107299766b.21.1786983969417; Mon, 17 Aug 2026
 09:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260811191540.79882-1-richard.henderson@linaro.org>
 <20260811191540.79882-2-richard.henderson@linaro.org>
In-Reply-To: <20260811191540.79882-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 17:25:56 +0100
X-Gm-Features: AcwNN1UbXgxSDTDFNVjvZ2NTeB1-I1dTWFIKkzOlNlMl8s4A7tTha8-gfRNvPWU
Message-ID: <CAFEAcA9Gm7mrJTx9gYCD_1m2f2SbVAexMM-c346WrtasnJiPKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tcg: Export tcg_gen_ussub_i{32,64,tl}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Tue, 11 Aug 2026 at 20:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move from tcg-op-gvec.c to tcg-op.c.
> Use a temporary, to cover the possibility of operand overlap.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

