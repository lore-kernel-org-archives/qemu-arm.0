Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1523200lfq;
        Thu, 10 Sep 2020 10:52:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeKLh+KV3ULRAgl6cC648FicLgXBBgbvhM6e9YQQCDzyDgzrsNlaSiggXMxhJW6ipMAYe6
X-Received: by 2002:a25:c4c5:: with SMTP id u188mr14363991ybf.162.1599760340017;
        Thu, 10 Sep 2020 10:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599760340; cv=none;
        d=google.com; s=arc-20160816;
        b=CvksRuRK6tcDkqBCS9jK1Y3hx3qOVuQ/8U7T6cuJXpyWOqzt6e34DpiQDQiyAWSBx9
         QyGsheCUjdIZBfRBrqbkvpAsaNlkLsObleBjfg3UmAK99UpTQH/ssJ+xqfKi3aXiqlkU
         Kqx8LKZY3U+C+Y1D4q+jKmSsTAEaV8gAbh4p5Sn/X1LR9xoEGG4awlp1nCSRq4yzopld
         qJQ5Zk66bpFtQIKTGDg/hJorKNihBz0IuhLV2LtFzo3gLf2UBCh8JRc80xSNcPekHGfT
         UOB8Y1Xep4HP4lCa9wEje3HxG20KDlQ6ApUxZ6HTdukoI2/gdUscln0KjMCPzjJDSVgb
         bKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cUHk8Bdi8Ag3iFp0zcXGCQZn0jxTpQTOWmcZys11+sA=;
        b=tgkGIdW/CqvbL7AzoHgw3+NwuxWjqFfUic8JOG9fDiJeiMo2MgRh5jTBeJwbpwEnLX
         toi1mYAIjNypSmSTg/IN7ZYUqjyupaRMJvpTDapynbRTi9cfsmrl62Sz9akPhFjXSo09
         N6i2uuC2IeCQikyUwUemFZVxaf4hEFMJ+XvBU4TQGhOGxmh9Jvhw35WUJxQhnndBYQfW
         XbqSjlZiNWj6yUQLX9zPsTuf5F3P7bum0pyLQTDdirOQeL7frIfNN3zu1MLhjxAG7j+0
         RKAdIUdzmCBGFZVQbVOWuLXafbW+BgTvrE8/ASf0gdM8f5OnEevVdGHxvujRgSBVpVdX
         EgAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gyVwlhFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si6448916ybp.222.2020.09.10.10.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 10:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gyVwlhFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGQk7-0004Aa-Bg
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQhG-0001Os-Vl
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:49:23 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQhE-0005F3-Bg
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:49:22 -0400
Received: by mail-ej1-x636.google.com with SMTP id nw23so10007875ejb.4
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cUHk8Bdi8Ag3iFp0zcXGCQZn0jxTpQTOWmcZys11+sA=;
 b=gyVwlhFz/Nz6V+z6Mn7JW3qf0smnDY4SPMCgj66NGzq3gbXCHwGprpjoCDuVXyahfl
 3YeWlITQezivhCaGpQs9HvFBWM87BMAhMp8dRKALg3MuzK9OPB+McDt4gvl0XFvKxjHQ
 fJL6B/i3YnBhFhqq//EF0WzE+pGvyMx7tdKhKQs/EFsuBTssEXU39C2HjvEGKymv7e44
 lpK4KlmJIe6bnAiEOKqVJ4ZUUznzgBYXo86qxqVEhgoVgmio1ErDRlU9lzu1lferR7Gj
 vmZUaj3EY33kj6xIArEFAcgn4T5gTLK99puCnLa8slovgEXlrRz9TmzwRUcbI1OlM1NG
 q5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUHk8Bdi8Ag3iFp0zcXGCQZn0jxTpQTOWmcZys11+sA=;
 b=q9NpFZO8Pvf+Lsb+s8qKNOJ8f4ZwJyw84MBiQAxCD/GDfNaiRgK2WKS+BmkZeZ0icG
 aGOyacsAA/ZKMs5LvwQB4JSe09ibViEZUbUGoCQj3aO+pcW6lY9WESu63rf2uYveb0D8
 xIX0hALmzyxfaNcWGqL8fT/JvyuzkHkizVo6S4QZ5DUxl/APfYankO70tubHJyd62wqU
 YNGwz8O4CcxhJgGIymSux0rsjhPqREC+eHKe/nIWqrgvk2zvLWlmRZKL280N5IaGhiJC
 VSXWvosmDzpevqyoU17OIbAlQD7WxSvXBGB7vEYe3DPvbHSGLfKZ7lEfQ8w86r1cJ8/N
 tetQ==
X-Gm-Message-State: AOAM5339dosG6z89vmqpjAIGlV5UiF5PzvlHtGjRhQln7V4+InA5jPtI
 YpfBg3QnHnv4U9T0pR27/jq/p3OCEm32gTOteEHVGA==
X-Received: by 2002:a17:906:d936:: with SMTP id
 rn22mr10100199ejb.4.1599760158382; 
 Thu, 10 Sep 2020 10:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHwtE+HWkoj3a2pdYHOkPpG7ya=+-RRFvUp-SXwuTWvm5g@mail.gmail.com>
 <CAFEAcA8spQVin2vj2V5DJYQCR_BizqrRneoRMKhqKAzFv8EiMg@mail.gmail.com>
 <20200910174346.6y24jkyd7ca4xuoz@kamzik.brq.redhat.com>
In-Reply-To: <20200910174346.6y24jkyd7ca4xuoz@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Sep 2020 18:49:07 +0100
Message-ID: <CAFEAcA8OszXLXPNsRt68pQQ6SQVG+-PYduOqGpodqKk+fi6rqA@mail.gmail.com>
Subject: Re: Master cannot execute MTE instructions
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Derrick McKee <derrick.mckee@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fSs7Pk1WzGy0

On Thu, 10 Sep 2020 at 18:43, Andrew Jones <drjones@redhat.com> wrote:
>
> On Thu, Sep 10, 2020 at 05:17:17PM +0100, Peter Maydell wrote:
> > What QEMU command line are you using to run this?
> > In particular, MTE is not enabled by default, so you need
> > "-cpu max,mte=on" or similar, is not enabled for any
> > board except 'virt', and doesn't work with KVM, only TCG.
>
> Actually I think the 'max' cpu type has it enabled by default, but you
> need '-machine virt,mte=on' for it to work.

Oops, yeah -- I remembered we disabled it by default somewhere
but forgot where the enable was.

thanks
-- PMM
