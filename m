Received: by 10.28.71.155 with SMTP id m27csp755545wmi;
        Thu, 22 Mar 2018 12:43:19 -0700 (PDT)
X-Google-Smtp-Source: AG47ELselSu15lXCNaKwtw1h8BDnTP8LYnlwKeM8PJEAbl9hMSlG0Zv9N6oCpplBd23GloriBVGm
X-Received: by 10.237.55.135 with SMTP id j7mr16241684qtb.213.1521747799358;
        Thu, 22 Mar 2018 12:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521747799; cv=none;
        d=google.com; s=arc-20160816;
        b=eRp7K7lzm236AOX6QWt1fTGzoubdK1FhWDo3yBwZvciTrFROYfuZ6c3qoKRIUGYvZR
         iJDUwiRPmVIJZaV8IkIX96zd2cwMnqa0j7pzJtU9Mz2kyJ+h+EL3d1ve1JuPoFCBI1xe
         si+K06i6vnupmO+ojHBhAAZiUPx6A5YwXHB2jIAj0EqyPbRsyaLszZ8aCICws5rAnC+q
         Tv+3NVrGjYqAMCtQmjg7NSnZQrzIIdS6UmIucJutULx5o4r7wY9dbH48XBDF7N1ACOnw
         GinpFsg9y6aTd685CqV6I2LLunm4duEbhktSn0dWxmDCz5c6i5Pg1y2noTCG69q6m3TQ
         fJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=h7lH4aJbE/Km5ZZ2sPYLvxoUvr9XlZQSUO7LrDoHlNQ=;
        b=O3wVLEdl/Y1s9eQ2MLZz1FP58jDhfZ6DB3pTHAWgfIW9pml+oQMm19FL6cIGetT9XO
         1qeKWvVzEL8qzzNOHhIE+EHihSo1CMDKhFRS/kZl/LENv33k1/uc/SBPbOy6432xWl9Y
         abppASIUtclTHFKtS3MPWFzFmwo9riEtJ+lMZjOz6gekKrSJmfs3eGmcd4YQ2IsM3iLV
         yOT56jvasWvwg5W4YevY3Yrx4QUdcCKg+KRnuzjSq8w5kZyN8zFtt/gXdn3oS5Ur0fd4
         +i9686gVpKKILAfnkbzzBqJsEK3hqzuylZt1l+8cELowvHtNdyyNe0GKDqK387tHk+8w
         fzuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si4881682qke.348.2018.03.22.12.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 12:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez67K-0007dL-Sk
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 15:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez67D-0007d8-M3
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez679-0008RW-PA
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:43:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57268 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez679-0008Qv-Ky; Thu, 22 Mar 2018 15:43:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 509E2722D0;
	Thu, 22 Mar 2018 19:43:06 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2556A2023230;
	Thu, 22 Mar 2018 19:42:56 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e149388d-eb17-ffd3-b54c-cbdf6a309882@redhat.com>
Date: Thu, 22 Mar 2018 14:42:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521746188-496856-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 19:43:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 19:43:06 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 1/2] make: move generated headers to
 qemu-build/
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RNBp3OvGlqWM

On 03/22/2018 02:27 PM, Michael S. Tsirkin wrote:
> Make sure all generated files go into qemu-build subdirectory.
> We can then include them like this:
>   #include "qemu-build/trace.h"
> 
> This serves two purposes:
> - make it easy to detect which files are in the source
>    directory (a bit more work for writers, easier for readers)
> - reduce chances of conflicts with possible stale files in source
>    directory (which could be left over from e.g. old patches, etc)
> 
> This patch needs to be merged with patch 2  of series updating all
> files: sending it separately to avoid spamming the list.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---

> +++ b/Makefile
> @@ -89,102 +89,102 @@ endif
>   
>   include $(SRC_PATH)/rules.mak
>   
> -GENERATED_FILES = qemu-version.h config-host.h qemu-options.def
> -GENERATED_FILES += qapi/qapi-builtin-types.h qapi/qapi-builtin-types.c

Uggh - I really need to follow up on my threat to make smarter use of 
make variables and string manipulation to cut down on the boilerplate 
involved here.  Sadly, I'm not convinced that doing so is a 2.12 bugfix 
priority, so it isn't at the top of my work queue.

Overall, the patch is an interesting idea.  I'm still not 100% sold on 
it (as you say, it's now slightly more work for writers), but I'm not 
coming up with any solid reasons why it should not be applied (at least, 
for 2.13 - doing it during freeze for 2.12 is a bit harder to justify).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
