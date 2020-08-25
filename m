Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3332455lfy;
        Tue, 25 Aug 2020 04:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUcv59fyboUv2ldgPeOEHqX7QeqxEPi4plf3qT80cVX7Ke75GcgLQZ/rj4YsSqIxvTPFZn
X-Received: by 2002:a25:30d5:: with SMTP id w204mr13752637ybw.405.1598353651942;
        Tue, 25 Aug 2020 04:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598353651; cv=none;
        d=google.com; s=arc-20160816;
        b=yKpiqPtAVEZtLEj5aDhLvZeYZEiDU3PPuAyr8XuVFylkTje93ZmHtpnWGI1v9TKJv2
         ZSQKZ6FVW2f/GUC2FSzlDOomuUSeC06uljFt0RDReoPJtLSD+wp6oxNy917jw/X5n+tG
         ZRjllahBOi2rp7thai32zG0xy0GDX0geAvX3wpepNhXIEak8edd2qUYWkzddKWrsvLj4
         QOngiCMp6cFNmhVXObnHl/E6VzVgIWDuYwwpzh/5+904ZGKsVZX0FHP3i2XH7aDQToQe
         qDOZTGa4UvVeETGz04hLBS4ebQ3RP7I4L1yLpGaNnmJLg9/MaHPfqWAt1aL0l32H2+IR
         6gxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=c81FEqOjPST8337vqmbiRl5BDWrlhA5LNZWI/pD8dXM=;
        b=aK31GkT1p58tUz9grIABXH1kFKh2yrfbjsnEJMnOljsKDnwC7Rk9krHXV5qAmwNLGS
         4HedWhj187aakPV8YsIDWUCK9XhSfI0Y1KDR13tD/dZRMEfQwuiUXB6l4LDf0FZFLQqd
         oUN9lfwjn91xDR3V8rG9jYud96T68N2Rx6upUK5ouBrSMrg/nFse/KmP6narA+bOgtOY
         TvwgbGFC/yjzqW6JzmE7KNinZYfCspxNVZrZqFrHckiWBqroKUCz+LWAXueFtXb7c2UR
         PBb78UXDQ+nG+iMpqe9aNdruFUfKV+8FuKYdbQt4EzYsXJsUFUg/2Lbs/iDkTAlk+Q41
         rc6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ByWokn+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si15202909ybe.452.2020.08.25.04.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 04:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ByWokn+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAWnb-0003wi-Bh
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 07:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWnT-0003uq-Op
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 07:07:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55544
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWnR-0003X3-De
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 07:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598353640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c81FEqOjPST8337vqmbiRl5BDWrlhA5LNZWI/pD8dXM=;
 b=ByWokn+4e1z5bRZTOn/qOu5lA/oR9I9lN7CZTGeZjmDYy70wGN1IWec5ieiNcc96OPHjv+
 QE1DkBCjthGDbJVHR2/W32se+IWwFwArKBDZiJpqWgQYQjAGSFbL5NzPz91nPKZtID5oH5
 afNrXRGhnA2N7UmFow5FotXJa+6Emag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-Z0BNTljJPlq1Dur4F5fzkg-1; Tue, 25 Aug 2020 07:07:07 -0400
X-MC-Unique: Z0BNTljJPlq1Dur4F5fzkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 896BE189E602;
 Tue, 25 Aug 2020 11:07:06 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D18587C5F6;
 Tue, 25 Aug 2020 11:07:04 +0000 (UTC)
Date: Tue, 25 Aug 2020 12:07:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 05/58] allwinner-h3: Rename memmap enum constants
Message-ID: <20200825110702.GM107278@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-6-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820001236.1284548-6-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 02:05:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5utuDwoKiJz

On Wed, Aug 19, 2020 at 08:11:43PM -0400, Eduardo Habkost wrote:
> Some of the enum constant names conflict with the QOM type check
> macros (AW_H3_CCU, AW_H3_SYSCTRL).  This needs to be addressed to
> allow us to transform the QOM type check macros into functions
> generated by OBJECT_DECLARE_TYPE().
> 
> Rename all the constants to AW_H3_DEV_*, to avoid conflicts.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Added more details to commit message
> 
> ---
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/arm/allwinner-h3.h |  62 ++++++++---------
>  hw/arm/allwinner-h3.c         | 124 +++++++++++++++++-----------------
>  hw/arm/orangepi.c             |   6 +-
>  3 files changed, 96 insertions(+), 96 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

