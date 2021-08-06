Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp372008lff;
        Fri, 6 Aug 2021 07:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypHuaBPxKgfJprkyC1dOKdZMme5GKVK7KfIX4b3Nn0pPGHFMnIFWi60VRPpuRMTwk0xuAT
X-Received: by 2002:ab0:74cc:: with SMTP id f12mr8478976uaq.28.1628261041447;
        Fri, 06 Aug 2021 07:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628261041; cv=none;
        d=google.com; s=arc-20160816;
        b=i3kvBFz++SMn41TL34XiA9FQZwm3oMi66jPQkrBINtGmNy71Et0owKBj41OTISp0cc
         B3WYBwU4kul0m1nMIoPXqn6l/5kQcM47y0Bp6GWL7DpqkYogiIqU1wc2QW00VWF5s79W
         xvg3g5LANPJUIsKMNCzWmDlkh5rj8ULEXA5EC7MjaGysScypcIynGI9GN/OhVxCZGZv8
         T7JxMCknYXlLTKSg8w0GGon3wYybLDqj16vrfv3oXHG5Emp1WWrXFrdkDxslLIyjnkLh
         8F+qypy45G2bsYJPoyIV9UuokfnCutQSyeZ1/kWqWYpsFOY6RRtmXnoX2/meKMyjvnjF
         Awuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=AgbwJTab3poX9zGImUrzIaCRTjeWe7N4B/s6zdyCUV0=;
        b=VlwEswUCyTccBBb4aubNNUI3AAhauzVxOsYuXUV7FegMuEh8HNI+uJ+qViphkzLCMz
         bQ8SpNJ/tXnH26tBHvoXalfSaJspYP0Skcd8t1wZrRJwmaEY78/U4NWnMOWr8Y9/4zBs
         KzVDC9/d8KcSasw0oa1BvlapPdQrMtkC3pcExes4oPp1SuRyozIHH4nTegZmdMxRAhGy
         DoEVG9SqmC8XHObgiCMBaRoXa6wgrK+O9dhHFbT5k7bJlHQ7xAe1Eqf3XrFc08NuS6RQ
         yhEqLWn1eoQLXq887udTK2x4eyA+V3OrVEzXR/m/TvOwFbQNL47Ps3IYhmSwJtA+erHB
         6EGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 30si4566984uab.144.2021.08.06.07.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 07:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1]:34898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mC14q-0007DB-P7
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 10:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mC14e-0007Ah-4C; Fri, 06 Aug 2021 10:43:48 -0400
Received: from relay68.bu.edu ([128.197.228.73]:41381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mC14c-0006Mk-D9; Fri, 06 Aug 2021 10:43:47 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 176Eg9pc027907
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 6 Aug 2021 10:42:12 -0400
Date: Fri, 6 Aug 2021 10:42:09 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiang Liu <cyruscyliu@gmail.com>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
Message-ID: <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y7GLUmQpPYc3

On 210804 1451, Qiang Liu wrote:
> xlnx_dp_read allows an out-of-bounds read at its default branch because
> of an improper index.
> 
> According to
> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
> 
> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
> 
> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
> will write s->core_registers[0x3A4
> >> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
> >> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
> >> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
> rather than 0x3A4.
> 
> This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
> but does not adjust the size of s->core_registers to avoid breaking
> migration.
> 
> Fixes: 58ac482a66de ("introduce xlnx-dp")
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>

Acked-by: Alexander Bulekov <alxndr@bu.edu>

If there is somehow a regression, the test won't fail in a fatal way, so
maybe it makes sense to throw in a setenv(UBSAN_OPTIONS=halt_on_error=1)

As a side note(not strictly related to this fix) should we continue
joining reproducer patches with the fixes? In order to test the
reproducer, you need to cleave the fix off the patch. At the same time
we don't want to mess up bisection, so does it make sense to have the
reproducer patch be separate but come last in the series?

Thanks
