Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp243890lfq;
        Wed, 9 Sep 2020 02:01:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL402WcaAcCF48rdrdTNmX9D1mUbUqjQVI448hg+ORX3Eu/YzRyd05Xok65dhnmbHquAIx
X-Received: by 2002:a25:aa2b:: with SMTP id s40mr4607021ybi.26.1599642064987;
        Wed, 09 Sep 2020 02:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599642064; cv=none;
        d=google.com; s=arc-20160816;
        b=b3mZ+XwSoXJrKgTstHwyBUsMTwlNM967Vby6OlSxEj4J3Cr1rDUjBkT8Q5tXEgGDaG
         2O667KcMipNjETBU43cuA3Th2sbj3BLpQgVLj4PDE3kx/ShcNvkE/COKqxH+oZ2x6Fky
         l9bVRUehmk4G7cMbUx/rhx28HWDC9AaEQEm29sVei/bBUpqfFdAUTOzP0jXxMAratNsb
         X43sth7cd1H6bi2OSVkkqA4Pj7rZPGFmlxBseC1X9t4O9fYCFE9HOLdGGb2Pzwc+w/Ie
         5OCW5FsTPOodSeywNAB5nLxkOy4vcm1NwsNMOjVAOTa6UEJV3CEcbwoerQksaFY47qIV
         U21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=rwHwEH+hcxtK4GvmgVtbbkjf1tPkPVKwYH01ZUGePiQ=;
        b=CeT9Dt2IyztRwtOPM4d5WlL81LNq/dNSb2KYPvHyM4D+J90phCSaXYjYr6LtKHyrO/
         vblMcL0Bc1I/k3Z4LM+/NYrm0cjnNikER24GPOlXTd/cNhZviTHd3SQ8THVzw3j+vFx3
         35ez7N1QKL4sS9Jiw97dCWU6B4OGC20l1arj9mj0Ikpq7VJ5yXWXFo1LeCyaypObP7N9
         lhNseL2yq9d3RmRiQ1SMOstCp+ji1OcT853UDRY4GOUiqBDrUysPYqkyIRRVzuD/NVVO
         sMncOcycXsxov+3LqSKlfUHynlPCS57LULP6W4s5+81a4pEQ42DOGi3dbj3G0Z2+Bt+1
         f7AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LzrZxVc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si1792708ybp.309.2020.09.09.02.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 02:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LzrZxVc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFvyS-0000IK-CE
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 05:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFvy7-0000Eu-Lz
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 05:00:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30120
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFvy5-00021f-P0
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 05:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599642041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwHwEH+hcxtK4GvmgVtbbkjf1tPkPVKwYH01ZUGePiQ=;
 b=LzrZxVc3a0RS+j3gMQarMqjzq7l5GON4OYv9pd7Zng6hKmUq4i9wtsEyrDbV0MzApP+ddt
 J94bHi3andyJdr+jYSD08QffNIbreHI3fNG9qMWH9TAkpQ7QOEHa6bmL/WtSxaEnbAG31x
 5Z+thYYmgcJjXCEECKJgKwu0ANgY34U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-5SIE_yzgOjWaQ-hOR_WHPA-1; Wed, 09 Sep 2020 05:00:38 -0400
X-MC-Unique: 5SIE_yzgOjWaQ-hOR_WHPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57BEA801AEC;
 Wed,  9 Sep 2020 09:00:37 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E9F110013D0;
 Wed,  9 Sep 2020 09:00:31 +0000 (UTC)
Date: Wed, 9 Sep 2020 10:00:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH 1/5] hw/smbios: support loading OEM strings values from a
 file
Message-ID: <20200909090028.GK1011023@redhat.com>
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-2-berrange@redhat.com>
 <c7ecee55-64a3-5a46-26d9-6a1cc4c7889c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c7ecee55-64a3-5a46-26d9-6a1cc4c7889c@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:05:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JWGxIVK20NnR

On Wed, Sep 09, 2020 at 10:18:47AM +0200, Laszlo Ersek wrote:
> On 09/08/20 18:54, Daniel P. Berrangé wrote:
> > Some applications want to pass quite large values for the OEM strings
> > entries. Rather than having huge strings on the command line, it would
> > be better to load them from a file, as supported with -fw_cfg.
> > 
> > This introduces the "valuefile" parameter allowing for:
> > 
> >   $ echo -n "thisthing" > mydata.txt
> >   $ qemu-system-x86_64 \
> >     -smbios type=11,value=something \
> >     -smbios type=11,valuefile=mydata.txt \
> >     -smbios type=11,value=somemore \
> >     ...other args...
> > 
> > Now in the guest
> > 
> > $ dmidecide -t 11
> > Getting SMBIOS data from sysfs.
> > SMBIOS 2.8 present.
> > 
> > Handle 0x0E00, DMI type 11, 5 bytes
> > OEM Strings
> > 	String 1: something
> > 	String 2: thisthing
> > 	String 3: somemore
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/smbios/smbios.c | 72 +++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 59 insertions(+), 13 deletions(-)
> 
> (gearing up to test this / look into the edk2 problem, just one question
> in passing: could we / would we simplify this with g_file_get_contents()?)

Yes, but at the cost of loosing the ability to pass in a pre-opened
FD, which qemu_open allows for.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

