Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3984112lft;
        Tue, 5 Jul 2022 07:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sazdR4ZnoAVVIoFziv5Ko0FC09/EFHqU9n6A40NVituq2H7maOYxkjWgeav44Bnaq6rTpI
X-Received: by 2002:a05:620a:490:b0:6af:1ae:61bb with SMTP id 16-20020a05620a049000b006af01ae61bbmr23371156qkr.190.1657030416720;
        Tue, 05 Jul 2022 07:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657030416; cv=none;
        d=google.com; s=arc-20160816;
        b=LtPEf5x7dcUNRdQcY3WAWxInQfVWR6M/TQ98mrqQZQuMTwwnatzsPXUM7N+WvIUM4E
         SYql5qZTfkxVjFnxeensxu4IF4SBeTyboABceaIwDKabi6sX8uOJwY1h+CQgmz8GGe15
         ewOS4lHRuaG5cpt7N8a0VNcB5SW+3jaD/peYS0d4AHTI21JstDPYjQhkdtCB5WT1l7aZ
         w+YqBGYUhVhWhmG8M6HMaRR5uUYI0ZlTIe5D2SzbCkbArLL6DXf47khJWoIYRDfBaGPi
         Veeg3vj+aP06Aga+s4dvmqKgIqQfRVZ3AAycB/ONPKnThCQAq40JUTcYkq5zQr0uO15m
         7hnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=d56NbgntuKaPhsz9w2swmsKP0dXTGKOGOeJn0h23PX0=;
        b=XgW1WUCzPZIvbsNbVV+Hg37SQPnWhHV8ZvYUHk9XB+1e95l0//PiXR75XBRvoHNX8l
         wtV8n2zVa42pIDLIK8c0X7RYuvpRlu3ZwjzdEr9i4f8pL2QY3KqnftPHGbcIvAnHE7Lk
         Gq1t/xGCZ4MGLdmhAAyHVP+Wb9NrFVQcC3ywdM/D7/qAeRVybiyOk2twkuRIaPMNbKKd
         IEZrJxdi1xEHpAd3MxQza+KYD5p+DjSwlOA3OEK3v1upNTUOdiBLxiuvmMuL/d2sEBAm
         0//e8YcQpjV0BYsZTiPgoCA8fWMiNijtH5HmYw23YXrRtEVJRw1GbYyt5ptf7TWwStbw
         V1fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poZzacN0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020ae9ef0e000000b006a6a6ea7456si16244463qkg.153.2022.07.05.07.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 07:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poZzacN0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8jJ2-0001jN-76
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 10:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jIY-0001h7-Mx
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 10:13:07 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jIW-0001m5-B9
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 10:13:06 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31c8340a6f7so69263087b3.4
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d56NbgntuKaPhsz9w2swmsKP0dXTGKOGOeJn0h23PX0=;
 b=poZzacN0JdHCa2cYtabOYgBm49mtT5jh9UTW2n/LquJ34uHtf/ZxcZzge9Ikm37Y3k
 0J0uu1Uaf7Bb9g+AQSzQWGufubCRYikTj5ARoYwzWXud5cuzAMQkO+qKy9bLRcljejL6
 5Jc1AHzbiYTEWvY0QvfOoICSpRgIfe3EGsZIlizz6NxKVGx8AuwtRViRhN/H2d2Fqtgw
 1xPqv4LDTWQi27aQQeYlZMCWLD0H/9a48IPqVxLmMXcr4z80Cvh3oRwvXCWEjHKiQ9Jt
 b2ksTiRmd5RDAUFnt57hkmq88JlTF1EXsFEq+MMcYNFCsNPr6kzIamMMnDU7NB72hb0a
 9Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d56NbgntuKaPhsz9w2swmsKP0dXTGKOGOeJn0h23PX0=;
 b=xAOa7i5m8adwul0cwp8yb5kt3tdyoYsQMWDanL+LAenAU7YgGoH9wGbU03b6KZnvdv
 gPMuyPMVH67+BT17YwVI2NQEjrzGpaUzEbVOYXxTvN//3VO/R5M64ToyvoJUqDkpicbb
 kvG3F9MmVxZQHogimJifeRTFE9AYxIKPAKcK2+AJDPzhlWMmFvyqLh/kUHi194JFSyMR
 JBcQItIRo9r9DZusE1evnjzxxUnq/oDxPvdB0fZWOeyhPbCfMGwmHhDbwK72lfPkmze3
 WgVaLgxvoZVJiKGlKLsEhxt4Q5bnDC02zQFHMW5fe98xi6y+66s3R9CctYcfmhGw50YZ
 3QAQ==
X-Gm-Message-State: AJIora82u/l/qyv6XRXUYgzVDGX/zSlZxhFmMg8qBWQKuce+t+2IyLRd
 LWrYfNJhEe7DYOkP06BSW3q8v4ZcEeoa9vERSX88GA==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr38752468ywg.329.1657030383383; Tue, 05
 Jul 2022 07:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-8-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 15:12:52 +0100
Message-ID: <CAFEAcA9dipRZVqvHvBrUGL6nxQtmz8C81W5Dog7uoBVye3m5UQ@mail.gmail.com>
Subject: Re: [PATCH 07/62] include/exec: Remove target_tlb_bitN from MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
X-TUID: PJJ7s/2WLK2m

On Sun, 3 Jul 2022 at 09:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have now moved all uses to PageEntryExtra.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
