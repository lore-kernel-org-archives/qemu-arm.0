Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1301385ejb;
        Thu, 27 Jul 2023 06:46:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGgK1vZ2ppNOGwZcb58a3PnPYBfOp1H9uv0VuZlHINcnm3UPGse4HQ7NaahtCCwk2l9P0AF
X-Received: by 2002:ac8:7d03:0:b0:403:c667:e691 with SMTP id g3-20020ac87d03000000b00403c667e691mr24298qtb.22.1690465583482;
        Thu, 27 Jul 2023 06:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690465583; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEqgOHZfhUilcwTw346lpT8Mb1EVtpUIl1tqO5CtpQklXZe1VWoIlFeq84gvR1MSAV
         rgTuuOS7SEOS9iNA5BkyZCzDIMbrsQ7QBA1lv0f+XKytVRs0/JB78bHPlGIJgzX2cBzB
         10lMU6B9g4tNNpIrG6GmHSmufTHFiVOj+RzabiMGSXKXkQ0ggRSpRy/W8VmtE1eR+Bbd
         zaeW6zp2mBlEoo1OeCFTOolpNBnVW0nrjAFykd6+rxba1BH7mV7ncICzZwPWRJUROH8e
         caNqTfGmDkiaO0t4cN/LxCZzXNC4pIytYJOfMRJefxYUzfEI9jdv1MUvK+5yhSCTwzQF
         B4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=y4TqWaihVPWhz2w3wfclf52xN4o5dm6ZXkSKe4EH2xQ=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=FDa6W53v/xbugDqV/mpWBGKuOHtnsQ/2pPTZ8TZoirQ/Qkue60etsdIbfdCYM7Ui4o
         1j/wOV0fLmWOSQP+jLOJM+d53tCHE2PPY9j3mp/sQm9LSHWakvHAPhqgJn1blE8+Gmaj
         w6enI3n5VSFLKhSaBQ3lqKZyfiIJqohYff7Tq2SFN5E7e7O7Czxb3lIGrS1HEr8YpWWy
         D2SaPpErgWTYr+AEIK7Kq+8o1ICUTsA0Lavp52Eutjcw/6u8TAfprhbckTZWCNkMnhuZ
         QWprDjhRSUbdlNT8Dm8RyPbbWuJ+nxFccPT/3Y1lOM7YfVzkMz3NC9aI9BR0j7tkfmhX
         KoGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WpyLVoKW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05622a005200b00403a935d1d7si776921qtw.412.2023.07.27.06.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 06:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WpyLVoKW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qP0mL-00034j-7j; Thu, 27 Jul 2023 09:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP0mD-00033c-Ez
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 09:11:35 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP0m8-0006MV-OY
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 09:11:33 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52256241c66so1931226a12.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 06:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690463484; x=1691068284;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y4TqWaihVPWhz2w3wfclf52xN4o5dm6ZXkSKe4EH2xQ=;
 b=WpyLVoKW388OiH+eH/RfP1Xke8aVYlpQ+WbxA/vN7Jzth+IwYdEZixRMZzZVYBl7Ta
 2f1LTUi0EfogBm8MUMiB3OHsIEk+WPXzieHC9x9rdhBv5ocuZRQpdOOszIqTtf+sHQYO
 JfdQ/Ya1vCcN9oZOiZcBRWVvvC9aJC13TO2ktPF25izYSc0sHwXX05IyExpslsAAM/ov
 IlnTVPI3Qt/kCZGc4rJ6fcRLMpUp2AuiUM61PHq8O8pWiBycIpoRFmqDzfM9QoZIikbU
 bEnfgRUHbfHMvgQDNwjm7A5L1Potx9Zzjhk0z2Qz0DMJs5SQ4ohy7Ssz21ziHBh7KKB6
 bV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690463484; x=1691068284;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y4TqWaihVPWhz2w3wfclf52xN4o5dm6ZXkSKe4EH2xQ=;
 b=b4g13svJhMHtRltmcNTucU8UVsZKO04LWkjS7mTCHMsF1lj87Zp06yAGmNkVkKVA2f
 mg0lktIgDezF4+iGFN9lCOpGpFgFo17xE2GTgaJZLZr5KO3icAeQVfHiAbh4CZkvjWOZ
 IjEjyK2KveHzitBtxonctoImPmN+tn8OxmaK6mMJtCmPCOppHzJ0YoJTzEspylZhxNgQ
 5fj9zhBazm310Z7y1oxTZ/E1EbF96vBxgST03blAftPTaD8XCScsrriDHk1aHE+o3WuU
 un+zIYgnbXCNZ15N8it6uIr9X9v6grmYGmod+hNDAC4yXIk9vUqriZ2HQxEFSokYDBzD
 mAAg==
X-Gm-Message-State: ABy/qLYza7bAAU/5hkTZOr1c2URucOh2CxIIaNBQQDSrW9IfFU+umdoQ
 nKypO0p8qBXldQZe97XDcNuVO79HOPk4vlS41amEQA==
X-Received: by 2002:a05:6402:2690:b0:51e:5bd5:fe7e with SMTP id
 w16-20020a056402269000b0051e5bd5fe7emr2301857edd.17.1690463484487; Thu, 27
 Jul 2023 06:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230726165416.309624-1-richard.henderson@linaro.org>
In-Reply-To: <20230726165416.309624-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2023 14:11:13 +0100
Message-ID: <CAFEAcA9f5h0wcq8==PMwcbt-jCKDxfFmOyysGiMaxy=WsSZYyQ@mail.gmail.com>
Subject: Re: [PATCH for-8.1] target/arm: Fix MemOp for STGP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Wjrk4OvbQscG

On Wed, 26 Jul 2023 at 19:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When converting to decodetree, the code to rebuild mop for the pair
> only made it into trans_STP and not into trans_STGP.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1790
> Fixes: 8c212eb6594 ("target/arm: Convert load/store-pair to decodetree")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Applied to target-arm.next, thanks.

-- PMM
