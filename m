Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp609126lfr;
        Thu, 15 Apr 2021 08:03:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLDmfsY/4By4uKkmy4zkBgjMU0pzovpQir6QRsTXCajAD8+jTVh5B8wFUFLNqkWP6JC5Sr
X-Received: by 2002:a05:6602:2156:: with SMTP id y22mr2995863ioy.10.1618499015221;
        Thu, 15 Apr 2021 08:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618499015; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ4duAA61P1hl5taIsE0DxDLQAKVliO/kS+PoKsoW6J5sEW6JSEOQYREOsbF+9Z+O1
         gcGoBfCJ9Y2hzQ6pNXMkSApRLSLUL/9S+ybtksNVjcyFuxXTl6wXvr3QyS69xf3OCiMG
         HZaCKctfsBeo454OkP5yFgJN9FKRSJymqbysur3nt8ylv1u+YKsjOcufY4bHO/WpVTCj
         +/Gke0fJJbQ8EQoUAG8+US+6gl/73pBYLi0cLwwx+MzoEZUdCFVB9rND6Gg1+vBORoPE
         MtrJb748sXBUf2kEyD+hNBI1sJkvSq5RduA2mgt6Fou82vL52l6DQPRzkzbCjObyRw7Q
         hWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxHyx7T/HxLI0z5SzewkdptKKHtzzwtIltSwsHIOcq4=;
        b=SBOYTsyh5xr0FQ8t54PxhneNi6Qza06t0RbkIDrIwbcA/ZINDSaAGVeufrHHaKMFCk
         UZWccLl70jP00/ue1LXmFNHwY7eJfOu3juUA+ukF1gB/lqoRz0M9MJYSxQnKNuRTJI2d
         S3us3+uOzUcWnlFVua3ue6dUf502pONr9rPp6kH2tFjYA+FQV82TWJsXaQa3UIkRi7Dd
         yFyIhUK5A4MZq04LI7VXrHx53cOtG+oAdrCL4Pg3lAKG5Q4QX81UveWsVIikqN6VdSmQ
         WUB3HXUBOCR0l2kZoCx/wHUSbGm8eoiLdOaeGqCrDhb17QGYWe2/SVyLjQQPAK+eL7Rf
         M2Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B+ku02S1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si2893328ioe.38.2021.04.15.08.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 08:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B+ku02S1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX3Wo-0003UU-In
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 11:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX3WO-0003SU-04
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 11:03:08 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX3WM-0006fc-46
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 11:03:07 -0400
Received: by mail-ed1-x534.google.com with SMTP id d21so8352499edv.9
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nxHyx7T/HxLI0z5SzewkdptKKHtzzwtIltSwsHIOcq4=;
 b=B+ku02S15JZesvnthh84L6rxPal8qk4cPV3UWuZl89IBvRf1tibG8fMZMQ9laWo627
 1qYA+GmB0MknJFdYWYIVmXFTIZhAqx5Gt1LK229CrKZ5kQl1vWuxmIe8ZstKw+9XSv64
 rEdBPQWVOS0ltiJRqmd2ZqTQxcDnWWA0/KB0qMPmRC7ujZhVknZrlEdOvIQi8V4cJyAS
 jjYkqWxdwlqrsgm+ovSB0wuVYUiWN94Pe1kpWorfyB0S7WXoNxQXZtpXrH3Udp4PIlxn
 WZ74Wbe/HBq8h+f56Qbqw84q8OlNv6qjPqWZxPPdz+pjeBL3hklxkuDPwo8xh3PfsueI
 aGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxHyx7T/HxLI0z5SzewkdptKKHtzzwtIltSwsHIOcq4=;
 b=KtKZ5f65Mq0pCDAZdh14ce93FtSA/mTsQCt0Ww/jSvbcKg54eI7T+EJ8/FwYTRz5q6
 wjCfHtLK6l+lKK69kzIZVHe5X2XLPnHiK/3L7dZPT6aRUoRg/zcATNaamrsQJdwZpnUy
 bdv5I0RaiDA6e9tes7j2ALOGvqQhwJ/zQYZxdcjX/rcK2O7r04bWYCyTkVodaEI37abc
 k5BIlWf0gqobsY6bRRWqhFhqXVNDH/+5xsHwze1hDd7Dk3cxqf2kqXpbk/LcseBSgTSQ
 /URLLh/Sh1sH/XTSaQQy4F36YCFSSoAidkacqcVP+sRgZFoGiZJnn3wWiUqoB2jIcbjB
 /LjQ==
X-Gm-Message-State: AOAM5337TF9+s97cfpg8St6J2Vl6UNzfFJB6RICsd3PPkPL+C75ufxPE
 hrCxO2o3heO3qKs/m66by0tAbVPm2tZc1OThzchQCQ==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr4700020edu.100.1618498984793; 
 Thu, 15 Apr 2021 08:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
 <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
 <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
In-Reply-To: <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 16:02:17 +0100
Message-ID: <CAFEAcA-k_wguyTDttUVxdxrdAjBotGRV8+drhcJ49nrWEVYFjQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lqhRbMagomoD

On Thu, 15 Apr 2021 at 02:24, Max Filippov <jcmvbkbc@gmail.com> wrote:
> I see a few places where target/xtensa may do that. E.g. it does that on entry
> to an exception handler to allow for debugging its first instruction.

That should now be handled by the common code, I think (see commits
a7ba744f4082ab and ba3c35d9c402636) -- does xtensa still need to
special case this ?

thanks
-- PMM
