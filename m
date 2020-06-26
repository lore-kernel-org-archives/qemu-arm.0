Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp442845lfm;
        Fri, 26 Jun 2020 06:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIFKcIRVQvlrqRy/UoM7AudlPPkt6salzgWJrW5uNcBBbgodriEG4PhoQktWUqfgkH0tyn
X-Received: by 2002:a25:7146:: with SMTP id m67mr5202750ybc.384.1593177859021;
        Fri, 26 Jun 2020 06:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593177859; cv=none;
        d=google.com; s=arc-20160816;
        b=l6/D7fBco1UpwSSE369swPFMYgep0WzFblYwdUKRoMWwyHH9jNtC9vL5+v765h1fg4
         5F71t6ek2P9EsZyz8QBgEgzbWHdslrGlVEwBtKaAOEELHpyJbNjMnmCLEPMsr8W9bPkr
         7/OaqdUQvnvTXHn1mys8OaiZoQCCdCzEgRblSu7umMPzH9gyf0npG3vsGt9uBDDmQXLl
         LHrnJQWIfVs1kMNR4VS7P8I5NVi8h2AdOGsKPROcBBGIIdQ4QrAV+g/S2rsM/mzoh6OZ
         KNDbnhWzNJ0ahAje8JYMImHNUQYCBJwzqTbU3CrcxQhwPw/ALMMOnjZXeC5q2SWS90gf
         Wkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6v4KUOtWwsdyqJhOAij50HyooVa5temwCZtne/6b4K0=;
        b=alpiOV5ZXsp7IUTrO0K0ZyQ83n2rh1wMVhZC+NF/HsZl2f2lvtGPLk/NFO4d23upvp
         o4F9HUmSzZ04o6nXFsEbSNlleojz03X8VJkv3bCk7NDCaYCgeDR2DHDo/fBXkGQg0V+x
         pH8bM5styKF+R4zmo3/HmbVztvWFWnr/Jv4HYgJz4F4cQFk8ncorMSLGRKqqyp3b78dV
         QhgE+8o/U9zeGIrMpopajr8eC3oeZUcoSgJruGWoZiKM77JkSdxqhwfIXxMiZ6n8qjFE
         uV4YiwgmS/fBT/fVqzwb3Izz6HP1yQYxsnMPUbxQqYdomASlyBa6Euwc4AGn3l1SpiTV
         7PRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UraXFW+r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r30si4450192ybd.146.2020.06.26.06.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 06:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UraXFW+r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jooL4-0000OW-EI
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 09:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooKS-0008Om-E6
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 09:23:40 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooKQ-0002m7-Mg
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 09:23:40 -0400
Received: by mail-ot1-x342.google.com with SMTP id 18so8581328otv.6
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6v4KUOtWwsdyqJhOAij50HyooVa5temwCZtne/6b4K0=;
 b=UraXFW+rduRFVNjdWPBMt6YvwVv2+Zwo3MqCyXptDXVc+gLOzLqWFP7PRM2goXYMX1
 PQswvtuJu7Ai3qt0AVEfwrIW6W76ZmoZ4uUn0m0oXsRLoQm/24iLY6UUJXhEw0qXZSWK
 aaf1Pynl97lDB0XZWxDLdlL6R59cuRm7gYMLu1bIczugQwiABz+CP4y+ksEGjwwwR1Tw
 0JShSd5TtDOyJVBA8lrMJOkXj4byqzl7XmmGeML5QS+6FLdAHevr4kz03rDjOCj+3M4+
 SKw+BoWzAVHEmxK5HVUDGg6q+JbQSBWktkA07aqYLNY1hld2lWqQE4i2ofB4CXvWh0aF
 v5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6v4KUOtWwsdyqJhOAij50HyooVa5temwCZtne/6b4K0=;
 b=DOdGphpUBBiJVRHQejRAFScrKx2aGWrVq+5erVgSN20WQH7h0VZqVWJ/R4+KkY/vtR
 +kib+VjeNyJvTXDJlZ2b7bWxGDaTkne7EqKE/Y+w0bTsNQINVfZnb2SEAM6HEqu6g0H8
 wqjJ38oOAOI2+bw4kC9k4Nhmo1SjsNsnBjYd8c0FxkYgDBXTszaRMPzFiK7xZUSUOQfW
 wfZ7Zj5A5Iu+DXNZ9I7eO9/B+M36IYb1nMNqwsvJ3U0folaIeadwsHi4zCj8SaNajqDZ
 LAvGb5leGvrao45wAUBlTNDt3Mx/D0ATB3IKLY4mobx8cBncJDB0hrzOTZG13YfUGnvz
 332g==
X-Gm-Message-State: AOAM530F7jw/SCgK+xaKL9wqm9ibT462KOAwWkYMvAx3Up9pzIzlS1Ub
 OCI/6Xpz35jiQsizVyOfOQity9iyXz86PjOexd6qrg==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr2435528oth.135.1593177817291; 
 Fri, 26 Jun 2020 06:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200626033144.790098-1-richard.henderson@linaro.org>
 <20200626033144.790098-45-richard.henderson@linaro.org>
In-Reply-To: <20200626033144.790098-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 14:23:26 +0100
Message-ID: <CAFEAcA_tLoy8=ZJhmZhsHyCpRNBKOV1JG8ZJBhJHi6mMQ63AMQ@mail.gmail.com>
Subject: Re: [PATCH v9 44/46] target/arm: Add allocation tag storage for
 system mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Spickett <david.spickett@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GekO3dde3XUM

On Fri, 26 Jun 2020 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Look up the physical address for the given virtual address,
> convert that to a tag physical address, and finally return
> the host address that backs it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
