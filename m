Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp25691qvk;
        Tue, 17 Nov 2020 11:50:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRYSemyQ2fAFZN0xZtIZ9yA/gLwcbliVgqO0Rh5ADiRAJuI9XkPIFxcsGyTG6m6k8hQ0h9
X-Received: by 2002:a25:45:: with SMTP id 66mr2272656yba.81.1605642607177;
        Tue, 17 Nov 2020 11:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605642607; cv=none;
        d=google.com; s=arc-20160816;
        b=OBrEB/2kNDMXczqlSrM9ZZOMi5wxcvDX+2svPFlRLzmgN9l3yIzq/EqzBqFwK6BVf7
         1UK3v7o5wtzFSfCRr4rNi2AHp9eS4rL08pDZ9FZxPcI3mYpfHpJuOnMEVwlWoweo3mBX
         3U7PpYzHJuwSB0EXmZA9cpNoReVXVIg4fT7auLFcW4pv8N6BoXf91nkLyLw2Vw1dICJC
         c/Wv284D71aJ0RzU5wBXv/+PTsQduoxTa8mA/j4C429tQam/sQ7N1HJfnfT4/3JxLcwm
         mosubiLMPjYEIODWX5cZFTHeYmtzWECG2nkDxx7dT9qMG1S+pnA+VMMYfiKZT+RUsieo
         2YnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6ctsSCZMjCrByMSuJXot4T8FKJH0MWJYSoG5YbEthMA=;
        b=SMRYpUmGKE3c3ZndeTj2vWGBNb5zhQfCGKHQ/cTVHkJrjOlOtMrNX5ytYyYtWtmWCH
         WcMgoRbRKsRN8+oIKzIKmqphItZNZiu1FH/2z9rxE6DxJN+VNsTMI4YjlQkG9HaGGPLo
         n22b3DAcNyflt92wh4p9PCIV+j44xc47m/UlGkRRMa4R/HaGbgaNXXE+g0xZ164hxnDl
         xYeg1Ye8FjuzumPfJOyV+EaJH5HxNKVmIB6hYuKxkFNqrbReSfFqi1y1Hm0knTZzyZQP
         BPzRYfXgAABrEPEMBnwshWohaR1OWFOpHUMhYSASkk9yqXvT2xS3e1yLELvfsSYtryJb
         DeVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rL3AArEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si19382884ybk.123.2020.11.17.11.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 11:50:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rL3AArEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf6zO-0004qZ-LY
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 14:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6yj-0003rY-5r
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:49:25 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6yh-0003L3-EE
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:49:24 -0500
Received: by mail-pg1-x541.google.com with SMTP id q34so532136pgb.11
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 11:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6ctsSCZMjCrByMSuJXot4T8FKJH0MWJYSoG5YbEthMA=;
 b=rL3AArEm+qHPPgYMmjWki6CKXvKpms2BomJh7L3eeHrDwo3R4VEj8QrtMq73e7tAQe
 ETd4C51VKcH703dhzN4Xv+Yvo+Fj0ob5OhBPDxAU7UOE4WEeBB3Sw5WngRZSTkmkfOmv
 Ie1861K6+Jnx8OxT7TgjaLV6+slbRHVT4sOJaPx8DvnCcm/7AlXMaQg966Z301JIecZI
 O/gPEba6NP/vGsUMtIYEY51/vd8LsmvF8RUhN4yQ7IG4b8c7zJoH6TWT5/FWuu17mtW2
 gzq0Wsl8C95i69mPncPL+BjifC5kecO/PzXbkcuPDIPli3XY1KGtwiCCJRiN7NXWZr10
 FQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ctsSCZMjCrByMSuJXot4T8FKJH0MWJYSoG5YbEthMA=;
 b=XsqBJze10bl4K3nkn1JXJvJN4/X7ncS8CU6bhN6a1tVy9Jxf0duq4Fpiw1fJQb8aw3
 q6sJ8nfYmSqIH371Nr0w53FwWGCXcjUZuMTYwRapF/CK+lVW/QiAZwFi8CpE94rw0Oxw
 X2BOVYKy5P+xfMhH+vLw5WeQGtUxaYYjn6+q/SkE6mV1UX2hLYdpS9fUja3CDZ55eqcv
 lss56rCFYZvGoVzrA37XeAzFsQ40nlz8v0ysq73kAm5LAkRfYRmcRQ3ZcwybbgaM9jAl
 1mcq9slJSvEYdjtH/3LGwrXqN2sKH2m8tPnvM+9oFKD3HEJR113g+oLkaOUZAvTim65w
 FwcQ==
X-Gm-Message-State: AOAM530E9WPGHgTrWLoyRLyDnpC2DB8aGWaphRaPlCV1oKv8BHvSdMz/
 hFpvYtqBd/JEsutgmi2cARZ53g==
X-Received: by 2002:a63:5262:: with SMTP id s34mr4895123pgl.382.1605642562067; 
 Tue, 17 Nov 2020 11:49:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i16sm21969207pfr.183.2020.11.17.11.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:49:21 -0800 (PST)
Subject: Re: [PATCH 11/15] target/arm: Use new FPCR_NZCV_MASK constant
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8e915de-5f72-ff58-f9a6-d7bcba9ede18@linaro.org>
Date: Tue, 17 Nov 2020 11:49:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: 5xm1SCP8TeJW

On 11/16/20 8:08 AM, Peter Maydell wrote:
> We defined a constant name for the mask of NZCV bits in the FPCR/FPSCR
> in the previous commit; use it in a couple of places in existing code,
> where we're masking out everything except NZCV for the "load to Rt=15
> sets CPSR.NZCV" special case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

