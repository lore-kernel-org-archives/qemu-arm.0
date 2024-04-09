Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1915395ejh;
        Tue, 9 Apr 2024 06:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5xEVgWNFcnrGw8HgtwS0rdXZb+cUBhnA44LWRNakoqspPEAtkVul5RqrFawYqL8P0n/VOInH9wci9oM6t3vDE0+5OqWnl
X-Google-Smtp-Source: AGHT+IG15HkDGyUT42+bLwrOnmVq8Wtem6WKSlx7zTdwdSQhYqUP/CGnAWX/s1PVQ781LCCLWjIt
X-Received: by 2002:a05:6102:418b:b0:479:d8ea:617f with SMTP id cd11-20020a056102418b00b00479d8ea617fmr10991380vsb.25.1712670348836;
        Tue, 09 Apr 2024 06:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712670348; cv=none;
        d=google.com; s=arc-20160816;
        b=PPDd5urlu+4P0pzA1m+C7zINaq0wbXM6sY4/xmVfVrRLIkkmXLe3PiRAioMXVDnen9
         uZSHCJzN7y96DnJK4EzyYr7K6BPLdyNhdfJuL7K+mh9O8wuVo0AEiL5loria+KBuNimI
         eoZHT4Clr2hWVN2IzhbPDqxRT9NK6H0QB3d/62y2QI5whRRb3azTbdg6yZfRcdVcGRXF
         2X2Zhu5+W+Kkv+uEQZVMSHLIboko+9bzJeZ0CAqjejRLmc0sitN76ObjFrsEHQTfHgSS
         ggn2ivEmNlpsCTk2V1ddVf1dzXvX9+ncsB+wNP3papQP6Y6+ihQ/U3GLpgndgp04PqUn
         kraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VKGxx2OlQ+3Z0q29r7RMLAlgnAXZwZsrFm//OAQVoFc=;
        fh=hbtr8pm5CVBSUWoFkTcrEaFvgJsy8m22+VIWobOgGm4=;
        b=0z29uX09Q/f8gt47lhCUTG8PmxnY0peanYQpiX1o//V+f40moEFNXh3S2/6EZJvpvJ
         LO1o8N/eKlNKVtZAqX8jZ4919BC1EeHLa5ixR2Cv0HYDn6U5w5x86WiJXD9rUEYuzLQi
         pn6wCHzaRWqfuPskzUZDPQwfF/g4ifwSZu6xVfE7DK+FIDBivGl9nFbxvDi+mHQS4M+P
         dnoGFvGjkgnMFW2y7O6lFcgxS5WrTVIHcFCBIelyRxotQAWIG+aRDr41iVUAIkjpjXHa
         wdAl8BpFuf4cmtz2RiPq+MhhIMDxnSYS1zEfJjJaELYnq058nZ8ze2bHiB6sTuEtou82
         A1LQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hon731dX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020a0561020c8f00b0047a15483119si145918vst.451.2024.04.09.06.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hon731dX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBmy-0008PU-QV; Tue, 09 Apr 2024 09:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBmt-0008Kh-JA
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:45:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBms-0001oF-2f
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:45:23 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e136cbcecso7854063a12.3
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712670319; x=1713275119; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VKGxx2OlQ+3Z0q29r7RMLAlgnAXZwZsrFm//OAQVoFc=;
 b=hon731dXbaWkkyxuTgPlKcQ/a4GWxO+ANmhP6omnCQ0vjZsxIqW/+Fv1FcECuFdFSD
 JR4bQ46kHFHii3Iy7q3MJuJ2N8Ckhwt7aMsvgUVCtpTJhxPoW3/lYDAtRW8DVaysitdu
 kUIyhBVfgRI0ToC58SNUHj2X1hgGNUke/69Yj82Qf4DM7KCn8rr7OxP7CPMzuXfdUhnt
 V+0wf+uB0jBsVWohDYzuesuZTzHGpQi2oVKP5jtWoG0txFbcOYLg9rT/IDTNllgoWDCQ
 S1fV20q+xJJ1b8ccxRYZBM6S3seR8QK5xwR4K67tmvt1sd/CRa7jS+xJcgZ+1eInT0gy
 F2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670319; x=1713275119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKGxx2OlQ+3Z0q29r7RMLAlgnAXZwZsrFm//OAQVoFc=;
 b=T2OzfzMPb0n9PB2HZbQY0wfgAPXoygjCNJNgBh7hJ3FlRvpZiubgrJA+cbURixa7jp
 r0NOkfeFAweDY2jntJHiFnuB/BSkliohhUJS2emOR2hGp15I8E8G7nURK/BQX/qMYdEb
 0F7/vFXoNLSux8qN6qttCeeNjUWSxdr8+UMZpTjB1gDfzU3JFZQkTFItYHi8+5QU3Kun
 ZcFTDBKmMczeTRgVm1D44LyoP33Ff6+Fh0MMPGg7HA2Ilwuk2/4J3FucicUjbLkcQzPa
 +3Ce+P7uQpky0qDZTlv0rOdTA0WWftynYwfz08vh8wbGqNpZz6mmeNp7Lz/8KQm+5NvP
 nlBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa+4pG1O43dGrq3amyCONkqOUp3Guobqi6sNHXFmNQdeJoveK5PbLunYihGLAb2mvV7nYGMQsG42P6qEtlJSUwtQ6d
X-Gm-Message-State: AOJu0YwoZePFaahQ1eGNi9qQa60mnB2Lq2YY9ICz7Dhz0gTziPILJW98
 VFK/hGFn96HutHeb1PCeUmfN6/8tP0bFDBZGYJWftlTOvUl2LQTmzNBFFrz7JXp+6nqPOL88lrI
 GSLIdCyuIf3/8Fnw/jQYV0HPZnlQ2IUqntXNoWA==
X-Received: by 2002:a50:9ea2:0:b0:568:c621:c496 with SMTP id
 a31-20020a509ea2000000b00568c621c496mr8964965edf.42.1712670319684; Tue, 09
 Apr 2024 06:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240409133801.23503-1-philmd@linaro.org>
 <20240409133801.23503-5-philmd@linaro.org>
In-Reply-To: <20240409133801.23503-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 14:45:08 +0100
Message-ID: <CAFEAcA__PD1ngOeiMhZjwG3rT77oZ5HSd4PeFkMX4fvSDedKXg@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 v2 04/11] hw/net/lan9118: Replace magic '5' value
 by TX_FIF_SZ_RESET definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Chuhong Yuan <hslester96@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Cu0QcW+Acbam

On Tue, 9 Apr 2024 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> TX_FIF_SZ is described in chapter 5.3.9,
> "HW_CFG =E2=80=94 HARDWARE CONFIGURATION REGISTER".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
