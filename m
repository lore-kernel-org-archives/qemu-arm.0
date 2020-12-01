Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp125252lfb;
        Tue, 1 Dec 2020 04:54:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0bD9OvLWqRbnT9eBJmNehU58UTl84oqP+9QHP1jULxa771bNfHHTdDNs0AWkM4veVmSp9
X-Received: by 2002:a25:2c3:: with SMTP id 186mr2968976ybc.205.1606827298306;
        Tue, 01 Dec 2020 04:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606827298; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4oipkaDlpJiTpNFj83FJqs3Hm1iN6uKUpX//kvzs4Chf9FjPNMxUa0YmHZHB0E/cS
         5hvCeQDgyRLgCnoz+ZRnPRc1gQmz/LbIgQmob/VtxKnARh6USyVbAQgJ1qC3ZESMN1Rl
         RL9yUSg8idTP9KcTm6sy2CSgZpfpOeBhFDUVRBbRmwMQVmz1wrtN7utZ+jbcDMw3IUdb
         /w7X+3CjB38SYqYA0/T1FLIykzk09GXqINvCuG9EaoCptgC1FeXuqWuPiSsZCTwciMC2
         mo95sySZLmvYfpMzIAP36o0TTfYcEk64lGNlqEMhqqvnAVxgwk4R/VnkdaEwdLQw0Vjj
         L8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=c4qf6YNx3B4ijfivXjBLm+FC+az4f4LFiSJQvsvUe/M=;
        b=fW7JL9fHzQcUcBo+iXBtLmdOqC8Fmi0GK+Wzo3COUL03If60IldpjO3f/zF28RDp9a
         /SwYeZUd6bOTbl64y4HQ01QxJpYYwZG55Ci5K4RfesahY5WCUqwZUW91D0KhmbePaR54
         yGKCpuH/kXxF7gJ8izUiGIseJFhaIJLaS23/MDLSk1BizPC3rENLdSVyuU4xu6WUCqEQ
         uNNu3K/lhPqfQCsvi2tMce84y1r5e9bnhtP2fh+TFN+fpHIEp1Z34A2kEHnDnvnGSgyy
         srJe6uGRjKO4bSYoZPeJcgI/rU/OsU76Z8QT5ubQ98Z4hxPHIOhw65O7JRJtrtHBNjJ2
         9GgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtCzWQXk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si1850042ybk.307.2020.12.01.04.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 04:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtCzWQXk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk5BJ-0003JE-Ne
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 07:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5BB-0003Iu-Uw
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 07:54:49 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5BA-0002HW-87
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 07:54:49 -0500
Received: by mail-oi1-x244.google.com with SMTP id t9so487982oic.2
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=c4qf6YNx3B4ijfivXjBLm+FC+az4f4LFiSJQvsvUe/M=;
 b=ZtCzWQXk420nqr4C04IXPCgMCYve3te9CnIIHHwt45qaXedygj6WopB9oLYZ6OPHYM
 rQX8xdDJHqL8GvaDiUM3yjrpxCciFpraitKWlZRwnGV/Ri3Hg2YbHUt8NFsDSxEgiXvK
 uWjrDYq8drtSq8LM7K9tA14p+rR3YO/SvGaGfCnYjep9wVooPezIa4DkjRuOjRL3HF49
 hYGDysIqHOvcVUDN61qOb60lWZPJVxruinidLsKBBGqN81EMZ1kdSeJSIPNN+cN+CXnR
 QsbrgUbfEOMt07fezsqSD6M12GzC0lDQadVIZ99FE6AaprtI/6Bs/pLtsXk8rbNGCsx3
 rq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c4qf6YNx3B4ijfivXjBLm+FC+az4f4LFiSJQvsvUe/M=;
 b=NH/9wAW0gWAa+6Dcu38kI2E2FWgbCkGuu54WAf/ZwVMBI6LmSjAx32TTwpQiQS2ll5
 M32jv7mYDAjB/evearM7m17lWIHWehZ0utyiZPCN17NsQc303LMZfG3P4UpMsXriSPJ1
 MFsL42930MRw6VO5AAwWk8oRoucEyfOm3CLqaTXPE4gWlktJAZ4UCIalFPsmcEIJja2s
 LV4yDcHAEUgssfIKctIV4XfgN+cu/Q7+/E+v7zdu2IPhTl/s6tZLtSmG8KNjcj2QsIDU
 fui6WYJCMPo4ekcFbDr248ME9WjmbUEtmkNaFg+6BUiuowOivTEt2plVsP+03g/rFwU7
 Yo5g==
X-Gm-Message-State: AOAM531KcnyWQEXzqgPaI0LiZ2+VaW/hkhNHU1MV60ohJHRMzWpnKu7g
 z3TJvqimJdrqmQY77PwQc14vSQ==
X-Received: by 2002:aca:b60a:: with SMTP id g10mr1565943oif.26.1606827286857; 
 Tue, 01 Dec 2020 04:54:46 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 186sm367594oof.16.2020.12.01.04.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 04:54:45 -0800 (PST)
Subject: Re: [PATCH v2 07/28] target/arm: Refactor M-profile VMSR/VMRS handling
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ffa10643-4d96-f2fc-8c0b-6bbdd55aeecb@linaro.org>
Date: Tue, 1 Dec 2020 06:54:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: Ds02JyS1QcyX

On 11/19/20 3:55 PM, Peter Maydell wrote:
> +/*
> + * Emit code to store the sysreg to its final destination; frees the
> + * TCG temp 'value' it is passed.
> + */
> +typedef void fp_sysreg_storefn(DisasContext *s, void *opaque, TCGv_i32 value);
> +/*
> + * Emit code to load the value to be copied to the sysreg; returns
> + * a new TCG temporary
> + */
> +typedef TCGv_i32 fp_sysreg_loadfn(DisasContext *s, void *opaque);
> +
> +/* Common decode/access checks for fp sysreg read/write */
> +typedef enum fp_sysreg_check_result {
> +    fp_sysreg_check_failed, /* caller should return false */
> +    fp_sysreg_check_done, /* caller should return true */
> +    fp_sysreg_check_continue, /* caller should continue generating code */
> +} fp_sysreg_check_result;

CamelCase?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
