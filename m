Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282CEC44501
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:16:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmjw-0000u3-OO; Thu, 09 Jul 2026 07:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmjv-0000oI-KO
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:16:23 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmjt-0000Qg-CN
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:16:23 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-664d4478a64so2232667d50.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783595780; cv=none;
 d=google.com; s=arc-20260327;
 b=GBt0FaUHRVd33rJsSdQVQ/WTdn2bVFHY7UzDn5H9sIWqAxdLglHk+/DwtID9Akrvu+
 lwWNt32akfjIkt9qM0BemMtZ4DFwga2CKL93bdnBviP7BgD9vYPofg+URalO8SwdO9h6
 WxYiIukGkX4U3DGNmVN4ahKZ+iLjiWVgw5Av8vJwef1i3iX7uVgE4X118B92mgSAmcQF
 0urbjTyKF4DILEIMITdgOap8V77qRUCQuHDOPZpPEgFa6pJKXnVIuG2MKBse6r+7+QZW
 go/nXhih5tI2//oFGjmG/evRwNe2e+YGpPZSWBLVZqrMwxzqwpUxsxoZfyHGBvwFb+/m
 p1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4el3gtjB6P+IfG2AzxxO2fTsHuXSgKHJ/UYCEkQF1UM=;
 fh=oR7TsPg3OTmNosGgopAXF0ZXV9nY+FQmXuneIKe+VyU=;
 b=L8iCETHv64TBaJGGzjoCeSKGAYZnl3saAMkTRYs3afcnPkCuOlHE+ELNykb7a4MZhR
 /ZQ0LqoUIepeCPnvVPSyYe5PL/PVwTXWbj4/0Wt7K8qmDQtlVh0rF2fry+ZEopL5mRS5
 RxRg0Jw7yA2sHXy/HpnwSbb4jEifDO5Ce9LMDTSpcqV9QPOi5fJYbKrvDi7+nhlY5a4A
 tm1OfRGoiaFKpYX4LO/y0ElttkzrOi+zHRlYI/tYzXPW8jPnowyN016sPgOpOaYo61JB
 r6QzrEwuSgflDqve3rctUPtrPtdF32bX5jhR8cD5naZYhZrRJgWOVgq+5aI08rA8XE5B
 dpyA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783595780; x=1784200580; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4el3gtjB6P+IfG2AzxxO2fTsHuXSgKHJ/UYCEkQF1UM=;
 b=nt/Z/YO0G6LR6BYtW9Ay2CeCbveS3toE8oAxw9+mRPm8AGou6QNdoi4pdNHgyffTDX
 9Rh6TgRero5qMMWLrzAg7OP7m5qTgq38qbj1LSLCne8T2UdFxEPNXUc8cQ/FvVFul7Xv
 83zXz1QIQSfU3MVFowxN7JP1L++plk3WJutjFaFYtvkUcc9roOUmnefPPFBedQ7N9IR4
 0wq+Oqdjpm8kYficoBMe/lBxLd0hDBsEWsecjO9hmaU0W3mowTHZu60N9YWJ1WybjJ4S
 I6qIS6BnSWFeTQkf+/Bba/XnQqF7lqmSDwtg2obXqUQRRKn4eUTAYYNFRODSVvBQ8l2X
 TQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783595780; x=1784200580;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4el3gtjB6P+IfG2AzxxO2fTsHuXSgKHJ/UYCEkQF1UM=;
 b=eIhb1AaSPd36HIeBdjMlHci5QyHmf/+lU6eqDWu2j4Wbi+NK0f/bzcjdZVKtfu4CBm
 cBXD3KKflhlrymh0aT3E3KxvqoaUBr+lH+POWmOLkGA++w9wbhRsz57FlGoz55KO1N6N
 6jVisMiDGmL1e0P3/WGriRJX4BYYbARJhkbMYo8HuWBIkMVjmwOJlUvs+ul6SUltHh5B
 KkIIZsQoWVWn3K734L/byVUkYmS5OV0l85lhDhkXZLgHzQ02qmuAC6tDClaDPsMvOf6w
 D7yGWH8DmSfCjV6XASwXr1Nzq+uzdrEFWSMvNnGpQOdYQQ+egYM/8Zjpx1TML3qodBUm
 lzVw==
X-Gm-Message-State: AOJu0YxFwG3d2o1ncUCcBv9OKJfxuEaVhGoQui9CYjhUjkR3QkqCJok1
 mvSbJk0cbmQzHPCYqIXm/ponZ3Ze21zhmu08Dz3Jr2rrURhMWL/j3ZH7MkHPD80xLHx27CoXVEg
 7CuaoJV7zsRRUk+K2rODKFmj17n14lzY9ZwjUnf8IOw==
X-Gm-Gg: AfdE7ckxxF0JXURiP/jy6xaN1rJQ+erChy9tclUpYTAYB2zWgoqwzkvaqRujUNf3MbD
 nOCjT6g/RpVrlNRi+eyNomW+szaK5UtZPjZF78jREgjTOcwRfVLLS4C3QPmzyQ3L04DmsQsqsgm
 E3yOBqSAB8NZx7gnG5osFw+yIzsOxJiBjP/ohH4rYp7XxJaJiPyqSVLHPqi18IAhv3t43pEPJn3
 VSl1L8bDgkVeak/BrIXT6ovDhv1j3J1pkpk+a4bTLTxKWIMYkW0OOmBUsSFjktq46/KCm1p05yE
 AajPcN05UkKenInnLme31tyoh6t0bjW1Cv1LIAst0Dij+go8/T7op1Kc
X-Received: by 2002:a05:690e:248b:b0:667:8b91:2421 with SMTP id
 956f58d0204a3-6679f26e3f6mr3814978d50.104.1783595779979; Thu, 09 Jul 2026
 04:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260706230056.1888992-1-titusr@google.com>
 <20260706230056.1888992-2-titusr@google.com>
 <CAFEAcA9kmrEFCiWLfL1FSLv7W34hSqvFaY7=BpcT+h-WnpKC_Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9kmrEFCiWLfL1FSLv7W34hSqvFaY7=BpcT+h-WnpKC_Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 12:16:07 +0100
X-Gm-Features: AUfX_mweGC0joxUaIudHt3HnwiQK6HUoIDrmKvE3qFLxazyet5U7_JsS9DV4ypk
Message-ID: <CAFEAcA9kDtqU9pi13uWUBoUdrhriUWieCaw0AK3HnUZC1dKtvw@mail.gmail.com>
Subject: Re: [PATCH 1/5] osdep: add DIV_ROUND_CLOSEST
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Thu, 9 Jul 2026 at 12:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 7 Jul 2026 at 00:01, Titus Rwantare <titusr@google.com> wrote:
> >
> > This is taken from linux/include/uapi/linux/const.h to match the driver
> > behaviour when reading sensor values.
> >
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  include/qemu/osdep.h | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index 1ec5b42230..a6a40ab8df 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -522,6 +522,20 @@ void QEMU_ERROR("code path is reachable")
> >  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> >  #endif
> >
> > +#ifndef DIV_ROUND_CLOSEST
> > +#define DIV_ROUND_CLOSEST(n, d) \
> > +({ \
> > +    typeof(n) __n = n; \
> > +    typeof(d) __d = d; \
> > +    (((typeof(n))-1) > 0 || \
> > +     ((typeof(d))-1) > 0 || \
> > +     (((__n) > 0) == ((__d) > 0))) ? \
> > +        (((__n) + ((__d) / 2)) / (__d)) : \
> > +        (((__n) - ((__d) / 2)) / (__d)); \
> > +})
> > +#endif
>
> Can we also have the comment from the kernel header that
> tells us what it does, please?

Also, the only use of this macro is the unused functions
in patch 2 and 5, as far as I can tell.

-- PMM

