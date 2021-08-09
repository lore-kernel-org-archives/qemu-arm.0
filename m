Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp164899lff;
        Mon, 9 Aug 2021 02:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyypx943WPRADjd6UFHMPIqmEI1cDHJM0obuiXLxldO1MwgI5X4rwvbe9GKBLIOQEQyG6iY
X-Received: by 2002:a92:2009:: with SMTP id j9mr317429ile.108.1628500436740;
        Mon, 09 Aug 2021 02:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628500436; cv=none;
        d=google.com; s=arc-20160816;
        b=VD/9slKn/gJyvi1Hhi46AanM1BVm655kfdigaKl5lPswe1qFr+dPFpgnQHrPVo8qb5
         dNP1Y+YZyHLbpV3Fd7oy+vGNgiKln1UgxBmMRoNY4uuKU8/NBKaoGzAf0QjLzvFPig+7
         bL6Uo6sM+x6+mp3QcarhtzamKRLIEeIXXTdQG2SlstJWNFoyVS1PKyjFphmPUZh8vSut
         gjsqK8PW1hN1dWhEMqC41uQtWGBryeHEC3X2HQLYxOI7QB77+cUPuwPcNKCfOxoosv8P
         d1+Bxi5JR7aQHwQlr9SaPyaFCiIBrg/ulKaV5USjKK14nji+lCw8lkc8ciqaDgH0b7np
         WqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=O/SUyjpCKPa1NyUnM0sSjnDbTlJNyAN0RvOXoyd3MXU=;
        b=ws2QaJF5nayrHdStD1CxGiGnabbeGieBOUKNUwDos0DM1E5usJPlkZiU4BFMUMqsen
         HcCsyGuviQCD0DdryLqEjrALeUiIUOwR+C2837IoayK4gAF1/2v8nM2Ld4DZB+yDvv1R
         Ieu6zJWNELCovcBa+PjfGutCWL9r2bTJFOzfRxRjnyGai7qpgF2liKpHvAs5Y9vgNjrq
         zxxrX3ttlHRkiQRX7npmLk2lV0W1y4lj+H+zogliKOjG3c4zuBNtPP4fFCebe1T+MRPF
         MHuzGMJjSEIyG0wNT3kFdW5wMWvbMb4x94b7gWWjoN7HR1SiHVmCDAa2uYezsb9KrsXm
         y3MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HeYrPIQv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si15707544iln.130.2021.08.09.02.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 02:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HeYrPIQv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mD1M4-0007v6-3K
	for alex.bennee@linaro.org; Mon, 09 Aug 2021 05:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mD1Lv-0007sa-A8
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mD1Lt-0001kx-0z
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628500423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/SUyjpCKPa1NyUnM0sSjnDbTlJNyAN0RvOXoyd3MXU=;
 b=HeYrPIQvbeHQnQe676xoopYfob7OP+pR30+Kiqavu0N12dBg0HzWtRFoqgB8A2y8HboTSU
 E/ZsAvELGRE2jjnwwiab9sKvbRnLnk00GnWqIbUfKXG3Lb0tOYlhzmxN1cIQQpJMWBNb+R
 MyE5Lb0qDEJwGNOf/dUPaGbpNq8YpJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-LvUADNntNNCb0I0PJMOs4g-1; Mon, 09 Aug 2021 05:13:42 -0400
X-MC-Unique: LvUADNntNNCb0I0PJMOs4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C47C1190B2A3;
 Mon,  9 Aug 2021 09:13:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 780104A66;
 Mon,  9 Aug 2021 09:13:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B34121800981; Mon,  9 Aug 2021 11:13:31 +0200 (CEST)
Date: Mon, 9 Aug 2021 11:13:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
Message-ID: <20210809091331.s2hy6qc566zhgg2a@sirius.home.kraxel.org>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
MIME-Version: 1.0
In-Reply-To: <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Qiang Liu <cyruscyliu@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W0V6TB8jr6rS

  Hi,

> As a side note(not strictly related to this fix) should we continue
> joining reproducer patches with the fixes? In order to test the
> reproducer, you need to cleave the fix off the patch. At the same time
> we don't want to mess up bisection, so does it make sense to have the
> reproducer patch be separate but come last in the series?

Yes, I think it makes sense to send the testcase as separate patch, and
the ordering (fix first, testcase second) makes sense too.  If they are
separated it is easy enough to create a local test branch with a
different order, or to just temporarily revert the fix to test the
testcase.

take care,
  Gerd

