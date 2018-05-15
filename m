Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp191330wme;
        Tue, 15 May 2018 05:13:44 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqRG0RmJWpejJRl7oaMVqlLm2ji4Z832DCkGC/bzFulsl0EwEdswrPZ48nk/Ox5dmeGP9aH
X-Received: by 2002:ac8:23b0:: with SMTP id q45-v6mr12589323qtq.91.1526386423998;
        Tue, 15 May 2018 05:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526386423; cv=none;
        d=google.com; s=arc-20160816;
        b=QQ+7vtJqqPvQUKpflwAZ6Ykym+cNFZloYNm+JKAWTYpHAx0VYN/2/rkPtAjApaQSyi
         XTq+OT8/1BrsMvdFs0vlwfws6xLWQ7Jljjt+UJTiCTePAG3hXIFNdjjBmNXcB7v/FrNu
         slXtK7xLjHk63bISRl56KjP+akfE9Lrpk/7j4H+iOVmh90EyaLijA5F4QjgYQHa4dUGJ
         JOWIBURaiwtGiKddwhjDKlegWshbqoKlgOoPOFHxNogigUqNLfXDc1a475HTPTQTx7Px
         iDqjEHck1uWKYk7S2E1H7ROcExUDVwr+zHWbfUFdYUuUsfi7X3k+C1NTmZ7p7ahDpEpM
         tPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qFHOeYK4ex+R/DPbrn2CDWJBtrm1YyyHDwB+5/dP0fM=;
        b=eRnPnD+LNzlmYZKxDv7m84zXaNOhPde6rfitHW1c90FtnORCNle7FsJKKYjXel69q/
         D4CmjPaZ2RrHyLUp9u0VuT8q93w14IG+frwfRxE2343BHhrIq4HVoSkYKISmOg+16phr
         OvI6w2+sHr7NzeCRLieBCObn9U1MgBFqniplgCiu0WHxJzftu4u5AV2S+G1oACyIKkis
         Zkqi62TIA88yXl5QaR61Pk5WvQHWaUZgABLdpu8lDmjU9X9E/sUv+NIjTLnXyDSegklG
         6T0CNHOXU+ZziPMKMjeoQJ1JYUhZxDaM6F9yid9XS8g2Yzo40gMEX9ZMnI4ZGtKd7X12
         aC+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SYAIQcL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a83-v6si447184qkc.307.2018.05.15.05.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 May 2018 05:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SYAIQcL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIYpr-0006je-HS
	for alex.bennee@linaro.org; Tue, 15 May 2018 08:13:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIYpl-0006j9-8f
	for qemu-arm@nongnu.org; Tue, 15 May 2018 08:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIYpk-0007pg-1I
	for qemu-arm@nongnu.org; Tue, 15 May 2018 08:13:37 -0400
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:42474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fIYpj-0007p6-SF
	for qemu-arm@nongnu.org; Tue, 15 May 2018 08:13:35 -0400
Received: by mail-ot0-x235.google.com with SMTP id l13-v6so18156632otk.9
	for <qemu-arm@nongnu.org>; Tue, 15 May 2018 05:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qFHOeYK4ex+R/DPbrn2CDWJBtrm1YyyHDwB+5/dP0fM=;
	b=SYAIQcL5HtPlR5XF7tEHw8gliQLAm0YpA0HLnJTBt/VxGrnyr3O8PBOAgKg74FOh7y
	dbOEtA7cHwM7aPR8P8vhQrerf+b1hLb5XFETGDcNRT1yIcDeWCLmOVrNL2nXJ1WkTyI+
	c66ShJH+qLZDmQAz0NGtnqXV51Hva5Le9CLOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qFHOeYK4ex+R/DPbrn2CDWJBtrm1YyyHDwB+5/dP0fM=;
	b=rEiq/vBZNfXOgPoOjzk0WUrSdcTOC9UfhNYixbLxsVaAY7VvPKFbcF2a7TxE3PPqQQ
	R1kBh8CYKjMtiBZAIPZBC/2xhsEM+ShZiaP0xY361cvuALTKcCQm4NtI2hAWgKXR7Ebz
	y+mXNRa/pbHL1ZhJbGjkV7dm7FgjbG1bFC5lyiv10tPdaJ8mOC4GKWN45T+H/1vb//6L
	5ukl34tnJSq3gophbJGQMWf1j1trs7z/UDz7F4isPiDw905mhB+wUYOXgG24lGhkjj6Q
	uKaAHY+ENAOHCf7x0WTBbiufleJiTiKsEfFScKRchZHO5SxZe6zYgmwkllI0mpSDAzuX
	JGKw==
X-Gm-Message-State: ALKqPwdYEqB9eIqJc8Dw3PcKDLVsQ9nDczQkQ9ZM5EE8cwFPfWk9oss0
	xRmEGVB9EpsfSArwcBSGzbUm7cK+d89lhsjijy5JQted
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr11021234otd.210.1526386415077; 
	Tue, 15 May 2018 05:13:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 15 May 2018 05:13:14
	-0700 (PDT)
In-Reply-To: <cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 May 2018 13:13:14 +0100
Message-ID: <CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfL8/1UeARcR

On 13 May 2018 at 10:57, Stefan Weil <sw@weilnetz.de> wrote:
> Even with the above patch, disas/libvixl raises a compiler warning for a
> fall through case. The patch below fixes that warning, but I am not sure
> whether a fall through is correct there.
>
> Stefan
>
>
> diff --git a/disas/libvixl/vixl/a64/disasm-a64.cc
> b/disas/libvixl/vixl/a64/disasm-a64.cc
> index 7a58a5c087..5481d94209 100644
> --- a/disas/libvixl/vixl/a64/disasm-a64.cc
> +++ b/disas/libvixl/vixl/a64/disasm-a64.cc
> @@ -2986,6 +2986,7 @@ int Disassembler::SubstituteImmediateField(const
> Instruction* instr,
>            return 3;
>          }
>        }
> +      VIXL_FALLTHROUGH(); // ???
>      }
>      case 'C': {  // ICondB - Immediate Conditional Branch.
>        int64_t offset = instr->ImmCondBranch() << 2;

This is fixed in upstream vixl, in fact:

https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337fda52845ed3d2e620cc02

thanks
-- PMM
