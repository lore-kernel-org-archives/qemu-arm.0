Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp426791dlb;
        Wed, 7 Aug 2024 09:31:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVs7fIem+pq5db5Wbe7qERwIgIi0mWDfuzYZvcimdJBWrqE8t+fm+cMuu+xsMg/rXIMJtmy1JSpifsUNllrFWPYZYljMcrd
X-Google-Smtp-Source: AGHT+IHK6LcPn8oW8oNQoY13Qb4jY1vP4ksDRa90TXNJ0fK3+gZKLTcYW+hV+P6CzsGIL4A2MGlw
X-Received: by 2002:a05:620a:f01:b0:79d:5c31:718c with SMTP id af79cd13be357-7a34ef032f5mr2307864185a.27.1723048285933;
        Wed, 07 Aug 2024 09:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723048285; cv=none;
        d=google.com; s=arc-20160816;
        b=AVu09M84xQfSgTdXtp5A4vNfd3U7gdUr5CBFQfEg3uBL+RKLEh9Hae1CxZ2Zfmacr6
         6yxOmo/7h2N+lkhuHXScd6dn46z8x24rPnv76tFxjARodwM2LAXh4agm9vcyFBlntJfP
         JlWvKE0Ld+fa1+ufXm+tbheX490zP1llz+TqZszQgIS3NU2QzC8GSw7M/EWdO45pt2TL
         7Hdo4N1gb1aDVjYBKIrUD4ILlmbTpxsCRwaZBYusnJYrGiv60EQSKR/s9Lx5aQv8LjxF
         MGaPyfKMBEMUAYGdnLeUna1yuqVpWniGOH/xY8UTGKdGHYAKnGpQsGB8S5Na00Np+Kfe
         u9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yC1fVLP0m6q2Ty/806ArxrDiB9rB67kSGOHKekXBjBI=;
        fh=UKA3qqZLWS3r8nfuZlG3DlWqhsHIpvEpAHTG9R1LMc4=;
        b=mRZkKoXjhoG1r00sycZ2cwmk6YyNWuty9xoa2vHD/onaPleY5JItrT8pvIpqNRgaVo
         iXF94XJwLiahoIPs3SgXJ3G1aibQxwcaRkkOF9wcACDuVF9jS5XEcQLqsKSYX29UYgxF
         UyiXUeiz7VNvz11p7pzayL+z1C2HBEyPQz8GGv6+NmGz0A9tI7xXhvwkEMEqERHTlYa0
         MiyFeQNlU5yRmVMI4ebFfqfjb4XG5GH9XgQpRSHYtzPmGaztalL1Z3L1H504okQHC7iK
         SIw+YE6fb3QBYdcMk+Ntu88yrF7ipOP7Pe5Bs2yLfTYhFId50xI4tc64qRCOQqCe97a+
         B42g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbXlzIU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a378617e66si196895885a.167.2024.08.07.09.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 09:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbXlzIU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbjZD-00084K-Ql; Wed, 07 Aug 2024 12:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbjZ8-00080z-Ii
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 12:31:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbjZ2-0004cD-7Q
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 12:31:10 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135dso2925481a12.1
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2024 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723048262; x=1723653062; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yC1fVLP0m6q2Ty/806ArxrDiB9rB67kSGOHKekXBjBI=;
 b=BbXlzIU34955nXoVQBCcPfGvf1rIYF0BIfbYKiR53Ynjddi3yY2Q8ddy8st5hWvAoO
 Z4c5V333r0qjEambI0gr3VnJzau1DNR8VBbdZ4mgY61lvNOFlwc3o1RPeYcRd+yaCSeD
 /uqxLbpcyNJJhTcDApruVbDsDKFdIL5Cl9m7MRx9WTsvGsdB9uXGoAsb5q2JWGbNXINH
 3UnvW5bBMMjE9HaY9/gdMJSYcLMa5gd+7tnKzsdBjaafRoZPcZ9ycMnHjI4WqioQky9v
 cXFtLajfR5PsNYHvWVkWMB9BG3y5xxM9KUqJk4zDLBcLP5djn3FSETrlU90QdY1jTtez
 QQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723048262; x=1723653062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yC1fVLP0m6q2Ty/806ArxrDiB9rB67kSGOHKekXBjBI=;
 b=iDfPLikHmGzyidGXSctJ8eB0hBHhFxRIeBWFHIcNT8+M1IER6JyS/TwBuaXhEtz7ZJ
 LNWVtu/QJq8AE7rrb6cXcX2UnvctEBbcjzfcakpKL3YwWtl3aMoG9oDf/7FTNuameext
 1ZWiz9H6BJPSnJv7JKWGNiaJZFfmvinUgIPCoZsdJrcAXw/0pPWfbxIFFWiXD+MfRwOz
 tiTGFlv/Ek/oL7AfxV5N0vyAFgvb0LaepIohEDaIVfOGZChf5ecyYkM3J05LQZgZz5oj
 fnyKYObA8qsmrGV6argxkFCfZ2AS2Yv08kWDO/uom0Sj242G/a11OTVH1IVXYqbGvY1q
 8p7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP+WGuFy/1KTSiKOEnZrx8EXYiFueDNCwVsbgwLMX9HFQ1n6jzvVs+65RX0gKnRZBN/vex2JwDvq+NakfZYG9tVWzt
X-Gm-Message-State: AOJu0Yx+2aetwtizJr6ZOnKC0Zt+6d2tvOXgInocqK1SbPu8lm624/GB
 7OmQ9Dhd0ba457FlNA0JMpZtFcFTk/MoFDzTGenLp0HHTnlSSR8/S24HpVa5w8idp1KSvom63v2
 DODapk4qAPnen27CT3vJfwoKxjEMkVq8SXRCedg==
X-Received: by 2002:a50:eac1:0:b0:5a3:b45:3970 with SMTP id
 4fb4d7f45d1cf-5b7f0bd6f5cmr13001299a12.0.1723048261852; Wed, 07 Aug 2024
 09:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-3-philmd@linaro.org>
 <87o764yce3.fsf@pond.sub.org>
 <a8eb43d8-3714-447b-ab1b-c96ff05cf14a@linaro.org>
 <87h6bwwpu4.fsf@pond.sub.org>
In-Reply-To: <87h6bwwpu4.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2024 17:30:50 +0100
Message-ID: <CAFEAcA_2pJA47K72qJQX9bc8sBcA+0wJGaf3KAaYJaRurjQD7w@mail.gmail.com>
Subject: Re: [RFC PATCH-for-9.1? 2/2] hw/intc/arm_gic: Only provide
 query-gic-capabilities when GIC built-in
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E6ty8bEMV4/V

On Wed, 7 Aug 2024 at 12:10, Markus Armbruster <armbru@redhat.com> wrote:
> Having to manually include a configuration header like CONFIG_DEVICES
> wherever you use configuration symbols strikes me as unadvisable when
> uses include checking for definedness, such as #ifdef: silent miscompile
> when you forget to include.
>
> This is why Autoconf wants you to include config.h first in any .c: it
> makes #ifdef & friends safe.
>
> qemu/osdep.h does include some configuration headers:
>
>     #include "config-host.h"
>     #ifdef COMPILING_PER_TARGET
>     #include CONFIG_TARGET
>     #else
>     #include "exec/poison.h"
>     #endif
>
> Why not CONFIG_DEVICES?

The stuff in CONFIG_DEVICES is target-specific, so wanting
to include it should be rare (currently we include it in
only about 25 files). Any file that includes it has to be
a compile-per-target file, and generally we'd rather avoid that.
Plus it's a bit odd to need to change code based on whether
some other device was configured into the system, so I think
that's something worth restricting to only files that effectively
opt in to it.

thanks
-- PMM
