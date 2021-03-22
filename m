Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp4714842qvb;
        Mon, 22 Mar 2021 07:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnuo0Y4jr1gJispElLE18cRbDM9vQQ5jhJtM/FLNx6dGkhp6QrI4MpJdwXvt3/jIIAvt9z
X-Received: by 2002:a5d:9c50:: with SMTP id 16mr147721iof.66.1616425008548;
        Mon, 22 Mar 2021 07:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616425008; cv=none;
        d=google.com; s=arc-20160816;
        b=Bx8QrLca6okwoNFju2ZgBexZYUhzPlKfSiTuOd8wdDN4br/EY/2qxb+S4ZhFkCFvEn
         4P6W4WwK1XDZOR9iVvWqhT9r9xI1yehf+QOJaGfRSkcBiFaHQlKXipRcwrvWTigsJ23G
         RSl528VkZrWyuaWdaY0d+TxHz7jQY3Jhc11A3ECkwB7mWGNfdmYxTZdpRIn1noe95dGg
         kO+hEnJHimGSdI2HJpNnQ6jgVzTAXnpFfk5grIIo4rYxbC2WCd0DGzzhuelvkf4QDOK0
         ABMKkcIQm5D+qfuPSpiA96vgt078O1VvBMRlhxT8CEf/sI4vvIMO4lS4K7nl/20kxrk8
         1Jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mbx6lelOby29fe7T/e9SE7R7FPlm0vRSRdCWPFbF0ik=;
        b=WFvwgne5eIYgA5IDsBwv2RI2XOyTudThqdw2MqBRIscrrBkYd0dxBCzZmzRM9ZV48b
         wFgC4p/bogGolNyml60v/HHL2ql6UueyfCV3LMl+P4uWQBAA7VEWp4Fa+MwTIwXSMGaz
         +nYhQnX8pVvzG2GAIUwDL6/2t6UKIEn4hSyNtOJBVzRAR7RsxBPLEmMrmoFqzs3fQ/Fi
         J+Z6tR2Z41I2ZyYNaqx3Gqmuto/YOVdB9XkV+1u2kqtvGje7TSMYMXa1jTcLET4w7DgN
         byzooLn0m/y7YTIvOrApxMqZ3C4+KF/Jx2HlvH52FzAfrDu0qWGTNIjv2ODVQsteGIHV
         UtpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HAC//txQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si3238678ila.124.2021.03.22.07.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 07:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HAC//txQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOLz5-0003xQ-TR
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 10:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLR3-00014L-Hm
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 10:21:37 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLR1-0007Yg-Vu
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 10:21:37 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j3so19526597edp.11
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbx6lelOby29fe7T/e9SE7R7FPlm0vRSRdCWPFbF0ik=;
 b=HAC//txQBnujqoQMFBHHbJtnR+s6naXrbTHT33W9vdwJ9YXPLkzU3Go26pk1l/8EgP
 btgyLu1cFFwLwH9t17hpzbVDjsh/IVqwUlT+nJ9BlzjXZSkcfhnRUM3IaxmJnTncobqX
 0qve5XuUhMXkiMJ6Uzy0fabvmIkrjMAaBDvi2DDaGqO1mvUjBZQgLVBzForOR173ZYVW
 JYHwel7TssQu7q4fbjjmiwQacROf/N9xAu6Ymv3krlS3DVBttLfqeCT90Fmo0r5yshZ6
 KzOkvAoev+ntlByDBO3lKdf1jAAUmnmRP9DITTaBnPFPweZbl0FI6ahfori1UednExTR
 fctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbx6lelOby29fe7T/e9SE7R7FPlm0vRSRdCWPFbF0ik=;
 b=GTI/Mxk7B2tpAM/sxBsLS5A27cV5HRMaKLfRkG8pEmB1SGGoUM4KgbImdYPrTvj6Xm
 FLt1Epu5pvfJm/M6/evyxhirihNanHjVlmhRIKhktGgZmZx2Md1hLwY2Nq0vpifyPZqD
 6T8aQoAR2nzJafvtg5Op/lWw2Dr1rUmKvAo252oIexW/zRnc06d2hSDbPLQQSTZqbFYx
 1rmspe5nWRdJNGgptQJQsNMEJwlAxtpTAFEjKTl+VvndagPNXK37C6U+yfUY1fZCHEIQ
 K5wVdG2yhoRN4KbOobIrOWvvVoM5rUu0+yjpXmidAGrVU4Vtd9kDGuCLRTAJihnufNnt
 sRPQ==
X-Gm-Message-State: AOAM531AaVMAHVwIKQE4XeQSz+LpXRmvwAt8+TN9xVB/bIePaJNE/mZy
 ygjmJ4SmeIhw5MOXHIvu+D0ZYbOC/XxcLSMUBtjB0w==
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr25993877edb.204.1616422894421; 
 Mon, 22 Mar 2021 07:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <54fb8499-0758-a554-6103-5b56d784fda3@nuviainc.com>
 <fd1e329b-1a1e-f669-95aa-9a35c5311a08@linaro.org>
In-Reply-To: <fd1e329b-1a1e-f669-95aa-9a35c5311a08@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 14:21:06 +0000
Message-ID: <CAFEAcA-r85AWRNLszunX8VF2p=xjY60vuyaabApj_PfAF6SrYA@mail.gmail.com>
Subject: Re: Bug in tlbi_aa64_vae2is_write: tlbbits_for_regime called with
 swapped ARMMMUIdx_ values?
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wvDNjO9vkgfu

On Tue, 16 Mar 2021 at 15:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/15/21 11:33 PM, Rebecca Cran wrote:
> > I noticed the following in tlbi_aa64_vae2is_write: it appears that when calling
> > tlbbits_for_regime the ARMMMUIdx values are swapped?
> >
> > static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                                     uint64_t value)
> > {
> >      CPUState *cs = env_cpu(env);
> >      uint64_t pageaddr = sextract64(value << 12, 0, 56);
> >      bool secure = arm_is_secure_below_el3(env);
> >      int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
> >      int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>
> Yep, good catch.

Would somebody like to write a patch with the fix ?

thanks
-- PMM
