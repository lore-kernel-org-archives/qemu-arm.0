Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3005322lfq;
        Mon, 11 Jan 2021 13:25:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQn04oQYB9Ixe9BqgKV0uFKUdfqWqH9Lx3C/ALocq9V2y2dkcHSYeob2+VDZgfFX6gOQVQ
X-Received: by 2002:a25:ea09:: with SMTP id p9mr2516100ybd.109.1610400316534;
        Mon, 11 Jan 2021 13:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610400316; cv=none;
        d=google.com; s=arc-20160816;
        b=rknHfhCsSDMzeo4LeLly1hCmwhFwcddRCBPY2NOCycSVRsmsY6CzJO827UrgPyX3qC
         3YEqHVPQz6x08vO6kC5ecbORG3F5he1IVrKA3A191c7kuaRPpstblJFQxkHyg49OzWmq
         bzerTt/PDFwB4EvZBOAyGQnweaLDOXvZUqQSKr+yZyv91hRLrhKCaNpF11jcY4xkDuQR
         IjTj9FW2Cl/Eod1ooIi850E2axlv6s0qFkP5Vpx+gVGysNezSTed+69R4kPzofMmJVwN
         PeLSg5NJmP7TfnznVor9XKJ9YSJTE+arnFmuurbWPPpriIhnSyIcVekWnFHQf1NaTeCG
         3MBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDeCplexsmi2i9OtFBCI+zVOd3728SvyLhwvRHptbVs=;
        b=TbA5UvYp3i4RaqSD7US4n9kQK27HCQmt8LhNV2pVD5zIBjSJdKnzNU8+j6LnUgw/UI
         wGjCGbk7ooWXCbbSqHhePWNuA+6H60rKt7sG7zkPTnm4xiktquT46de52/+krBLwwSiI
         B8IE55/D0X3kfBtoeEDBDlDIrUXM8B+ZTcnmM5QkKpCjA6ilKE/kEy4AeYK/CtfOyRUw
         cNifeMIuYeYdkFCtlFwJbm6Hl3DVptCz20SLOzX8Bsx0VkAC8viAtEPPOeMcC2PASMlr
         2wiHj2Mz/L9xEZMOXix3No3wyH7aCEoB3Gf6oJ+JJOxVUvSFsRo7TGtoirWv2qPpfKIx
         JQQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=saqHMcnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si853046yba.386.2021.01.11.13.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 13:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=saqHMcnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz4gd-0000Vd-Vv
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 16:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz4gE-0000VT-N9
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 16:24:50 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz4gD-0000Fr-35
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 16:24:50 -0500
Received: by mail-ej1-x630.google.com with SMTP id w1so403407ejf.11
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 13:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDeCplexsmi2i9OtFBCI+zVOd3728SvyLhwvRHptbVs=;
 b=saqHMcnw0ZgaHoigAWBhLGGPgFn7ZNoJRuHgDi9P1ltfB9MGG/d4AFttyYWVq1L2cY
 4ZrsFoFOcxWJRCq3J4bDOAxwAA2ev03wJrZSOZ3NXNSe8B9SgoUTMoMVY7CDMeer3lw/
 Six4Ve1ejXa9pWH4T07iNJzdT7bBm0Q0xolIgba+Gv/Q+NZRqzTRmbA7qozdxp/Wmt3W
 raWYCjfcX5GbWEPXDo4CNaPCI9MDX86wO8q0xuJeF22CFqiMO4AuRRCiqZZ9Ftw1GmpV
 YoeeSTKe/r3jwvXjm/OVPJC4qYKVbXGsRAzZvpL6GnzhSXnS0UJZNp7lgzHcs+SvDW4X
 d/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDeCplexsmi2i9OtFBCI+zVOd3728SvyLhwvRHptbVs=;
 b=ckV7PAyPDRSzsCoCuDo5XQxZ1ctxzQH1WX7q2y15LxfJq9aGbCZ9+pdaVZftKmVObC
 uV0HvHjoiHhaF5NZRUQ1Y22h+BXCQ0TqkhlHNfVLjbLoUC01bduDwukfOj3CvAgqt41d
 4dovKst+VVtzffdYQzg8yE4CpT0jp9zwenI69RwHdAw6gTWHG+5tzzXcl1OFJzE46GfM
 NVupaR8AsPmpvM5496Fa+1cgD4oNrNXstDOD1sfwaId2s/sOAk9FjbCnafksN0En0Iue
 aK/xeC2kux57yQW45vlvWO13ryACP895HfApRlMX9cU9WFYybCaOiEUbIRJlx9gUbbG3
 +OwQ==
X-Gm-Message-State: AOAM532Tgrqw7CPB1YzJwslXhbImQa88F4bwB/Wb4HaZ8PQOrncbW4O2
 H1AoT6GZeCQAUlei/4Xg79rSfFk3hFIk1MLuVO/a9Q==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr979239eja.250.1610400287148; 
 Mon, 11 Jan 2021 13:24:47 -0800 (PST)
MIME-Version: 1.0
References: <71df6296a8a7133097d6e0eda7168a2a@api.mail.freenet.de>
In-Reply-To: <71df6296a8a7133097d6e0eda7168a2a@api.mail.freenet.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2021 21:24:35 +0000
Message-ID: <CAFEAcA8FgtLrtxFqmDKkGh0CA_oQvUJb_7_2ncB4xtjcOy+J3A@mail.gmail.com>
Subject: Re: qemu-system-aarch64 error
To: andschlick@freenet.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eSeJ6y6DLrO0

On Mon, 11 Jan 2021 at 19:50, <andschlick@freenet.de> wrote:

> I installed qemu on a windows 10 laptop and wanted to start and install opensuse aarch64 version under qemu-system-arch64.de and I get the following error message.
>
> C: \ qemu \ qemu-system-aarch64.exe: No machine specified, and there is no default
> Use -machine help to list supported machines

Is it no longer possible to use aarch64?

The message tells you what the problem is: you did not specify a machine
type to emulate. You need to do that, because (unlike x86-64) there is
no default machine type which QEMU will choose if you don't tell it
which machine you meant.

You can specify a machine type with the -machine option. "-machine help" will
give you your choices. Probably you want 'virt': see the guidance at
https://www.qemu.org/docs/master/system/target-arm.html#choosing-a-board-model

Note that you *cannot* simply pass QEMU, eg, a distro CDROM image
via the -cdrom option and expect to boot from it on anything really
other than the x86 PC machine type. For AArch64 you will want to
find a tutorial on how to boot a Linux distro on the virt board,
because that's easier than trying to figure out how to do it from scratch.
(You have two choices -- pass QEMU a UEFI bios image, which can then
boot a CDROM, or pass QEMU a Linux kernel image file and initrd directly:
decide which you want to do and pick a tutorial accordingly.)

thanks
-- PMM
