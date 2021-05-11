Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4094336lfg;
        Tue, 11 May 2021 08:29:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGBBq184An3bySR5jNVUknaGCn2hI4MaZZr+qsDYwwBHm2C2QTXIa+BjXbXHnP9QJbur6j
X-Received: by 2002:a05:6e02:12e9:: with SMTP id l9mr27409881iln.28.1620746953584;
        Tue, 11 May 2021 08:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620746953; cv=none;
        d=google.com; s=arc-20160816;
        b=I21p8zDWTZc/4w1EitITcb8aLryOlms+20uSJxgtMgs0TUpIxvayNtvI1BYOkMfo55
         m8I2oybEKwtgyAJl4yeWqRLk9T/ljQOAtviHzUH8TbRV88cZFgyzv6zXHe/qlZ7fnoM3
         3vpt0O1DDwi2O39usiRqQJ9OjFTxx0tdR9VPewhEfivnZxH0sNJXauy5wEM3fkwJmElW
         /XO1ONnhbjYb0ZwTAARvMBrDHmYQvDOeRkbo5y+6Vj3Crlhpe0/LTQu9YDsnLGZB3nZt
         zZY38jLzPqgL7S8J0LXlMCPFIZL1ypl4Tdh49qS5at/qGWKn6vX33I4TCLoyqFtppzEL
         yG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=QsZVtNa2EXiIoxLz+Nk0Lcb1b5ExvaZ6F5xBrYoB/vk=;
        b=n8dRlNUm4xvsFN23IjoTQi3mDxT6B+m4wGHFKWvc5fXfRyJFWaWOQ84sSHHodZaaab
         cfqyF7EITB0pkJ5gBiNtSyVZG3AsQ2sF0dgN912F4a8no2QW2j8AAKI/PNwhZmY9wE+Y
         HpajfxKgcAd0jiVoHwlHbJZv1Kf+ppx+qZjxxCzpHDwo/dPED6a2rE1GgWMbEeR9ig7v
         p7GdyGl0vvHYWooOyi2CI/9+ZqHk8HOHHvIrAdicgcde+J8SoZwI+wNzlhRhOuXRPyUm
         k6iYGQTLNPPwQbCQbbAL9PChgCNy9V3L6M+njZHAxGK4Wlt0vpugG9E7z4uLj4Nk9218
         VJuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZGiTuxFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si19886763ild.137.2021.05.11.08.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 08:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZGiTuxFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUJs-0002JR-V9
	for alex.bennee@linaro.org; Tue, 11 May 2021 11:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1lgU6t-0003Nw-6s
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:15:48 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:34749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1lgU6q-0007Z8-Mb
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:15:46 -0400
Received: by mail-lf1-x12f.google.com with SMTP id z13so29213069lft.1
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QsZVtNa2EXiIoxLz+Nk0Lcb1b5ExvaZ6F5xBrYoB/vk=;
 b=ZGiTuxFS864FTvCRvVzlMYAxYfANzz2MCSUrgh1dPAE0BmcBRdA0OBfnJgG2CrF2MR
 OGuebC32iDccsb1jJpkCYhrBiPATv04fYOFg5gox+b53Qv95OWBQJWGBknYtesSZSVlW
 60cmVhPQOQVqkh/zDXwYLvhl/NXKHHE2QXM08BD2KgieWyrCOABhdOvuF7kRIJUnIoj5
 1RQpuAztSa9c6CVwPC6hBoOYiCTlLY3t0W+nIWEVFYSSdQluFS0s/96D6cH6hAM5xYmp
 KYp+W4i3KJzGWnVEkBk7NkS42uqS2ad912YFFA/x9qrAF25SpG/AxZ4BJR8Gwt8n3no/
 Jqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QsZVtNa2EXiIoxLz+Nk0Lcb1b5ExvaZ6F5xBrYoB/vk=;
 b=mE6zBBN/57Q1MwX8ipZuEFPlZorkn6hfmc8y5MZQzvqd7y8Q+gSzQF3Fg1jFeoaHq0
 8ZI/psSk3OwNAU58+QToSA6G2t8bWX2x4CQYdCZbM9WyfDmpC59w+R8ClrtjmQ74Xl6B
 fHrWXLH6tWyIwKhLHM3jx5fQYfBDkLyWlOeCqRyxxXazX/PELVzDHl7uJ+smtgpgZOzl
 Y3717/W2japIS8wBRkOwU6yMwzdnX8w0RQePjqHIR8x+5nYuhQHYXo87Rmfh2O+EXV/F
 lW8MqOULvuDqR8rJhxb1tu13CRZQyLz1ObIZdXnUb4tTCo/KqoMWEemWI7/EvIimdiJu
 LdJA==
X-Gm-Message-State: AOAM530rRqly+d6Wq+/HYWSsoE1Eyzjse/nB5gBfDXagzftH0YOb1ED0
 OFngmNlJ0EO8GYET0CLC8IhG7bUejq3um4uUDfTgpG/oolZ8cw==
X-Received: by 2002:a05:6512:2209:: with SMTP id
 h9mr21385300lfu.474.1620746141414; 
 Tue, 11 May 2021 08:15:41 -0700 (PDT)
MIME-Version: 1.0
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Tue, 11 May 2021 18:15:30 +0300
Message-ID: <CAE=NcrZ1vjVsSDpaKvvSgOA19Hx6-9WN-zJOYoUtZBbYt1LZPA@mail.gmail.com>
Subject: mysterious slowdown when debugging a kvm guest within system emulation
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QeDR896yWQKb

Hi,

I'm hacking on our own hypervisor variant for mobile use
(https://github.com/jkrh/kvms) and I use QEMU as a development tool
for the job. I can mimic a generic arm64 host and run a bunch of KVM
guests on it. Everything seems to be in order QEMU wise and things
seem to work pretty much per the spec, apart that the cache is just
way too reliable ;)

That being said, now I'm not sure if I'm looking at a QEMU bug or my
own. Executing KVM guest paging seems to gradually slow down if the
given kvm guest has a debugger attached to it within a system
emulation. Without the debugger everything is fine. Note that I can
have the host qemu and a debugger attached to it just fine, things
will always work fine. The issue only arises when a new KVM guest is
being spawned under a debugger within the system emulation.

If I log this from my hypervisor, everything seems fine. Page faults
are being served OK, the execution speed just slowly slows down and it
will probably take a day for a guest to boot. The funny observation is
that if I interrupt that debugger session (the kvm guest one), allow
it to rest a sec and hit continue, the page faults speed up again for
a while. I can also happily 'stepi' the code and everything is always
fine, things will only drastically slow down during free execution and
having the debugger attached to it.

Any pointers on how to debug and see where the QEMU spends the time?
It looks to me it's really the instructions that become heavier and
heavier over time as the guest goes on.


--
Janne
