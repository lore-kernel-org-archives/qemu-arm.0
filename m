Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1281499lfm;
        Thu, 25 Jun 2020 06:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMwd825t8TuXJbbjLN/3nnm1ALd/lQUulxIVAfrkm+4gl9YpCBUAG4luXXVX+JUpOGH6px
X-Received: by 2002:a25:d996:: with SMTP id q144mr34021305ybg.250.1593090840704;
        Thu, 25 Jun 2020 06:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593090840; cv=none;
        d=google.com; s=arc-20160816;
        b=MnrM6rIOOkIFgfuj/9tXOMFSAcLfOp9S6QgATNaNZOT/pRiXCQ5MkdbT9d+BWat2RD
         IRvPXnqQ8RUdwsitoatPaINgBUoptaM3rvdkwqZwZWR1Bdl/V8W8rfNJrNukdNiaLh0u
         5jSiXL6i+H3jsnKvCVHrAR+ZtLnm9f5fKKLGpkhc8qWXnCeSWKt+uKj02m9FIccW2lKh
         VaQpjzatSKWBZKILv7MYlfWYXxz5BbdLZmkWYcc7Qf4i2U8DZczO7WnLiloxfqC2MiI2
         1oBhkrE0mWYotvgYGNC8d8R8isMmCanNHSWr9re/D2t9YH/VlzEnEQ5Ad3E0sljvJkdB
         lUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/W2L9pXJYclFws7rjK9bXIcS7kFKPWtf3pvQGjGXRUs=;
        b=wtJH89GaBiBC6RjAyuoC+5f73jEo59Q/DnhMmT54Ge7UeDR5ku3C6YLN7vwdaXJkBV
         oeRQkTfC2dZYP/aK8ecEBHLKrMSRyiT/iP+hBqIhR7N76EY7JUQJDRXsaNGbmSFPfUgI
         T+yPyJctEwiSaQTzw3omJLJFn16rhI9BeGUxCSBU3/gLuN/6UZeWHTbH/8cjfNTFxPmI
         QXd5oXP1Wk4xFwy6Y98xWbH4bkms1IPFxs0La3bLSTa0PWUmZ3Qv0PqoYFRCyVeZ6/IY
         32bGp4kykkA21KzOjxjBF22P0BAzymyoG88w3AymXThHqV4I2LvuAWOqVXB77e6aoeZ6
         JQjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Z/CSKS13";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si888122ybn.395.2020.06.25.06.14.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Z/CSKS13";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joRhY-0004sg-0F
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 09:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRaU-0003Fa-DR
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 09:06:42 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRaS-0006oc-EV
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 09:06:42 -0400
Received: by mail-ot1-x342.google.com with SMTP id 72so5168187otc.3
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 06:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/W2L9pXJYclFws7rjK9bXIcS7kFKPWtf3pvQGjGXRUs=;
 b=Z/CSKS13BtbykJvBL5i89Cv/AJ3jphQiw8jYZUJoFNOlzrPb9vvzBf7ukVXn1MmIcH
 8EKr1YRLDfC53s4JD6J5D6+cRZt3aMR6ZvMms8VPRaqgTGz+xDskHmeUhbh1xe4pW4c5
 tXVwteJ8fthmE5p4vd1FFC+Yq4ijiQgcAkPd5W0OL/n8P/ECphOiZl4wL4N9YCl8rI0D
 jZfTGIo7Vb1nF3ThmhP1ujVte39+yjdcbCgxUPPMxu/YPLkASzVYXccGkLNsDHarQWLr
 QuAFm6H8G2fCoW1rJZQD2sNduXBaT6OERjrMSsQeeQoZ7qH8EeTXVY97m7cWOjLDSj7b
 ZrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/W2L9pXJYclFws7rjK9bXIcS7kFKPWtf3pvQGjGXRUs=;
 b=RnEucW/oeHTWZayETfDrXTiGTUH8U0Ex2ik+k7mK5lA0uJPyFO1kWDlHrSb1B2vHw6
 KNRKiAYvRNah0YxDTA5QwQnQPyO86M3pOZ47toVJkmQY+5nGtNix8E06AQmkA93GSZfI
 Uvq901bu3cJtgBr4WPzmxT2GgB+qw2jj/irfPMDAzhmzLIswqLTupWN6BxaAlgb174XT
 QixroQ0r6x8v8LhB+QFaETVtXZD48mbuCvfThB2zHa9wA0ynRTEh04eghnLD+uXLt9U/
 RhVNBIUXeGiVo06NBCwUzurhdTHMT2QR4ysj94pvu4VEh6D7ymAl8revRIBTle6ACl1l
 1b1g==
X-Gm-Message-State: AOAM530eygEb3mIwAo/peLDSPaaRQ757SJJgYbHWOv20nLctmha6L7CH
 pkJ7KDEJdxsh6DglcXcIkRHtyv0lgbN0Qepzvk3lxg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr25424166otn.221.1593090398997; 
 Thu, 25 Jun 2020 06:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-46-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 14:06:28 +0100
Message-ID: <CAFEAcA9CZUH302_yy=HSX7J3XD=Voj1JvhC-AhL-+o4aDHCkgw@mail.gmail.com>
Subject: Re: [PATCH v8 45/45] target/arm: Enable MTE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1HahShl4w3at

On Tue, 23 Jun 2020 at 20:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We now implement all of the components of MTE, without actually
> supporting any tagged memory.  All MTE instructions will work,
> trivially, so we can enable support.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Delay user-only cpu reset bits to the user-only patch set.
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 778cecc2e6..45b0ca7188 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -654,6 +654,7 @@ static void aarch64_max_initfn(Object *obj)
>
>          t = cpu->isar.id_aa64pfr1;
>          t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
> +        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
>          cpu->isar.id_aa64pfr1 = t;

Worth a brief comment
   /* Will be downgraded to 1 if board provides no tag memory */

?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
