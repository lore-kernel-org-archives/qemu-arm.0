Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp212136njc;
        Thu, 10 Apr 2025 21:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXPv6/SxW/aLvuskcdB3lDBUWqMmPnYoWEaIa8SpehJdXcR6KCjWjVBG6AqCQjjGMcedggJlMBG2SQ0yw==@linaro.org
X-Google-Smtp-Source: AGHT+IFAm/NREFM2JawusJh1ZPxqDXQK+3KmlWwgUOwofzfSHvEjhzfedlpgAL8/ox+lmosb3hc2
X-Received: by 2002:a17:90b:5405:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30823775bf0mr2262740a91.8.1744346344802;
        Thu, 10 Apr 2025 21:39:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744346344; cv=pass;
        d=google.com; s=arc-20240605;
        b=TLBLaD/3lLVl2psZ56KsV0eLFxF8Z6ujKeIIurwHDZMVt63ZsJ6U11epekYBHBlU+u
         J6Y41+rI3DjBNIXPdyvjEfCkFZoQtAovXbtsqeZ8mjShyhrA+xBttQv59FZE0EjjENnq
         kko7ntg+oc3nckc1Yyf6K7BUdg60r5P4GIL4MiVG20p0vLpvp7BJX+eYveq9459Lkfm1
         +rBknDPD3rOAHRz5L3nGtsUmKQ3NJt0dhzTYua8npgxcr47qYD2Sgfi2345EbNoRn44D
         D6PO8dGv+ZWIUM2FG3Nu9Re/N2XF10bf3fsvyvooUoLo2oq/BFB87A7cEir/m1pPl6if
         T78Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=PTzIILfn+BEwNwtW56J6lhs9IhbQAvx+RqJINSsKWq4=;
        fh=VGcoBDIBh5SXF1goT3YpiVSAdV7TMpyBGZ3UU5sKMH8=;
        b=WdToAdUbSJ2SW2qmcNDlzGSIhp6iz6gORUs9dApq5rcfpuGUEUT3Ay5RyjrlqTbz+H
         lxX7O8lXuByz/JyWt6s7lHNhqJB4bEc+pr1slJKhY0vJEaelsYargP00J0/K6iJM7/5G
         /+weNBVfOd0zuxx2djG2/Rgb9sJq1GVC1F4oj92ndjvOQCRFI0fz2+CI6W2FxR/6AyC1
         kvmNdS1mVQ2b2ZNjr8SDIN5MKtmDOemJSwbKRiww3aaJgR/3JJQT0UkB0j5NP1Ty5X5+
         ZObwuUS6YKuaSQ/LLL2qnYsxjVWSF7uZz+z/W8cWqDvNPc2pkosyAXGGsqVYuuytXcWo
         PAFQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsHV3IKx;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-43135-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-43135-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-43135-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-306dd17cb7csi7064108a91.119.2025.04.10.21.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 21:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-43135-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsHV3IKx;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-43135-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-43135-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61A438C147F
	for <alex.bennee@linaro.org>; Fri, 11 Apr 2025 04:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813191EE017;
	Fri, 11 Apr 2025 04:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VsHV3IKx"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DC1E7C11
	for <kvm@vger.kernel.org>; Fri, 11 Apr 2025 04:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744346329; cv=none; b=jwbRZXPhLjvoIYqxB+yP8sY9kwlpB9safQgZOe/t0Yn7ta026fLcXakQ7IIsQEnHukq6gw8wUgAN4+qv3j3QXL/qmNb+AslZm5RLaL57dOyiPMzjxhfh7rin79AZ6SvTT4voAPxscQxyYahVKKQ/5dl4LtQQsZoN2J/OmDMuMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744346329; c=relaxed/simple;
	bh=2H6gKfJ46rATaoiPZtdAGXQ+PCnNNFuIoHcOrqLeR5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p8zP8BtS7rrCERVpWDxr3xIs6zxh/PNzCSjxV7U6v0L6MjYlc2LFjQXyKhDUT+TiebzLmGCDHcgLLrAOxUuvof38RXXtAfKfk6mnzW1BKdY2w60jnuulFU6lr44Lvxy9R6tUx1gDGvkvZ8jjj4CuyFcKwgO44eOThNY1UyX4R28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VsHV3IKx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744346325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PTzIILfn+BEwNwtW56J6lhs9IhbQAvx+RqJINSsKWq4=;
	b=VsHV3IKxnnT8xCdkfMytkmylQMFsMCEVdiyyJ+G7fGipnAITV54zJmue+DzvEJYf+tNp23
	gQHC+qKG50pTImTSNsWcPeAvS2F5wesm4V6cGftgwvdJQQLkjgftbEa9jJ5WH5+Zuhl7HX
	VrZeT7KNufXuRxrqAwfgbObSmS/unUw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-377-36oH1RziO8KYTsgfbNR7zw-1; Fri,
 11 Apr 2025 00:38:41 -0400
X-MC-Unique: 36oH1RziO8KYTsgfbNR7zw-1
X-Mimecast-MFC-AGG-ID: 36oH1RziO8KYTsgfbNR7zw_1744346319
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F0521801A12;
	Fri, 11 Apr 2025 04:38:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4676A1828A9F;
	Fri, 11 Apr 2025 04:38:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C6AB821E6773; Fri, 11 Apr 2025 06:38:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,
  Michael Roth <michael.roth@amd.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Shaoqin Huang <shahuang@redhat.com>,  Eric
 Auger <eauger@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Laurent Vivier <lvivier@redhat.com>,  Thomas Huth <thuth@redhat.com>,
  Sebastian Ott <sebott@redhat.com>,  Gavin Shan <gshan@redhat.com>,
  qemu-devel@nongnu.org,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  Dapeng Mi <dapeng1.mi@intel.com>,  Yi Lai <yi1.lai@intel.com>
Subject: Re: [PATCH 1/5] qapi/qom: Introduce kvm-pmu-filter object
In-Reply-To: <Z/iUiEXZj52CbduB@intel.com> (Zhao Liu's message of "Fri, 11 Apr
	2025 12:03:20 +0800")
References: <20250409082649.14733-1-zhao1.liu@intel.com>
	<20250409082649.14733-2-zhao1.liu@intel.com>
	<878qo8yu5u.fsf@pond.sub.org> <Z/iUiEXZj52CbduB@intel.com>
Date: Fri, 11 Apr 2025 06:38:35 +0200
Message-ID: <87frifxqgk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 2LGHjxj1GugX

Zhao Liu <zhao1.liu@intel.com> writes:

> Hi Markus
>
> On Thu, Apr 10, 2025 at 04:21:01PM +0200, Markus Armbruster wrote:
>> Date: Thu, 10 Apr 2025 16:21:01 +0200
>> From: Markus Armbruster <armbru@redhat.com>
>> Subject: Re: [PATCH 1/5] qapi/qom: Introduce kvm-pmu-filter object
>> 
>> Zhao Liu <zhao1.liu@intel.com> writes:
>> 
>> > Introduce the kvm-pmu-filter object and support the PMU event with raw
>> > format.
>> 
>> Remind me, what does the kvm-pmu-filter object do, and why would we
>> want to use it?
>
> KVM PMU filter allows user space to set PMU event whitelist / blacklist
> for Guest. Both ARM and x86's KVMs accept a list of PMU events, and x86
> also accpets other formats & fixed counter field.

But what does the system *do* with these event lists?

> The earliest version uses custom parsing rules, which is not flexible
> enough to scale. So to support such complex configuration in cli, it's
> best to define and parse it via QAPI, and it's best to support the JSON
> way.
>
> Based on these considerations, I found "object" to be a suitable enough
> choice.
>
> Thus kvm-pmu-filter object handles all the complexity of parsing values
> from cli, and it can include some checks that QAPI cannot include (such
> as the 12-bit limit).
>
> Thanks,
> Zhao

