Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1183170lfm;
        Thu, 25 Jun 2020 04:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9e0T2FX8qgdHsI2KSwSZqsw4DEH2il3GbUk8fhdG11i74ElMHG2nf597B5nB77uChpZuA
X-Received: by 2002:a25:cac6:: with SMTP id a189mr52227756ybg.238.1593083613309;
        Thu, 25 Jun 2020 04:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593083613; cv=none;
        d=google.com; s=arc-20160816;
        b=BBNuRMzRHR5YIqmlTWLg60xGxj0ewVFRY2Iq/5C927bREU9w/N8HAfDk3N/C0U/3sW
         gbEYJMQ5zu8M1B4t3gDhKLhUZY6wamR8RtbUuCfPJ3qVybrnvt2QgB0mbvTryd0j5Obg
         HVoL+3Smsz8QUGP3PXia6jvmp6IMMDBUdY7+780KI1d/VJhzBreZDwytvzAoNrSJuqFV
         sMzHRbtv3ESCjjpNpDgTMp20oocieMhrslGucG6+8R8bM4MoxxvEKkBtCK7tfmQbXl58
         ndxQ/yvMkqZQYdrJIAr8Av8enQMzovuNjQ/R3GD86lwkU4KHqO/yXqiM04FsKCd8KF3r
         qZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5D7Cxn7b9MsMev/P/1/7mvIgigKqkFhH9vyQhINyiOc=;
        b=mzeefx0BAbxBmtzVgATqDNV4gTBycOARhbRqOinuQ3ydbCqZb45hEYqEhJaIIDNWfg
         k07Fb0LbY8kPj+kZ9t3h7U412KhuVdBXqa9IKIPlkk7LlQVlm8Cc8sM1zJYkXftTt7Ek
         ket3LcglIi/qe3Z1/Gqr+x298EGN534MM3psRJx9J6f2e9I9YXLpVKAgU7jZbGL1cCbt
         t7homs5549CoiWcOiBMu1l0wgAth70wBrdj+v+atapXaEHg5b9k8VQxPegkX5Tj7tDBt
         7dCLU6ayRIZaS9A55pCwNDKK/ZUXdtG5lpNBBeGnotcUVc2vwsHi6YX+fkqfgneydSh2
         rQJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yg+Fyd7T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s128si25532478ybc.297.2020.06.25.04.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 04:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yg+Fyd7T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joPoy-00013P-Ln
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 07:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPni-0008GX-BV
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:12:14 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPng-0004US-L9
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:12:13 -0400
Received: by mail-oi1-x241.google.com with SMTP id s10so4365132oih.10
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5D7Cxn7b9MsMev/P/1/7mvIgigKqkFhH9vyQhINyiOc=;
 b=Yg+Fyd7TTwJJhThkhPGLZEODrmlVOMS0Gtde14LYyrHkrG/iYdYnI2wfFu2lP1D88S
 WoVVc2OFZGD8NZUTnGaDRgg4KHIdAQz7GCtWMHOBMxlBETiUDWGXJrpsiR7XxMhgICs+
 IALOI96/1KjkSHr3z2BOmndtcTSyEDz7/FaYKjE+kRSxxM2PiplVEQ1Y6oXcW/bqRrSf
 zT7OEUzOGTPgJ5/54LKMRM8/7BnnL8wOKowpWeNYwIdrntSjTIIFE08C8swv5QaYKwqe
 EZ+8ifQ+aGEQ3xMxSA/h0NWNlkSHs+p6+cs/JwrSOAogt7mgJ6AthBN8ksem8F0K2YDp
 fY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5D7Cxn7b9MsMev/P/1/7mvIgigKqkFhH9vyQhINyiOc=;
 b=BgKiEfe5pJKqXsdo89SNWDwMiW7/+rjmFz3sA2cXzXQp+Ru6U7TzxPgc+HKJ/af1Qx
 WmefsB+xmE662Qgdl9PFUVRO5D9S90/NTiBX1PIiTKoCqZ2Znh/TYgW9bP7oWAor2Sri
 lTR+mqB7JCfQ9Oirqp8Sq51pTfSHdJDN3nuNv8Up8KJU9PgYcPCPwSHWiV3Y8JBGQEcz
 WrBEraaE95o38vuvC1pZnmdPMlWed0UlQKE/I5G72rQ2oRDFGOfNf78JczKRhFxePxnl
 YCxTz0Ujc/N0G20BJJurT/89CI5oRmRwF6YU9WzFHgQF66iUg1gu2KbfkCS11QJX1++j
 5opg==
X-Gm-Message-State: AOAM530ZY+c/Lo2YThs3gK2rCnO7xoUfMdMP/WBekPrF2PXOEUB4j8rr
 uO71q4YVBRNMa2nbXQaxOKEAknqrbbr0vyQ96y6MgA==
X-Received: by 2002:a54:4694:: with SMTP id k20mr1651453oic.146.1593083531242; 
 Thu, 25 Jun 2020 04:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-31-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 12:12:00 +0100
Message-ID: <CAFEAcA8+zRSz+mvq5n7tLt4U3kwfFFpSfCnOupBOTWy8OHLgAA@mail.gmail.com>
Subject: Re: [PATCH v8 30/45] target/arm: Use mte_check1 for sve LD1R
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EME+XOJLte/H

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
