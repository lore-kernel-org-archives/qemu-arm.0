Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1033913wrv;
        Fri, 12 Jul 2019 08:35:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdmwNsWtmzkcVjWYynp5udaYdFjaHMFE5bqSXGjcl8Bb70cy2uObRmuv+xYENLdxzLmkb3
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr9923258edj.213.1562945703578;
        Fri, 12 Jul 2019 08:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562945703; cv=none;
        d=google.com; s=arc-20160816;
        b=I8RFyCKbXarLLP9sWb1p4enjEoFGudGPdj1VGOZmJdIyFca0wbjJqRIS2f52zZ7oc2
         K5MUQiaPJ3KT9oLS2IdRNnJp8y4ds9gk8JeGbZ7zuPsaxRae2ArOWWPuY7hUE7q7kuOD
         FIDxjCj/dsRpH5DC8QhjI0rCLGoZ+G+Vogrk11K53Ydd1dm/tUsjSk5r6DCjtnoVi+Bq
         hbGKhWBLcQ1OO4XOEq8cIOO6e9qj6LiqmncdLMZZBtjaH+/ha2CTKnfgLgfyK/jyNAPr
         +wlo0WbQpQ6YGL/NmC1grlJQwnwdJRujT+S8gj+Oz/Euz+kvQ6H2hI3x53QKbuaxYJT2
         lJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/AZlVvSfQx4gLDJnm2LXUHc6oBDvINOUeKs1at6adk=;
        b=AJwJ8EuoTSSAVGlW/G6roj9rXKpfswhNzN2F+4p+JhX48Xd3kPT86rPAui/ppmbcIL
         jnyXlOWIAILuO/3Exg/6GbDrE7vCoZyGYQKL8Itjzev11mvQ1viaYc997pud3526yQSi
         QFjwalSjuDpGXKueIIak35iyz1aqfL8PuryX1IOe3OR+HaN+ZwkH4f7b81dvnCiGzNoE
         TCwU9RcdtY918azqe1BxcNBGEitSVMxZwxjvhhFDV3//lJGCmauwqQNCXrsVkg3l+5+3
         Ik+/EkJ8zcqK0IegFr4i8VS77/+WvWH6w5GKlZLq/XdiflUlq9QiX7355PO6lnVq48Rt
         Zuog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXwpdtv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n23si5823753edn.48.2019.07.12.08.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 08:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXwpdtv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlxZe-0003fq-9T
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 11:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34785)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlxZa-0003fF-Ua
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 11:34:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlxZZ-0002J9-Uu
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 11:34:58 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlxZZ-0002IU-OH
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 11:34:57 -0400
Received: by mail-oi1-x242.google.com with SMTP id u15so7615916oiv.0
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2019 08:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/AZlVvSfQx4gLDJnm2LXUHc6oBDvINOUeKs1at6adk=;
 b=TXwpdtv1nekNSUm6Lj8Cc/SYL6TDWfre2pEWSFSGlZ6KqXNZs37HMEf6NqFbaCyfmP
 suJR/dfGKP3u3QO8uvuyLNIzwhm3B2P3Ftv1mQYt57g/glQugPvkY+15crSse/8IgX1k
 37yoAaZqEM9du0GlVjcGxhWRcTZif4OxY+2vkQjz5FnCvf5J28IwkDheavCS/AOQQZDF
 T+/F3bNz1rLRebR3GooFqbZm+9VpofClrCi3OKTBwasNkz2IYkMbAsTDXm/392ANkFJf
 6e6NhdD+b9EsHFJ+Oh/IMbQDLvGkGyn3r0PIfnGNp9vxJVMmKYlGiWiVT1mbS9FRM6hP
 +g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/AZlVvSfQx4gLDJnm2LXUHc6oBDvINOUeKs1at6adk=;
 b=iq12EkcTk+tqzzJBqpB3hvtIC8xHcKyPnfgnkig68OmkP+8iMLpmGYWr90SZP9BUrJ
 2KdpoqbBu9YKHlkJ1nY2yjZeGGtJTUbfMRvhKvjxut4hRKCxker1Yq3rtqDiG5nggk7J
 8gAc09xTzLkqqluzPZHz7bLFzVWg0E6flOKdr21Q+bMWv7Tyo6MhaLgNsBKcAr3CZLZL
 zHMJ5FuaO/EO7Cmtxl754OoXiRKUkNgveL7aUFfGSx+8RnPc0zachcLYK+MeYabX17yV
 VzQ9p0ZeVN2yY8wA5IEC6wquRw4/2yqw3nsEzVF3x4902Fx3QLjJAf+VL7mJm5pOtIhK
 79nQ==
X-Gm-Message-State: APjAAAVn3Gb3UsnXOOxl0sd8+Pa4TRr6dYSYbvZMeXyjSMaxP0FyTEpw
 6h5bQc7kLdEExeSkQFTmOdT00EoN9VZMx5nA/Kyyaw==
X-Received: by 2002:aca:5cd7:: with SMTP id q206mr5753847oib.146.1562945696865; 
 Fri, 12 Jul 2019 08:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190712075002.14326-1-david.engraf@sysgo.com>
In-Reply-To: <20190712075002.14326-1-david.engraf@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2019 16:34:46 +0100
Message-ID: <CAFEAcA9xon6RmoUA=r5XLeVsYrVTub8F_gJsYcWJavaRX7Fosg@mail.gmail.com>
To: David Engraf <david.engraf@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: Fix non-secure flash mode
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
X-TUID: QgEHnwgyxlRN

On Fri, 12 Jul 2019 at 08:53, David Engraf <david.engraf@sysgo.com> wrote:
>
> Using the whole 128 MiB flash in non-secure mode is not working because
> virt_flash_fdt() expects the same address for secure_sysmem and sysmem.
> This is not correctly handled by caller because it forwards NULL for
> secure_sysmem in non-secure flash mode.
>
> Fixed by using sysmem when secure_sysmem is NULL.
>
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

Nice catch; applied to target-arm.next for 4.1.

thanks
-- PMM
