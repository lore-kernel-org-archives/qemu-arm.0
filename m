Received: by 10.223.134.117 with SMTP id 50csp11932269wrw;
        Wed, 3 Jan 2018 05:31:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBouzadtEX+0CZfoQtgmz3bDGIy1d1++RkDaBvvPk92ecOKVKhSOTH7CT1imGI191knq2+3XS
X-Received: by 10.99.126.7 with SMTP id z7mr1297741pgc.410.1514986276337;
        Wed, 03 Jan 2018 05:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514986276; cv=none;
        d=google.com; s=arc-20160816;
        b=cV+PyfbjvUtmVCwJrEYqqHkxMb/vPb5ePzBMSezLFccVKQXtPUpszPSrUGEIC1ESO/
         UZqhaRhtkto5AdevFSTx5j56sEk9BzWsjFdxZcj3LIZ42f2Y+iF1SmG3vMLGTts1cmc2
         i4oOKPSxcY8tbUQ8FrSkrHEnxtCPFozoSOe937EjdPHHizbh44CiA5wZnQQP5m5VbpqR
         2SB5tSS7XFIAAfUdFpf/Q+gVSu7EhRHMB8SKoS29tFtC/17wxYpk7Xo5MVQfTTA9VoML
         jqYaBsQzLzK0HOZ7PNlQrUiLie1r4BHH++5dP8oNFnWd+E2MqqrDppbwKNF5/Hqwch5C
         C8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=XGBD8C//X2StIPDU7kE9YfsKDIOmeA8lR0utrhyM57s=;
        b=IfvvplYhw0iC3lFv3Mt1ZzqMKz8fnL+oJiJSevYktJ+i4jWNQtnCxx4tcQg3h+/jA+
         oUpBBZh1r71etZUe26yNTT9CYkhWCp01F2RzHB8ykltZIvRuw2J+yKi77BNKTuIyxJA+
         daco44skOyoMe7vhv+QXqUOjpyBF0Cr9hfzBOlEbN9uie5COlxRcXMiuGLFO+UBO7fTj
         P975PF6XsJeFZOilSTgPFyDJ/E1CsQbj5UUcw53OSF4MEwLR0N34wIBiyiaWX07IuctG
         DgJ/63YQFawrVDVNTK8VFzcky1aQ00BaQudMM/CpSAHwN/M4abdX3CaRqujVM53zvOOE
         Czrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 9si721279ple.171.2018.01.03.05.31.16;
        Wed, 03 Jan 2018 05:31:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752156AbeACNbN convert rfc822-to-8bit (ORCPT
        <rfc822;francois.ozog@linaro.org> + 5 others);
        Wed, 3 Jan 2018 08:31:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59454 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751753AbeACNbM (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 3 Jan 2018 08:31:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2CDA87F41D;
        Wed,  3 Jan 2018 13:31:12 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C1C0A62666;
        Wed,  3 Jan 2018 13:31:05 +0000 (UTC)
Date:   Wed, 3 Jan 2018 14:31:04 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
Subject: Re: [PATCH v14 2/9] ACPI: Add APEI GHES table generation and CPER
 record support
Message-ID: <20180103143104.2b814aa0@redhat.com>
In-Reply-To: <10087bbd-28b0-b5ad-101a-e6d5ac648548@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
        <1514440458-10515-3-git-send-email-gengdongjiu@huawei.com>
        <20171228151809.10495a90@igors-macbook-pro.local>
        <10087bbd-28b0-b5ad-101a-e6d5ac648548@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 03 Jan 2018 13:31:12 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9vypJfVq+PJs

On Wed, 3 Jan 2018 10:21:06 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

[...]   
> >   
> >> In order to simulation, we hard code the error
> >> type to Multi-bit ECC.  
> > Not sure what this is about, care to elaborate?  
> 
> please see Memory Error Record in [1], in which the "Memory Error Type" field is used to describe the
> error type, such as  Multi-bit ECC or Parity Error etc. Because KVM or host does not pass the memory
> error type to Qemu, so Qemu does not know what is the error type for the memory section. Hence we let QEMU simulate
> the error type to Multi-bit ECC.
Agreed that in case of TCG qemu won't likely have any way to get hw error from kernel
so it could be useful only for testing purposes (i.e. 'make check' and/or testing
how guest OS handles errors)

But with KVM in kernel it should be possible to fish error out from host kernel
and forward it to guest. If this are intended for handling HW errors,
I'm not sure that 'Multi-bit ECC' could replace all real errors reported by host
firmware.


> [1]:
> UEFI Spec 2.6 Errata A:
> 
> "N.2.5 Memory Error Section"
> -----------------+---------------+--------------+-------------------------------------------+
>         Mnemonic |   Byte Offset |  Byte Length |        Description                        |
> -----------------+---------------+--------------+-------------------------------------------+
>         ........ |  ............ |  .........   |        ...........                        |
> -----------------+---------------+--------------+-------------------------------------------+
> Memory Error Type|     72        |       1      |Identifies the type of error that occurred:|
> 		 |		 |		| 0 – Unknown                              |
> 		 |		 |		| 1 – No error                             |
> 		 |		 |		| 2 – Single-bit ECC                       |
> 		 |		 |		| 3 – Multi-bit ECC                        |
> 		 |		 |		| 4 – Single-symbol ChipKill ECC           |
> 		 |		 |		| 5 – Multi-symbol ChipKill ECC            |
> 		 |		 |		| 6 – Master abort			    |
> 		 |		 |		| 7 – Target abort			    |
> 		 |		 |		| 8 – Parity Error			    |
> 		 |		 |		| 9 – Watchdog timeout			    |
> 		 |		 |		| 10 – Invalid address			    |
> 		 |		 |		| 11 – Mirror Broken			    |
> 		 |		 |		| 12 – Memory Sparing			    |
> 		 |		 |		| 13 - Scrub corrected error		    |
> 		 |		 |		| 14 - Scrub uncorrected error		    |
> 		 |		 |		| 15 - Physical Memory Map-out event	    |
> 		 |		 |		| All other values reserved.		    |
> -----------------+---------------+--------------+-------------------------------------------+
>         ........ |  ............ |  .........   |        ...........                        |
> -----------------+---------------+--------------+-------------------------------------------+
[...]
