Received: by 2002:a05:6214:c86:0:0:0:0 with SMTP id r6csp1090114qvr;
        Wed, 16 Jun 2021 10:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG7Gj7tXM4IvITnKiLDyqhsV95n0xz53p4oLPIHDekMpDFV/V0FC/PWxxpjn7svY/i/Y61
X-Received: by 2002:a05:600c:3650:: with SMTP id y16mr36237wmq.92.1623862911257;
        Wed, 16 Jun 2021 10:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623862911; cv=none;
        d=google.com; s=arc-20160816;
        b=kRNajhJzkpE1vf/FSrkHtpHAOFSg9VhpZFaTzpzaa2SfVyxHEsB8E3hrdxnK7KBxiV
         MvZjx+VjbQDwwU2Pv+EIh6Ol3E1hz/oUdEscnW9VL+UJE3q+h271NHMGs46XaeB2WgfF
         tKto+Zkx5L04ZbsVWukHuhshlo03XwneagcrD6ycGOlsjt9Dj0zuN21u4WVB15pSu0S7
         yVbzP4sJuREnZqUto0+0aJRygxZyJQXJ5hn/2QRrKMSXyP+FC3nYjtlFGzswQ+KuzeE5
         TEWmGir4Kmixag45i/Ws8Qg+k7ZQrIIMfezBPmt/dpOv/dm15AQ8ZhbVXflVf8HM9PIl
         b1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PGlqkgunv5kX7fJckX/oaCuTrH9ziQO8Lap4YrFMhA8=;
        b=uysEyZD/eGbQXcLSpfBWs+imKDlWMy1wUAdvcLG7T9umirEQEQ0qk2AFCDUp6KEi1s
         uhNF3WWKIPTETOIXYJDxy8QVghDgFxI8WPBzZIkA1f12EMvY8cT39+F6yH8rpsH4FeLd
         JuhvRl/FJfnVqBTglPxsGA6MKFcXFV45NXLSilBv3USXsbQAlrnKRuZSbcpVVs6Swdxm
         nu9tvRibbflG49LTjCutS/1qE8Wygzl6dD4B/Wga4+MgE7od7dl6vsKA2U3XleC/9e+3
         3VfJDpZ4hHZr246oAWr7z2qKQslp/d8CBt5HSFSxAUL3FmpvRPiXuhboKVDZjAjfkEwC
         cyrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QpjGpf6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si2764252wmj.219.2021.06.16.10.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 10:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QpjGpf6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYvG-00048N-7R
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 13:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYuL-00044z-7J; Wed, 16 Jun 2021 13:00:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYuJ-0002E4-MC; Wed, 16 Jun 2021 13:00:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so4564915wms.5; 
 Wed, 16 Jun 2021 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PGlqkgunv5kX7fJckX/oaCuTrH9ziQO8Lap4YrFMhA8=;
 b=QpjGpf6pwUCv2RCUAcVQlcGx2+MKWVVISC6PnNj+jERJj9IdHwS5aRPTOKbnkE1fmb
 356JElPvI1m3b+qTlf4Oyea/tINGt6pY/mCEczX9s5G+9wYdSScj/8eeG0MfSS0M7fCH
 oSR/0mXBEh3OkJ7ybFNR+veyfAt7KFwTaGi3y2rGixX0e8oovEpt39G6WupAZHJ2qJcM
 1IeEHGpNY6GMILa6C2w0njJ3SRyhuFKdWBgxFdyD2CYLcEXBojhqMPIkoMfRraIovKqh
 EM/P45ppR6Bi60zpmty0m6xcIcB6ojX+jdZ69CdaIfbzj8dO14vy7M/ljwdHl3R47ktP
 RVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PGlqkgunv5kX7fJckX/oaCuTrH9ziQO8Lap4YrFMhA8=;
 b=nETJBkD3p0UZSwqo6vL9sc9D7qpEAR5J1HUU6TNu3MvG1+KUPmIqoiUGx9NOn8etpD
 /DZOa4D4PNlUdAjsK22IvU55CShvQgsat2UBJ8BShr9eJMr0sA5djyekuinA6GciYKed
 Dllhm/DpgumP8XQpkwfM285amJS55OPksIur8G27uI5j049m/NWo0QJuwcvg9jFCe4Ya
 rNzHODvLoAD5XMJpH/z5xD/8enT5WGfzmKm2fkw1dzkz+bxmQtMhCvMfi9nvwSDFpzMz
 FpDC3PWVV9uDAvk35ABBe+0rAcGNcn3q0oJczBxTDnRZVMQj8UkOyGgBzWBWkgTJePws
 dLwg==
X-Gm-Message-State: AOAM533ray2yTSlIa68JUeO5F1aizcEjBXUmUyJnOrLYz6yzbmI8aJpg
 3Ia8HikUxd0nPnTjXbdqB4I=
X-Received: by 2002:a05:600c:3555:: with SMTP id i21mr2119wmq.51.1623862848465; 
 Wed, 16 Jun 2021 10:00:48 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o7sm2756446wro.76.2021.06.16.10.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 10:00:47 -0700 (PDT)
Subject: Re: [PATCH 02/21] linux-user/aarch64: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9646f5e-4aa6-c875-6632-fd699aaa5d30@amsat.org>
Date: Wed, 16 Jun 2021 19:00:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0XzlZVYNjGi0

On 6/16/21 3:11 AM, Richard Henderson wrote:
> Create and record the rt signal trampoline.
> Use it when the guest does not use SA_RESTORER.
> 
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h |  2 ++
>  linux-user/aarch64/signal.c        | 28 ++++++++++++++++++----------
>  2 files changed, 20 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
