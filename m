Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2618135lfc;
        Mon, 25 May 2020 21:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYYuBP1+kQvoh8vyHACieUwV0Fh2T/u7U/wfGz8hROWQ2yN1ywixqZJCXRjCCJKi7CpuOm
X-Received: by 2002:a37:e06:: with SMTP id 6mr191752qko.125.1590468541256;
        Mon, 25 May 2020 21:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590468541; cv=none;
        d=google.com; s=arc-20160816;
        b=qyWjz8q6V5bXK4Zpr16Y72DQV3or+1Ab2+qD3r9e5EUGeUOqMHB+YREFosANh2k0b6
         JjYM+ZAsW74hbwBnBeY04GKlbmgJMtuTV7hoD6IeO3E3cHiL+umaMgF7ZTmssg6x3s5I
         aNRDmU2uGlv8CKR9vzPwCFn315t9PZGfYvtEDl6TulylqECpcqAsW43gBWBNaqSzXacs
         k2i97JnUNZSScSA9GFpS4uOd5VApgiUZdIUezhXJzh0QugSntqdXA+1Xw3bx9i8Nrrem
         LhmfFF/GjusDBvVffYnf644N2Cn1rnGsBhEM9QZsgsK9R25MsmM0Ru3ANeHlmHaguE5t
         2XUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=kTtIt+PGiXS7I6J5XlPeQ5fiJGg8Ep4BqurDKwOpqFs=;
        b=i+DlSS4/D/2qW4drrdOgER7qRT41uVBS/OM+XgsSMkIrtckUaqZAGjCA85hhzVJwNF
         3q5kvoyxJ146n9TXcvUmPuZjs8wubZMdg+k10iyU49CaeZo7y7yNn/7FJx8cGROO/EQy
         BnBCP7HyoPJM9ig76PlSrOoYe1Ghhn6K/8A+N8EPSqMBjn7EZFe7aQo/pGqPkc7PT025
         ArndR8Y/f47a7SejecAecuw+PVxOI8iz9nvoqqvqIS5oE8dnpIj7FPV13RadmiFLoRbm
         emNlw0IZemWClttaMtZfAfmDO/kUb92ASXoPIcSwJO7oukQEuX0Yz1HRlDCgsDOdLQvH
         Ah7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QHQlDcDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y66si10872469qka.188.2020.05.25.21.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 21:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QHQlDcDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdRWO-0002Cx-Mf
	for alex.bennee@linaro.org; Tue, 26 May 2020 00:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdRWG-00024w-3M
 for qemu-arm@nongnu.org; Tue, 26 May 2020 00:48:52 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41101
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdRWE-0002fz-Hb
 for qemu-arm@nongnu.org; Tue, 26 May 2020 00:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590468529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kTtIt+PGiXS7I6J5XlPeQ5fiJGg8Ep4BqurDKwOpqFs=;
 b=QHQlDcDO0MCrnIkl0tkO2s3ZeiZNqrMXW8Mkb7U2wlbnGkbcK44HSZZ9YcDpzXZT68+odq
 45+3VRt5HgVZA08uvHDW4J7HaW6oKJck9XyVVxKjWUSZzxnUEFLsNgEnnqJChCU+pu+uMz
 lsu1S46NMIN24LTwOEGpvSqxafmWD5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-cOZKar-pO0C3scoMmziVUw-1; Tue, 26 May 2020 00:48:47 -0400
X-MC-Unique: cOZKar-pO0C3scoMmziVUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B4241005512;
 Tue, 26 May 2020 04:48:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3777F5D9E5;
 Tue, 26 May 2020 04:48:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 32DC81753B; Tue, 26 May 2020 06:48:39 +0200 (CEST)
Date: Tue, 26 May 2020 06:48:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200526044839.bncj6iltugnzgfmy@sirius.home.kraxel.org>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
 <20200521112921.641f12bb@redhat.com>
 <20200525114508.hhvyzjiqja6knz6l@sirius.home.kraxel.org>
 <20200525183615.5f8e67d3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200525183615.5f8e67d3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 00:48:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fPqlpsbql4TH

> > Well, I think we can (should) drop max-ram-below-4g too.  There is
> > no reason to use that with microvm, other that shooting yourself into
> > the foot (by making mmio overlap with ram).
> > 
> > With that being gone too there isn't much logic left ...
> 
> I wonder if we need 2G split for microvm at all?
> Can we map 1 contiguous big blob from 0 GPA and overlay bios & other x86 TOLUD stuff?

I think it would work, but it has some drawbacks:

  (1) we loose a bit of memory.
  (2) we loose a gigabyte page.
  (3) we wouldn't have guard pages (unused address space) between
      between ram and mmio space.

take care,
  Gerd

