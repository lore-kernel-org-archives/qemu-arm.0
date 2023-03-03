Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1291409ejc;
        Fri, 3 Mar 2023 08:46:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9QfugQIxOw1IWHp+8i1BzcQUBowJ3g5kMq1Qs5ONjZhei59/K66hlX4zMupuxesNj5wjWo
X-Received: by 2002:ad4:5e8d:0:b0:56f:8b5:3e94 with SMTP id jl13-20020ad45e8d000000b0056f08b53e94mr11701641qvb.14.1677861995101;
        Fri, 03 Mar 2023 08:46:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677861995; cv=none;
        d=google.com; s=arc-20160816;
        b=u17Yp8chnz5UUgTJAEgy9qtn0y9V6E4uBjo9Pdv7nygTqkZ4igQJnyeXu1XZBkaiad
         2vIQzeIV6tHpgZLLKrLYmbZScNhvOTllZvchhE8HjHdyOi3zQkWZOux7+15xhSiozxyj
         8KeMsRTnLvkHkk/q9Oh+vfHwb6XTjjnlBOmXaZjC5pLgQbSa40MelX8saf/4tX6jFnJr
         B9sLgxW+aprZ4C6I4vmUXHlRWBvqmDhy4I63fqBXGxfLyFZGTfaZmWfIPRkju6GjVikY
         VpAN4hpgTMIy7q86c0sri9/42p4etTVclMLZlhViWHO1UAxt0Vvj1c1EOpuOp/QB6oFG
         olkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sgIMx4JSD5f56bgofErAUur/x1goi7NUTJO95TXtuTo=;
        b=lxHctuziNuyPsN5No0EuNkPEjDunGuVPel8U5W62WZdHWOuMUyOtKLMcGerW5yUA0/
         AbPY7MMyFZK2rKHf61eiU0tx0twEXEh8TyV236HU+M3VgJ/deRUsF4+dZGbu91aSJS5/
         /5VG/5CE4l0VZz441ATCekHNNMjbvrfxwxWnIPFPgKxIJyXGdaz01vwvh/qu6cMirqq9
         GoHAT/MiUJutsE2G5sgdLaXNNsqiXYnJ71c2+VOx6FrhxnV3rG3SrcrikRqAo7xdGQfU
         4pq3qwCPsaey3mT1KlewDF1AWgudsKe7WLHmgxWa/eP1M4mDV6S+K9UNVaOST3apisKM
         KMoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eC9QbTw3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a281200b006fc7553fa6asi1996222qkp.216.2023.03.03.08.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:46:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eC9QbTw3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8Y6-0002BC-Ve; Fri, 03 Mar 2023 11:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Y4-0001qg-JE
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:46:24 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Y3-0001Ww-04
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:46:24 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so2838218pjz.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677861981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgIMx4JSD5f56bgofErAUur/x1goi7NUTJO95TXtuTo=;
 b=eC9QbTw32CtXpMZw7MxBxjmssW7FVnQ9heJnGwoOomdEjvf/3NjydaugOnklZKp/W5
 JD6sFTI5jJA2GMrJCDnWpFtIm5hy4/51A6I6OzHDGhPheqbNpVD0XPIAw/4BHVABzhWh
 AfxgTm8ubChxep3FGGO+Yx4Rx0Fb+GppDEFGC43ylSvNfulrIJl6uQy1lf8agBcuQq5e
 SYaarellQPDoCLL09XH3iOUaqpn0iiqHkyjjx0GUR6YAewt5C4med0E7stH3eFHL+DlM
 h01Pv9fPgpWGprba2H/3oxNTVobFfMIptWojJJhNgSG4jKI5NVXSDKzqAI78jhQ9IIjj
 WjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677861981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgIMx4JSD5f56bgofErAUur/x1goi7NUTJO95TXtuTo=;
 b=pmPDKPRf9pviaDH3BLiRB6lNa2Wh8fnv6M88ZGusaj4Mlk0E8qbxzGajyCrb9/LgoB
 sqbA5nLjWGDJzFoWTp4dgzB2JiaT+eTu7K55BQRfVsTLjlZgQC5TA5DGcMBYxpoqWMLd
 xYT0EjDq10+Xr7oqJCo9AGXR207+bgpvRU0CoRXYyMMiFqEFZD/UxIusqHhyN+2PwE/9
 raiDeDuBCP7zkOHnr/1cqSrn1Q8vC/AND/Xq5zXRNzqy09xVBYdDCxX3EeUOgOyDO0MK
 BZX+5o7x7BQCkCrHUY9Q7NyDxxEM0l4dE8ZstcuYO53SLiFJ3dMVjydv3tAoYMf8fywx
 catQ==
X-Gm-Message-State: AO0yUKWLaT+HTV8Ewpzv09XCP6ma8lcHcIrPShlAK9nv81pMBKe1A/Pr
 nomsTdn23Fx5KFqbHICZ5QGvLe5rgXMfvxZMmfPmwQ==
X-Received: by 2002:a17:90b:46d2:b0:237:ae7c:1595 with SMTP id
 jx18-20020a17090b46d200b00237ae7c1595mr848370pjb.2.1677861981406; Fri, 03 Mar
 2023 08:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-5-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:46:10 +0000
Message-ID: <CAFEAcA_oEcs04iDgawLTCZvdBrCHi22X-jSLC5O7f5htuTD3yA@mail.gmail.com>
Subject: Re: [PATCH 04/13] accel/tcg: Honor TLB_DISCARD_WRITE in
 atomic_mmu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Uf9BXlZ4pLJR

On Thu, 23 Feb 2023 at 20:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using an atomic write or read-write insn on ROM is basically
> a happens-never case.  Handle it via stop-the-world, which
> will generate non-atomic serial code, where we can correctly
> ignore the write while producing the correct read result.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
