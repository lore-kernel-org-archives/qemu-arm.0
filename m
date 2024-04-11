Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp892424ejc;
        Thu, 11 Apr 2024 04:41:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiTI2V6Sh0QkEeXAe97cdLcXmYI3fiv72VQdX172/A/Jn1Kq953r8dYpYiL6jJDQd/kGcaYWoJDFWN0VoTHTSXyPwze9O0
X-Google-Smtp-Source: AGHT+IGP1qaMgC0AMKy5gh01ocNCD6JCEzCIPje2nKP4jDCR+oFRzpSirI8n2cY+3DH0136pUiZ3
X-Received: by 2002:a0d:d6c9:0:b0:615:11c0:83bc with SMTP id y192-20020a0dd6c9000000b0061511c083bcmr5348393ywd.22.1712835660438;
        Thu, 11 Apr 2024 04:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712835660; cv=none;
        d=google.com; s=arc-20160816;
        b=IdJbi65IpjOxTRoCwo99OjXtY6IWXGQoP+5GB7E9apeHF7Y9bzS+ISIFAg5VCkXdti
         kOYG5yZFPaSSuyl2Nb097og+DbDHlKtw7f2OQUmz9DhxFjqJxgapLPxH2AQ4kj1H8FeS
         CsFS5FAHE6L20AEKuP8Wby1gTv0zxGkjzI6Jwi/TRjb2p95TrJmenwv3XC/9INnPfJdx
         Zn+wStUJFlgwoyqduADYA7pSeW73WDmZH+TgcS37pDbIX3QZhNX2FGY4jmjfse1m6U/l
         5A1MkL10FX2VVznL9GOJG82CuUOS3rDbf0l9GY9fVu1wssSEl3dmpjsQDVwVGk9k0ORp
         9OeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IHIF+i0Ss53JiQ/A2LOt4RnE65a5xhTGwSUyEeHDJVw=;
        fh=8e/mhDt30LbjMh5wkUpTrq9c9qH/56DUCMyCGEveZhk=;
        b=HlWeQ9XjOn71gR2qVJBO/a9NcbCIKB90Ji3Fw8dtQCqQ+d5m4+RsL/sUfllwt8tc4n
         whCO8i5IBhSSX+98BHXemtId3Rh9TOwFJvT1j4MDLPxAQCCjsYK6WXmBXJW7io2P2vfB
         cYPFPtGK2GcGX2OAmRWDYniyWMxBJ9Z15SJUv1tOsSNnujmv5HOO2ckElpQ+KDaCnlUA
         1CY90q/wufD8+ROmAwOsqWic8pd14LqJXQ3dxe4+Ic2sPzoj6ZIuG8VNSOMiUsfRkzoj
         L/AQgGsIm6Tx6+GUARlQrBtHhgkoWD82Gt16xF5Cxd842LZ++ns9lI5PiLKf5kv4VZWR
         35pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LX4FUlvE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj18-20020a05620a191200b0078be364835bsi1512892qkb.688.2024.04.11.04.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 04:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LX4FUlvE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rusnJ-0003sc-8h; Thu, 11 Apr 2024 07:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusnD-0003rv-0v
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 07:40:35 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusnB-0007h0-Bf
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 07:40:34 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e2e09fc27so1344399a12.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712835631; x=1713440431; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHIF+i0Ss53JiQ/A2LOt4RnE65a5xhTGwSUyEeHDJVw=;
 b=LX4FUlvE4dnHpXvZETTPLoGACp0g3xv1FKrrjZpVSWUfOUkvXHbPz/TtGDIIgTs0RU
 dk1R+YusScXGeVJQfs3chhhOQN4F/Y2TjQFf8k/ikrdHPkhE8GxVToEA8UY6Pc1xSw8r
 lMBbLVTJNmALGnR/Lt9VP6Ff4yFeuhyN7nEh0HNI0CVkZPR9iI29Hv6AUq/Do+m2Kr9A
 ds9Ut+zLEjW/BUYFtbDnvUZW8wkb800XWoE/izBz9bN+IycL1PSuSuM++l3HS/Q/5GLu
 5DAUBc8eo3VQ/m0pTt0GHtVGH9tPmT98c6jDDHQqPRc6CyvYn+0D60B6mMX7FtXHopit
 hx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712835631; x=1713440431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHIF+i0Ss53JiQ/A2LOt4RnE65a5xhTGwSUyEeHDJVw=;
 b=ZU9nlC04wou9KfOe/WqpGlY/5JHIwhBw7dMH0UOpREUoxoJxz+glbzjzZv41Orards
 nSoR2xGI/rWx/3jzrAUBeA+/1ACWp7uzQXrxmE4k4ZdyMlqlxJZtyq85Tz6OoIBrmND6
 gxcG9IbSqGHJGOydOhigfHCxGFs7zFoIjd+TtEM7rsHOVDqlpdyAZQ0egzcVQOXfQGzT
 FGAMxyKwDeMO6WTc8KlkErlxJEYm38IIUJRYIgZhYifLG6yUlnlpGYHHtVTj8XHC3sHI
 A/gKcCt4q059gvRKjjo3LzZju0KZsTSWxeJrcSHad4IsM9IttaBtkhAqWT2fwGc6Owid
 yc1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqn+7Kb3YKHBcKpBHwbtYWZYsd/E+RIjGMPkCdyEb0hfO8R6msun0vfvWOPF0MOOUi/7TPTkgiJRTgSe7aFuCNxkfG
X-Gm-Message-State: AOJu0YxucWVaeq1RzLZFtTDirRewRtOvaDXi1Ht+Jx7H4zIQem/PDVeS
 lvinG6c4ZsIyoKoLMBWnGn+DE494DXGFMfo5QnVSV9HGT0J+EtpJ5btBye79ItBMP18bI8Ncfu5
 1tEqiTOFeP5acXDJMrpspveDxO7CLplJe/UIY9lgge2h5Fufs
X-Received: by 2002:a05:6402:f12:b0:56e:566e:730c with SMTP id
 i18-20020a0564020f1200b0056e566e730cmr2244064eda.12.1712835631180; Thu, 11
 Apr 2024 04:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-5-philmd@linaro.org>
In-Reply-To: <20240411104340.6617-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 12:40:20 +0100
Message-ID: <CAFEAcA-S-go8U0hJPNSRhXQ3hSQ0BN4WVcTBPie4MRnjzGh0VQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] linux-user/flatload: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: Bn2KVwV5c1HE

On Thu, 11 Apr 2024 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  linux-user/flatload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
> index 5b62aa0a2b..b0f04af4b6 100644
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -692,7 +692,7 @@ static int load_flat_shared_library(int id, struct li=
b_info *libs)
>         char buf[16];
>
>         /* Create the file name */
> -       sprintf(buf, "/lib/lib%d.so", id);
> +    snprintf(buf, sizeofbuf), "/lib/lib%d.so", id);

Indentation has gone wrong, and another missing '('.

Looking at that, I notice that this function is actually
dead code -- it's in code that is only compiled and called
if CONFIG_BINFMT_SHARED_FLAT is defined, and if you try to
define that you will hit the "#error needs checking" in the
calc_reloc() function. It seems to have been like this since
the flatload support was added in 2006.

So I think we should remove the dead code -- I'll send a patch.

thanks
-- PMM
