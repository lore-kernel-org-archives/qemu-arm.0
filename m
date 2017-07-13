Received: by 10.25.44.15 with SMTP id s15csp2439427lfs;
        Thu, 13 Jul 2017 10:13:43 -0700 (PDT)
X-Received: by 10.200.55.208 with SMTP id e16mr6213659qtc.198.1499966023131;
        Thu, 13 Jul 2017 10:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499966023; cv=none;
        d=google.com; s=arc-20160816;
        b=gtkBG5lgACMzR8aR1y1h2UmvE0CYUgxq7wWFLaqpoBZM9pGLfMOnxtLvfLVOYkyIDp
         nJHAJj6jpZsNCsOja5/midctJEFBGG3o4ybmXAVNbzYj0LjHwL+u5Yz9dOMuElUotqXw
         oMQz7zPfjN4k+WJJNiiWTNi4Cpgjccu4a+ViMcC7mmTIom5+ufTy86A7/ia8+SJCjKPK
         fPkWJc4Rv3T0kCo4Jad5V1/YNYfvMVmGzNOYazIWv/srUGTFqr/+TukCXHmHNwYTt4Xx
         mYIk7cjfB3L3mz+Ep8hQBziY45UywIHYAzc2GkwKxTYDX9Qw6NzSE7he9LfSJTKlOZ7R
         SSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=92/hB5GBXwU6Eic5sjAa/cg762JS/7OI4vP9T94eM8g=;
        b=hr9OAUrpxYdeu/rLnyVTBIZ/sM+x7Hh3gb1fvHJqGF53XEP4ys1UvLEJyApu8ACQRx
         vpUC3opXJe5iNeI0ga9wHoyxb54q/dBw4dkoyMRaXVyOSry6KuYiYOma8SrehBdCljFt
         FckUu1llpHDs2Dj0bBGxErqoIM1EyYSkR/rypvis8sZXQiDGJkuoplX0It3IcWzZmHVv
         eQRDMXD8mI6MRGvPj7aSus1V1vjZOgqwAYic6OZwo+sFgCWQ/RTufPg3f9HvOe2IeE5v
         GFE1vWifWwbMaAqyviXLa8LS8+uwARzDD+JzvOJxoFxua91PMj4EcPOZDcKn0Qz5o+Hs
         6UIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v75si5458576qkl.144.2017.07.13.10.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 10:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVhgK-0005y0-Dv
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 13:13:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVhgG-0005wu-1F
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVhgE-0003TU-SC
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:13:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dVhgE-0003TB-Id; Thu, 13 Jul 2017 13:13:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77B9E7F6B1;
	Thu, 13 Jul 2017 17:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 77B9E7F6B1
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 77B9E7F6B1
Received: from redhat.com (ovpn-121-70.rdu2.redhat.com [10.10.121.70])
	by smtp.corp.redhat.com (Postfix) with SMTP id 1B92D60466;
	Thu, 13 Jul 2017 17:13:29 +0000 (UTC)
Date: Thu, 13 Jul 2017 20:13:28 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20170713201112-mutt-send-email-mst@kernel.org>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-2-git-send-email-gengdongjiu@huawei.com>
	<74ac9b79-0225-0cab-559f-6204754de5f0@redhat.com>
	<47cc803a-d1d9-da3b-43f9-31a54ce290e2@huawei.com>
	<ca0eaafd-21b7-9cf8-91aa-8c4e2c5d95e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca0eaafd-21b7-9cf8-91aa-8c4e2c5d95e3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Jul 2017 17:13:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/3] ACPI: Add new ACPI
 structures and macros
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	qemu-devel@nongnu.org, gengdongjiu <gengdongjiu@huawei.com>,
	Gaozhihui <zhihui.gao@huawei.com>, qemu-arm@nongnu.org,
	james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, zhengqiang10@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AMfGrDvq84NL

On Thu, Jul 13, 2017 at 05:33:30PM +0200, Laszlo Ersek wrote:
> On 07/13/17 14:00, gengdongjiu wrote:
> > Laszlo,
> >   Thank you for your review and comments.
> > 
> > 
> > On 2017/7/13 18:33, Laszlo Ersek wrote:
> >> On 07/12/17 04:08, Dongjiu Geng wrote:
> 
> [snip]
> 
> >>> --- a/include/qemu/uuid.h
> >>> +++ b/include/qemu/uuid.h
> >>> @@ -44,6 +44,17 @@ typedef struct {
> >>>  
> >>>  #define UUID_NONE "00000000-0000-0000-0000-000000000000"
> >>>  
> >>> +#define UUID_BE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)        \
> >>> +{{{ ((a) >> 24) & 0xff, ((a) >> 16) & 0xff, ((a) >> 8) & 0xff, (a) & 0xff, \
> >>> +   ((b) >> 8) & 0xff, (b) & 0xff,                   \
> >>> +    ((c) >> 8) & 0xff, (c) & 0xff,                    \
> >>> +    (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) } } }
> >>> +
> >>> +/* Platform Memory, this is from UEFI 2.6 N.2.2 Section Descriptor */
> >>> +#define UEFI_CPER_SEC_PLATFORM_MEM                   \
> >>> +    UUID_BE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
> >>> +    0xED, 0x7C, 0x83, 0xB1)
> >>> +
> >>>  void qemu_uuid_generate(QemuUUID *out);
> >>>  
> >>>  int qemu_uuid_is_null(const QemuUUID *uu);
> >>>
> >>
> >> (e) I think the addition of UUID_BE should be split out to a separate
> >> patch; it adds a general facility. It should likely be the very first
> >> patch in the series.
> >   Ok.
> > 
> >>
> >> (f) While I think it is justified to have UUID_BE() in "qemu/uuid.h", I
> >> think UEFI_CPER_SEC_PLATFORM_MEM is too specific to have here.
> >>
> >> If UEFI_CPER_SEC_PLATFORM_MEM were *not* a standardized UUID, I would
> >> suggest moving it to the implementation ("include/hw/acpi/hest_ghes.h"
> >> -- which in turn should be moved to patch #2, see my remark (d)), *plus*
> >> I would suggest eliminating the new #include from "acpi-defs.h", see my
> >> remark (b).
> >   understand your idea.
> > 
> >>
> >> However, given that this UUID *is* standard, I suggest keeping the (b)
> >> #include as you currently propose, and to move the definition of
> >> UEFI_CPER_SEC_PLATFORM_MEM to "acpi-defs.h".
> >   I agree with you.
> > 
> >>
> >> I vaguely recall that Michael commented on this previously, but I don't
> >> remember what he said. Michael, are you OK with my suggestion?
> >    Laszlo, I pasted Michael's comments here, as shown below. Michael said the definition
> > should use build_append_int_noprefix to add data. but I think it may not good, becuase
> > the section "UEFI_CPER_SEC_PLATFORM_MEM" is runtime recorded as CPER, not a ACPI/HEST
> > table member, so it is not generated when system boot up.
> 
> I agree: the UUID in question is not placed into the ACPI payload /
> fw_cfg blobs, it is written into guest memory at runtime, into the
> firmware-allocated area, if and when there is a hardware error to report.
> 
> Thanks
> Laszlo

The main point is that wrapping it up in a macro with an
unreadable name is not really helpful when it's only
used in a single place.


> > On the other hand,UEFI_CPER_SEC_PLATFORM_MEM
> > definition is from UEFI spec 2.6, N.2.2 Section Descriptor: {0xA5BC1114, 0x6F64, 0x4EDE, {0xB8, 0x63, 0x3E, 0x83, 0xED, 0x7C, 0x83, 0xB1}}.
> > if use  build_append_int_noprefix to add, may confuse others.
> > 
> > -----------------------------------------------------------------
> > -----------------------------------------------------------------
> > There's no reason to define these messy one-time use macros.
> > They just make it hard to look things up in the spec.
> > 
> > 
> > You can use build_append_int_noprefix to add data of
> > any length in LE format.
> > -----------------------------------------------------------------
> > -----------------------------------------------------------------
> > 
> > Hi  Michael,
> >   what is your suggestion about it? do you agree with Laszlo?

My main point is that the macros do not seem helpful.


