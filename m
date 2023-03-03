Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1409203ejc;
        Fri, 3 Mar 2023 10:48:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/iHh5NzGNP4oZxlO7gJq/3rE0Ymdw8Dg4dh6/u6Cg+frdUI9GKn6El1t0VX8nXx0cmqEpb
X-Received: by 2002:a05:622a:354:b0:3bd:11a5:c129 with SMTP id r20-20020a05622a035400b003bd11a5c129mr5030185qtw.34.1677869291885;
        Fri, 03 Mar 2023 10:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869291; cv=none;
        d=google.com; s=arc-20160816;
        b=A7YTiljRrpfuuJSpBzgfHJcqAbSqAAn/j4nwIefe2gSKfh9+k/51+C+1N9ixK+dnxk
         ZBk7p6Ca/tmRiq/XL76FUZwwjIVDZvP2zLywX6C3fIoqxY39wpqOJEaQNRgxSxnshLap
         vzDO1P5H2gITdE9+42SK79ApUfZFHwUVr27GAKOKdcVrTmQeBo/rO2nj3LlNtegWJ7ZY
         RGLkWgGsE+IdSFZhdnpyz6IXIVulY6BREBU54+MfeQ9vq9gLvBrTnOFCOaiaa5CAOPHl
         oA/PY8hRBImhuxi1nKeg2utDYhDI3drWz/7I5rgsDrJBlfNYi1ZY0W/PZe+pX2YT8Naa
         IhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rf+8rqOwxr93bf93w7OyIDbD1iQfXmmQLHIMjh/TBQs=;
        b=cmyb9RJDmNHXKolKqHv+QNqrnOQc7Kl4IYCWBwa9E0Sh5GanLExdVtNDYQSTsQzaWR
         hhppC4PuX/Ahp9quonS7HGhLJvqEEfdV/cxpOrQycTKlI0fRNIbrfcLr2JbZDdyQYxva
         XKp+Ne2HW3Y88tMEkNMQ7eKOVcuTdD7NyU/3qpK6PNRKCTkO88O+6dBseJto5YfQLCXv
         MX4WBqzvoC3KyQseUAxt4WJPZ/v7gWS9HG6z7hTHZdJqgkxPYsIDRZ/XBedcLZgkwij3
         n/Midlb/Y3ZwnweCxYcJ05OgCv5teYlQQPr0muizeYV9skbHXYbk9Q7d+Be9ouSZ/jzB
         o8Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jna5ALF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05622a138800b003bfe796bfa8si2283551qtk.779.2023.03.03.10.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:48:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jna5ALF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYARg-0006mF-FU; Fri, 03 Mar 2023 13:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYARe-0006e3-F4
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:47:54 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYARc-0001AV-Uu
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:47:54 -0500
Received: by mail-pl1-x632.google.com with SMTP id a9so3665559plh.11
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rf+8rqOwxr93bf93w7OyIDbD1iQfXmmQLHIMjh/TBQs=;
 b=jna5ALF/9a7celLZCkknk7CNVlrVKFHwDgoqVC9VPQyDjxJzxXtO24ZTBP2RB9EYrO
 rxD2OAKy1V4yOVhG5ogPn7xS1BT7a25y1vSJqLzN8MyLXDWXqAkYo46K4J4hxviDF7Iq
 0ppA5PEB6AUosdd/4YSuXOjjbvc5uNPzmxSshJ6TStDrQ6m0bAbX/B9u1wvImx2CgR0+
 VNEckocVBlnvDje9ByLj9aZ4jfXVDLdx2S6kSCYKN9s1TxFyWYb9BAe1mTOwjEfQnZHn
 73EM9sb5hnluq96iabZGddLjnrTJSlkGvcxnQO4baQD+KxUvLwk4lzkKfK09BZ/e6dUT
 MAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rf+8rqOwxr93bf93w7OyIDbD1iQfXmmQLHIMjh/TBQs=;
 b=b4JspVNvm7110gzYx2RzzkBwy8n4khKyHkHHw374mS7MzHovaEp5+W1ZtymygdR/QS
 GdMomQ8hikGEaHz0EIZjoKsqnQQxkS9jL/mykg5O1pwc0x6JnVWGB2ZyAeCLeJHS+IJM
 Cx6WOPgL5Tnt+LHW9gSolpyHrsFDrT57kUZ4UG2mBGfcmyZbaHEkgCskHX/KM6f3oJrb
 1emrxce2Rp+xNee9VgujSyDfK8lx4O85REqXgx4FrOUue8m8at9HkIGKGJj57acMzppG
 AZAQjHJwkS3YSBL5MfwaZv0FX+WdZpagq3m8t4zVtLE6NjnfiLHVA+Rt0WoCBkF3I8U/
 br6w==
X-Gm-Message-State: AO0yUKXY6KdZXCOCbei3oq63icauTCXZFvh5F5oN7qjv3+nVoXmoekZH
 gjfTcD+rHoCQ4jfk9V9gcuE8Z2gAHJARmd8AYb8MNw==
X-Received: by 2002:a17:903:428b:b0:198:dd3d:59 with SMTP id
 ju11-20020a170903428b00b00198dd3d0059mr1075684plb.13.1677869270628; Fri, 03
 Mar 2023 10:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-25-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:47:39 +0000
Message-ID: <CAFEAcA9mq4zGgvZ+xfQdC3tTjHM+T8qECbLuxNj8pA-waGxWyg@mail.gmail.com>
Subject: Re: [PATCH v2 24/76] target/cris: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hAuNt0waER7m

On Mon, 27 Feb 2023 at 05:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c         | 70 ---------------------------------
>  target/cris/translate_v10.c.inc | 41 -------------------
>  2 files changed, 111 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
