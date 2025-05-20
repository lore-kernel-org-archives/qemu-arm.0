Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp306192njc;
        Mon, 19 May 2025 23:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDWvKAPSgbI2NVnoMIVAXzYiEYM3dVGUpBBA8t+9lcZaWmzczxSBC4bTjE/BEBAkVWvpJ6teKOUP7AlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEnDakD3gYvzWVQXveaiUxN7lHP7057cOGaDpkHhqds3BksMZsUeZzVl9GIn2RR+DI7d2YO
X-Received: by 2002:a05:622a:5591:b0:498:d51b:d0b4 with SMTP id d75a77b69052e-498d51bd341mr123056711cf.14.1747723683438;
        Mon, 19 May 2025 23:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747723683; cv=none;
        d=google.com; s=arc-20240605;
        b=NzbiJZIq957Rjjevn58lw32lhe5C+5S+cn9A1CrYkQ9+noFJ0GRBT28Vas3/w0zGtK
         /mhZ2JJhxB6gc2ifMqKTG9K54dzlNSXZQ4FlsP6aQ8ifsDokDaoyR8afdz+udmOIWyDx
         6V7WtsV3PoJ79+uYR72pbZsLRaCmQfWrqa9vLhN+4drRcW9KErKZoBlTl8z121R6yObd
         1e8j0vwJdVsbVKxL2+UJN1jpoPGdDRnQ9w6pTfB7B59vkcokXF64vm8iNY4sn1xbR0FK
         0RVC62c/brKZliwByH/+T7NOtqClz6vONr/ygd/5PqpAr6Ychaw09d4MVK21qB/qWO8C
         OYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=81vH+MlcTY97u7H/CHW9IeTGpjOeZavDcZcCVYmR+Yk=;
        fh=MtdoSzmle7jcu5dXxQxASp9OsmK1Y2TTrWmqjZuEP3U=;
        b=DxhMsx3qTEQksZsgazWG2aSaIFMwgsSQiB3x0mHkpBHKHZMJj+Go9rS/lh+wdBeC0B
         dqdQd8TmsPF4kqbvLXF2Mf04AqJ2r8IYTzdltfiJy9oTiqpmmne4vcdXfzCceoMVgfmT
         qI/dQWGd8Y4VjOytZKN5XXkXwmpCjHxS9MP+Amp+inRR9vxMhXlutHII1lrcma9PbL/3
         UZlfF9VHauO9gp8XdH3ks3jY5KlkKP/7EX1klnjw5Jb1tVbXablHA/SEkNxRUzJrYWXk
         4RZyHfbvEQmgsZQVzYxcvqCx5vPVzuwHNKsaw79Het9d38GXL4QKe4Ty18sPYmo67Bet
         +7QQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AjeJfcbo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40c1d8si102093401cf.135.2025.05.19.23.48.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 23:48:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AjeJfcbo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uHGlZ-0001LT-6B; Tue, 20 May 2025 02:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uHGlP-000172-Rh; Tue, 20 May 2025 02:47:49 -0400
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uHGlN-0006yy-TD; Tue, 20 May 2025 02:47:47 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6FDE8A4D97B;
 Tue, 20 May 2025 06:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E6EC4CEE9;
 Tue, 20 May 2025 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747723664;
 bh=n9eHYTR2G0ZOX2X+WcAxPwfwrHUt6xhEfBxV5W3ZGaU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AjeJfcboWc3Cvf46j/fHBWI9ENPs+NBSfbR6HNmDS5dFYzUnT2ZnHVGJVr5yrCiRr
 lQD+RsXw/oYji5pHQynUafr2DOa1N8jMJrrYYKWfLBOu39KHgAS3OUZz6cdLFOtcLA
 0vYAXJSGWIRZky7beBCJIYtSOzpOt2jXYS9EO8VwP/ajKlbpHQhH5Abm/CmwBwft+W
 /UOYWwYY+XCSWzdhAlQITCCNqWptjyVClfhqkzkWwL/y+CgDuD0cUJRL6Mh7L9EuSa
 /vclnZFd++vgbY3E9dsydVrqU5kFg9cMN2l0SlVoQC10Nfzue53p7+ggLAD/rjL0dB
 de1OqFMDKAjuQ==
Date: Tue, 20 May 2025 08:47:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Gavin Shan <gshan@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 09/20] acpi/ghes: don't hard-code the number of
 sources for HEST table
Message-ID: <20250520084738.4dcf9cef@foz.lan>
In-Reply-To: <20250512154053-mutt-send-email-mst@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
 <1c024a700815fa4a100fc3bada477481fd266a83.1741374594.git.mchehab+huawei@kernel.org>
 <20250512154053-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.13,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l29wLdik//w7

Em Mon, 12 May 2025 15:42:27 -0400
"Michael S. Tsirkin" <mst@redhat.com> escreveu:

> On Fri, Mar 07, 2025 at 08:14:38PM +0100, Mauro Carvalho Chehab wrote:
> > The current code is actually dependent on having just one error
> > structure with a single source, as any change there would cause
> > migration issues.
> > 
> > As the number of sources should be arch-dependent, as it will depend on
> > what kind of notifications will exist, and how many errors can be
> > reported at the same time, change the logic to be more flexible,
> > allowing the number of sources to be defined when building the
> > HEST table by the caller.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Breaks CI:
> 
> https://gitlab.com/mstredhat/qemu/-/jobs/10007863974
> 
> I dropped the patchset for now, pls rebase and repost.

Compilation was happening fine for me. I suspect that some rebase
dropped a change here:

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a256f9d817cd..a1492bcaeb8d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2360,7 +2360,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SEA,
+                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
                                              paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {

but somehow, ninja didn't detect and was keep using an already
compiled kvm.o object. Anyway, fixed at the new series:

	https://lore.kernel.org/qemu-devel/9404b305e0fefdb14dce4839c3d96ccedf0533e0.1747722973.git.mchehab+huawei@kernel.org/T/#u

And, just in case, I removed ./build directory and recompiled it
again.

Thanks,
Mauro
