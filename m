Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1296935lfm;
        Thu, 16 Jul 2020 02:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBTcKX8+tE30T/LHBV10UVKThf9Vwr9iJpND1/8Vv+YkN1IdP8amUeR4B6hWeeZMgjYrYJ
X-Received: by 2002:a25:ce83:: with SMTP id x125mr4745779ybe.379.1594890655040;
        Thu, 16 Jul 2020 02:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594890655; cv=none;
        d=google.com; s=arc-20160816;
        b=qP1UhoRZPHn/kP6KYpxTGmgaFqimmdbU+uklTxHqXAKXicZ2s6/i4APIhJoNI9/6rM
         p9Qt45smH3JUuHgF+q8gR87zSGVNNCzU/VDWtTKezZUD7daFJurQvqCZWedNxzg6dRSN
         oORdtUxyZsEcoaS210jldflhG+c0vMg7AwKxIYOJG7GQF91nYrNQtUNm+OVNNnH7lUe3
         FBT3UKiMuf8mjSDpNOrZxG3JnvypDU91IZq+3qSx5Lzv18gzcoQcFCbXCfhugcNc+1Te
         BrCa91hvZqJIUzLVEzXOlo5ri9JmPawvVVP9EWnbZImVRfgyjIr0J2yoQpjxp1wFQtyt
         La2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1BjrKprMiemlZjIQyqXl+98jD1EI91nAgTQ2P9hkojw=;
        b=nn98c0say36uE65pwz721JnhGSI9WOBSrCWxnH2tXe1cq1LSj3OLNsbLLfrIVW8NPa
         KUZPilIOlQw0Za9NYF+7hv8uggH+t2HrFWFaJjeq5gv6/0Y4vCcpLMUZbuudD3IW4GZr
         eeH2xCyGje8WmA+t3s9NCqEchgLhZnGCaaak3b9UNOVcfuDYOE1CIL0mg5ARCECJIR+u
         3DIHwodlcnw/6NLNos3S2hgMTq0GiezI/v12J82WAGFE7AnzehhFOdsiQ6PWe4MjHMp+
         L6k7LF8yXEITZd3WcRXfM8iOrjCZjgUjNsZXBgEVBYM7x3rugqlyAtU/1ik4yf9s/HuN
         U2HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=av0zzRQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si5556992ybk.197.2020.07.16.02.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 02:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=av0zzRQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvzuo-0005kS-FP
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 05:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jvzuh-0005k8-J0
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 05:10:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30515
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jvzug-0004wR-1G
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 05:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594890645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1BjrKprMiemlZjIQyqXl+98jD1EI91nAgTQ2P9hkojw=;
 b=av0zzRQ9iL+cXC86rrU8UUeaCkPP7kecTgD2KO75nXWMtn58bdojdti0as/xC6UUVfAHaI
 muLJgGrksw2DUMFIvNc0eJOYNZr2KpDCmyfJHsZ4cFCzeQlQhWdb8R0WnfnVTuktywL9co
 erEjtwj2W3R5wYZ8nNwQ9krNvzbDj9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-H6nB0uTZMx-T-7YWq_jinQ-1; Thu, 16 Jul 2020 05:10:43 -0400
X-MC-Unique: H6nB0uTZMx-T-7YWq_jinQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AEAA10059AA;
 Thu, 16 Jul 2020 09:10:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 973805C1C3;
 Thu, 16 Jul 2020 09:10:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C26F9D9D; Thu, 16 Jul 2020 11:10:35 +0200 (CEST)
Date: Thu, 16 Jul 2020 11:10:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 19/20] tests/acpi: add microvm test
Message-ID: <20200716091035.xkgp42f56t7eohjt@sirius.home.kraxel.org>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-20-kraxel@redhat.com>
 <20200710214958.36978f12@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200710214958.36978f12@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 01:59:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: st2F33rr1Ws0

  Hi,

> > +    data.required_struct_types = base_required_struct_types;
> > +    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> I vaguely recall this belongs to smbios tables, does actually microvm provide them?

Checked.  Yes, it tests smbios tables.

seabios generates something in case qemu doesn't provide smbios tables,
so the test works.  We don't actually test qemu though, so it probably
makes sense to drop that for microvm until we actually generate smbios
tables.  Should we?

take care,
  Gerd

