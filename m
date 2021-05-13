Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp361731lfg;
        Thu, 13 May 2021 03:40:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/7MypWVcTg0xyoCCgwuup7XTzzu5gtLRfTf0x7bOwHs5sceYC4O9gqoETgdnIMWnfN1PV
X-Received: by 2002:a67:e915:: with SMTP id c21mr37414472vso.32.1620902458028;
        Thu, 13 May 2021 03:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620902458; cv=none;
        d=google.com; s=arc-20160816;
        b=BgxVSVqZoQAJTyWYvODtLKPhxMFZfxsYmhcf0tKfEj2hd0CbeG54iSOkciZeJH7HPm
         fmtmM85jPO4XwdlCSCV/wVGyLFt04N1H4yKwpYI8pb7dEaBHMZ638o8iN8lBEcnxj4hj
         v2iM/TDErWLU3YQS+2MfJE6ezNwGThP2MvuPStrqm3zDQGrQeERJfePMwKbe+6Rc8NaZ
         rmiLTBW+yzLnaNEUSzu/Ve9HocRKZNknFN74clcZ7JxoAoMehg85xaGYAG7JOKFxPuQH
         C3Hq9sBktIn+47vEi1h0RBQhvTRarge8RM+7N1uYQaoE+GiwaaXVsdlt9E4+Dbchv6yZ
         V5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rLDI1LGXpBqOaDRoG8Hza71T/rZN6gaFGuVEqDytGh8=;
        b=Yez6SCqBvqQWUz23hI3h6lsS5a5M169U6vaa8+PPiQNVZsl4x5iJMbQGzcdLxoG1Lt
         w+7UIkKCuv5oECxnS9LOFV8m2jG14MFpba6A/BF6BomTsXpkM0JD4mVo/5HV4KBF6fU0
         aac0w9wA/90h/e4xfmtyrLOQyC2Oi2YhIHHxdtnw16qEldQeRMB7KvUnk1CfEkigRK/N
         KXZFB6s/mhhWBxZY+zCjuvzho8qNaE5Td9SnZSOvOyUy9ZvZzsvtxHCZtDesIVovTRSS
         e/C9KCi+gDSLjUcQQ2iGhnqQ4XN1EhR9flVgRqjILBeg21rh4wuaJ39AiKmZgeUcoqNm
         JWSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g65vPxIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si1868655uab.58.2021.05.13.03.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 03:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g65vPxIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh8m1-00005q-8e
	for alex.bennee@linaro.org; Thu, 13 May 2021 06:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8cr-0003QC-G5
 for qemu-arm@nongnu.org; Thu, 13 May 2021 06:31:29 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8cn-0001wH-GF
 for qemu-arm@nongnu.org; Thu, 13 May 2021 06:31:29 -0400
Received: by mail-ed1-x52d.google.com with SMTP id c22so30404630edn.7
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rLDI1LGXpBqOaDRoG8Hza71T/rZN6gaFGuVEqDytGh8=;
 b=g65vPxIUKR9OZVQ+K8RNb4EaqP4/IiU9k+ZFHaBFyBvZlxdkaZk1VqaYdmq08C8Awh
 iWduni8sv5E7TTM0ih50+PCBwzyrPPbVrwVQ7S6chk5/ermUhZwKQ+VhhQhzcgEkHvV0
 xQc1DhqTUc3m/Igyo1sRICb3p0QvjLcaJe7X86Jgq+fewI4wl0We0bjGS166A6yhr9gN
 okIqE3MlZpIM6jYH19gvhbMVVjYshV0fLa4X73Dubb88i+6r3rutWCxbG90TdC2BH2y3
 U+DXKhxk1wgY00sP3qUtlzDtvarAiTj3xsA2S1Fi1VzpVzuQy4RzJkEsIoPBMqHq17DI
 RFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rLDI1LGXpBqOaDRoG8Hza71T/rZN6gaFGuVEqDytGh8=;
 b=fCS7HQ3TvxUDgAX+wyVOf4l8ut6KYxmB7sQsWqbxeV027TiGfG+DzMQ9K6BxqnpG0p
 X+6EsH3Iyfm4oBbBpXcCbMBbcqre0EYQwsvfNxy59lfzgfBrJ3CSCoAmWaZMMs1VKrAt
 nZuDTBqWJ4Z5cTMotDuffEHmC5pb7qjvViBQwMEsy86vFf06T1/D1HJCcFPbMTo3yc8e
 kBSt/FgmmE4r8I8OaZHvERC9JJzCg/cOvZOO4IbrzOo5CiVbGHbafA4kxX7ledwCmI20
 zepRVsHd+JkLY15qCEx8aMz7wrEsJ+m3G71W5f9KwhScLmLXIq+rEVlxNol0x8EawdC0
 nKAw==
X-Gm-Message-State: AOAM5311MoY8mBjVbAjmaOjP2ihmx88UCw9Iy6Hrohe5hHIbDwIepcqL
 2LoyuMmcms2CLVONqQ9E6uPWiznXouFff415YGQ7uA==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr48790567edd.251.1620901883546; 
 Thu, 13 May 2021 03:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-45-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:31:12 +0100
Message-ID: <CAFEAcA-1sFDwB8H+gRpkDzJNnKcLQ0ywAVvT-ed0SCYHO9n11w@mail.gmail.com>
Subject: Re: [PATCH v6 44/82] target/arm: Implement SVE2 scatter store insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a6kauYw/sFhP

On Fri, 30 Apr 2021 at 22:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
> store insns.
>
> 64-bit
> * STNT1B (vector plus scalar)
> * STNT1H (vector plus scalar)
> * STNT1W (vector plus scalar)
> * STNT1D (vector plus scalar)
>
> 32-bit
> * STNT1B (vector plus scalar)
> * STNT1H (vector plus scalar)
> * STNT1W (vector plus scalar)
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
