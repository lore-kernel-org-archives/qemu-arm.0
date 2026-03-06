Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C30FCC056
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 18:21:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyZnu-0001oP-Aq; Fri, 06 Mar 2026 13:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyZnq-0001nW-G9
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 13:21:34 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyZno-0003cW-Cw
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 13:21:33 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64c9707fc11so7182647d50.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 10:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772821290; cv=none;
 d=google.com; s=arc-20240605;
 b=X99mNnTebEqbvWNhgz5J/GQcdkVEEfQ2IzpPJeSlKFcu3X8cdJufHJZbUVPJsaJD4d
 VOxmWQYTkUh1t9xjUul87CjkcMAu0cvwIura7gHHGhhMudOdDL2jnS+v/rWPsRi1XUNK
 rkTdbNMIJM3Ojw91A3devKorLK+et2kfOnR7/7SDhK28cYVtzoq1LGTDoklqr8Eb0tP5
 R6nWNS2SZvHVMYdxqsP4gyzEPqD+i/9yPxfgZoiq2UsXMpbSIdtTjpCMv2E0rHPUdo9b
 03aH5tYf3YVqAxJ40qfjFeBY4nWzx1Tsk9OSnwfWPtRk/R29LGZBx3BGnvT6XFOCFekW
 2YUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=v/sgonH7NBzkWVYQYkEUKAH5wS1cGADkJj/ukazuJPI=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=XcieV5tOcM6WWtH8PPKfGOzeaOz9gHIzCmWByW2yATxNdNT66c9YNtdvYai9tcX8K9
 fqSd/772KAJi1L/5AmRI/1m+s1yCc9+jhl43lorZ+Ps21q51oRrIekQke1hxz8lHlABx
 h5f4t7cn/PILG6e0Drg1I1v4+NAg5vEMcKBbgfSu0ZUi35K4E8/hB82aSLc9B6IfUvyc
 Rf0qil0qP79NOVZRQXn0AK4Gryvu7rdz5H1OpPude0ajwLZLOh3YsfJkuLwZ7E/rruRB
 yKdNcJ9LJBZMAkRjbl2/iQY6ij8iCoT8TIModmSBhLoPcZPKUHUqH436Q7VPK5HJR3bQ
 2WOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772821290; x=1773426090; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v/sgonH7NBzkWVYQYkEUKAH5wS1cGADkJj/ukazuJPI=;
 b=yo+QcdWy5usRE2jOQaWSsusS6GHmNZNHg+J+we79skClQhN2aNarnR8L8gdGmjPsmc
 VBX4VjovLYHsqjZ1T8Iv9/iUs6+LtHjsM25Xd58UZn2Nl9F9yWeL8ur0hqnBe4LkpxH1
 vRJKyGVrDrLpeaQL7mRw0ofOUi3hZxSpE4JJjPPqUPtGn8UEw9phmZNyePh2GY0Ef0Gj
 K7ISbHujoFvJWHEqdTSmhIY9IIhQ1Jt42uK7ZZw99+PyJ1nfXfZn40AsjlaEXwn/O5dW
 oQh/ltBzHa76uEHwDjMoSY+gN9FVrLq1tcg9VlQiHn4tZlauiMa+6oaQ+uFXZkI9mroZ
 Cphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772821290; x=1773426090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v/sgonH7NBzkWVYQYkEUKAH5wS1cGADkJj/ukazuJPI=;
 b=nvz4SIx01IpqoXV/uSVmyCV63Vp16LlAggA0MyS/eqagIY7rDAgZeVTaUheSR+PSAT
 39097Vsa7/cIfJjPdyPWtOLDLzayICo0SK06bdvASWGe/jlq2bsgM46zpNX0JU8KN692
 SlkgTnADdsmNGgQFq//GHiAHJS6nIUjCBFksWLRjkuaUGs5SaL2uubKiB3AMA1ksysPJ
 NDF9wmaEOHq8kHQ0XVLssEpv9igfKoqXKNZT41mHf/yo9+x5n2FAm49ULDdUkJatfHup
 WZ8/hNuGqs7Wi0exkQQSeg62U2lD4ugMSGVU27ATuXDIks6+P+luae0jJU0Lug+z7tni
 L+8Q==
X-Gm-Message-State: AOJu0Yy1o2HYHQPxx30lUw7b5oRo5XCWlBa5FgmgVKWrKxYJkXIJizBx
 cJuoPaxXx/NBAVV4Y7G5Kjd7XGw2lu+4yOphiEqabXZZzrG9SF0Rkhp2RAiUbSrdWwnANw7h2Vf
 KiUgGRIj39l36CEatpzmhA/ENm9QRs3PtDKJTwtymnw==
X-Gm-Gg: ATEYQzyP7yYHpJ8GTuG90A49H/KXIHlAN2yvN8Q4SrckN+M4CXwYPwJwBdICc/Cj+jP
 cOwLoBXH4lKmdTcGb2MVrrPLTPjc3+01L2sMsrx/ww9v5QiDnVKcYPUk3XeA6aDryZgZ2FSjz41
 wKQOijGLi/r/Ze4YGUq1H6qpCYFnfiozrpK0nMjT1Z1qX6h8Un5slUyIZlLxcVwhLsM1RCSLwse
 rmMvCoqyaFjYc+c9sS5ZnptqIHrPRkV8oAmTESOPBx8WtH/ZfAq4Ash9nLRS/qp4CUgZ3J/eRYl
 W1HktMvx4B+wO9xFs9oOjoFYkWzxrFj0uR7eCNele7ycGVrAYnSWThD38NEOKpsjgnA=
X-Received: by 2002:a53:ac90:0:b0:649:443f:ab2a with SMTP id
 956f58d0204a3-64d141f5c5dmr2868867d50.37.1772821289470; Fri, 06 Mar 2026
 10:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-20-peter.maydell@linaro.org>
 <20260306181008.00001850@huawei.com>
In-Reply-To: <20260306181008.00001850@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 18:21:18 +0000
X-Gm-Features: AaiRm50UZlofQL7qaLtHlG9U5ba9ujl03MdIhD9s6PoTqk5BiE2zue5yM0BTBds
Message-ID: <CAFEAcA_wJKO6nHnEJ3CjHZkt-1PwrVaWZbNGwy9ZarT477P-Ww@mail.gmail.com>
Subject: Re: [PATCH 19/65] hw/intc/arm_gicv5: Implement IRS_MAP_L2_ISTR
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 6 Mar 2026 at 18:10, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:01:26 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > The IRS register IRS_MAP_L2_ISTR is used by software to tell the IRS
> > that it has updated the address in an L1 IST entry to point to an
> > L2 IST. The sequence of events here is:
> >  * software writes to L1_ISTE.L2_ADDR for some L1 ISTE which is
> >    not valid (i.e. where L1_ISTE.VALID is 0); it leaves VALID at 0
> >  * software writes to IRS_MAP_L2_ISTR with some INTID that is inside
> >    the range for this L1 ISTE
> >  * the IRS sets IRS_IST_STATUSR.IDLE to 0
> >  * the IRS takes note of this information
> >  * the IRS writes to the L1_ISTE to set VALID=1
> >  * the IRS sets IRS_IST_STATUSR.IDLE to 1 to indicate that the
> >    update is complete
> >
> > For QEMU, we're strictly synchronous, so (as with IRS_IST_BASER
> > updates) we don't need to model the IDLE transitions and can have
> > IRS_IST_STATUSR always return IDLE=1.  We also don't currently cache
> > anything for ISTE lookups, so we don't need to invalidate or update
> > anything when software makes the L2 valid.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> One trivial thing inline.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> I think other code is all one blank line between functions.  Guessing no
> particular reason for 2 here?

No, no reason. This kind of thing usually creeps in during rebasing
or shuffling around of pieces between patches and I don't always
spot it.

thanks
-- PMM

