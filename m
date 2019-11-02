Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp2076683wri;
        Sat, 2 Nov 2019 11:13:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaO1jLak8Lwn7nXNi/yvJdxEmXXSROeo96/mG0VPVUTTRQc98SHHnHsw5KeBreISCGk24O
X-Received: by 2002:a0c:e6ac:: with SMTP id j12mr16392057qvn.11.1572718385231;
        Sat, 02 Nov 2019 11:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572718385; cv=none;
        d=google.com; s=arc-20160816;
        b=cL0Qt/F3liAV5JW/BYxztrUJyJz4S6yUfFA1Lk0S2WqqwCrSApZr8l2EneU8jPA63D
         ocLtYUlF3AZKiiH7xBoCOmMcvVa0kFaXeFa+BWnjlq7kxQ0wJFTpHV7LP7t5MJ5qTwBn
         6+rD9pEEHnC+1nnALe80H+kveadANoU8lWjKXmBHr35eD5+P2yJZMI04VSAeXjda2DqD
         5jIIPhG6Pyf/tTCAC7ulwli8P5tyY/qzW7kRxEnlSqhH7Dh3fN9XhEVBDSZqzmnFBtdo
         mZpTbKO0O4LjWIMeiloVLxdpw/0uMZ1KL9aDH+jAsAyRH32hV8CyXIlj/oOPNIjZ3TJ3
         OR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=h50wE794rICsfRcY1Do2buxDvLDD0ctIZjEQaUoPvqw=;
        b=nQ0hACWWgODP9L/MgEhUPlYlsXTlWGxqV7CBV+oygHYTgV+uILcOgm3b9ss8hyAq/Q
         YM1l97wu5al22lGdqXbyIIxKko/FqhizvnvXrR9KHpslN84SWLgohKQM8Yh5NePYIIpz
         ILFP/EU5GFkJn5DTCz/N4cHO/7dt2itd24sRPlFa8lN62RNJM/NhkRd/JOVx1QhmSoD7
         2lMd3QBVxg7IG8l0biL67eVa8/xWSlbRKmelzY4KtAyIwREoUyoYHV44waCc4GOp/iDJ
         JsoYUfnZg0yWfBr9QHuxAigA3rVDyNX0Abxhcei9n3fcSy7NsTvQ6IF3+xifOW5iY6l1
         Z8Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjA25v4e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d145si10019590qkc.376.2019.11.02.11.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2019 11:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjA25v4e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQxtY-0003g6-M8
	for alex.bennee@linaro.org; Sat, 02 Nov 2019 14:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQxrE-00024O-S3
 for qemu-arm@nongnu.org; Sat, 02 Nov 2019 14:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQxrD-0004vJ-AC
 for qemu-arm@nongnu.org; Sat, 02 Nov 2019 14:10:40 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQxrD-0004m1-40
 for qemu-arm@nongnu.org; Sat, 02 Nov 2019 14:10:39 -0400
Received: by mail-oi1-x242.google.com with SMTP id s5so10794279oie.10
 for <qemu-arm@nongnu.org>; Sat, 02 Nov 2019 11:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h50wE794rICsfRcY1Do2buxDvLDD0ctIZjEQaUoPvqw=;
 b=NjA25v4e+/+Zv6NiHDiwblQ+j5mLSFuI8OPc7BXy6wsfvfKyNAKuiEvKCnv81U5Bxt
 g7ecXvxT4FoqfMjoDGLkOOvASeCvfJlbdhspNNsZNnmegQ9R3uO0eGAlswAqmFEap2QD
 v/S56+Vz61vdk2BaQK4VAQzeOrsMkuRRVxmRt2xZW7l6KwJADo3CQO54Owoqnxw/7LWU
 5lDp4G4JmWhk1m4xTMSNYJHEDAzR+VZ7Nr93iaNI4nsXFPEj5pJUssrcPKXUWLBiZJcy
 Gqh4LrRxZce0FMOhaaEeF74Wr+OBGGlRO7Awj7yvawHCzrJc4wSMhOh4HZE/LHeo+wNe
 jOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h50wE794rICsfRcY1Do2buxDvLDD0ctIZjEQaUoPvqw=;
 b=FopA8XficTLFI+l9TZBEm4vKMLwxeYpTKSe1HRDhCgYo3cxkPe3JByTCX9ly+IP+zC
 BRmEf8gc8UwY9wfK0/COULKV0rnXf8SHzRHyG6cBr71Vk0w2PTHACdud6z36qTAsnizG
 8lDWMOelS2mgdBjPm83XQ/l3yvGf4PyH0omvdCPrXp4sIR6o0S+u2LgrYS277bNVMsDz
 /LafLYqI9zuggAA38PwZUPVE1EE0YRlqvGkKkrhPxL/dcem9k0G4CgG/F+sk6ffWAET6
 O0otfoBmyfmc0r/DCLGFKY3pujv94zi9821xhnaPOK/A9qx5It1GUp2vThkW6UH4ulf1
 4HYA==
X-Gm-Message-State: APjAAAWiykFC1k8TyExo/rPFml0sdXenecxY4lwWVaVbSgiZ7Z94MeLF
 pLkHaAwXLH5LMJ93uUQT5FZvrCcNzdM3OaOhUPJKng==
X-Received: by 2002:a05:6808:7d1:: with SMTP id
 f17mr10148308oij.163.1572718235925; 
 Sat, 02 Nov 2019 11:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAA8B=UR4KOcSeYv2sKsf8mbbvjuZ_Eqiupk=H0JW6+SQ4uE=mA@mail.gmail.com>
In-Reply-To: <CAA8B=UR4KOcSeYv2sKsf8mbbvjuZ_Eqiupk=H0JW6+SQ4uE=mA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Nov 2019 18:10:24 +0000
Message-ID: <CAFEAcA8=yvd_OadDZaa3Um2K4RTrrJ34ZdTXokEDfYk08F1Wqg@mail.gmail.com>
Subject: Re: Aarch64-qemu
To: Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: uvsfItYr4oJ+

On Sat, 2 Nov 2019 at 13:21, Wissem Yahiaoui <wissem.yahiaouii@gmail.com> w=
rote:
> First of all, I wanted to post an issue on the qemu github but apparently=
 is not possible and that's why I write a mail with my issue.

Yep; email is fine (or our bugtracker is at
https://bugs.launchpad.net/qemu/ if you like).

> I am using aarch64-qemu with the SVE bind support and I am using the aarc=
h64-gnu to compile the SVE instructions. I did use a lot of instructions an=
d they work fine, except when it comes to read some register (zcr =E2=80=A6=
), it compiles fine but qemu raise an core dumped as the screenshot shows.

This is expected behaviour from QEMU. The ZCR_EL1
register is accessible only from EL1 (ie the kernel), not
from userspace (which is EL0). The qemu-aarch64 program
provides your guest binary with the same environment it
would see if executed as a userspace process under Linux
on real aarch64 -- if you tried to access ZCR_EL1 there it
would also get a SIGILL instruction.

Linux provides some prctl APIs for examining or
changing the vector length, which is the only thing
ZCR_EL1 has in it, and I believe QEMU implements
these: see section 6 of
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/arm64/sve.rst
for details.

thanks
-- PMM
