Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp623284ejb;
        Sun, 21 May 2023 04:25:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4WgudqycBaoNtEBXlix0QWWu+PZ7mwue44VXS0nRx5dnSxFh4cYOxSCGThVn5mkshH7Luw
X-Received: by 2002:ac8:5710:0:b0:3f4:e07e:21b0 with SMTP id 16-20020ac85710000000b003f4e07e21b0mr12695700qtw.6.1684668324686;
        Sun, 21 May 2023 04:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684668324; cv=none;
        d=google.com; s=arc-20160816;
        b=avBk6K38PueG+uDLxt2BCPVvQ8/iDjDHkFXx0Ou6kEPt6hASQ5o9BLd8kL6XuelFZ2
         8Pme0Rr0OKbHrbL8agKdkgRJwowvOdUbO/D7sGPJlSPYETMl1FEOvOP8dDNnrpQIbchu
         z86EMMLGj/5jr33W8bq32ofWq4pGd4oZukq3FtYMgEZyuMgnAPTPLprprWE1OwHt0cbe
         VCVMP/GTysb03iDwDao4LBtVWsnu+3c51Kpl/Cl6iaNDhplk/l0XUdvBvrXCt6FvWBC6
         5GvM8EYHdFBrfAftAQpm78xV3zTlTJPDr9lXBbgJcTMHmnFZz8FISYgd7Kd1g56jMNvH
         M7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cGOd7de+C6KqqBn+qFOsd6c4POAn9QXbdMPkg1b2pZg=;
        b=vUaTXBd/g/xhYZ0O7opGD7uHXuhs7aT8XiY3bDjk+cWrcyxy08mcq5nj2Wke4sEJr5
         +csmKNuWUmjf3H4g2baPgkjCExfcIX01TjJVzjggi07Nhz3ZzmD18IfgqWrjh6Rano9A
         6bDh91Q0/l+K6oElifJ4oc6/FeBvkII+M0XrpOEpmfU+NMhfMBBhbKWTawRVgaiqiV+P
         LcYdJQHFXimoKHcWg3hunZ347iYZRXfycJz2NA1ypaThjfhOLqd02qi6YABvmx2xLztP
         mYXoG+gWO6e04TiMnTUO44mOpRROJ1vQU+U6Nm7f0PiAcsBMgfB+IGGNd4vl32XIAc3J
         ra9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2QeOwIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 24-20020a05620a079800b0075b083265bdsi441248qka.76.2023.05.21.04.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 04:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2QeOwIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0hBd-000852-PO; Sun, 21 May 2023 07:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0hBY-00084F-A2
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:25:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0hBV-0006uE-Sr
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:25:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30a8c4afa46so235148f8f.1
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 04:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684668307; x=1687260307;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cGOd7de+C6KqqBn+qFOsd6c4POAn9QXbdMPkg1b2pZg=;
 b=i2QeOwIJnFvbo2ZCf9EXW4pHu0V74ceF+gVPWuwtJYwkzMO4ODb7YXoRx0L9PabbZQ
 8WjhU/IJRV4upqD7asA9Pff7ltZ5nq026eqb5iKe1FIajSBXVTtmvZ5++H9BpCf5KJKw
 RFPgumvw6dHBmKQg/lBUZJ6XVc/GMGanRtSh7aAEbRUHX1uOzTsmMlzvdCB4nQ5IjcLR
 nf3iYG14czrvJIMnpWTAnatR7F0tn2+o8kOY9SsRtw3ENjpN+Q+hOZdT+0h/7dOYkWHA
 wKuCSZUH72oJi/M5zuk81Y3UgbGm5J6nNP5mutaduVufIxkv0ztb60SlxkmWu3RC5Gxp
 H2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684668307; x=1687260307;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cGOd7de+C6KqqBn+qFOsd6c4POAn9QXbdMPkg1b2pZg=;
 b=GQ6tBH3eRgPFi+Sfbh6GGn0rXOOnh3ioQcYv1RBCKNHKWITthwQNrwraFh/8QWSKiQ
 nZrX7tnMXGvg/hA6fuVbFPybsTCeLgze4OLtarFpRxXoN4O5iE5aQH6YP9+mK0mEpkmQ
 t5l6YGhVVhCb2AEJ2ZnQigV4FuTHad5/tY+kBca0+UAOJ4p9ARwwnX2IjiF5fdPxmDLH
 U2S/pbFGAlDs2fJ7CYRyULYk3Z/QlRj6LN8ZYzsSC1fHdC+4unBNYxeGshYrsrs4GlRh
 WmquUC++NnGRhXDiuxgA8I181wc4mkaNJrx8novsQTVBjEI+uU4wN8QnqZs/AiQaCld7
 4Asg==
X-Gm-Message-State: AC+VfDzRSsMxlcOvQmX8WWUxcmh5bWo/2eY9OIYY4RPQ+fqqN2mHClo1
 Zl9+zX+3KcC2lA7wAr403+sZ6w==
X-Received: by 2002:adf:f6ce:0:b0:2f6:661:c03c with SMTP id
 y14-20020adff6ce000000b002f60661c03cmr5493984wrp.28.1684668306900; 
 Sun, 21 May 2023 04:25:06 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.177])
 by smtp.gmail.com with ESMTPSA id
 y11-20020adfd08b000000b002fae7408544sm2243082wrh.108.2023.05.21.04.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 04:25:06 -0700 (PDT)
Message-ID: <33eb8ef5-d08b-4f8d-5d09-af250e0b07d4@linaro.org>
Date: Sun, 21 May 2023 13:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 24/27] tcg: Split out tcg/debug-assert.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230520162634.3991009-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: s4rq930xGME0

On 20/5/23 18:26, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/debug-assert.h | 17 +++++++++++++++++
>   include/tcg/tcg.h          |  9 +--------
>   2 files changed, 18 insertions(+), 8 deletions(-)
>   create mode 100644 include/tcg/debug-assert.h

While here:

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ F: include/exec/target_long.h
  F: include/exec/helper*.h
  F: include/sysemu/cpus.h
  F: include/sysemu/tcg.h
+F: include/tcg/
  F: include/hw/core/tcg-cpu-ops.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

