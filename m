Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2213286lfq;
        Fri, 11 Sep 2020 05:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuUOjh5uPq95BfyVUXGCO3b7/pPllUjY5DWHA9trQuHQKb3vX2NeLdSq85jVrH8gU29RAy
X-Received: by 2002:a25:cfc3:: with SMTP id f186mr2328346ybg.9.1599828687799;
        Fri, 11 Sep 2020 05:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599828687; cv=none;
        d=google.com; s=arc-20160816;
        b=JMZRsKQnZWu6r/NWBvu3i2H3EQB0RAj83lL9Mikx5oTyFyDQUwogCEAZJExAsJeNgn
         hnGDW57ILmwV7uX+9tGRvtU8oh1mQN3Z/YYCCVTKrvGCSaxPBH/ylAbG1Kim4g5z+DGX
         +orN+0WgHosBrKNpHp+IjKUsFbx4+XVyNYSL+QsRpXd1HX+vAEKbmGApMdpOKJVT08ZX
         x/At+v+cd2XtL3gxjg+dmkg1sfPbAqPj1vV8BJV60Y38MXpI8fMUZT6KIr4xSzPaB1TQ
         FYvAVsc26W9OKOnfP4WGJTeKbbhrHrqiExI4bktEtrBdtL92Jdly5c3guk4jej8ihqo0
         teVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ItW4UqdoMgkM6h3ugWH8fZx7F7qFDIhnlOy4A6cVCNY=;
        b=R/Zixvy/fxF/9HWLwACeWzm/LTFqqqUa87cgqOmh/GKSsayvhVDYOlluYKFmT3GUE0
         JJSaA5Be/8peXXPztEZPpAaDVvwZ67ZBNMgDxt6L3NQ82pZLygbyELFdtQ3+cey7hhaj
         Yy+YWHBFAopnhLjRC5qwfzsf7dp9rRfpiTvvCKZ5LZUwgEYjegWDJ6r5V7B8biLY2+w8
         cBTHc9MB1iYiNtQFCiqOKRQap1KRbdLNQSyDAS/UVbRt/SHZ42zq8o7GTyzWqrx8M380
         AekQr2wZgjY1XVXq8xx8gV0Huj8IqPFLe3gMMEn3aka+/wHYjetFXCjreI5w+DkG4/fP
         tRYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OunuVwMn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h196si2235970ybg.358.2020.09.11.05.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 05:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OunuVwMn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGiWV-0003pP-6s
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 08:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGiVi-0002rJ-NP
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 08:50:38 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24572
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGiVh-0003ln-2R
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 08:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599828635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItW4UqdoMgkM6h3ugWH8fZx7F7qFDIhnlOy4A6cVCNY=;
 b=OunuVwMnTBcj0Xe4eqfnh1luLiEpg6Fs0yH7Q3nPaTv0DEFmviNOsFUQewhCjpwbu3dVne
 qv5K9bRtdYdOmhsRNf+mJg+juGKUpQvFsN8czdguw2std5Gp1Z4DWtjEdNUz4eY139Z7BU
 iH5bWgqie4dCjTwiGSgw0z2NbWsBP1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-yWmKWa4mO7m3AEu2N8bfDA-1; Fri, 11 Sep 2020 08:50:28 -0400
X-MC-Unique: yWmKWa4mO7m3AEu2N8bfDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D1D310BBEDB;
 Fri, 11 Sep 2020 12:50:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE9C460C15;
 Fri, 11 Sep 2020 12:50:25 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/pxa2xx: Add missing fallthrough comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20200911121844.404434-1-thuth@redhat.com>
 <7d4d07bd-e397-7d20-fb8d-6c7bd85cb850@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9e0ed414-0d9d-0a39-f620-2f98f7fef419@redhat.com>
Date: Fri, 11 Sep 2020 14:50:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7d4d07bd-e397-7d20-fb8d-6c7bd85cb850@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.469, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzgJi2le4cMy

On 11/09/2020 14.41, Philippe Mathieu-Daudé wrote:
> On 9/11/20 2:18 PM, Thomas Huth wrote:
>> Let's make this file compilable with -Werror=implicit-fallthrough :
>> Looking at the code, it seems like the fallthrough is intended here,
>> so we should add the corresponding "/* fallthrough */" comment here.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/arm/pxa2xx.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
>> index 76975d17a4..c1f45b2adf 100644
>> --- a/hw/arm/pxa2xx.c
>> +++ b/hw/arm/pxa2xx.c
>> @@ -443,7 +443,7 @@ static void pxa2xx_mm_write(void *opaque, hwaddr addr,
>>              s->mm_regs[addr >> 2] = value;
>>              break;
>>          }
>> -
>> +        /* fallthrough */
>>      default:
>>          qemu_log_mask(LOG_GUEST_ERROR,
>>                        "%s: Bad write offset 0x%"HWADDR_PRIx"\n",
>>
> 
> I keep rebasing this one from Stefan, not sure why never upstreamed :/
> https://repo.or.cz/qemu/ar7.git/blobdiff/2a9c928409..5ebb514633:/hw/arm/pxa2xx.c

Are there more patches like this in that tree? If so, could you maybe
send them upstream?

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

 Thomas


