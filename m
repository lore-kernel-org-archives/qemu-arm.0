Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp376681ocb;
        Thu, 6 Oct 2022 03:54:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5z9Hm9SJInf9DGGAw0bkpEjBt27Y08s4giptafI3XJO+uK5D6lmKBDSK2ogk3RavxhfVIO
X-Received: by 2002:ac8:4e45:0:b0:35d:49ce:bdcf with SMTP id e5-20020ac84e45000000b0035d49cebdcfmr2834941qtw.426.1665053641238;
        Thu, 06 Oct 2022 03:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665053641; cv=none;
        d=google.com; s=arc-20160816;
        b=IRF5p8QqJcO7Lm8LWQGsSqqpCY1M9ZIqMMWG8cW7oaY+aSVxPe3BCyBVZSuNVcGLf8
         Pq6DZbelMKzdCnMNmlqEbTTVzKnmZL9V1Vo27BD+Bl1qpINgXJi5r6y98CVG9g8GXdaU
         h3hc/VeijQdKSpN6kYe76IBzSimkHCv9bVwprkpkr5BGgxk+Lk+noqBi1BwKaxJw9x4T
         Eb0FFZf0lFwTcV5xwnx7n9H32fFhLhXf6ILWDngw/L3IGQnG4qD8b3M/2M8BzZ+R5CI8
         VYnpaWEr7MjOLt+1oz4ethwE7Z82a6DJlLjCm9JMRtpeNweNSV27qqJMojCT7mq0qlES
         Ca/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W+6lPPCfyXOyZ7QleOhL92iBJUIL1jcD/2lPHaHHe80=;
        b=zMM1fuUghHvpaj+ZKkkOOTx+tXwocXRTCP/B1zE/1EkQ4J7r9VSAW4DZ55WUPGdYh6
         q78LNZV9pc7+W/rIEwBARpjL+y0qn3fLPnu0WzSK+3kJyzaLRtNuRrzSLMK7tfjJmvgV
         8PaslIageCsrCT89aEer/cDgymHZv5WaAL4XQ5XvPiQ1z98pPkCwvWSEjaeBQQRx+3UD
         9GOJZnLuFlK7g05Pd/sHuaF+7jqtsmsf9u+UDnwmtrtNwd9ZxO38huMOCtNUZTW1Odvs
         PFI1N50ka5c1PZCkHmH8708AqS1qh/jhe5vKHBVIagp95N5pHONKiGN3TZEn3kpjBBXM
         lrew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhtZXK8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd14-20020a05622a4d0e00b0031f32353d82si7420995qtb.649.2022.10.06.03.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 03:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhtZXK8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogOVs-0007mG-LL
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 06:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogOUA-0007jN-J9
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 06:52:14 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogOTv-0001Lg-Ke
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 06:52:13 -0400
Received: by mail-pg1-x536.google.com with SMTP id j71so1572485pge.2
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W+6lPPCfyXOyZ7QleOhL92iBJUIL1jcD/2lPHaHHe80=;
 b=BhtZXK8G5fIfm7tZkhEjA12rX/cPZuZDKB6BHVE2sTp26mKaekzrNzj3RYSCdKEYFC
 Z4hVec2+7s4/J59O6UmBJwSy2+vMDfXBzXx+gpVkiwFHbYcUFbxXFmgBrYG1lfcOGfMv
 zQJgrZYBzET8CM+LHDzRWvohd0StagLF+dUsre5JTgrDkhEwSzleEalEanZy3nBDZgL4
 FAP2onV5NTRf4aphRfvjPK50W7NghaXo3AOmznEsz+Fa+o7wgy9yTEdRtHjOj7UWECgY
 lZobmeHN2jXTfZ1a3pnYsa+xyG+5bN1UmMRGCj82Z4gyr+6yp9kp3nu58RlsjuTzChcW
 IPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+6lPPCfyXOyZ7QleOhL92iBJUIL1jcD/2lPHaHHe80=;
 b=b87Tw9fwBhLZp2Uirl1pNlsXNzi4FypxuQuMDLIb5S1hqf5v4oV9AMU3jLplhuhQmk
 6RDd0UxJ9VK6aQGTuaEC7Krs+cM5iAu97Y/mrzQil1/StRLpu64FHdQpM/ZeXLGJSMne
 JKjPqlgTJSyuqX4BCuhYA8OR3sHpg5CTRTiSKB4Q+/QaizHWJdQAG4TVOkUMJHOaM93A
 RRjjXxQDhy8t5V2T5PKgvG7vNBbXb3aJx9sXlvsWgsY3LDCvsVp714jUpJmiZ6p1Zhat
 QUsrQNz0w2utgPQqL57M/7d5BPogNEhHScMOsXyikI/zuzZcyTlTLNYx/aTgxifI+Qqk
 kWgQ==
X-Gm-Message-State: ACrzQf0Q8bS8iUzp+XkrwKlh/UZVKwxYmz0qurcIPJ7B8HIFwB98dblS
 McMKzJBkRrKhA0bJrHXeVeHK4hv8iTmPXBTrzqG8vpB6tpQ=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr4011505pgi.192.1665053510088; Thu, 06
 Oct 2022 03:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
In-Reply-To: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 11:51:38 +0100
Message-ID: <CAFEAcA8fbToN9D4cm=2VfaUn3GHyYZhbETa3CY-Y0-2jqwbYcA@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: fix baud rate calculation
To: Baruch Siach <baruch@tkos.co.il>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RVipjaxXDXfm

On Thu, 6 Oct 2022 at 11:20, Baruch Siach <baruch@tkos.co.il> wrote:
>
> The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
> when this is the case". But the code looks at FBRD for the invalid case.
> Fix this.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  hw/char/pl011.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for this patch (I'll review it in a bit). Did you find this
because it caused problems for a guest, or just because you were
looking at the QEMU source code? (If it's the former, we like to
include some details of that in the commit message.)

-- PMM
