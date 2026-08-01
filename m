Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1724CC55173
	for <qemu-arm@archiver.kernel.org>; Sat,  1 Aug 2026 12:03:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wq8Qe-0001zQ-GK; Sat, 01 Aug 2026 08:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wq8Qc-0001yc-D9
 for qemu-arm@nongnu.org; Sat, 01 Aug 2026 08:02:58 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wq8Qa-00053N-Qb
 for qemu-arm@nongnu.org; Sat, 01 Aug 2026 08:02:58 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-667f1390f58so2618582d50.1
 for <qemu-arm@nongnu.org>; Sat, 01 Aug 2026 05:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785585775; cv=none;
 d=google.com; s=arc-20260327;
 b=G2rc4DtfRDLMXGT9j3QjwEp7iq9VA/asKTUII2uvvBrkefMtIdTfd540aC9XSwhXES
 wG/MhuZ/8aHAQzRaQ04iLa8A1wx+vdXzQVYJQafpxg9B+QXkWYLVkUczH2PNpCChgyIN
 infqi1P4Kq9OPcjT2l9JkNxNBwFAcTInwPCxxi0eSDQ0Vz8R/sshqjSaOCk2oOl8VWhf
 E9hzBxXxjuIm/4sBv/dPp8TV2Slj2t6bJzR+v47vVj+O00bOUOoy8Vp5TJpxIt91d9on
 azv2DB+uYLMF9yuPPG2refToLj5vo84vEjrTwWnlWOlNbmy6ThmRrSybu/7dArhCVOrr
 34sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Cy9zAdN3Y3pgbgW57Qg3suhyIf4Ln6sO/8ETzrpdyTE=;
 fh=2sqsOHfR5ka6rwfyG7vz7+t7X8KulYk67Cw1QJyfqbE=;
 b=dIoC2bot/i9LTPVwTfQkiE48NHkTar+aqCqYlNjoqtHfZSc0cSpu2xQaXDJSO0jbM0
 lB3oi8wWkufehC5XIE77TZWrshkmJJ76ysSA8lXXOBUj6f28iZkENXwvfQ9vDP9SpBwj
 c1mHdrb5wljVNUaj0ZDZ/WVpW/GdsInIv5jqgmVw/d4abm8jEUWAiXCXcnWWRLEDfnZF
 Tb68MHeISwqly3ixi9IBCgs5PVSK7pKw3yAfKa68HdFUYFPWM521dzmqUKeS+pbsuJ0w
 hLZUzWsMjm4hvnHnTXzDXpiUWUB7X5HWR59H27PEXHoGyQ9WDSw7B0HZAT3ktMFg/B4i
 6eNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785585775; x=1786190575; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Cy9zAdN3Y3pgbgW57Qg3suhyIf4Ln6sO/8ETzrpdyTE=;
 b=Dz1avYhL7I8pV7js//Xfxhe+65fHubopy69Bjv0ZTVTp6kY8ObsLpDOmGkj2sNy3KY
 uELPwodeG2k5VUXf+F1OOaTXL70oJIyMovn3k5tDRM1VL3mYnnDPYvHIqDcO2nwY0QGN
 /lMaehb9vf8MFpPlB43Ah4q14xCwdDdJwA5NCZYyBNaaMMLHeul+MX+98m5gi2bK0q6w
 xPdEl551IaL0wzVGsxwilRHYaW4h5xHtqAGHNqOFTPRPj4rz7BVxAg5CGxE4PYeJeE/L
 l++5wx2PUU6RNJawRzFQrtjSX3Rw9hNTsJDFfpSUzZjh9DXMwuJwglPkQdJNEi+nsALW
 E3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785585775; x=1786190575;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Cy9zAdN3Y3pgbgW57Qg3suhyIf4Ln6sO/8ETzrpdyTE=;
 b=sswFFKscQ56hd1ZMy9dFUQWVW4JViomdZJkRrlj7LiwcuPnbpJ+pO8ohpzxxJdqzud
 jRvyXVorflZs56eIObvr+RMpXajvaatvB+sDFsQQ++kyTYZsxzIrBYBaHJEtojQya4Pq
 juaDfyS2NjRnzIULngygBXab+lk/tPy405GEqURRcRlQOVVd2ztdrAQxs9/WSc1aGa0Q
 lrvr/Od0wFnmQhP6vNAJ1o23iBty0gi4hhvk7GUQWc8vHcC93aD9dNFYahB21ovqSA1b
 m24W91aVVZbFpjoO2RcCDNciYyJhNziI+6DDrvldLzT5/SjSoA/2REoYn0hf9X0bxI0b
 vSEw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roxt8FTiFFeCc9En3mGi3ygwSI0LvOw6yqJXFW1qpo2nV35GiknHW3X8onnYrTg8+Ka705Kh7hYaQ==@nongnu.org
X-Gm-Message-State: AOJu0YwWR6vRU52vPCALrwxVjK50ypyhZyYIAu1kKDFTD8u3hmDsMAKK
 r3fVU6Xb27YNHJCOkRByGa4ZVUh07O5kyyVe6ij+32U8R69gojXJIw126xHS6omfEhx0Lygyfqo
 5PKAU5SpfDsk5HyzdDku+JXwiEOsqdxYpK9v6TADUtA==
X-Gm-Gg: AR+sD12kXK+T9Bs574Y2yyMk5NzKxBgPMYNF/6W4RbNZIhAKkaY0f3uE9xm/CFXmVrO
 gG+EYDIDuaHRG+i/5/Jus9dWc+FKHgFd3QTVkVx4NJlyR3xc/W2Xv3kMfaJJpwT5oZ4Vt8NWJ81
 AlsZJYLSNoO9SY7nT7b2YpWmnzE6xwFdaN71U13TXSirbDXY8dTud4bX0i46juFljNa3LCcrIOk
 +OHPb2V2sPZtNuPQCruMeBMXYw424pJ436mTJCoxQH18XXBCBrOdeyf6YBKYqSKnmOKtxQynofy
 /7/Tl2b49UacijlK0FYYl4cty+dBRBp3Ij8EbwncvwCG8w6sN148s6CGmuUOFRKDkedAAFy60dr
 ZZsTmhj6JeywMIqa+SuqRTHslYm6W
X-Received: by 2002:a05:690e:155b:10b0:667:e04a:8a3f with SMTP id
 956f58d0204a3-6694efcc215mr3765403d50.5.1785585775108; Sat, 01 Aug 2026
 05:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260724030616.76180-1-richard.henderson@linaro.org>
 <20260724030616.76180-2-richard.henderson@linaro.org>
 <CAFEAcA-BkEG59qM8sRtEtD-Y0-LC5sWfuWhMFTLnEcGDcvvDmQ@mail.gmail.com>
 <2efdfc06-b522-40f9-9aca-88d1a258ea14@linaro.org>
In-Reply-To: <2efdfc06-b522-40f9-9aca-88d1a258ea14@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 Aug 2026 13:02:43 +0100
X-Gm-Features: AUfX_myZWXT3hjyw_gscfcrMhqzVB-Re83sU3tjqw1lh98aGsoSasQ1GMzqdn20
Message-ID: <CAFEAcA_LP-QMw=E4yb+tnY-Q-hOzD0TAUL6Ay2Z0oys9CdWTig@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/arm: Add FGWTE3_EL3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Fri, 31 Jul 2026 at 20:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/31/26 09:30, Peter Maydell wrote:
> >> @@ -553,7 +553,7 @@ typedef struct CPUArchState {
> >>            * FEAT_FGT2 will add more elements to these arrays.
> >>            */
> >>           uint64_t fgt_read[2]; /* HFGRTR, HDFGRTR */
> >> -        uint64_t fgt_write[2]; /* HFGWTR, HDFGWTR */
> >> +        uint64_t fgt_write[3]; /* HFGWTR, HDFGWTR, FGWTE3 */
> >>           uint64_t fgt_exec[1]; /* HFGITR */
> >
> > GICv5 also has some new fgt registers, incidentally; implementation
> > of them in my w-i-p gicv5 branch:
> > https://gitlab.com/pm215/qemu/-/commit/31900667e440a136c60b984c9e7c9e9a95d708df
> >
> > I don't think there's any particular clash here, though. The
> > one thing I do wonder about is that FGWTE3 has only a
> > write trap version, whereas the gicv5 regs have both read
> > and write trap versions. We rely on being able to use the same
> > index for fgt_read[] and fgt_write[].
>
> We do?  Where?
>
> E.g. HFGRTR and HFGWTR have separate names, and could therefore can have separate indexes
> in cpregs.h.

For registers that can be FGT-trapped independently for both read and
write, we put only a single index and bitpos into ri->fgt, and then
access_check_cp_reg will look the index up in either fgt_read[] or
fgt_write[] depending on whether the access is a read or not.
Essentially we rely on the read-trap config registers and the
write-trap config registers being in pairs with identical layout
so we don't have to separately store an (index,bitpos) for R and W.

(fgt_exec[] has an independent order because "this is a sysreg
we check for an exec-trap" overrides looking at whether it's
a read or a write.)

thanks
-- PMM

