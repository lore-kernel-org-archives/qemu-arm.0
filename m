Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp510167lff;
        Fri, 30 Jul 2021 12:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5aPFCCt53rL6/7jooTNeG8JaGkuXd93Lk9Gj1zpTCgCIZshWL4GfaKmX9WcDYzwE0N/78
X-Received: by 2002:a05:6402:424e:: with SMTP id g14mr4985014edb.364.1627673346453;
        Fri, 30 Jul 2021 12:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627673346; cv=none;
        d=google.com; s=arc-20160816;
        b=xAvxb0igifPKyKaeQK/F2MsY8IxYNZ4xeKih8bu2m9uT7ieeamIYIRsS2pDZ6DQzFj
         KsT8iphXqXAQc3G7NAT9aIRzv00+nxZc58bezuNUi9XLMYL50PkGzS8j4kLnxYtDR1wC
         aopQbbz6lY+Jucob76A4+4kiNj9bWgqmasN9A+0IPz+vyuCsPm44otO/0FTsxet69gTC
         tOPUqRsTWQ4Y7bbCkLynOAWqdhozJ7bnPIwgw+PpnqiBqIj6T5hgNs0ux2G1lIpddQtw
         eNRuYQooxMIGN5OvsyJRqOaf7oBsxfTCp9nJQ8J4XuYfq3ELfF5mr4N3QY1nF7vZc6o3
         6gcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=15ZmjW3RIu0cYHVoR2rnYY8mTpc4w9b3YJm5u5HP3gI=;
        b=B9gi10S/A7mow6Giq0ZzD4y9gzO0KlwOeDTF6dF2QoV6s2yrBhjHJVb/cMJGGh1VTp
         R11qY+ANBg2C6dV615AiciH/DDNUFtVCZvLdu/VnM+tl8elC1LkXVtr6NPTZ3cM7aOWu
         fYrxwwjfASVWIE34mtRbshWSvLvM0M4D1psiGOqyFndDUFfthbgEtK3z1Hcgkr8CcwGB
         J3ULLqp3XSOrPQdXR9xfcdYLvYjrG2kxvM7Gq6SZXNi2xSgoyjwpu/uosOipWhbLfoeu
         OSoW/RjTWO1vHRoXhgRB6zbGfqedIKtGA7oIH+V02bm4FZcGLmG4TeZH5l5Is9oeYxaZ
         0Otw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBSpuccP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si2619663edt.533.2021.07.30.12.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBSpuccP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YBt-00051u-Iv
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YBk-00051l-4z
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:28:56 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YBi-0000iu-F4
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:28:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso15791310pjf.4
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=15ZmjW3RIu0cYHVoR2rnYY8mTpc4w9b3YJm5u5HP3gI=;
 b=rBSpuccPe629rICfm+GrPMYZG9mTwIikeRW5mg4dS7ZxBYwnJmYAlf+SA2G5o+X2nL
 rnVk5ev3YZllfNxzRLJ9qXEfFr1ksbu6N2z1Fzk6XaQSVwarm9WfGXPvVCEN7fclqLAu
 kVxoz+kB19I/wBKFvm2/yrZHYHUcoxRtX6QvAUJxhJSmVkQInzycxlFE0H0i5BmKc6hd
 OC1Jd6Lk4w0UxEjOZotJzCMNUxiE/Qk7vUiF63Ty7MLkfkXKDN07pRSojAlfWK4WnrU7
 DRw7hUyc8NpVFX98RfanpxmmA7ccF/Y15MUgVC1jlSdQ17gVTtgnqj+UxUhta5lVbNsQ
 fXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15ZmjW3RIu0cYHVoR2rnYY8mTpc4w9b3YJm5u5HP3gI=;
 b=Ed/GT5xZZ/jqVJXpDdYZi+vjU2NmpzO0tCVGfPDKFUjhsa05vojmqtYMozTJ8zOVhP
 iojVih6vuWHHAFt5HAloUTQ2rihXDC3AV5ryKIAvEjRnDLooYazyCJuL33LfSpyxPA0+
 oSktjahCBKIF8kPWW8h4Vf6JNlSkaX0yy0owv38FjJVvcO4EITQG3g17Xcf4/GLjQPJT
 /6xTEbkuDi3UWoNy2CtlCXTr3u+OapevAmjVg1B1tyfQ3uZMGzHftdok4GG4v/MgFYVZ
 DiU7iFuJ+E2A4ukzPXC3CDRhgHRoNfz76aATwuiOenfimLU2XQOTGYkxadbENdufFt9E
 UgiQ==
X-Gm-Message-State: AOAM532fKbo27qQ5XO2N3g3mxVbEbp0unxKXSkuVrhuGjcdlCX7LAoap
 v9luYyHxQ5hws6hE6yTVHPG2RSM8O4lbMw==
X-Received: by 2002:a17:90a:19db:: with SMTP id
 27mr4780854pjj.216.1627673333257; 
 Fri, 30 Jul 2021 12:28:53 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id j5sm144393pjv.56.2021.07.30.12.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:28:52 -0700 (PDT)
Subject: Re: [PATCH for-6.2 37/53] target/arm: Implement MVE VSUB, VMUL, VABD, 
 VMAXNM, VMINNM
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b9e96ae0-5791-686f-687b-390470e72b46@linaro.org>
Date: Fri, 30 Jul 2021 09:28:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eRPU9DN8S++J

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement more simple 2-operand floating point MVE insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 15 +++++++++++++++
>   target/arm/mve.decode      |  6 ++++++
>   target/arm/mve_helper.c    | 24 ++++++++++++++++++++++++
>   target/arm/translate-mve.c |  5 +++++
>   4 files changed, 50 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
