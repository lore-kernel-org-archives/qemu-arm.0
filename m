Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp565640lfa;
        Wed, 2 Jun 2021 12:11:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHf0RjoholcXDUZ7JEyW5ExUUhgAKcZkAQG8h32C1S2WsA6v9QHivHDg4p0cHl2c3eCkkw
X-Received: by 2002:a05:6402:4389:: with SMTP id o9mr39720225edc.368.1622661102104;
        Wed, 02 Jun 2021 12:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622661102; cv=none;
        d=google.com; s=arc-20160816;
        b=rn4emiV3koQehc4PkZUcyeTuuuh8A50pLkUQrNy/CGk6Dn9b/T7JQwJKTqOqzOTWPh
         A+vsmOMWAY5ol4du5ATCQ6DdJUpGWF92nkbFL/2Z1KQLomZnD2H2149XzKDoi8n5vlhs
         pf0a8iIkT6mACaOxS05T8dyNMyP6LhDt1C8dur3NPBDejzN1wtHDuOXarw2lgihjq5z+
         7BvLBU73gbYT+yQjV5osGPktKaVKblh9496rG1I4zQFccUv3ydbUrTv7C8tAlwourGoV
         Ag2fWNSzbAZfklW0H9qCx2ZLnGMkmaYmFGLjcUou8sJMgLIY3e7mAHOGVpYPnNzTVuUP
         lgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEBlWTqqbQ/WstFOo6dKhZ1DayOTP2LTUDvw5I5JPOo=;
        b=mWixFJcApZeIMTTNuPqC9TrIC2s6lbO8KgWCSt5k79tFISdx7ttSwZFil/imDoY0Q5
         cZ8H9DF1GmVu2x7VOhRamRhfYWG+usXg7Lbo71EkOOYppC10I0hBq7ojCKe+Fd9IQpZk
         5wPHnm58V6xzLoi+darLGIsXxtJfRGPoCJQ0InpzTYs8aRPLxlTHUpTMJcVrDLJ5PtUJ
         P4X9a1nG/oWWZwBp+Mo10qbt2bRZ4kODI0vKqgXFMy1C/usPvR/YpJ9fszBmMZKvUMuR
         xyb1UrEM1gT9sGVZWoHlspCZ0TEnTy+XfCjsZ5VOaus0zlqkhuyLs2WpxeIUJssG548Z
         KwjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKOZNXCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a92si614801edf.232.2021.06.02.12.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 12:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKOZNXCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loWHF-0008E9-7q
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 15:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loWH5-0008Du-P8
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 15:11:31 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loWH4-0001ar-1o
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 15:11:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id h24so5482943ejy.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEBlWTqqbQ/WstFOo6dKhZ1DayOTP2LTUDvw5I5JPOo=;
 b=vKOZNXCrgZFC/oU+4840uBBa+7eVh+FLqKVK13FhcQeboCmmlKCedODzfNNG5jQwYA
 zHAkrSmGVHeXIPvQ6MN1AQXI5lULrMuxSADXJri2y/jeASoIq59bVLL+6HQSqha4Cui2
 fGtjBIeWZ6+u16rGwHPf7kEewhD/+y9N259sJAnAIgt6TN7bzTrVbgEzbvB0jBEK+xTh
 /mktbX9s+7eZG+Utlq3NZIiqBjr5GsAwU9LTXwIA2I+VhFtK+gMGG1whsFlK/wLSO2c4
 QVWXo9HEWjbsq7xYdsxPaimyTzLuJJ6uHCW6xd9qzU6+4iUbb65iWPM/W3z3Ol7CKt0P
 Og1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEBlWTqqbQ/WstFOo6dKhZ1DayOTP2LTUDvw5I5JPOo=;
 b=alGVUc931nhYPAJS1/2uM0+b+ruuhYGTxd+JPUdKtJ69iFNV/Ul0T3V1wpY16s1CiM
 9+miPL4XBtLjbRtCimYI8yBQkS7YNhUlmgZsJdoRuGYDpVOdg9/8evSpX/xTKe3Spve+
 Ae7Imm8GIi+oamD21zkltsO+P+zx4olGhFQpcFdt60fq15AeXzrBHaqDOMJ0lkp1O0zi
 dK6Oq53ulHVxObOAwTiLtaCKnZJ9rcSp6kdZTWAFMVwA3lIzMkDYD7X9hO7cFXykYWN7
 g9T1osxNIXte0U6SeIzMmBv9ur4sFcwI6ifTkpkXUWlc6Q8Ss/GIVTmtUBgrQ/rLKxn0
 3Gnw==
X-Gm-Message-State: AOAM532K9fkj0hq08WzGFh675364aCHMf8ujLBlP/8IW0Zwl3Gsr+3d6
 LzD/Us94MUZplIZqDGm7KFn9D7Id9rXxlPHevGf50w==
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr20105482ejm.85.1622661088322; 
 Wed, 02 Jun 2021 12:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
In-Reply-To: <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Jun 2021 20:10:56 +0100
Message-ID: <CAFEAcA8-KXp204HD=LcUo8CHQX-ioCMzL8kaOyHTUP9KQz-TAA@mail.gmail.com>
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tW8hl9DejEH4

On Wed, 2 Jun 2021 at 20:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 6/1/21 8:21 AM, Peter Maydell wrote:
> >>> 2) Is it OK to specify the option to set the HPC extension of A64FX as follows,
> >>> for example?
> >>>
> >>> -M virt -cpu max,a64fx-hpc-sec=on (*sector cache function) -M virt -cpu
> >>> max,a64fx-hpc-hwpf=on (*hardware prefetvh assist function) -M virt -cpu
> >>> max,a64fx-hpc-hwb=on (*hardware barrier function)
> >>>
> >>> It is also possible to implement something like -cpu a64fx, but since we don't
> >>> know if we can implement it immediately, we assume that we will use the -cpu
> >>> max option first.
>
> My first thought is that -cpu max can simply enable the extensions, without
> extra flags.  The max cpu has all of the features that we can enable, and as I
> see it this is just one more.

I dunno, because it's not an architectural feature, it's an implementation
feature. We can rely on architectural features not to step on each others'
toes, but there's no guarantee that some other impdef feature might not
clash with these a64fx ones.

Also, how does the guest OS typically detect the presence of these
features? If it does it by looking for MIDR etc values that say
"this is an A64FX" then -cpu max won't trigger that.

> I would like to add -cpu a64fx at some point.  But as you say, that need not
> happen right away.

I think it would be worth scoping out how much work the a64fx CPU
would require (ie what else does it need beyond these extensions
and whatever features we currently implement?). If that's not a
lot of work it might be simpler to just add it (possibly even
add it but with one or two of its features as not-yet-implemented.)

thanks
-- PMM
