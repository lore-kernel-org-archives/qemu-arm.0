Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2737980lfc;
        Sat, 5 Sep 2020 21:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0MXspjSDRpYzGkW8i1M//0QCaegN//ZUD0O3CEvwb2GwK7Mg/aYi8oMoMpK0U9xzop894
X-Received: by 2002:a25:1c4:: with SMTP id 187mr17744943ybb.481.1599364859847;
        Sat, 05 Sep 2020 21:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364859; cv=none;
        d=google.com; s=arc-20160816;
        b=xiwpuOvYJBgjQZ5oTP6WksGDQamgXmyR8TgDmhXwFw/p3qx3dte13j/nS7avWMr4iR
         dSyUcB8lvdCiP9cwXGA+Zb5fELj+74l2elV4BTb67dBviVyTeuQSCsSWCrWL+IuGbVlO
         S8FlBYrgEX6twyumTHCvggKegsRrK33PH2jVKLuCx64MBeRTxMMSL/RSpnQRtPgwFdiN
         u/3/xX0xF1DW0kcEGnYS9wDM9HiQc1QHVY1It1cfFA2fpNAZcyct9MNWE7DUqGax2/BE
         sg0Wpd8N/zPVMAQ/SFdrfgBLNTGzifYZwUdy2mouWDtTu6Bc2nHOh0pzMTLeFWJ7dkUp
         WrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BqgMualDv57fOos3mfS0fAxCz8frh8Smz0o2lIy1Rxc=;
        b=WcjjApbqR0deun3uNEjq0CvMHpbJEw2WAmPuxtEYIQ2CocX1FtNJ+5uXxDpBDAvLyp
         mMAEEVuNUYhSyyertvkiagCZeZsyqUAHGcKvIl/FOsoCEtUtLOP/O7t5HOeypP7/9m+P
         t+O8HM30WJ6HLFRFvxq/h/4afKD39noVUI0hfFzu/UtvI9AMaS/hmIX9iQEmcW28sl0T
         PckAbQyiEikfnkCjNodPsbF3SI0fBMI/jNtgVDXNtu5E3cqg2Y03FRSG3T8Pexxsytbm
         Tx6g0yXBk20ngP72xU0D/vsUJmFBxOOqernQ5v7FsYwVj36NG0BdIhf7BL4NChyAc/ND
         Ky1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=muYf3MN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si12622813ybk.331.2020.09.05.21.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 21:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=muYf3MN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElrP-00011V-7Q
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 00:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElrA-0000oX-TX
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:00:44 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElr6-0005Bv-O3
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:00:44 -0400
Received: by mail-pl1-x641.google.com with SMTP id j7so116147plk.11
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 21:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BqgMualDv57fOos3mfS0fAxCz8frh8Smz0o2lIy1Rxc=;
 b=muYf3MN+s7hIbLpkM0s6/hvlfbOQ8THCWWg5FHNgU2B9zmS9bRuEl5OceFPr9ScTgs
 S1wrFp/RUwn/mpL+zPR6TOX9XaayyBypDk6NpH/umek1o35B+fgKS/AR2N3DDQXo5RCQ
 vco+RqS2DL2faYAZ6IlX5+iolU3XR7GYk1xZPn60QkUz5Jr15I1/VzPxz82Y4cej54Kw
 Th4MTpQyyxW9Rz35NMD11tvKKlyy30qwcNGt8oCoaNm2u/1YN4r9cN93bG2VczU1GrB+
 lZlKPl8KEjEYLsLa1Hj5O3EkLUAkqZZ63/e2H5fXOdktbscKUlRUQnVwuARn797BvvGP
 BD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BqgMualDv57fOos3mfS0fAxCz8frh8Smz0o2lIy1Rxc=;
 b=eYdsvVMSF/VDwZzYY3DoZUB+eBC8g/Zi8SuYrknc4PPXz1hmpTugaOlhcCrxr/yNA4
 OlzFYvLS2ZVcOfiwjYrSOhQoMXNvYtj62qNvxCJ9nlqaOe4jHhZVo4XXwOQeGKd3oDqH
 pyBSS54wFCgMrtDaG9g7aF49/P5mC5UWDeEHXOMVMK787+rryYb7xgL94SYJKLxLlk6c
 eXaEC81gkKSPgbkRSzGbzBABbsUdBTb3UwDF9Qwjz0Xh+r/dY9aHCTtGO+mghiIiz88X
 HHb90dJdcQYsd2chKKWGBBtL3FVfm7HbUz0b7pEAF/oCQbhS9BZhxhjOu2/PVfoKCb4S
 t4dg==
X-Gm-Message-State: AOAM532TmaJmzA31Clb1akfSSKn1Oxvm9QMfJDOgnDKi2TTA56ojxtQx
 U9uVx9abl+LydmXwni/kSpUYoQ==
X-Received: by 2002:a17:902:988f:: with SMTP id
 s15mr14698750plp.26.1599364839449; 
 Sat, 05 Sep 2020 21:00:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h14sm10514702pfe.67.2020.09.05.21.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 21:00:38 -0700 (PDT)
Subject: Re: [PATCH 09/13] dma: Let dma_memory_set() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b780bd3-ddb3-b493-00c2-e980860ea98c@linaro.org>
Date: Sat, 5 Sep 2020 21:00:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PH7AAwCrA2ch

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling
> dma_memory_set().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/ppc/spapr_vio.h | 3 ++-
>  include/sysemu/dma.h       | 3 ++-
>  dma-helpers.c              | 5 ++---
>  hw/nvram/fw_cfg.c          | 3 ++-
>  4 files changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

