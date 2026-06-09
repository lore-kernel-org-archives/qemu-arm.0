Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93BECD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:27:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsjs-00015h-3z; Tue, 09 Jun 2026 05:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsjq-00014u-7F
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:27:14 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsjo-0006Wv-PM
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:27:13 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-6604176b575so4881677d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780997232; cv=none;
 d=google.com; s=arc-20240605;
 b=UYWVFUZdM4PS+dSkCdO6pXUjlBgIwYJmCgUJGW2cFtDD+/RaPKdr3ACeSTkrnQwOlM
 368ncHRQg/UOrJMgsvbAmIK51iBMyhRT8ijd1HRKscuN66dfU2/6tzGj/yH2AFM25aQi
 jkM560oD0ThKyWXdPhg7bGME0fDQezyCgVrnQGNpamyEjDIP+oyHjS3sthPqpT9Wd7NI
 LNeZfw1eBBTKj4taH9b3hYpndygzIIuMqx3pREkWln43DURtT0em3p8vhiOBaTvijjRu
 oeh5sGdhemqhC0NwAj6Bt1eomldCimD05aKLyjCzmVcEe+pXp6fV96pTFwBhXxk5TCHm
 XdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MxK2rRk3HDVkvxhS45QhnfI7H4yHr2mFuvqZOZ8U7II=;
 fh=/0s0OwRn7pSO9nfhzlhHNmHCnfzhOXUCfXHFMpGBPPs=;
 b=LhvoyIRf7a9a38nC7OODZ3MWuUrzp60k4plVQGh76kgWPL71llXOmDibfk4G61IncN
 RuAUFTVuUlxuPAx/q77dQ3rXR0+unDgwGmYv1AYvlnTx3BT8dajqimq1BoiEVIjcZ1U3
 XCYM1C6jCD1dujDwdSjfN1vABhzc5ji8bsTAEHcd8TtgrBe0n78w+6YrBxnc3+lgIaHF
 Qk7nTq8sARJKqUsD5lexMojtObd6xStdqS16GPF/4LNrl4jFBk0GA/SX/0Aq2PfLWxTT
 yvdxp87DB2NuAuWr0+KJ5FFDzGRQuEE727YCGEE/nlsBpZ3FXgcrTIEfu2wFLbTtN3tE
 9fOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780997232; x=1781602032; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MxK2rRk3HDVkvxhS45QhnfI7H4yHr2mFuvqZOZ8U7II=;
 b=HXL76e5OMyu1tqNFIvPXbwW/nWjWxmwztQ0OOG7SvAAdCVCcR0kKnYidfaz1wRLCz2
 IP9lVNHXot9rF6TH8sHQVtw0bDglJ/VU125DeRuhRuQbTNN7MvOM0IvdK8Av0rne1zvx
 0S1fS6gBl7TnVea9MSSCEAOWcc3BitcMRVffABWeZgJMmPTHYu03NIClqB5pjo2R7aKB
 kygTxRuXT55O5ee+E+AtKuGXc/0iVeDFkgT9RhTEU0StZeJmDGPXdhbp+G0wERcG/sJV
 U4nDPB7cVZHU0nBE/nmk3p0Gl+h7DgI6u/DWlVkcjc4b7Iyj5mckTYUUzHb3Ji8Noa+B
 GbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780997232; x=1781602032;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxK2rRk3HDVkvxhS45QhnfI7H4yHr2mFuvqZOZ8U7II=;
 b=H+5dbhv86Tw6gFfdp04GOUZXlnOfdRtmoqQDxCR/yyznodRXkNmQiI1at5H914xjcT
 odHzRmVLmXy4X6uZlSSugZtxHymX6+cTfUZAq28vpN98/AJFGT7dNWC8AAW/770iCzcj
 x6h2SzIdw7KMB58TEl/EzeH/ZRuAWABLH0Kjbu9DMXleoIKK8bNLm3aCjiyUhBFqDlct
 vGkmPE28eMcrKTN2r+JfUAZWbXrJ02+FSysSIpt16Btgj+u3bueo/x/L93oa7jfrJthN
 JNzpkfHsjEL9R91tVCD2ptj3oO1+0EwW6CpBpdlvbN23McXSkUlfagE0Km8mmt8O7+dL
 69hA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/JJWR33atmxjwtKmdz1r6+1T+ey6c8viEIK20/rBBzGTWow49zQPgGfHpV0RpRlWMK9t94dJINkQ==@nongnu.org
X-Gm-Message-State: AOJu0YworOTU02V4W8r2JClADbBOnHdv4QK4r5oBqlvYFPtiuIYzK5+J
 BxoaOvuqTw/TAk9QZXHWzn5yIsHY3DmUgz2jAyTvveX2LGNFEbL4kHMJAR/hcc78pajFqt0FrQp
 hwy4Ghw4aTA/ZPu374BPB/h1YaMWAMKcdnvIqwlLjOg==
X-Gm-Gg: Acq92OHZhl6OASeaCMzbTANjgKkuphGz3bVOKZHcWOHk9dc+uPUNaGwEjPXCaab8gVN
 2OIsWj4dqgJYWJGgGGORcHgMx8vbBooqc/2IwVmLSUYe5bpPPUHZX3xUN5c6bxOaOOLg6azeac2
 TvCVWu7PEKthsy0tbN4gMePOxYhDVku8ioink1oIQ6cR4SiXFyGYOO+eocVBi013MJRzduQoulU
 tFGvbY4aAQ4zmfBHMzGFSUQ3EW0XibaVnpSHqWsXAX+mlJzc7dn+plKFh3VNIdL8TaQ1bcvssk7
 cV3Qyp8fvlDLsRqiuJtDJzF9mInJQS68KF/M/ut4A0r0vfhOMImlTpcc5p0LHFU901suq4G1Db2
 v4Q==
X-Received: by 2002:a05:690e:1908:b0:656:30a1:70e2 with SMTP id
 956f58d0204a3-66106e00e6fmr17508024d50.6.1780997231629; Tue, 09 Jun 2026
 02:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-25-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:26:59 +0100
X-Gm-Features: AVVi8Cc4e6jw8A52mjHvofKyjhshZ6DcfRDzUubsxZpxvsoq21njmIC7QxT_gOw
Message-ID: <CAFEAcA8uBEDRwqjUDgtk7TmDsKwrBn4R-W2jSXZz6vuSD5HWuA@mail.gmail.com>
Subject: Re: [PATCH v9 24/45] target/arm: Enable FEAT_FP8 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 3 +++
>  target/arm/tcg/cpu64.c        | 6 ++++++
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 10 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

