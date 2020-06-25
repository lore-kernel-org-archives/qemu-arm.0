Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1252945lfm;
        Thu, 25 Jun 2020 05:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTLdRme8X14qe4bbqNeR2mwPEwTA7D4Z8BCTLUuQTxPEFVldINhYPknqAAAWU/rmtMtYb0
X-Received: by 2002:a25:54e:: with SMTP id 75mr50750079ybf.222.1593088954197;
        Thu, 25 Jun 2020 05:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593088954; cv=none;
        d=google.com; s=arc-20160816;
        b=pAiNJN5iCjQxls2mrPQtk3D47h2I4jfO9ErhoxrN7XXVW6DkQyIUoNakx0egzjZF8j
         6qdN3CZcU3vQ0A88cjb1SA5QXwkiBtl+j8gAOWscSHr314v/I+imOpykKqZmSC6B+if/
         442q9JEMcT7um03VM3l/0o8rZSQxZ6P6JZ+nrP6t4iewQ9f0iWakG719SPsItYY58ty2
         xG2/JF+MNr7S3ewIJSMSJf8xaerUDtbNiXZhif6RUyqhYLmZNdH2CYOXYQnCIU9dSdh5
         oy2nKcyAaKzzvGs/9R151P1L9kkQjOMPvocpC7xrrF1Pv0zmPrQYJPV26D+WaEMEJY87
         7Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5yiG2YU4YSGOf5U80G+4i+r3hM5kcmgLvlozrOrOSs=;
        b=z6TZhGuPKX3UyYGqUpxDlGsfxOF9olItMQPbLU9w90LIoib5ZArWaJd4Wy7N0sZipo
         8wEQQ7xd9NnSi14uaQnW4ZHZfMz0fuP4YaNpcjt1CJJwJbYUIsui9iGQIO6mSO2j4oCG
         CV6Ajzj0srQzAMfxpJFFGa+usQl4Nq/oXTgDi/YDn1Re5/1Tqa1FuqVjdrF0HfOsA652
         z0lS4L45zzZD4ehCo4n5XY/lfcBOsxPJKdsEFiOoEu2IP7vCjGI7kncKZzAuADhaw4NY
         tzCIoUO1qtYgqOJsJIpLTsLr7JG3Jj8v6vRTk4GbSk2znqTJOT2o5bV/zjf6f3o1wDbD
         GmnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSVkk4Fj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q72si22367576ybg.133.2020.06.25.05.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 05:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSVkk4Fj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joRD7-0003mb-Ju
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 08:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRBU-0001n5-0l
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:40:52 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRBQ-0005bo-EW
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:40:51 -0400
Received: by mail-oi1-x241.google.com with SMTP id k4so4821642oik.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I5yiG2YU4YSGOf5U80G+4i+r3hM5kcmgLvlozrOrOSs=;
 b=SSVkk4FjfOSKFm1bwoLIOLUTWBDn1e4g5l4WF+DCAmissDuizscqckC3QHsp2WqZwz
 3753vgt1DG/tOx4nkbszygEV8ycL0bO4FREwBmX0TI9OUrXOiMiY2xu0EYYAl9ZmIM9U
 sR60SdSYD4llJIrNq72XT/1q/ZNy7gjEasbwsA5D3ys+twQm7Aref3z0ZjPx5tQAOyFg
 uFVqjM6q04TIEhyc+Q+76EIq32/NQspXrq+M0HT8Q+v80x6fqmS/WyVJlEAQQCFDcLTE
 RS/SXvSleefQXJEE2oq2hUmHHWeyd8VxNwmZx7f1XXfYXwsN9qkm7Yo+nWd6t8jWXwMT
 MZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5yiG2YU4YSGOf5U80G+4i+r3hM5kcmgLvlozrOrOSs=;
 b=lIlbxzGaUGu9ez7CFQtcYa3iOBGl6Dh9bKIQnvqgvS7q/uY188/2xzKqBOJusbtktl
 LIi/El/1vOxHcOOx7Dt+2ccOkkGTHZHss1G65ZRkdMNWyzGjiKHy9e5y6as2JilYIWfF
 VRCideWIa5dXTMjsYKpvzGXophQHPe9xQ7C5pgeLEFRjeeUsdYYQaE657Si3eqCCz4Wt
 azbBcEUVPQuGi21NmWWHW6N/OCRx72IqMkTENYAHMaIFdzR94GEWAaD3RAaYjqFc36Z8
 ivlvDe0QvZ8kY+2BAzzsgCVRTwzsvPCGeJ9tvVFeHQFh0jorBRTK8GeCGormt/FWy2By
 Cb4A==
X-Gm-Message-State: AOAM531WoOwuEnzRyrUEEi8yyJX9U/LdP8OsKj0mArH3EsT0ItyP1Aed
 d2ZG7GrorZ8qtgvdSsMoHmm/MXBC48AyWqdN+Opcsw==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr1980296oia.163.1593088847282; 
 Thu, 25 Jun 2020 05:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-37-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:40:36 +0100
Message-ID: <CAFEAcA-t=SPUWG2oPrmRz-yK+g7rpTwtJt2cATUgp0AT2VwZrQ@mail.gmail.com>
Subject: Re: [PATCH v8 36/45] target/arm: Handle TBI for sve scalar + int
 memory ops
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UNfIL/LSjN3t

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We still need to handle tbi for user-only when mte is inactive.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
