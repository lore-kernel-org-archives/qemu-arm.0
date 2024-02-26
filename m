Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2160560ejf;
        Mon, 26 Feb 2024 08:24:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOQm/uRAw0X1YxnFJvxnciACNdjh20cxJdmHFXeZ68lMdDmlskNk4Xjfsyeps5ZPQtfFAXD/FVnB6Robsz5Fig7pRqTmCs
X-Google-Smtp-Source: AGHT+IEM72EFUprd9gx755no3lDrKSY3lP6Na0RZ1OS7fSS2ZLjgqv0m4Z4ywTr/800/at26AqyP
X-Received: by 2002:a0c:f103:0:b0:68f:4fd6:ae35 with SMTP id i3-20020a0cf103000000b0068f4fd6ae35mr8141784qvl.6.1708964668122;
        Mon, 26 Feb 2024 08:24:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964668; cv=none;
        d=google.com; s=arc-20160816;
        b=RdB56Ibiz8y+smUCI41QqnoCHUcen9rkXumMcZhD4XfRqV+ptgx39d0eImHyDuk3TZ
         NmA8U2oj8ClbdwG0DBlG1AiZVKp16WC8Yl+PSwWcPoT6XBNLuoSu6OjkQwzJzADfZQGy
         ZN3jvePr9h2WiWFOQXN5Rr9m6uoAC6a0qhbDu/NeNa/+qjImd0DDG2O4UF7fXAhXQXcf
         6bhXuksos+FqfzypTV3SZn1jSQXUI51Qkx55muBrj+sTcojZTX6hoEt9ycjcKQFbJbZ6
         0wBKDAXTgxiTM7S8FJfA3AXMCSTd9t03k+MeJ+/kI9KrTrYX9XBaNja9j2ERKWE8RitQ
         3pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c/oiTfEwM5McMAoWskm7g0oVmrOwqKEpr0Em5Yj4GeM=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=cBOS3J3TWQ9LzrcobV08aC3zJCRClvVQvR8cll/WIQNJo8BtOXnBs7b5l/PSE/eR5r
         wa7XOL83YgGWVOSYkFWUAIpXWpIfui9EhncXF4zHX7ItT1XSl7wUbwmZ0QgTJ1LDpwFb
         rxsvihy+CzfvUQMGRZh1vSHGr9wepgLINHjfIL/w5pNoetcJDuwSaHlmasArKhGWDiwc
         G1ylgOyDO2jGgcKCbHP/6IOQYxU8Bxsmu8pPRrLzoDGnCG4n+kI5w8aEP0uIaNEh2r7o
         iBLiwff8tDMJia9Jw2Qg26iiuQyMXDBgg4YW4v6nl5dHVCv0qVyNi9whXnP+foVxX106
         OkTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="smZ/EbOG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg5-20020a056214252500b0068fa1f5a782si5428084qvb.512.2024.02.26.08.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:24:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="smZ/EbOG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redmA-0002pK-LZ; Mon, 26 Feb 2024 11:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redm6-0002fm-BT
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:24:19 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redm3-0001F4-QW
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:24:18 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-565a2c4cc1aso3002872a12.2
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964654; x=1709569454; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c/oiTfEwM5McMAoWskm7g0oVmrOwqKEpr0Em5Yj4GeM=;
 b=smZ/EbOGR/Ro56nNfRZTQ1F8fowNaz+45ovYbzFV11pIohaTF6s8H1m5CA0WL3bxqi
 daXGSXz7hrigliKPqFQA1WCVR3FK21+dPVRVW7aweztDEtBWxEPJX9mV8vVFDzUsGlRx
 MPpeoy0fEpUGYkyr5t9mfEUEwOxuUtoSsYGoae8F2kB0gIoXvNLglPKimZi7Q12GmFxi
 +Uxg6KDuY1iKPcRxG6pXk5KA9/YfcI965OX9j+GWuFGAb0Nu7/zFTXJlXsiMEoVBBCth
 7KmcoZVw/d32UFWPZ3OHpCpV9jMsmZib2Xz/yWyPYKDAJ2CaGYlOn59+CP4G/yAY6ij3
 SqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964654; x=1709569454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c/oiTfEwM5McMAoWskm7g0oVmrOwqKEpr0Em5Yj4GeM=;
 b=GoXSNdfDokRR5k3dQ+UicBOVtRvyM/Ob2LYsbfdnvw0ZtnusB1l9X04ksRhmX71EQO
 CHtVhGJTZzp18X9wtFJBDzAQkZPz3F6y1xeo8/bXMJa/RqxoiLvaGkh1H3cyLvRrFt1I
 26JZJReHdlr1yV0tZ5I0m09joc+pLg74H6wTI6Q7/D6joi+WWygI7VayFp1ls5uTCZ5s
 rv6+cRmq6Jhpd72qSGghHle0gZnU+s7MU3BQ6OtOPQNNU+Sl/9E8xxKubmdSXwy5Ub9l
 k+geM+CM9aGf/yV2h61XwvX2pPjuWI+KCZ02WBzvyI8brtx0oiy/kA9nbNqfITZbZSRm
 mKkg==
X-Gm-Message-State: AOJu0YxA9hMN5Tk4CaVVy4UQEfUl4Ohnif0zBpk90f4mj4Nj05IR7e92
 Da5VdivXIrs3WUWVUzkjcov27hnxZrdV7gRsPgfJhBsqllIEqfvb3K29OG2M6x7lwaxw9hfYy7f
 UIfaRI1AqaTiWryLifF5/NsnwBHmnbwKoushCgA==
X-Received: by 2002:aa7:d799:0:b0:565:f7b8:6f4f with SMTP id
 s25-20020aa7d799000000b00565f7b86f4fmr1783437edq.2.1708964654319; Mon, 26 Feb
 2024 08:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-36-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-36-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:24:03 +0000
Message-ID: <CAFEAcA_7Z=_aHbTby=z0K8mw3YixX4VhKNeFbVMwsy0+WQwaVw@mail.gmail.com>
Subject: Re: [PATCH v6 35/41] Add mailbox tests tags. Part 3
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: K+IbY4XpeUuK

On Mon, 26 Feb 2024 at 00:08, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.h | 78 +++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
