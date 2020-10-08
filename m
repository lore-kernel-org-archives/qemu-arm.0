Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1434594lfq;
        Thu, 8 Oct 2020 08:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVkBpa3j5wxiXdcPDZ+OUyIvTP+gzIM14ZycS5ZXBaX0Km2M5Li34AFw/l8qckPTArh9v5
X-Received: by 2002:a25:aa53:: with SMTP id s77mr11516302ybi.413.1602170171453;
        Thu, 08 Oct 2020 08:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602170171; cv=none;
        d=google.com; s=arc-20160816;
        b=MPCuq3hg1D7doR+7ByufIGh6MmdtSzdbvDpNeyukcwtHo7kbbBP1SzP2UV5ayVfvYL
         APCb2RWu38G+t7rr3/sYymZ9Qa8AsIJH9RjqJa1+/AU6jE1xkpm/LG9tKjLrrYxUprE2
         opyCQRMw0Mj/Pe8azFw07QlWUlGS7KGr9pIfMqGXkK32P8koyD7VqhcTtYqbtbUG7sE1
         vn9mszJZY5CqEz7P1NywylrV0Oq/FmDoufaX2cKqg0LQk35JMCT4zIoMchaevrQdhkXR
         HhPpSvy/kJB1erbtinrytDOxcu2SmsOiQOVc4bjb8vE46hFuIOTeozu0qlw1kAQBCyJT
         LqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=LsTxGd52RpL1Rni+Ium1WEhbiIOmWYcR8IimClkGF6I=;
        b=u8W5SYs+xWlPg5aiPkAE2rZMK2jHQYt2ioALj9Mfgvq4PoyNN4Jyfb3lbs4Ujj94Mw
         fp0TH8YXQAN6pM/zb3tu/jsl2Q4ir/Ed54a30wG+jVFg+SIUxSEGp1XKxOq0Hu9zwQ0O
         GrhyKOZSJIGIamBf48Ts6QNjXLAqeyiXHz/qR73T6QWnD9TBJYox+h3qqyP6/3zyYn7Q
         26hc+cAjM2pYzT5DIhnDLa2HPXP1UOqhQsqhgbeP+UTdgGW1Qb3BG2VahGMlji3j9wpx
         6bue+H34E3tAtapKg4YbG0TNExbukxNwhkYXqN/JG0JV22UlxRp1Gq+Bso5wmPWb2rN6
         qWiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KrZ02n2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si5230925ybp.288.2020.10.08.08.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 08:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KrZ02n2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQXeM-0001GG-Pr
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 11:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQXdm-0001Fg-1B
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQXdf-0005Z3-Pm
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602170126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LsTxGd52RpL1Rni+Ium1WEhbiIOmWYcR8IimClkGF6I=;
 b=KrZ02n2x4/cxPS5SJk4eYhrGLo72JEazkw2ZWiG39ZZ5ueZR5kCM0CzvKfsETAFHPcTraK
 v0DS0jmudv1kTfrZ7PIsIyuYBKN6Qwy1o1LIfmSAFbzsh6hZtFOZUrzVlTwiSEl8ZXwK91
 NBM0SCBvHvOoTlGW7i1brVns1wXtkas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-CraWXUl-OCKPyA_r2ZyarA-1; Thu, 08 Oct 2020 11:15:24 -0400
X-MC-Unique: CraWXUl-OCKPyA_r2ZyarA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B976E427C4;
 Thu,  8 Oct 2020 15:15:22 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 651FD5D9D5;
 Thu,  8 Oct 2020 15:15:22 +0000 (UTC)
Date: Thu, 8 Oct 2020 11:15:21 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Purpose of QOM properties registered at realize time?
Message-ID: <20201008151521.GB7303@habkost.net>
References: <20201006220647.GR7303@habkost.net>
 <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
 <87mu0xyrtn.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87mu0xyrtn.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lpND/ceoT6yj

On Thu, Oct 08, 2020 at 11:45:08AM +0200, Markus Armbruster wrote:
> A first class static array property, where the size of the array is part
> of the value could perhaps cover this case.

This is an interesting idea, I think we should explore that.

qdev_pass_gpios() would become unnecessary and could be replaced
by a single (static) alias property.

-- 
Eduardo

