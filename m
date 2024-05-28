Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp37266ejk;
        Tue, 28 May 2024 08:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUbXnk5DYNQX1+SU2pLKo8mHFPLHyxP3fSyRBvJbaoDFfCm/r/IXwIE8Cy+BXCUquaWDgNKqXJ7HQE6+Y8YZ0l+uGMi+UB
X-Google-Smtp-Source: AGHT+IGsRE3qL22ZD7auiO5EnNa014wcbvMsOuqNwI3cSgy+Y1EK+M2dB26OmTgTVGnyin9360at
X-Received: by 2002:a05:6808:309f:b0:3c9:d067:1de9 with SMTP id 5614622812f47-3d1a6111ac2mr16570372b6e.34.1716910960298;
        Tue, 28 May 2024 08:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716910960; cv=none;
        d=google.com; s=arc-20160816;
        b=a33qNnt2AEsD8b/Ar6Qt/6V8QqABcViK7Rh/2bNU9xpcmI8py1HbHw0t5J2EIoAtWD
         lnLhrPOdPEVuiJTqNpxBp2iE52xTn5Eo3K0tplnFFwGF2idDcqsvOskbolH4/I456f1g
         5fuZUirhb9Wc3rKjSarVbs8UNKkushSmyFtWWm3MbxkGRt0apA07ringxCEKC1aESnUR
         UxQf0DLIrng/OXCj8maqolXMufGbCQ3scPl06sc+7cd3PwKlq5oUzg2jJpSD7tT/2U07
         uTwKLyYMFNuTfulzyok1RNUNKPaqIj8k2bMpVQ4JXaYB2Lpzuw7laemQTTsapMvpJsEd
         s7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nujjuCfOsctSzG+VGzSekO6dwzpNPN6IdY5BDfvPr9g=;
        fh=d6/vhykUaj2ZZDBxdUC6/w+ThMU+z1D6v73Oe9QOYF8=;
        b=XY5yDBJAnfDWy/WsYV2ITcC+FesJRR5pjGSmFndRiNXSGZ8UOK2/a9gdCEdCQdxVuJ
         Y4RwUXAgvqvEkXL3VqgZhRb671FndvgmD2F3Cso+8LlNmlJukoVVtgmhA2ruY1wSuX5C
         xTVdSeu56h8Gtc/tiL9hc2CJ05pJWn+ILAcqL0kcXzf8AAY2RW2qqXm7u5aN6I35K6eL
         icp8izuppnb6PTEGfvONLHQ951mz4ddlYSV57b2guMWZaWt3/+K/o6xZkWjbvEfSwE3d
         iqfL98ZDRkM029i18+FxBkC1X59sjxmIyHjCNAFJjrlA0wwC+mqmznFQhzt+aw5a7iN/
         fKPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNds9trL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b0158si109147166d6.437.2024.05.28.08.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNds9trL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sByy3-0003BI-Dn; Tue, 28 May 2024 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sByy1-0003An-KR
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:42:26 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sByy0-000542-5H
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:42:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5785161b98cso525212a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716910942; x=1717515742; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nujjuCfOsctSzG+VGzSekO6dwzpNPN6IdY5BDfvPr9g=;
 b=VNds9trLytwJvt/8l57/B5YhAEftxct4cU8CCcn3QUTZBjhkFVo85HqM2x0vrLrDwK
 UsOjIOGtKdlGAtdZvXSAdPxQ7BNt2K/RkdeCsEe5hlIuKeazJm+e0VuPK6vWsLV3Y+zj
 ntS3A85gwkOpV7NHigQ4eyfcIMjtqKRBSe56ENFzNjbKg9+A3yHMtwDDrdTvY5L/Nkz9
 Pp3vOUpex3Rn7P7E8uv+7dQHrEQ2e2mmp6XhHm1aTMKc15Bp9khSLBroFEmyEVa/dK+n
 k9ZwAf3WT2R5C1+B/NqOHXY1DfDAtEJv6gPB9TP4kasgcM07qBtH2h2v/+LCQ0eRGzo4
 YU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716910942; x=1717515742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nujjuCfOsctSzG+VGzSekO6dwzpNPN6IdY5BDfvPr9g=;
 b=eaJp3VowOHE18WxeM5MpCwff6KeuDlGyNSql92dfV/PtH1qejjqnThnpE0eucEeq6b
 3zcAS1zjYevVRjyN/V249c8DmoWcZF0iBQ8JexGPYw5Ceu2gmQn/kmGly8HfDDHqKxF+
 X72f4vHX9wBB/nrNbzVY3FV4dkTzzf+NkUxLLnB/2r6wA3YmK7uO5zba/L6WKc8dmLWT
 orGA/vrcmXH9U4P03VMRajBe5vyDVrqAut+fEXB6J34RzJzM8z1trnZfyTlw9BM2Gqgj
 Z5R6vARvsu7CovD6qgS4E3ToqZqO+ahec9V8nLmNQ7UdlqI7+/pfmuRDf4351dmt0Jsg
 uFIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNVUR5aX63iPopPhLTx02u6Ker8IlcKwzYZLh6i2f810U4tgcACuKGDoVzB/gMJY30lwc7D5kgUNEy2qogGXEZFNXs
X-Gm-Message-State: AOJu0YySkeIQR35EIsf//l66Lwc0bR2OnmoOumXW/tQuSI8i7Ie0TLVB
 yyk7R6+yyGlXOld4qLTtGE31IWxaT6+YwPmuYjhTWlTuAnmHCUd//0UYxT7B2B15oAjKB2kjmFO
 xWkwndeUUkh5FxNi1dFlSWdESw6HOzOLCKAm1lQ==
X-Received: by 2002:a50:d649:0:b0:572:6af5:1b61 with SMTP id
 4fb4d7f45d1cf-57851915266mr11800496a12.6.1716910942581; Tue, 28 May 2024
 08:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-41-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:42:11 +0100
Message-ID: <CAFEAcA_OkFbPCumCpv2GB6zN69PZQ5YJJNY6VnCMZ+SXRxdNqQ@mail.gmail.com>
Subject: Re: [PATCH v2 40/67] target/arm: Inline scalar SQADD, UQADD, SQSUB,
 UQSUB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: tqHcPZ340KVc

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This eliminates the last uses of these neon helpers.
> Incorporate the MO_64 expanders as an option to the vector expander.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
