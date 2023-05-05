Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp409815ejq;
        Fri, 5 May 2023 06:15:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5McqAHd6NJzrZCoMjgvcz+z45nC2laqWUlC58tNkCmFbFb90wZoWOBfXdOYD1T8EYGunSz
X-Received: by 2002:a05:622a:1045:b0:3ef:5847:d7c8 with SMTP id f5-20020a05622a104500b003ef5847d7c8mr2178339qte.44.1683292522415;
        Fri, 05 May 2023 06:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292522; cv=none;
        d=google.com; s=arc-20160816;
        b=aJi/G5Q93BmLFgZpihNdMZK7kht8zwsz3FgcN/jJTz50UoIarywqwktaCdstpDVL0W
         +LpXoiXwe1izWdKNuZpSpsLbY5+f5s0ApdQSbMnf0SHvy2Okxqz+UXzpU73rrGe/EXBR
         0Ig6+AopJI7DW/qda2/bKXfjTKIoPdh2JP0vy91p8XsNNv+N+xn1NlEO8Nc6Wb/PZYKO
         +9NpazXRqeA++mw2wvD1XDEuQLygjv5YQV6NdqubA65T57fU5MSpADHeyqB5yOZzQOoJ
         GD2PHNKDohBoW+Mk6/cn3lPZIVge0aPjxDDTAEBlFEMWTocO9o+x06j9xb3PJII34so+
         7cpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lzORy4UG7h0NxrjQALAA3hPpEcdKUd2ESwlKgbn0Ci4=;
        b=HiWVXv+npwzydE88ccVga7fiQiOPdRIWEbN/t3bDguyAMSTnJXlYxjCR6nqsnuhcB/
         1tyUG60fnWKf6cW24oXUGnFWNl4Es/9bFMQ6MpuvUPd5VGK3cpfxv3QIuOSUk5OnyWRY
         FGMvchEi3j7030y86np6v4wztJSVHyJfSpAmjo8Y2mIjZ9H7hmzfnRUKkfZe2sF7trho
         7z38AY7J8FNwSqlhLg97lgz9kfwvh/hgt9F55f56AEqu62W3Gu3VUAufCYdldMQTaVu3
         AodtmVBuf/solwfiOv/OPK5qHN1f9rLzQyIVuBi4XZHb+SYEZULy1PlbWyNvBXzQFOjx
         jxTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SndHSfVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020a37f50f000000b0074ced1ef870si626281qkk.650.2023.05.05.06.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:15:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SndHSfVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvH5-0004Ng-0E; Fri, 05 May 2023 09:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvH3-0004Mw-I1
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:15:01 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvH0-000575-IV
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:15:01 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50b383222f7so2623716a12.3
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292496; x=1685884496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lzORy4UG7h0NxrjQALAA3hPpEcdKUd2ESwlKgbn0Ci4=;
 b=SndHSfVUH/Dj/TUJbW4T0Coc7ocpIb0trYjZP/PpIwnpFwh8ppuj1eZj5rsFYiXU9P
 q02vrj3ek+D6ApFG7aRv7/0UQWF4GA1Sy5usdjioN3IQZf6Xq4aJfJ/o1xr5XJWUlvfO
 IPFVi/8wY2Dx2Z8o7BGq6d4cdbu8zK7BygHPjjlVm907darKgMvFnuRESoDE16pGwHkv
 Qvhqv5RL9mloa6vI18JmC9d4P3DVUIDPnhdXj990LZ4+LyIVWgp1RY7MSP5MTse9TL9n
 fosSRr9GZSkVGEa0dEDzfqrBXSajWvteO2x5C/sMmQvUL+R4U092EIlBYKcw/ReMecTO
 lrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292496; x=1685884496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lzORy4UG7h0NxrjQALAA3hPpEcdKUd2ESwlKgbn0Ci4=;
 b=EM5YVvdYbIO44JQBxiKkT0oJD6NMntsKCHxfLurNfvSKtoUX0szqOseZtu+G/W00eg
 GoKrJOZqK2mp7jqUecuUfeBQHqZDTrmtDCTCQ1jVF7Nj29PczCI+brKurTRn4ADP6hsZ
 RThAGyeyyT96VxIHuSBLztfHGn+94rN0nuPNbfukePHSWIO6k2e8bUjjXDAL2igaEGKw
 9QA1vq4m+kRqQd9oB/huXg83FD71mUJ3xRJ3eNkZpjSc+MpBg8bB14LEthZwyY3gV9gJ
 ZvmOVb/qbnOwSgRr5IfCW+4w70SXBftN/FYGyIVdnlClwjFytyHb8JwEMqEvftY6zsxn
 4wOg==
X-Gm-Message-State: AC+VfDw/prEJa1LINQ/5gxUh4BMzehn2LR2BBM3jH3LYVdnRLMS9hZH7
 zHlVUPULPJDuDN75nyoQM+a40r341dfqMm0S0b1uHA==
X-Received: by 2002:a05:6402:74a:b0:50b:c3f9:8512 with SMTP id
 p10-20020a056402074a00b0050bc3f98512mr1287706edy.14.1683292496398; Fri, 05
 May 2023 06:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-44-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:14:45 +0100
Message-ID: <CAFEAcA9y3W7BuaqUnMZ7gArAYJT1gz8K0zED1QreDgDuEY2gtQ@mail.gmail.com>
Subject: Re: [PATCH v4 43/57] tcg/i386: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: CFDZ5aR4MhEZ

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No change to the ultimate load/store routines yet, so some atomicity
> conditions not yet honored, but plumbs the change to alignment through
> the relevant functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
