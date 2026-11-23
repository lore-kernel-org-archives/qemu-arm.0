Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E458C606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HGXQr6NT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVTcj-00051E-5o; Mon, 23 Nov 2026 07:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVTcR-0004oZ-Pz
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:58:11 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVTcP-0001z8-Mk
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:58:03 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-67c0bd676eeso2086898d50.3
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 04:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438679; cv=none;
 d=google.com; s=arc-20260327;
 b=TcEsFUFn4W+grHJpwJTEGsZbKJOklMS+BIe5jEXUJpH2uzP+VNMipLgowQmYtCzIiD
 vM1iKqiOio+ZvODzqffBWI2oG4+hCK5PqRJYem9kebPIXkIL176n/nI+RzUHFgEmcnjX
 qRG+s29zcH1JO/w9ZaPNkLx+UkAP41T2vG4cFDFk514sidkQas0Ayh1YedT5xH6MMFzq
 bl8N8wZuEr18T4frjEA23aG0V9Ccohb8TT+I8x2u5z8cK9gReefzjSxUmiZ8QGgdp+PT
 bXzwtnIwxMs22yuqctnkD5ChdyU96OXYvcYruHOzgCcfda0V3ToWVl2Lk7Dq/+jmK8LR
 qFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Hu8FUX0r6Y9mGgQ0uGQnmIafzGx4PfIxy1jeuo4gOag=;
 fh=p3rxsXy0/QElNyEvWLMIr70DFTKukDaNJbZri25PwdE=;
 b=OnpdRRZMPSf8Xnf+xEYoFrWWLzyT2rYiRQZjRxFJr5UE5B6kGtjtL8HFQgb6aS4UfS
 o1CE0b7taRoHM8MobTyAE+/bP0EKAxqAl0bGV5dgCSoCO7VE6sYzh3N6E51rfY6+47+D
 89pCztse8oiNSWyPGXvtLSNaVP9tWrKI3ouT8x5rE0Ow8w8zMkJBWIUQeIHuTQXrb4v8
 0LhNYBiJA7dKCpDrSQ1QId0XmjfQpmzlms9yGH3/MUdUxgsy5rs887+ne7m6KX6ndXgW
 cbdFKVcKr6UEvGCugoDm6Sp5GqBgRhKmeGEYIDiQ1B9gGYUawfR421DdqgRULZWgHcdK
 janA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795438679; x=1796043479; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Hu8FUX0r6Y9mGgQ0uGQnmIafzGx4PfIxy1jeuo4gOag=;
 b=HGXQr6NT5SYSMyc/3EG/ebabmYlEzzo+mUBygnxJmC2+Od5vwvLElv3faiFlGL80vV
 Gyas8WWkicy/R0nWzkU6h546B7AkQMmfF2LSXQq5io+EEmp8YKCidfLgFS0GDZPs0YfP
 SytvfB+nMhiR1Y/uhnZXfr/rdZ1d01YNe/kpTpk42WeCpZStaHONDcfbNsNf6Vr5gntF
 Ph6c/8IF2GSJr9oPU3Nbda66Ss2kxlMnNLMvWchU9VcAY9O/QMXQUOE0XVp8xRG4uZXy
 FyOTpBkNk2lK5qJgLWCjLaF84KHVTzsYG+iwRrWR7fM8hQFHce1JZu7b017E07RFVjHl
 my/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795438679; x=1796043479;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Hu8FUX0r6Y9mGgQ0uGQnmIafzGx4PfIxy1jeuo4gOag=;
 b=uNjWO7j+6sjEMuk1066wbzFhRJyj0LUre3fSS0cDvtzDk/tY5KTUBGhy8i1AedvuUn
 VwGJHU3t32PG4wsE+O2HL4yzxnPek+vlUb3O1vSL6lhmbdMROxZN4+Ag+UAhwwcdO86H
 QFDHRTZoYpWzCx7cA8iAS3GJ82bONw4nqdEXozVtjCherTvfDNty2/IsBXrntOVwX007
 gkC53Y6GRVvMrsJxJRYHBAZVaD2MStx9W05ihAX0qPNEf22Yqsxi8YR46UyT3rKoupbW
 1F274sEalVOINbnhRdexUgRS16gZZY/6b0eO1vRODv1T+Szy6Vn+MsCZlZhr0L2lzN9c
 bUvw==
X-Gm-Message-State: APuU4Z/2BpPwD6VRrmysUtYK3AsvVkcLsrC2pUDRFle4m4SExeX81Jth
 nX292FMJ8hUUTTIOAO37iM4yfR2Hqg2Cs5IfPu7N7FKTIcsbJ73OGjJ5Kw6IAA7h6hFDcKKgzpb
 Nu1PA+wRkGO8MtNxUM/iOftMbn4V8EhI53zd09XRs4+AHW8TyOpej
X-Gm-Gg: AZFdTZd+wimraayR/MNyJaSomwYi+adjuYstnb3Fl0xT3IODS+rVknimHVy3NdE4UDM
 /zcSY9l0bGeacFyMw5j8iPrh69Kx9hjwmpRQzVR1caaeTJRm51o1vRBRShSmkiykyFjeyiAIoar
 gIzyYlRtBMkm9U+81Yg4i5eFAr+R/+K7j3hpLCDRInz9KKOncqi+SbSk67vEeMMU4cUd5QH74Fc
 frbdOhAsyTlgKJ0xaMjg17s4CHkdmhE0rd2xGAMPUhr73lTXbEAV2y0Um5+O7o9gNxnBqwyWm8b
 OZQrp+C8XNZB+c1XRoo/Zrpms+4H+N5om2LVBd/ZDwymDvm4bFt/vlQbjbsXMBp5CZA2sNZqfQ7
 bOPvhdLm+C/fhEKahrRUs//XLQW7XS5BrN0cLyKlgJJipU5ge8UhdoRWhe6vj4aUr1sAhi9hiqm
 ponPLw4ozy6ZHGTqPOAfj5bw==
X-Received: by 2002:a05:690e:1382:b0:67d:bda2:a517 with SMTP id
 956f58d0204a3-67df4491171mr4666173d50.90.1795438678993; Mon, 23 Nov 2026
 04:57:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165546.3050013-1-peter.maydell@linaro.org>
In-Reply-To: <20261119165546.3050013-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 12:57:47 +0000
X-Gm-Features: Aa3M54qvj66zCC07P2xuTaoolTcrv6gBDBrzB8ZIbOXdlEWfahsscwY4DJxFvv0
Message-ID: <CAFEAcA91WC+x80j3Lh4wyOgzU=tdu8AQqAcDaXtpghw6wUm72g@mail.gmail.com>
Subject: Re: [PATCH for-11.2] target/arm: Handle "PMU disabled" in migration
 validate functions
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In various test functions for VMSTATE_VALIDATE() fields, we check
> whether the migrated region number register is within bounds (i.e.
> less than the total number of configured regions).  These tests fail
> spuriously if there are zero configured regions, because then "x <
> cpu->pmsav7_dregion" is always false.
>
> When we allowed v6M CPUs to have PMSAv7 in commit 157f6c69edd06, this
> exposed a bug, because we now have a CPU which has PMSAv7 according
> to the pmsav7_needed() function but which is configured with 0 PMSA
> regions: the Cortex-M0.
>
> We could fix this by having pmsav7_needed() return false if there
> are 0 regions; however, the cpu/m-security vmstate struct does
> migration of the secure equivalents of these fields, and we also do
> a VMSTATE_VALIDATE that checks against the number of MPU regions
> there. Making those fields be migrated only if there is more than
> one region would be awkward (we'd need to pull them out into their

Just noticed that this should read "only if there is at least one
region".

> own vmstate struct), and it's unnecessary -- migrating something
> that's all zeroes and not used isn't a problem.

-- PMM

