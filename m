Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1424271ejc;
        Mon, 16 Jan 2023 06:02:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXszRQScsRppsB1lsbcnOd3gJ5n5GhKVlspLVBOHOO5lUaZVfFZzHudBAkwvcWjZngvskxQJ
X-Received: by 2002:a05:622a:250b:b0:3ab:8c3f:fa with SMTP id cm11-20020a05622a250b00b003ab8c3f00famr133053409qtb.14.1673877762876;
        Mon, 16 Jan 2023 06:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673877762; cv=none;
        d=google.com; s=arc-20160816;
        b=imWpi2Ktzs/C+VqoUTJOsFnLayiD5lILhR4hRt7KTqhw11PPgNfko/dS92vOUCPXO1
         Y/s7RAui0VDvX/z2l3qHrvCa3CwXwcYFG+yTpj1KVnnrwnawuZjd6LiKHljlhj57qF+2
         wgmh4rTtlcY3I2aTus9+sqmMRx9AT2x73sOyUGMKngEdDKfwKiqkOg3vQUO2jBPNNMyZ
         xuKivvvi7IPGxrTQM4GmJrBilHNNystqzkcU+1QaxQRvDSg5yg/nEiXIHEfsh9ugM5oC
         fwZt0R0HLP0T1GoodwbyDaiLrLJ3Go1wqqRQRR15azu9U6BzwyU/D/wGbmLSfjtipvK3
         yiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=02UejPRtuLIpXQ0aArH2+dK6f6nXSapbtCorg1f7ZUw=;
        b=Cwwl+ovhJB0YEsOCZauQ999Ai87YFQlqH+gxdF+DVyM9fIrknMX2iOlMlxvJxrf+7h
         2ofDp3WJvovmIARBuhje0QkfRtUI54E+HFIDvgf5VheTx9Mcu5Uci5kE/xTmQmGqkhr0
         TESqgVqbmTUqY8VIFr7v/dcOdEZOZ25LJlXfvEyCumU2GRTwZmy4bDH9ifj9qe77jPXG
         A1tOPK2Ck0EtD3wfCH+3dmwZOHl7GgL99uqyfg+EE3kfM1MJLaASPuem8FywYYVwBqMb
         bR5wOJbFoKrd+yJkMGXI7Lw8M4oMccQQDngS2cT0wsjgxtmF7VNb0rdVzfDj3AWA6zrL
         Bnsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YEIJFeQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020ac87410000000b003b634118354si938436qtq.217.2023.01.16.06.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 06:02:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YEIJFeQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHQ4C-0005eH-Ri; Mon, 16 Jan 2023 09:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHQ43-0005YV-JL
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 09:02:21 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHQ41-0000Vm-HQ
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 09:02:19 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q23-20020a17090a065700b002290913a521so11757255pje.5
 for <qemu-arm@nongnu.org>; Mon, 16 Jan 2023 06:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=02UejPRtuLIpXQ0aArH2+dK6f6nXSapbtCorg1f7ZUw=;
 b=YEIJFeQMcxbqWLWuZKJ0iM9cjdzqaXsRLfFHQ+AcoxNaxtGlHRIm/6k/YqKd04xWTX
 SP/B/po+mQnxJhv224/a07nNVicq8N/UOv84/fNiZvj8uALrrbokb9f7voaRTfTMhT8R
 vAzxIewZkVtQJs67DVtlyVYhB9Q8Ua2DHG3g+84t7YOguWDIT9+QGZqdBHukEAh5iw71
 q4akUThaZrFQPx9sMp/VcG2SHxUl5ZUb5AMoz7sf3/5gASnuNjJZPifz3aJnj/J6Cn+b
 FBmvqdANf80y1uLNlxVNMdCnmq9xDdmOSQ0AaBMgcTrC64Ta/v6crUJ1OcimZZUX38PB
 q/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=02UejPRtuLIpXQ0aArH2+dK6f6nXSapbtCorg1f7ZUw=;
 b=ZZs0xr8NvdhHVoERrJ0xHg9qtr6NVR4Je41rofhNu4Z7HztdLUchhnUGcnnIq7KrhX
 r2o2R1LGyveOc1nyuwcGkHhnojrEVoXG2MzJERRiTqmvHHQfof8ZhMObIaL+VcTb80aR
 jxQRWdyn91AkGE9vH346Dug3vjQ6kk07ljUble7VVfYFSVeFaBYBq7XWoqyHhMwymNPr
 hF/O+38WTR1GCbSxAZ+rT/q09Jmi3U9TPARInFCqOGYwAidbfVyXgQT24sdSidV3a8mj
 SvImIGl7tZcVx99jxluRd6PSQmspi2Y/ybIvTo3omZ1ykWZvq1km6I6YqEBKGKIPVhBf
 9XhA==
X-Gm-Message-State: AFqh2kpOGKAdLBKnpPFRgVdL1ChYhngkuGEpTkITBvE3zM8v//hyQDSb
 VkxzWwvb5GdbRai5BdS3uDLWIHYgr9fny8RJiYsqxg==
X-Received: by 2002:a17:90b:2304:b0:229:189b:6fee with SMTP id
 mt4-20020a17090b230400b00229189b6feemr1168255pjb.221.1673877734746; Mon, 16
 Jan 2023 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20230115171633.3171890-1-richard.henderson@linaro.org>
In-Reply-To: <20230115171633.3171890-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 14:02:03 +0000
Message-ID: <CAFEAcA_U=XyEFW0CkTweEL7ET2wHLM442H0Kfqdb33-BzonBDg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Widen cnthctl_el2 to uint64_t
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: M76V1pokBRUm

On Sun, 15 Jan 2023 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a 64-bit register on AArch64, even if the high 44 bits
> are RES0.  Because this is defined as ARM_CP_STATE_BOTH, we are
> asserting that the cpreg field is 64-bits.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1400
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> During my perigrinations of reorganizing cpregs, I've been thinking
> of ways to detect these sorts of errors -- preferably at build time,
> but failing that at startup.  I think all raw usage of offsetof has
> got to be replaced with something like
>
> #define cpreg_fieldoffset(field) \
>     .fieldoffset = offsetof(CPUARMState, field), \
>     .fieldsize = sizeof(((CPUARMState *)0)->field),

The other cpreg sanity check I've vaguely wondered about in
the past is whether we can somehow check that all the fields
that we expose to the guest as a register are migrated. This
definitely isn't true currently because for a 32-bit CPU with
TrustZone we messed up migration of the Secure banked state.
Incorrect use of alias flags could also result in that kind
of bug. I guess we'd need to have some way to tell the check
about fields that really are manually migrated, though.

Anyway, for this patch, applied to target-arm.next.

thanks
-- PMM
