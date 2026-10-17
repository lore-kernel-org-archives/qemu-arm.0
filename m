Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDC0CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 15:40:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI6WL-0005BX-QS; Sat, 17 Oct 2026 11:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI6WF-00053c-Eq
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:40:23 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI6WD-0002G8-Nv
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:40:23 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8b06c0794cfso7350327b3.0
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 08:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792251620; cv=none;
 d=google.com; s=arc-20260327;
 b=HWDwOcs6n8fLthuj+lkoI190AT7osL1chRmllyqU7zMdn5BK1MrCRG8KrcYsQjJPnO
 YW1oSlYhVEz6TXkEppptCw/rdiQAg+ologfwXKqyyUfDXgKlH3XC4xcIGRw2bzt7XlnI
 TGl2ipgKRPXBL2ZORLtFWopIqyt6Hpnh5LUxhGdSZ94U2DrTyGZf/bZMlqvFEmeRC4wC
 FBWH3pQs1WrTMkcVMafe7yQLW57/O+J/D/TzPBdMh2QgUfJ1Ba7bY98ysNNIn0NTbmTR
 zKbWEVb8J69FohdfAQzmthZarpi3LeZQu/Z/fnFxfES5gju59Vd2iJub7ihS/vOpNs8R
 4POw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GTWxiZskUl0XXvZpBRWj60Fr6tzQkIOL7XZpEoquEAw=;
 fh=rfn9nOo6mikM5gj0kFbJSP11QVngwC6gpHub/Kytu4w=;
 b=USV4ywKbyIff2fCstZm/AbKwod1y0B5yup6Tz8QYNwt9MOzoVa1PQmUV1BjDbtPV+l
 SfeYB+4DAGLNJi/KGgKUyiKtibnFqw71MISUAuFaWGlEqpoHnyDbh6TlWq0aKrMUCW3y
 CzWPx5B2xBqgqXfoB64CJUih1YbVTufBBlCrhcjmqurvN4guCzf4SKs6UnFbsn+48XLt
 m3CkZgYUGHZr5FhvEBNveukVqT1ZJLq1GHOo3kCUv7b/V1V4VT489Y/ApoSmo2Ou8myH
 40TqQ+eGC7ZkZZXomCCTT83DrGF1UFLo9aT1ib5HJOs9qkL8P4QtpFJ0T84BcxA6FO8z
 qvvQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792251620; x=1792856420; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GTWxiZskUl0XXvZpBRWj60Fr6tzQkIOL7XZpEoquEAw=;
 b=zKfyqy/3a8JoQpgr19C+GgSPrq8LoT5RlsuX7ERJm8wTnldvh/LRe81QX3E+SyMJTJ
 rUfkpTnfkzbRZhYgPt74TftjY65Ea2TkBzx/XxL8Rk3O96DpaxMNCkXsQy/NR3DDZeVU
 wiJb1xbTNaq13rwCcwl0uQu5qdYcMn+slFkpBQ4Qy/BFexs8SEOV8OJpkIl+Bijxg/BL
 Q9h8Aovtrs2D/OtsIVdK5C6IpEjQHjIVjhA+TmWTrk92zAVsfG178f/61hk+RhrfjXtG
 URUK9UE/PGQPC2dVV1czEmnT9lO/fT56PM/NODuYxMYhc5YwJ5j3NCQZeWfSy2OkPKzo
 NWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792251620; x=1792856420;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GTWxiZskUl0XXvZpBRWj60Fr6tzQkIOL7XZpEoquEAw=;
 b=qqT4zutViC6Phwq+6kHVUhiTHP2c8sAg+XX87QK1rjo/qovsEgRTNWrxe4NAbAWxlW
 MguDvWrkqOnmW0ReEM8eSXu5l9FbHi5ocGluuuC/BrEctBJfapahDR6+sjK87X8/jqzx
 4mrm6riBD/OC0DXiUtyCihahmp93PTGX9xMbNiv4o1DabJ2JCc/JA2/NA0Kewg1BYmJJ
 D1v5Gq7gGh+djpDI5iPi9ZhQAD/j8QM2R+MCmiMlVqxs8v+9ASj26D04lrDb4HNVnzqm
 tZXUSU4eynuN8egxl8RrVUrh3e4HVEcLu+vQZ8b2GPvlzeGZprkhpFdinJd44VdJ9hSp
 IsXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwC5xxeKDpmROvb1CXT1sEg0Vp2Q3OZ2/8/WeaeJgtl3OolPfe8byTimdwukptdT/l8uE8d8zQ5Mg==@nongnu.org
X-Gm-Message-State: AFq9FYIUJP+xvAXkfOhRn9gFjDbGVl/k6arWyljmMo3LArk9zkdN4vzr
 q1JRp7noW27Z8tFB27AzhONrWZolnzkvBOiepzrXBej0JxtUMcuCB7d/CcjVDvv67q1BUpo8PC7
 z9ZBJFtRsxg+O7x9ct0Zwo1khv0fThwdJU6n2h+bSFg==
X-Gm-Gg: AYBFou21E0q5s5nn8cXTkKWaiiRLpGjgnQKcyBLnK0J/xIZCOZ5D/CeGBQtjXKYpGEc
 Tm9orfBemzjgJs1hlxlXDTwu43ejN2Tmo6mkEn2ZPRgjLu2WHHIpVwUJNOUsE3e/qo/pgtfAJhJ
 SPMP9x1LHWu42xVPxAHZWKOgztecM0UZk08UUjnTSBUaDcwuYLgXJLcWEIAaXmrLIM9D17kym40
 inTNuGpK9lVLN6aBhejXJ6USHRbPbPLEWu+uNpNtdpHX1fOEn3WbNEofgo4iZw0uqGQQio+bWoI
 3UvgFSoxoCd53GCvJDbUw3zNneNxF8mgRdd6x94W2vnBOpeg0ohOWzhMtTX4H7AtSb6aPIArzYS
 Yk0SfrrnXOzIoKG9SETAtfMsOuObvAqiYHRoSyYQ=
X-Received: by 2002:a05:690c:e3c2:b0:8ae:58b9:f3f4 with SMTP id
 00721157ae682-8b0f2183607mr11625197b3.31.1792251620406; Sat, 17 Oct 2026
 08:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA85iTUU=Pf8h-Ojc3jiBbW44V-1XRheVW=JqN-4xNLc=Q@mail.gmail.com>
 <CAGaQodL0CNKahvtmSj3ssbZpVdXZEEZ_oR=Pcbr=Gnh-jUmaWw@mail.gmail.com>
In-Reply-To: <CAGaQodL0CNKahvtmSj3ssbZpVdXZEEZ_oR=Pcbr=Gnh-jUmaWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 16:40:09 +0100
X-Gm-Features: AclHuK_xyOI897XYOdft3bXhz3GWO8j8TG5gBl_bdcl1qCnGHQ5ewaDpCiXuRl8
Message-ID: <CAFEAcA_vL+z3pxHV1PViyVwraTUTT_H45QtWBsJ6d0tbD7-Okg@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v3 15/16] docs/system/arm/raspi: move PCIe/GENET
 from missing to implemented
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 pierrick.bouvier@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 17 Oct 2026 at 16:16, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> On 17 Oct 2026, Peter Maydell wrote:
> >
> > Does the system end up with the "msi_nonbroken" global set to
> > "false" or "true" ?
>
> It ends up true. aspeed_pcie_rc_class_init() sets msi_nonbroken, and
> class_init runs for every class at startup, so any qemu-system-aarch64
> has it set whichever machine is selected. That's why qemu-xhci ends up
> with MSI-X enabled and needs msix=off.

Whoops, that's a bug. It should be doing it on realize. I'll
follow that up with the aspeed maintainer.

-- PMM

