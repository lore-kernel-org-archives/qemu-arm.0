Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2370555wrt;
        Fri, 23 Nov 2018 10:11:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5fzZrfwMWrw9CTf/3/FdoWCSOJWVC3nH374CeZV1pM1/QsNfFOR5xLufIWQD/g6fy8PPz3t
X-Received: by 2002:a81:b603:: with SMTP id u3mr17642771ywh.181.1542996682528;
        Fri, 23 Nov 2018 10:11:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542996682; cv=none;
        d=google.com; s=arc-20160816;
        b=y8l9DyscPlA0IFcKr1I3WWfXwE0R9B7CGpZnFwaH2gR9CE9OacMb4S+znOr66ZZaiF
         vTajnpydyx7iBOxg0jVXCd6rvCS3maZQuBA57Zgq/klN6bXE32449O9HfBOXliH9nr4G
         wwWyRFF5XdxgSTKeS8gb2fxyCIYwkL1f+UEGQu0vDfSGBX3fO8rOoi4L+xNos7nWi8ZP
         hJCBku7nk8rr0X8fAufqcil/eYJfjpkJ/bl6NyLHEOU0EJ3zwNzeSPMK0gbKPFd46BhQ
         IkmE6KaBqPFj7zLme294fjP7m1FVanFFEfONKV0C+tjRrHYpqbvj3twMFnlwqqC8L3kP
         VDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ZEndEZy6+C4c4VUJrJO5pzHWDWsrdJ7MdBRmsjS+1MA=;
        b=rdFF3zY5GSLExnJNVFjTMoMi6eAdvDy1cSUYrjit1b3ISYHD05L320PZ31UAkSxVHE
         OC/xnlXZjSufqQ9/xcN6gWL2F+7KMZJiKuWsEFS+0yxHBrZd3RgXVlwnyGQsFwiCCXoG
         hAzwt6E1bI9vpHvM84vsMOGbMMuHG2zTC4JWR38ZXBD0mPgz8yEZUI1gjXuWNdm1LPQC
         3NZ9At3sx+JFxxM3+x+NKKHwg9KIiXrjEIZi7hQptdKMIpMGQYY9No0JNhbtOTnl0bo0
         p+4Oy8gZhvB0Fj7294gqW7TfxIwBL0h7UG2GrZmGYF0HA/AlI4FkrY9F8u8D4DRzQCn8
         fpbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v14-v6si33189169ybe.121.2018.11.23.10.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 10:11:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQFvF-00067o-Sz
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 13:11:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gQFv2-00066l-OZ
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:11:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gQFuy-0000DP-QZ
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:11:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gQFuy-0000CH-Km; Fri, 23 Nov 2018 13:11:04 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBB976EB82;
	Fri, 23 Nov 2018 18:11:02 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98ACC614DB;
	Fri, 23 Nov 2018 18:11:01 +0000 (UTC)
Date: Fri, 23 Nov 2018 16:10:59 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181123181059.GN18284@habkost.net>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181123091729.29921-2-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 23 Nov 2018 18:11:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AMKZv3JPLN9Q

Hi,

Sorry for not reviewing this series earlier.  I just stumbled
upon this part of the code:

On Fri, Nov 23, 2018 at 10:17:14AM +0100, Luc Michel wrote:
> This commit adds the cpu-cluster type. It aims at gathering CPUs from
> the same cluster in a machine.
>=20
> For now it only has a `cluster-id` property.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
[...]
> +static void cpu_cluster_init(Object *obj)
> +{
> +    static uint32_t cluster_id_auto_increment;
> +    CPUClusterState *cluster =3D CPU_CLUSTER(obj);
> +
> +    cluster->cluster_id =3D cluster_id_auto_increment++;

I see that you implemented this after a suggestion from Philippe,
but I'm worried about this kind of side-effect on object/device
code.  I'm afraid this will bite us back in the future.  We were
bitten by problems caused by automatic cpu_index assignment on
CPU instance_init, and we took a while to fix that.

If you really want to do this and assign cluster_id
automatically, please do it on realize, where it won't have
unexpected side-effects after a simple `qom-list-properties` QMP
command.

I would also add a huge warning above the cluster_id field
declaration, mentioning that the field is not supposed to be used
for anything except debugging.  I think there's a large risk of
people trying to reuse the field incorrectly, just like cpu_index
was reused for multiple (conflicting) purposes in the past.


> +}
> +
> +static Property cpu_cluster_properties[] =3D {
> +    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
> +    DEFINE_PROP_END_OF_LIST()
> +};
[...]

--=20
Eduardo
