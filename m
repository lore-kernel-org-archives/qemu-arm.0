Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp529375lfb;
        Thu, 9 Jun 2022 08:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb+YZpWoJr0AAszto2kyJU7EZisVxQWFKLl1mSNF1HaRKygaNQbUYCz5HAQXbAnfQPjSju
X-Received: by 2002:ad4:594d:0:b0:46b:9c03:4fd1 with SMTP id eo13-20020ad4594d000000b0046b9c034fd1mr16904171qvb.92.1654789761561;
        Thu, 09 Jun 2022 08:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654789761; cv=none;
        d=google.com; s=arc-20160816;
        b=GXFbuXbKNANSokPLY+toBTsJ1DKygLF3B5HnzjUfBIJihPkVEKLxjk5nN5ovI7+qzb
         vOnv+O5GfLSvz5o0KwhEpBVvbVaYF6Qlbu5/ahO90f/dRwWKgs+4hjqaSi7IGIa5NClg
         tJVvPgTCM3xThi+f7Zq3fGWabDRBdyKPljNPJE9LaEr3n86AH0o6R3eLgFqIBeQsNKMu
         e14axBK/WpExDVktDy7iQzwiKij3bwoQatqTWh/8uaHyr2GQM/qqYp5YUXbrsUUT8wc4
         MuOXKFjDcGYmYIpORgmeU29MTI7HHznbA0StAiKl9I9i/bVi/MGJYrzGwn8D8O0o2eBv
         JALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RMDRtXscsbGYkR4Uv79n2h9y++K9vAWqtBZBaIGPY1c=;
        b=G62gQH5KUtlaFQvwqPb79UXjJ0lZWfeTglhiqoCJlKrVMZ46koQX/xOiDpBcADgG4V
         xP19B/RIHJq+JU55leapUx+m21OoAlv1euoAMEfHz+/n+d8FSHmCqqms/gRF3xiK33jq
         u8Rr9ZH2Zz+GO61KyCoyUz3F/ZnWAH0TVVikzOrY231hF/LooYGAukWRxu4wjh1EvQyY
         IT27yOQIqaC/Q+xJOtwYohprJlAtQdVDBULPruvmLXR36dNswkVbener+rnyygoKdBfV
         KcEA25wBlsXv5ZCyv+O/4/aCElrwTyZ7US57PJRcatzsKhSErRsB5wF6EVgi0qPn9cgQ
         /+yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/KxfNfs";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020a05622a00c600b00305168db4b9si268121qtw.199.2022.06.09.08.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:49:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/KxfNfs";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKPQ-000484-U5
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK98-0007FQ-Eb
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:32:31 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK95-0001zk-U5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:32:30 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31336535373so94159857b3.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RMDRtXscsbGYkR4Uv79n2h9y++K9vAWqtBZBaIGPY1c=;
 b=D/KxfNfsxkThjHqlaEgOt8KQcyN3yMKeOKiCBHAUirnhqFJCmeCJjf8Rqei+5L+cns
 VtaOzN6fOMSUAWDkfffX7zOcIIFS0Kuhie2ug5q8XAYSDM3kKTfqAhYFwGL4oK6v4C5Q
 rLVNivmRN/7oxmjKopWEgzd3n2pp6uGKN8mAEkShB8JXw8ASH46hH4XbCP9d+DZCn6vy
 1We4Sol8KIM5/qGIy+Yf5H87YxaSUE+cySXQ0wFBlvsvARuIl0cGRjAUudziAqaAfOte
 XvYUd2QDjVJ/b8lFKQxbd2oEXwCC1AbXeURZSH0+ltjjuy9OP23ZZ/HyrLW8tHsYv1wU
 8Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RMDRtXscsbGYkR4Uv79n2h9y++K9vAWqtBZBaIGPY1c=;
 b=eQLseYJLP1dWqedxGlpUOOtxhnKzvGsKBJUP7YbC0gsAPmNMgXxRQTFmU/76N1uQOx
 BmOaaB4UzAt1+oCkMUTCMDKNzbSImQvdASGHT+Uzlg9kCfNT7URNL5GO/9MwV9BX3nXu
 1UHZk+pDwKFv1n5hLlIQMuGHOxc4gf3vlZTrT9j/wEnZlIukCNgxrmVaUXg2oEoz0vuZ
 AlAvlq1T+G8QzJmrzTUwGiRbEjZsCxcyOOcbSG5oT6vnTob/AF7l7+QY6HkVmW/ANs0w
 /cABiiA90u4grP88KjxiszP7wwdSlOaWm7eVs5RRedms/LLswbOBIhhVHvEZ1QmkQg/4
 92GQ==
X-Gm-Message-State: AOAM5333ZVHO+VriKNbIRbi5E+E5AbWBSKP4qRw/q12IngR7U6bCmzDB
 4J4HCe9+0XB1ev3Rw2qOpdraZw3RZ+fS18NW/KVD/A==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr43786100ywb.257.1654788746496; Thu, 09
 Jun 2022 08:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-37-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:32:16 +0100
Message-ID: <CAFEAcA_zntaK1+Pc1UFxM+Yn7G4tuNwkCvw25chWjbjg1yqQ4g@mail.gmail.com>
Subject: Re: [PATCH v2 36/71] target/arm: Unexport aarch64_add_*_properties
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w8NHrlgDDJXh

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are not used outside cpu64.c,
> so make them static.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h   | 3 ---
>  target/arm/cpu64.c | 4 ++--
>  2 files changed, 2 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
