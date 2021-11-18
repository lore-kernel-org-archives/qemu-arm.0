Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp717455lfk;
        Thu, 18 Nov 2021 06:25:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyardUJpmuxophXMQrU0TYeSLqtUW5HrA36wWuiKTgGngiK+LAceCmclO8YvV61Fzdm3XR
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr104298734vkh.11.1637245548657;
        Thu, 18 Nov 2021 06:25:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637245548; cv=none;
        d=google.com; s=arc-20160816;
        b=ywnWwfMfcztll4VhmqQsVLGzoZWeBEnlTlnElCLLEy42eWEwZaF8ZOXpF5Zi8Y1D7W
         WfreLnwBYlpoq11yG0mXb5xPeY6KN6qEdOZo5Bf08P+l1M5mcaLfoF9Th1lcmWqeM32l
         uGW26SwVBgKj01BxybGI+rlhCzzPreEl4A7sZBdYBsWQYCcmAOtSrBujdPD/yXBmX1En
         LPv9SgajSi/shmgLKmHzYuEQdQcLqnxlMi5qggzT9zPTBLIPKkOv9mP9nFSLUJFOXj1i
         qdJa4y81VEmFmtVuQkVchd6QViTa+ipg6gAwNcLKcLAZWdgXeMpy7ntpe/ptEv1AVxUP
         AAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vOGFXcZmpYY2BY6qbPyMmtN8viz7SFLU+jf7YVqY0Kk=;
        b=azlpAZRmuH6BwGZl/BvO1ltHokdNkPhvynY7OyH2Sl/6P9/JqwgAvL6vnlWqn5eU++
         BVJuGzlkF6HoL58vuy40WxL6o1Ir81HJlMLe2WXK0taTVTbQV0EcCMknWk8Nqv6rDJm8
         W6OZfTBt4EaWEEJuWTSKtNgKHIbOBxkNDM7Gkhlew7Yj+oYfa3t2ckYtC4UEvVXq7ulK
         TKR9qTOV/dBuQOxnP/TdslNhB4Se1hKnlRANIApv2U6awlS8QFJkMjRjTj3tNPOwHTlX
         A01J2DwStCh9m1iiAYkTZwZUGUBenxrRX/3dFcszjJlL266RAcSIH8sEygey1+8HZjb/
         CMog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HegA5YYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si7227944uah.223.2021.11.18.06.25.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 06:25:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HegA5YYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mniMF-0007ET-Vh
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 09:25:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mniM6-0007E7-O3
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 09:25:38 -0500
Received: from [2a00:1450:4864:20::12a] (port=43680
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mniM5-0003b9-16
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 09:25:38 -0500
Received: by mail-lf1-x12a.google.com with SMTP id b40so26939444lfv.10
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 06:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vOGFXcZmpYY2BY6qbPyMmtN8viz7SFLU+jf7YVqY0Kk=;
 b=HegA5YYhFdaaZRvUyx46lp0prbRnp3YQLG4DM+l6MP45KJq/zN7BKkafNEfFHdjnHx
 /Koo+qUp5I8rx3beuOtxuVjG0vkPAn+xJy/9Xf3QwcTz/V99FqqUFm4GCh/ZAxRx2WPo
 JOfVaUig7JBjTHpajoMENuFru25Ey4VrEAg5K/zWp3L2/dkbbEqkG501YFW65ObsOLpv
 h2TE/TGINc5EhIHX49RsWebXQVteVkMU+TSDMqW1wXmV2TBuvklPhV9kXUOcxdKK4M/W
 7p+1GXvqfWr6QQP5fviPkyMeye5+5dlUvGnTijUh6XMIlYTOQMmHYQ2mGlEIZscPEWbv
 7vKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vOGFXcZmpYY2BY6qbPyMmtN8viz7SFLU+jf7YVqY0Kk=;
 b=t4TlBfKAROZ5IMLBYyIXczMdhjf98/9GIoMmR0gOkjcr/u+01v/1/OCJmsaarImYww
 8FcIBh511+TYyF+B+H106d4V//Zj5/2AAptzFfE1xaP4II4dMOeiuEsDnkhYtJek7+I3
 8DCT/TbbSHs3gAKQ/rJSk2GU48Mp+dL7AsdIupLwQ/18yZ9qpqQpWuQbL4BIWeGQdk0x
 awxesZ3w0orMML3O+D1EyAiaLTD1DeboOn6BcpgW6kaPn8IcHn/n8iJVUqUU56H2tvYP
 afEPkJsmQJ1pBH58W6Lz2kkaNc7q3WQ2/Z/LeubtD6xa97huQizHNSn5cBUgvxw4EiZy
 HAuA==
X-Gm-Message-State: AOAM530P1ZH/zOynOaWaOucm+o1SYaTk8hLg9kRbQPSCPmHkLoyO05ER
 sE7Mfk672BoBQ4UfZjdIvoJK6bpeNp9FO0Pju1o=
X-Received: by 2002:a05:6512:405:: with SMTP id
 u5mr23611112lfk.271.1637245535300; 
 Thu, 18 Nov 2021 06:25:35 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
In-Reply-To: <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Thu, 18 Nov 2021 16:25:24 +0200
Message-ID: <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BLmB/6U8+non

On Thu, Nov 18, 2021 at 1:53 PM Janne Karhunen <janne.karhunen@gmail.com> wrote:

> > If you want to walk through what QEMU does and why it
> > returns the fault indication, you can run QEMU under
> > a debugger and put a breakpoint at ats_write64().
> > That will do the page table walk (in get_phys_addr())
> > and you can see where and why we decide that it should
> > report a fault to the PAR_EL1.
>
> Thanks, I'll do this and post the results here. I've been walking
> around the 'get_phys_addr_lpae' a million times but not via 'at'.

Here we go. The debugger attached to the kernel says:
(gdb) info all-registers TTBR1_EL1
TTBR1_EL1      0x41731001          1098059777

That table is populated by the kernel and looks like this when I print it:
Table 0x41731000
000:0x000000ffff9803 256:0x000000fffff803 507:0x00000041fbc803
508:0x000000ff9ef803

Note that the first gigabyte is populated. Then we move to the qemu:
Thread 4 "qemu-system-aar" hit Breakpoint 1, ats_write64
(env=0x80ec001fb8, ri=0x7ffff5b802d0, value=93825004025122) at
../target/arm/helper.c:3691
..
11610     ttbr = regime_ttbr(env, mmu_idx, param.select);
(gdb) n
11616     if (param.epd) {
(gdb) p/x ttbr
$1 = 0x41730000

So it starts looking from the wrong table (off by one page) ... ?


--
Janne
