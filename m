Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp1071916njj;
        Wed, 30 Oct 2024 09:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8mczKdfnCrFohGzVlKCb4EEghAyv4FWXJYyuX34gYOFD3/ouK8Jxaslg7+V2WsiWRXdvWeUW/JF6Wgg==@linaro.org
X-Google-Smtp-Source: AGHT+IFRcjZtrYS1FHPPZUhGtQfMqHsNDVwhsTslMSWYpedXfz+xwxibHrAwsrY7r32hRlYPXCnf
X-Received: by 2002:a05:620a:2a0d:b0:7a9:bb80:1f3f with SMTP id af79cd13be357-7b193ef31c3mr2589107585a.22.1730305019910;
        Wed, 30 Oct 2024 09:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730305019; cv=none;
        d=google.com; s=arc-20240605;
        b=d3motrVT+BZ4ja1zTvmKy36G7dLdFdOhuFR5GDT5BnQUtwr9NSmArdtgDML+JAt5GZ
         KGvCuiCRGfLeG6fvET6xqqPMG7WTxJL1GjbMCeC49cXk7mRiYToXcmQarZeL+eU9W8h2
         1dVjBNu94XdpDOl7AVww0w+t7ixwpfXip/63vPBPcEEWfFDflmqKLY9AyXXqT7qx/Cr6
         FHQXmFkTPS773flFYlY3GbB4cpfww9NU4rurvzpU1rQ41INtL9ljoTLVlLrRGdIBjdcO
         RQMqW6yInXPNSMUslrlcAFLxdkqI9NKvNuamHk8OUgOY/DDJZJx/SxlxQHAmqjyR+8wT
         8DUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=y9J5Nn2VIDI2g1fVa/d94I87DoPbRGqzG8bhzTdHbqo=;
        fh=pL6RB1rnp0sIY3x/oq3wy/oUD7MV4IQKq3w/BOt6QCM=;
        b=ko1b+jA9ziOzKYLkWotBwY6H68ggYTvcMNoJZ16jr/FHFvDASREXdxLqq+JfTdL+1G
         ywwwSaTJ3/Gm2cYkiKGbSp8MIFXs8Xfwd+5EL0Cz8PT8IsxvAXVcX71u0UVPRh2U+TQT
         Wl1za/WP3uVohagMvE/PGPP+MhnjGhzF0racwuzS6hLpUbadPCfkSTzI21LZmlL8VdvI
         6VVamZb9mU89QYMGLM20QcQnf813zdLYsANmA81BeCS+L8rT9hIAHdmnwfwZhEt3GX3B
         gs9Cj//Ie7AnETuXX+Yh4wYZqKn+Ip7VFVNNTnSJcMU04FuM2+Ukw6MiCtn+XIPvFC7Q
         qPuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xk/T5Lu2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d344662si1377873185a.459.2024.10.30.09.16.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2024 09:16:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xk/T5Lu2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t6BNM-0003UV-KU; Wed, 30 Oct 2024 12:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6BNK-0003UA-Uu
 for qemu-devel@nongnu.org; Wed, 30 Oct 2024 12:16:50 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6BNJ-0002TR-BX
 for qemu-devel@nongnu.org; Wed, 30 Oct 2024 12:16:50 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so49334a12.0
 for <qemu-devel@nongnu.org>; Wed, 30 Oct 2024 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730305006; x=1730909806; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y9J5Nn2VIDI2g1fVa/d94I87DoPbRGqzG8bhzTdHbqo=;
 b=xk/T5Lu2KTz4tBB+wMH8M4gp0kHkGdXDWr7bhmIHuZ9o90+AnAK0aRyhTVeJqACsLe
 xalEELFKv9K/v4Wt97CrSzoVuN/kEjmJapa5F0Gmb2wwLubwErvxreKK2jbUdm96/Wyo
 Ocqeix27KzjuWX2Rbc9dHkeVFVFekK28/7K9n03+jmgfJeLNanAzhiW0iswA24uszH9C
 0ZlhWOSrBgxXiHEWUiQDy7o388nlT77xffUzAQM6503Xn3ZG9404Ug43/wCqzT6YllLQ
 /eoeaOCarG2NJmQijB5MfwshSO9MoYOuxNMHIV2b8dVjk0+dNoyXHTyGiNPuDAxnjfBm
 qhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730305006; x=1730909806;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y9J5Nn2VIDI2g1fVa/d94I87DoPbRGqzG8bhzTdHbqo=;
 b=S8AnzR8QKcM205B5BUWh2LIbHPL/u+ZNZIPJhg+Oq8Kg8yPDhFyJYJ6PUj4VQ6T8lP
 zfsVjVF0SfiOoIOM6oN8MOdXWZtYwb1WnPpiWpDoe2JWiYtUKIxyNGZwXF78GBnHbBfF
 mA1o+FIXFaMk6m2UsZUFOsRaRcwQqEouGaedAKSPxgsPrm2zX009tt4dt09hRKzT0vne
 LAFIBVSb+dhiEoKQteI5gQNWD+8gbbpP9EV8EzsoqC70akdZ8KbiWZzOFTMU2N7SaRuw
 XJgBOC+mQH5I5QlvpZvKhqY8obnNiGRH43LuR9kW/mfWQnMFoBXT6mt3Q/Pt7O41KtCF
 8cRQ==
X-Gm-Message-State: AOJu0YxjqPLSJh5GZvi4r0s2oY3Z9oObTDhLP1v9AjYZmMyVVFhRBax7
 H/zMs3ntSHWul48CEl1prZSw2uQz/rT2bxnWF9iCDFFcdyBPLeoBPMlQHMN3eGigYRnzCldvUMU
 60BbNdiKmAz9zT5wsDZOI5lo5TO4upGb4VWkpWQ==
X-Received: by 2002:a05:6402:1f44:b0:5cb:68c7:879d with SMTP id
 4fb4d7f45d1cf-5cd564fe471mr2758782a12.19.1730305006076; Wed, 30 Oct 2024
 09:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9JQNJBfk+g8iYcczVcTSqEOJZ5=LGtBupHqreUX-2MkA@mail.gmail.com>
 <605361231.417554090.1730234829057.JavaMail.root@zimbra83-e15.priv.proxad.net>
In-Reply-To: <605361231.417554090.1730234829057.JavaMail.root@zimbra83-e15.priv.proxad.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Oct 2024 16:16:33 +0000
Message-ID: <CAFEAcA-zznZ=_=JtAuLveQevAj7doDyq8-q-Yz7Q2EZaPiy-pA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: Add cortex-m0+ support
To: castet.matthieu@free.fr
Cc: qemu-devel@nongnu.org, "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gkd0jWzxTWOv

On Tue, 29 Oct 2024 at 20:47, <castet.matthieu@free.fr> wrote:
> >Our coding style for multiline comments says
> >/*
> > * they look like this, with the opening and closing markers on
> > * lines of their own
> > */
>
> I will changed that.
>
> It do not seem to be followed in In hw/intc/armv7m_nvic.c, but my new comment should also follow
> this rule in this file ?

Yes, please. We have quite a lot of older code that was written
before we imposed some of the coding style standardisations we
now use, so you'll see stuff that doesn't quite follow the
rules in files already. Our general policy is that we don't
bother to try to tidy up pre-existing code, but where we're
adding new code or if we have to touch the code for some
other reason we'll clean it up in that local area.
(A rough guide is "if the checkpatch script complains about
it consider fixing it", though checkpatch is not always
correct about its suggestions.)

thanks
-- PMM
