Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6814461lfc;
        Tue, 16 Feb 2021 14:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUcmgGVtydTgqs5i/4/U+sA/wuMbmn394LpNavrIL6hLYfptsROexnyKiRJikb4sKcPX0Q
X-Received: by 2002:a25:2842:: with SMTP id o63mr32499279ybo.265.1613513530056;
        Tue, 16 Feb 2021 14:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613513530; cv=none;
        d=google.com; s=arc-20160816;
        b=BVHG2Txp4pJ4gMXlPpqPHs5YtjnBdaaU26FS+nbYHvmbGgSy0fWA+9fUv7ssCh50S6
         Ozcd35UJNwTFOE31wJaUi6lNuyCIBWKOU3medzWWR4x6/U+S2R1UUfo1ABYRC2P9q/qP
         D5v0OwawNR4ac0N8QeWO5ZivR+Sfw6CeRdIupG1vCuocxftJFdP1sFrtTcL7P/FWjqdy
         ee5p+VMPhmEAMwBMQn5YrLDdtd0nbLaENP+9H9930ep3Ykr1V0fLsRcbAYgcwScwVrGf
         rVIofc0uskYa8k3BfRQOmyZln0E2uOYYJEsD8x6SVakys/BxDtytqySpi/8x71MoAFAy
         m+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=KTfUB3D1HUlsFs9iM4MYuhC8R/aZTGmZCdd3SJ+pivA=;
        b=08bvYaW/uG1UcMV3RKRJleyG/vswDIqIkE6V8/sVGTh3sfm/NBEgUWlzK2BzJt5Onb
         I7HpRtnUqfQ1Y6H3p5ouxeJSSeCvHO20KPddbgV2Dm/RB4Lbq4lwKiMWeQUWrqkcNbyh
         xMMJiKknhjoWPJwVA0h0/QzI/y8u0GSLh//kSOt0VhKHBB8eEePefHm2LHOW/0M04qf7
         9N1gNtfUN04rl4N6XeMzX/SvAdikOnckchqOl4eQEX9CSU1VnnSYWwxT3YpgNEZFnTBm
         6qu38S6nguJsxCYSevRtu1DkKRPls5VUESr8p0k9GGQQI4RCL5Vnq5HD4GJSg4mAfJiv
         Y+/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F5Dn5zsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si245895ybw.176.2021.02.16.14.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 14:12:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F5Dn5zsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC8Zl-0000S7-GJ
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 17:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lC8Zd-0000RW-Ht
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 17:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lC8Za-0000xZ-Bm
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 17:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613513516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTfUB3D1HUlsFs9iM4MYuhC8R/aZTGmZCdd3SJ+pivA=;
 b=F5Dn5zsT+zftlvhx9rM3L+fsq7v3D6yJ+ONT+yco9DtfionxACR57f2div+aXk5Fd2W3yT
 0ulZn37kwRT9OOdySj0M+8585Ge0zXO2FjlnzDCZvc+BpHJP3SVLCHku12+k3IOI4ttWh8
 hygixDCMNy4pNj76Xb0l1d/4ELk2qmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-hVkuB2sEP1a3yTlwghKyMg-1; Tue, 16 Feb 2021 17:11:54 -0500
X-MC-Unique: hVkuB2sEP1a3yTlwghKyMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 508CD6EE24;
 Tue, 16 Feb 2021 22:11:53 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 216AF5D9D3;
 Tue, 16 Feb 2021 22:11:42 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:11:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH] acpi: Remove duplicated code handling OEM ID and OEM
 table ID fields
Message-ID: <20210216231140.2743b89d@redhat.com>
In-Reply-To: <877dn9w5kt.fsf@mutex.one>
References: <20210213102233.11428-1-posteuca@mutex.one>
 <20210215184404.7e342872@redhat.com> <877dn9w5kt.fsf@mutex.one>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 "open list:ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vo2cv3GHm1Ua

On Mon, 15 Feb 2021 20:26:10 +0200
Marian Postevca <posteuca@mutex.one> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > hmm, looks like adding instead of removing
> >  
> Do you mean that the commit message does not describe the change
> correctly, or that my refactoring is too extreme?
I've meant that diff-stat shows that patch adds more lines than it removes
so I'm not sure it removes duplication.
Maybe rephrase commit message a little.


> If it is the latter, I think I tried to simplify things, by creating
> macros to be used in multiple places where this structure is created.
> And passing the structure around instead of two parameters seemed simpler.
> 
> > have you considered, putting this field into X86MachineState?
> > (that way you will be able to handle both PC and microvm in one place,
> > without duplication io init/property setters)
> >  
> I did not, will try this approach.
this would be pure deduplication, and simpler if you do it as separate patch
and then re-factoring to static fields on top of that.
(i.e. don't mix re-factoring and deduplication)

