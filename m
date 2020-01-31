Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp528229lfp;
        Fri, 31 Jan 2020 03:47:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwyzcnCmkruHmjxrNKG0mEp02iEfgt1hJw2xLxqUdoWJcT4tIMUzu1+cxvdQMw8p8+sPnmU
X-Received: by 2002:a37:3ce:: with SMTP id 197mr10380173qkd.454.1580471224950;
        Fri, 31 Jan 2020 03:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580471224; cv=none;
        d=google.com; s=arc-20160816;
        b=qzWd769hoa/jj+/D5KrEPUXvwuleGCDjg5ZmahZsNqnSeoxVJ6HMBzxI/Uy4jP/5dE
         DzzXECpmtRmC6VuCtBI24AmmfasmjTfa0GR/CvgJkjt5TQep8RAidKCzBkqU5cab0y2R
         VZkLIVXVVJ0oj3di0lq6XGJ74NdIB0V9pfDj8LnEQ+nmdoa8TCx3blnO/SiF8SkLG+bH
         LxO8umR8kq7iQLW4K9e2AEBfpLuIZDz6yeFJjt1kh7BT6ITt5poJq1LEdqo5Begm8Grh
         cVledQnmWskuhY9vnuc6IF46g54Be0i9KcJXKJWpYVZ5xoSiNNby6I5yzRwV9V6jl/dS
         iViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxE7I2q7oMc15JA9EunFii/Bfqy68AgCeeWNgJrZRAs=;
        b=p5SgC8WXZrNTWCwqVKARR6dL36ZTTatNIJa/OBxdgaU0z1BZmxv1aAy7iN2Gn+uN23
         j66Dih4cB2uOzeLkpHIo8Jy/838tX1U2xepaeDSLKr/vSU3zMi0Aku4XYVHsYIjND9Qx
         U9XyQ5T4OdObH77jlfnHOdzgoGw2KLgsbSoEaE4LwJpzPU6ge/HdPG5Kbz34jAzlAyDt
         bYtnLsX6Jm/QHvxp35zWyLNA072OO71/nOEJbG0k2hF4Hevm2mECC7HmUNqAY5+Rk2FW
         WaPLHIAbXX7svdTjd3XJi2hwg6/EC3xDzuWpC335nde93Fhl4KB6kPk1669ZC/jOn4sP
         YIgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mS7IRlhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si5850736qvq.122.2020.01.31.03.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 03:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mS7IRlhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixUlM-0002wB-E6
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 06:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ixUl7-0002vm-AS
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 06:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ixUl6-0006X1-5w
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 06:46:49 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ixUl6-0006Um-02
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 06:46:48 -0500
Received: by mail-ot1-x343.google.com with SMTP id h9so6235547otj.11
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2020 03:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nxE7I2q7oMc15JA9EunFii/Bfqy68AgCeeWNgJrZRAs=;
 b=mS7IRlhMcSfEGsXgNHG38wF9aQeBggyahhUBLAvmc5oWfJqIDfg/rdHkE4ujqO9Kmh
 AGj2qRyxlQYjCSTo9lexfROhEgLLNNlcw/FrtMExQ/eQX8eIXSPqJI7h1OsU8WkkaQbb
 ZFPqUMjMBNRM6ax+gDI/sFP2d8bBQlmrWKuFbPniVkeoBp4pcgbiUOAsKev1wy+XVb8C
 j5gvZwSaxurdEAfbUKGPf8qIGikWR58wMqgbbl4fx4ux8ssbl2ulQ2vcxlpvQXmc12+x
 iVOBCPSSCtbVV3bXa/qGHp0vqP+rV7yjcxhTCqbf4nMqVltRWnkivVUMC1L/s3T4lOmK
 9Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxE7I2q7oMc15JA9EunFii/Bfqy68AgCeeWNgJrZRAs=;
 b=m+5eGpzY+QL6N8hxV8wMoPDJMENEn/b7BLf8e3FkDTBB0L1XXcVD7jWYcyhLtCf5zN
 rEnqgl/YRvaw5YMnXV+8FCVVrfoXEeDDqn+5Nuh3Emu6nFhaiUjmX6LsnEwJI8Smz05n
 JOnIgRt/CJVEFeS7FjwcxO7SeNj+zDz4Ii8K2fX+QKe4IE5HzogIJ2dXxn0Bdj2tQGBw
 XrWc9TEhxPrxoBCQJvdI9X7rPnGqpf94hUT+HmjSwgzBJ26J4BIXGiFrzqEV0i0sqy7u
 AciqZw4LRZvgzadrFhdJkpvwWDJMkEM2UBEDNeUQnH3TvuCTHyuvXrC1IALfM+5RIg8w
 mscA==
X-Gm-Message-State: APjAAAVWzUDaEPGpLTJqD9qQG1HFs0oJSWQi9kXzLSB/DeAqUMBrtZQq
 hltrtU8wEoWajQ6LOpurZMq9uYxzTcASsCXhZnQxUg==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr7340701otq.135.1580471206990; 
 Fri, 31 Jan 2020 03:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20200120101023.16030-1-drjones@redhat.com>
 <a978727290d97ee9b91719ed6173f892991e62b5.camel@redhat.com>
In-Reply-To: <a978727290d97ee9b91719ed6173f892991e62b5.camel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jan 2020 11:46:36 +0000
Message-ID: <CAFEAcA9k0-d44+ABPJRpnOVeFbbW3SUO3ZMhd0FF663hht+_3g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] target/arm/kvm: Adjust virtual time
To: Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Andrew Jones <drjones@redhat.com>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hpyzAX+FE5yx

On Fri, 31 Jan 2020 at 11:40, Andrea Bolognani <abologna@redhat.com> wrote:
>
> On Mon, 2020-01-20 at 11:10 +0100, Andrew Jones wrote:
> > v3:
> >  - Added a target/arm/kvm_arm.h comment cleanup patch (1/6)
> >  - Minor refactoring of assert_has_feature_enabled/disabled in 4/6,
> >    kept Richard's r-b.
> >  - Rewrote kvm-no-adjvtime documentation in 6/6.
> >  - Reworked approach in 5/6 to properly deal with migration and to
> >    track running vs. !running, rather than running vs. paused states.
>
> Probably too late since Peter already queued the series, but FWIW
>
>   Tested-by: Andrea Bolognani <abologna@redhat.com>

Yeah, the commits hit master yesterday evening -- but the
testing is useful and appreciated even if we didn't manage
to get your tag into git...

thanks
-- PMM
