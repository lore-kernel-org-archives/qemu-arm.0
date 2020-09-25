Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1303185lfq;
        Fri, 25 Sep 2020 07:20:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5h4EiOcGIYZV06+oUMmlNV+FLQhXqCPT2Ap2fbiLdCtkTe5A4AkGk7+RVsasoDNM26QvN
X-Received: by 2002:a25:198b:: with SMTP id 133mr5603908ybz.102.1601043642097;
        Fri, 25 Sep 2020 07:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601043642; cv=none;
        d=google.com; s=arc-20160816;
        b=oIXw+tEnmde+QJWVx7prWUFTHlmYtEhyZ9MHgUEe8cieU7vPS6O8P9fg1Zs2HsC4ur
         cEMAkhvEEitIVYMmI8YaQFUJYp9eufFUUERCVJP5pm5I4k3bZT++bqmeZZFlaFvfvViS
         EJ8aiTBlO8ELMa03jEe8LB6Zi2wadlwu5taJOeVw+reP4DT1xlpaOZXqnIdE1Lh3Q/cN
         TizF6mVv5uZkGDs+HGRxQod6sCaHlMu6Y0HTZIznGjWWG6d6jVPXnrsuFAfccbJ49Bho
         ggeH1ZuWGgw54mZD1AxqPEiCgX/ss9rThNwGL6/ZuuLp5xbgo3p+XFsdfjD++yaTp8Pc
         FGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=uVlQdwTRqg39MLE9aSLls7O31TB2MuppRsZl8UFFh5Y=;
        b=gzUo79rPgwib6EANq8lQyPLXUoueOHcTJ9MJsTaNbJQ5pD3Gp52dEq25Vt4MGQmXVv
         BbjN55Daz/SeOOdumJllaaL8Rh8jIKgQw0Q1Nqy+Ff9Dh6YL9fekDyYXKksjX7uDQ/bb
         4ogL/lW3EpKjNyw/EpWlHDbRCwwydWr1uUWLMCUlrSp4VZLzW4XMoFahhH64j8+mO6Nx
         4ybBEzPtSYpNA6MvtCx+TB807L2xcOdHOmQpUW2OqGCVDfe9qi032+xNp54BYJDjxTz8
         xwLz9iJzUwmbJRz7bUPeerM9FyTil+5uVjEtbnKhM4eddkOPOYAqQJIddyp5B/9I3iKr
         zfeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aUCI+Ghx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n203si2651124ybc.67.2020.09.25.07.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 07:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aUCI+Ghx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLoaX-0001Zq-Gb
	for alex.bennee@linaro.org; Fri, 25 Sep 2020 10:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLoZc-0000Ve-Sy
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 10:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLoZa-0004gX-Un
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 10:19:44 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601043581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVlQdwTRqg39MLE9aSLls7O31TB2MuppRsZl8UFFh5Y=;
 b=aUCI+Ghxe9JQTG/U6o4f1lPY7jYW7S1Y54rKQF7YbIqmG1cQwDn+2mP2hDh8TIJkeAIqGP
 7pu4qe6ok3sAiuvTMBn/ovaLQ3EVpmo35p7Um3A4NcDS14k4FJpvPWWqvbmPLCnwZUNFVj
 vCVJZYsJU54VStAueKzd84OCp/fiok0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-uipGlzqRMU2seF6uL7KPCw-1; Fri, 25 Sep 2020 10:19:40 -0400
X-MC-Unique: uipGlzqRMU2seF6uL7KPCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C28B1018725;
 Fri, 25 Sep 2020 14:19:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B29C196FD;
 Fri, 25 Sep 2020 14:19:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 99E4016E0A; Fri, 25 Sep 2020 16:19:31 +0200 (CEST)
Date: Fri, 25 Sep 2020 16:19:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 09/11] tests/acpi: add microvm pcie test
Message-ID: <20200925141931.eoxc74sblig6ehab@sirius.home.kraxel.org>
References: <20200924062734.22978-1-kraxel@redhat.com>
 <20200924062734.22978-10-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924062734.22978-10-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n4VyFBL7r0mO

> +static void test_acpi_microvm_pcie_tcg(void)
> +{
> +    test_data data;
> +
> +    test_acpi_microvm_prepare(&data);
> +    data.variant = ".pcie";
> +    test_acpi_one(" -machine microvm,acpi=on,rtc=off,pcie=on",
> +                  &data);
> +    free_test_data(&data);
> +}

Self-NACK, this blows up in CI due to host-phys-bits not being
constant.  Forcing tcg should fix that.  I'll go post v3 once
this series survived CI runs (monday probably).

take care,
  Gerd

