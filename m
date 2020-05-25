Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2188539lfc;
        Mon, 25 May 2020 09:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOw9tDsblwooSisHNZFpyXkuCO2RFBUyZJaaKtLBDbTFhB5aLn9kbStkpIA7Vn5V01cnPa
X-Received: by 2002:a25:d153:: with SMTP id i80mr27737211ybg.330.1590424685453;
        Mon, 25 May 2020 09:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590424685; cv=none;
        d=google.com; s=arc-20160816;
        b=ktgytsnHk6bMHTMOvMsLluKMiBYF4fp8smu6UJ5lWeVdOebNeYtwiGn7lk3yT+zhHm
         22gmkNTScmYYVyyqd5fNcIj4AtEMeI0YzMvPMan2VFjzuQ7jKjc+s5uiH5i7tBlzF/DZ
         J8vMQ4XekNHlmPDOETP6f43HepclLnTO7TrU7BxEywYi4mQpnRc4ByFhx0ansoJXLtQJ
         A12D8MbojHHGFfL3AKBPBFQjugyK5HnprSLYCr2Z+WNR/jy1+Nqaclz5+GvYCplQm58a
         VDEat/XSd/PcYqpwtajTLt6YkU/7I+AMferd/9JXhgTwMX+qkn0QQ6merPY4sfJt54S+
         QccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=VqC0owlCJ9rBHLzzUT39QT98qwVwgHZMF3KZE+p89NI=;
        b=hT8MY7rA36Ty7jUpNV5rgCVxx9BrWQ3Q40YExp6hATMnqZubWj+m2gcYKfSZOfM9dW
         rtW8d27ECN0eRRpTtss56ExzpOjeC+89BBymU9mPEcTybVxsS7Bx9EdCC0l0tSHRkaFl
         4pOc22wNob+UXNQGCpnbTgFKPa4F0kutkx2kyIFc0bYm6C/wAHCnHJfWqK8EmVAzUv9v
         TMQMzZgM1ls6RV+GLy8UgqsGX+dAb3BFDKqR1/ExdyjxnzxRMxHRRZZJib1o0Efp8JZD
         ThYD0Yz6KGGfcUG/HRgmgLzfqYZn7vUqeKczSnkQVEBlOtiep/2rrEsWKvXEwD+C+7bw
         YdoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B6SMd8yM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h81si16105758ybc.149.2020.05.25.09.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 09:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B6SMd8yM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdG72-00028G-TN
	for alex.bennee@linaro.org; Mon, 25 May 2020 12:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jdG5d-00013I-CL
 for qemu-devel@nongnu.org; Mon, 25 May 2020 12:36:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30187
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jdG5c-0008Q2-4z
 for qemu-devel@nongnu.org; Mon, 25 May 2020 12:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590424594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqC0owlCJ9rBHLzzUT39QT98qwVwgHZMF3KZE+p89NI=;
 b=B6SMd8yMnkN4Q7Y1UGpP84IOvWyIDzpDPjsha1rawNrLi1gum4zZKvvq7aJSFvji1w2rdp
 c2kf73IcKBn7PK280cm5ladJZhtkNmFDJct9rTN/jIbfrmMYAN+QSMpbjuxVIHId4mZxZL
 WjyBj7MsApt7YwkJaZxrqEPKJYfLWWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-FcqzBKVwOOCuLhVebfRshQ-1; Mon, 25 May 2020 12:36:31 -0400
X-MC-Unique: FcqzBKVwOOCuLhVebfRshQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23BF6107ACCD;
 Mon, 25 May 2020 16:36:30 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B89855D9C5;
 Mon, 25 May 2020 16:36:17 +0000 (UTC)
Date: Mon, 25 May 2020 18:36:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200525183615.5f8e67d3@redhat.com>
In-Reply-To: <20200525114508.hhvyzjiqja6knz6l@sirius.home.kraxel.org>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
 <20200521112921.641f12bb@redhat.com>
 <20200525114508.hhvyzjiqja6knz6l@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 08:28:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s+KkUvRH2Gjb

On Mon, 25 May 2020 13:45:08 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Thu, May 21, 2020 at 11:29:21AM +0200, Igor Mammedov wrote:
> > On Wed, 20 May 2020 15:19:55 +0200
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   
> > > Looks like the logiv was copied over from q35.
> > > 
> > > q35 does this for backward compatibility, there is no reason to do this
> > > on microvm though.  So split @ 2G unconditionally.  
> > 
> > not related to your ACPI rework, but just an idea for future of microvm
> > 
> > I wonder if we should carry over all this fixed RAM layout legacy from pc/q35
> > with a bunch of knobs to tweak it (along with complicated logic).  
> 
> Well, I think we can (should) drop max-ram-below-4g too.  There is
> no reason to use that with microvm, other that shooting yourself into
> the foot (by making mmio overlap with ram).
> 
> With that being gone too there isn't much logic left ...

I wonder if we need 2G split for microvm at all?
Can we map 1 contiguous big blob from 0 GPA and overlay bios & other x86 TOLUD stuff?


> take care,
>   Gerd
> 

