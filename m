Received: by 10.25.0.23 with SMTP id 23csp2526003lfa;
        Thu, 8 Jun 2017 04:10:55 -0700 (PDT)
X-Received: by 10.233.232.202 with SMTP id a193mr1489904qkg.239.1496920255409;
        Thu, 08 Jun 2017 04:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496920255; cv=none;
        d=google.com; s=arc-20160816;
        b=VwOrD2MiTt+ym2TOd2amM+caCLgkANopII+yekbf1EowlB+g+4KXqSM7svVJOEEtGx
         VK5gb6WO+ryMSv+rjvaWHS1q/BMVhLN1QBPkzpJIDK6rsmqCO9q+SD9v6cHL1Zt7RxZY
         R46ao4dVVW5uiEuCNugcsFKEaYca9NakFyhNiH8eoK6A55m4xOptA8plKRhw+wqqkMlz
         gZRFWZWXNVdrCBYtjjFU6+htEPogIqmoKQT6rY3qBQuBiRXFKdJ1vviJdRHiGYepooIw
         BE4VIK/3vIcnQuvn6lbon9N9gPwBMb2jLNIjvZ5yptgGGwTctJRA0jICXER5vRPVOMwb
         0ibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=Kyw5xf9Cu6DmQTqU4iwQmEpbtRy77HZaiMbncvB32JQ=;
        b=pczq9yGXczHTMWqdO8tmZLBV0pSr/rVTVWTCd4QW3emLBg0XdQac96J0Cc2SaNBTY1
         wZtQ4btXY8kIknOmlTkKrAqNI+R8DM2EFYGk74qvfWz6NrX3K805lU4HoE7/HLuj+FLT
         qp2gb0Oyj+btSreqEZIHMZFjSIhfJQ6G8tvHrdSVtLp46bNnKLV3NFhm1cUXEHsvbcTw
         6u4b/1GiTUuiPxEnDpopFBK8xSGxkhUhH/RnyI002SeUeJaXJ8yRoIOFo6z9KgF0sHL5
         PtSMqVNcDpnXT+5SBK/Ej6GF0AzNwXKm2zGclte/OQnM/B3XkHHPONxJVGw69Tts63as
         QKWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m12si4921353qki.192.2017.06.08.04.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 04:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:48679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIvL2-000558-Eg
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 07:10:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dIvK7-0004YJ-Bg
	for qemu-devel@nongnu.org; Thu, 08 Jun 2017 07:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dIvK5-0002j6-5v
	for qemu-devel@nongnu.org; Thu, 08 Jun 2017 07:09:55 -0400
Received: from mail-eopbgr50074.outbound.protection.outlook.com
	([40.107.5.74]:51519
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dIvJy-0002i6-1U; Thu, 08 Jun 2017 07:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Kyw5xf9Cu6DmQTqU4iwQmEpbtRy77HZaiMbncvB32JQ=;
	b=xDPWXbLJE1tRpg/kbIy1SixHCUgruGw52K5uja4KZX8J4Px746sXYjpgV24XcBqjRlzuisNn9z1zkkmHeVFbsd0SIfX/4EZ/ZtNqex+ApvBxHn2qo7PN84EkUnu0FGETfj02/XjSwokr36dZolooWqvKFi8rtz94hnvX2hAWSHk=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Thu, 8 Jun 2017 11:09:35 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::393a:3139:3c46:5c52]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::393a:3139:3c46:5c52%18]) with mapi id 15.01.1124.013;
	Thu, 8 Jun 2017 11:09:36 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v2 3/8] virtio_iommu: add skeleton
Thread-Index: AQHS36dnjcQrMpKFiU+0TIXfhyEI76IazoeQ
Date: Thu, 8 Jun 2017 11:09:35 +0000
Message-ID: <AM5PR0401MB25454D8F945071D6AC96749D9AC90@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-4-git-send-email-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.43]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	7:LG0+C9RytDmgPFl80YSfkUgilf6ewrkGB7QjGl5FlJ+jHvlnTgpDe0tdv3bGWHYSnbqdDvjF1XTXRY87OO7PghP8pkegSVD/qPZj1WpW284z2im1mYXKi+ae+k1M7Cjm5tjrrzehsXy6ZeaugsClrovdCIaZq5yZM5gAmrcZtiX5ZmzNXCSQtidjxUWDFoSVUrp7b48sS0WBeRqGThM+2ZwY3n3jSaCP1VeN9AqvlwHEmaIwIo9zynIKMk8kEHzS8h04DAJWrLp0pyARP1E/edD81UVozSyJ9s6JJ1dzsQ+Ti/5qWsC5SNab4futW9c/53ghFJTCJqus1vfz7imDmg==
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-ms-office365-filtering-correlation-id: 8cd8ba26-ebed-4164-6af9-08d4ae5ed937
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:AM5PR0401MB2548; 
x-microsoft-antispam-prvs: <AM5PR0401MB25480D02444F58F2F1FD5E139AC90@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(250305191791016)(180628864354917)(22074186197030)(185117386973197)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123564025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39410400002)(39400400002)(39850400002)(39860400002)(39840400002)(377454003)(13464003)(7736002)(38730400002)(53546009)(25786009)(5890100001)(6246003)(2501003)(33656002)(5250100002)(5660300001)(39060400002)(3280700002)(6306002)(9686003)(3660700001)(66066001)(4326008)(7696004)(189998001)(74316002)(102836003)(3846002)(2906002)(305945005)(53936002)(6116002)(54906002)(99286003)(55016002)(478600001)(54356999)(76176999)(50986999)(14454004)(81166006)(86362001)(229853002)(2900100001)(8676002)(6436002)(7416002)(2201001)(8936002)(6506006)(2950100002)(2004002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2017 11:09:35.8810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.5.74
Subject: Re: [Qemu-devel] [RFC v2 3/8] virtio_iommu: add skeleton
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
Cc: "wei@redhat.com" <wei@redhat.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4BxdqPFfa0il



> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: Wednesday, June 07, 2017 9:31 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> philippe.brucker@arm.com
> Cc: will.deacon@arm.com; robin.murphy@arm.com; kevin.tian@intel.com;
> marc.zyngier@arm.com; christoffer.dall@linaro.org; drjones@redhat.com;
> wei@redhat.com; tn@semihalf.com; Bharat Bhushan
> <bharat.bhushan@nxp.com>
> Subject: [RFC v2 3/8] virtio_iommu: add skeleton
>=20
> This patchs adds the skeleton for the virtio-iommu device.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/Makefile.objs          |   1 +
>  hw/virtio/virtio-iommu.c         | 247
> +++++++++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-iommu.h |  60 ++++++++++
>  3 files changed, 308 insertions(+)
>  create mode 100644 hw/virtio/virtio-iommu.c
>  create mode 100644 include/hw/virtio/virtio-iommu.h
>=20
> diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
> index 765d363..8967a4a 100644
> --- a/hw/virtio/Makefile.objs
> +++ b/hw/virtio/Makefile.objs
> @@ -6,6 +6,7 @@ common-obj-y +=3D virtio-mmio.o
>=20
>  obj-y +=3D virtio.o virtio-balloon.o
>  obj-$(CONFIG_LINUX) +=3D vhost.o vhost-backend.o vhost-user.o
> +obj-$(CONFIG_LINUX) +=3D virtio-iommu.o
>  obj-$(CONFIG_VHOST_VSOCK) +=3D vhost-vsock.o
>  obj-y +=3D virtio-crypto.o
>  obj-$(CONFIG_VIRTIO_PCI) +=3D virtio-crypto-pci.o
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> new file mode 100644
> index 0000000..86129ef
> --- /dev/null
> +++ b/hw/virtio/virtio-iommu.c
> @@ -0,0 +1,247 @@
> +/*
> + * virtio-iommu device
> + *
> + * Copyright (c) 2017 Red Hat, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
> with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/iov.h"
> +#include "qemu-common.h"
> +#include "hw/virtio/virtio.h"
> +#include "sysemu/kvm.h"
> +#include "qapi-event.h"
> +#include "trace.h"
> +
> +#include "standard-headers/linux/virtio_ids.h"
> +#include <linux/virtio_iommu.h>
> +
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/virtio-access.h"
> +#include "hw/virtio/virtio-iommu.h"
> +
> +/* Max size */
> +#define VIOMMU_DEFAULT_QUEUE_SIZE 256
> +
> +static int virtio_iommu_handle_attach(VirtIOIOMMU *s,
> +                                      struct iovec *iov,
> +                                      unsigned int iov_cnt)
> +{
> +    return -ENOENT;
> +}
> +static int virtio_iommu_handle_detach(VirtIOIOMMU *s,
> +                                      struct iovec *iov,
> +                                      unsigned int iov_cnt)
> +{
> +    return -ENOENT;
> +}
> +static int virtio_iommu_handle_map(VirtIOIOMMU *s,
> +                                   struct iovec *iov,
> +                                   unsigned int iov_cnt)
> +{
> +    return -ENOENT;
> +}
> +static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
> +                                     struct iovec *iov,
> +                                     unsigned int iov_cnt)
> +{
> +    return -ENOENT;
> +}
> +
> +static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue
> *vq)
> +{
> +    VirtIOIOMMU *s =3D VIRTIO_IOMMU(vdev);
> +    VirtQueueElement *elem;
> +    struct virtio_iommu_req_head head;
> +    struct virtio_iommu_req_tail tail;
> +    unsigned int iov_cnt;
> +    struct iovec *iov;
> +    size_t sz;
> +
> +    for (;;) {
> +        elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
> +        if (!elem) {
> +            return;
> +        }
> +
> +        if (iov_size(elem->in_sg, elem->in_num) < sizeof(tail) ||
> +            iov_size(elem->out_sg, elem->out_num) < sizeof(head)) {
> +            virtio_error(vdev, "virtio-iommu erroneous head or tail");
> +            virtqueue_detach_element(vq, elem, 0);
> +            g_free(elem);
> +            break;
> +        }
> +
> +        iov_cnt =3D elem->out_num;
> +        iov =3D g_memdup(elem->out_sg, sizeof(struct iovec) * elem-
> >out_num);
> +        sz =3D iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
> +        if (sz !=3D sizeof(head)) {
> +            tail.status =3D VIRTIO_IOMMU_S_UNSUPP;
> +        }
> +        qemu_mutex_lock(&s->mutex);
> +        switch (head.type) {
> +        case VIRTIO_IOMMU_T_ATTACH:
> +            tail.status =3D virtio_iommu_handle_attach(s, iov, iov_cnt);
> +            break;
> +        case VIRTIO_IOMMU_T_DETACH:
> +            tail.status =3D virtio_iommu_handle_detach(s, iov, iov_cnt);
> +            break;
> +        case VIRTIO_IOMMU_T_MAP:
> +            tail.status =3D virtio_iommu_handle_map(s, iov, iov_cnt);
> +            break;
> +        case VIRTIO_IOMMU_T_UNMAP:
> +            tail.status =3D virtio_iommu_handle_unmap(s, iov, iov_cnt);
> +            break;
> +        default:
> +            tail.status =3D VIRTIO_IOMMU_S_UNSUPP;
> +        }
> +        qemu_mutex_unlock(&s->mutex);
> +
> +        sz =3D iov_from_buf(elem->in_sg, elem->in_num, 0,
> +                          &tail, sizeof(tail));
> +        assert(sz =3D=3D sizeof(tail));
> +
> +        virtqueue_push(vq, elem, sizeof(tail));
> +        virtio_notify(vdev, vq);
> +        g_free(elem);
> +    }
> +}
> +
> +static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t
> *config_data)
> +{
> +    VirtIOIOMMU *dev =3D VIRTIO_IOMMU(vdev);
> +
> +    memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config)=
);
> +}
> +
> +static void virtio_iommu_set_config(VirtIODevice *vdev,
> +                                      const uint8_t *config_data)
> +{
> +    VirtIOIOMMU *dev =3D VIRTIO_IOMMU(vdev);
> +    struct virtio_iommu_config config;
> +
> +    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
> +
> +    dev->config.page_sizes =3D le64_to_cpu(config.page_sizes);
> +    dev->config.input_range.end =3D le64_to_cpu(config.input_range.end);
> +}
> +
> +static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f=
,
> +                                            Error **errp)
> +{
> +    VirtIOIOMMU *dev =3D VIRTIO_IOMMU(vdev);
> +    f |=3D dev->host_features;
> +    virtio_add_feature(&f, VIRTIO_RING_F_EVENT_IDX);
> +    virtio_add_feature(&f, VIRTIO_RING_F_INDIRECT_DESC);
> +    virtio_add_feature(&f, VIRTIO_IOMMU_F_INPUT_RANGE);
> +    return f;
> +}
> +
> +static int virtio_iommu_post_load_device(void *opaque, int version_id)
> +{
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_virtio_iommu_device =3D {
> +    .name =3D "virtio-iommu-device",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .post_load =3D virtio_iommu_post_load_device,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
> +
> +    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> +                sizeof(struct virtio_iommu_config));
> +
> +    s->vq =3D virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
> +                             virtio_iommu_handle_command);
> +
> +    s->config.page_sizes =3D ~((1ULL << 12) - 1);

This is hardcoded to 4K, Should this be aligned to Host-page size ?

Thanks
-Bharat

> +    s->config.input_range.end =3D -1UL;
> +}
> +
> +static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp=
)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +
> +    virtio_cleanup(vdev);
> +}
> +
> +static void virtio_iommu_device_reset(VirtIODevice *vdev)
> +{
> +}
> +
> +static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
> +{
> +}
> +
> +static void virtio_iommu_instance_init(Object *obj)
> +{
> +}
> +
> +static const VMStateDescription vmstate_virtio_iommu =3D {
> +    .name =3D "virtio-iommu",
> +    .minimum_version_id =3D 1,
> +    .version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static Property virtio_iommu_properties[] =3D {
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void virtio_iommu_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> +
> +    dc->props =3D virtio_iommu_properties;
> +    dc->vmsd =3D &vmstate_virtio_iommu;
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    vdc->realize =3D virtio_iommu_device_realize;
> +    vdc->unrealize =3D virtio_iommu_device_unrealize;
> +    vdc->reset =3D virtio_iommu_device_reset;
> +    vdc->get_config =3D virtio_iommu_get_config;
> +    vdc->set_config =3D virtio_iommu_set_config;
> +    vdc->get_features =3D virtio_iommu_get_features;
> +    vdc->set_status =3D virtio_iommu_set_status;
> +    vdc->vmsd =3D &vmstate_virtio_iommu_device;
> +}
> +
> +static const TypeInfo virtio_iommu_info =3D {
> +    .name =3D TYPE_VIRTIO_IOMMU,
> +    .parent =3D TYPE_VIRTIO_DEVICE,
> +    .instance_size =3D sizeof(VirtIOIOMMU),
> +    .instance_init =3D virtio_iommu_instance_init,
> +    .class_init =3D virtio_iommu_class_init,
> +};
> +
> +static void virtio_register_types(void)
> +{
> +    type_register_static(&virtio_iommu_info);
> +}
> +
> +type_init(virtio_register_types)
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-
> iommu.h
> new file mode 100644
> index 0000000..2259413
> --- /dev/null
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -0,0 +1,60 @@
> +/*
> + * virtio-iommu device
> + *
> + * Copyright (c) 2017 Red Hat, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
> with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#ifndef QEMU_VIRTIO_IOMMU_H
> +#define QEMU_VIRTIO_IOMMU_H
> +
> +#include "standard-headers/linux/virtio_iommu.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/pci/pci.h"
> +
> +#define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
> +#define VIRTIO_IOMMU(obj) \
> +        OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
> +
> +#define IOMMU_PCI_BUS_MAX      256
> +#define IOMMU_PCI_DEVFN_MAX    256
> +
> +typedef struct IOMMUDevice {
> +    void         *viommu;
> +    PCIBus       *bus;
> +    int           devfn;
> +    MemoryRegion  iommu_mr;
> +    AddressSpace  as;
> +} IOMMUDevice;
> +
> +typedef struct IOMMUPciBus {
> +    PCIBus       *bus;
> +    IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically al=
loc
> */
> +} IOMMUPciBus;
> +
> +typedef struct VirtIOIOMMU {
> +    VirtIODevice parent_obj;
> +    VirtQueue *vq;
> +    struct virtio_iommu_config config;
> +    MemoryRegionIOMMUOps iommu_ops;
> +    uint32_t host_features;
> +    GHashTable *as_by_busptr;
> +    IOMMUPciBus *as_by_bus_num[IOMMU_PCI_BUS_MAX];
> +    GTree *address_spaces;
> +    QemuMutex mutex;
> +    GTree *devices;
> +} VirtIOIOMMU;
> +
> +#endif
> --
> 2.5.5

