Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3655065wrg;
        Mon, 24 Jun 2019 04:16:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLejr9XftBCmbrC1GoG1BJG/SmvpHDRItaYnRnAyISpfcbp8WMoy209PojQ1+kFlVI26iO
X-Received: by 2002:a63:6b0a:: with SMTP id g10mr18755379pgc.295.1561375002805;
        Mon, 24 Jun 2019 04:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561375002; cv=none;
        d=google.com; s=arc-20160816;
        b=GuYYUXacmJUzonTWdbzpA2/B71ihewO2s4ivxYY56UXszKv4VWsBcCYTg8P4F3H3Xj
         2j2WSuaLHxn23pmJlVt7OJNnI9Xx4+PxVtqEVETo09bOo8+iPmbuTbMWeLeKQTuVL0YB
         +tR0earXka0mPl1iOndZ2aG1y8UwgQrxiRniKwYXiMM1z0503wcLFjsPsczF7smmvm87
         aeZMq3aQBzpU+LVEl2T2hxGHcU0VSeIMwKAWZXmaGEj8OL8kdkw7c6N666L5N+DXipXH
         8XBZpKcFMp9FrwvRPPRlLN8pCICiLO2stTlBP/ludhUx50NdghYMBGN5Fp+fEAwpnRWT
         4m0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=iduIRRC1KtDuVnxlKz6z+P/vzWHUnEPOERjMXVer/sU=;
        b=D+Lk2X4vW1sqECIeq9d0CBidHKiwadlzGgfVC/5SjGqKijEgzRMIwiQOnkL6H7ScFt
         5cCdj3e7JOd5WNXbJNAODHfqxqfcAS2gwxqfHHn6E7OcS1BVyaNlPncQHaE5sem0P634
         5aeEC8Gq+8zXOYZQkpegWgGHfpmrxfGrjxpebKwWDIGUlH9tWNHi47u2IjyE03EvY7bI
         cfJq9O2lw5fAcvxU+7ZXI0Wr3OPJbn18EJ7BRZYjXQh5UIlzF9JfbqQnmeA6niLFviTw
         W32P9myhNOsq4ASTogRj3QSuTRXpmEcjHpGCIEZhlEr9Pu66V9rvW8b4h31gu9DmM0n8
         vRgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z20si10399437pfa.282.2019.06.24.04.16.41;
        Mon, 24 Jun 2019 04:16:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbfFXLQk convert rfc822-to-8bit (ORCPT
        <rfc822;daniel.diaz@linaro.org> + 5 others);
        Mon, 24 Jun 2019 07:16:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52958 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727953AbfFXLQk (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 24 Jun 2019 07:16:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id F0EC0A4D29;
        Mon, 24 Jun 2019 11:16:39 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 67D2D1001DD5;
        Mon, 24 Jun 2019 11:16:33 +0000 (UTC)
Date:   Mon, 24 Jun 2019 13:16:29 +0200
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
Message-ID: <20190624131629.7f586861@redhat.com>
In-Reply-To: <ec089c94-589b-782c-1bdc-1b2c74e0ea46@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
        <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
        <20190620141052.370788fb@redhat.com>
        <f4f94ecb-200c-3e18-1a09-5fb6bc761834@huawei.com>
        <20190620170934.39eae310@redhat.com>
        <ec089c94-589b-782c-1bdc-1b2c74e0ea46@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 24 Jun 2019 11:16:40 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ur3pBc9m8tGG

On Fri, 21 Jun 2019 01:17:48 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> On 2019/6/20 23:09, Igor Mammedov wrote:
> > On Thu, 20 Jun 2019 22:04:01 +0800
> > gengdongjiu <gengdongjiu@huawei.com> wrote:
> >   
> >> Hi Igor,
> >>    Thanks for your review.
> >>
> >> On 2019/6/20 20:10, Igor Mammedov wrote:  
> >>>> + */
> >>>> +struct AcpiGenericErrorStatus {
> >>>> +    /* It is a bitmask composed of ACPI_GEBS_xxx macros */
> >>>> +    uint32_t block_status;
> >>>> +    uint32_t raw_data_offset;
> >>>> +    uint32_t raw_data_length;
> >>>> +    uint32_t data_length;
> >>>> +    uint32_t error_severity;
> >>>> +} QEMU_PACKED;
> >>>> +typedef struct AcpiGenericErrorStatus AcpiGenericErrorStatus;    
> >>> there shouldn't be packed structures,
> >>> is it a leftover from previous version?    
> >>
> >> I remember some people suggest to add QEMU_PACKED before, anyway I will remove it in my next version patch.  
> > 
> > Question is why it's  there and where it is used?  
> sorry, it is my carelessness. it should be packed structures.
> 
> I used this structures to get its actual total size and member offset in [PATCH v17 10/10].
> If it is not packed structures, the total size and member offset may be not right.
I'd suggest to drop these typedefs and use a macro with size for that purpose,
Also it might be good to make it local to the file that would use it.

> > 
> > BTW:
> > series doesn't apply to master anymore.
> > Do you have a repo somewhere available for testing?  
> 
> Thanks, I appreciated that you can have a test.
> 
> I still do not upload repo, you can reset to below commit[1] in master and apply this series.
> 
> BTW：
> If test series, you should make an guest memory hardware error, let guest access the error address, then it will happen RAS error.
> I provide a software hard code method to test this series, you can refer to https://www.mail-archive.com/qemu-devel@nongnu.org/msg619771.html
> 
> 
> [1]:
> commit efb4f3b62c69383a7308d7b739a3193e7c0ccae8
> Merge: 5f02262 e841257
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Fri May 10 14:49:36 2019 +0100
> 
> 
> 
> >   
> >>  
> >>>     
> >>>> +
> >>>> +/*
> >>>> + * Masks for block_status flags above
> >>>> + */
> >>>> +#define ACPI_GEBS_UNCORRECTABLE         1
> >>>> +
> >>>> +/*    
> >>  
> > 
> > .
> >   
> 
