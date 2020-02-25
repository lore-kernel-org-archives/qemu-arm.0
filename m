Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1729158lfg;
        Tue, 25 Feb 2020 06:07:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvDmmwek9KXM6BZACjBAo0jPA8xJQpCEGGrYlcIXCmnK66vHYzPHK2ChnzliLSu20qS7dX
X-Received: by 2002:ad4:498d:: with SMTP id t13mr47512835qvx.58.1582639678209;
        Tue, 25 Feb 2020 06:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582639678; cv=none;
        d=google.com; s=arc-20160816;
        b=nbLjUctf9oqC7Cq2Ewi5YMBKTMnrWKXmOT9uMsg9vvCVXbJIIZAr/DYOJI/WQMQGWP
         /OV69zRfkC9Zm7ilqiHXAgKogBpsLZ4f0pH6e030iSjt+C3i1QwlJav690AwCGLjUKv9
         TTYN+6J9oDTeE7agGQjXu1tYsdb0vMM+ygoQNLF1jw5EHXQ4/dgq6MjD3hE8DI9nbYQy
         v/OTpvTUa0QiOxwJU3tKJdzNLyqoAdpj4ZDfnV/wxTqjFUm1Eoy+fFmp7ItvM31/F/DJ
         ZbkV+RWrE3bVp+iYlaJyoTnevGo/qPLcNCxnQKkefKJRmCKxcMSgEC44zJa6S7Fd/Bbl
         7VxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzMVoR91HswdwnauVZ684KVvcNe5IwZKVBtZwTajq84=;
        b=ydyEWud6i5L4Fhewd34qPyY7sexne46hR42My2TzuoNE0ZgXiTUk8xul24DMv/dyaO
         AwzKzDNcxoUmOPZeUMPE730aI1CckYCKk/OIsQCr0ZCsOKntGuCca+KXrJt2Ht6fKzS6
         hYMltpxiMoHQHAt80qDJHezbVT4ca0ijeEtbMqVQ4u9mT6jkvNJNTrXtBfS1DMkFmCmq
         EL1GPrOvyjl2kSktip27KZD33VGdtJ2NpbSXnwZd2qbLXIllnwwPDUR3+8SMqKRkYJNb
         quZc5/fvCyvfGXhfDafNtDwzXSAHVzFN8bydxyK7GmenvmeIOe37QYb6XKbEJAKyPNB+
         aeBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Vq6/v1KG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si1211520qks.75.2020.02.25.06.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 06:07:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Vq6/v1KG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6asP-0003ve-HR
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 09:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aDS-00023W-Or
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aDR-0006Ho-Q8
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:25:38 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6aDR-0006HT-Ju
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:25:37 -0500
Received: by mail-ot1-x341.google.com with SMTP id z9so12019230oth.5
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PzMVoR91HswdwnauVZ684KVvcNe5IwZKVBtZwTajq84=;
 b=Vq6/v1KGVJEsPf8/2h2ExtDqo3KjTARcXNeTRaMDhdaLiJ/Gk5rWlUi13YDBYhYSkq
 yeq8VNZBKFFubhW+JviIEC3qGXiA+657zX7AHVLQs1HC4Ds0l8qHbyUMJ32X3JMF5EC1
 tTBaqIfRSTgxOi+CphAOuckKkncrFowxgOrtKupF6EhVTq0/QECqUHgoAsLhjWPc0bQo
 CqnMnLcX5tTSmGeQTqsiVw1lLir3+QTbOpDaRCKtHfG4xrpM6cTTkbFewYYaQp4R7fFu
 LJ/dlGReXgyZaGKk9DM+klg+BQRR46rIZA/etofaL7hnY2lWPKHyprj/YGPRWiLDmToI
 A4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzMVoR91HswdwnauVZ684KVvcNe5IwZKVBtZwTajq84=;
 b=kEbeOpuTOWQz5H449YmdIIuplNBK+ZVrlGkNPVLIf8IxphS2Xz7T2aJg+BdMNqBwWa
 MSi5A4WDB65t3xdpZMFTmZENOeV3AQLBa2S4WtP9nZJK+jeZNzYKepQ1kj/AyYrYRZha
 v/DQGMZuvUqpquVjQGjizV3VT6bf3d20JG9V5KY2NPXWjr5gGI8b0ICuHSrGv1ibRnS2
 V4n45/UvVk3nwAzUv6fvHUtvxHwOeQU9k7QhpnG2008xg/7Q5vP2Z3Bq6cAHXbkxbmbe
 j9m+KwMjNapbbcHocNvqMWNfRC/NBYwq9EfODPK/jRpV1qaOVpXgTboxAjlNVwD1uN5V
 MHTA==
X-Gm-Message-State: APjAAAUHnaIvPIx7ZTwuc7GLCLG7RXu+kS2xVcMnfCRCrPa7FDtpvx3i
 WnpCajj/PAKcwCCT2gzxIL+rocYNOvQZurwV3WG9tDV3
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr42522673otq.221.1582637136635; 
 Tue, 25 Feb 2020 05:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-10-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:25:25 +0000
Message-ID: <CAFEAcA---ijYQjSGCU4o3Ju7DO2FDScPEJ+3hqRX-RKeXNPCJw@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] target/arm: Replace ARM_FEATURE_VFP4 with
 isar_feature_aa32_simdfmac
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vslpf8CYIG3p

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All remaining tests for VFP4 are for fused multiply-add insns.
>
> Since the MVFR1 field is used for both VFP and NEON, move its adjustment
> from the !has_neon block to the (!has_vfp && !has_neon) block.
>
> Test for vfp of the appropraite width alongside the test for simdfmac

"appropriate"

> within translate-vfp.inc.c.  Within disas_neon_data_insn, we have
> already tested for ARM_FEATURE_NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
