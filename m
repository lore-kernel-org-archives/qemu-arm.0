Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1674902lfb;
        Fri, 3 Sep 2021 14:18:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjSfEtg6vKevjEIDZO4CZbEiauYfdWjqWFPN6qEI6/ZSn56ttn5U8fVkKGbrm94p66a/vi
X-Received: by 2002:a05:6402:6ce:: with SMTP id n14mr307950edy.194.1630703885579;
        Fri, 03 Sep 2021 14:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630703885; cv=none;
        d=google.com; s=arc-20160816;
        b=c4bK7BvgXlAjp7nGZacMxCJ4NhNsb+WMpQMAiHIompviopNgznDXVxHIHCWFJm7oAA
         tjAzm7bcK3FyAZAZJksFEh2PIxxF5Rp5Qm05r8+ENvYQnFHXaNUQ2Zq2zbNEPDR7QimT
         cZjpZsNKnaAGfdsXSrLliqNe3PWi4X/zqHeOibGJCMtAfSwrnTqqxge5kI9fcNHQTRCF
         Iiut8BknX0+SUruzCjXhH6MpdhIITXcxtz37fE78WxHfd3FpPV2CJPs8r6SneAlWCKw2
         zQeiH9fyjOYVbd0oCe4UjGkqt5c6J+UVnyHG12SXaXU+q+Gr6XeGNcnMIxIc2YvCyNbc
         USUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=elJ/GoBA2l/TdMnRel8eyxoKxpLIS9ed2bWbLlZY/xE=;
        b=mdpuuWSIE562V7uGfBRE73JswF5OOgS2LJlF9PbBIKsKzGwc/Hb+cswEjMm7VjCLfe
         Q8UErVCapOqQRNN2TworHZ63EU0dmt2yhrxWq3BfeU1hesMpdc+hCLcs9M8P++ecO/FS
         idPKDxyYhRG3zptPVJiAhmVwH38tgt1sN+jM7Srv1owD/o2tibHdJ2JSwywCDv9R5O+h
         9hFl4R/NVxZ0ofTgF3mvQQyaJN7tk7sdAz96wO+FQPFEE7FqCMCUuUOSNhX48AgeMlZF
         Kc/JhcUzjcaBmez+akdOsXVUwlKc7toS0BbTF8w9kBM8yfBvsKUQSoIhZjYmXzr65uiO
         PV7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cn5xCrSz;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n19si341723ejl.360.2021.09.03.14.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 14:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cn5xCrSz;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630703884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elJ/GoBA2l/TdMnRel8eyxoKxpLIS9ed2bWbLlZY/xE=;
	b=Cn5xCrSzycV/AAc6aDYvBULiYORKtviAlzMlBanGeRN8c9H0ikvisR8QijFlfNxacNTd/O
	bpEc6Z+aq/QGF/rHqnfXyWbnMnFydMqH+4/Dlf2/lEN7Zg1Aw9h+Z4HgpCqhzEM+z46Y32
	XSlNDOWqBHrjx0D+pIL1iRJT2yr8u5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-3Vmt1ZtkMI6GZHFbLPY6mA-1; Fri, 03 Sep 2021 17:18:03 -0400
X-MC-Unique: 3Vmt1ZtkMI6GZHFbLPY6mA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED9AE1883525;
	Fri,  3 Sep 2021 21:18:01 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 902A710023AE;
	Fri,  3 Sep 2021 21:17:48 +0000 (UTC)
Date: Fri, 3 Sep 2021 16:17:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
	qemu-ppc@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 28/28] checkpatch: Do not allow deprecated g_memdup()
Message-ID: <20210903211746.gkal52jcdvp4nz7i@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-29-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903174510.751630-29-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: tolPMysM7lTe

On Fri, Sep 03, 2021 at 07:45:10PM +0200, Philippe Mathieu-Daudé wrote:
> g_memdup() is insecure and as been deprecated in GLib 2.68.
> QEMU provides the safely equivalent g_memdup2() wrapper.
> 
> Do not allow more g_memdup() calls in the repository, provide
> a hint to use g_memdup2().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  scripts/checkpatch.pl | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
