Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1288159ejc;
        Fri, 20 Jan 2023 10:23:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJwQM+FTIP5e7JgSuoV791wP3xt/ADgbo1vI4pMhf+vAe2Atxc7bdcjztmperwmLAZvRgw
X-Received: by 2002:ac8:5b90:0:b0:3a8:30c9:ba8f with SMTP id a16-20020ac85b90000000b003a830c9ba8fmr31316709qta.28.1674238989648;
        Fri, 20 Jan 2023 10:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674238989; cv=none;
        d=google.com; s=arc-20160816;
        b=VMxTj0vNY3lpiQu5vTC4dYn4ks/LS1auryM27m3rZAO43hFaxhOe+nuyJyO+fiuqNq
         cMAPoK1X2yH2zU1bwa12CY08UT3EdwSRU0K7QxgJVqHX/rmks/xIedMrcK3TWZ9yXYRt
         vBhx6YKt+hdaVjjlwZV72UR8Ewtz/gbOR33pUlHogyQBuMq14czHsoDJxlM1FSToZAwe
         qYHahnB4hngJ2vZfF+l26qBcNvQGP1+7hkzR4sBvdTyAk7RoWH1bqopPBS9tjUZw87t3
         Nxz8TeGnDhMvI9y/HLwYBpCU3/73VL8JTmFlcsJzETqbtnxuVJ5L7aG1+hipIWa4czFI
         DtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BHGbdpUEq+ly8Y80sFE/YLFYBzrHFkyHeGlIttzRn3g=;
        b=n17kzW5dh5lkb/vyE/5yjDB9CsAfFiksTlryOzi98DODcAC0YGXM1Hojs7EiAPQS1j
         nHkE2RTijfFEL3cnYmPunL6onF0g55teln6seDVAthBaOTz8n4L45BLC34Z4kqA2OVFL
         LRvE2/kCGfq9TlzHpIjHwsnyawDAAcfm2whikeXq02E54n0knBv1MunVk9ds/yt6Gkhm
         bRjaQuAegGSgG9A+hK3DjAVeZbclJV8If1zZAMqUdVkHuqli4xKk0nfVVU3Q6/wG7XLj
         6DEqKWQbw7HEwbYQGWwhxpU5dOW1heeeifOlY9ESAOixqjwT+koyfJn0oUBy8xddYCf4
         hWdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvdwxYzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a05622a1a8a00b003b63062cfd8si11069354qtc.58.2023.01.20.10.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 10:23:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvdwxYzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIw2b-0002MV-9X; Fri, 20 Jan 2023 13:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2a-0002MF-DW
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 13:23:04 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2Y-0000Hl-MA
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 13:23:04 -0500
Received: by mail-pg1-x52e.google.com with SMTP id g68so4752579pgc.11
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BHGbdpUEq+ly8Y80sFE/YLFYBzrHFkyHeGlIttzRn3g=;
 b=UvdwxYzgUDE6p6+Xj7h0ff8WFkOntbeyFsXzScbsDsv5ZEVaiOB/sRRzd8WwcdL5B7
 PE7KnTeArtvuXBYdpXyBXPz5Pry2Jcjzu8PxoCojdWrr+hfW0hG2rEk40iJkc0Ex/R1C
 gjFC+BE5DN+F2HqvxfBIOYHrfWMYB9Thf1t+62zA/3vJKQZD2gNX/IfLbK71ClB4xgyv
 q1LuMFvPyjd/yJTHEMQifEypJrFZrBbFk/oEcqMSG4XQGE3DnaHwoFhhguJNYn4IUwZt
 a0EtMO61PL76aMFwXCWai2D4vQo1LRwWYgmebojMdaff8dTcXDn8Y8Rc7VlIKrRw0sau
 Sxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BHGbdpUEq+ly8Y80sFE/YLFYBzrHFkyHeGlIttzRn3g=;
 b=kFPWl/A1stadWIYN5EDlT/U89nVUqSn0ANDhNRDDeK5zM4e9k3MXNdb0Xew4s4hvxz
 3tdba4lQgEtEVPAJmIB66uCRXNJA3SOj5pGSdTLd6YB+/f4yyyy6nKUJXzzVr/+bjCTH
 rDqQ7GGlMRzEWzfwC5GvOWmUpsAGeCyUKWclhXe3n/G3cQFOsBhz34HwIoqyKU2cTzCN
 z0jMbdk04JRBPw2B8wNBU8dn20T8U8Nt+sHI0Wh0f87n/g97YDCuVriC468oNLknmZat
 2B5edDYpXRyOgFolUgRfn4D6dkZ5JLxdiHNjGILeAePyVm0mleyb5dnTZC/nCBfYUJMy
 ckZw==
X-Gm-Message-State: AFqh2kpiN9CPKJtL1/0+ZjdT+0IIkqGfI3DqolWw3/bZR8klGup4JmMa
 9buHy5ynQuS1Q9VXcaHC7+msAo93RF4N9iFRLFO9b8E6ydmD+A==
X-Received: by 2002:aa7:8d1a:0:b0:58b:c7ef:25ca with SMTP id
 j26-20020aa78d1a000000b0058bc7ef25camr1693489pfe.51.1674238980732; Fri, 20
 Jan 2023 10:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155447.31702-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:22:49 +0000
Message-ID: <CAFEAcA8RSCvkt+k2N+At67CYZejJgnrkqCox-meq0TtraooBCg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/char/pl011: add post_load hook for
 backwards-compatibility
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: 2PKnhvYdrUZ5

On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Previous change slightly modified the way we handle data writes when
> FIFO is disabled. Previously we kept incrementing read_pos and were
> storing data at that position, although we only have a
> single-register-deep FIFO now. Then we changed it to always store data
> at pos 0.
>
> If guest disables FIFO and the proceeds to read data, it will work out
> fine, because we read from current read_pos before setting it to 0.
>
> However, to make code less fragile, introduce a post_load hook for
> PL011State and move fixup read FIFO state when FIFO is disabled. Since
> we are introducing a post_load hook, also do some sanity checking on
> untrusted incoming input state.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 3fa3b75d04..4df649a064 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -352,10 +352,35 @@ static const VMStateDescription vmstate_pl011_clock = {
>      }
>  };
>
> +static int pl011_post_load(void *opaque, int version_id)
> +{
> +    PL011State* s = opaque;
> +
> +    /* Sanity-check input state */
> +    if (s->read_pos >= ARRAY_SIZE(s->read_fifo) ||
> +        s->read_count > ARRAY_SIZE(s->read_fifo)) {
> +        return -1;
> +    }
> +
> +    if (version_id < 3 && !pl011_is_fifo_enabled(s)) {
> +        /*
> +         * Older versions of PL011 didn't ensure that the single
> +         * character in the FIFO in FIFO-disabled mode is in
> +         * element 0 of the array; convert to follow the current
> +         * code's assumptions.
> +         */
> +        s->read_fifo[0] = s->read_fifo[s->read_pos];
> +        s->read_pos = 0;
> +    }

You don't need to bump the version id and do this
check based on version ID. You can just check whether
the old state indicates that the data isn't in slot 0
of the array, the way I suggested in my comment on the
previous version of the patchset.

(New->old migration will work fine.)

thanks
-- PMM
