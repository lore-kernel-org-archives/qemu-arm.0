Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp705912lfp;
        Thu, 14 Jul 2022 07:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4dFvNumSp+tt+jWiIHxnchxHdzqPS5TgfE4mc4lw16VbLoVlTTrIX4VGuwVJ6F6O1OXfb
X-Received: by 2002:a05:6214:234a:b0:473:1fc1:f369 with SMTP id hu10-20020a056214234a00b004731fc1f369mr8131697qvb.126.1657810572260;
        Thu, 14 Jul 2022 07:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657810572; cv=none;
        d=google.com; s=arc-20160816;
        b=u3Uh0cwLAWZQCTz+1Wvy6Sla9tso/0hn1y8KNuBqHc4jQVh8aUITbrPpqJZjFw5sCw
         woKYIVCuqELhnBx8RO0dU/woqXCTUHJurUZ6VLGPiSEwRYA19fnvkZZt4c2Cer/GrDph
         27eU+JTT81v/W9lOMVkGq14NZR3Pc+sXm8giDsi8LwUDWzP8pVd8m/6jB48Qb1yFqhH9
         s2MIjYHLniMSRiD+RqZh/kC+f1qo/+U2WwHIEjoUh2UFsD4WQ/IAttfjMGPDjq/dBJlu
         UuKT+Z1fVSX6vz1rguwBI3gfH4JAuki+P55zRBAL1l2Jl13vl8NGI1+GKIiED5TFdOjQ
         OOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MF5QBLsJoRUzRKP7lOB7cM5bA62ZVBoaqxX+YzV7m7A=;
        b=FURmEZwH4lNsRW9Opgs+Pp1zfAXHNW2YQgokVoKz4ugbwCNwTZGDqc/TwG/UJt01kb
         mUffMVGF8X2ag8OGJ0CWsQJR0DEab+R/DYahLfDoq0NHk5s8EchHxwEsQ0tKMUqewt1B
         nn6uXm8wobT6wiLETnPSlh6o9Ljvju1gSOk/PXrC0DJRKIbWVso/s1lJcei6emANDH7e
         eeAQMIur3nGKxWAfYtPRPkyApNctj06dYstrdqHgxWr4FO47uof26l035c7G0k8Hkbfr
         ft8d3uQA1fmxFMqI1RfoKt/wzZMH0c/10SIfLpkP8ADp4kqZGNlE9wm8N+VhCAOI671e
         XE2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaNozfGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020ac80602000000b0031eb593c232si1030550qth.353.2022.07.14.07.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 07:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaNozfGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC0GB-0001BJ-PX
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 10:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Fd-0001A8-0C
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 10:55:38 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:33751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Fa-00068E-MZ
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 10:55:36 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id y195so3713702yby.0
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 07:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MF5QBLsJoRUzRKP7lOB7cM5bA62ZVBoaqxX+YzV7m7A=;
 b=iaNozfGJGMtUJHYcCIlF209+i7CjFiYz3QRI8Yi4IlDozUn+aLEfYagN+8ey4e5DFK
 QZA63Gg6nguFv9172y2FQQ8p5849K1Ypo/tmz14NFMKQUg8MQ3Jv00eOCur8MS2wZvpD
 8mzYyPgu0DAegBSDkScGeGDFbY2rjVBPXrXgr6U40PTw7rpr1KmW3lee3CZmujcj+gK9
 XpSc1EJk5T9wIdrvTqKyWiNoDytM60iVQcK7Mia01pzOKLBV1JXBZDKbWhV2Kyp732E5
 ckH+9f5LuhDMqhT4CD2k1wJl4DzRLHyyR54i99qhdAkxtsGkNY1QoTKIROnhuFibVVXx
 IcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MF5QBLsJoRUzRKP7lOB7cM5bA62ZVBoaqxX+YzV7m7A=;
 b=rwSOVJRFO1gCqLOmdbjAFIBsH138EYIVwkSK1ET9saDj7ozvIHMERHNyErgLLzFXlk
 LexCvoOLt4vQjwU6cNomZMhQsF+T+df7mssyCxFmIvUAibqBcrQOj7j28fS6ITvVI4qt
 PNJWO3ghbjYL8ql5b6iHnxj3YxcehJaRK/RcQ82g1bipTtiEJnH6XddVSc0k6DrX1zl2
 TwB/StBSlgdnP//4CTbCX4kBlCVf9b4bWEDOova9LvIOrHtIULDmSpHRtnjsNRYTqiK3
 pda+0QAUwsrOYEhHvegmjE+g9b7HbuMuOnLW2ZIuue7iGYiWcdiWDq9ozq3R6E/NNip8
 eXUQ==
X-Gm-Message-State: AJIora9NU6zHwBDTuXUr4DrckI56IOe2EOXoL6HecZamyPMbkXqSDMu6
 WIdEL85Ng4oo9JwnxOScPvk8mYE8D+bprcWlVz1tUw==
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr8978176ybm.288.1657810533357; Thu, 14
 Jul 2022 07:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220711031420.17820-1-richard.henderson@linaro.org>
In-Reply-To: <20220711031420.17820-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 15:54:54 +0100
Message-ID: <CAFEAcA_E_DFixo95tSTFqicuJv9CMEZVDKtBE1QDeVy03R-3WA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/aarch64: Do not clear PROT_MTE on mprotect
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-arm@nongnu.org, 
 Vitaly Buka <vitalybuka@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Sg1i8tcc/dC

On Mon, 11 Jul 2022 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The documentation for PROT_MTE says that it cannot be cleared
> by mprotect.  Further, the implementation of the VM_ARCH_CLEAR bit,
> contains PROT_BTI confiming that bit should be cleared.
>
> Introduce PAGE_TARGET_STICKY to allow target/arch/cpu.h to control
> which bits may be reset during page_set_flags.  This is sort of the
> opposite of VM_ARCH_CLEAR, but works better with qemu's PAGE_* bits
> that are separate from PROT_* bits.
>
> Reported-by: Vitaly Buka <vitalybuka@google.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> My initial reaction to the bug report was that we weren't treating
> the other PAGE_* bits properly during the update.  But auditing the
> code more thoroughly shows we are -- it's just PROT_MTE that's not
> up to scratch.


Applied to target-arm.next, thanks.

-- PMM
