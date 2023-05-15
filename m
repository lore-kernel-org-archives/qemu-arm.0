Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6659151ejq;
        Mon, 15 May 2023 10:14:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IpwZ4yN1VpyoFq9rUzv6sek+rQ9ewEKh8EzLExIodratbuNEZr3FPBRHWBTD7eEZ0k3RL
X-Received: by 2002:a05:622a:15c6:b0:3f4:e4c1:5f65 with SMTP id d6-20020a05622a15c600b003f4e4c15f65mr24351004qty.23.1684170894882;
        Mon, 15 May 2023 10:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684170894; cv=none;
        d=google.com; s=arc-20160816;
        b=gc4qS1e8ElcQ3RkhLp09GmBDfLpiUliLzfkZQ5UEAbVJWiQtYLw+DykqnrAtbHn5E5
         PLu/MiqPDMu3EhxRkKfF67vw3BmYFUdmb4Ce+0TMQCi+l7I9mMvE7iOQLW/bXJmHBvkf
         SM94pXfOU87on1/Idpc9gaqVSKBTRPAyW4mvib8/39tETE5JuGyR0OVim1SzQiKmjcTk
         TRzxRvJ03eUL6ZydZJVX+HvFapkmIJJwN0jwDOPFDnX+eKEhMrC8Sf15gulVI3sCIF5J
         a4NE5EPn+Utxbl3sSvsCF6JRiV/CR1B2h+aVwRzJF2q1QsvPvRq+x8B3f0mjPt08OlYq
         u5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zYQg2f8+zzQ5vsTrDNLRVCK327wH9+WgJGjlgullnaM=;
        b=gyxCYo5kIoacih3b8GLhup6uCOU0polfsvJEAPKoMG7yJMcVNyZ7rzQxYwkpn08rlW
         fTDN2BOOYxwrjBLlicn2llFHDTWM/sJbigIqdQCKJlFnr+blqtRQSs83FgfWcrtFxnOh
         r9keKDSuiXj583eBv2wsJSUJPjwlyc7WFlYGmH4QQPHfipRo+V+nCGUE2EuVYOFDzxNF
         4xT7gD47DyCgdTNNTZFdLf0LM4TLrN5poZT5BAcNe5z5fEPCytysRERayfMEHjFuEwgg
         vjCBLsZwuB7p+FviFIhxKnl8rHuNY5UiIlZX2yA0wCDEBia8VbrrFYptPTj/1XDmqJgX
         +j0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qtKpuHlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05620a078200b00747a2434db2si149931qka.766.2023.05.15.10.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 10:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qtKpuHlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pybmc-0000sG-Vf; Mon, 15 May 2023 13:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybmb-0000rh-0Y
 for qemu-arm@nongnu.org; Mon, 15 May 2023 13:14:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybmQ-0000OA-CU
 for qemu-arm@nongnu.org; Mon, 15 May 2023 13:14:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so23892541a12.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 10:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684170877; x=1686762877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zYQg2f8+zzQ5vsTrDNLRVCK327wH9+WgJGjlgullnaM=;
 b=qtKpuHlJkH1osyQSF3cXG1KI4UyMlxO3cIwrJOyRwtImG6oYVjhma1VeEn7jAOb7X4
 dJ5mrEUmyRBSJbDa4Oa0VL2sK8pA5ud+kaWwuMv0qT19Dgy1V3wyjXU708zehmaNATXb
 AWcf9jpuiOtUbTQaIKpBeRjBYYuBiuOMX2LFAwTPjE+4kkCQ9DC9jIhQcaIaogArWA9c
 bgP3Em/QH4XXJ69bbhNXW1teM6uQS+NXCqAXirpMKAQO+aUaW+I2tYT7lQOlCuM1XP7/
 V6BaAgubveeUtNBWpOWpgIX8vtszddJvJl0eCDIUTMTwXe41yAv4D3uuhve06M3U5q/E
 QP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684170877; x=1686762877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zYQg2f8+zzQ5vsTrDNLRVCK327wH9+WgJGjlgullnaM=;
 b=czNauBhA5Qbyn/UL1vEpyu9L4j84KSq4v4kuCzAQ4eMGdCzMK7lKemtR5cK6w76hG5
 QnkhntqShX4rkX0K3GyWEIHeao8JvM9zLZgbUTW/F++yqTID4D/ErDowS//wtV2djb9E
 ITCnPWUy0a1ZDxDwhjmDQ+wUDOMpNZTn6kQvxjvYaopcNOGdrzfUCmEfOdq8sUdZkV55
 2P4sNnZqiqGsRhkljF/gW5BnvE+sE896NghcYf6C5FPNWPdA9Hx0BwPaSt2o8mBmy2NJ
 HiIak/9z6LQdcaIPxeykTcKvC6bV2N4bhxLohRnly93cG9qz1A36dBphVb9fUdXtlzwL
 Ii6A==
X-Gm-Message-State: AC+VfDwKaitttXyKPwwjJyObXWYpbRiO/QTd3xLSmqYQvZbcaRQ9bOHh
 rpBUeQMhJVZqiM1OevrKua61KYsekFm+BqYnXVtEAA==
X-Received: by 2002:a50:ed99:0:b0:50b:c41b:25d with SMTP id
 h25-20020a50ed99000000b0050bc41b025dmr25155819edr.7.1684170877039; Mon, 15
 May 2023 10:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-28-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 18:14:26 +0100
Message-ID: <CAFEAcA9QvZPd74t0tBfrf22vQg2LKvqrRKO7eSYvHq=mrBqjUg@mail.gmail.com>
Subject: Re: [PATCH v5 27/54] tcg/sparc64: Rename tcg_out_movi_imm32 to
 tcg_out_movi_u32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: SyOlPVYlk/Do

On Mon, 15 May 2023 at 15:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that the constant is unsigned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
