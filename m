Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2194911ejb;
        Tue, 30 May 2023 06:59:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6fBuu66DqFGQIrlxq/98fVYsI2VNEx7EhLLsh2stCkrkYA11ts4IIktmkliOvzLYc+7r43
X-Received: by 2002:ac8:7fce:0:b0:3f2:ca6:1817 with SMTP id b14-20020ac87fce000000b003f20ca61817mr2278091qtk.50.1685455183349;
        Tue, 30 May 2023 06:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455183; cv=none;
        d=google.com; s=arc-20160816;
        b=W3W1wlZYs5J3zmuJUYptMUMS/8ng+ptKSd2gszOnbpGVPXdlD/TLPa9NHDc9le7fAu
         ML1P9RNufscHtx/C+iU9k+l5iMAPPcUOFVvmzr/1qfVHQa/rEjK41C1N8uAva+aBUFE+
         TjOhK60SS4JVwECEOnMrPWsBowok6exC2WGxI/J9fT9gYywauFurE0DvKFMdxPmM0sgo
         BPaobSPHoGsz21ODCDSv4TM96ebYmJBBblHIMEzZx+eR3ve1nzJR7RzRg8x60yfVbiZR
         y+4mV/Pc2/eIGg2E+1+POY90fvQPgGjwJtaPGxLmlMCic5V6yexy9Qv777Y7Nd0dGoSK
         UC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=f2NV/nzAmzu87CmtOJacnPUJa0EYL+neoGkXBE5YbWE=;
        b=W0c+Lz8AkeMITcRC/lKBMaaNSoyiCbGF2DbyUowvkGiR68mx93irCu8dEI7MDrTkUh
         6sQvm4A9/CieGptNpsruAKKkSwA4NSpuK6wiSeG9vKXO93lGzyW2lQ6G8nZ+aKgCnL7Q
         qiTJfJfdVxtSUk+rzD1BgQyyhT/Ihu7tXNISE+mprgj6OyON7VoFx+0L953SagFl7OP3
         PuDbAnBJfSoUmbrNfD2uu+YV2LEZRmE7O/z5J5k5Jq8fsCcrdt8Fq7atJ7ZH4JhLeGSO
         /45KyGjAY72Q803I/ZYjOT3nITBwD0rBZcYO/pLB7fVICC+QL/kQr8cWUHikiH9BsQq4
         6MvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCDXJfag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020a05622a175400b003f7fa02aaaasi6381326qtk.639.2023.05.30.06.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:59:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCDXJfag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zsq-0002I0-T0; Tue, 30 May 2023 09:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zse-00026R-FH
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:59:23 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zsd-0003Ez-0g
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:59:20 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5148ebc4b89so6551466a12.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455157; x=1688047157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f2NV/nzAmzu87CmtOJacnPUJa0EYL+neoGkXBE5YbWE=;
 b=KCDXJfagWqpQu0z598s+ztVe91waIQFJMpadxRKR7mal97PMWyLRfv36vQpFUI5e8y
 aVYZf0lapuSAe48jMD3HFdghNGnUM6xrfr8Kq/aakONG63CpnFXiM2f3EAHOnvu+nw0O
 JUSekbW4UuS32CHYPUTr5mU7i5OlaTTLK+agnMeI4GgjJscfD/ojxxYx/6FfjX6LPknC
 oDpOF5XXf4D91GeHR4upEiaI9KH1+RVCiwTYa24Yr24PgoJQRfblygQYBcMIRWGfenKz
 FQhrkUM1UONDS/jvqK2J/HrhD2bH1oAvTIF+JF3xucCVYlu+KZ/EJbbCQJ7NjcJmwUU5
 QOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455157; x=1688047157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f2NV/nzAmzu87CmtOJacnPUJa0EYL+neoGkXBE5YbWE=;
 b=dRyBljVS9Jl5UMMf0lZiVgQCm2yNiG7c2QsrEfLiI4BoEdk1IsoXnOiEAltULM5iZl
 HdIfTnIUYCi2tsmLPh8kgJGfDLmW45uEj77LRuMHYYq+OaRalohrBqUlVty/tyY67k5Q
 yZH85TzRUpCOvOO03v/NtxfbpLr8R+Ebqlu9fS9DPjhJteT/788xv0nxvJemZpx2Vxen
 ZA7R9vSiv5ejU2hhk0TopWfshQtFkgMcUhJ1CQc82YhUVNQjK1jiX8/gaDFJ5uW8OYaA
 0iwTGJbuYV/WblNb4mG38H56IdoJOPBgOeLh2cX9P6OWSalbg4ZaWijqzvX5FrbWQx5A
 BZeQ==
X-Gm-Message-State: AC+VfDz+ayErzFIA28hb+NevxAid2GVMbUQQLeJ5ki/YVZSh3fCH3fsS
 V2E2bFQ+EPKn+2UKvOIZyBFl93btBydvS81oeIdukvszGFzXeCUh
X-Received: by 2002:aa7:c157:0:b0:514:9d17:d6ef with SMTP id
 r23-20020aa7c157000000b005149d17d6efmr1855810edp.13.1685455157672; Tue, 30
 May 2023 06:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-14-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 14:59:06 +0100
Message-ID: <CAFEAcA_KVwR73Fvtkxc7DsVYA2avrefPxWF5YPbOQsLwsvb7vA@mail.gmail.com>
Subject: Re: [PATCH v4 13/16] accel/tcg: Extract store_atom_insert_al16 to
 host header
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
X-TUID: oFacew8FtzFB

On Fri, 26 May 2023 at 01:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
