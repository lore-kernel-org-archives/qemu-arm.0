Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1190069njh;
        Fri, 30 May 2025 07:41:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7B4bkKaf+BqGlASAKONxXnNRDpN39mSzI5kS+X5znKYQGZs4aLERDBc1gQ2BJd7SHIBJZVgu9UpLQKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFzns64Yb3TMGeygHAGRH3cYpEbKkmO/jvSvrk9QzPMBDNxUC973hqzz7R21BmiAHi7MT0C
X-Received: by 2002:a05:620a:2996:b0:7ce:c3e8:22c8 with SMTP id af79cd13be357-7d0a49e7b97mr351806685a.9.1748616112971;
        Fri, 30 May 2025 07:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748616112; cv=none;
        d=google.com; s=arc-20240605;
        b=C43a9vLrsp1iqqDFJxhkF0iJKtvd/JvtiTfmQgHlH+OorzYjfjyje56jeFhvH08tmJ
         fNY9oWBkBYto+loGWRFfsQSWpDaIazboNwM5rlD9Y5Ie3KVlhhmtxmJOH+mMhyGqgJQM
         gMnmabkC2zBRW4vOA60VKxPXgf87DmuxrU7/K4aRMkCOAy9U7b3F+L35MN5oovYCEQRV
         fcy6QK2Vuk0DB7524vcfMl5T6EUeA8LfQQ9EItbxQ2yDZiW2hZYXUE1asOLn9UTdoGlz
         Xppnrl/HwhaHB3lcqQyKcmM1DDk8NAFuBsjaK3L51VmQ63y2ZwA5BLzsUAUbimsOcKSM
         cgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=dvtyvJk7HAoppDHS6ndBXj8icS9cRtiRmRTq3rpAHiw=;
        fh=9HXRTYMkYv5owHxlXbaVrUFa2v6cie1gjk7mfqa1UXo=;
        b=dEBY9FK82iB5eR7ry41uNDRyd87FCoB2oM4qxLJCERn58CkTLecXkHCtv/FpJUoKlX
         yWijLBwPygz0L909kbqoeB14NZ0klnMAq5RjmQax+deXzFkRtVkmyQVGFnNweDrKo6Qu
         qKWiBCmYQk0J7cZkTOTyvGCdDcrOcOA19M5AtEyzl7BHLsIdN/a8t+8YiXur9cxjLJ1b
         NZGl44+aYOKoZIPLUT0/wLTCZOk7E46J2HWI66y4cIOtvh9wSdmEDa8SNf+WWhDqwOv5
         4Qzuitcoy7vZEiXuf0o6majL/VlVhn7U2KfLzQI7A0i5/BXCZaNkTE0I69L5NPl+NkFA
         /KRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ETAF91jD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1fcfbdsi403395885a.419.2025.05.30.07.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 May 2025 07:41:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ETAF91jD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uL0vZ-0004iK-8k; Fri, 30 May 2025 10:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uL0vX-0004gF-Oc
 for qemu-arm@nongnu.org; Fri, 30 May 2025 10:41:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uL0vU-0007Kg-Lb
 for qemu-arm@nongnu.org; Fri, 30 May 2025 10:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748616099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvtyvJk7HAoppDHS6ndBXj8icS9cRtiRmRTq3rpAHiw=;
 b=ETAF91jDo1WwTwkiwGqVbCtr029avFSOzY4p+W3wMPiRv+rFQ08aKvMfkAnsW5UBMVWHgN
 ro48cFw2LtIWors9bfmDRu1UU6PfrzLfzT1wGBaPvG4l+mc3FFCbjNX153hfs7i5GdC/v2
 I2g7f6CTCICI3uBOUaBURd83+hBk7Rc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-nU5JOp5DPEWAbjsh39o-ow-1; Fri, 30 May 2025 10:41:37 -0400
X-MC-Unique: nU5JOp5DPEWAbjsh39o-ow-1
X-Mimecast-MFC-AGG-ID: nU5JOp5DPEWAbjsh39o-ow_1748616096
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so12648915e9.1
 for <qemu-arm@nongnu.org>; Fri, 30 May 2025 07:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748616096; x=1749220896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvtyvJk7HAoppDHS6ndBXj8icS9cRtiRmRTq3rpAHiw=;
 b=LoGTDXq2G7lkaHzVXmWkwjBRnT6CythnJ/Pyt0QrSsS1llm0iYbvdW2vTQCLAarYk4
 zwkWqkhoPWU+dAkgiw0Knnctlxsgw/u6glLkM6nOA6jm9z44XRi4RA2dGUFfO7toq+Ew
 52zAtxBk61PtSiJlKwh234RWw+QEJCzJYN2GHrxKJ/GOlac+rc6/mAMpFz42LSmRc3lH
 REimgkkZT6/jGhIofbkFeuP6KwV78TaAs0vonhve5Biyw6MSqXDqGdHCZMMIRRIuw4dg
 1Atuf7S+Ne7LC515fZ8gOUzcrA9myL3KZTZtfHvcg1WOK8tXEYaKr4S7j+hO+6k4pgAu
 YnaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEEqcpmSsrMIwhw4rkF/5t2G40YAEYzwr/E5Ss/Bf+ExCytQCpraRstm2gFKAupsnPtjcZ23rR8Q==@nongnu.org
X-Gm-Message-State: AOJu0YzeTQ79WBlxRrr7BJwwU0a/lPL9H9faxHcWGsvvhsdNI1DPIue+
 qMnP5iH4LvyhsIbReafHdTCr5lXAim1SEpRqKDPlE8e1XQcChvoFAH2hFBcPL+YQEs5k1kTtz3Y
 9hwYbOil0mkwiRFkyvN5b6tbOUAmLAOqZN3Q4UYBuYtnvxwbOSx1i8A==
X-Gm-Gg: ASbGnctrSf1RoNUTbswZ/gjuaYUX0VgFrDMawGVOLnntOnqx4WcOhnnL8yvEr5lEMbL
 k4YlFTNrUgva60Fr79r/6V8F+wY/gZ34ntPWOELIpR3YLdWKmdIl7q2KPktHlrmss7rsUSLdBjz
 PkzNqs54TFtEOD8Hsgn8qCNvHcuKsgp02K1HtymABwICXw89uPdCuzqfX9w33GDbsHPO15uwLLg
 cOYyaNbU+2tNZ1AEWHPXRMVicerncyux98eSUJ/JqpTLJtIXpQe32HdYzWTbQVBDHEcOc6q84wV
 eYDm6/CCMWWz+N9DWviW2ltXUizhZwfc
X-Received: by 2002:a05:600c:3f1a:b0:43c:fe15:41dd with SMTP id
 5b1f17b1804b1-450d880a7bamr26014905e9.6.1748616095950; 
 Fri, 30 May 2025 07:41:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3f1a:b0:43c:fe15:41dd with SMTP id
 5b1f17b1804b1-450d880a7bamr26014595e9.6.1748616095525; 
 Fri, 30 May 2025 07:41:35 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009752esm4982231f8f.74.2025.05.30.07.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 07:41:35 -0700 (PDT)
Date: Fri, 30 May 2025 16:41:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo
 Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: Re: [PATCH RFC 0/3] Attempt to add GHES for x86
Message-ID: <20250530164134.6c666b2e@imammedo.users.ipa.redhat.com>
In-Reply-To: <cover.1741094512.git.mchehab+huawei@kernel.org>
References: <cover.1741094512.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OGWnqvlu5PiicE_x8vx04cQi9HvXKUF1Guif_A3KF-0_1748616096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zAAhhWBTDCr7

On Tue,  4 Mar 2025 14:30:55 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Igor,
> 
> This patch series comes after:
>    https://lore.kernel.org/qemu-devel/cover.1740903110.git.mchehab+huawei@kernel.org/
> 
> I'm basically trying to add support for error injection for x86,
> without success so far.
> 
> On x86, the notification mechanism is different: it is via QMP.
> Yet, from what I saw on Linux implementation, it works on
> a similar way to GED. So, I ended implementing a notification
> via GED.

I'd use GED only for microvm.
pc/q35 already have ACPI controller builtin,
so I'd rather use that for hosting hest addr logic and event delivery.


> 
> HEST table build seems to be working OK on it, and the
> error injection notification for x86 is called. Yet, OSPM is not
> receiving any notifications.
> 
> Could you help me figuring out what are the missing bits?
> 
> PS.: there are some things at the code that require polishing,
> plus there are some extra printf() there to help debugging.
> Finally, we would need to add x86 CPU error event at the
> ghes script, but I'd like to have at least something that the 
> OSPM receives before improving it further.
> 
> It can be tested with:
>    $ ./scripts/ghes_inject.py arm
> 
> (Ok, this would be generating an ARM processor event , but
> I guess Linux would at least mark the event as read, even if
> it doesn't recognize it)
> 
> Mauro Carvalho Chehab (3):
>   acpi/ghes: move use_hest_addr out of acpi_build_hest()
>   hw/i186: add support for HEST table with SCI
>   Add a GED device for RAS notification
> 
>  hw/acpi/ghes.c           | 16 ++++-----
>  hw/arm/virt-acpi-build.c | 12 ++++---
>  hw/i386/Kconfig          |  1 +
>  hw/i386/acpi-build.c     | 75 ++++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc.c             | 41 ++++++++++++++++++++++
>  include/hw/acpi/ghes.h   | 25 +++++++-------
>  include/hw/i386/pc.h     |  5 +++
>  include/hw/i386/x86.h    |  2 ++
>  8 files changed, 153 insertions(+), 24 deletions(-)
> 

