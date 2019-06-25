Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4974455wrg;
        Tue, 25 Jun 2019 06:34:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAa5brAAguEAPkGNcuUfN1MP1+YtEdpH0djP+t1b4gNAGfmOYoAbetJ04oR4LU/XyuOYxi
X-Received: by 2002:a17:90a:bb8a:: with SMTP id v10mr32509788pjr.78.1561469650247;
        Tue, 25 Jun 2019 06:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561469650; cv=none;
        d=google.com; s=arc-20160816;
        b=Rz8Viog4VbznaO7cPpS2D9+nU7OigFydzhmjFxfQ0lKC7COHAZLwHSehlcxWFmmXDF
         RGbIPQENY2Jy2SHHqvKFNAew+5eRAGbJSFMkmH4JGES3U+dLXvbKo4TwKxHp1+9viLeA
         qj2Yihp1lhusLwmLMCatT1OBnntcIOZP/McEoQPAvmtUlnBaeQN2IQnCngYjPpuG3sTs
         ccsIpP1PKLiSm/cK1PWs3qOCH6a4WHUzUkJNDSoNrVUHV3rh5ePmDAS8AAzgm9shQxYF
         VVbSFBsx+4xXBeoS/A2pxw/lYwbk5Hktm/MfjnqwlNEkp9i8TYCZtJZb4x+W63dkgvJS
         whSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=/Tf2OfCG+LTghHHiHhtZ+to+wli0biTfr5gLIdP8WmM=;
        b=f/lLd1sIMiRUUfhM21S4pgXMPEj/OKAw1PRS+DszSFxHmZfbbx9jbgmP3Dl6SxEOz3
         F/TZLA7CP1pGZNrvTweeUcNz35pbKX4/pQoSFPmXDRyUt9j3aT30RBgqpxja3BOBITJN
         hswmqv9nfwBDovEx3MtWpZeHTuUyvKbktK020YNcJcoYr46/r4WjgFx9Y1h1N0J/RKVX
         Q/uX3r9byOP6XW+JmiSe4a4B88ffR10UNqXh8Mf9aI5zv0qElbcqKO5pnhwFKvW/9wRs
         lfniExIsZxvvmnLN8AFh++SPo9vmmQ6VYXCA+MktolUmbd4WyfaiOozXCBO/w/ywiivF
         OOEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c8si357217pls.436.2019.06.25.06.34.10;
        Tue, 25 Jun 2019 06:34:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbfFYNeJ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 25 Jun 2019 09:34:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39506 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfFYNeI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 25 Jun 2019 09:34:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7EA563086227;
        Tue, 25 Jun 2019 13:34:08 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 141E06085B;
        Tue, 25 Jun 2019 13:34:01 +0000 (UTC)
Date:   Tue, 25 Jun 2019 15:33:57 +0200
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
Message-ID: <20190625153357.05020884@redhat.com>
In-Reply-To: <623d8454-6d9a-43ff-dd34-f5e0d1896f01@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
        <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
        <20190620141052.370788fb@redhat.com>
        <f4f94ecb-200c-3e18-1a09-5fb6bc761834@huawei.com>
        <20190620170934.39eae310@redhat.com>
        <ec089c94-589b-782c-1bdc-1b2c74e0ea46@huawei.com>
        <20190624131629.7f586861@redhat.com>
        <623d8454-6d9a-43ff-dd34-f5e0d1896f01@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 25 Jun 2019 13:34:08 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ug2nKmf0gmuk

On Tue, 25 Jun 2019 17:56:00 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> On 2019/6/24 19:16, Igor Mammedov wrote:
> >>>> On 2019/6/20 20:10, Igor Mammedov wrote:    
> >>>>>> + */
> >>>>>> +struct AcpiGenericErrorStatus {
> >>>>>> +    /* It is a bitmask composed of ACPI_GEBS_xxx macros */
> >>>>>> +    uint32_t block_status;
> >>>>>> +    uint32_t raw_data_offset;
> >>>>>> +    uint32_t raw_data_length;
> >>>>>> +    uint32_t data_length;
> >>>>>> +    uint32_t error_severity;
> >>>>>> +} QEMU_PACKED;
> >>>>>> +typedef struct AcpiGenericErrorStatus AcpiGenericErrorStatus;      
> >>>>> there shouldn't be packed structures,
> >>>>> is it a leftover from previous version?      
> >>>> I remember some people suggest to add QEMU_PACKED before, anyway I will remove it in my next version patch.    
> >>> Question is why it's  there and where it is used?    
> >> sorry, it is my carelessness. it should be packed structures.
> >>
> >> I used this structures to get its actual total size and member offset in [PATCH v17 10/10].
> >> If it is not packed structures, the total size and member offset may be not right.  
> > I'd suggest to drop these typedefs and use a macro with size for that purpose,
> > Also it might be good to make it local to the file that would use it.  
> so you mean we also use macro for the  member offset  in the structures?  such as the offset of data_length,
yes, but I hope there won't be need for data_length offset at all.

> may be there is many hardcode.
> 
> >   
> >>> BTW:
> >>> series doesn't apply to master anymore.  
> 
