Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp344756lfb;
        Thu, 3 Dec 2020 05:02:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDmNOAW4jKMCIcCBqutLQjiBqKogEWDFXsJG5jLIt+4spE1jiHD8V0kK1PGaQz6i+cnCc3
X-Received: by 2002:a25:c054:: with SMTP id c81mr4579305ybf.184.1607000571405;
        Thu, 03 Dec 2020 05:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607000571; cv=none;
        d=google.com; s=arc-20160816;
        b=sqpNztfJb28/ZsyRg/UjjvmhhH7wFKrRueb+p6bgwm6ZnVbWUHYVrHQZwtBA9NNb3t
         RUVfeYMi5xmeUqsXeFB7krNo0Q2SXIWlUZLjxFvGyG5bIw/V6HuOG9d21VRX1g5Cp68E
         Y/q4L6eJiPkOq38sX/fYd9kZDO6sv1YpFMvsBBXhBBRX+SZvzU8+nKJ2FeBTXbX0FEqy
         Q8zJxn4aBvlzpDJUzlr6fFJJBZzlYZ6w5JJo7kMGCB0qe74zusRLRho3SBO5Oj0PPkxz
         OWhvMmBlEvdH11xQRbMc2fvt+sU0wQZCUrA6yXTJWaPrGYD4LhNBjnYiPwZefOnZAwVc
         5SmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=EqtnYKuxTXFz8hVlyG13tZ4cMa1SxJUgFvUR+bkRYow=;
        b=HDQshgNmNbyiNgJCi3qljXar+1FEBQ7hQIz0Myezl2KiICvZ9tPYcE//WdWsfaoOGh
         WoOBGB+mPWIhH8vT47V5sZ/IQyKnVSGoIM+hNmKVQoh7mISLXOkmPTkZNitM8kn9jvRb
         mysRFQcVYxNti09fDQhSOOGJ71kqjotU8Xwy82F5/h5eBIWeeWHxoTuhTiDbnHml3jH4
         j6D31bujHwY4Lv9Riukf3HARvU4wckUnKYSdFocG2rTnKMJg691oT/X1QfsKxx0IlR69
         hbCjKH+k2V+RkOXaGwco02GfV3z3jNGU8bo8E4AWgnWEreIli0fh0JzM0TPS2TY7vVRQ
         VGYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=D8+2IqVN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si1869901ybe.402.2020.12.03.05.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 05:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=D8+2IqVN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkoG2-0007CZ-M5
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 08:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkoFd-00079l-GZ; Thu, 03 Dec 2020 08:02:29 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:36298 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkoFZ-00038u-Ld; Thu, 03 Dec 2020 08:02:25 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C1A2C413E4;
 Thu,  3 Dec 2020 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607000533;
 x=1608814934; bh=CL4/18eonhp2DebrzEauZKFHFiBt5QLcBVr0+4Yp9H4=; b=
 D8+2IqVNiCyjcdFpgO72SQRmLl90pg9Pd1kWakzDe47H4gR2/dnakyDqCRshOmb+
 DT3gLakUGJ0+3W1KV9jpwzNJkbreOpnGEVU6deWgtGi6yM8nVDMyhX0kms4n8uMF
 Za6frn8TyBzDLVa00TtxQZJMuWIGyqhvQudjjBnk9zs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTncT90QvS9m; Thu,  3 Dec 2020 16:02:13 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 768A04137E;
 Thu,  3 Dec 2020 16:02:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 16:02:13 +0300
Date: Thu, 3 Dec 2020 16:02:33 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 05/10] hvf: arm: Mark CPU as dirty on reset
Message-ID: <20201203130233.GA14685@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-6-agraf@csgraf.de>
 <20201203015218.GA82480@SPB-NB-133.local>
 <55e5dac5-6508-da7f-3f29-05ee225b13da@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55e5dac5-6508-da7f-3f29-05ee225b13da@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dVuk8q4mL9Bp

On Thu, Dec 03, 2020 at 11:55:17AM +0100, Alexander Graf wrote:
> 
> On 03.12.20 02:52, Roman Bolshakov wrote:
> > On Wed, Dec 02, 2020 at 08:04:03PM +0100, Alexander Graf wrote:
> > > When clearing internal state of a CPU, we should also make sure that HVF
> > > knows about it and can push the new values down to vcpu state.
> > > 
> > I'm sorry if I'm asking something dumb. But isn't
> > cpu_synchronize_all_post_reset() is supposed to push QEMU state into HVF
> > (or any other accel) after reset?
> > 
> > For x86 it used to work:
> > 
> >    static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
> >                                                  run_on_cpu_data arg)
> >    {
> >        hvf_put_registers(cpu);
> >        cpu->vcpu_dirty = false;
> >    }
> 
> 
> Yes, it works because after the reset is done, there is no other register
> modification happening. With the PSCI emulation code in QEMU, we still do
> modify CPU state after reset though.
> 

Maybe I miss something but that doesn't seem correct. Why PSCI reset is
split from machine reset?

> Different question though: Why do we need the post_reset() call at all here
> to push state?

My understanding that post_reset is akin to a commit of the CPU state
after all reset actions have been done to QEMU CPU Arch env state. i.e.
arch/machine reset modifies env state and then the env is pushed to
accel. cpu->vcpu_dirty is cleared because env is in-sync with vcpu.

> We would just push it on the next run anyways, right?

That's correct (at least for x86 HVF).

> So if we don't set vcpu_dirty to false then, we wouldn't need this
> patch here I think.
>

That's right but the same post-reset approach is used for all accels,
including KVM. But I haven't found this for TCG.

Regards,
Roman
