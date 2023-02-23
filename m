Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp907837ejc;
        Thu, 23 Feb 2023 08:55:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+60+nUNxMfBMCibKltY04Zx3Y01W8rMiDFFU6f4a8ussRZQHAvBG8eFEnBL3ep6tVDLUdR
X-Received: by 2002:ad4:5ec6:0:b0:56e:9dd8:4812 with SMTP id jm6-20020ad45ec6000000b0056e9dd84812mr27019874qvb.3.1677171319703;
        Thu, 23 Feb 2023 08:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677171319; cv=none;
        d=google.com; s=arc-20160816;
        b=PysIAFsm9RQAkgAHW2Sehum4R5bFbIDkeC7dOndmxjAe8/o54PIEA1AYScPA1Qvqv0
         D4WfFTr9AwHMRjXq548xG4QWQpnJfq2O+Q9LbS4BQ5pJa4wGAtSsKamTfLt0y2cHG2wI
         AuJ9Qx9AqhDUhsdGCqcdaw/b4PboEq0zDsu6uFAfT92AiO8AyAQsxxeNmOqB17auAn7X
         iG1kfKs3WHSMNEpnAelv+grROfzi2Bo8lg9iLLfTYL8VP0sfMVRaEaKBhxmBwf/nEJ8K
         iGVsRkLNt1sJIu60L4H9vDGXdnj/hdljI6QKExpZdOTJ1S/182wfxA3g5SZDnagHDZo9
         AI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=whOjK8h13n4gJgWz9K0Se+3pOJ1nXPBF3L51qiyD8xI=;
        b=qilvnVSGcpLcq0TzU/sn8SE1r2kgJBDKSKGsuBWxxfHPhC2vDDTgDVWlJW0V8bZA+3
         x0FlGKkk8pWX0biCly6rZHGwjXqxkNedl/MDLgjv5lN9ms3H9JP63uI5Rvm43U6AZP99
         t4wnAGvlcBeGaVAnMdr1Ph/e7pd6yXuLMrPBEj54gnW5e2EpvY5yg7dHJB9I3qyncs0M
         RllqoEjNBvmbAoddVblAiU3BhJtivtlSk/mh4QaatDUWmAgJZdD8sWSxxVfuSrKGfR3R
         x0K+mJ84zia9bf7orFDXOtKY2fbLtKZAH23e5BvbC1dDiMLatuaeoZ0pEdqBw8o3qM1q
         +E2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IBiGTDU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z26-20020a0ca95a000000b00571afb7479bsi7364376qva.410.2023.02.23.08.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:55:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IBiGTDU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEsG-0000Db-TF; Thu, 23 Feb 2023 11:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEsB-0000D4-AL
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:55:11 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEs9-0006fP-P3
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:55:11 -0500
Received: by mail-pl1-x632.google.com with SMTP id h14so13834210plf.10
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=whOjK8h13n4gJgWz9K0Se+3pOJ1nXPBF3L51qiyD8xI=;
 b=IBiGTDU/F2jarTNhP2dGYBSw3xFsXblsrOm3UbmB621TQ/lmHyIpTa4nkGGKDM9Abn
 2+QN73XEKNz4KWzwkPYP0P/J1aqn0lJrY9wRI4GiF9KjaN/2bkFNaFd4mjCVhQd5IiA+
 YwFN6amArUXJduubtdFSBx7hh4Jfs5zljHo2oKGE0tCOOZrBJxpTUJ/06eWs9zI/n+xy
 ef4F4SiFAYlIER6k6ePi+f2H1Jl7oEEDJVvhI0AlBJ0lfVN5MwVplzoWWOgD1D3iFdQZ
 0amm6IrsPb0wBhVFwbiWnXVOoG6VMa60i1v8sJLuCkdF24QB24maemOTFbOcEOa34Zty
 hPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whOjK8h13n4gJgWz9K0Se+3pOJ1nXPBF3L51qiyD8xI=;
 b=jZ6mKTLyup0b0r70+ZZbU+haW8NTuXfOXypW1tUIHjDcUFgdyLYjf2ScTJXOpNIoNT
 vZDDPfgtkqnA06nqyKh+wC2NucJOxX5mH55onHcOIZOq2w2eZs/84Y62yWXktUeRnfwM
 0yyipcnnkPNadfNl3BmKU0b0v4wUwUudb6ucbvzgNGgMPKtvwAe5UmZEOqHvsLn4MDy2
 3b9QjWnymGd1EvoNrsOAzsF3u5otG+bv3Mp9K3rkBszgqXZU8Yjkq7VywMjV3YiOejS+
 jNsfBiPfN5D0wCQWZFvzzjz/GcF8KtFdX65rvo0GWP76/8AXwslnG4B43HC4PJBpI6Ts
 LWDw==
X-Gm-Message-State: AO0yUKVeOuklmdEVqaf0pQk8mwetIkOy46QQgQKJLBje20pEGwI/vTUQ
 0gmjbrgo+HY7eNVUjBQtAwoBJSeO5tGVXmkC2xH+PA==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1290279pjb.137.1677171308099; Thu, 23
 Feb 2023 08:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-15-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:54:57 +0000
Message-ID: <CAFEAcA9Mq4okDNYYe2WNV0cCZhRmLzFqZ6rKpn0Zhz-naL2J9Q@mail.gmail.com>
Subject: Re: [PATCH v1 14/19] target/arm: Check alignment in helper_mte_check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ui0Usijx7/Yd

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes a bug in that with SCTLR.A set, we should raise any
> alignment fault before raising any MTE check fault.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
