Received: by 10.80.166.35 with SMTP id d32csp158634edc;
        Mon, 31 Oct 2016 07:06:08 -0700 (PDT)
X-Received: by 10.129.48.1 with SMTP id w1mr27478092yww.330.1477922767950;
        Mon, 31 Oct 2016 07:06:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si17692377qte.83.2016.10.31.07.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 07:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1DDz-0003mO-FF
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 10:06:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1c1DDp-0003lw-8O
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 10:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1c1DDo-0000Zi-5r
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 10:05:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51086)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1c1DDn-0000ZD-W1; Mon, 31 Oct 2016 10:05:56 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20C864E02B;
	Mon, 31 Oct 2016 14:05:55 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9VE5raq001097; Mon, 31 Oct 2016 10:05:53 -0400
Date: Mon, 31 Oct 2016 15:05:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20161031150552.0d0336ce@nial.brq.redhat.com>
In-Reply-To: <1477705687-31175-9-git-send-email-ehabkost@redhat.com>
References: <1477705687-31175-1-git-send-email-ehabkost@redhat.com>
	<1477705687-31175-9-git-send-email-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 31 Oct 2016 14:05:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 8/8] qdev: Warning about using
 qdev_property_add_static() in new code
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
	"Daniel P. Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oM38T2rcwJZs

On Fri, 28 Oct 2016 23:48:07 -0200
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The only remaining user of qdev_property_add_static() is
> arm_cpu_post_init(), but removing it may take some work. While we
> don't change it, warn people to not use the function in new code.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Changes series v1 -> v3:
> * (none)
> 
> Changes series v3 -> v4:
> * Rewrote commit message to refer to correct function name
> * s/qdev_class_set_props/device_class_set_props/ (function had
>   been renamed in series v3)
> ---
>  hw/core/qdev.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index e695fa8..ae772fc 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -812,6 +812,10 @@ static void qdev_property_set_to_default(DeviceState *dev, Property *prop,
>   * Add a static QOM property to @dev for qdev property @prop.
>   * On error, store error in @errp.  Static properties access data in a struct.
>   * The type of the QOM property is derived from prop->info.
> + *
> + * Do not use this in new code. Either use device_class_set_props(),
> + * or register regular QOM properties using object_property_add() or
> + * object_class_property_add().
>   */
>  void qdev_property_add_static(DeviceState *dev, Property *prop,
>                                Error **errp)

