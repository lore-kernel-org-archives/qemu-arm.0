Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1020911lff;
        Fri, 6 Dec 2019 09:11:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPGlJWsw22f1TBR0yQqr5JVts7JREiG1F1hVmo1Kqqdu2UfLYO87iFu5x6tOjAZE7BhZ7v
X-Received: by 2002:ac8:5513:: with SMTP id j19mr13643384qtq.143.1575652297988;
        Fri, 06 Dec 2019 09:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575652297; cv=none;
        d=google.com; s=arc-20160816;
        b=XjE6AyTm4hE7EC6U43cvERr2qyRL6arHGMxX81Z8Lpx6NHYFAXb5cT1sJDh7o+tx/X
         5SHQOWBkziQPPV2ra6wgxs6F7wdGkdshjZWTFwU0ehDTKcGI7bG7HryqZ8s7HvHUA1vp
         VeqWoNGAxqPYNKpjs/EI8EqzSqQtAOE2MNOEz0XbNKZ/j1Gt12z+XuJK7XFHvP6wmGUP
         7D2pfAuHoFJeP7TTR+g1I8bK5Bf4s/m5wBqRgmVo65EcJzddR6/PgBeWczChF94ehZiF
         Bj7C9V0Z5vIpq94TM7mBYTho/YkmGRJaQe9yA8EwNOs7wNr8rzhsaF6CW0WihtHYN8iC
         mJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLL/PA8yye6H36YmDTDJ1uLtOzjPFZ9wMfmCB3T9Qaw=;
        b=c2q76CvQyWF4oPQlVUtZIgxp9Nje5XaFinS1faScAkaijR+1eHCn2zZs8dE30CZE4S
         i4XdCEPp55YkEe+GG6wZAtjHJbI/8FsDoJEov11u02+tlBnNhpVqOywuURO2SVDPyw0M
         hLAwZmRjRMNzGyNOlNJkCJh0xm0H+WnXsdWe/n3Oh7V/c9gJtnQfG/hb79IlEcHWmVPk
         i+2bnR6nVVo8ym0iWSouTb6yVpsMG2OKAyCdWyXNEdY3pAKz022acSOjnTiy++rTiQL0
         gEkD3c+B0mfrp6Pdov1ESWjUml/mYHoxa1oqS3iJH398cOMPnuM0QUxoU5OGlKiXLPO3
         qsEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fFIDUgKO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si9273658qke.264.2019.12.06.09.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 09:11:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fFIDUgKO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idH8j-0000lS-0S
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 12:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idFRn-0008DP-VU
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idFRm-000785-Iq
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:23:11 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idFRm-00075a-8o
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:23:10 -0500
Received: by mail-ot1-x344.google.com with SMTP id 66so6081470otd.9
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 07:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lLL/PA8yye6H36YmDTDJ1uLtOzjPFZ9wMfmCB3T9Qaw=;
 b=fFIDUgKOI1eK6U6SOWpzPMY5IN6xLt9g7ESb8lserQJo4MEbirU+ui8SF1e4sw60+S
 E1Xf+J43b/F8q3V8NvBwVLwOIL+W1EsXSxY3Dc2H9NlwF6aeE470tJBYmDgrRTfeLvkF
 HFrAomGXZqDzHmZM+HrnhTUJ5UC5Z9v1YgiMUWq5mBdT9vUPGwE9emNaiP4EtNUwNi45
 FwliZR36D0M1XhKbSPx3HbHNsiLnn40s84Yd8RL2ISNZhZW4RqPVCnakx+J9v3PeY33F
 mxlimG9lU9M5Jw4qT+gnRtXyt5g6zGUS2kYQaFu5E1f2aDM0Kv0AaSW8BLUBbh3XK6yb
 IpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lLL/PA8yye6H36YmDTDJ1uLtOzjPFZ9wMfmCB3T9Qaw=;
 b=ltjCEJcm/I3FhuOZaC1DB8Pe5amMQGm2pw2T8CDX9kg3823LxZynvNeCNYYEgHMmta
 Lz6/l7PZCOsIUTUZbnuXj3hv3+lGDpcs2MGPKLscLMXLhfD9gr6eW33Xi35ZP7cmW68R
 yT7HHsLkftd4A3yZ90oABwKlC8X08ejM5xur3nAxQ0xWcw4a74LJfbQRAVYCnvpgibox
 oLtocwv2YYyDlsBz0VPui2U6wf/Jxi69R9Hwf/ObcY+1kHzLkgd0Oz04RC2Or141s9bS
 +51TysZQJ8aUGFVvPw73EeztJdT/5tq2zgB0annJwprdxFXRLJkoHvDef41nVvGahYcZ
 f+YA==
X-Gm-Message-State: APjAAAXAAekccDXBCsaxOnvD9GU4nJLaESQ0ANAW7434v+0jwkMoyEX8
 uT9TNpPnujl36/pb9LlVQdAy5uO2dzeDUh0oCP86vA==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr11769992otg.232.1575645789270; 
 Fri, 06 Dec 2019 07:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20191016143410.5023-1-drjones@redhat.com>
In-Reply-To: <20191016143410.5023-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 15:22:58 +0000
Message-ID: <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, bijan.mottahedeh@oracle.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tygNZNzmJzer

On Wed, 16 Oct 2019 at 15:34, Andrew Jones <drjones@redhat.com> wrote:
>
> v2:
>  - move from RFC status to v1
>  - put kvm_arm_vm_state_change() in kvm.c to share among kvm32.c and kvm64.c
>  - add r-b's from Richard
>
>
> This series is inspired by a series[1] posted by Bijan Mottahedeh about
> a year ago.  The problem described in the cover letter of [1] is easily
> reproducible and some users would like to have the option to avoid it.
> However the solution, which is to adjust the virtual counter offset each
> time the VM transitions to the running state, introduces a different
> problem, which is that the virtual and physical counters diverge.  As
> described in the cover letter of [1] this divergence is easily observed
> when comparing the output of `date` and `hwclock` after suspending the
> guest, waiting a while, and then resuming it.  Because this different
> problem may actually be worse for some users, unlike [1], the series
> posted here makes the virtual counter offset adjustment optional and not
> even enabled by default.  Besides the adjustment being optional, this
> series approaches the needed changes differently to apply them in more
> appropriate locations.  Finally, unlike [1], this series doesn't attempt
> to measure "pause time" itself.  Simply using QEMU_CLOCK_VIRTUAL, which
> only ticks when the VM is not stopped, is sufficient.

So I guess my overall question is "what is the x86 solution to
this problem, and why is this all arm-specific?" It would also
be helpful to know how it fits into all the other proposals regarding
time in VMs.

thanks
-- PMM
