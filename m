Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1371592lfm;
        Thu, 9 Jul 2020 05:34:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqOK59MBsYxQe1stNP3kBXJVeQuqX9ZKRRabt+f5DwRQyp6/rZ5ALXKr6NtTeLM7XpdfLW
X-Received: by 2002:a25:7804:: with SMTP id t4mr114441550ybc.43.1594298049766;
        Thu, 09 Jul 2020 05:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594298049; cv=none;
        d=google.com; s=arc-20160816;
        b=F8SyW1cep4sAHHzAeOJVaBPAtL4gMmRrbNbW0CcHeQIff45yY10CGa40WmRFYLSaEI
         tjcGCSatcFFLBsfd396AxDJzfG14z9Cc5C1f6aevfFFL+fMvTQtJ5EUWtlyeI37SxbQU
         1RLFVNqno6Q8hJ9tH60xcxgtEb19dNDSZWeQGAji/RpJ015UfItYJeyLStMuKUkuZ+m4
         5jDuUXSTZ0Scs4KIFf3HN+7HDBC/N5uE0JtvtDUOUX+g89q9vIQdXc3kn0/0hQmaPowS
         pizyvGGIvFRKPEz8er6ZwyocNJOzz1ez2u7tJ/nP9wty4VejOp7tRqOf9f3w8Jb0IpC4
         R1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=MGq8hqi2c9xOMggW5B85JWQ/s8mWEuYLcmXnNXM1OgU=;
        b=fjFKD68xC0iB7unpM0QhIXbv6WfO+4FJY13cZN/TacDvH3VFfTLmkc2GPRdirFBEZQ
         Y67KpLC3Lz1jVWNDGnVfG9outeDthEVzYbk5TIT8a9Wz9cfRSMa27mLPpbmRWuMLBBXv
         osRdIeZC7iShBdUAjbseFHTKg+Hfla0M3TFx9NyYHg0RH7EfPCFVQfJzaC5ZOYYL/924
         47Vy8MNLBJKFlJ4yfMocxapt27wPOBrEikkzZCZRsN/+JZXdGZfgb8lx+caH9VoX64Og
         2+NT7Nh8xYTiunHCAo62vEmLGXIGzH7WxlRyUL5FGVfYQlAVLuZCr1quXJQUT7Y7c71f
         rRCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lg2Shr6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j192si2532368ybj.495.2020.07.09.05.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 05:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lg2Shr6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtVkf-0007Xi-2B
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 08:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jtVkO-0007Wr-76
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 08:33:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30394
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jtVkM-0003kD-6U
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 08:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594298028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGq8hqi2c9xOMggW5B85JWQ/s8mWEuYLcmXnNXM1OgU=;
 b=Lg2Shr6G+jSO9VSRxzz6cPzQI7bSdQNhCGt41q/pV2ApqT5kHk5SnFEK0bycHR6OIrdmL/
 lOBluw1GU3xrn6KDHRcgCxmSVz8WqSroKMGE8HT2t4vmDX6PIaB6nU4zMUrwzkLdzoMF1m
 AKJjGnIrtsxLCjWHnsnXl1pYMZkLJAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-yiF2WXiJMY6pZogNnT-1gA-1; Thu, 09 Jul 2020 08:33:40 -0400
X-MC-Unique: yiF2WXiJMY6pZogNnT-1gA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05E90100A61D;
 Thu,  9 Jul 2020 12:33:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13EA060C80;
 Thu,  9 Jul 2020 12:33:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4B282187; Thu,  9 Jul 2020 14:33:32 +0200 (CEST)
Date: Thu, 9 Jul 2020 14:33:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 08/20] microvm/acpi: add minimal acpi support
Message-ID: <20200709123332.dlyciqz3sq6zdgsk@sirius.home.kraxel.org>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-9-kraxel@redhat.com>
 <20200708121614-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200708121614-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 04:33:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ba/3FW2DUo/N

  Hi,

> > +    scope = aml_scope("\\");
> > +    pkg = aml_package(4);
> > +    aml_append(pkg, aml_int(5)); /* SLEEP_CONTROL_REG.SLP_TYP */
> 
> I'm not sure what does the comment refer to here.

It's the register field the value gets written to.
With full acpi this is PM1a_CNT.SLP_TYP, hw-reduced uses
SLEEP_CONTROL_REG.SLP_TYP instead.  This is cut&paste from pc/q35
version + adapted for hw-reduced.

> Does this 5 match
> the value IO handler tests against?

Yes.  "5" for S5 state (aka poweroff).  Can add a #define.

> Below is from "7.3.4 System \_Sx states" right?

"7.4.2 \_Sx (System States)" here (ACPI 6.3), guess that is the same.

> > +    AcpiFadtData pmfadt = {
> > +        /*
> > +         * minimum version for ACPI_FADT_F_HW_REDUCED_ACPI,
> > +         * see acpi spec "4.1 Hardware-Reduced ACPI"
> 
> Spec version - I'm guessing ACPI spec 5.0.

6.3

> And I think here is where you refer to
> 	Table 5-34 Fixed ACPI Description Table (FADT) Format

Table 5-33 FADT Format

> > +         */
> > +        .rev = 5,
> > +        .minor_ver = 1,
> 
> So 5.1 I am guessing just copied from virt/arm?

Yes.

> > +        .flags = ((1 << ACPI_FADT_F_HW_REDUCED_ACPI) |
> > +                  (1 << ACPI_FADT_F_RESET_REG_SUP)),
> > +
> > +        /* Table 5-33 FADT Format -- SLEEP_CONTROL_REG */
> 
> You need to use the earliest spec version that includes
> a specific feature - and document which one it is.

Phew.  Isn't it easier to just use table and field name then, so it is
easy to find in whatever version of the spec you have at hand?  Also how
can I figure the earliest spec version easily?

Sometimes the 6.3 spec documents which table version added specific
fields, sometimes not ...

Is the table version synced with the acpi spec version?  Does DSDT v2
mean the DSDT format was updated for ACPI 2.0 and hasn't changed since?

> But the main poit is AcpiFadtData actually has nothing to do with
> FADT format. It's an abstracted API 

The FADT is generated from AcpiFadtData.  There is a 1:1 relationship
between most AcpiFadtData fields and FADT table entries.  This isn't
what I would call "has nothing to do with" ...

> > +    xsdt = tables_blob->len;
> > +    build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > +
> > +    /* RSDP is in FSEG memory, so allocate it separately */
> > +    {
> > +        AcpiRsdpData rsdp_data = {
> > +            /* Table 5-27 RSDP Structure */
> 
> RSDP is since ACPI 2.0, table number there is different.

References to ACPI 2.0 are almost useless.  ACPI 5.0 is the oldest
version uefi.org offers for download.

Guess that underlines the point I made above that referencing specific
versions of the spec doesn't work very well ...

take care,
  Gerd

