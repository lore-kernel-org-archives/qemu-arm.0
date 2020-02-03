Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3635283lfp;
        Sun, 2 Feb 2020 23:51:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8bDzRl0SIcjBWnO1SADTIKSQz4O5UuQ3tawrwN04rpO+2wd5CdwXAybJPxbHvepH7yNTe
X-Received: by 2002:aca:db56:: with SMTP id s83mr14146033oig.171.1580716314878;
        Sun, 02 Feb 2020 23:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580716314; cv=none;
        d=google.com; s=arc-20160816;
        b=lzsIQ5da5HtBtXLHSUk3plwZBbywwHuDiBi2obZ6jjViAj6KnwT49xTkQ28304MXil
         O2ankqGh4Q3FUg/RzMmeYm8C8PcyfYX01XraiF3I9+8K1cYVwNURtz8s6zy7KRI0aIcT
         w2S6webRWIRYVv07dmnJjlNtwtPs92Ev+a9TPpC2YqVZyRhjZLLYhEJD7mU2tQaURM1D
         dEXiXA8yskRhmCfa0YbHER1557O9781mjGlIUUSgyHR0MMPopHUmzk8R8ATNEeDBjWqB
         VXRwLZTIB73sipMSjAjAoX09npM2jOGGXdQaYmpqQ2VhsB2frSccDvFAaKS2Zrprbhnf
         a1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=shrxJcLWYa5dcYmO7shA/1HAHpE7/18QYuBpgSLW+Y0=;
        b=EQuE0Y2TEsBboQdIrboJFYVUmqQnjOB+S7QKzPKOpEugqyOynkj94sdhOpusjtOUN5
         4f38EvKvQIszthHlPse7R6+GW0d4xQXPx5XaDNcnBsugjsoGTdnf1bek7smcZ3JNEPHo
         7W7nuuD+iFdrpRFR/JUdUvi487KKDndiXzlZpmSJwIMKoBSC2b24pGaKWD7p5RVyFIif
         UlQofyKop5to8PW7ugPIhNge8YLxhFdBt+T2Hc3qO2Lm9czdhCjiZYZKnl3STezJy02r
         CnHsiUs65KU5wPzgE6oN09DzG4cCCoIa+s2QtpIcepNPkmJzIUhke3dEs7CfhWpPMi5+
         iaVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BG+gPlFv;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t7si8280105otl.133.2020.02.02.23.51.54;
        Sun, 02 Feb 2020 23:51:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BG+gPlFv;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgBCHvx (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 3 Feb 2020 02:51:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21764 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727339AbgBCHvx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 3 Feb 2020 02:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580716312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=shrxJcLWYa5dcYmO7shA/1HAHpE7/18QYuBpgSLW+Y0=;
        b=BG+gPlFvXR9u5TTU+6jDQOSSbi+zenA67zz62B4k6BxdS46+2O66XbZosTcEbzW/2GySIR
        jr0QhKDpvO5cCxD35UijNDAUbctXjoKZZASRQfO+8w5bBVt4qWIYK5qn/QZ41W0+NBIX2v
        nqa2aoQx0gCmEInvSzDbxBTR9Y5Qu3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-QSFWe5ESNBOfXFi1a38mKw-1; Mon, 03 Feb 2020 02:51:50 -0500
X-MC-Unique: QSFWe5ESNBOfXFi1a38mKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86F1D1800D41;
        Mon,  3 Feb 2020 07:51:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC52960BE2;
        Mon,  3 Feb 2020 07:51:41 +0000 (UTC)
Date:   Mon, 3 Feb 2020 08:51:40 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <xuwei5@huawei.com>,
        <jonathan.cameron@huawei.com>, <james.morse@arm.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <zhengxiang9@huawei.com>,
        <linuxarm@huawei.com>
Subject: Re: [PATCH v22 5/9] ACPI: Record the Generic Error Status Block
 address
Message-ID: <20200203085140.2e7ab793@redhat.com>
In-Reply-To: <02a78eff-865c-b9e0-6d5f-d4caa4daa98d@huawei.com>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
        <1578483143-14905-6-git-send-email-gengdongjiu@huawei.com>
        <20200128154110.04baa5bc@redhat.com>
        <02a78eff-865c-b9e0-6d5f-d4caa4daa98d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9+gww5Ye/gJs

On Sun, 2 Feb 2020 20:44:35 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> sorry for the late response due to Chinese new year
> 
> On 2020/1/28 22:41, Igor Mammedov wrote:
> > On Wed, 8 Jan 2020 19:32:19 +0800
> > Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> > 
> > in addition to comments of others:
> >   
> >> Record the GHEB address via fw_cfg file, when recording
> >> a error to CPER, it will use this address to find out
> >> Generic Error Data Entries and write the error.
> >>
> >> Make the HEST GHES to a GED device.  
[...]
> >> @@ -831,7 +832,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      build_spcr(tables_blob, tables->linker, vms);
> >>  
> >> -    if (vms->ras) {
> >> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> >> +                                                       NULL));
> >> +    if (acpi_ged_state &&  vms->ras) {  
> > 
> > there is vms->acpi_dev which is GED, so you don't need to look it up
> > 
> > suggest:  
>    Thanks for the suggestion.
> 
> >  if (ras) {
> >     assert(ged)  
>       assert(vms->acpi_dev), right?

yes, something like this.

 
> >     do other fun stuff ...
> >  }  
> 
> >   
> >>          acpi_add_table(table_offsets, tables_blob);
> >>          build_ghes_error_table(tables->hardware_errors, tables->linker);
> >>          acpi_build_hest(tables_blob, tables->hardware_errors,
[...]
