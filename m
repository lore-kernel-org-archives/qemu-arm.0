Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2623499lfg;
        Mon, 2 Mar 2020 08:24:23 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvKZz5pbN6yrLxYUmhfnAGOY1+8DtWaUCSxdIHAY61/NKh7IegEGLfEj7pgKIU+u1AW8rZ8
X-Received: by 2002:a37:6cc7:: with SMTP id h190mr95985qkc.358.1583166263036;
        Mon, 02 Mar 2020 08:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583166263; cv=none;
        d=google.com; s=arc-20160816;
        b=iyCYR0EBjzBj0W89g1fEWsh24doQ04uJVp9tMgw3BpqN1AW2QxeA5BNrS5r/z7RT86
         lSDCJ881S7QMt1serxxUnxACzp9cRGAs3JPfUopcfgYirWYvFxdpe2+wzDhpcCFg7JF2
         E0yNXnO/w1UsUUXXxdwIomSliBBS+6ekCE+nDs9EZUbcyIeC/XFaYtultZoGqPe33tQG
         lnE2RxO9DOFyGX8igOcamp4hohI7MXOswHV3HnKpM4/GjgUyUVf8yBy9ihJJsJYOWyF/
         hx3KVzdQt0LmXRWFWZp/Ijo6OOAJgiqkb3Ndh6u9hpyP8DgOnAfVb9MEoNdBj1lTaMxS
         ho2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f8AKfAHHGMpYmAG6DRQLoSeEzgdkqBERrzsCEzwD3ks=;
        b=GgF22C50cd63kyv+aTjNx1XPZsVFa7Rv5hPbOciJWYPcF+S7N31baO0Gr4/Fus2zKo
         eBqYlJNsxGyDdrGLnAqQ8G19UDHlEjjV95ebM28iD3TU2W2UJQpMdrU/wr6KTdYr3SXl
         FSEs2+5JIxz4wf7v9UXpV/z4F9453zJFrPzLecZoBcLx/ZvUAr3liQepJO4nK/b20oan
         kUInXoJ+2vuP9wH3L0j35UwJPxWgl7ZiqkcOFa/TJxo065UyetHa51AEwNK8sEpy1Nki
         J7qZBXpJ7F48xA3MzWljYMz/k9GIxDAjukBzafMwHLfi6WCFRh3D5tpIn3H+jP373u4x
         5EEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jz3H4yzK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144si6406681qkf.233.2020.03.02.08.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 08:24:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jz3H4yzK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8nri-0006jD-GU
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 11:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8nrX-0006gz-HJ
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 11:24:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8nrW-0005pS-Eg
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 11:24:11 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8nrW-0005oG-6l
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 11:24:10 -0500
Received: by mail-pj1-x1041.google.com with SMTP id a18so17580pjs.5
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 08:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f8AKfAHHGMpYmAG6DRQLoSeEzgdkqBERrzsCEzwD3ks=;
 b=jz3H4yzK+o0uU+Flvzdus3+Rr8MVLgkHxe66nr2gGz8+835SHGJctMQh6ykXkS4eRO
 j54jgKf7iwzDSrvQMxFoHH2J6wBKpcfJmpRxtxVpKFcYiVk8/rkFvtXykABQSU8MnSWh
 lJBO7r/nfKl2xi+YfRUOztXhal116pLHz0cxYs+QX2weI18R3B4dlOZ+rIu6bqRkCFZZ
 TDSUgRvD7uNPQQAKjoZDtd5gnqQBZLtd4rxqLc7K4SvipTlS5wH2wo26p92zgHedKH+X
 V+AeCM+rE98Y+yHOv56bP+I+a/nIKxWoMDO0OI0VjjCjKuG1QH7rViPUIBeeJlUbS8yZ
 COZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f8AKfAHHGMpYmAG6DRQLoSeEzgdkqBERrzsCEzwD3ks=;
 b=iSj7o9Q2qlD6HtrQJVWXbDMJtDewzAeqK5DYfY1UkXD3B7/Kwn3ED7HuwWDFN0g5b0
 gKClaD3e6CC8KUZXd7vpGxP5WoMYCkR+16TGDnc8jb5kayebFhKyCgrbSJI/ptuBzOy+
 9ea1BjUBzRQM6SzSEe7cx47riA/8+ay2J0fXtM64L9Uf6jIIcsV985fUfMYBo6uW39O3
 gL1GykKjyau7m8CWGrqbivmdKKUl2Me1YyVq6iP4FpDtwz6wROPe9+F0zzF7gSRKFWqn
 2UzeUjzzgPAr5wNUBuviJiQ8dhxWXZu1w//QBE+g0vx3zgZ7iBpSMD+Ah7kR30jkpc9F
 UTTQ==
X-Gm-Message-State: ANhLgQ1uKWWixomI7xWnOgC65qMD2pB4pLGcbBs9zQWc7KQ3rEbnU/1J
 CmsJ4Y20rMMkBNxIMx3+Qu1A+EmwH9c=
X-Received: by 2002:a17:902:6b48:: with SMTP id g8mr12895plt.149.1583166248362; 
 Mon, 02 Mar 2020 08:24:08 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d14sm92154pjz.12.2020.03.02.08.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 08:24:07 -0800 (PST)
Subject: Re: [PATCH 2/8] target/arm: Optimize cpu_mmu_index
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
 <CAFEAcA_S9SPLoC9E6naZi9pkfxzz=UTvUss=H4jDff4tgdToAQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4674d1cc-e6f1-fcf1-3fc7-6d275bb5b477@linaro.org>
Date: Mon, 2 Mar 2020 08:24:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_S9SPLoC9E6naZi9pkfxzz=UTvUss=H4jDff4tgdToAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cgrBddV9LOQt

On 3/2/20 4:03 AM, Peter Maydell wrote:
> On Tue, 25 Feb 2020 at 03:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We now cache the core mmu_idx in env->hflags.  Rather than recompute
>> from scratch, extract the field.  All of the uses of cpu_mmu_index
>> within target/arm are within helpers where env->hflags is stable.
> 
> Do you mean "within helpers, and env->hflags is always stable in
> a helper", or "within helpers, and env->hflags is stable for the
> particular set of helpers where we use cpu_mmu_index, though it might
> not be in other helpers" ?

The former.

With the caveat that it's pretty clear when a helper is doing things that make
it the exception to that rule.  E.g. helper_exception_return, which itself
invokes rebuild_hflags.


r~
