Received: by 2002:a05:6214:19c5:0:0:0:0 with SMTP id j5csp5031591qvc;
        Wed, 6 Jul 2022 09:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vtacH0X/jVQy+54neGka8bgcTN2aHbyvwDvVeI0rwtVuOY1LVE1dkhddR7xej45z1LCFJj
X-Received: by 2002:a05:622a:83:b0:31d:3362:7ef4 with SMTP id o3-20020a05622a008300b0031d33627ef4mr26583153qtw.32.1657124085286;
        Wed, 06 Jul 2022 09:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657124085; cv=none;
        d=google.com; s=arc-20160816;
        b=irPCDflZNRo43UleTnwSY1TG5XM5gBO4aHco8zXOJxeKD+EqYl/avUliRITiDEMxPN
         ZhgXVTY/03WzATqCw49KqTMxN2oJBAoCigbBbtRWJrN/XcgjRmlZ9XzO4Mtt2vY43Zaz
         78SJH6ov2mrccbYdjWY1XotuEZFolqiMnw+PzTWcCV43rifhjPfTKm9V7N0HE0BSOlyC
         I/76v5JAhlGyQYapbKfG6w/41kdFaP7f3OQAy8XOoxsvEI3NUd0ZBVIf89hX0Tx4Thtt
         iYCiEne75AQ28sNA7kQ05d9EfNyrJxZgU2wsPOwoY1BCd29O7ovgDh8Y1m0zr5Fd+997
         BFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3wfhnUX8YVSYG9VhiF72A0UQXnWXH6sS7zJvyuE5nKw=;
        b=dMJZiM+QyzKoa+aJWlkNmBs6fE77U9VbhWZ7KBrdKppkAKiFKudTWzavkIPAOoVwYK
         OeLbILQE3LlrDJ1MG5dQbPOaKWQ9fTrBFP93TZCe8d5QFpvR02hmL8TEWcTz8DnvuOdg
         0/kdADmC1VB2QwIJ9s84q30mAgOaZA9el4l+t0NhhsOE/mC+MrZbOjs60R3eSLlYrd4o
         RNT6CyhnQ/67Mle/YUIC7QfgV36pXXWT6et9dwH17jZKy2idY17+aQ1vdvNJaDMZBNA1
         D6Q+yRzyLsCzLNQGtwRnBpz9BfB+NMrLXwmYUBKT/0tnr8YfcYEV5OS8IUcjXtP9So+N
         dbxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CDta9/eI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05620a255200b006aeeb275771si2622965qko.312.2022.07.06.09.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 09:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CDta9/eI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o97fo-0004Lw-TG
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 12:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97fZ-0004IJ-Of
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:14:30 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97fX-0001Cm-8r
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:14:29 -0400
Received: by mail-yb1-xb34.google.com with SMTP id c143so19583454ybf.3
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wfhnUX8YVSYG9VhiF72A0UQXnWXH6sS7zJvyuE5nKw=;
 b=CDta9/eIqL3uddpLxSZNlaX6CgnXo5V9AQqSubAMU2qLz97NnbnAkvQf5o8kp6eXWI
 uJF/2uL4VWWaAmWG9qdDzKV5A9U6zI1VVP5LE7XbbujfCywb0UAFlo2s6PoDUgWMIDOY
 oKUtSKsII4Ya9uAnqIB8oQhQ/h3Qe1MxyxXaiA5OAI1gQoUdaEgwGHnaXMIkPAdsRW96
 gmRjMxDkKyfO9n6rR6sS4PsQ5ParB40GplM6+Aozxjgz/uToo3IlTF0Aiwzp8b76Wg0R
 ZSdTE3Xkdf8kf56Ja8aGFMjdkfVK0d9xQxaiKv/AACoIOg9GM34v/8XRYwA9CrNlqtkb
 +Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wfhnUX8YVSYG9VhiF72A0UQXnWXH6sS7zJvyuE5nKw=;
 b=YUTlkg/b9yPg8rpL3zAcBx3FAr7U3XkJ3rTPv63YF3StvkyD84zYgLZRvfdPhQNGo2
 ZfI/Iv6kFuRiSrzgXeuqfzcm8AYkRJ5G99v0zZN84KOAZMvYqXeVRanrpdiL76aPt0b1
 MzFaxBd+Z9b2T32KugJ5ImaQIgVCG7mpinuHjodiUFCstAzR8EknhPnWbynPjkOxdsQ5
 0OJJsWaZFwPFg9O2ibpLxH6lnABVoGtG76TSbgVc8Tb02NiW7RvJKyDUeGSqnpYMY8Cn
 dLzez6ELpA/IXV91IHLsZdJMFVxV8cnfQeBQLAN6W3zv+i/eCFCGuv4eVx1DU504fzXm
 X8Sg==
X-Gm-Message-State: AJIora+juvOf51vAPelPzmOwbDJ+JZaHCyqwHbenXw/vqg3sXhO1uzrm
 iapkdGgM2uaGYujkreJ9AvZDao+Y4r0MsFoxM2qO385fiYY=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr19205169ybg.140.1657124064836; Wed, 06
 Jul 2022 09:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-8-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:13:46 +0100
Message-ID: <CAFEAcA8Hxb1SPLpZSE-jd3HFe+5OtX8OkH8-4tAOxaqmwmQF9g@mail.gmail.com>
Subject: Re: [PATCH v5 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HVe4lG1dcChi

On Wed, 6 Jul 2022 at 09:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
