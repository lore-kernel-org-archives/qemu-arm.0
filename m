Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2053286lfp;
        Thu, 30 Jan 2020 07:51:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwgJOCDiBA8m6TJ+z/0f93R39F8NW4wR8aIVXG0fU6k8Qav6vq4IHAdN4NtPorYDs6wjJ0B
X-Received: by 2002:ac8:5206:: with SMTP id r6mr5294813qtn.214.1580399477333;
        Thu, 30 Jan 2020 07:51:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580399477; cv=none;
        d=google.com; s=arc-20160816;
        b=RJs9AmecQyHKX/7vo0oZN2U59RvRndba0B55PGMiO4dH35lp6uXVsEQ6yUoJwDdh8B
         KcOw4Pfhylda/D+wQCtfk65BhcpakWeJO7aSEELX7uB8JuewDiLc4llkt0pF4sRDZ4fc
         3aA095o/ggPf9RLnRn0dLyhnjbSsXJaipbNeDSxyrVmX/ENlvi0eb9fya5We/0rJm2+a
         o/aKGpuAI9bLASiU3C/FAUBcdGKdp5P/uLP06JZuIihzSELJPWolQskGhWeWc0mns9Ln
         HczH0uGpbOGcIkBYVOBV9nS5gKeLS0c82/srJAAaJg0igHWl7p4n9jQeX3UTGExE6z6J
         SW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLJcHv/BfFy15ulq3w2U1nPIF1uinxbVoFNeR+cJoxk=;
        b=FbahWPwaB3XOEuE12AmboYYdtwlZdKD50jmeXeU8q18sDjxVGvEE6N53yOAqeuZdEH
         0+b+bA987yglalqWPCGUbzu/AJVqVrz+1OGjprky4TqKs421Aw4POefMSwAb9Dz7z12/
         katckN8TPskLtlBtIGi+PiNYAf6VyGo8wu8Fpk5/1g9Di0fpi2f5SfGITQBcdZDfCZuR
         P7RY8AyIkqgmDblaB0BdBah1vQhLR1H/SIIZcEf42xz1qkiErS05PbQkF+KVoXn+i0Mn
         jDQU8vpJbruRiT419dyy8vah6NVi4tVRTz6/PYZOmn/+270O6GsqB843pBjALY3fX5GH
         MVeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aQKVSYPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si3604354qvv.137.2020.01.30.07.51.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 07:51:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aQKVSYPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixC68-0005Lr-PM
	for alex.bennee@linaro.org; Thu, 30 Jan 2020 10:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ixC60-0005J4-8S
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 10:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ixC5y-0006bP-AC
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 10:51:07 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33453)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ixC5y-0006aC-3P
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 10:51:06 -0500
Received: by mail-ot1-x344.google.com with SMTP id b18so3603837otp.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2020 07:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLJcHv/BfFy15ulq3w2U1nPIF1uinxbVoFNeR+cJoxk=;
 b=aQKVSYPmcwA0UD2+KLl5uKEyWABwMOiZA2oyQBydt0iZcb7c1XAuD5JjvFyiVCyIGC
 kQcodKJHvgIZCfA5xV3fcZMwg8SdDGm/O2SdtMSuA7JSPTvH24cfTPsIlMSZNEq5tD+y
 XYGbukCzkoe4BmUAF2HtEIhQO8wNoTsZcNZpkTudorpR/HOEl0ICf1hwsfSzMhcsy5RL
 pbiXQhJfLl5A/hLCZf92JcU4RfPxyCAiY3/X7mqqBbSkySBpQl3rFDVm9T7nutpbmguW
 IMKZcc53rlCrQAfb8YlATgk9rjmfxvd1bGGdF6BjOUdJ5fxyEwflLEoNLakjnYnCfRXu
 yQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLJcHv/BfFy15ulq3w2U1nPIF1uinxbVoFNeR+cJoxk=;
 b=QO/IBirmq1eg1Bw+UmE+Z1O/PmOPPvh3ioZmJMZRgWMDKuAwV1sMzCrJfoC0/mYWZj
 foftP9DF9SfAuPaRdNlHPcFZIv+AQyKiq6lEmx4JFoII+Ap7i3zwZe2vvmsqSA/icFLz
 cAgv6VEjoNp0BxLRVf7dGeATSZz60qHSWqgzz2fUlQAlfBRS6z+ymtEtd5rpgyFAafvm
 3okWrGUueQYhhUcq6zcPi+6FmYsVomtuHCbf/iucZIe6bsoZXIHo31GoAhkxbii+RZrp
 VeaWmJ9EbtLoLP7+LRk9KwsTH3+7OKlBKGXaEA4gCty2Nt5kuPaLZHZ1czu1qT115HcZ
 4hpA==
X-Gm-Message-State: APjAAAW5hABXqYUi8O6msFOpJUE1uF4DTD1IskBeccxyWUisDk13W7ac
 9HTuJnyRYSIW2lSXw+Mv7OWjFm/PJAm4TxBsJS38qA==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr3996488otd.91.1580399465309; 
 Thu, 30 Jan 2020 07:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20200120101023.16030-1-drjones@redhat.com>
In-Reply-To: <20200120101023.16030-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2020 15:50:54 +0000
Message-ID: <CAFEAcA8jD_i=tu1QCQY9yB_2+chTk3b54AyHNGG5hC5YR41zgg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] target/arm/kvm: Adjust virtual time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kT9C4Eqr8YCy

On Mon, 20 Jan 2020 at 10:10, Andrew Jones <drjones@redhat.com> wrote:
>
> v3:
>  - Added a target/arm/kvm_arm.h comment cleanup patch (1/6)
>  - Minor refactoring of assert_has_feature_enabled/disabled in 4/6,
>    kept Richard's r-b.
>  - Rewrote kvm-no-adjvtime documentation in 6/6.
>  - Reworked approach in 5/6 to properly deal with migration and to
>    track running vs. !running, rather than running vs. paused states.



Applied to target-arm.next, thanks.

-- PMM
