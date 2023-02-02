Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp614995ejb;
        Thu, 2 Feb 2023 09:55:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+neEyVoEoWtBhcPRsSfLz4W6eHe6LPh2jmMgIi+2RXSKuPJGYZGFIygMqMgEtIMvht1lTZ
X-Received: by 2002:a05:6214:2689:b0:535:5ec4:91e6 with SMTP id gm9-20020a056214268900b005355ec491e6mr15266368qvb.37.1675360514056;
        Thu, 02 Feb 2023 09:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675360514; cv=none;
        d=google.com; s=arc-20160816;
        b=izCQjVeaCzcbxxUkKoxZUc5z0Cfh0ww5cL2jKsAPjG6V94rpVkkI8LO0rvXToZbSIb
         NteVvnINlhGg0U/iDA2aX/vVnWJlAO9/3gsoQkXtVoWU/DQHqXJTUSRQ2h7wlTd8U+AH
         Q7xBoOLq5kY996Q41Psjd2lDENlFzNHQ5Aaupql0cOshxQQUbQ4xucQjj2XeNoDU49Td
         G6wtSzrawVlnlgMg9YllrU9OeWtVtxIOZ9Nl66gBBaYIMSozYekMI+EOoA9TE5QfHS3o
         tFwDWz+fPW2AwcwHyqyqZn1QG1TvrI3e12Owpd0ToCITd8SZVaPAaYyVAdI+2v7PrSdD
         rL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Mqn3NpZa5tHS+Nc9Z2WDd3scfM2ROaY8zfZ2BoELDSk=;
        b=KUydr9C8UIe8DZsux+imadGhqkVY5zpoMnduAQN155ESqdYyeHFcCFPsLVVH9Uk/Au
         K//8LXr/4xLX6pCVBu6FlVl98T9BBRe769nGaqa9aCeh9qz7YooCN0qUD+dJIaCyaBl1
         1oTs8WtG+1BnxyuZ969bMak0m+BU9SVTZbxUflwi2UYdb9ZX/8ztroTsNULYW+NGocUt
         tnWnqnXL7VUW4kdp4j6BQA/hkOMIYe3wpjKpyBi/ezV+PyFI1ZK5hteGeuzDzahybkWt
         WsyvGjaFgIPAsTz+SyrOEacml/UN85fTQrNwaUa8F0IgTZiZ0PlgTP43RUEVzy6cTIzg
         vXcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lq69CVyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lx16-20020a0562145f1000b005377fc90195si12899748qvb.240.2023.02.02.09.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 09:55:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lq69CVyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNdnO-0002Y0-PH; Thu, 02 Feb 2023 12:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdnN-0002Xe-ER
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 12:54:49 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdnL-00011D-SQ
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 12:54:49 -0500
Received: by mail-pj1-x102e.google.com with SMTP id pj3so2641611pjb.1
 for <qemu-arm@nongnu.org>; Thu, 02 Feb 2023 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mqn3NpZa5tHS+Nc9Z2WDd3scfM2ROaY8zfZ2BoELDSk=;
 b=Lq69CVyHQU/BMy8ppikIrlnQA17NPjJIsUO3yRIpRm/qbe4u1Syi0oHFHH8BkOfE68
 2tFLdbsWIPMOcUkw4/QQumMkOgH3XRXjeNWjWHkmGsDwSZlo90xdAUrbOjWJX2E38in1
 P+B89iHeNIQk2pv4gX7BTWnT3d+dwYwi3yeJkk7w7upXqUBbxL4faNqF6WJAk5RP6qBt
 CucpWoaeyD3m6k6MWoGHnM6W6Pqo9Pwoo75JFuqyRyOfSRZ0Tj6hw0NexUqmIPGZCd5/
 8rWV1tk1HZ8uSkZmT+sF6h4D+JPKuTYWnu3AwWpPVOo0bPKgpmUqt4Y53QXvLCy1gAOh
 jWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mqn3NpZa5tHS+Nc9Z2WDd3scfM2ROaY8zfZ2BoELDSk=;
 b=qla5A5SAtq8F1aaX4lE4qxx2mdVGia2c7JlLBZh7R4+re7sMwA0cSnxSV2wnjzn1Du
 M49QvZXwWdx9DTvcScsjjmJsrpjFbXd3D4tHFJ9Y0JzRgfHLjcJCmpm2n/g54fgshXp2
 f57pCAX6bxtc5eSohS5PVqAEsOxjY0Waoyjs6WvQPbOhKGv9eTtPjny5E/RpM7G2hsav
 O9j+xLL6Hjc4Bj8t2Tm0qs1iGFmCntgGDSA5KQYvMC+4CPqNLeGQDE2ldJ7eI58i/hCE
 0nkCRQylNua/0Iu5y8b/qY0fgrIt4c+xpJcE8k6HID044a6y/tnS+FUPzWCDI53cr8Ot
 6M1g==
X-Gm-Message-State: AO0yUKVQZ7Zc2FbGITckFyYewUiWl+1i9CBBYCZVWfQGdVUEXKC8/rO+
 Ax8PTGPeJCcJ9PWB5EstF0Z9Yj5j+zPyvuF2Pp+H3g==
X-Received: by 2002:a17:903:1c8:b0:196:3b96:6a1a with SMTP id
 e8-20020a17090301c800b001963b966a1amr1804253plh.28.1675360486048; Thu, 02 Feb
 2023 09:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 17:54:34 +0000
Message-ID: <CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0xr5WquR213mBUBg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Series of fixes for PL011 char device
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fLVna6ISIxTk

On Mon, 23 Jan 2023 at 16:23, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> v4:
> * Fixed post_load hook to be backwards-migratable
> * Refactored some code in 5/5 as per review comments
>
> v3:
> * Introduced a post_load hook for PL011State migration for
>   backwards-compatibility due to some input state fragility.
> * No longer touching irq lines in reset method
> * Minor changes based on review feedback.
>
> v2:
> * Moved FIFO depth refactoring part of FIFO flags change into its own
>   commit.
> * Added a reset method for PL011

Patch 5 in this series breaks "make check" for both the
boot-serial-test and the migration-test (both of which
have some simple code that writes to the serial port).
I suspect in both cases that the guest code is just not
bothering to set the UART control register correctly,
because it's never needed to do so in the past.

(This does make me wonder about the utility of making
this change -- it seems likely that we're going to break
naive bare-metal intended-to-work-on-QEMU code and not
really benefit any real-world runs-on-real-hardware
code, which is presumably just enabling TX and RX and
leaving it that way.)

I've taken patches 1-4 into target-arm.next.

thanks
-- PMM
