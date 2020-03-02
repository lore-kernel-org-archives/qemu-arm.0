Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2350360lfg;
        Mon, 2 Mar 2020 03:56:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJkPD+7mGtE2iJ59pZpI0nCUi1ZxkV3TcoVpxrf8AuhUd66zqhTptFzCar3oPpic1+xr+8
X-Received: by 2002:ac8:691a:: with SMTP id e26mr15595797qtr.287.1583150208015;
        Mon, 02 Mar 2020 03:56:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583150208; cv=none;
        d=google.com; s=arc-20160816;
        b=d50l6R7vWwJ3bzpYBnlllqi3Bhd9GZwHKSxy32BNisQ0LO2Sl0CPUVLTefm2flWlWU
         scqDU9+MMAbwSi9D8/otBVCyXy9+ldu2oc/o7Tl0NHF3V6FCQDwdH3HOfooLRNHbl9zV
         3HRvmGxR8T0vV0rgttqYr9cEbkEngAHnQPn+YDDrO25kEge8zuoJPIVEhub+jJ4MSH3w
         tZiB86uC/UEtuIALKH8MgkbbrTqJVxtlCJW4/wC9ouChfcywgTGzX3vTQNUKq3Gpxcv/
         c//ETPwKWbUYg9MXfz/3zUDjluYmZyc3UYZ37XM29VjFP1Y4mYs7Duy9jlzDOrcrSSiC
         FCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ce+9WLoPMBik9Xb3ltlTP/bQVe5reTWxd+l2Zyo8kU=;
        b=nCMWm4KOnx7rKMg+Juex2MV8upUvllSuU0hCOEr70k2mssUbTaSGPIbYmEI/wJo2R5
         WwAS+XAbaHiOcHIg7GpgyHoiqCKe434yiYDs+Jq3aOBwcO/9ajyIUCRhc/bCA3+F7Yt/
         6gTZDmbeKILpKm80BcArS8KX0+uGVKXypAZ2kCNRYnkkBkuTnlJChfStFGKll+t0dSnC
         xd7mSddobKPVh/hOPplHFMINlmo8OB96v9WJxzpn5vL8EGpTE6uivtBfjWaPejfIgJGN
         lkCCcbPeLqqem7VRE3HeakpeKtImZiMMUwwD62THF060tM6yHY6gs3m45pw6U6Q81Pq5
         CHBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vN+IrQJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18si5767572qkk.111.2020.03.02.03.56.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 03:56:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vN+IrQJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jgl-0007tn-G2
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 06:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jgd-0007tT-Fx
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:56:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jgc-0002Hs-AB
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:56:39 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jgc-0002H8-4A
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:56:38 -0500
Received: by mail-ot1-x341.google.com with SMTP id j5so8495471otn.10
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 03:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ce+9WLoPMBik9Xb3ltlTP/bQVe5reTWxd+l2Zyo8kU=;
 b=vN+IrQJCoBlMJmb9Hf0/Qg1esShijVnBMC7mwf1mcsK9iX6uOFVNkUbX5ycetlgETY
 5vxnhM8uqdgYAhLp+9OnUtfpk1KSVAviXeatM5Ph2kPydRBquSy/ujmaPaB2HsocCdgl
 X/aIQHB6w0IeuvdUGFWfAYxvoC9F1A+o/8bFHWB6YrFAFD3oKLKZxGPKV62d5LnaFdDd
 qqmigVVU/0QS3FYQ1Enj83kdnBQHmzm/KJQBmcngOtPksvP/B2T6z1xN3gR7HiFbPP6X
 U+p5HrcpRP1Eos0OO1My0JMQomdyBYHYT+VltlSnLRkeA20oC2Fpv+5pKfz6I3WWhR+l
 lefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ce+9WLoPMBik9Xb3ltlTP/bQVe5reTWxd+l2Zyo8kU=;
 b=LXj9jnUQghTq8idnzS3ONlmfBk4nydNW6T5nigyLNJWWe1IjXmMPRAzPqJ1kD2THWv
 Q2X9/fWZun4sN63tnBk3lxhINWqREF5Atwc+9zFKlAnOv3tEEVnEwMn36AEhZpWhBYqE
 xctkjhx6Pm7Ivy3H2dBHTNTxNrrZOUQqdngi7Gydr4mqdPg3afyRBeE+fkxRCpS61V1h
 SSlkT7Qv59/MTfcTrKj33UjDe5ADZVzoJgSV09aiqhNxeYdGHYtrQ9+QxP/bsoL6sERO
 ky06StyS3Qeo0xN/HjJ9mQv6HT/Pm9DWww5JguxfEtM6A4IpQlT5K8O8m9Xb2qsgKlu1
 bI4Q==
X-Gm-Message-State: ANhLgQ2QW4lvF8i7o5rSLOu0WlHXqBhUdvta71Ke/Q9udG6kxuf7XwJs
 ssaukGQfgDc2xzimYa7HzT4VK1Dwl2QcCgYLquzamQ==
X-Received: by 2002:a05:6830:1406:: with SMTP id
 v6mr3714337otp.232.1583150197046; 
 Mon, 02 Mar 2020 03:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20200225031222.15434-1-richard.henderson@linaro.org>
In-Reply-To: <20200225031222.15434-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:56:26 +0000
Message-ID: <CAFEAcA8eqWYL+BAPCqPeGHEBRpcio+xM=A56Ou2znB7yKQu5QQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] target/arm: Misc cleanups surrounding TBI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZoFTnN7TlhaX

On Tue, 25 Feb 2020 at 03:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have a bug at present wherein we do not supply the memory tag to
> the memory system, so that on fault FAR_ELx does not contain the
> correct value.
>
> For system mode, we already handle ignoring TBI in get_phys_addr_lpae,
> as long as we don't actually drop the tag during translation.
> For user mode, we don't have that option, so for now we must simply
> accept that we'll get the wrong value in the siginfo_t.

Something weird happened to this series: it looks like
the first 2 patches were sent as replies to the cover letter,
but then patches 3-8 were all replies to patch 2:

https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg06699.html

The result is that neither patches nor patchew think they
got the entire series. Could you resend it, please?

thanks
-- PMM
