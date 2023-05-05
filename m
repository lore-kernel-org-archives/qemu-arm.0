Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp384270ejq;
        Fri, 5 May 2023 05:36:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ405EZ88jL1MdYR8lE7bQYIBqiQM0n5NKwvtWyLcKAC8Xvj3usWYvm2KdrLk4onJfqK1If2
X-Received: by 2002:a05:6214:21ce:b0:61a:281b:9a61 with SMTP id d14-20020a05621421ce00b0061a281b9a61mr1874969qvh.4.1683290174661;
        Fri, 05 May 2023 05:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683290174; cv=none;
        d=google.com; s=arc-20160816;
        b=cJOmzLwVd15O2IBZ6wKy8yiJFJLy6SpVC77TrxQiNLHe8nsPEj1+fJv9fettzQgX9N
         +oCLIz59Xc9deroLLR/1MbV0gT1A40CCP0b8p6PqJDLiR/ezcRzWuiGKRqfF0CV8Redk
         izYjspe4ptTKNJe2QyrPuGXBFd68Cu1Bce0YAq/SCmtWPt5bKPi/5zNsWRecwQZ0P8LL
         ss0MIZfqaQN5ejitKADUqEwFtsBpgZb6fUefPbdOt3GL1ZWNaxP5ayeh7zjRZ3AmMKo0
         sHfUNG2kiSaNxw9mGhLlxt7jLVShkm5i7vnA9hmordOay/XbLUYXn0d2lsK/lsnI6Yi2
         gHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=282qbiXnnduELh7hkBMA30hUmbArrUsj8vwL5LNJ9X4=;
        b=V/iMDSpMAh3U+aqPqb93WeeJQShYzEmjbOq/nHqNe62/T8pE8kvH8PxDG4OkS4Gp0k
         Lwh2Rzc59Ni+9j5HJa+dY//Wqbt6H0sM4DFAd+npSVxFENemrQJPG1j9I/mOwlMOiDCk
         nEhHPlv8XimdBvVA98hzL2xEHQvoTaeSCF5vcbfLWTjfawgx4cg1oBCcOAQ8w3vBUX6W
         BTkoReJh/wo0PgAZC2J/NK6An5ic/pBWcCHcvXkpDu++ikGa0fkC7DZJgIadBgYwsphC
         6hcj0qnXVsIWudXiO8HNX7m51MK8YfWC4zJ37lqiAJ7vrPZKly4XBuKTSzrSmE+tJg91
         WjTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xfg7o4TS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25-20020a05620a15d900b0074de7342caasi601046qkm.511.2023.05.05.05.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xfg7o4TS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuer-00034V-C5; Fri, 05 May 2023 08:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuep-000334-O2
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:35:31 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuen-00050T-1a
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:35:31 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso3070921a12.3
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290126; x=1685882126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=282qbiXnnduELh7hkBMA30hUmbArrUsj8vwL5LNJ9X4=;
 b=Xfg7o4TS9VJwM5dEFINYVTvNyXTT27KhVLJncaVpsZDNOgR3nde3puo0Tra40CjCQJ
 Ps7UWu3efmuehxBHpJeYlfDL6zHWPnzKd90svHg+dQBnnT4GoCCjCWjb2eOgwmSPhuBH
 tMAHRDASEHLXVVi/qfbRkYF9NXP9o8jgEKcyfXw0PSdbeHz1P8+HbPKQ8qknl0IO5+IK
 yoRp5pgGJtNgmNwGQDPeXhiKm+cymPrPo0GwP/UAdhmF96eamsh1HsF73LDi36By6E/p
 MmGD+jF3dCiQ34G1zJsgdXYEoDuDxHXyQiDiJ/ZJ68RMuJrlY/Dv6obM16KzDePE3tRu
 4wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290126; x=1685882126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=282qbiXnnduELh7hkBMA30hUmbArrUsj8vwL5LNJ9X4=;
 b=hv7fajCyvdcaGhoG8Vbre2nIp7HiBCPHwPkXT2ynnPuxvH+AnQrwmYisrgglzzHwn5
 mOz6QYGe+Isj+gG5f3IKBW70+CWs9W8Wkb38hofKoguWhV1qh3DyBsIh2+3hRaYqKfDK
 Ff+o3Fi9oJeVFNyDWsdEdU/RNqi26nQPUjRLWHWqbHBjid60kVBbFTMyS6zYFjqQatrU
 BgHZwWFk92pbV/t8o9eDLuvkNjI8HG8Ax3thW1Md9Jg06RU6UGCIkoIzYmNYR+2NSXJ4
 Kue/Xjhdzr6EUhMUDX5YopJr+5KKNfxnoFIZYGZlT+tFp6RuYAYkvYWJbD7xwTAQKKri
 Ya3w==
X-Gm-Message-State: AC+VfDyP7Q0+QFqxs7Si39gbgLJFFkXN6NPWLtt9kkz3UlrWqwsLoBOO
 2K7gcrqxTzwM9XI4+56PBYO8CbvkgBwcc1dfLhOgwQ==
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr1429278edc.29.1683290126188; Fri, 05
 May 2023 05:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-38-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:35:15 +0100
Message-ID: <CAFEAcA_K7Nqp-4ovoAtySMY7x4f9LpBMgv6HQtaMvBs4Fz9x5Q@mail.gmail.com>
Subject: Re: [PATCH v4 37/57] tcg/loongarch64: Support softmmu unaligned
 accesses
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: 9fjfou+y75nU

On Wed, 3 May 2023 at 08:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Test the final byte of an unaligned access.
> Use BSTRINS.D to clear the range of bits, rather than AND.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(at least, it's the same general shape as other architectures;
I have no loongarch-specific knowledge)

thanks
-- PMM
