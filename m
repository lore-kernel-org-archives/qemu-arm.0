Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3821328lfp;
        Mon, 10 Feb 2020 05:10:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzeMBtGuHykHvGFGvN8n4lhKb4N62lUHeNbOmnw48yg21qK7VLcdS2A3TmrcoUMNAHt93ZG
X-Received: by 2002:ad4:55ec:: with SMTP id bu12mr10066652qvb.107.1581340210018;
        Mon, 10 Feb 2020 05:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581340210; cv=none;
        d=google.com; s=arc-20160816;
        b=XVQmmZk4ll0/r4LGlsk/8NycLdlq1wzclYFf8dzzi9S4Uewou5Bh0ZB8OaLLW23k7H
         xtyy5blJigezaEZWVR+Ja/C67o4nWfHFKsya17mpy1xhSEfpvDhNC5m5vdTo/KwR/EKC
         YHtoEc4BMbhuluzUkNspmk1k7xVFK+IRnGOqtDhvtJ7EDuraw+YN+bj38S/Rf6zHed84
         aZJOq+njJH//9IP9+sftZItwsFpx+KGmmWX10SeSjsEZ/YYQwHz3cJ2qC0A3RHu1133f
         2nXsyjC0T0Q3OWaGfic/Wi7mU18jiCf9ixcowWwiuT2NYf7Kge0MRxnasC1pvpv1Q+To
         akhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lw0uc4m5KwusWu7oKFRDZX20xrzRZ8BccdEcYTNpb6s=;
        b=sol0jopIAQ1GN0euqIkdyvG0DvNQ1Q/8iOvrfBeN9UpSeyVzZ+cQnyHaVl0Ag78Szx
         ltwobtZabGYB2e94qjofSlaclwljd0sV8oY7kyMVdanlQyH9WHxBey0ZauoqfCH712aL
         xLoaSLR8FbqZ5qs20fIKY2xKwCFTpa7DKsafKugbOCQULNFDJmK3diwtZhdUWx/eqErb
         LasDssLUQicQ5r+vo2oAy0NN+0kIRFcX9dNEsbEEmWMcdk65hndJgpIWnjTnbUc2sxK7
         uFlZgHwJ6Mj5SeHP/EvCcz9t9MrnIyBrzoLAoJOdgTold9ePcfTh6IS7xA9xQX+d8Yb3
         xIaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TTrZifvy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si13100qtp.32.2020.02.10.05.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 05:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TTrZifvy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j18pF-0001PV-E2
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 08:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j18p6-0001MK-NC
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j18p5-0003Kp-Mh
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:10:00 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25112
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j18p5-0003KW-J7
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581340199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw0uc4m5KwusWu7oKFRDZX20xrzRZ8BccdEcYTNpb6s=;
 b=TTrZifvyrMivujTECk9ancWQDNDSFdnZ78BuInDTFI7CF9ELs6HCgfvgG6lXmn3NSKYzFZ
 ohk+xo1eXm17R/qdWtvcPTU6ZDbHTBMh7i+1G7jXKOFqUMaEg37IWRF2xPiu76VriFfLL9
 4VMav8wLPGfnsDuH1pWyloJOdKEnxuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-qxCG-ek7Mde6GG6LOr9gdg-1; Mon, 10 Feb 2020 08:09:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D53D2107B10F;
 Mon, 10 Feb 2020 13:09:53 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A7A60C85;
 Mon, 10 Feb 2020 13:09:35 +0000 (UTC)
Subject: Re: [PATCH v12 12/13] virtio-iommu: Support migration
To: quintela@redhat.com
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-13-eric.auger@redhat.com>
 <87eev27hby.fsf@secure.laptop>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c8df42d0-c913-94e3-39a0-1e09fa459622@redhat.com>
Date: Mon, 10 Feb 2020 14:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87eev27hby.fsf@secure.laptop>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qxCG-ek7Mde6GG6LOr9gdg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nzeqvNTIN89f

Hi Juan,

On 2/10/20 1:33 PM, Juan Quintela wrote:
> Eric Auger <eric.auger@redhat.com> wrote:
>> Add Migration support. We rely on recently added gtree and qlist
>> migration. We only migrate the domain gtree. The endpoint gtree
>> is re-constructed in a post-load operation.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> And yes, this is as confusing as it can be:
>  a tree of mappings (i.e. key,value)
>  a list of endpoints
> 
> I will propose this as most complex structure migrated ever.
:-) Thank you Juan, Dave, and Peter for your support

Best Regards

Eric
> 
> Later, Juan.
> 

