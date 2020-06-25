Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1140552lfm;
        Thu, 25 Jun 2020 03:17:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3m5kjEnbA3TvowaLFjNMQ4SVGIS2qvz8NTWHwydUh3TX2L5K4xPt2EAcwf8XEyTo4FG82
X-Received: by 2002:a25:df09:: with SMTP id w9mr54569027ybg.67.1593080243468;
        Thu, 25 Jun 2020 03:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593080243; cv=none;
        d=google.com; s=arc-20160816;
        b=MLl5FFcBYLBGq3tcvwAO6HHHz0g2rsSAUIOp7TnJq8HUP9D78xe9cfeKxGROL49fl4
         fMrfvfWsgNylovmY+xsHRMo1hd6JTW5qk6bt8ljRWSUH0oIf/xIyGK8RVCBYOP0568O5
         zq/iJi1Q91FJGi0m85uthVnoOnGaNC7RGbNrwJBYMJtr3zhofW8HUioyIl3K5LHsNyP1
         TrqhJ+BoKeiF3cokQZ7BuyJ6OP1Ptv96NS7zvtpjo5EVuor0BJtPkTvS1aotQSWUEV5g
         Z54gAjYYKJeudnCTu4uzBdm+5UMeKQSjdIAr8sA+GHGUZE7WVQyAiC9Xq38bjBnI/vFt
         P+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eeyo+75/orNQ0G3OkE5kjiaL52lZnCICMfyIyvlFIG4=;
        b=GZGhMVQuc3BnJukJ87srjHQiY/Y7fMdKV7UV78HE3nw1t0NakL36BlourKR/cbb/Dm
         iuunczHlxgueFmwZposyXfgqdWdWlXJ9wIsK7oWPNpmWHcMZTRVHQYNG/7GuWvxciwmb
         2u0nup1l7GevD8rKOXGsiUPrwXuxoeXEQBhiimXNGBj6trR1gJOFD6BzNV+PV2Rwa0j1
         Z7orM70QKC89/p1yDcsR4zMgoAXacAnGiqkWTaTFX7CdVjZXYw8Z6iEv9+DIaYe9DY26
         h/pzjHXE/AldMJ+mQQjRbZrA8Wetiy+RrIo5Z6yoai7rTGrf7skZ79np99rM/50aJJXF
         JNTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aIRRSpL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si20642500ybk.260.2020.06.25.03.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 03:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aIRRSpL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joOwc-0003gh-SJ
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 06:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOwQ-0003fI-EF
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:17:10 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOwM-0004Hl-Nt
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:17:09 -0400
Received: by mail-ot1-x341.google.com with SMTP id k4so1577145otr.7
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 03:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eeyo+75/orNQ0G3OkE5kjiaL52lZnCICMfyIyvlFIG4=;
 b=aIRRSpL8aUZrAgTM3F1X0naVQo0wvs0OY5kkSQqY8eCeUpIjWCt8ljdcjnew5Ighun
 H/MzjQ36IuTrX+subP8KvYg8jOvHp3lGK8xja+SukxEO0/7b7XMG2ktiIizAo0ZMnT9D
 vvgU052NDaEhkmGJOKEwpn8/0V49h/yujtlgO8GrTb+ycgNQJ1i+0szb2MGlLA5YkBMz
 4S5n30cojlHv+N4rzhbmYT8q1XtgqWIbOODMVsXkbj/bvnxwIqunlVMRe+NWe5DydC/g
 JpylBAs7FCtxI2m1uVMfeNYUC5+Map0M5DkIZl8/ltF0bADtFbAUPoSjUJ4nKLxRb6GF
 yfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eeyo+75/orNQ0G3OkE5kjiaL52lZnCICMfyIyvlFIG4=;
 b=euNrUI8neIbVxt5i+lknOrDLb+cHWPpACtec+WC+Fw+Tphf3BP7iF6Ijs0I27E8BxH
 Psy35L6iws8l0R7kx1dEdXinYNZWF+//6Q2qmUFakO/+RFBsbYmDQLTau5svqd4+IetK
 Fr8wxfjnTaT8fMI+/eAlO9H8RAyA+UkKNA8JtbO3IGWEf7W4fzmiVsjIXpOACnz+ixw7
 eIwmP1webAX6HU+p+2ywdzgWNDp5ZZ6jxv7PoZS1Zazau3RnIrkuVVONRCpuTzjhpJTa
 JN2tS48OgqZEOUhmBM7+76KuazVFJTeV+OHuA4aNn4j6irgLbBnC/z47VERSgBzwd9jx
 cZxg==
X-Gm-Message-State: AOAM531A1EDEs6DQTNq+hvurUTeMg1ucTuamd9Ds5OrpK5BnFGlwhdwM
 qx5xwlVFRaFP5M+8aHrFZTvRt7LhAeYjKIfXMPHmvw==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr12256452oth.135.1593080224641; 
 Thu, 25 Jun 2020 03:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-11-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 11:16:53 +0100
Message-ID: <CAFEAcA_LnXtSTxeJzHq_y_CL88buiu2RZ8N7S9pcAarYsbqdGg@mail.gmail.com>
Subject: Re: [PATCH v8 10/45] target/arm: Revise decoding for disas_add_sub_imm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
X-TUID: BLfLGcJBd8mY

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The current Arm ARM has adjusted the official decode of
> "Add/subtract (immediate)" so that the shift field is only bit 22,
> and bit 23 is part of the op1 field of the parent category
> "Data processing - immediate".
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
