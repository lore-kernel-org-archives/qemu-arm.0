Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp528064lft;
        Mon, 20 Jun 2022 08:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vIOAU7HSGp+jCfikBRdek3xEuVCxAb4yk0olTIAB5CL4l9UK1/g2RjONiB+2oVXewT7VXi
X-Received: by 2002:ad4:584d:0:b0:470:4228:176 with SMTP id de13-20020ad4584d000000b0047042280176mr4835367qvb.129.1655740397742;
        Mon, 20 Jun 2022 08:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655740397; cv=none;
        d=google.com; s=arc-20160816;
        b=s6cvN4zMKdNLnPmEKw3R4GRO75iMfECrPO2qp0r+sgUxneOTGyozVYnP4cNdNkMFrr
         TXuoycICpi8xlk5zX/x2flOpVluDdxVgWsS3DCwrd7Gyk+oi2IubVe3z482vQyzEN0O/
         gPjdcTW45YS5rx+89nlfIqGpJE8quUH0d4YjMXKfVcXm8IYSv4/mbtki4ohRWdholhPg
         ZSv6LtKtBWStQFgjoFmnnE+v9sHhg5N25sQvI37H28oeEKxyFV78zjnM5xw0IMsgJFp7
         YYw9qD0+wWTZJcqzfNjupieAXYJrvjmftflHVHrjkjzHPAe5yYcsPKok2+4mfsTrAnMD
         /Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ms0Zj/GfDEDgNMjY8tFTrQ+pVXKrSBlh4/4LzOhGu+I=;
        b=ytVFdlJ6622JAFvVfXSfcPQyY3t0ZlxOV5wmxVIk+btlOagbvIWl6q65CDOkUc4EMH
         Muf0d/oPcrf7PsfZFHK8TCz2qHtgW6hnk5GjvnmrfH7vNcjjhHzfhZQQG8P5H+hk5JOS
         iTUnqIty/MMTKS2DOqM+mOjZ6xRkpyqtWkG9j+oHaivTpGceKVoZdGPEchDLfLBgoBRt
         +SyoDDn3Qrov+fkQQ9jUBqwDapnop5hiod6TIAaL7o80J2kNZosIGycmVplV/uCM7iuN
         MBzFglybMt4Tz/byFQOz7SVtYaGUukJEydecQr87KKbInbjqv/qIxoRPQKehhcPGo7cK
         Wy8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h0GisFBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f192-20020a379cc9000000b006a725400975si6960599qke.432.2022.06.20.08.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 08:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h0GisFBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3JiH-0006dX-96
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 11:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3JbG-000873-6I
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 11:46:03 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3JbE-0006Ji-Dt
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 11:46:01 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id l11so19642873ybu.13
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ms0Zj/GfDEDgNMjY8tFTrQ+pVXKrSBlh4/4LzOhGu+I=;
 b=h0GisFBuan1mCielP0l1jMyLG1BwrgqJd0O8ozrgv/lAR2PA5GmixFnbk8AzCCjaJg
 pMKFpj/SjRJCR05pvuLkAX0gIMvZad5GNN2YXRlau4XxDavMRHcI4DTm9ILLeK/KGu+q
 E3snP698GErc/0rYJD30MEF5We6yn6gUYuEUhWZbDS0DQjWV11kswe0bF0M0fgTXFRaM
 wzRpLzF8uJEuTypiwtZ7s2Dukh+Lfmx7PHwdmof4pitGxFHx8p4hRnO/w+P5CEIkHCkF
 ax0S/6CNxVZ4Bo3tR5mKuiaoVaUKPv9XvGo/9BJUDceL6OXR96JS8RKiMElNgtR/pkXu
 d/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ms0Zj/GfDEDgNMjY8tFTrQ+pVXKrSBlh4/4LzOhGu+I=;
 b=FsPhHAWWVzqmORIKuJXx3CBjMxkGtwSBNpPLqta1+y9jN0lUMD5o+tTnnOFbDSDqkR
 TJLE61cPhxd89rD8iRbn/YDa7+xU/222m5b41ftA7cgu8ElLg0WeMG+H1W09Z4R6yUo3
 Ly84oSHkpF155HbEn6E80DWCMxhlIy8euyVDfQPij9JfC/7yK95+lv70Rjhc+WJSFlEC
 R7sgT/4s8/b3qcuPIdH/FHEw2t+//o4xtw0CRSLdWx2ZkiIWDxnqTPPpTW1CnURH9tT1
 OWjaICyCbBP16UmeH7k+beZZT+U1aN+tMxiMX2yfBEOMmJzDEZfKGGMnhFkWlimjr8o8
 T/Pg==
X-Gm-Message-State: AJIora82MpZQ07ZS4frwpc4rB20sKQa3ofYodPxbrR7m5dl++7vC/YtK
 br7ljumJRsfFH9e40RbyG5ZdvBDqaLTjGyGoA3Z69A==
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr25503732ybp.479.1655739955464; Mon, 20
 Jun 2022 08:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <SY4PR01MB8581F06E9DF1FC1CB79F6E45BAB09@SY4PR01MB8581.ausprd01.prod.outlook.com>
In-Reply-To: <SY4PR01MB8581F06E9DF1FC1CB79F6E45BAB09@SY4PR01MB8581.ausprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 16:45:44 +0100
Message-ID: <CAFEAcA9sbt-m+drckfuzh4X+Nmk4eS8F5TJhmRj5LumpVesXiQ@mail.gmail.com>
Subject: Re: Program can't exit from the exeception
To: l ck <lck2000@outlook.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: OlqLILoQZNP/

On Mon, 20 Jun 2022 at 16:30, l ck <lck2000@outlook.com> wrote:
>
> Hi everyone, when I tried to run a exeception demo in netduino2, it can't=
 exit from the exeception, in which after executing the assembly instructio=
n `br lr`, it can't return back to the normal execution. This is the conten=
t after I executed `qemu-system-arm -M netduino2 -kernel demo.elf -d int` i=
n terminal:

> Loaded reset SP 0x0 PC 0x0 from vector table
> Loaded reset SP 0x20001000 PC 0x12b from vector table
> Taking exception 5 [IRQ] on CPU 0
> ...taking pending nonsecure exception 53
> ...loading from element 53 of non-secure vector table at 0xd4
> ...loaded new PC 0x1c1
> Taking exception 8 [QEMU v7M exception exit] on CPU 0
> Exception return: magic PC fffffff9 previous exception 53
> ...tailchaining to pending exception
> ...taking pending nonsecure exception 53
> ...loading from element 53 of non-secure vector table at 0xd4
> ...loaded new PC 0x1c1
> Taking exception 8 [QEMU v7M exception exit] on CPU 0
> Exception return: magic PC fffffff9 previous exception 53
> ...tailchaining to pending exception
> ...taking pending nonsecure exception 53
> ...loading from element 53 of non-secure vector table at 0xd4
> ...loaded new PC 0x1c1

The CPU takes an interrupt because of an external interrupt
from some device, and calls your interrupt handler code. Your
interrupt handler code runs. When that interrupt handler
returns, the CPU sees that the external interrupt is still
pending, and so it calls your interrupt handler again.
This can be caused by several things:

(1) your interrupt handler code is not actually doing what
it needs to do to service the device, ie read the data,
write to device registers, etc, to cause the device to
lower its IRQ line. If the IRQ line is still high when the
interrupt handler routine returns, the CPU will treat the
interrupt as still pending, and will call the handler again.

(2) the device has been programmed to raise interrupts more
quickly than the interrupt handler code can handle them.
For instance, if a timer device is programmed to raise an
interrupt every nanosecond, there is no way the CPU will
run fast enough for the timer interrupt handler to dismiss
the timer interrupt and then return before the next timer
interrupt happens. So the guest code spends all its time in
the timer interrupt handler and no time running anything else.

thanks
-- PMM
