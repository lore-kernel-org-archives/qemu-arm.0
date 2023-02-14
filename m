Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1368537ejb;
        Tue, 14 Feb 2023 07:30:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9D8RABT42DuZlazJ3KGpfUzi0xRwRR9aTyOPJkIGeRf2QanvG73W2iBQUXIj0+2LPwUQxZ
X-Received: by 2002:ac8:7455:0:b0:3b9:bc8c:c209 with SMTP id h21-20020ac87455000000b003b9bc8cc209mr28168373qtr.20.1676388613274;
        Tue, 14 Feb 2023 07:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676388613; cv=none;
        d=google.com; s=arc-20160816;
        b=MSkc7A6sGdltb5BX18wJ0k7blr9VpXdG3x6sU73GpINgKS6Ji8YNP7mTuou0aMqwKu
         w7lk+WHVPZfx5gqdH/YBBL3sNCJ4oB6wiJYgLBLbmRMeEFqm/flLybqq3gXZS4HXO422
         it5bRqNM0hFvKrGWbzfyQVEXytCwymefcYgz2nfDEHl2mbQU+vv4gTBKUP6ZbDytGE0D
         uO4TSdwmi/TVOOMjbL4JT7zEDgbydpY5fNo+6U06N2xFZaJ+ToMvmTGuASfUp9u5shEO
         N3y7OyrXXVfBOlqI78tr5M1lDST1svvms2ofqjIvV2gh3rtZ6d7CcOxnG1XKmMVNi6eo
         eE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=F1T2xqLZi9PVQQPcJgXUm6OT0F4txirmsGj9BuylUFA=;
        b=j2q4w4j17lJesey9kErzPmwoKifU0YROnhZbsFbUfpBGmjJwbPoS+/PN5XoDz5NVoz
         3GV5jDotOtMIEpr/ooPh2xYhXO/WSIo9Wxyp+j5tNGwVQUtWyGh0Ylw3skcumawncOyh
         BnTYgA9f8FvSf/ooJ5ItXg3+JLELznzxHYfrkK1M48Txp0QdhAK8aUzMTz02g6DRHewE
         LPeYs2Q0EV8zqhEtX9kYhouhRCBWdaUp09SeWeD9Kjd401q0lzj+2HhfEwioEX8jDtrU
         NpXWnOHmwOLHIw+hh/pHqTcrJKhGzw9k3z7oGbkJEpah5PrEOIRIqhtWPC3YHlcNyfVU
         wZYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NN8RQqBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az20-20020a05620a171400b0071cfe05b82esi12561129qkb.105.2023.02.14.07.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 07:30:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NN8RQqBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxFW-0007cN-0S; Tue, 14 Feb 2023 10:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRxFU-0007br-1W
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:29:40 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRxFS-0004RT-Hj
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:29:39 -0500
Received: by mail-pl1-x636.google.com with SMTP id v23so17423263plo.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F1T2xqLZi9PVQQPcJgXUm6OT0F4txirmsGj9BuylUFA=;
 b=NN8RQqBgfvAq8Vc9WnPhtFOd+RP/ZnkDvndo1zZ3QYWqA+uSI+xpCko53vvmFIZsR2
 /fiOotpkJdOBOa1BdZlGtPBWzU5s3z8LchrEjA5jjhoOtHY57zk3Dqqrk39ZpULpEbWk
 7BS46r4svN+wD0t7cg6cSJlKX3yJsUOTz4NWhgGezZ3fpaDVAGpffUb+R+uVtAVwm30M
 Fw5047UsGftXo5VB/71l3lm1IXNTpilsI269vAFjwWzXUgiiplWgSYA+i1GHkRjCpxRt
 vpOhwq4NcxtRQjRuxDZQCrmfkQYANe+LLcPa9ENBVGU/mnn/zFAI8pP+ni33BzBJorE8
 z3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1T2xqLZi9PVQQPcJgXUm6OT0F4txirmsGj9BuylUFA=;
 b=AyVnPbDOd7FyuezmEbE/0M4lbBuwJl86aU+VxGnxze6UPbKuieWxhovDUdWlL0KAIE
 XQ3GxpenaEn98W/oqscRVa7fNKq4Lc0NE225OuwoeLKvwVQFWFNqD/M0LWxqYlvV5hXe
 ASkwcBCfcwRQB22awAQVSGDVCCLd3CM7V/URIe4BGIrZHfDCNbdduAIcEqXZHTW/SGuy
 M+3W0+MaqdU/VchMyNRsmgYbYbMTRm2k4wIr5OB7vRBP8FxOjWlT/VHA/03tLEZaoLeQ
 o6/YPdksU70+B7MCxlgWkkP9sgluA24GIuVIhimRj3kvXhRe03vh718KnZkOmR9F/Bha
 yXuQ==
X-Gm-Message-State: AO0yUKUHJdS9QQDQWjLqr0UU4FHI6SQsn8NrND+9qXNB1Itn5dNeQEB+
 SbryfPvvMiIWKt8gffHy8Kt0wtTgtaFGo1/4tHyZmw==
X-Received: by 2002:a17:90a:2a0a:b0:229:fe24:91c with SMTP id
 i10-20020a17090a2a0a00b00229fe24091cmr537687pjd.16.1676388577038; Tue, 14 Feb
 2023 07:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20230214094009.2445653-1-smostafa@google.com>
In-Reply-To: <20230214094009.2445653-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 15:29:26 +0000
Message-ID: <CAFEAcA98j4JhCytFsH_OPkxSkfhXRtX73cb9ieOmBOH6SFCR-g@mail.gmail.com>
Subject: Re: [PATCH v5] hw/arm/smmuv3: Add GBPA register
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AB+O304qaxzz

On Tue, 14 Feb 2023 at 09:40, Mostafa Saleh <smostafa@google.com> wrote:
>
> GBPA register can be used to globally abort all
> transactions.
>
> It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> be zero(Do not abort incoming transactions).
>
> Other fields have default values of Use Incoming.
>
> If UPDATE is not set, the write is ignored. This is the only permitted
> behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)
>
> As this patch adds a new state to the SMMU (GBPA), it is added
> in a new subsection for forward migration compatibility.
> GBPA is only migrated if its value is different from the reset value.
> It does this to be backward migration compatible if SW didn't write
> the register.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
