Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1147675wrq;
        Fri, 13 Jul 2018 14:48:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf0nGNckjYlt18Lj1bGUOSyaNH4/j2npXIPlUJw/OzDKzSwlzE7S0XAimbYCYyXaeORwMqs
X-Received: by 2002:a37:a24f:: with SMTP id l76-v6mr6738181qke.406.1531518500708;
        Fri, 13 Jul 2018 14:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531518500; cv=none;
        d=google.com; s=arc-20160816;
        b=N0AxaH7GIEi8c3r55xd72SmLEQ+MCHf3LUA26FK5S4DtqZ9dgpWlfl4qhPOij6OgnZ
         noJMnszaCLAdqczE+iuAPT2M1Yoz5SrlYk7V2h3UnmswJE8nWu5wUCDjF0KxQL6a6A3K
         KxAWTSZUlVXCfNK0ImLeJQRB5jGpBglwWWFYQ9Po7XRZrmY8Xj04RIsAbS4RXgBETqXD
         wfVt0r0floeeXRR96AbSDG8c9J0Z+o6qEo5OHGwL9keyr3H2xwdTeEIhG94+qFuAKZwA
         ACs64lbayMuer5MBwxu5xLnKHa6SwWSaDrQ5jgp6mZP6HdxXIKl/n8OtwF5sOVGaEsT8
         gUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=b2W/+vmFvsL5EXBmls93mOdna1fMwDhRCTXs8I/PMvA=;
        b=jvWcvTYucy+68KNz/EkvnA6yqym7E9jesiV8aPl2TQ/eiLs508s3lLbfuW0gf5uRCH
         vtNVey3bN0ljyQfo6a4UsajqOUGxkoYy7Vgc6/f1i25d+ICo9rNsCz1T+URKMT98tvs5
         B6FWrnheiEjSbMyGLMMPOp03ez4j5i7H1L1D4VK0wS+OF98C5ER9K9DGd7lZmatqeunx
         iFP1+y69PULHzWs4QvpSMv0nTqXQsBa8RCxuM0elhN8fMTEsiAUCovjXEkLwixDb4D+M
         P3ac8+ojvqo5JGfi0qUZa6vesTFruuFXYg8s8u631IJVpUynpTHJeYgcxl6FAyZ2ND4j
         4PzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v72-v6si5368882qka.308.2018.07.13.14.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe5vI-0003U9-6H
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:48:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5v5-0003Sz-4k
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5v2-0006K8-2t
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:48:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49796)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe5v1-0006Jd-Rz; Fri, 13 Jul 2018 17:48:03 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BA064E8BF;
	Fri, 13 Jul 2018 21:48:03 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B40330012C2;
	Fri, 13 Jul 2018 21:48:02 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:48:01 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713214801.GX31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-6-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-6-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 13 Jul 2018 21:48:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 05/16] hw/cpu/a15mpcore: Fix introspection
 problem with the a15mpcore_priv device
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
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cGbJgNIPU7ah

On Fri, Jul 13, 2018 at 10:27:33AM +0200, Thomas Huth wrote:
> There is a memory management problem when introspecting the a15mpcore_priv
> device. It can be seen with valgrind when running QEMU like this:
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'a15mpcore_priv'}}"\
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}"  | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> {"return": [{"name": "num-cpu", "type": "uint32"}, {"name": "num-irq",
>  "type": "uint32"}, {"name": "a15mp-priv-container[0]", "type":
>   "child<qemu:memory-region>"}]}
> ==24978== Invalid read of size 8
> ==24978==    at 0x618EBA: qdev_print (qdev-monitor.c:686)
> ==24978==    by 0x618EBA: qbus_print (qdev-monitor.c:719)
> [...]
> 
> Use the new sysbus_init_child_obj() function to make sure that we get
> the reference counting of the child objects right.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/cpu/a15mpcore.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index bc05152..43c1079 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -35,15 +35,13 @@ static void a15mp_priv_initfn(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      A15MPPrivState *s = A15MPCORE_PRIV(obj);
> -    DeviceState *gicdev;
>  
>      memory_region_init(&s->container, obj, "a15mp-priv-container", 0x8000);
>      sysbus_init_mmio(sbd, &s->container);
>  
> -    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
> -    gicdev = DEVICE(&s->gic);
> -    qdev_set_parent_bus(gicdev, sysbus_get_default());
> -    qdev_prop_set_uint32(gicdev, "revision", 2);
> +    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> +                          gic_class_name());
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);

I assume qdev_set_parent_bus() won't trigger any code that looks
at "revision", so the prop_set/set_parent_bus ordering change
won't matter.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
