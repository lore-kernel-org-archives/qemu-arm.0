Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp98806ejf;
        Wed, 10 Aug 2022 13:05:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bMhJ85Gl/r2VW5dibMUnToEYrYmJdcRV6MO+3QA5BJOteAHDdJgCwUZw4gkWV315Esi7u
X-Received: by 2002:a05:620a:2415:b0:6b6:1bf3:154b with SMTP id d21-20020a05620a241500b006b61bf3154bmr22860745qkn.454.1660161931860;
        Wed, 10 Aug 2022 13:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660161931; cv=none;
        d=google.com; s=arc-20160816;
        b=abYjz0sbNQOA0l/Ydo2dUKi9jig6EEfCf27KlPV+Nx3d7/Va35BArha07NHaZI5YnM
         s75oE3c1zZoURtcfMpU+ngyOFx9xLNZuXLL6vEQIm54VxHfKYJbb5lvd4XMHtBoD34jJ
         6iWUL+AFw42X7RocvF63cafSMVWUEtjVP1z1/s6DABQdc+ptb6755REXfHJ308XWcuK1
         7705cA7chQ7SkVCfuTdQEVLpxtieYBOMMHUqiYa5ioC9s7MY0XisSpgIEskC3oVzQXaI
         TxOkv6xizjqi5ZqdBrpIJRfJnzXhbEOxJAOSeFyaDSmiKXgApWttifSzenbp34CY2T5a
         m57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XlujtovikzLkyH1452V3nsZbD4BZeJbpnOAcdtiZ4sI=;
        b=FjfE5QuHsNIluQt22T+Kw/Axe6dR06ScNoK72icP28sFDvZ02xSJQei1EuHhcVVtqP
         NBXYRaviqK0guAUS4VDXsy/3noJdRIsrFJa6lHw0q3GHf7EM6O8twtGrQZuUzXmDsymz
         N1Hn6VUXUptvtmdMtFhcDEoZ5mR3RLTnuHmob0yGxtUDHKEh4IGhDb/qspEmX+tjEJNp
         ALlmq5bNasAzKgjhyfKvaoStJWnk1AzQnjIg6IwcCaF8eSV7kiVLHqc2vI1XxEzXSgNA
         E0IWeKBG9+8Mgv4kf4IcC7MnzSIIJKkUi2967nJ00HrXl25xC7wl4ey0s1WGZiIgEWQ/
         mVZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNp+Vncu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020ae9f213000000b006b8fb86a5c2si359125qkg.191.2022.08.10.13.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 13:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNp+Vncu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLrxL-0004aL-CG
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 16:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLrvz-0004TS-6x
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 16:04:14 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:45689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLrvw-0002np-9D
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 16:04:06 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3246910dac3so153097557b3.12
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=XlujtovikzLkyH1452V3nsZbD4BZeJbpnOAcdtiZ4sI=;
 b=uNp+Vncutl0v3CfNqeFIDkTFeyzNvaogGkgZrlx3c08w5HiIDEzmR5UjcKjFVnorV1
 P97riMG7vtPdgFeJRt3IPTYPGtEL2rUUwFe+yscKJba9T3R6LH5RTk7sukYFwz+kqjoW
 MSMbJeC9Uh4eMxXkSBZaqzFhhgHqa8bZQKVixsnTqv7Enc/dkx4ADupT+GzppCy6rOpS
 pMBtFmHihd3IW8DUji2lUykcWlgyqNlF0JTKbsQ2R/r19v0RRY58LLlOqorF7PyYxOUM
 l8fS8h8tDfbFiVy0uYxXxudvrKlof+C9y0L7Pd9FPbm/CMGf7Ad3BylwAxETU/fjkSje
 VneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XlujtovikzLkyH1452V3nsZbD4BZeJbpnOAcdtiZ4sI=;
 b=iMQt6V+lQNBn94JUQvJdFFSGlTFANH/5vDdVu3NN0+seAQ8QFd+oSRi5u6c3RIYLd2
 TjqVUMNUPez66eR9McqrKY7+e+0P//RxEfLB3PhM0yAaPFhIkcObFQYSdKaS/cn7HdgE
 cCdZxqJDfa4xzboDS9hJGlbQfPo7u2NHvj9wXOzjNPNEiqy2LCetBKPiaBGa9XlDbJGI
 KKgGt3uC0HL1meYvy5vc9YUaJ8Lu1CtbzkT6nGJH6CQnpPwADh6SaD5g+JtrO69Qr/wq
 pVLCLQx7kcnZhFr+jkulgC9q4xLVLa2Z9ktIVGMJFH6j1plH6AqCnDtfYGpuKHau2IwI
 feFA==
X-Gm-Message-State: ACgBeo11u30C4w1/ewoGbCT4aSDmuKPDQFKwFKCGZbhV2q3O97OccugZ
 7cdSEH8F19mbQJ6Fg+n7cHJCkAHDbEPuI/2AEED7Lw==
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr27881865ywf.455.1660161840478; Wed, 10
 Aug 2022 13:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
In-Reply-To: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Aug 2022 21:03:19 +0100
Message-ID: <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: Vitaly Buka <vitalybuka@google.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fyMLuWkeRSSO

On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com> wrote:
>
> How can we land this one?

Pinging it a week ago rather than now would have been a good start :-(
I think it got missed because you didn't cc the linux-user maintainer.

Is this a critical fix for 7.1 or can we let it slip to 7.2 ?

thanks
-- PMM
