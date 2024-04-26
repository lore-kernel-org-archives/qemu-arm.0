Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp501685ejb;
        Fri, 26 Apr 2024 09:06:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfFfrYhxY7U+24/BGUfdWDYj/BYfMWs/lPE/CS4F1m+EPNmWWOv/JJF45G/OboBxOm8qzSFc4AfrcHDCbZCXu1rTcAmGRN
X-Google-Smtp-Source: AGHT+IHchpLYC9dhZlgJ2GJrnh4obGnQrC43KphEtq2kGx1kU58/WClXJbIgKKjM2rypECqko6fm
X-Received: by 2002:a05:6102:3ed4:b0:47b:b49a:336d with SMTP id n20-20020a0561023ed400b0047bb49a336dmr2995143vsv.32.1714147611445;
        Fri, 26 Apr 2024 09:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714147611; cv=none;
        d=google.com; s=arc-20160816;
        b=LDdOogdFYz3SWcacw2Bd1k9P7fZ3e6Wff2KZmct12eWRtX9MDkigH+KkCiz9lVdGW0
         1KIRlntzSWAPpJOZtTgF+YSbB9LRrjAq38m9T7fDEZHLqnopeR0+A4S+zokQjgEZ1xm6
         Wzwm9Jqq7Ib3TNj+u5fvKQMAKoCLo0NgCEh7+QENGrCSzs3Rr9zx5oZ3bLlVBSuIVDIr
         gRxWiG43vQBnOr9KPKj4inzHS2zVF6q/8Dz4jUnNF/PV0aFdpnYEDP9lKuYbPiyMMrLJ
         zdz8aeXTV3eVfsLIJeoVZkBW4dp+pVr35QoDZl+E9nyn//mdflE+fNDMFfA6kJA5cBYR
         SpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QZXIYs1DG+ex7iz5Fvnr4WBL4PBi6AnBOGf+DiWexcw=;
        fh=9SqtVg9CqhIeL61OLc7zUyBuBfh2kJTSjDcVlR+wdZY=;
        b=iS5NvoUDGbdef/GnKpOeVaD7cFpgxntNQPT7QWRS6OnM4ou7RtxhqNl4LQjbm2oJbF
         W67AUP7e0z5Ph1eyAtpw95Khaz7Kca4ndw04moqUDP9RwGH2tETCfYrANhwmWjxy1NMY
         FeoliwmAcnwaBrvjiA/+F3F58O+0P7NO9T43tCav0+39z7+B903ycEkpifgfHb919t/A
         Y4d8mlHslP0zeIJ45NuIoFuFh4wUIL9JIXRbvrJMIK3sbKG62MfbtDVgVou5wCeX7xQP
         448phup2nr5NT23SE/xja5IkbDJQZ83ufG3AnDM6aL5iuLbV6v6XV3Trrd73QtCZkvgm
         T+3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYkzl6ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a05610220c300b0047c24b1b10esi344319vsr.601.2024.04.26.09.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 09:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYkzl6ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0O5p-0007CF-7m; Fri, 26 Apr 2024 12:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s0O5l-0007Bu-Hk
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 12:06:30 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s0O5j-0001ys-H1
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 12:06:29 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6f043f9e6d7so2416122b3a.3
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714147584; x=1714752384; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QZXIYs1DG+ex7iz5Fvnr4WBL4PBi6AnBOGf+DiWexcw=;
 b=nYkzl6ngvtqsKjCAkKcJ4jqJ7p7zzzG6/+ZleYdLv2mx462wt3Ge0f79zfZgo52mJz
 B14jIFuwCdsaBbmLZKUMzMkpkCpyb3VddpNM/g0/E5LWUd+6cVlk21pRnRn4Q+9Xyyyt
 dyHsJJbMjGBGxOEoQtwRCvdlAiIVq7dkB33awnuOpbjveJckJL7hUuclzpIEYs0WVYAN
 f3pnHZonPDaKXF9ewvBiARK1Gi+Yq66JS5ka6q/vOSft5TxPM8paKV0cozWINVMZQ1Ar
 YjTJtt46GF5OAiYd0BY1cHI6qqUBs13/tjXdJ6AcsZKATpJKEPyYHjPK1XXhhVbWZikb
 m17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714147584; x=1714752384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QZXIYs1DG+ex7iz5Fvnr4WBL4PBi6AnBOGf+DiWexcw=;
 b=lCPCkVolyzZdDGcvqTceoZcqyV7SkWb1v7dlrPbz6jGfR2PqpHQ0HiRTRX0YtuXsBg
 4fFBgn3ebcgYg6SsOTt9iIsIQfnlV94PPgZD/euOxhNFv0b9za79NxCJfmkQlWLqv50K
 zXr+u7PUrMWW0VaFjDPQ8AZm+YFOBZ5UkDwGIKp+OYpiC1WW7a6PyFyBJpENSZOGhGGG
 vIy22ZVY3EZy3qmFwDTYX41Yqrvn3cO+xDvAAKSTcpDSA8Howf5Wh/vd1BF9INRf1L9v
 VEHeXecBZdPA566d1YFi17WtXDZJZpRqRciP1ts/+WLZhuAUzaiqp8p6fS1wSr72dA2r
 8Jfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDKKrtkieJgkEvT2TwPdDY1RiAXyyBXHz8eF7s1v065RmMXOt/0OuBB0+/hJfysQ7CVqudUMsaHXvgl/KdD3r4Bd1d
X-Gm-Message-State: AOJu0YzDORkxf6VjtuChe5nR/V13h1mHmYLgqw/PfRcSkprwzRinWs09
 MtZVlupFXZSeJ4UAlFLavkMrTkY+oeQr7tB02/w4Vh/+W8dvLH6fnWi4ND0+MG0=
X-Received: by 2002:a05:6a00:114d:b0:6ed:1c7:8c5d with SMTP id
 b13-20020a056a00114d00b006ed01c78c5dmr3954379pfm.12.1714147584117; 
 Fri, 26 Apr 2024 09:06:24 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 b186-20020a62cfc3000000b006ecf56cb55fsm16029464pfg.96.2024.04.26.09.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 09:06:23 -0700 (PDT)
Message-ID: <a25e01c0-5f6e-4568-93ec-970987eb6d07@linaro.org>
Date: Fri, 26 Apr 2024 09:06:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Xiong Yining <xiongyining1480@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org
References: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
 <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dlC4JOfcEgad

On 4/26/24 00:35, Xiong Yining wrote:
> From: xiongyining1480 <xiongyining1480@phytium.com.cn>
> 
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
> this topology can be passed to the firmware through DT cpu-map.
> 
> Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
> tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   docs/system/arm/sbsa.rst |  4 ++++
>   hw/arm/sbsa-ref.c        | 37 ++++++++++++++++++++++++++++++++++++-
>   2 files changed, 40 insertions(+), 1 deletion(-)

Isn't this basically what MPIDR_EL1 is supposed to indicate?
We do not yet implement all of that in QEMU, but should.

Why does the same info need to be replicated in devicetree?


r~

