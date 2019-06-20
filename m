Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2019811wrg;
        Thu, 20 Jun 2019 08:09:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVS0nKRzFOT0hh7Jx6x2K2Qx0HF0jQdxY7qmICcT4hD2iA11cQLRPQAUG04g2eZqbfzoRs
X-Received: by 2002:a17:902:8f89:: with SMTP id z9mr26926142plo.4.1561043386055;
        Thu, 20 Jun 2019 08:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561043386; cv=none;
        d=google.com; s=arc-20160816;
        b=EObAYsyicoeIoDcNT7DhKqNA00/+4j1VBkxv2CszppKr/lxAjIuHQSLBffiqdqYq2P
         CsHps39D1TcakfhAOrdTBxg0gK356fLjn+bpITaQ9AGsxHvpTgD0lw+h3IpQp2XrpBnt
         AmiucJneuENd0VGs6yuMO5gM2iy23GH+MMfbnqGXghSlTiG2Jxq3NudQ76CZq2ToBWwG
         YcwtBHSegy5TuDEL30ztwZJH3cgg01uBZ6m4+3y0EINjNmqwr27/PP/5JpaT1NuWuN0m
         87qXVQAsGL3QaVX1GegC9hSf2Q3WQCRSdr+nqQ9h7mgorjDncbRh1Ab5sQ0e8BzUejDA
         DR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=20dM6NL664u4mfcny1QE0oq8BaNNXcBNDdDRhi70o+E=;
        b=SlVBgVyhgh9//WypE7Ymkeg7yId/sDJN4Y68FamhwbVyVuazmVlni98zamHlmuLq7Z
         fqLPZx6061/VIMdLB+TirfKZF/AO/G57GEz/4wtgNv46n4x5RJx8tRAFVkZJ9AA0oAO9
         Rjhp6B+fxeeeK5Uonh8dUjofn4txxbyfsFD9eFysTh9iAze6PkBeyFHQ1waJ+YQALzQH
         +Ky5WCUjLaNBmBmea68ZvobS/DuNjp06V1pdhpyxXU7IOGRCnwtswdqtFbmOENTrEqGb
         6fTMv1zBC3dQq0fVqtrOLA+JOC2FBpFZqnGMr/d2SWQnV0z2icCWF1IbW12Gjkt5jFh9
         RZkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 28si5681576pgy.252.2019.06.20.08.09.45;
        Thu, 20 Jun 2019 08:09:46 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731940AbfFTPJo (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Thu, 20 Jun 2019 11:09:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51114 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbfFTPJo (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Jun 2019 11:09:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 44F243082140;
        Thu, 20 Jun 2019 15:09:44 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3279419C5B;
        Thu, 20 Jun 2019 15:09:39 +0000 (UTC)
Date:   Thu, 20 Jun 2019 17:09:34 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: Re: [Qemu-devel] [PATCH v17 02/10] ACPI: add some GHES structures
 and macros definition
Message-ID: <20190620170934.39eae310@redhat.com>
In-Reply-To: <f4f94ecb-200c-3e18-1a09-5fb6bc761834@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
        <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
        <20190620141052.370788fb@redhat.com>
        <f4f94ecb-200c-3e18-1a09-5fb6bc761834@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 20 Jun 2019 15:09:44 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: jL51wCbvhG+M

On Thu, 20 Jun 2019 22:04:01 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> Hi Igor,
>    Thanks for your review.
> 
> On 2019/6/20 20:10, Igor Mammedov wrote:
> >> + */
> >> +struct AcpiGenericErrorStatus {
> >> +    /* It is a bitmask composed of ACPI_GEBS_xxx macros */
> >> +    uint32_t block_status;
> >> +    uint32_t raw_data_offset;
> >> +    uint32_t raw_data_length;
> >> +    uint32_t data_length;
> >> +    uint32_t error_severity;
> >> +} QEMU_PACKED;
> >> +typedef struct AcpiGenericErrorStatus AcpiGenericErrorStatus;  
> > there shouldn't be packed structures,
> > is it a leftover from previous version?  
> 
> I remember some people suggest to add QEMU_PACKED before, anyway I will remove it in my next version patch.

Question is why it's  there and where it is used?

BTW:
series doesn't apply to master anymore.
Do you have a repo somewhere available for testing?

> 
> >   
> >> +
> >> +/*
> >> + * Masks for block_status flags above
> >> + */
> >> +#define ACPI_GEBS_UNCORRECTABLE         1
> >> +
> >> +/*  
> 
