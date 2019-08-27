Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4976512wrs;
        Tue, 27 Aug 2019 02:15:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyB3J1G0Jd07OnIVFxMDEkzCcCbiHqblvgUJOqVY6CqsGBAcDdu4uAwPKhJKGNUSFqb1cU1
X-Received: by 2002:a17:906:c744:: with SMTP id fk4mr20820152ejb.189.1566897325325;
        Tue, 27 Aug 2019 02:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566897325; cv=none;
        d=google.com; s=arc-20160816;
        b=VK6JHc6zr/uUtGiN+h6iKhHutcXXXEHCXy4OhwiLPSRzddnJEdy5UmohaqNOLX4H1n
         wIMSbHuKeh4s4JO6HpcjJXZLB1UDywuNgdktgTznmYMwgR/apPsju18qYT4fF/kLv+zi
         8Y1MY/AzJibJr9KhRGiONCNGOsW8BodBx77cgaiuReTSJmDuPwxO0u5747GeDsbNGFx0
         plDYoD1QuYGY03ajO8J2MS19nnkRDm1vE7M4Ui3HjeESTcw+MeWp54FjC143ruPrjqQI
         PDzzKVUVoYH1omDUPV2pmAuu4XcnzlijDjAQUXVv8/F9UBQPe0FJ87dt7zu6XNJKXKdT
         x8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ka3LXG9PjTwvkfqrQm4tf7mp2fvvzx49GuSdIesR6cQ=;
        b=f0T9wc+LoY97HoxMRSfWrSQefMFecHnqCNyMo/r0PUgaYee3qIwSAoXtDXHbaxCKOP
         tWlb36gOOHzQMtofXwchTrzBxkf6VGzmJd+OTWbD1PhbV8b5SUiT8VXIEgGT1lceJggK
         VdzWvn19FbJAZ5x8UBvtehIJIbM/azsnCCwm1+4f/qb84EFtDgUGcMmkUuVXhwk2I0z9
         zpCQ5d2rUk4NdMzF0dg8kct9RmNv1eMkEPR94WVKcjtjEpmYu8poU6qPL9c4RH7trFwA
         5yPBqWqVJ19qbACXLzK+8L0NZVnMktz08x+aKt+aRTSf6r+dXx/T9yAWZsR15LmJDz2H
         xgsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oHHCQaN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b30si7929773edb.12.2019.08.27.02.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oHHCQaN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2XZU-0000qe-BT
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XZ0-0000Lv-0F
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XYz-0007Gh-1R
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:14:53 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2XYy-0007GQ-S0
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:14:52 -0400
Received: by mail-oi1-x242.google.com with SMTP id h21so14390606oie.7
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ka3LXG9PjTwvkfqrQm4tf7mp2fvvzx49GuSdIesR6cQ=;
 b=oHHCQaN1dKogmrLFK0ShxYvqV7BjVp6wS4HIWu3thM1bVqELm0sU5WY8lx2Sdz8bHz
 bnap4//+ooVwgEy9qA3KTawYAwo6JwXVvni+ogf6iEjW8HEwScSZoK8ffGOxMGqumFoC
 YDtZzYsVAYvdCjl2JY4/yQDrBX4P5/EViAIEL28cB4pSoHCceLMsh2qo5sQIbKIhyp3g
 z/AjpiUFyqQa3FDJ+OazytrkFn1JYfAkkhPshylkBwJ9pRJ30fWKvWTdD43df48dRk2G
 jfarw+RBodE0uVn7SadVsE3sIpGv1wKj+E8eIRtzv7+BXgyw7R5l0VSKpzusGz39g8qk
 GXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ka3LXG9PjTwvkfqrQm4tf7mp2fvvzx49GuSdIesR6cQ=;
 b=lzfSEV3johFKOB7gEpkQR/TeuI+B4huMTwvVfXlJjl33EPc0tUP587GdEd+EyZdL4o
 OUTOv9hZypnMshBCVIAEgcuXBz05Mv3ZHy1O9JYirgklnP9O1ErKej0BaWHX65hT0QCs
 VQLFJcukmBscN7gbCCy9y8E/bCZtSSNZ14jMhmsx+UnR7dSie/lYqQwlg5yAHtHtl7P+
 4xl7YfZ4dxMBMQd3W8zGC7w+fSJc34juV1yEwVzVUZVM6kQqP/snANHqCGgp3d/KYSKL
 eO2OKPBVMQO1mIMFvYIT/49wEBeY4Gr287UhV+pCza7Nk4/nixPN701siUO4brwHXiZ/
 TpnQ==
X-Gm-Message-State: APjAAAX6r8q8r/eTHq7DHXMTBhok6p9lSOCTsvx1NCudEy0aftEjRUpT
 NQMfOQWWMp6h2cV06/ZxP0aaZtbXijaWHjS22k9oYg==
X-Received: by 2002:a54:4718:: with SMTP id k24mr42115oik.146.1566897292122;
 Tue, 27 Aug 2019 02:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-66-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:14:41 +0100
Message-ID: <CAFEAcA9Zgw+LH5yVBHYgotUcEG2Je83ejAFkp-aSwAv7V=-V8g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 65/68] target/arm: Convert T16,
 Unconditional branch
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
X-TUID: 9nJPqB7S4QxJ

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 9 ++-------
>  target/arm/t16.decode  | 6 ++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
