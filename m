Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45696CD98F8
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 07:35:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waTke-0005mX-Lw; Fri, 19 Jun 2026 03:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1waTkc-0005m5-R1
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 03:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1waTkb-0001ac-5u
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 03:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781854491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2L2eBJBzX9l63aJaDnbTlqkL9dQbt0gTedHcVbPgIs=;
 b=gMudhkbRGLRFcMWNHeSHMa0155H+uG780DL2mk6hve023pD4ewkJhA7KyLiuX/FbleLDBr
 Lw83u1f0L24tR5KL7hsWf3UWd9CFaQfnIWtkZPki4OIrTHzTtRQCK9zFviY1nsp/s6PvIp
 wGVdUY0TC5LX6XnQzwaMMEeoDQ75gHM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-y2V-drmeMu2b9CUD49NITQ-1; Fri, 19 Jun 2026 03:34:50 -0400
X-MC-Unique: y2V-drmeMu2b9CUD49NITQ-1
X-Mimecast-MFC-AGG-ID: y2V-drmeMu2b9CUD49NITQ_1781854489
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490ab3f6e55so9416175e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 00:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781854489; x=1782459289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x2L2eBJBzX9l63aJaDnbTlqkL9dQbt0gTedHcVbPgIs=;
 b=VxD/vWWEgp04ly6iYJNPGHuWRrkyTKuGm497GYro4VKK7HPBVzywlJI3ddKD4ER44I
 rwObJaaZajhvnrllWiKAJGZbGejBVnX7r+Z0u9coGwnZJN3fyVzndndO29wG7PRzWSnT
 bTyBFE9d6JicnPMoiYBHF5KzdwISnHENIy7dr+mohU/8Aq4hDH2Y4Hh9CktJW3ZsPs3C
 dSYXgZiF2fA2kf5jOgwaKLnS718qDfY5shdL/8KFaRjBJNpjEUTG7/IzGG1E7p+87wiV
 A5SUMzOz7MZ78/Qn5vzZeuzphH0BgOzwuP0kFKgbioEQhuy0q0/Soqw1SLqYmNvfPD7L
 NR/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ85UhbLRfwCI3ywv8O16iORzP8PTFqrAlTJWkjH0n+doNK54ozXRIIfCc7pw44BXchIBDnpZotAqw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6yIEIK7IvojpSg6Xfe/AHj8NX1DWB7tkHXar5h0e+3UPulxoi
 eU+NtF0ejlJ9CaONbcSPqJwnRliVrAxzlXDpd7omREn9WPChxYvv4W66I9S0goRiRwDx2/IdOUZ
 dI61RHcqVare9u8WsQsTTD1W+9BxLzfYvqEZvezDVhZYYR8+5ziVkMA==
X-Gm-Gg: AfdE7cl3JfOuKHk4ehnr3oGOy8eWoS6eR/EFItaVhr4QF1cHwKAo1GFHD+Zk4+XdQc/
 rK2cVYPhJ+C2C0EE4Q1M/I5gMsCt+U54q/+YlLBAOKGkT5Z/LTbRAxAZC8JJJsfmMQzMZNf3WKC
 rzQ7rSZgawdZNOybzYfrGz03rEkiW9pzuyvjpSTZzIB8tqfD42KNpRZ+L86dDYvmoqJHql5v1OS
 0WlXGxCUg3L5bv+BLJDFZ7QCCxMovO6qYr2snWrjVDvC3Ry9VxELskzQ4opkkg9mCuCknq7A4yM
 DWdzbopFQkoq6sGSPpzuzB8UHVE2aYistbXXfjBKYM6hBeNW37cutDzz8WAWv78WdYtamp0=
X-Received: by 2002:a05:600c:8a8:b0:492:3dce:f6ef with SMTP id
 5b1f17b1804b1-49240e9cca0mr24374225e9.28.1781854488825; 
 Fri, 19 Jun 2026 00:34:48 -0700 (PDT)
X-Received: by 2002:a05:600c:8a8:b0:492:3dce:f6ef with SMTP id
 5b1f17b1804b1-49240e9cca0mr24374005e9.28.1781854488420; 
 Fri, 19 Jun 2026 00:34:48 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650b67a34asm6507850f8f.22.2026.06.19.00.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 00:34:47 -0700 (PDT)
Date: Fri, 19 Jun 2026 09:34:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com,
 pbonzini@redhat.com, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 07/21] arm: sbsa_gwdt: fixup default "clock-frequency"
Message-ID: <20260619093445.3d9572fb@imammedo>
In-Reply-To: <CAFEAcA_KjOEBduVcop_T6-aH_DKy_4=QwTKa04kvKR51S79UQw@mail.gmail.com>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-8-imammedo@redhat.com>
 <CAFEAcA_KjOEBduVcop_T6-aH_DKy_4=QwTKa04kvKR51S79UQw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P8uUwVivP1n8t5HDHJZo3sBdH56JE7oKrUHb0m9YMpI_1781854489
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 18 Jun 2026 15:58:38 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 3 Mar 2026 at 09:26, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > Comment about keeping legacy freq, is wrong to begin with
> > (should be 62.5MHz), but that value also doesn't make
> > sense anymore as the watchdog is used only by un-versioned
> > SBSA board and the later has hard-coded it to 1GHz.
> >
> > Other potential user (arm/virt) also has system clock at 1GHz.  
> 
> It's not quite that simple. We use the back-compat 62.5MHz:
> 
>    *  - for QEMU CPU types added before we standardized on 1GHz
>    *  - for versioned machine types with a version of 9.0 or earlier
> 
> sbsa-ref sets the same 1GHz frequency on both the wdt device
> and also on the CPU objects it creates (because it doesn't have
> to care about back-compat, so we were able to update it).
> The virt board doesn't set the cpu cntfrq property, so it gets
> 62.5MHz in the above situations.
> 
> Changing the default value here is fine, though.
> 
> (I haven't checked whether the subsequent patches in this
> set make sure that when the virt board creates a watchdog
> that it sets the clock-frequency here to match what the
> CPU is is using.)

Current patches don't set it explicitly as it matches current arm/virt.
So for clock to match CPUs, it will need either to be explicitly set
like sbsa does or we reuse compat props to fix it up to 62.5MHz on older
machine types.

> 
> -- PMM
> 


