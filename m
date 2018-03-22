Received: by 10.28.71.155 with SMTP id m27csp803648wmi;
        Thu, 22 Mar 2018 13:35:03 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs1yMgHi8a8InSuP0RAi++5/aXAVOjVpgPgF6COZTllBc+SAFIxWKjCPVEGAXT1VD+89aAN
X-Received: by 10.237.36.238 with SMTP id u43mr36072787qtc.116.1521750903115;
        Thu, 22 Mar 2018 13:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521750903; cv=none;
        d=google.com; s=arc-20160816;
        b=jjwV1O7VuX9QvT0sy2HYSqGlBC2hHDAkRK4+yaTIk3gww9keixK9eOiD557bV1gxHp
         WOz2UiAwLsVcKxXAcc+anFefCYDSjTX6dCdrwZgWqDuYFRbGT45L+PJUeSCWe6T87eOJ
         kDHU5ox99umfPhACknxyONHe6/1B8g3sV1lQmyd5wncwQw339Lto6Se95lQ/6R3qoFZR
         xMYNcShUxM1ZwHl9n3NceHazvdhsAVYJybbYEYknGnQqg4l1hpubgsXDFa/Ta4tuaa7o
         DzV+tMgO4D0TykYCFbiJsnNLyphBYjxNeIKQvNORBkdiym0k6xC4ViNuHmmRSgOIGY/H
         4c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Yt66mWi8w5mVnL5SFzGD+cq/Hx7CWMSXlZfzNnVSB4E=;
        b=0ezhE/rT72/6n8h4fHQ4vMKio2CwfiG+3XLYieILzWLbI3UikuPWJ2IMtcftykim+I
         lApmNK++84TpB01Ju5oL+d13RSccXNGgcEjBCpEr4RTRXKKrcKfmEQh0xgwk2k1A0J1F
         1ObsqxA6obZJrXyshx7pAuVY1BSTZHJTKUkJWwwoIqijkKC6z67D0oh9b/YAm2og8CLx
         dHusi0gAXGKfUunCex3oNjBBUOYvux9WVsQ5fMvHmx0sza8CYmGaXQWDS2pqhOL0MSS0
         /HUglyOpfH99g3C3BjPn4rPEIrtQOh6YBtPK4eICJPiVM01Pqo+XUjPr/QGAEJFfqbqQ
         z/gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g38si3015022qtf.128.2018.03.22.13.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 13:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez6vO-0008JE-LS
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 16:35:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ez6uz-0008Ha-JD
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 16:34:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ez6uy-0004nV-I7
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 16:34:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54054 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1ez6ur-0004lh-LK; Thu, 22 Mar 2018 16:34:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 501F5406805D;
	Thu, 22 Mar 2018 20:34:18 +0000 (UTC)
Received: from [10.36.116.71] (ovpn-116-71.ams2.redhat.com [10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71595D7E16;
	Thu, 22 Mar 2018 20:33:30 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<20180321153439.GC3898@localhost.localdomain>
	<20180321175452-mutt-send-email-mst@kernel.org>
	<20180321162203.GE3898@localhost.localdomain>
	<20180322211902-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aba29cf7-637a-c967-9b2f-59060a1c1330@redhat.com>
Date: Thu, 22 Mar 2018 21:33:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322211902-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 20:34:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 20:34:18 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
	John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
	qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
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
X-TUID: 8BxcB2Tno2w6

On 22/03/2018 20:29, Michael S. Tsirkin wrote:
> On Wed, Mar 21, 2018 at 05:22:03PM +0100, Kevin Wolf wrote:
>>> It's all still very much a non-standard convention and so less robust
>>> than prefixing file name with a project-specifix prefix.
>> I've always had the impression that it's by far the most common
>> convention, to the point that I'd blindly assume it when joining a new
>> project.
>=20
> Any examples?

GCC - https://github.com/gcc-mirror/gcc/blob/master/gcc/reload.c
Libvirt - https://github.com/libvirt/libvirt/blob/master/src/util/virproc=
ess.c
SDL - https://github.com/SDL-mirror/SDL/blob/master/src/core/unix/SDL_pol=
l.c

Anything but Linux really.

I find <qemu/foo/bar.h> verbose and unnecessary.  The only advantage
of your proposal is that files included from the source directory would b=
e
clearly noticeable.  That said, it's easy to add a checkpatch.pl rule tha=
t
detects when ".../..." is used on a file not under include/.

Paolo
