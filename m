Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E843606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bmcBBl7R
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVTu2-0003vK-0b; Mon, 23 Nov 2026 08:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVTtw-0003qq-H0
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 08:16:09 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVTtt-00040u-Pw
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 08:16:08 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b502b9b702so35218417b3.3
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 05:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795439764; cv=none;
 d=google.com; s=arc-20260327;
 b=Lgsggw3/c7NTdzLP9y318840NKLur4Npr+4Q6W84GpNunSGeQ4slaGIZABKCMEiqTb
 uFZZruuSwEtVBY/wqKlYYi9fFeMbnKcexYj0TiNdzZ8rBREbFQj8ug5YHBTYGnCVHhHW
 /cuATSMrAmuBJiGJPJOhiJjUc88wsrbRP2pBFMiSBXO8GC2NC8oyiQCkpZxab9Mrwtlo
 WCuC5npv4juxwuDvxQELcnoTRALTUwtivzqznpYmrs0iE9xeKJT9qtAmJVaSoTz7D7o3
 ieahjb65AEHxAGjfG/bOtbjdQWSNSo8p628V5LwYK/Ia9KCE7jzNKaiXUHMkmMjHBOSg
 81lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L43OXU6mO+epKo6tJONydYsUT/d3OSbnv5ZMOpUIy0E=;
 fh=p3rxsXy0/QElNyEvWLMIr70DFTKukDaNJbZri25PwdE=;
 b=BnvTUkz2oK3AmMmSN1AUZmgf24Mr3G5BJTo41cABmyNiHzKWGHH4V1W5neHpaxqxDY
 jAkmhHyw8tHwqqc4tkqrWR52/gT+RrS6bUMAAThOXdkt/UVzVUJe2Q4VRlAdTFak9Psy
 pnyFmKdg9dH41dR8fImZS0xbcTUWrKazW8SleU4YgEq4Nb2/buU+kV/+zce98A/T5O9D
 DSH1XJ0IAdT5sl9JHaqNGlPhS1MmATap+s/FPv+mPrdhQBVShFd65B5rLwaSZQbz4ZLL
 W+90Hg4lNAMCx4/2b44j59SKfe8/j8O5ZXi3YlreMFfKgdC6eDBU6BEIod1cSwXB9m2r
 EfzQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795439764; x=1796044564; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=L43OXU6mO+epKo6tJONydYsUT/d3OSbnv5ZMOpUIy0E=;
 b=bmcBBl7RtKV1oO6v7qgAazU4rnOcz4BmvamDMayUNaAlXbWd1X0BGYBd/a/bTU3mjx
 8r7Ax//A6JyUa3bTKGlWTP8aIHf9JEUSIgh7A52JcyNMjjsMjRtqzKpvl6j0o8G2O4u4
 U4MErRaPKcdrEAvbTsY8+ewX/NF2X80f95yaW/Zp3jLbI66zdpbq7pAHQe64TR2opKKk
 /fPWpGUCSDlq4O9Tjx74dwSW+SrvxufkuJjpNPVEhkqiufTi2W2jHUywleJkMe67nYmJ
 TZEOLTV0HD7hg0LJVXbuxftfizQNLjWLQdCqUuB2kdJnzUqsQHe5K7eBojuu8BNywCB5
 A8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795439764; x=1796044564;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=L43OXU6mO+epKo6tJONydYsUT/d3OSbnv5ZMOpUIy0E=;
 b=gaiBoG2zvyGkhY3OEK3lRNBYTqH5b77MEQwjoyeZd1kdaeM2RVp+4K0B71wdEiBrYt
 JioPdw0bbz/USB4vYL+0aOAW49ev4eWm1rPMRkbN8q2nqYpRm1cRS7aWNZJ9oAicjKgs
 C2Kxv5YrKk2LUfeJfUXZELBhUVK2ue+uvX+H07m7YH2+UFtSPe2VVBLNc2cJnzl2Xt3t
 MIkPlkSWrtSl7JCwbp/On/0qpQifa1O4lf0wyVc4gzcTNzlzLcdOpKjTTKhWM0Atyw47
 WsvrDfrjKUGP/sMB8+ENbGak0BPJdabp5qtuO8jshvevIQglKNleM7ATeU0AYT2riN8J
 E5Vw==
X-Gm-Message-State: APuU4Z/PnYw3yyg+bZuzsdjxC5SZkfk2N8RSS6yWxX4zM3OY7R0e/xHD
 fdCQ4bBU7KUQjetbWA4A9kIobTCZV1wbdj7v2rlFJeg+UztR1MJy/MUn88PZM/rYK7eCDi4WION
 4dpHlfaQZFXXlyqW2kAhHyUDn+cE3gfKWJaqsfcPGVl3S0c4pJraT7zA=
X-Gm-Gg: AZFdTZec9nWtIGHwPow60mYAfYgse5VMpDu7gO6/ZAW+HXefBLjzddsj1ZnRji8njmj
 1DYOiQ1hGWNAmujjcuQDAEZR+RrYuLPkxsR1BAR1IVsdlliU/XPp3ncGGVBcGWlXTTZJPign6+5
 tMbVu3HLSzS6vE2c5/7i8bFSw+byTY6NJ5gBTLq6dXHleM0qMHX6y3yNgQvvJ+RNeUVXvCr3kXy
 Bh7CzJVMt2ytrUVjMea8WNZ72qbZ5DebP6xGeL+ku5YoS+gmn8fZT6f5NPyIrsYAxqWKUi5jLIr
 VnNXz4Z0Xd9PKPpIgSG229+N9UrQ4CEJkEhzh3FGfTQSR54cMNqHgXzykG6k0mP//oQNrMZhOW+
 mkr9YAc3VH8s+dyC5IMfGOLk1aUelyysCSEe5vDmTA9rYkHOGRyp3HWbNcn5TIfT+XgvntvZ29j
 BqF5KuNGI9gpTaVPznAWGjA5etDO1EfmqeLlCl5MM9xg==
X-Received: by 2002:a05:690e:43d3:b0:67c:28fa:29bd with SMTP id
 956f58d0204a3-67df42d04femr2084658d50.13.1795439764127; Mon, 23 Nov 2026
 05:16:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165546.3050013-1-peter.maydell@linaro.org>
 <CAFEAcA91WC+x80j3Lh4wyOgzU=tdu8AQqAcDaXtpghw6wUm72g@mail.gmail.com>
In-Reply-To: <CAFEAcA91WC+x80j3Lh4wyOgzU=tdu8AQqAcDaXtpghw6wUm72g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 13:15:52 +0000
X-Gm-Features: Aa3M54oyR_fnaP7bcOFVdd2g7NHu8G_Udw5VNpJDEihfNhjiG4X97NPKQewNauk
Message-ID: <CAFEAcA--T+yq6_ZHNFQTbvgDKGN7fGnk0sMiJrtzzJ9P97ae4Q@mail.gmail.com>
Subject: Re: [PATCH for-11.2] target/arm: Handle "PMU disabled" in migration
 validate functions
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 12:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 19 Nov 2026 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > In various test functions for VMSTATE_VALIDATE() fields, we check
> > whether the migrated region number register is within bounds (i.e.
> > less than the total number of configured regions).  These tests fail
> > spuriously if there are zero configured regions, because then "x <
> > cpu->pmsav7_dregion" is always false.
> >
> > When we allowed v6M CPUs to have PMSAv7 in commit 157f6c69edd06, this
> > exposed a bug, because we now have a CPU which has PMSAv7 according
> > to the pmsav7_needed() function but which is configured with 0 PMSA
> > regions: the Cortex-M0.
> >
> > We could fix this by having pmsav7_needed() return false if there
> > are 0 regions; however, the cpu/m-security vmstate struct does
> > migration of the secure equivalents of these fields, and we also do
> > a VMSTATE_VALIDATE that checks against the number of MPU regions
> > there. Making those fields be migrated only if there is more than
> > one region would be awkward (we'd need to pull them out into their
>
> Just noticed that this should read "only if there is at least one
> region".

Also this is
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4905

-- PMM

