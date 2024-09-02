Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1100305njf;
        Mon, 2 Sep 2024 06:22:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRUEytHU5ZeMegKXB32qVN7q0Ej0J25z0BwOU99GEHXYmdG9dblWSEoD6MSvhEXifqk0QU1T9Nyli3ZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IENVFmKayT3B8EtY30pcLxuadL09UX9WPND1FpKKL/285v21kcsgbHQRJ5cXQxNOMiepahF
X-Received: by 2002:a0c:ff08:0:b0:6c3:4ba5:edd8 with SMTP id 6a1803df08f44-6c34ba5ef71mr90576066d6.39.1725283327466;
        Mon, 02 Sep 2024 06:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725283327; cv=none;
        d=google.com; s=arc-20160816;
        b=qDCwiB8Lvkk0IH9QZTx/UZAG2RlRiDJbbL59wuzWNa8ldzk0agOGtvEIjQdJrsJibO
         AHyszxdEhXcBK2FtN3Bvvo9keP3UocPnB5MsnXKCyJ4xM0apns6NzkrzsyeThVjT7osv
         r/gW0ZsxnZsYbo71dptRopQpI6sS/YxRU3Q5Lp4OwYfskQ1BoqagapMBJzh5GTWzuDR1
         9C8ayyC5YUpqLWxnHcroUppr+HZ2Vk97tUsiFyaLvx35Z73YpZapW8QCOVAVUm5j8Xrh
         12O236a9UA+C2dfT/qRX+MGM3OCkvf4BviOo7eAxwNEae6UgtRVNiXusAg50yQ5lzM6Q
         rxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3lXrGPID2yV/S6Bim8AfswiQZUQMpjqLA4/7h3Dvhw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=FhbR77efwMaGBTIRPsuXzQQ2FkY1ZyASZLY5QJgDuBLBW0ZBHX41YBOEDaTnpAzMGX
         8lGu2hBRNAaoMLTC4oJKsnbkga+17Hm09GO2B/G9h7CjQ8z4P26h6ZvidX0DvJ7aR1Nq
         i+NIgFH+0R+sfBWVrgn3osrymnslMUN2gDf5sVorPkQedyRdmi0eUaAsSjHs+/TBP55B
         z5dt1yH8osj7QJZNj5Qasj0ZbaRcvwoeGvDWl8fAGhjbkIRzr9MyS51fcQld30t+rwlm
         kwBXyqBKD4F/PG1KU//gG5HwyOhUOR96IE2hEZMzRs0M4t8hBaoeQaUgSUNfnfdVqsZG
         d/yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h/QlHiER";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c368bbf960si20471076d6.271.2024.09.02.06.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 06:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h/QlHiER";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl70G-0003C3-R3; Mon, 02 Sep 2024 09:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl70D-0003Au-91
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 09:21:53 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl70B-0006hU-K2
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 09:21:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a45bso1811648a12.0
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725283310; x=1725888110; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g3lXrGPID2yV/S6Bim8AfswiQZUQMpjqLA4/7h3Dvhw=;
 b=h/QlHiERaZ9gNQbyOONS6muRIgpkklZ4bgeWRuyxzzsysHqMQkic0cJtLD89aRLfyk
 /JlSuB5Sv3GTwf4HZ5dZXOR25izyJUo/HM2we1QjtK/cTROMpnmZXbizeR2ZlHVUuSyF
 vY+kYAgYBu1b2Eo5RhBJG427f0wcYLjp48Gx2uWjFo+m1Swxlr1e0dwTRj1eNUpMlUTr
 h+U4Uz2I16+7wgINLxJBXGgl2rbLeDU50IVxEhkLJqqhicadwoj3y+mhCMuBnW9EkXxw
 Z3nJsjnVX+LwT6dkJ6mJo6spP8jFGgiYB3S3ukZXH1Apab41JsaWB1IgfMiY4b8KTft9
 vi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725283310; x=1725888110;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g3lXrGPID2yV/S6Bim8AfswiQZUQMpjqLA4/7h3Dvhw=;
 b=q3xD/dj3DDPluemNn01CQ4mqw66sOfmK85puZ1U+bFwWi0k/4R5QZdDGkK9YxSQwhK
 yWbb9RGGbNyztsNlT5hzB3FZi/g6m6TcWqEHxzFdoq2239UZoAsMwM2bWIJrenlNIAhT
 tsSS6DZTvudN+hiPWIXpsCTIsBb25CTfdGF7uz3zq+wplaK0ZMoIXVN/61igzLSUpI15
 ry+8ztqWD8rMJX//WzUSXFH3nbN1w6l6r2MAg51crINilUIZrKEvsroG+/RB/r7q76qt
 48hBwsDnWnu9AuGVgFfT/5zQRlolRO5X2jCcxP4k3SaSpFcyeWZJ4T27QtI09v87V1g8
 +x7w==
X-Gm-Message-State: AOJu0YwwhOXSeDgZiaOmxysT2urD7zkhBP5mRXyePyDNLWzzFSjuw/rp
 e0x7E2/LlH5mqRWLwfoSCVQl4WWqHRvQ/au7wxqUXTMx0H4/QrLhH/Y1g7YGWNC6AdRySLEEJGu
 TPH64AfRFo4idmdC6SZ4iTRw/qeEp2S4nZ73o02TNoma2F328
X-Received: by 2002:a05:6402:27c7:b0:5c2:5620:f72 with SMTP id
 4fb4d7f45d1cf-5c2562011e0mr3222410a12.0.1725283309516; Mon, 02 Sep 2024
 06:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240830152156.2046590-1-peter.maydell@linaro.org>
In-Reply-To: <20240830152156.2046590-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Sep 2024 14:21:37 +0100
Message-ID: <CAFEAcA_g5ikdqXQB7t8x215TQ0O2YoE4S=Xa8TcrUxba1kddyQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct names of VFP VFNMA and VFNMS insns
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mhupS9cb5SBS

On Fri, 30 Aug 2024 at 16:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In vfp.decode we have the names of the VFNMA and VFNMS instructions
> the wrong way around.  The architecture says that bit 6 is the 'op'
> bit, which is 1 for VFNMA and 1 for VFNMS, but we label these two

Doh. "1 for VFNMA and 0 for VFNMS"...

> lines of decode the other way around.  This doesn't cause any
> user-visible problem because in the handling of these functions in
> translate-vfp.c we give VFNMA the behaviour specified for VFNMS and
> vice-versa, but it's confusing when reading the code.

-- PMM
