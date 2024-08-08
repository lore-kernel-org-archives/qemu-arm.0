Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp424230njc;
        Thu, 8 Aug 2024 01:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdcS6JhevTtmrRsfiga3XYs3NnVWbkXSglqf7V2k0r+5d3/fCMuWyV6fUwg2ZOBtYE9FZnNrYlxiZffw==@linaro.org
X-Google-Smtp-Source: AGHT+IG3OaltnXZwEBRSfG3XodZhV3lzgQH5i0VgOdUwoR0W8iSbjEY2TtmNNQoAmCWmxekmbyHS
X-Received: by 2002:a05:622a:2287:b0:447:e423:a756 with SMTP id d75a77b69052e-451d42d318bmr12706971cf.41.1723106747076;
        Thu, 08 Aug 2024 01:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723106747; cv=none;
        d=google.com; s=arc-20160816;
        b=GtF4H248gzA+kGhfvUNROhbgMV3nX4wYvwfhOrTcWTODBxgqW/xv+CV1NPrXHKu97L
         2sjG4EQ5Bep1ALIZZo2TdDYRmIaUKjwCwkcmlZGz3PnE86/N0HIQgQe/ZtemFHjzLf+Q
         Z8qPUgK5WeiAs9T4B1UCmcqX0juFYE2onn/EPVVMkCWKVX4E0kLJ8cyYF/vCy2ZldPeP
         OASPMhh7xUmFv5AcI+2rPDsp14pQR9nVSAQmHmRcsZ1lhsYf1w57CyIsXfCxp2jBkq9A
         QqtPfTs539WUCqR00Jjt70Nlsy3SKX4iuEcNWsZRgnmgjfMxDNPWlgGogCspdGLQ+S1k
         rK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QCj3w+RtFY2Bad5vNqvlX6DlPWT5CNj2qTsSSR9YarA=;
        fh=MdSm7F211Rb8yimqlPS3+8x382bAv+irSv2fjP+9/ZQ=;
        b=lxAssIsi8gFPvk2WE8YlIlFinBHpE2ySY5b4hTxwO+PH3rduF8kWiQOQQrIVokTsWK
         RgqQQOQs41rHqo3FTXgZYWMESLSORYtHq3pSwje17mGDEUu198y0Yee3Rq7LBrQj6I6y
         EgTqUo+1Vfg9vm9p3JJUKoNm3pdkwAo8Mz20uAqOUnyi0Oj5h8canWI6LjFMCudFdH9C
         URwj+f6dfZNumhTr1Pdz7jc/Md28CnNFCPMSvmCEuFKfT21dQUgjZwxN+q4aiMGG/ckd
         R37mL6J22x3RMwiAi3v8tSedmvWJLW/JNHlFNZX4HoYOGYXcB02wpch1ldl574+Exj0C
         hwvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RIDQK6TI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87f9a00si36051791cf.485.2024.08.08.01.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 01:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RIDQK6TI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbyln-0005v5-52; Thu, 08 Aug 2024 04:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbyll-0005tY-VT
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 04:45:13 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbylk-0006fg-Em
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 04:45:13 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5b7b6a30454so853744a12.2
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723106711; x=1723711511; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QCj3w+RtFY2Bad5vNqvlX6DlPWT5CNj2qTsSSR9YarA=;
 b=RIDQK6TIH49wDgJXHypyAdY31DYccDuw2qb57bqhCQnJbDLDj7DwzEaNyADl/vyyzb
 ZyJKQN1KJSZGBJs9MYHdEPVRLPjc3LGafnX3RKKGs5WHymdI5TMvsn0wbH2Wgi8A7cFU
 giHRTkN/3RXlkKfUJOjxYf35Rzy/4NtWgR2sgLiRJ1yoOTnfGFlSf9Q/id60dfD1ePiw
 ANzvzaOSUiPJ5Rs1jyX6EN4+RptMwX2wOeYdIBlbDYbnZ3doCyltnk7iytxNhK+s98Dx
 1mww2mi8kuKiVqZpWOC4MdfbIxqfPqJ46KZD8RvGd0q8YrIncrKcNF7exPn+STflf35I
 YhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723106711; x=1723711511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCj3w+RtFY2Bad5vNqvlX6DlPWT5CNj2qTsSSR9YarA=;
 b=nedD4CoFS9QwuccEj8CAhKJtST/HO2qnpq0WFYWZUh5gy5x4PpDFLiF5PwUUHZenq9
 b8veSZB9mQLAyBIPmR8BUKZBDQH7eDLdji8aVJo2MVjfiitPQ8/nUaJBSA0r+B2YpaNi
 5VUIEr/xgTS0npHwJDW+GODNyFa1+xHhR1ReFkxRd2yf5qc319zeyKZjXvWIGoM/H341
 900Ms1See5TZBscO87O1FGOSBZCtQrDkCdtJD/uHHEFCo2DX8YLLLu9DG7cp2UXOkK1G
 UMZDKtH/AveOedVV/d7kBxAf03j98lFXuNrilI64V2iVlGe7LzfGeWJ5jUpAPXa3vAS0
 lzUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnELn/bhrJrAfxlr58EnV1ns3+4yVFme8ebNB4O0ZvxfuIkYm834xpK0oxhlw4Vd3zj89MFqlqSQ==@nongnu.org
X-Gm-Message-State: AOJu0YwYsUS9YXXtAXT5t5QjUy3Ef49UpwBQw81fje74bGcMF9h86s42
 Gvhnm5yrzVt6xBzdRqSj/ZSzD62TEFjYxtQ+6o1lC39pf20i6k7UwIxy0Kz2moACTPs4aTbGxGL
 6t67TOHZwzki3h0BK7IChuYYm2bVS5KzdrYkVJA==
X-Received: by 2002:a05:6402:1d55:b0:5bb:9ae0:4a41 with SMTP id
 4fb4d7f45d1cf-5bbb2338672mr833902a12.28.1723106710524; Thu, 08 Aug 2024
 01:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
 <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
 <CAFEAcA9emwsK07+itUzMxReOLG8gHaxNdDE8ymuwyuBfsoY2Pg@mail.gmail.com>
 <87bk23skhq.fsf@pond.sub.org>
In-Reply-To: <87bk23skhq.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 09:44:59 +0100
Message-ID: <CAFEAcA8J4i-81rOEHBpqbV=c4F26o6qd3Lg9dZV+BuNyZPGg7Q@mail.gmail.com>
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
To: Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /dwVvKxHC8u4

On Thu, 8 Aug 2024 at 05:32, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> [...]
>
> > The QAPI command which this code is implementing is
> > also (a) target-specific and (b) unfortunately
> > designed so that it doesn't get passed a particular
> > CPU or particular device to query, it's just assumed
> > to be a part of the whole simulation.
>
> We can fix (b) if we care: add a suitable optional argument, default to
> the sole GIC in the system, fail if there's more than one.  I assume we
> have no machines with more than one now.

The exynos4210 SoC (board types 'nuri', 'smdkc210') has
two GICs. (It's a rather odd design -- there's the
interrupt controller that's part of the main CPU
cluster, and then they used a second "external" GIC
that feeds into that one.)

-- PMM
