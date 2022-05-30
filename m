Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2737625lfh;
        Mon, 30 May 2022 05:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybE7fxJGrcjN7MHXQIXPer9GU7VTSzhbm3kCtEsgC/pE8ngMBW/jwbyNEYkbcqFXdJaty1
X-Received: by 2002:ad4:596e:0:b0:464:523a:123f with SMTP id eq14-20020ad4596e000000b00464523a123fmr2927419qvb.74.1653914672802;
        Mon, 30 May 2022 05:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653914672; cv=none;
        d=google.com; s=arc-20160816;
        b=iD2QCCZJz2VPEI9DRP/lGFljXq9ZXibHu25tiztoBInCd3mAP5NbAXl23XmraYRihG
         Ac90nEd1wWCP3UEcucdR50HhEcNRvO0DbCv58L4fCOm+MTf9SxFk76OHzOHyXLuRzGH7
         rod1BED3AEZSTNrB3yCXujHmR5tpQ/IP5icCjIt3yZ73PT47oGwj1/QwDc4uP77vF8MR
         crV7rMWlyAtFa0cTiypBF6Vs2D0YkTTaXVmr/SXOjv3fSSAIZ7kbQ/JzY6VI8+Cnvtcl
         qHRIxKNMvHDldzbRj0o7enO95v5opIq3rBPg8rJU9EwUjJ9iWFr5tGu77QIa+olV618Y
         KUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hFSZCRu3hejMfLKNwEnpdml9rAf5cwSmm0i+frA3vMs=;
        b=Cb5zhI3WuqsodHrPMRGCE5B989Gsj/Qnm57puumAx3YvxZbiIP3bbuWPb+mooDgyVd
         EHMlWZXw5L1eKnsjkfPMiPcZuWGgRIVNJUWh6MepH0I7hFPyAClaM1WOywJtfY+RaGXu
         Zsy2L657DPmKn4G8ZbcVJWQKJZiwCR1v2tMYEKl7JvW5EN8qvPFXV7FPr/qa4kEZLWwa
         wa3eImiob+M0FqFXYPzUzZ9erEh2Oim4pdgz5XglU+ZYPS/RWu2g+4Ey4nXFuESvzoDw
         VUHPRXfbGIeENJ5nYO7MRC2OisGBwtOXmkoo2xSqI40pbSqkJGrfSgSMoS/iF164mEw1
         bjcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gPSU+/9w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05620a401100b006a648fa8068si428706qko.669.2022.05.30.05.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 05:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gPSU+/9w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvel6-0008UK-7h
	for alex.bennee@linaro.org; Mon, 30 May 2022 08:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nveix-0006tg-5u
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:42:20 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:37931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nveit-0001xR-Vd
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:42:18 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ff7b90e635so108670147b3.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 05:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFSZCRu3hejMfLKNwEnpdml9rAf5cwSmm0i+frA3vMs=;
 b=gPSU+/9wVkn31IE8kogAk+gYkIDIOSJB1gSlk7NR9XiU73ySqcv0WjyERaJtLn0nPM
 Cglfbb9etXF32nNsyeuqPB91zUb+UDURXc1vyi0HLn0Jz7bFla11BqBNvQuLW4H5ZCVL
 T8jI1JTiZaYNK759DArsuiVNOfHxTO3L31LW+WRl5WMlLVQlu1UmhT0qhSphyXCt0xzx
 8oYGFiRPI1+fOsnxi7QUoY9Solh+deKnoy6Zfrqe33RkhBLdpXvPjhj+GMHIIMOMs4lF
 rFncmT4Bp8Z+0vhLd2cvVSxy5FNmf7AmN5F4DlYZyBDgSVekq+FiT1uKF9mui5pHzO/f
 HMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFSZCRu3hejMfLKNwEnpdml9rAf5cwSmm0i+frA3vMs=;
 b=EwN98Ozgx3EbCJD1/RuLzmcEf1kn2G9gTpuEyO2ARbVK/7WXcmsVehV5P/ZW8HpnMs
 nIcL8TXIxxULdC6xqy1eOn7FsC9LKIBYoe43ttTlFVdVRUXuxW1SNM5H7zL5oaGe8uF1
 jIfutpP8BqNcK4jGXdspkIY1Zvhs8HkO+21eXNEWejWg1c4Rmkp8dg7Favk5L6lUBIzo
 3BsFK2IkLhtjGTNJIYDMKfHUc7hOqV5/cm18Zcp7+zjsGqcyubeq/cZnSEFkkfhTIfSe
 AWve/1Ibd3vFk8VZt6WjkGf2eMJyGwldNDaSljdESg/qQPi9LdA9OilQeZXeP3wVu4RZ
 hkyw==
X-Gm-Message-State: AOAM532SC3Sq2IC/ouMbm34WJ5ca2jbECYEKxdvucCyhv6pNSQeG06iZ
 yLew962vjftIEVtJDc9R1v5r75XAKHrc7JyTL1ye5A==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr59186286ywf.347.1653914533542; Mon, 30
 May 2022 05:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-3-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 13:42:02 +0100
Message-ID: <CAFEAcA-LSsie827BDdwjikBSsWrp5=XFD67_Gfx1D+eE55viUA@mail.gmail.com>
Subject: Re: [PATCH 02/18] target/arm: Use arm_current_el for simple exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4lmEN4H6C2Td

On Mon, 23 May 2022 at 21:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For these cases, the syndrome does not depend on the
> origin or target EL, so we can simply defer selection
> of the target EL to raise_exception.

The commit message says "defer to raise_exception()", but
that would mean passing 0 as the cur_or_target_el, which
mostly these changes aren't doing.

Instead it looks like what we're relying on is that
if arm_current_el() != 0 then exception_target_el() == arm_current_el(),
and if arm_current_el() is 0 then raise_exception() will
call exception_target_el() for us. Which is true, but not
really what the commit message is saying.

-- PMM
