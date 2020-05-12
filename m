Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp997878lfb;
        Tue, 12 May 2020 02:37:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7yxyMXEV/767Nn9hrx+AhBdHlvR//7wmX3g0q4Iau41ZsXcsv45Qwcvh8s+RgnhILDbcO
X-Received: by 2002:a0c:9002:: with SMTP id o2mr19423485qvo.3.1589276257018;
        Tue, 12 May 2020 02:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589276257; cv=none;
        d=google.com; s=arc-20160816;
        b=hDqt+gTvfGnZZodWgbZU5iSPx8ej0GGmSZy2m6tewpUu1Md/Mnvy1oiotwIv5R5ApD
         fIBc5u9tW2kTeJRWFCUS4aLMKLPYoxj4toKd4Qoh9qZBIJ94gQqAP/1UejBz1UABr0LF
         VVms36oHEceb3bQ5eIkP1Hx5vAS4RDkXpN9xveNXGPpe8EsF54VIER6swxo7AdXKJ3qF
         nImGorjkMK443rTNqzG6Zy8JSGySGt0dK1lQd+/4X4DqeNEYM0RiLAVCkEKIqghfu7Lb
         so9BZkvRv5l02c6eR1NZucNaUwbQ6nIfqtJUqfUrgqV9V39L81lqFjS7+2OKLTOEdmzV
         igyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=Wxqz5SCEQnuBpgXZtyTTd5WBFjuCs1DQnIieqGAw1kU=;
        b=fcfkv7CIkKCaK7YqdMoADSjxIX/42YFYD+V+e2Fo1wxeZeERfTAsMRXfbYA4XjEMyq
         iaNyKzQlXaw+i4ec+Tk+kE3MxkFxV59hUVipVIT03RUll83Q935Gs5U4DcHBDy10TPdA
         +Do+kl8bWkSuRxPv+rmsgCJodHfwqT0zhQt1QKLB1PKn1U58tI+UnxKHe74mONZ+TAk/
         wl+uqF8ZGrQvi6x8xqE5fh3SwptRMPVv+OxVrTVKiCrzSJr97k4HRfWwctlsgH1o3R45
         DEfZlk+fuXm1dXXb88nWEE0TD9qEOkMbSFLxtd9HZaDuTBRrgSnhlkomUfBn8jG56w2y
         fp0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=0CwTBIm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si5421446qkz.44.2020.05.12.02.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 02:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=0CwTBIm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYRM0-0006Um-Cb
	for alex.bennee@linaro.org; Tue, 12 May 2020 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jYRLn-0006Li-8h
 for qemu-arm@nongnu.org; Tue, 12 May 2020 05:37:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jYRLl-0006vX-WB
 for qemu-arm@nongnu.org; Tue, 12 May 2020 05:37:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id l18so14477491wrn.6
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Wxqz5SCEQnuBpgXZtyTTd5WBFjuCs1DQnIieqGAw1kU=;
 b=0CwTBIm7QAgJAuIB18DQmWEcbTrbJ96PE06Tazt5YgggNTOo0kRo3plRVIwfA0QiEY
 h1fwH2ZpfBL8FH0pHShBLQg4MNFfw/zuceub4R5dEawDWbQNnTjkHxXIWL3klem3+SYf
 lXerFvts4SzTua4XBXsnawB1ChOHKC4gdZ84vY/JgTGcvAOvdZ58+BSITMO49KHEL8ZH
 wauf+dJ5rK6e0KKkf8OALmHY0fUPKCz/ZEapEsNaf/GAxVkGNfxqoCFCsa4QgV9yDctq
 Co+TGsQWeDfzNsUdkzWqxctu5XE9tFaEsH4+QW95/+SDfQMAvd0IZI1xerB7HuOGe9mP
 Qe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Wxqz5SCEQnuBpgXZtyTTd5WBFjuCs1DQnIieqGAw1kU=;
 b=OsAFwgVM8tLdEuRLC5Kz7awPEJqAC4Fq8jdEggw1amxDlLdjkEx6PI4tSSBxQZoulw
 BqgM7WZTYn3mb5jKCc7KhENTT6c/S2cQ02ICg0UHQJaQWY9JB/N1RS4JRmZHcDm8HjrI
 dLMMXRyR/+79Q4PUCP29rVI8LazGXRTW/BUCsgpiMGHCofr5/jnnLPTWZUU/5yxyMye1
 EOjoz84xVEc/ycmcZMzQcN+lxbnt7F5QvByNPlp0zTqrBFwU8IGWznjlg67AUnxRPsui
 fDmjh+WVCP79Pv56zFleGnr+ySWL9u92uzCsQ8An6D9/Kg8PsrUQHBgws12YC+2DgITj
 ZTeA==
X-Gm-Message-State: AGi0PubxMOIhH+Ci33mOdP9dHbx5AA14xkZ5mtANIeQxvJRDwpqN2n8j
 KOhvOZJY4jgNGc+Zzs1CYBR9/g==
X-Received: by 2002:adf:e489:: with SMTP id i9mr16033293wrm.373.1589276240073; 
 Tue, 12 May 2020 02:37:20 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id c7sm8217756wro.80.2020.05.12.02.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:37:19 -0700 (PDT)
Date: Tue, 12 May 2020 10:37:17 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: SBSA-REF maintainer email bouncing
Message-ID: <20200512093717.GZ21486@vanye>
References: <dcb8d325-a2af-0c68-ad64-87f41521d4bb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcb8d325-a2af-0c68-ad64-87f41521d4bb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 radoslaw.biernacki@gmail.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AVxTK1pZik3e

On Tue, May 12, 2020 at 08:34:13 +0200, Philippe Mathieu-Daudé wrote:
> Hello,
> 
> Radoslaw Biernacki is listed as maintainer for the SBSA-REF board.
> 
> His radoslaw.biernacki@linaro.org email address no longer works,
> apparently "Radoslaw Biernacki no longer works for Linaro".

That was probably technically the case already when the patches went
in, but Radek was given an "associate account" for continuity.

I'm digging into what happened (although as _I_ don't work for Linaro
anymore, that might take a bit longer than it otherwise would have).

/
    Leif

>   SBSA-REF
>   M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
>   M: Peter Maydell <peter.maydell@linaro.org>
>   R: Leif Lindholm <leif@nuviainc.com>
>   L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/arm/sbsa-ref.c
> 
