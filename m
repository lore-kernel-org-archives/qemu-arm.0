Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp292767lfm;
        Tue, 18 May 2021 03:54:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF57j5YZtF+6H7tdooMRlI3rjIOUjESA5dGtWSZ/81bqWiQ27okBpOeqyBewo6S9LYnvhd
X-Received: by 2002:a0c:ab88:: with SMTP id j8mr4845865qvb.23.1621335267159;
        Tue, 18 May 2021 03:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621335267; cv=none;
        d=google.com; s=arc-20160816;
        b=Ll7OL7A7fBdcR1fdv0L3EsrMXXtnqXNxtga+1bMoKgHjyjzGQih0O9BeMGPNzeccp6
         MfnU1Q85q/w4oZ5vKltCjVGSdtVcwkV5RcEE/fwo8KCFagG7RE9DNuIssvKYo5dyqwl9
         lnnP2BPm0lzes3M9bpBr1w9Z+DaqySsfLaOMB1TKQUPiFap1ce1YDKWtXKm2SlO6bexZ
         DwmwQ/CBPp4tXVPHrAtheHGFXVtGbS2e+1vvliWV07Zx4R0vsoFQRfecMh6L5w3UF1kc
         MVtASCNFdmRrVxqpLS1TYH6gRiSNHYqBryQk3TFqp41nuSZ0cumNbyPJU5l3vch+S6IR
         UXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PUb08Nbh7NGRiwKPFr9sRb2tkEp3Gl8xaSMWG9/AZlI=;
        b=EXyPZ/QM/Ew3nIKftVka0VW3xTfWO5Kzz4/NxcyY4xrdgVz3Nt1mLxexgMFBTHa/Ut
         ZLVkjl3QS6eIQQw73g5DZuRzHFghNAIxfR9PTy0yk2E17p0AtOtxX/7z2ty+J3oQb5iE
         yRuEmthGYeCw8Iv6Th8perFiuyFwKVRY02/CFuL3d9Ol+JiurgygOL7IndwMUaBRFea4
         EST1RYDSnBococrpmGgCT1QYUElC9gi7mit63WMkCAn64vrD+m4VZ8bbioj1RemdVuiq
         opBKvXCjQr9cUeus23VfhBoaQn/OyMbguWh3lNJvOTR2bCLkCuNkQTUuf1VpymLqxjlt
         eqAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TumZ5O3M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si12520224qvj.204.2021.05.18.03.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 03:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TumZ5O3M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lixMo-0006vA-GK
	for alex.bennee@linaro.org; Tue, 18 May 2021 06:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixLq-0005q1-J4
 for qemu-arm@nongnu.org; Tue, 18 May 2021 06:53:26 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixLp-0000UB-39
 for qemu-arm@nongnu.org; Tue, 18 May 2021 06:53:26 -0400
Received: by mail-ej1-x635.google.com with SMTP id s22so13645450ejv.12
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUb08Nbh7NGRiwKPFr9sRb2tkEp3Gl8xaSMWG9/AZlI=;
 b=TumZ5O3MKQ8BWUvckcNXsFeWLBGVhDR1NHFeV2SO/KuWjs6IeFHQ5npWRUBb4O8OU5
 8WZ3prxiwHZuZ4/gq/5sMnpzjBny5cs058WLJHFrlQC0V1P3gJe1Fw/20zBeg8eUF9zE
 mjJLpeNMihu9UXVTe56/jRY0DamnXpDem2LdOCS3maHa9eCwjPtDRfjQJ0AigHezVjF0
 2qhEO5NkRenTrV7Wlu1PNKpHG/uN9T6mK6a9++/fC16+ZnhfRWUg7gFl/vj2u43kfeZL
 eWdAsuKJBHF4jCE0cWZeRWo+RdYQzmxiN+KYO6aQgpfQ3enZmKt4H6AudA/NIID7XN1Z
 QAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUb08Nbh7NGRiwKPFr9sRb2tkEp3Gl8xaSMWG9/AZlI=;
 b=ox60wVZtZYFaTPwTVls+xsY+UI3OVsia2eh648f16ZcV9hmveCTYOUveAmGaj5pmEF
 tNKS5xpczIhoGvCaHh1cM7Cam/TaNUPWttmJqHUnIcvsbiE9B90fY3zE4x1ALJvQMLxj
 qN2n4Tm0KHwb4r3WiK9NJzoNPkHzvMzb2OovtOa1XzWZE57fUDuytCmgO3M5JCg5Ehlm
 hnNxYFKCCmJCqU7tc+778an3wJii8Zt/6iMGjxGYvYdynX/VsAnpdZgFlxI18bU7NEIu
 EzchkaPUic6edT0YZKPcBemooMMRNf+4xahEvXB9lA3vZP9gaysU6efC387r3pWBAwpX
 sTeA==
X-Gm-Message-State: AOAM530gZXJuYO8EP93pGjtsjEFPZSgADo9RPqwY/8RCEwSgUTNfU7k2
 ctxY6XH0QsEVDrH4p19ID3sNeH/jE5NIZOPFrdFoUA==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr5294254ejb.407.1621335203428; 
 Tue, 18 May 2021 03:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-4-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 11:53:07 +0100
Message-ID: <CAFEAcA9sdSrc3Z_229fb7R-PA71am8HZkudhB1fEtbU+JEzxCA@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] target/arm: Implement scalar float32 to bfloat16
 conversion
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMW/nOHnY4qX

On Sat, 17 Apr 2021 at 00:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the 64-bit BFCVT and the 32-bit VCVT{B,T}.BF16.F32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
