Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8701059lff;
        Thu, 16 Jan 2020 10:00:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/mv3btXSvCuZxTjwZ+IT3YZe5wP0BoGkhY0u4wSKzC18Vj33MDfcyydc9hIOQcLdncv5Y
X-Received: by 2002:aa7:cf12:: with SMTP id a18mr37023705edy.150.1579197640080;
        Thu, 16 Jan 2020 10:00:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579197640; cv=none;
        d=google.com; s=arc-20160816;
        b=fTeTT5PvlbNUzBktiXeMLkd515PaAtrCQiFdXJ6ES8kHDycdW2XoUOX9LAI6iAZhFE
         BiOroi8Z4gmYxaOCTThojDhU3VRD5+VMSr1of0exvaAvj/hgAryitAwqwQ4PbrSu0Qsu
         AuuEaHQxWTUTbosvWX0jhsWFntGZ7a8Q4Tro5gwAJeB6rS3oAkQTkmX6qN83EcAj6k9a
         HsWcFS4gE+y0UAoweqKe0n0wymjUHhu/YNAR6o53KAiCYY8rb6QajaRGq0E0eO6XgmCg
         mNZpvE8md4X+7zqoyN8e/eGqmzeytxU4E0lTdnV8WksSpBCSKa4VKe2zCxq17+paI3BJ
         H5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJxILsF4SiOaMkqCzpZ49tewmt0Vuw9F+FxGG9I7Ngo=;
        b=NYHek2Sc0iKi/i7hIjqNrskAYnhWtJFeldB9527FWn9Ut//duS0cF2fZdlC4+nt56m
         nF0t8sROp7aLybMOXgZqQFgGb1UCuE11V9gy8pi4OzoiTbkXTNTkzqkV4Hn1G1tnmP4u
         NfMIF6+sxQNiYWK8ull0tbvMG2O2w51+jkydinuZeG1zLTVoflQXJHkEpZo4IBUpDXUE
         oCQdiImuroxcMNGJn4W4sjq9T4t5dn5oNn9Z0oztEpMhwMxhGUg2aBgdOFPh+gMH+Am4
         KbulKuA4n/0ToQDVXMXg+LoXAZmbKb7wTe4Jtwo69cdJFBgrGFv7jb/N5y21TTgL/xs6
         Hong==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FQDyLvos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm24si17070812edb.390.2020.01.16.10.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 10:00:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FQDyLvos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is9Re-00076O-SL
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 13:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1is9RT-00075d-6c
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:00:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1is9RS-0002XM-4p
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:00:27 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1is9RR-0002Wg-Vh
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:00:26 -0500
Received: by mail-ot1-x343.google.com with SMTP id 77so20198336oty.6
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 10:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kJxILsF4SiOaMkqCzpZ49tewmt0Vuw9F+FxGG9I7Ngo=;
 b=FQDyLvosUM+6b+kQwv5RyhY1UG+OEASXM7O+Rm4Ps0qRh9G7/BB6++qxqmjQKJ+jv/
 ASBm6r0DIgr8aHYSMkZVZsC/T2AsqLa59GETiW6cuVxGxsIiwff3jpg4joDSBuhWG6zI
 T8OUd9iJHvpcbUZah6opj/B2MTC73Z1zgHKlAgdxINGT+spT9D+hu6RuWCqB972h9FE/
 RuKwKTu5nmMU7zbAkkzR7e3KM+kiY+s8d0XHKT8t5icJNWcF7fHJkrAhM386CQhcYzfr
 hEh9VScSXx+WapykNd0Nbh9J2ALWPLbw4FfviuJi5iZzKB4w/QJQJigfjGHFpsS+3Xe9
 YYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kJxILsF4SiOaMkqCzpZ49tewmt0Vuw9F+FxGG9I7Ngo=;
 b=piUNg9Qbr035y+YS5+2lsW7fZ076jv/xaCKCMxwMiLHhaJ+vVzhmZUO/Ggj+0Z+0cc
 0LSkw2kuQZUM2/r52c/40uaCP93l+o4nXVn9+suyjOIsWDw6f+SizPuDVWk0diRSuDln
 mlwD0uVZVAkmG3vQ+BdOPvza3a/9yB8OnCVjjIpNpZbBBAONKbnv22d+fMnvXN9/s6Tv
 jrWfXWEAVpwoMPMq8bFPTGsyQ/n20ZPqSADpKvBxXK1acX07wGD77pt12bIvFs/rnO5v
 MYZ2GN+JOrPjxDl0zbQVqhHL9ohTM+7uSD7DOVoeu00C1rGj7zLOrJgZTvr4bVfnisFA
 5SRw==
X-Gm-Message-State: APjAAAWvTrBUbQiApCNCInsGRCBphMfHvWFB7H8bkxlFip+x7POdwJQr
 ViqPfbu+E6NMzOjGp+mEXbBZsPygK7DNFaYLc99hLAnikG8=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr3046385otd.91.1579197625271; 
 Thu, 16 Jan 2020 10:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20200113155934.97572-1-jeff.kubascik@dornerworks.com>
In-Reply-To: <20200113155934.97572-1-jeff.kubascik@dornerworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 18:00:14 +0000
Message-ID: <CAFEAcA8NFO0_ZuezUbzFe7yFFN8G3JAF-c43evFbcZgvhn2UBA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: adjust program counter for wfi exception
 in AArch32
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KRPpLu9d57zw

On Mon, 13 Jan 2020 at 15:59, Jeff Kubascik
<jeff.kubascik@dornerworks.com> wrote:
>
> The wfi instruction can be configured to be trapped by a higher exception
> level, such as the EL2 hypervisor. When the instruction is trapped, the
> program counter should contain the address of the wfi instruction that
> caused the exception. The program counter is adjusted for this in the wfi op
> helper function.
>
> However, this correction is done to env->pc, which only applies to AArch64
> mode. For AArch32, the program counter is stored in env->regs[15]. This
> adds an if-else statement to modify the correct program counter location
> based on the the current CPU mode.
>
> Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
> ---
> Hello,
>
> I am using the ARMv8 version of QEMU to run the Xen hypervisor with a guest
> virtual machine compiled for AArch32/Thumb code. I have noticed that when
> the AArch32 guest VM executes the wfi instruction, the hypervisor trap of
> the wfi instruction sees the program counter contain the address of the
> instruction following the wfi. This does not occur for an AARch64 guest VM;
> in this case, the program counter contains the address of the wfi
> instruction. I am confident the correct behavior in both cases is for the
> program counter to contain the address of the wfi instruction, as this works
> on actual hardware (Xilinx Zynq UltraScale+ MPSoC).
>
> I have tested the above patch and it works for Xen with both an AArch64
> guest (Linux) and an AArch32 guest (RTEMS). I'm still getting accustomed to
> the QEMU code base, so it may not be correct. Any feedback would be greatly
> appreciated.
>
> Sincerely,
> Jeff Kubascik
>
> Changes in v2:
> - Added braces {} to if-else statement, per patchew feedback
> ---



Applied to target-arm.next, thanks.

-- PMM
