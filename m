Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp331590lfm;
        Wed, 8 Jul 2020 04:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyHOik9R/t7MUMNPL5he+zGZdww3sdq5/hlV5rXlirx0jwx5/PB8TsOkx6Gw/PMX9T8cvU
X-Received: by 2002:a05:6402:706:: with SMTP id w6mr64655185edx.326.1594208130127;
        Wed, 08 Jul 2020 04:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594208130; cv=none;
        d=google.com; s=arc-20160816;
        b=YOpWyiwHVZ+k2an63XKwtC4cOSNj3YDF7/5jdcttz+oPDJznDSthNmXg6e4Q0ufVv6
         WPjV+K5Bolv6ZN1h0oGYVXOAOIuwSEXOveygQOBYA0IgFnZvp2Aozm5tmQW67MeMnRMv
         JdAOrIShF/K2oYfKxVkJLQLyM0UsCfkXB7kQUGKKxZf4pMBkPpFPHF7WbOm5iVFybIBZ
         TCKxtOzhso1APGJ6UaHPBy0cfkcm9Zn2btu2UCOaMdn66rxCs/qdSX512VPba+aNdQLP
         XUq/cxU/EFvwVzhlci0K0ND8UR2lBMRW5MkFYA2cmMoCtW6bxpYkFpFkf5HMBaOO2dOK
         ICxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=8Z2Gh8iDn/pnjTwj/tk9pg091TYfdl6bfJD17+GLrn4=;
        b=lP7Ty+a6ejK2OZgkg0w1z+TefI3xLWZLO9Qp/GrbIS2T5jSl8FAY9XRSDYdfgu9Qg6
         LBoFSbR7NQEabM8ahNep6xTE7tp6LLZflFPJa7OzYeFb5NjCiOSKuLovhqVPDck/jiM9
         UTj9JcuV2sFZWLAI7iJ8EbJ8PFiJeYu/aD8qeKx9ecxB5dr71SbDKyYYjuBDHuDR4Jxl
         C8TevK8h84SV/HgvoY6JvskSVjeC8KJ85mUGmg6dQO0q+aweJUzr+HZg8tz8h3HX0fFH
         x0vlfcn5hR+Tk47OVIRreFBFuew09XWzTln7VOVlbqggfdyKVIACae4zL7tw8C8UWGw7
         E1ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dHJuignL;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id co28si16874686edb.540.2020.07.08.04.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dHJuignL;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594208129;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=8Z2Gh8iDn/pnjTwj/tk9pg091TYfdl6bfJD17+GLrn4=;
	b=dHJuignLl5ZniBm+XcqBC+pIsNGyfLAeAvoC5yjWwZB3gWuqP9TukyMg/06OA47AkC+T1F
	XnVCj2yeYSRPyu+my2FBSTaYhX4sqFnz3W4I2KvFGb5A9V5wp5wce1LKojNH0PoJZNWP7j
	xTS0HxeDP5IcVwsBsCAx2I2INpJ6unQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-wJIGFVQANCeLH0FuHYQ-RQ-1; Wed, 08 Jul 2020 07:35:16 -0400
X-MC-Unique: wJIGFVQANCeLH0FuHYQ-RQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD221940920;
	Wed,  8 Jul 2020 11:35:10 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8423660E1C;
	Wed,  8 Jul 2020 11:34:39 +0000 (UTC)
Date: Wed, 8 Jul 2020 12:34:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: dinechin@redhat.com, peter.maydell@linaro.org,
	dmitry.fleytman@gmail.com, mst@redhat.com, jasowang@redhat.com,
	mark.cave-ayland@ilande.co.uk, mdroth@linux.vnet.ibm.com,
	jcmvbkbc@gmail.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
	mreitz@redhat.com, marex@denx.de, sstabellini@kernel.org,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org, paul@xen.org,
	magnus.damm@gmail.com, armbru@redhat.com, hpoussin@reactos.org,
	anthony.perard@citrix.com, marcandre.lureau@redhat.com,
	rth@twiddle.net, atar4qemu@gmail.com, alistair@alistair23.me,
	ehabkost@redhat.com, mjt@tls.msk.ru, riku.voipio@iki.fi, pl@kamp.de,
	dgilbert@redhat.com, r.bolshakov@yadro.com, qemu-arm@nongnu.org,
	peter.chubb@nicta.com.au, ronniesahlberg@gmail.com,
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
	david@gibson.dropbear.id.au, kwolf@redhat.com,
	ysato@users.sourceforge.jp, philmd@redhat.com, crwulff@gmail.com,
	laurent@vivier.eu, jcd@tribudubois.net, qemu-ppc@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
Message-ID: <20200708113436.GG3229307@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200706162300.1084753-1-dinechin@redhat.com>
 <159405307662.7847.17757844911728214859@d1fd068a5071>
MIME-Version: 1.0
In-Reply-To: <159405307662.7847.17757844911728214859@d1fd068a5071>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: E8VJvSpDNut9

On Mon, Jul 06, 2020 at 09:31:21AM -0700, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200706162300.1084753-1-dinechin@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Subject: [PATCH] trivial: Remove trailing whitespaces
> Type: series
> Message-id: 20200706162300.1084753-1-dinechin@redhat.com
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20200706162300.1084753-1-dinechin@redhat.com -> patchew/20200706162300.1084753-1-dinechin@redhat.com
> Switched to a new branch 'test'
> 9af3e90 trivial: Remove trailing whitespaces
> 
> === OUTPUT BEGIN ===

snip

> ERROR: trailing whitespace
> #2395: FILE: target/sh4/op_helper.c:149:
> +^I$

One case of trailing whitespace missed.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
