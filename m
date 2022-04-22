Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp317018lfk;
        Fri, 22 Apr 2022 02:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPl3JhNQQMpvI8DwUZSrUeT9DAvvHz7Jec/z/vG9O7YaSMwVibOOJdXsHvtEoxGDHAMKpI
X-Received: by 2002:a05:6214:d8a:b0:44b:870a:d233 with SMTP id e10-20020a0562140d8a00b0044b870ad233mr2683477qve.6.1650621372111;
        Fri, 22 Apr 2022 02:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650621372; cv=none;
        d=google.com; s=arc-20160816;
        b=TWCctikYA8nzH2pANGRnX//uZqHKK8WfGJVSaRuNoxmR8ZOnenUnPeVJWQnOHGXegJ
         zr/EUFbT5tlLDuwlHn37aKfwAKf29Uq92ap2scWTxKNHKkyq3iAWWErt6ha/piGFzGEl
         k0CixDWx07bF4jRczNpIrsS52J5gQpccpy9JQ15S1Oq6ZI0j9TvgtJ9IBtaOKn6fFsAY
         C+i6zI2PjamxwsL5tBD9EBWy64h/0HqihQi+0AG3ZlhrQapp/bDD98iMRNc/nWvzDTie
         baWuAs5zvuUac3clMF0SznhM/icpTnVY9LxzRs8kYFPT2zMYacy3vnN+vR2eACnCZ9aq
         +yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=esOGYz7p8GTIoasqAu0AdlHqEcw+9VUKHF9ulY5dS3w=;
        b=vW1UFo47Jsb7uirm+tgq8FN675xqWmVKk7IKE204jbe76YDuzrO9rY8wAnb1hYemUf
         i5J8ouuVOPExwCMCIc9jkQ2ykYI0xaAe1X1VWgZV6FviRPS8o3Qx3AdIJs9zZJT3WY84
         xq2c68woKplUzF5IsXY59s/oLxpIQ5beKPm7H25KgwCV1ympL69b9FkEIWK0e9v5e+8A
         B4J//qfwjQ1Kd3dhvwfeoySYEBlXFzfafO/u6QX90gmvEnGcaplM5ty0w4KgDN6iQxzU
         2I76dWoct1KQm8J+RBzWpIsYTVSeuUf6ZytVchigS1LV4LDVoIu6eR9rYXp9qHA65lsT
         5JHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tkg+IwQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a05620a448f00b0069ee853a1b9si1619949qkp.14.2022.04.22.02.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 02:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tkg+IwQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhq1L-0003uV-KY
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 05:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpyZ-0002Ui-1X
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:53:19 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpyX-0000vW-HR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:53:18 -0400
Received: by mail-yb1-xb29.google.com with SMTP id b95so13556867ybi.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=esOGYz7p8GTIoasqAu0AdlHqEcw+9VUKHF9ulY5dS3w=;
 b=tkg+IwQtdNfutp2PNt0l75wFVwY8M2RqOWSRjJuv/7+HzLnefehMkmM3kYCQcQv3AA
 PoEIrMGf4hMi2B+XY4LKXTGJZ3/XjCESyQbi0z02vnjBepGcGM+E0SoCvQMBZrEb1TUo
 /BbaaZiyCs18AuyvAVfGgzAARePDsMIzzi98gYWSFvocOPzNtHUfGLRGyAZqGYViRKyc
 Svw3QfkcBSW7qymMFMtJrVjiRgEeWVOPdK0yTqUA1/tJhgxafR1YW8wevsewrptfeqYV
 AX3yLLrWc9MDyMTe04kKNMVsx+2y+xsVlDJTA5WoyIW1k5tqK3O17EifFc3JB1WBbjgn
 Dorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=esOGYz7p8GTIoasqAu0AdlHqEcw+9VUKHF9ulY5dS3w=;
 b=vZ+TkAyHy3NnPYJHqweAma/vSFe0tMSbQRkrypjX0nwHdDxKwDtllJ6S65INx8swJr
 y1ErsEOGFXS7UDyN9EMM8HdGdZccO8mT4UywO2FT7Z5dauVY3+ZJkZajaZbDOOjsbF5t
 2Ad+rZSVJbp9ICSe87xKCzAna0l5JQKE/OvIUQyvqXIsad3IwhXliqnMoL19nyiTpIke
 rqxh4AmXkTHd2xG5Iz4vtIxHqSVAJj/QhYO9Sqk3uwVHE9gkVFktwYwiu0M4c9kvp3D+
 g9qjWsjMla2O2h/AV56kWuZ07cS8i9T688pwbzN6CJ96qOUD5rVosqurCF0/oZvEX12w
 76fg==
X-Gm-Message-State: AOAM531ZtEn045zaUH4AOdul6o8n62SbEXA/2wWpDbXAda+I/6eK17IZ
 7aFqejRFWw5aldo9OWIh0nKn4psEYII8WxWz4ZEY6wvFnow=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3556029ybs.85.1650621196596; Fri, 22
 Apr 2022 02:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-31-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:53:05 +0100
Message-ID: <CAFEAcA-6JmeoDJFvhM4JV40zjh-4BtUjVbFDx-ofS_fw+U+dTQ@mail.gmail.com>
Subject: Re: [PATCH v3 30/60] target/arm: Name CPState type
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u1UG7bjGWZeZ

On Sun, 17 Apr 2022 at 19:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Give this enum a name and use in ARMCPRegInfo,
> add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
