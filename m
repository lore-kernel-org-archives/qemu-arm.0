Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1711363lfc;
        Wed, 10 Feb 2021 14:36:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygjL/7JPTsya8yx+IA4RC/HEjx9HMeMaHr/5OQRGd3JyM25UVedzxf2TBchbxjsTScjBE/
X-Received: by 2002:a25:4408:: with SMTP id r8mr7288516yba.515.1612996578502;
        Wed, 10 Feb 2021 14:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612996578; cv=none;
        d=google.com; s=arc-20160816;
        b=rG6z3kx6aGahUb9DlZUwQ+aGgdFlGqQqT34auWO4qRQ5odQZuQDnMBog7AqsMkdd93
         e3GRK11yga21z1WcfSluMayeM7j/h4O3rKV1rzX6NCUej+5TrWBa32bC1ZMmPs7fnM2C
         VFqtj6V4YQ7fh9ji9byxGL17TlcEp4iM9gXdDuUGEGn6I+7Q1hhv1gIx7m/7OJG5EQCv
         6/9qeh9RmMuc6wSgSkHVZcpU9FAYzJO0iRqlC5KsFhQM5utpsBiQv0Q9nrkVynqBbxk9
         gd/o+jvNjV/tD5z2qJylfxCzypzXg/zoZRmk75bVENpOxmwLv1ci/nncMudqZHiO+9FA
         IfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/8re+nLzeAe9plhqUGOee0qJAMbzRcxGYHdwPlK01gM=;
        b=whpUrHbMzmIpbWGa75VAqJUmRE/1eBrScPPGsaJOUNz+eumd2YQZElFgr03XfWC9KB
         ww/k3LZdod1pQnCZfy7jBPOujl7URbDisVYcm7+BVZisKt4OqJbB03SOdY08OGj0evBq
         l1+s1Mu1SJDnnHZLGRjNjTfpLO6WI2YGMiKvntGdnLopw2eC2BjgTcsS5vxAeEKBW0WO
         OfILoXeH64AZU0fkW+9yHK4/2bybH8WPgNxsBrFtFR1E+BunShn5eULskyCWlFg+i/rl
         ZXudfRIbZLGfznqxwHDkYwMR5pDpNX0CZcfQEVX65zGjFWjMKy0yJcRaVOBTW5IIA8Kz
         G/cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPG6ZFVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si2899919ybp.412.2021.02.10.14.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 14:36:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPG6ZFVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9y5p-0004Em-RT
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 17:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xo6-0003wF-MQ
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:17:59 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xo2-0005zJ-PI
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:17:58 -0500
Received: by mail-ej1-x636.google.com with SMTP id y9so6868131ejp.10
 for <qemu-arm@nongnu.org>; Wed, 10 Feb 2021 14:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8re+nLzeAe9plhqUGOee0qJAMbzRcxGYHdwPlK01gM=;
 b=UPG6ZFVQlVgZ0B8tF0LjmHNK3+cdx1r8DCpCjhxsOIQmJ+bCjGvM1Sh9JtU73NvpI/
 Zi6JCjPu4fcvIqnm04yidWDa9TXqqbnWF+AS3Zd5NHr5MW/CG/bLar58Ej8yhunPc9iP
 wLkAyTm4kuH5GcytTzUkoH4YvEAiTsi3wTJNEehoQ5Z8fY+KT/bAjgaFAU/XABZKWO5T
 xeCM+dvy4dtnwBDvqQUcrb0tB/Z5d93zQn9CJ04Xdc9JuQVXosb7OrOaajzCX/iifAp7
 6Kq/KnC5tPTxhOmJqlDT99t+9GFNy4FqDCKISn9Sx6iO50uDduve6cuXyPJu7vqc+FoQ
 Mv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8re+nLzeAe9plhqUGOee0qJAMbzRcxGYHdwPlK01gM=;
 b=m5fZUE0CKdXRwHjWiyl5TKZY1iDkg3EvDZBJ7a5rirkqxzPdo0zkp3uKEW8JC8vfaH
 ZsZa3sxncMMkD/9/CG0Ah253G0/SFk3WlO6ou0MsC+kTf5ZNoSG0jDdJdjRd4MPg28Y+
 Wckps04phxn163Eenau9fasjaD1hu2Lwz+ZbOXMFIsLybNSva91fXW2Jv/qoPbfq1W8d
 b0S3PWjN8SmZBZ2o6LvMof3gyA0ub1+B9ughBMbXoEr+F8wuf8Oe+R2FJEBFPCUz7nQt
 bpvLqsYbLevqPt1/YHNeESKgRxz7okpCtBqcgfdPtkviKaiBfKyQlJenwmAJQNxyxvKs
 d2cw==
X-Gm-Message-State: AOAM530yg8UQhvDd6ovKKmgTbgIDcuoacV121C1Yhbk0Oifks8gpC8br
 Wr1ZTm5mGGMuNEIwumv9zPwJAz3ch4isUflK9nx5Hw==
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr5143050eji.407.1612995471903; 
 Wed, 10 Feb 2021 14:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
 <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
 <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
In-Reply-To: <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 22:17:40 +0000
Message-ID: <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
To: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X0Fn4ATC6Ur7

On Wed, 10 Feb 2021 at 20:25, Peter Collingbourne <pcc@google.com> wrote:
>
> On Thu, Jan 28, 2021 at 8:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
> > > +                if (!seconds && nanos < 2000000) {
> > > +                    break;
> > > +                }
> > > +
> > > +                struct timespec ts = { seconds, nanos };
> > > +                hvf_wait_for_ipi(cpu, &ts);
> > > +            }
> >
> > Why doesn't the timer timeout manifest as an IPI ? (Put another way,
> > why is the timer interrupt special?)
>
> Timer timeouts result in an IPI (via HV_EXIT_REASON_VTIMER_ACTIVATED)
> if they become due while in hv_vcpu_run(). But at this point we are
> not in hv_vcpu_run() (due to the aforementioned difference in wait
> behavior between x86 and ARM) so we need to "manually" wait for the
> timer to become due, re-enter the guest, let it exit with
> HV_EXIT_REASON_VTIMER_ACTIVATED and then trigger the IPI.

But WFI doesn't just wait for a timer interrupt, it waits for
any interrupt. So it doesn't seem right that the timer interrupt
in particular is being handled specially here.

thanks
-- PMM
