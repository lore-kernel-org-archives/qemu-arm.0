Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp9803203lfq;
        Sun, 27 Dec 2020 15:13:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYt8pVt+PMaXASnSkIDpY4eJQYhQMhIAJ8lYT0zcaxAwvJzRueICZQX5ePRIbmgrjTY/jh
X-Received: by 2002:a25:2317:: with SMTP id j23mr4010455ybj.388.1609110783774;
        Sun, 27 Dec 2020 15:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609110783; cv=none;
        d=google.com; s=arc-20160816;
        b=ptUK1u0YyY1zfNgXxjU9j6GWKxXxqMAmUJuhs+SfHEK3Hja1sHAdd+zoQ7qGXylyc3
         kcFxbmryif/S6wweYrQNxo4tP93r90lEc6gvMp9yA85atF1f3z5JOoNmOA7Gb1VKjMjS
         z5L/T20s4CPmMUn3ti5SJtW5LhZOGgkpFpWxpS8Dei1Y83S4U5U7c7lHBTXiWPSh7bLK
         W89ucMz7RwnBK1wosfjwZltxJlI0ESypOefhZvnpc/OgM56vaq+uI+vzJ3BRdQaadigA
         PQmBqvMGWP8ZEBv5mxuU4DjZt6rz47D9Ylf6ZcUbvqPjyA1VBxo+g054l3gy24ijF1rD
         vtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=x0tlcnEaIzgDNJFigEv9f9l4gjl1U2/aS1sW7SzoplM=;
        b=iXXbvXL9K0w9pxXSWuRhsR8ub5V+NMi5fHi+gsA9L5DH2jl14JqWjPXCXfchou7R4A
         ZQxeBxdaDNc25GTvc+Na8YRAE/3D1j/OdUVGStCxDcVHFNiSvyE70iDFylQku3iFZp3A
         bAiUNLVxNCdt27Sy/DrhEqmwDNQ5U/7Q+O3a1yiIivWndNX/rs8vrXWrNrM2MU12Ifqn
         S1diOF8F9qzhpzey1vpMV7H/Cy3ARNoG1BX/L6Jl7bYljo3DuuRPuc+vj7k6Qvc9pOga
         k7qrzNDt/x4O9cdAFCo6MFCqDGAOb806esPOIDUQXXo6VShFPJ/uEJqpymxhtDuJqXFq
         Q96w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@mutex.one header.s=default header.b=B2gMQXZp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i136si9161324yba.368.2020.12.27.15.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Dec 2020 15:13:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@mutex.one header.s=default header.b=B2gMQXZp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ktfDj-00066Q-7P
	for alex.bennee@linaro.org; Sun, 27 Dec 2020 18:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1ktfDX-00066B-EY; Sun, 27 Dec 2020 18:12:51 -0500
Received: from mail.mutex.one ([62.77.152.124]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1ktfDV-00074Q-Px; Sun, 27 Dec 2020 18:12:51 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 4577CBF426F7;
 Mon, 28 Dec 2020 01:12:45 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lUszS5YsjFg; Mon, 28 Dec 2020 01:12:44 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 580F9BF426BC;
 Mon, 28 Dec 2020 01:12:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1609110764; bh=xS/FIkdJMUsq++QyeLG4EutDW3emZ/ZZcdspCegkC5M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=B2gMQXZpuHAWmgeYVTeBlV3KvhmHi3E09VoFGO0zMnXdyeGXujvrIKwDTrDroiGOZ
 H8iztdTKIiBBWZUOMjvpkXI/fMNsGxUjAvrxiOVJJqxeI+ChLbYSTzvdIdY+o2T58X
 UuOqg8NADFsStj2WtTEi/wUD/q1LCZiVxBYxgN5I=
From: Marian Posteuca <posteuca@mutex.one>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
In-Reply-To: <93c58d9d-63c6-b2d8-2b12-d7ed4aa1b171@redhat.com>
References: <20201222113353.31224-1-posteuca@mutex.one>
 <d04375f8-f6bc-91d6-cd6e-217a689002e3@msgid.tls.msk.ru>
 <87eejh4zpq.fsf@mutex.one>
 <93c58d9d-63c6-b2d8-2b12-d7ed4aa1b171@redhat.com>
Date: Mon, 28 Dec 2020 01:12:40 +0200
Message-ID: <87tus64zdj.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=62.77.152.124; envelope-from=posteuca@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KHPYg2Li0BCm

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 22/12/20 16:39, Marian Posteuca wrote:
>>>> Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
>>>> to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
>>>> table name.
>>>>
>>>> Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
>>>> and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
>>>> found, the game crashes(this may be an intentional detection
>>>> mechanism to prevent playing the game in a virtualized environment).
>>> This isn't a technical question/comment about the patch itself, but
>>> about something different.  Do we really want to play this whack-a-mole
>>> game? If we change ACPI table IDs, those who want to disallow running
>>> their software inside qemu/kvm will find some other way to check for
>>> this environment. We will change that, - just to be found again. And
>>> so on.. is it productive? I don't think so.
>>
>> My personal opinion is that as long as it's not too difficult to mask
>> that the guest is running in a virtualized environment we should try to
>> do these changes. But I guess this can only be judged on per change basis.
>
> I don't have any particular opinion against the "arms 
> race"/"whack-a-mole" situation.  We played the game (and sort of won, 
> they got tired of changing the drivers) against NVIDIA already.
>
> For 6.0 I'm already planning to revamp a bunch of machine properties, 
> for example making -acpitable file=xxx a synonym for "-machine 
> acpi.tables.N.file=xxx".  Perhaps we could plan for that and make the 
> option "-machine acpi.oem_id".
This looks like a great idea.
Noob question here, should I change my patch in any way for this to happen?
>
> Paolo
