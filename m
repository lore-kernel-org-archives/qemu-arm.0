Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp42150ejk;
        Tue, 28 May 2024 08:52:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXaC57hUMcsh3aL8ebD8GsUoX4nsin16PV7qWSplM00ftIrYyFJO9iWzQOofGM8c2BGvICVeQRbeGiJO8z8O4GnpYtYjFt
X-Google-Smtp-Source: AGHT+IG3/B55/aJ1fa5c4GZwARf0wteTMNR0Uae1zz1MlSK3ciroz7QCZOxRU5par58gcE2Lt4e1
X-Received: by 2002:a05:6214:540e:b0:6ab:8e66:b873 with SMTP id 6a1803df08f44-6ab9d08fc8emr224854386d6.27.1716911539402;
        Tue, 28 May 2024 08:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911539; cv=none;
        d=google.com; s=arc-20160816;
        b=BZDVZeUPRNMRRTSVe7l/aegWDRH0xaVyys9wtc9IaGyEDg/jbmj/5k4XtHABkuyagt
         7ubFfrCMV4FRFYEBgx0p7WFtRrwRVfynfYV4wZvUzMlRhaEjEfrBivckpbX3CqLoJLv6
         VagNlDmhRJjM/wDHCEfWixj1ZYh6L8p54/MiPN5JAVHzCucgGG8JfAtqVPccVtz60W3v
         xJ9C8QhVoOk6LvmOGyvXWz6CMM3ht6xtPSempJe4POCJ7LE4Q4bj+EjCDefUs/9uB+ST
         A/fmj2oCKOEOfHcWxThRvKA5PvR+oHYmfudGt/kk1FPKxo2pycffjzj6QJQHYb8McdJ5
         SEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SlgBElTCsYex3FAMidcSlf36AqdT+FUpJCgxTFrJZGo=;
        fh=ZlEGswJjfiHrKFxGpnOrQmF0r+uZhcWw2d2+uUTAXrM=;
        b=cXr2Z6oB+k3wRcTK7awUShqoEY51hfLozRPsXD8wL8jx4hJfc2QM+vVr71vR01wELP
         fYSoqKWlZ7L9ESwvgT18Uf1uxyTIQ0UrcJdvzjN3Te1jKCq2LNi3UsTimlJphqZNSQcF
         esmizgIsc18mZeILVvYebB/snDZ0djyKo6cvzQ0nJGjDhdUgj0c7MsarvRstBf+fwAGE
         I6St5Kc+5Co0x4linCP4YPuyRZybPI+7Ol5JYfCFpoZslnTWqHB6H1aUu5nouedG/vAT
         Q7m8WBMgWF8gHDiHXgrRTsYJ+u4mJo7WRqwej/j4PCKJDDtjOsOidm5yFW+9yJda/7lC
         mG8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5YglK3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ad785989e1si66254846d6.152.2024.05.28.08.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5YglK3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBz7V-0001GA-EJ; Tue, 28 May 2024 11:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz7U-0001FI-1U
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:52:12 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz7S-0006Tq-62
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:52:11 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45dso1218974a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911528; x=1717516328; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SlgBElTCsYex3FAMidcSlf36AqdT+FUpJCgxTFrJZGo=;
 b=K5YglK3pEmGD68pc4qAGCgFmeCVZAwXkS33SPgDI4PVz8q46pFivC1eJtvHDogHCRJ
 TTu170CC57/DNBaJrmkoz1gME4VoyJSGZ4jdSHbUhzPDWwiIRdhmI38owYBcoZo8SDgt
 v43oLmaSIc1vxXDakIZbJlLwxFzt09rDCIoQHYgfqJzSge2cMGE+z8b4uRUwjL5JSg7r
 2/jEIvBG2h0WwtsBwIUelbqIJ5qHTxcyaecEJtx69ORq3O7ybhS7HmGLAy4b5KiTGGfT
 837jfK0hTmEcm2TQtIauI403XHmXAwEIYUkZhirjaF7tL7I6R45aAu41oHASY2KIqeyY
 WcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911528; x=1717516328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SlgBElTCsYex3FAMidcSlf36AqdT+FUpJCgxTFrJZGo=;
 b=tOfR1sZqf53u+8KvJgNlTMYLZrSY4bSZp39uWTsHw863hy1EwGM8QlUqLVBAf6yncv
 ya7hGlFd1aw8DEYZ8rsLIm/6KKhi0XHzg972ehjyNmvJV7Plzxn6RKUNWzo0pugzC5mt
 P8qvRvjbmhBKORpApT7nYqPAWVjo8zG6B0o00enXEqr95+LNONIAEsGCof/n9ia2b+zz
 11FKWCIvSw3C/fe004zNoUMLPuEuOk2dm7wqzs8zUiEjkvMHvwoi+6oqJaVCs6+d1WQQ
 QitrnoH+C97hiOyF7Gg3rhzJqPR4yzfbFpLYtjvPt/BeCl/55Z4czTGwTMkukj6g0H1A
 0EtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMFwwQCkAGaP8ornUDW4LAAITcgZFPvESSKyanRDNQc2MNDYd5xQcKs9gB2QM8mtKLoB0uORxKzvHSnvL/oXm8i53f
X-Gm-Message-State: AOJu0Yw+cxSw5Nl6mPtIAU99qUe8vkMSqxq0s2Gq+GojKOk7FvGNLUf5
 2jhwRdal6HGXOwkcGCMK2TeVZEhg1zM89hCsMRE8KfqGYo4vOWQQE3Qfls1jSATSYL6A5WC1dU7
 Be0SLDr1BgZuvm/HCD4gmTiC0HucD1Q7SehZdGw==
X-Received: by 2002:a50:cc8f:0:b0:572:d1e1:b4b3 with SMTP id
 4fb4d7f45d1cf-578519709eamr8335479a12.7.1716911528611; Tue, 28 May 2024
 08:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-46-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:51:57 +0100
Message-ID: <CAFEAcA_W739Q9jpnO-ozg9p-41XzhcjgbwQ408XR9XJkQvx0Sw@mail.gmail.com>
Subject: Re: [PATCH v2 45/67] target/arm: Convert SRSHL, URSHL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: CADP7stH211z

On Sat, 25 May 2024 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  4 ++++
>  target/arm/tcg/translate-a64.c | 22 +++++++---------------
>  2 files changed, 11 insertions(+), 15 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
