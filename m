Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3357490ejb;
        Tue, 6 Jun 2023 02:22:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5a0r1Yzi85LCuBjGGPZ7sMRORXl1Wp74iRho2bYvYFSXP83qrz8gremxzStu1jQx+dTtLQ
X-Received: by 2002:a05:6214:d8b:b0:625:aa49:9ab9 with SMTP id e11-20020a0562140d8b00b00625aa499ab9mr1797136qve.61.1686043372529;
        Tue, 06 Jun 2023 02:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686043372; cv=none;
        d=google.com; s=arc-20160816;
        b=yunycvAv3BBUhV7U4oXBbY8Bu9iqrFduXt+bMT4JIQTkf0pGGKWQt5DWbRd3rhh1Hs
         BOkI07xYv5a6TwKka/V+aZpi8p8tRkQNGG5f1EIjD1VGz3806zXbLJXsJexuL45p67kh
         TPx69Sm/pZMvzD4qpywjp1Z2QWnKyNSbV7CCTozMzUUCB18YO3Z+DwIOijlXf9++fEno
         WnxO0pL7AaxGU1sJ0buCtQiAxmcfOkEUyejMNgwKZWGPXfSUIb8J2C2VmO5Jm+PSStzK
         GdOoSHAbqW61GtdIkISJ3MfZ36G6xwW+VF0pjcv4Pm8zffBBUsxtL4Ojlqo2W8n7Bpmw
         stRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=k8jRvt8BXK9EcAiWOn1sVo0UKxCVBS0yEqG7bcFAPdI=;
        b=bQQkAOkNtznWSCXPiuPxcz0kMHigJ7QdfwlsdXHMtrdgG3nfkwHttpldQNsvlOnGhm
         1rBT8kub4aAD6ECrwPSTbloic0Tfbkwe4a9AX+2B50qT1tmFrqA/9SWjjYG61mixkZtj
         /+XdyDmvW8lxje8NTFTEEF1DC7aw02Xafuxvy3bP7s/dPnJt3khcBdaiglIUogSe+9YK
         XjbT07kTbF2WTWd4D0GI2jUfCLdIaZSGb0eRv5SC86WtGNRg7mdGfoC1C0+ibLSF50WG
         CQsXyS+BnYh4qX0YvzYZpnBGgNyc3s6dDaYq+m04bPjquT9rvGsbDbP4T4oPQhywjWth
         cHjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l4Q+/RxP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr9-20020a0562142a8900b00626189b8205si537448qvb.171.2023.06.06.02.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 02:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l4Q+/RxP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Stp-0002X1-Vg; Tue, 06 Jun 2023 05:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Sto-0002Vy-Ca
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:22:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Stm-0004cV-RG
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:22:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5147dce372eso8526065a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686043361; x=1688635361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8jRvt8BXK9EcAiWOn1sVo0UKxCVBS0yEqG7bcFAPdI=;
 b=l4Q+/RxPSDgtsXYMVsquC2y075QzNWeyhgUBwTBy/CF4CPs1eFPaW5Mp3ojaoGfwiV
 EP6E5IOZRJh7b+SAkukTaDJ2FS57MOHrhy9CuLSxfxgtsteKJVRmlF8Rk1t+afVqNKf/
 1MJkswWQCHHpak294EvE5exFMDBPpgOTBHofho4AYNL7Id5cKRaBxPnEGZjlzvNgnt8g
 DSThTd9ZuuWjE04azx4Y4CPrxBYktRQRXYjY7TyPFzI0+EwZdFeNHNQVQWdWXHSwp1kH
 Y0StJ+hhWMgEnV1GKAHJjrD+KHe8dXV9X71B/UT1VDweNg5PVkdxqObEoOMproyYybyz
 PVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686043361; x=1688635361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8jRvt8BXK9EcAiWOn1sVo0UKxCVBS0yEqG7bcFAPdI=;
 b=SD4L6bSEl2xBqbn8DyNVt1UI3iAf5y4v4NwGlOmQUGZlG4BaQaH54n/aIjpYlRP4D4
 JNtrZLh+xQvmvgpjA2meVggfPb8zk5x/NDAanWcyS5Sy4Xv3W1BXCWjXjLU3ySSmav3p
 wDVCVg/aOxRMlo457+hrnT6mCIWWqn87gi4ecwT19V5+o/iiaqBnPviY9LLgeyPKXEXD
 QGLGYUNmHbKk+jkW2gDBSfg6WRyjD0WPxlgWqIBsmY4s3MNuxu2UUWixmI7wmH+1H3A/
 ayOsUny/yCrrmQV11OXMpn9DKUrOIi8rHDP38cM4JdYICQMg0hTW3kPoZCU+mJTigTue
 MKTA==
X-Gm-Message-State: AC+VfDwwRBkXCE/qpVCBoyivKmqBBZ22HbtkslMzo5oP831dXotcfvIF
 fM41XoIo05q92eqU+59SY3FZZa0bYWTGk0Pd5fEj6A==
X-Received: by 2002:a17:907:96a3:b0:96f:f451:1874 with SMTP id
 hd35-20020a17090796a300b0096ff4511874mr2306739ejc.59.1686043361098; Tue, 06
 Jun 2023 02:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230605175647.88395-1-philmd@linaro.org>
 <20230605175647.88395-4-philmd@linaro.org>
In-Reply-To: <20230605175647.88395-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2023 10:22:07 +0100
Message-ID: <CAFEAcA81sCDGrk+TKe42rQ+w4PMOORsgwj4DZR1Ky29i5SFm8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] qemu/uri: Use QueryParams type definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: kIjSlpbih85E

On Mon, 5 Jun 2023 at 18:57, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Follow QEMU CODING_STYLE, use the type definition.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/qemu/uri.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/qemu/uri.h b/include/qemu/uri.h
> index b43f35a6a6..2875c51417 100644
> --- a/include/qemu/uri.h
> +++ b/include/qemu/uri.h
> @@ -96,7 +96,7 @@ typedef struct QueryParams {
>    QueryParam *p;       /* array of parameters */
>  } QueryParams;
>
> -struct QueryParams *query_params_new (int init_alloc);
> +QueryParams *query_params_new (int init_alloc);
>  extern QueryParams *query_params_parse (const char *query);
>  extern void query_params_free (QueryParams *ps);

Also makes that prototype match the following two.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
