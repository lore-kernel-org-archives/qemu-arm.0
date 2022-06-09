Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp577593lfb;
        Thu, 9 Jun 2022 10:07:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuseY40eMSSPzCQX4wnXrL50b3cecapGidrViM58gaAXgp1L1TPALi8ACgFRLEchwP2263
X-Received: by 2002:a05:622a:241:b0:305:1b5:1c62 with SMTP id c1-20020a05622a024100b0030501b51c62mr7467104qtx.131.1654794441804;
        Thu, 09 Jun 2022 10:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654794441; cv=none;
        d=google.com; s=arc-20160816;
        b=DhP2ZKifIYeKu4/LqPBx9pi+z60uYJQEIGZoaFf9nQqMw0TSsoOH+y3HgG8wnAf1pj
         LQx2194wSJP9KmRznHK7iio/MUUE1+Pvpq5VocdKiVx4hHrL+p/2WRfg1QRsJVkV2Olg
         6wn5bdp+p4zk6okwrkb+REKSXH3Pevyp+4hkKHIyEh7gV7vzgR498bXnMqmI7FJaKK2Q
         IvasiG8Yfn8jc0UzgtQtqg9RM0S5QIegnUph9fTMYb95E7PwIANJlBweB/V+fuY4uIWK
         nWhGclHFXsdrrqoBIPghhmlW6/7LX3lV4rXOzEtB64lIwsTMyJHBS2YUQqRk/Y66l6Qy
         Pndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bWpVv5rLTN4v9qWMc6P7eGvMlt4zoNP3Nqgbfd99WYg=;
        b=WCcCTJyNXPZMvLi9+H7fDK/sP3iV+0uhSd/UGwjuIEQ9kENaLVfKY4BBfSWP5mL7ET
         Sigyf0DbojRqPaXJSYEYyrHXdcLgDxSNMe5i/QtJQ6nan3qxlSzaslXCC1kHAeyzzVEL
         /k7sRL8qiJ0Epzku0UYwGchbMBJh3oFDpHjBFYRK3sb25s8QVuyaIj06s999/uBL3kLx
         wW1JahwWenbMpdtOd/reoFMOUh0ofx8HfLVSoWzrPkxoi1Us4tHfgBqQ2bkpVpuPgUFR
         53d6uyYGT/ztRDY68Y780E1UlqoM9ANO0a9BtwEIPtxijK1e8ALC21GcQ/Pb7/wogA+8
         fo/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fuggfpV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26-20020a05620a15fa00b006a6bbe1c40asi5800040qkm.557.2022.06.09.10.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fuggfpV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzLcv-0004aw-7C
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFr-0002oF-UC
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:43:32 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFq-0005oY-Bk
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:43:31 -0400
Received: by mail-yb1-xb32.google.com with SMTP id x187so15162275ybe.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWpVv5rLTN4v9qWMc6P7eGvMlt4zoNP3Nqgbfd99WYg=;
 b=fuggfpV8eeypP9/ZHnfqoA1Z6BcPLCefrx7ftJ/41JE2bjTOO8fpyW3vr+guy61ZJc
 Vfal+x/j9/3S9mr1Rq93mbX6IfpFIqe6l3FlfrqX2H/h3ZzwjhwlolCFDhTx81FvEgLX
 B8E9ZOkbg+wbHdgF1QqBYI/tAdeaO1QGbWIf8E7G7FTy9iT2HqgO0DGQbDadmH+YfVeA
 twW8vBP3E4gUFSYXvkBWYwFs/TIt14Nm7/pCLWIGVtH/yN8WPWjjvYtdfadimKektdqK
 f8FeED3OUrYCE0+giNIsOQB+g0mfg0WjC3MAKjIJ+2hbXNl4tV4WAnciU8ItZTfAq3wC
 zuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWpVv5rLTN4v9qWMc6P7eGvMlt4zoNP3Nqgbfd99WYg=;
 b=CJa2ZygW/vhy/yELddyudG3bSYQSseyWpd3m1ZWuKVAWFJGOVAyGq0uY5J0XuX0ulF
 dW5/neYy8sTq6vlDwwV28RPRM2DJKhoYyHsULlW7AwuY2D7B3bi21g1xdJasiUZmhQSo
 Isl4VBvhT+idxWqb+MFEBu7bSskna9q0Xt4u7hrgJNUfRjofBjly4/WfK6ptf2EZ8nr5
 cdsUzNZYuq//xoPQYdgJliscw5dGFONJxqRVZ/ZWBWGWgPuWUHBYpVTsbMYCpFekUiae
 tNjwPdEQwkNLAaJvChBJ1MDHGPRmpSU3VFGQZ0gdO0ZENTylodSN5zXNTQqNRAO8kGX/
 +DlA==
X-Gm-Message-State: AOAM533CIZr4AilKcx23MHqX/fsp+re1/I9/LbWc2W6RuKyyKfevXO3u
 U7X80a7h+8nxWObsJ799hchJWprAhwWPdo1RPQ5OMw==
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr38778089ybb.140.1654793009369; Thu, 09
 Jun 2022 09:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-22-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:43:19 +0100
Message-ID: <CAFEAcA9EAY9ZV8Djtd6-NrE++OnM8PTzOes8fcgV4fpogFz9Fw@mail.gmail.com>
Subject: Re: [PATCH v2 21/25] target/arm: Remove default_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Q+l58AwWjx8

On Tue, 7 Jun 2022 at 04:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is no longer used.  At the same time, remove
> DisasContext.secure_routed_to_el3, as it in turn becomes unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
