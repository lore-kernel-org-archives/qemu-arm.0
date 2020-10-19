Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3985269lfa;
        Mon, 19 Oct 2020 08:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy45IIQuZlnAXus722AssUcNSJXsUHWafX2x+lwssiQ38Ep0ZdaP4+TDe0p+pnr0CTHQFj
X-Received: by 2002:a25:6cc3:: with SMTP id h186mr479166ybc.252.1603122552656;
        Mon, 19 Oct 2020 08:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603122552; cv=none;
        d=google.com; s=arc-20160816;
        b=nMgkvzSG4NJXdbsBvoIsdqtQgGjTdVVKvQublIO+YSHf8wNsyKLAR6sXXe5zNIPU3C
         zTu3sqIwqTUr54C7r5j2XT13cXtJDPTqa966M92dfIXvfW4nyIIeVQhZBG+8wi4EX5SH
         e/HW7Fz/tnzgASNSYdHbQnYiOKuIvfkkDF1+rHPOg/OWO6EL/R9A064zrN5k41yRL9wi
         2hRVRJFzOqwv3Kq4NJcKxru1kgs48AXWx2HLeLmDGbeOpq5ZulbrXVL0bYSjgvGOJ4PA
         0Z7TRNhg2nyLseyLhlWl4Ws9+IcT1MLDC8pD2lGP2ecTZzrGDu6XVpFttkT3cR6ZaFEv
         Nw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wkdMrxW++g/lqmlcAF149KksYnaPdBXB5LvS1Fjgug=;
        b=cJorAz/cAOEssv6hCqUwVsoSBEpQhLV+bxoqKM/Ovu9vSXhu95j80SaNuUDJ5aAIp8
         V32pznG0MBN2jCQUldJ16BtuOo8WMMaC37df9n+Kjy0bIruV6S7cTKJOeN6CV6PMJhj7
         BXtn2S62dunIUwbVpBo9NEp4TxocBllsCQs1Qxam0/2XrBfERU60UE3s1oCwdDKdohEX
         CviUcJZ6HLuIUHIc+S17wlzA48/P2vc+EaZwwttMWfKuiACjbbl/bc9/bqRyEE8cDhwq
         TWFwcwRmxA5t01/Gd8Nhi/dPmgd/JYiQP0q47MIAkuOkZs3D9pB5ppbkVlPJNtGf/yV/
         x/Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x1NA8XZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si336773ybk.20.2020.10.19.08.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:49:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x1NA8XZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXPM-0007Yv-1c
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXOI-0006yF-Mr
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:48:06 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:33551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXOG-0007aT-Ti
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:48:06 -0400
Received: by mail-ed1-x541.google.com with SMTP id cm24so10790455edb.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8wkdMrxW++g/lqmlcAF149KksYnaPdBXB5LvS1Fjgug=;
 b=x1NA8XZLkrry33UMmksusrrDg4IqNffCgX106rkB0wqWxgAuCrmXV8qMnPkKg94AeO
 GdIlabzqIMyEUS1MmwZ1btcRCSvuA8kB9CpDWblODxpU8ZsD1XPd2CjJcLFAw2U98eln
 u49LAInJPa5hlk4OB6gI47Wr/FuZ1LkoMmbuFaS00H9yXA4Djolv018R2+P6VoSaL+m7
 CIALpHsnrUTX5arQolOdPtZI0dpYMh+zhpr69muD6DsE064yvGIWXGTEal2tM6nzbRoY
 SdUcHoImTaUbIewcBoJzAWW9y6uV/uvMucFNvDuURhDC0AqorRBArS+bbvwb1lvirrup
 PaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wkdMrxW++g/lqmlcAF149KksYnaPdBXB5LvS1Fjgug=;
 b=A+082UJ2W84Txxvau37DimsxlCDD/J1G11B8tdjK/XGkdODmZuG0lx2CrkxYhNw4rE
 dSiT+7/DGWsHcJtlBFzmMlDaB4sQMSoi9gE4DO+z/OGdR8NA6z+f2Bz8Rkv++WIkMXhv
 +ai8WHbXP7EYFungnLcAFQ54MWaiBpntub5tfL6HB9sKhIlWyOjAycu9dHkUuREMuf5u
 wNMG6IXu43+DaiF6XKPRDwTU3IQP1XKz0qsez8i8eY0iiKM7aHqJdL5fwHH7F+9DgwsQ
 sBiDEMhK370tqvTlN/8lXjanc+Xjs9FKqq6CTybRsO4QJwkU4/AcDz6HDIQVmghb9rLN
 eH3g==
X-Gm-Message-State: AOAM530Z/iz7ZZkhHXeMycOwc6BW6t9kvsdiBae5N4CUsGik33dikBAo
 NAVpYhZlaaV7VB13x0tnee++wpAjFU/apuhGKqm6lep53Ro=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr494172edf.52.1603122483571;
 Mon, 19 Oct 2020 08:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201016210754.818257-1-richard.henderson@linaro.org>
In-Reply-To: <20201016210754.818257-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:47:52 +0100
Message-ID: <CAFEAcA-jKTDMym8kagUEvOnKUSvK+6abmOuS_wer=vbuLdG6xA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/arm: Fix tlb flush page vs tbi
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: 8yhgobcqu6FR

On Fri, 16 Oct 2020 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since the FAR_ELx fix at 38d931687fa1, it is reported that
> page granularity flushing is broken.
>
> This makes sense, since TCG will record the entire virtual
> address in its TLB, not simply the 56 significant bits.
> With no other TCG support, the ARM backend should require
> 256 different page flushes to clear the virtual address of
> any possible tag.
>
> So I added a new tcg interface that allows passing the size
> of the virtual address.  I thought a simple bit-count was a
> cleaner interface than passing in a mask, since it means that
> we couldn't be passed nonsensical masks like 0xdeadbeef.  It
> also makes it easy to re-direct special cases.
>
> Changes for v2:
>   * Add encode_pbm_to_runon/+decode_runon_to_pbm helpers (pmm).



Applied to target-arm.next, thanks.

-- PMM
