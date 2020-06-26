Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp433562lfm;
        Fri, 26 Jun 2020 06:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN5wrp/HdFpGQwrr0PYxenrbFjWcigOqZUSGDydxJnq6BhENV/rGQW8w5WGGo4r3u6vyCb
X-Received: by 2002:a37:b342:: with SMTP id c63mr2747524qkf.436.1593177221751;
        Fri, 26 Jun 2020 06:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593177221; cv=none;
        d=google.com; s=arc-20160816;
        b=WO1odJ0YJ0sNqYL4smNDT/U6akr4EaY8Ol2+N2FHUU602uh8nM8c1aqVQwStf0eIVz
         oKya6vom0pRi8JLiJVgmv3TnihYEm3xTOpHyyHEtMOGtrsRpY5gm4mXgh1tzLSt9ACFg
         iIqKWHW4ql0J1LginFVZf6fMYcKWJ9/1IyXampeReRw4uuVTnjTYTd+RbAzv/xhnyCdv
         uwDqWwTFef7q1oXKfL/Jqe4eADTID7tem7GfFomAdrRdSZkEZ/yYyKHpmk/8FGgb7eCF
         Y+w4AhGT68PxRyqHMfN4vtrzRr07H4wEcSKhBxT/aTkGHtmFS2yHjSfyR8OYFpz5d6jD
         KcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oWb36J35ESUuY1ww7E7WCjpK0nAWhNMKLe/D7pe5g4E=;
        b=CbagD7iYHUZs3hx+FlMORBbJ3NVkERJiE9z58eh+iWjSlORMqK2GgRCNLFgtcuUKxX
         BEEpGttff99iEiXUa50HCZIzk2YUvU3WR3eS0cFBEHLTg/eD76Fzm1kyS6P6gWsCi/pb
         XJeyt2sM4JN9OXkoQIItX2RbBNPLvjzF/ZzhsSR+tC+vA2dPTGo78VlzCehfyj6+ERKO
         LGthRzmCqs3xn62+VZD9nwP4PA5be82+s5RMvYKHZX3Yy0sBw3lfWADrSy6LcRcxOmKO
         mEInwapsLDiyWReVTfXjffBfICoMDixt1wuM+7iVaXptM5A+/hL4kYcFsDK+IcaoEHhe
         9hAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tiZgY9Ba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si16752950qtb.268.2020.06.26.06.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 06:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tiZgY9Ba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jooAm-0002yK-1T
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 09:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooAe-0002wZ-40
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 09:13:32 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooAc-0007JV-BL
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 09:13:31 -0400
Received: by mail-oi1-x243.google.com with SMTP id p82so8035253oif.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oWb36J35ESUuY1ww7E7WCjpK0nAWhNMKLe/D7pe5g4E=;
 b=tiZgY9BaFwGXcokju6PMWjDbmDbWraMlp/gx+bmcZmkfCCr1qa1JQNkcVVkBfpJICj
 SlsMORXuIIW3Y70ddeACmA51SzhHDEYlKcVctxrkobykLQv5U4QO4KjEyYQnTBan1yLB
 w5zx9Shm/SS7Vr1tgYFyMXNlotIBd+76xTXX8YhVVFUAXH2eMirdeRdqv7bxP7I9Gdqy
 kDjD4QrdIJt3zkjVaoEn7GCKqmWZiRhe1lcP3gLpZme4Y2YzlSbLMZYKe+jnxlYrKGpc
 vWlfQ31plvREZD/Gq9xcpjL4rK9QpAHMvZv/pHNU8k18R+7GI7Rxkfal2yYopXQccmVK
 LXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWb36J35ESUuY1ww7E7WCjpK0nAWhNMKLe/D7pe5g4E=;
 b=jU7WnWcRAP2t2/0dtc7vEWCvwswFMeFRbTjsoWCl4E3m+t94jSw8ZN6FfSuEaIM3/S
 C/bEdnpMXPz5s8wNL5B2zLbwqpUuW/wjE84JzhOzvfl9FmJiVd5M2lKVyINOEVqHkkTk
 GKYRZ+zHbYGwhl7LiI5Tti1PYfh0Cs3HWqXQrtkqTFMXzrDESFhjPW9QDfwT/ZEgcBqP
 TwgnV+srtH5eedAr78nWKThYBBhickQe77BFs8jYPsmb3B58MtUiugjdM6Bb2kurhadD
 yZQ03XRf75wfJ+rprlr3zLD+v/iTSh3jtDbKdRcO0iZlT0XES2JCbKuQMSmOJTMcALCR
 6BTQ==
X-Gm-Message-State: AOAM53080SyCfFIR2z552X9p64v95GAJaweZqk65saBB/BGCqtqvr6PJ
 8iZUwKhHWhr3H3705BQfdmTS35d3q4Mzxqx/Dz7QUQ==
X-Received: by 2002:a54:4694:: with SMTP id k20mr2249559oic.146.1593177208881; 
 Fri, 26 Jun 2020 06:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200626033144.790098-1-richard.henderson@linaro.org>
 <20200626033144.790098-44-richard.henderson@linaro.org>
In-Reply-To: <20200626033144.790098-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 14:13:18 +0100
Message-ID: <CAFEAcA8=UGStxFYhVw3_YPd_7FD6bTnETW=OMn=ZDrtGqXq8jw@mail.gmail.com>
Subject: Re: [PATCH v9 43/46] target/arm: Create tagged ram when MTE is enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Spickett <david.spickett@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I2lRMRGy54cO

On Fri, 26 Jun 2020 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Assign cs->num_ases to the final value first.
>     Downgrade to ID_AA64PFR1.MTE=1 if tag memory is not available.
> v6: Add secure tag memory for EL3.
> v8: Add arm,armv8.5-memtag.
> v9: Split arm,armv8.5-memtag to another patch;
>     adjust how address spaces are allocated.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
