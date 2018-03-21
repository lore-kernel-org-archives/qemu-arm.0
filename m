Received: by 10.28.91.67 with SMTP id p64csp5196188wmb;
        Wed, 21 Mar 2018 08:25:23 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuot2KOXI3u0jdS14cYBe6PfAXjS8besh1tHciOznkEfECiLAVsBe9ZEr/2TjhslT6K9N6U
X-Received: by 10.129.47.15 with SMTP id v15mr11925087ywv.248.1521645923825;
        Wed, 21 Mar 2018 08:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521645923; cv=none;
        d=google.com; s=arc-20160816;
        b=z8gZSCk+ANmeund+n/MDTdq1IoUw98gpAK/4z6a//dMTzkPRc+do74+fwCp4NYMQuk
         iO1jicQFtGybFbCD+vSSPTjPaE+lVyK+VK5j72JFkCXjmJauPO00dx54l6PuBw8m7q/u
         nZpnKXVUGBqowNmg2rZ/Q4xzDbUJS8f7+PBqnQMJVo/Yvlz75+Ofa0vGvSoVVRdzb+ZK
         h7c3mFfMu78xmatP2dCYu/ymN74Gj7joTOROEJhpE9MBqNtNgjLQP2SKmjdFrzAIk84s
         P+FXlXrt9gojgvPUWGJWE5rlJNb+1WSmBlOt4e9/7DbpY/58Kbqm1XcUbDG/SpipOjC5
         Lcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=w+b9cdiXq8FbSDRDxuocCVZwyZu6c/GXe51tbJmSHW4=;
        b=hI7AKdovaY5BY41qf9XgJAh6oNtOAjJz2EjdYWusyXzBPEICmKm+dp+krzzIMyrB/o
         oVAen7ZLlMggqJxo+8vDCRHcSB+VoShB6Z3onBirJGl1nGmP7t8lWlLE0J0PsoVin15N
         XF6rXK+aFbXi4nYE+UEXSEisZzZKequYKAGF5wX7Fi4bSGo2eD9EYqQKiDAdnZRbK/5N
         EBYG9VtuiFPPtT1IpRSCz27GYwvUQQNlAO9Li5wlGMyFe5SQ7TxIBYKIqBzg3jKhmgQp
         SipV6pI6xkzrwvw8gnExsmJfIwAny6hgQsmjOUGhLD+XXzHNvaq66RrURdsrWAjcD7Wp
         4kqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c187si3097634qkd.100.2018.03.21.08.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyfcB-0002Fh-0D
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eyfal-0001FR-Qm
	for qemu-devel@nongnu.org; Wed, 21 Mar 2018 11:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eyfaj-0000TX-1G
	for qemu-devel@nongnu.org; Wed, 21 Mar 2018 11:23:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53326 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eyfaX-0007tc-BN; Wed, 21 Mar 2018 11:23:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1D20A27EC;
	Wed, 21 Mar 2018 15:23:39 +0000 (UTC)
Received: from [10.36.117.65] (ovpn-117-65.ams2.redhat.com [10.36.117.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BE4194580;
	Wed, 21 Mar 2018 15:23:06 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<3a819d04-b1d2-550e-7458-4ea7509db36d@redhat.com>
	<20180321170823-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e67f7f34-5b15-9939-df92-d081653a4683@redhat.com>
Date: Wed, 21 Mar 2018 16:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321170823-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 15:23:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 15:23:40 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2] qemu: replace "" with <> in headers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
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
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 13PP8gLloGgD

On 21/03/2018 16:11, Michael S. Tsirkin wrote:
>> Can you explain the changes in the source tree layout?
> include/qemu -> include/qemu/common
> include/* -> include/qemu/*

Ok, then perhaps "util" instead of common would match the source layout
more.

Paolo

> Thus one uses any qemu headers with
> 
> #include <qemu/....>

