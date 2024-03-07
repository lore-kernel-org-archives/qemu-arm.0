Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1062324ejb;
        Thu, 7 Mar 2024 03:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9o6HY2sdex3cGZZn3IdKgo+T38AxB67+VKhxmOnh4wPRER9HfPdtXVsSI2wKGmAHGUU94Cw4e1bo7r9TJuK6EVQajpNPK
X-Google-Smtp-Source: AGHT+IEnjhiMQeq9AoKXHXYHZRIcr8noFnuOzpNaBNc0BiimVItJmqiy8I/0WwUEAiP5e6JjYZ9E
X-Received: by 2002:a05:6102:5486:b0:472:683a:be15 with SMTP id bk6-20020a056102548600b00472683abe15mr10307927vsb.0.1709809231451;
        Thu, 07 Mar 2024 03:00:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709809231; cv=none;
        d=google.com; s=arc-20160816;
        b=NKURalS7OmqIme3S0paP5j0xLapgKl/cGjam41uGlYd8unYgjKZi9UyJSAciLdwvcJ
         Uy+DjoRug7sXusSR1YXjGzr1efJfdlRUaM2CLq67NSDYgyjka056axk7T3rNCRgt7PcA
         ebMxc4WSHnIbX2U1V/+U0E3JjEoedhUagoOYJmpccbzpKjI8ueKLCOWuvaXHrzmxqG0O
         Ws/vX3cmVWK4Rn1iGZqV3AUrC4TYNU71f0C8J3RZjzKW+UtdgcSZOmxxMSdMBHxmOS5f
         CfS3/UiHtwc1pFyzM6S+J6Evgz2WnYRD4u+pZNVgWCUpcA6SNkRUp6tiZhjy1hdq52qF
         ZYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LSceiuVjh2dkgwAC/tZzPl1Za9geIcR1BUd2AgRb62Q=;
        fh=XqiA5zRCsrBetq1qQx2D2s7MXGw+og+xZUTyc4XipQc=;
        b=06f31ch+TZc8EA/1b3sfW8d86raMGBKIIyB9ukbTvrezIm+gM1Y3sWbFsvlGl1Lsqs
         eyvnRrTq03QzGDzi7RDbA+XO5OnMCHGiFiY053NXpBDKIHDxzkq3qGqVyGGyY+565eun
         6Mxmt5odlgxXzDgHfZqaT90xSH99bki2zYzJLs7CJfFmzEZ4weWcpAFLw7CSTm5Mzumi
         xxXtZwBXlemZfut15JOjqEjAH9thcHxkbqO9Ys5dpTUUWm3JF6SygMh8r5teEkrp97DB
         2nOBzhJWdT9q9tFryoCCjkP9g80bwqpqFnp0cegeQzgZsIuXiR/Xu8l3HmgQQ1sKyZs7
         y20A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oE5g82+Q;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05622a118200b0042f12c01277si2760213qtk.94.2024.03.07.03.00.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 03:00:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oE5g82+Q;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1riBTW-0004Wy-Hw; Thu, 07 Mar 2024 05:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riBTT-0004WQ-Om
 for qemu-discuss@nongnu.org; Thu, 07 Mar 2024 05:59:43 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riBTN-0000pu-HA
 for qemu-discuss@nongnu.org; Thu, 07 Mar 2024 05:59:43 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso830540a12.2
 for <qemu-discuss@nongnu.org>; Thu, 07 Mar 2024 02:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709809175; x=1710413975; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LSceiuVjh2dkgwAC/tZzPl1Za9geIcR1BUd2AgRb62Q=;
 b=oE5g82+QUq7g3ZHu8QlO981e7Nk2gk8cqgxAiQGBB2CwqcsJnYJx6ItKCs2UFT9IJw
 vprmeHtCRESfLmj7V0SP7JNroQtUsJZKesM4JUxnB6rU1dx7uztE+PTSzHgfXXf7bR8l
 RBYlnIehY0gtnxXYxgFUbyp5GuuRIr9iDYHcOcgep47XMBc1Dh0liM2dCYpfEJ1Ak360
 oz+Kw4dBHeW707SKH2QjIPfIvm3HGMYKM9CFvBWVtxUECb98ruIpABm2i/ZCxlO0Trl/
 be8WMsnjlJAkLJfaMgPjshIjXuAt0q0zy3E3ITZ9aUg7Y+1C6vE7nS+3thkzbJNoybIl
 M+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709809175; x=1710413975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LSceiuVjh2dkgwAC/tZzPl1Za9geIcR1BUd2AgRb62Q=;
 b=A1IjFV9I6VxThcUZKSJ8ZQUwqh2QSFLyJ2s/Ui7iubXcYTpxSpAPS7F3Tc3yjm5n2e
 dJwb+aYtzph51d4UK4AahEouDVJtuKHwTZtdD354x4bNUfyza+T40/lv8I6IHk7RLZPD
 4WZUVSSW+u3EyC+F9SgFypB393aPznVCJxNsl4t8ObuTmjdBlWfMlCGEp4t5zQEyRj8r
 L9BALy30ie+OuOjs5AZV9q+cReVwfcEwJ8EXRIkCEx9q7f6DCxQbSNwXHdeQyrpUvHs9
 H286SHXqrmLZthwd38b54qfHtdmIyjUHzIWVgr2xTcbL1B04wsVjORhTyi7WyVG6WH+H
 Mfkw==
X-Gm-Message-State: AOJu0YwuBu9Q4dXEgNP33xM6dZCz+qmZOW3MpRT0+DnKSbNk+EDJgPIn
 Xt5BRfPE+Dksf4uGr+16NU+8E9UUBunqBX6V56huNig3iCl5ISnecGFEgAJTKlYpeaiDMyAUwZh
 YZEGT1nJiO/+Gww0r2yXL3LthCVybWecUArQiNw==
X-Received: by 2002:a50:cc8e:0:b0:566:1794:7b2 with SMTP id
 q14-20020a50cc8e000000b00566179407b2mr14628153edi.13.1709809175299; Thu, 07
 Mar 2024 02:59:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKstcpWLhcNswkippmDyQQz2bPKSN+w9F0jZzcZRGpuNWvW55g@mail.gmail.com>
 <CAFEAcA-eDU_As==Yzd5+xhAPKGzfUp2DH_Kj1owL3jvm8s+qWg@mail.gmail.com>
 <CAKstcpVT-swdej7ghk6Sc3Ngwb-ZSrVDUw1=4Rxq5EHOgfjPvQ@mail.gmail.com>
In-Reply-To: <CAKstcpVT-swdej7ghk6Sc3Ngwb-ZSrVDUw1=4Rxq5EHOgfjPvQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Mar 2024 10:59:23 +0000
Message-ID: <CAFEAcA837tobTz-5M-1AQxJcRgaY_qLmWvOO4LG4O0dZr8BkrA@mail.gmail.com>
Subject: Re: QEMU Compatibility for Cortex-A55 AArch32 Firmware
To: yb liu <liuyb845@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uTwHARrTZN9/

On Thu, 7 Mar 2024 at 01:03, yb liu <liuyb845@gmail.com> wrote:
>
> Thanks a lot for you respond me soon!
> The exact instruction is mrc, and the exception happended in early boot process. I have no idea to how to debug this error because it happended in code_gen_prologue.

That's a system register access. If you can tell us
the entire instruction (in particular with all the
opn/crn/crm/etc arguments) we can look at what register
it is.

thanks
-- PMM
