Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1104764lft;
        Fri, 1 Jul 2022 03:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uijnxm6gx+fLcTpvPaCAYXbvM39TJPBLLeQwwcjlAAJT2mU8O4errsdzWYPK8u//Jna9+k
X-Received: by 2002:a05:622a:d1:b0:306:5d28:f0a2 with SMTP id p17-20020a05622a00d100b003065d28f0a2mr11904407qtw.581.1656670379240;
        Fri, 01 Jul 2022 03:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656670379; cv=none;
        d=google.com; s=arc-20160816;
        b=MdLH/LMM8GgEMj3NPUwSkKVVhdanaXyEymaI7zO5Z/hemgVNFSWzdKwkqlrQoGncQE
         l1CS88sg3oFOOo8KZSEZxOd6doaYjIIT/raBC/MmG1WiO5bfYq6DY+9hvPegpSMkD2sy
         wZCkvkY+Pg/PJi6Gf0u1D734Rimm6LSD4nz4jUCnzLbllf0mNl5QIHLIuK9bi8yuK9Ng
         yFM9ZfVXSzmm2H8LQsPc3TgEDtPrHByy1O8/8b9V/RKxTGHc7yGya9JnmDlcbv/ypoWC
         1jW/+bjmRw9MC/GJ6axLA8JKvp4EYs9hFwjOQgfsBlUK6rtI3BeU1XlA1NcK6CV5pVL3
         SmQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R4v3+wIxGgP77avhGSBxN9v2ijWrN1zMXuWnTPc8El8=;
        b=mfGVp4F2zx/INEMmL3U4FrqPURzNPGZRdVM1sHvSwTjhnBztaIhzgRPIs5hpWBvDBd
         2ARAJKvep+w89hPW2rs0V7IX04QxdxnI19bjOcrhN7UZ9MJI5E54i8qJWSaxvxlmNzCK
         ZW1oCYu7KKqhsdvja8rfjwX+zhDJMumVPG+YPtlUrAjetVldpuKIxgYc9411RjavjTTj
         YHkp6mp5ueEqKldDiDOgghay93v08lzUJDGl4iAxNOs1M3rjTQck0Kwk3QvSna6matBF
         fe7Yn/tranzQzoik+lfhtvJcfsns+kRKIlv+wLdth6y7NlcQRD41Kdpls9BEzvcYQG60
         b4zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahbLAFgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a0562140caf00b00470b6252c04si9431334qvs.391.2022.07.01.03.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 03:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahbLAFgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7Ddy-0005aa-Ok
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 06:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DdY-0005a7-ET
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 06:12:32 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DdW-0004Kk-SO
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 06:12:32 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id o19so3236208ybg.2
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R4v3+wIxGgP77avhGSBxN9v2ijWrN1zMXuWnTPc8El8=;
 b=ahbLAFgwxOuy9aFYjnUVOPTc3URB6T7ShdLqUjs6ST3YbcnTWWPHQMfMCmJRdS0TNc
 XCnRb6Q5lqHwCokDA8u2AVV4bZi72wSoKdqd7no725teDPwFdFolKStGeOOr9e2SQBz+
 vEwy1gGmZFMxSCjTFTep1XwMKRjEHM8dEu9ASPGT5F6KRiHWlfKi+DMMYjK+iLcP5ZDI
 akUQ4+E2yg5v3tc4X7Et3skkz+BKOZuIcfV2a0bdAiETA/cfuYe28mbLCVm9B5Q4tbUJ
 lPSYw214k80eB2pN33lG+Ize1OESuwSswQO8YsDL1vgMG5ITYi7qFIG2Uq7gyZMKshTK
 DR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4v3+wIxGgP77avhGSBxN9v2ijWrN1zMXuWnTPc8El8=;
 b=w/7z/R2JY+4uCC7AnDyAIPdK8kkHQf3GCHkSq5f67Hpz8FMjoapLQ1L1g5GMpNl/lR
 2GddlHW5hHuTM5tJfKzNnTUxWbOU25njSMIGTgq8eNqBjQt08je6XJgjuVJ+lRd5xOLE
 l1qwn5Yniaa2RCK1UhEDGuwY8zlwsITRf/o8lK2AZAYNVD0TfIK1p2pBf8/G0sljPRJT
 wgYkA4Wlwzb5XsuKJrMnr69RpBcNrHErezUsWOS/vHNoMqliXDXbJ+fnVKJkT65qxWzY
 +37lDgldfjxWezZ9BEwIoR7WherOvxLfrT6lGwoeZgpUBBnLPn3JWEhdUvqqGJwH5sSJ
 kukQ==
X-Gm-Message-State: AJIora9i+J8mQ3dh0AGuNEa476EqkY8sCLXsXEnAWy1NGh5ljOqYlIJr
 dXQ5sym6p3shDGwHQa5WsOfhEjsW+0SON3dVN1h1mw==
X-Received: by 2002:a25:5c5:0:b0:66c:b809:ddde with SMTP id
 188-20020a2505c5000000b0066cb809dddemr14239524ybf.67.1656670349690; Fri, 01
 Jul 2022 03:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-2-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 11:11:51 +0100
Message-ID: <CAFEAcA_vso+2SFgzr6h2-TxrA0XJ8i7BkANX9Cu2j0oBjR-0Sg@mail.gmail.com>
Subject: Re: [PATCH v4 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: I6pD7dEko77c

On Tue, 28 Jun 2022 at 05:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Dump SVCR, plus use the correct access check for Streaming Mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Dumping the actual ZA storage seems like it would be more
annoying than useful :-)

thanks
-- PMM
