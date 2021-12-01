Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6004221lfk;
        Wed, 1 Dec 2021 05:06:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3n7fP3cUC4Nnr8DmnZOtMFDhQWyRIp9MVdQqWYKOb03a+LBw8zz3E9X/gOiEMHYhybz0F
X-Received: by 2002:a05:620a:4103:: with SMTP id j3mr5936292qko.737.1638363986961;
        Wed, 01 Dec 2021 05:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638363986; cv=none;
        d=google.com; s=arc-20160816;
        b=UoBWJJ9bHxJp7pvztdTgNSiJICwN0mxC5RGk+8vwpXxxRplcvWurchcq7ddTj1IshO
         ZbSWyV5BDOyGHJmLSqwF2cbMd9+Urnd9RktsyKoMWVOYHK85eDZ2O5zhNvVbtHh73VEk
         I9j5eQJZ7QbDgOraYdzEVc7fbyxvoUYmoJvmXXq2XYUt7p3wTVT6GclupDcahyLX77FH
         FlLSRLTmqn+JN70P4EZcHjW3G22yE5kkDPz9EdSTnej6U7WYbyajYr+T8jMo8IRzqPSq
         09H8cQ88hROAdF5Csjyq2B3IIXCM3E0NeqyyKSJ4O4x5nFhpWfQ3ZaCFydub1cuVWNAf
         s1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=oRyV/aS2bzgNlOIF5jVjVHvTzuy/PEW1Qo0P+6yL/M0=;
        b=OROfMs09O8mwA7d+5R9am8xJHnRmAD3PIYrNpSISJdKLhQjrplYemHVWvHh+r3pjQB
         m/Hu/TDXceF5lJNxQgugcVzOjzZ5uK2nkY1859qrjPeX6mp0uFodFQxC/68vaN1m0L5s
         Sw6WKnlAs9xIlLUEnFrjV7QDdNQizZpws9pzlsuPleALFrksxnfW64l8DxlptTCpU8zL
         wAEzrCq6BCJ3qAKoV3efIl7GvMTKf5cwHTeT2lm3GjwgDpSbgDGHHKzBo3OHCVtFzhwJ
         VPmLP4wL5dntS/ZrgoozuzmRWgSjsgMDPVHA1Px58NVWbdeiFVdppzXQt3B126JNDDEi
         kuTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=mj1YGcdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si2766585qtu.398.2021.12.01.05.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Dec 2021 05:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=mj1YGcdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1msPJa-0000vH-8w
	for alex.bennee@linaro.org; Wed, 01 Dec 2021 08:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPJ4-0000tX-OX; Wed, 01 Dec 2021 08:05:54 -0500
Received: from [2a00:1450:4864:20::435] (port=47039
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPIy-00052Z-Sq; Wed, 01 Dec 2021 08:05:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id u1so52082776wru.13;
 Wed, 01 Dec 2021 05:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oRyV/aS2bzgNlOIF5jVjVHvTzuy/PEW1Qo0P+6yL/M0=;
 b=mj1YGcdRhMdodCtD82uwGuXN+g3kcL+W7+flzxT9Ib0gtumiXHMiybshilkoOWZgj/
 W/NQGNLMXKLYwzWcfUM3RKxvLyPXomHNT2PiwdFzbmJ7NYz7omzj2lVytoc2PMbRdOaA
 vxgLzpepJWFdgm8XmnljjJm6SO3bL2D7cnb5bLoSUN9BhH46EwQd2wisQ6YNopo5lxCP
 ZAxnIvjkN0t41UCl2h0abVHwUSpRNGnHZBBQg/rLpfhqBh0TCNAkIhU4rSKWVDC1MNRz
 PQm/w60fCLwRY7GQqEcpAcvxn2f5lGrAKWOhD6FjGaChO0cK23n0TfMlkciQnLqCANs4
 B5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oRyV/aS2bzgNlOIF5jVjVHvTzuy/PEW1Qo0P+6yL/M0=;
 b=oLrKimFCaFYzZRBUfbxamr9s2A6Bgj+tUSRqSKv+9T9qh1Z3cYaNbSTO+esEZBirPH
 uCwZIbUgYOfKHbFzu53bgB2Q/DFrLnGcnWmj9x85/2y763+oUaokctxK0GnID5biHKJR
 EfRqQ0Y/s69YcA6YK30/xnLzVHcm9LgTG3hqd8Jc9o0WM85MF3pLXZozLM+PQkirVsg0
 x//9po1vUF02YdGqLEKb4cDq3fVp/fU4BeVXTd43jHOOx7x1ZNGKzMA7d2z4Da5F5ApH
 1BQUkxXF66QSjDWRwSGVulm11svO7UMKCZoe27AY1jLI67BdFL/GVWxAsZtsR00SnJlr
 gzIA==
X-Gm-Message-State: AOAM533oXpO/ZcaSgik9JqjiD502LEAypsbymgW7dQxWDYiSQDkSa4R4
 I0dfYU3kcwr73Dkz0fn2FeE=
X-Received: by 2002:adf:9e01:: with SMTP id u1mr6544787wre.561.1638363946716; 
 Wed, 01 Dec 2021 05:05:46 -0800 (PST)
Received: from [192.168.1.12] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id z6sm1389080wmp.9.2021.12.01.05.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 05:05:45 -0800 (PST)
Message-ID: <e5fb6785-0210-5056-014d-c1e062fc806c@amsat.org>
Date: Wed, 1 Dec 2021 14:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0 0/4] qemu-common.h include cleanup
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Sergio Lopez <slp@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LyuiwF4VZkNG

On 11/29/21 21:05, Peter Maydell wrote:

> Peter Maydell (4):
>   include/hw/i386: Don't include qemu-common.h in .h files
>   target/hexagon/cpu.h: don't include qemu-common.h
>   target/rx/cpu.h: Don't include qemu-common.h
>   hw/arm: Don't include qemu-common.h unnecessarily

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
