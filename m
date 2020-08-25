Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp67392lfc;
        Tue, 25 Aug 2020 11:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcqNc94TwfscuXwE7ytvY0qsyd2Nyvx4qb9cmg/e7IxBOv0INtQaZvhXJ98uTgcNpxsRah
X-Received: by 2002:a25:4288:: with SMTP id p130mr15367378yba.288.1598378696523;
        Tue, 25 Aug 2020 11:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598378696; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNBqS997LIv/Qo0XqL5DFwUVmpi4i0B2DrgiM2IDgcAJzymYIM4dgy4rmHQNJz2rtQ
         lT5460XTfISCki20ODttrn2BJ4j/7VdgE43HcZ4ZxylK+Z5lq43U4H/q1GCqnACKjmcq
         FZHKcelueDO+nyUkOdO3OkGh0U6Gri9ZzBC5gU87+DzDasSTkfzIWItlY0I0ZfTVFa6t
         pbCvQpAQQnvQ1RklCMgqsQqIGOQ8JFnXjoRRpKbfGjBvn+2eFkES6lGUwGfuJLF4Nd3N
         n0AxSxSBCFhEC3q7fSZxHwa41aZZ5LwdrNRQZIJZmO8D93NyOxqEbD5gh/Ng/DbVU9E2
         9PFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yU5E4M+tA8tTOIPkvrFpnPiIdUTYXojJGIEhZtlETKU=;
        b=ZWCUFdFfR/563CFPIY3TTZxAANngYGBgWTMAghATLmgxHZsgVoRrzQVyZfKuu7RqTN
         TkCjdxIiCyCAjWxfuYfkiiCpSn1aG5yEGko9OfqKzRSruNcgYARYfEdchKQ9n/SHTOvN
         RByDt9haasGa8Tr0yTwIdKbDZzCpIcnfaY42lYNCnQNScpcVroanR60UmikhhdMgUNSP
         10CumTTE+neQcg8o7mE/0WzadZo0HGpnszuZ3vN28hj7hlmycih8sNhxMV24938nQ9UH
         VhmFB8sy0JBDXi6wXUzKHYierAi8F+JkljavlOtXQSF4vVPbjymHMirqIBE7xEelaps7
         8aPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9kxAt8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si15212873ybn.356.2020.08.25.11.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9kxAt8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdJX-0006rb-SS
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdJG-0006pM-Sj
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:04:38 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdJE-0004Mi-DV
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:04:38 -0400
Received: by mail-pj1-x1041.google.com with SMTP id mw10so1633078pjb.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yU5E4M+tA8tTOIPkvrFpnPiIdUTYXojJGIEhZtlETKU=;
 b=x9kxAt8FuMMvI/qQ6XQaHD8KCWH3F0UVg5l0ZhMkWTbVr0TwkeGwYqjrTyGZSsDNzc
 /1PEeos5TGmWMjyuQFPsfAvqBy4ig3cJDuTvFCeXwt/DML6aOV0kaX+fIsbm44A6H2wM
 0TZq55Xp3ReENNlEpI3NVl/VXzI3cMYY9ElqbGroYGW9zx6+zl/zb4Bnci3FWUnD67Fv
 +8e5L0VsLrtjqb69teD6vVK/K3PPR67frWkTRDJtTZtEbm/fldOt4R16ZBxzeuLPvLPZ
 TFT9Cgl7xKV13aINE67uXuQlZMp9vLgvOCuXwm1GewOKJ8ekhhBi+d7TuRE0W+qcifQj
 7aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yU5E4M+tA8tTOIPkvrFpnPiIdUTYXojJGIEhZtlETKU=;
 b=nupHuNPNwe8QpYiRdrc2lDME+iuxBzQfQp1hBeL4vHpvzTuQ2azgAY+nu4WInn9Q8b
 vfkQlyZetnpTu6TzLjb0NpQvC3JrcTMXL0B14y/yXFs+MtfH54sbp8vj+QmhouGsBR28
 Sz+AsCO5mIMa5k7p4c3CMtAUwSFdncXr8VkaDl7rM64D0tKWe/WhvohLq2xI7kEtDcWb
 QVHTqejm5ZSYMM6DZymHvQ2o6Z1/3voFcx0nuASEqCh7CNha31vfb1SyH3Xp5IMnYzVG
 FjFivApc8llI9CczgpmTSDdC8XR1XVFhYidb6pJtqv40F1p1ljEP+VNnVVE/wm3Kcl1K
 7WyA==
X-Gm-Message-State: AOAM531GgMD+E/O0arqL+gKQKFc5+hLt4it3+DPQvPrql8T+r8HrE68+
 VbWf6cKyjRRGTp8pHv0fb7YgZA==
X-Received: by 2002:a17:90a:eb15:: with SMTP id
 j21mr2639683pjz.83.1598378674509; 
 Tue, 25 Aug 2020 11:04:34 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id q18sm15811112pfn.106.2020.08.25.11.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:04:33 -0700 (PDT)
Subject: Re: [PATCH 01/22] target/arm: Remove local definitions of float
 constants
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4773cee0-4b3a-e308-1b4e-8d9ff5a09707@linaro.org>
Date: Tue, 25 Aug 2020 11:04:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
X-TUID: GWRVigrQHvu2

On 8/24/20 7:29 AM, Peter Maydell wrote:
> In several places the target/arm code defines local float constants
> for 2, 3 and 1.5, which are also provided by include/fpu/softfloat.h.
> Remove the unnecessary local duplicate versions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper-a64.c    | 11 -----------
>  target/arm/translate-sve.c |  4 ----
>  target/arm/vfp_helper.c    |  4 ----
>  3 files changed, 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
