Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp993329lfg;
        Thu, 19 Aug 2021 23:07:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkmelSycwZyHh9DXUl/VT7h8isu4ZZ3nC3v8e5ERhyXfJoIpNcjLJU3qAS56vv3lhROmu0
X-Received: by 2002:a05:622a:1347:: with SMTP id w7mr8149706qtk.325.1629439675660;
        Thu, 19 Aug 2021 23:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629439675; cv=none;
        d=google.com; s=arc-20160816;
        b=0Ek9JwM3klfGrqW1lhZ2d2laJLWb44E3PHx93NZkwtTjXVCsTBGQSLFURqW4lOYVUg
         aj7EdFT+uiBCP6Cj6y7R6AU9J0/RPSCjOpRR2k2rUoF61bI6X4SmYRXqlMRfFdQ8+kdL
         9O3tInVwCoa9M7ED/LlTr5xozZ+O0Pe/StHh7/i47FpnguapWxtVMhXrEcnr9941gXbW
         PqxFlqifvuT1E9B3G2V5sMHpSjKU33ZMCdi1FnrqhP0fdk7MTCTcOdlDQ7PHXRaYIFUG
         xd7qNSkF1iOp+RxArIJW4J11W0J9ABMj2Uy6bQNHIktFL3GitH3mRfK8EqVgKBvMVhEY
         xOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xsLMEBc/3vvxc/MLHz3cVFR0qb6gpoJ9PareRakC5ZA=;
        b=1Aa9FYFpD8I1nlFURSxpfgQXDoBjKTVpsEGACbOoi5+qwwxKeC3kbHP02uD7rVnn8u
         Kn6zOoy0OyAX9QGl4RXG+9XkVTWYWl4hb2vM/soxdgyMIeXO/R3GTRmjWOixeC7Zddb5
         KdyJPpVxp2OaSC4ijwEe8wrYHFmbjOs8EiOAaET5b+t7KFNh7Vqe/jV6Td5mpF07vjgA
         b5JVskvxzQsbWyZWEDIZxfcf4nUobP+jCeQNEuwm2YIz50BCep0jjUu4FsZcxzydBlz/
         cLa9ZxRg+C1blOuzuajvvCmDKQBVewfwik+J9nDyXTeYT+41BFcwLNr5UFz3bExWjyNB
         cjYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ld09w0uz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si3459958qki.237.2021.08.19.23.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 23:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ld09w0uz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGxh5-0005ZR-0y
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 02:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mGxgg-0005Yq-Qs
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 02:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mGxgb-0007v4-Gc
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 02:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629439637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xsLMEBc/3vvxc/MLHz3cVFR0qb6gpoJ9PareRakC5ZA=;
 b=Ld09w0uzIpiKUB+gvj1mExJoBWjDODAg19gfS/Qqzy9t5o+g+qsdg+9I6fNm9eXxo8KsRp
 utPg8MSmlrFnFBNP2VJha7ublkLeloiHZNTgJ8j+gpGu+s1CY6T4TGJeAEVd2CIDDuKSIo
 qx+xj6+BCjeyaIwtgI+M4zFN4QycLt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-IN5f6ztTP86XtOpEnEqBng-1; Fri, 20 Aug 2021 02:07:16 -0400
X-MC-Unique: IN5f6ztTP86XtOpEnEqBng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B85341082921;
 Fri, 20 Aug 2021 06:07:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 255DF60C13;
 Fri, 20 Aug 2021 06:07:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 494B218007A6; Fri, 20 Aug 2021 08:07:03 +0200 (CEST)
Date: Fri, 20 Aug 2021 08:07:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 6/6] memory: Have address_space_create() re-use
 global &address_space_memory
Message-ID: <20210820060703.njdj5pfa3lz66zjb@sirius.home.kraxel.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-7-philmd@redhat.com>
 <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9vbycVxP4R5i

  Hi,

> This also seems to me to be the tail wagging the dog. If we think
> 'info mtree' has too much duplicate information (which it certainly
> does) then we should make mtree_info() smarter about reducing that
> duplication. Off the top of my head, we could change the code that
> prints ASes to do something like:

>            qemu_printf("...same as address-space %s\n", name);

Neat idea.

Having 'info mtree' accept an (optional) 'name' parameter to pick an
address space to be printed would be useful too.

take care,
  Gerd

