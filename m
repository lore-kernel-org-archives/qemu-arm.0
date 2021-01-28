Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp385872lfo;
        Thu, 28 Jan 2021 08:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzicv9Y6UPIFP1VXiytYtYs7Dsyj1g9U57zU5/pmcG0L7iDbfj1LQNiO7dl7ZlACb/aFarn
X-Received: by 2002:a25:3bc4:: with SMTP id i187mr190633yba.146.1611853110481;
        Thu, 28 Jan 2021 08:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611853110; cv=none;
        d=google.com; s=arc-20160816;
        b=sC/GCEnLZesHgbjmX1PA+kltH8b69/UlW13YkGCSdEZjiXylUSaVdfhvnlYhdZX4/L
         4kuyU4VpMwIrDYR99xPvxbkBvRV48QpQdiGBIHs9QMY/d+7wbj73/SUf62GWQZuvCkUO
         AuCz1sIt5fqFjh715cPW2kjKfKZTRbZAUK2odJcBnpWSC+7k25y2Afic0bSOS8Tp664B
         QufNTnHcnWJ5WS8PKRr6yq6r6OijzoaOz5hhGn44lPQWTmEEeQLVLlQ616ZtSG46Yd3B
         4yFhFd1KsjRZNw+dbl1uC4a3du3w5+K0V2LFa9K85U0ErC+wrIUXRpnn7dvCQ9H0o/Jp
         o5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=FOG64E6/Wyq9pokV0kMENSntlFNn96y05wOum0aM49o=;
        b=RGwnaLD3lcODc1ozt3qy310GdI1SVcyT6pL3UwJ7FSnPqoWz8q33kutL7Afmb8dwna
         znrNomSjgniCoID8rLO4jnDRWVMnK/EgJCDb8j0Lfs20OxEl8B41Xdi78r7XAbQ1bX/t
         FLXMbX1rIOguXhoakLmkwttF6E/dlEwkMmy/nNKMHgZX5jR11WXRq7tREU4M4mVOhHXj
         zNunIeW87rbWLiW11hGXkcr4+JccSQVDHl2HmFFhm2DyajesBsAeQTcgR4qcsuV4cmoz
         1Hso2an5XONF3+FhGJR2AGl3yKQGgmmuFudVDYRc+Mm7lLEDn5yKGgnnuufNfP/NSgDA
         mQ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si5929178ybc.124.2021.01.28.08.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 08:58:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Acn-0002sp-U3
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 11:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1l5AZb-0001cs-Re; Thu, 28 Jan 2021 11:55:12 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:60564
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1l5AZZ-0007w8-EO; Thu, 28 Jan 2021 11:55:11 -0500
Received: from macbook01.bib.uni-mannheim.de (macbook01.bib.uni-mannheim.de
 [134.155.36.117])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id C397EDA07F0;
 Thu, 28 Jan 2021 17:55:06 +0100 (CET)
Subject: Re: [PATCH v6 00/11] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <d0d51e27-f464-9b04-affa-3c599f1eb6b5@weilnetz.de>
Date: Thu, 28 Jan 2021 17:55:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120224444.71840-1-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oc9QuWbLN+De

Am 20.01.21 um 23:44 schrieb Alexander Graf:

> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
>
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
>
>    - Live migration / savevm
>    - gdbstub debugging (SP register)
>
>
> Enjoy!
>
> Alex


Alex, did you already try running `make check-tcg` on a new Mac?

I currently struggle with tests/tcg/aarch64/system/boot.S which is not 
accepted by the Apple clang compiler.

It first complains about ".section .rodata". That can be replaced by 
".cstring", but then other errors are reported (unknown AArch64 fixup 
kind, ADR/ADRP relocations must be GOT relative, fixup value out of range).

Regards,

Stefan

