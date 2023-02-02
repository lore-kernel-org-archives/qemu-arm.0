Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp300249ejb;
        Thu, 2 Feb 2023 03:46:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8jNgWh7mL+Z767xq3wpSdDeOy+NE7ZuUQO/2TG/7C9jd7ItB057cc2qW5rGnU8WaozOTbd
X-Received: by 2002:ac8:5c55:0:b0:3b8:6836:f96 with SMTP id j21-20020ac85c55000000b003b868360f96mr11248419qtj.42.1675338396139;
        Thu, 02 Feb 2023 03:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675338396; cv=none;
        d=google.com; s=arc-20160816;
        b=dVUpMy5bmdJwzQMw4II/Gxo815v+kwdnmE8ARAJ5oPYxAhWunrrV2gIoL7zevXm+Zo
         yjqF8EL+AAKAfw7W4J9zcGKmUGMoenEwhFz3gyiGkBuA4qnrki1X2ZysT6ZVd7ulTfWi
         etrcX1tZIFUxK7ox8ttoIGGS4kfSN21+BaG3S8J1zK0jeO7qxlfx+3TVV02AIItVFrHD
         +K53hQZCsEI9vJPT9YAjLxG9Y4kqA5QVlAbzMv824RRxQC+/jAFBh/8edpQGGj6xe2/3
         tgaODK5xAh9lv48ECzrdkIi1l866wCKzqaenKcOFhl3DSUq/7/cqLN0teRn6jq343Jo/
         SG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/Ihh0Z2qNtXEvLVXwnbvKt4sDCuNMJZYETfqrjhwmgk=;
        b=wxTdaEliKWmrd0DdYxlJe5eizPfB1TvqbpJC/4x2y8H1HNcOT7g4R/pljiFXnUArij
         iNiSkpwtLai14AcFa7mZKzenDlLmdS3nTa+xMA+mjqBYcpz561xPwMKwS7F9M3tAYfCQ
         ihlefE9RwBsQuPqPEuDRoXxi8v77QKTbzQaZqZHqjeKxNtWRSzZqLHAfGiYUbUuMXvEY
         xp+pWiJ0te8RQX57ktJ1hPlANpM/f6x4vE5nAqcwkgVHKhIwvg1xIq75YPG5h18JK23K
         G4TY8C5wDiTvkEzPIZAQCTNEzPha4L4vgWBj6hEClvdnZddGGnS6Y89cc3zsxwVuNq0T
         Qxgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d8iE/L2W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020a375402000000b006eedaa4cd2asi11969881qkb.570.2023.02.02.03.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 03:46:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d8iE/L2W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNY2w-0004QR-CA; Thu, 02 Feb 2023 06:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY2k-0004LE-1w
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 06:46:18 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY2h-0007D3-F7
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 06:46:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k13so1591284plg.0
 for <qemu-arm@nongnu.org>; Thu, 02 Feb 2023 03:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Ihh0Z2qNtXEvLVXwnbvKt4sDCuNMJZYETfqrjhwmgk=;
 b=d8iE/L2Wp62PgdAgWtea7haiyjEA4FAKdcMUYhSCf57XcgHftqRp7erYivsXdivFaW
 ITXXlBa5vwjG+WajY+me2KPNRnue2o02ZJ2884caBU+PauqPmg15U4fRlAXTahxYscGq
 Bk6/kGkw1vb5wZm+WUdl+d+b5M+evJzHTBNtbB4+6XfWfJMN+0RgsMYKUnUW2GnSvyR3
 ldgdI/FmrMoVHKL+1Udyc48+sIzPca5agIHpeXcRKagiYQu+haF6hikafyNoznu+uXhO
 UBqY1zA0B1bUyH6YbzCP/JVhk4sekrGm4QyuCAGdDLXo0BEw7UAhLzWj3mKqLsXIzYSM
 ZgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Ihh0Z2qNtXEvLVXwnbvKt4sDCuNMJZYETfqrjhwmgk=;
 b=hGVb8bKEsXUFph2CIYlUzHufMgDtt3Mr0jF1S77xpVsfAm9C0Cf2z0+OaqXFSJ9Vwj
 QWvTJ6hk2wN+byNnyH6QnhU7MoD+gmGsy+3etYiiumAWjPm8cGX7564hg5EqRV/3bVRA
 frrBA+G64+OSWsPGXoW/CKE649lUpinEDUGjAxn6mVW2YLzsH90+M0rdQDqU5t67G2sw
 BNJpDzCBxnRjtN4/puhEu4GtyvC4GO6eLg5iue3nOVmQD4ogSQMeh/FbDVL8hSx9g2XB
 DqcSgxCfN6qrT+zShHDmqWdwOZMJa6aa2RgoWvgpwx9PPKxkffcr5jBoIEsqJCJHDcI5
 7FPw==
X-Gm-Message-State: AO0yUKX9eKkgk4qQqfsfvFQijqsX9aFcpQKyA1zzXTG9sEjDklXUB1ag
 yVLK0CSHWl17pRTHw2RRx0XmoFrWYN912NM8CtMENw==
X-Received: by 2002:a17:90b:60d:b0:22c:34ef:2065 with SMTP id
 gb13-20020a17090b060d00b0022c34ef2065mr477864pjb.89.1675338373608; Thu, 02
 Feb 2023 03:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20230126233134.103193-1-richard.henderson@linaro.org>
In-Reply-To: <20230126233134.103193-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 11:46:02 +0000
Message-ID: <CAFEAcA-OmVfz07rz3vqa2RdXgc8SgSRrAJ=qNdineNv6PP79DQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix physical address resolution for Stage2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org, 
 Sid Manning <sidneym@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: Dvd9xmTMdD2o

On Thu, 26 Jan 2023 at 23:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Conversion to probe_access_full missed applying the page offset.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Sid Manning <sidneym@quicinc.com>
> Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
