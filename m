Received: by 10.223.172.38 with SMTP id v35csp2772181wrc;
        Thu, 21 Sep 2017 23:52:43 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBlAER0+ZUX6waiDCsr/omYpIpwlzoU5/6R2qBeCjC0pvrmnbZcabtf2H/CtmQj82cJJ5LQ
X-Received: by 10.200.9.66 with SMTP id z2mr6889394qth.254.1506063163132;
        Thu, 21 Sep 2017 23:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506063163; cv=none;
        d=google.com; s=arc-20160816;
        b=FwLXkv/buPBMJ9X/vF3prVnxgAJY8egX7JU1o2JhljncI7GdNyUhPFunsXsMDiOEuR
         daab6WRCnRIJHSDkLB+o554URe+Zb8tjPVNTsXZSCUD1qKslrqoz68dPcMeu+fKNVH/h
         Kp38KTDdiFopD8xT1dsHLwg3XemCSM2P1kmBlrMsMyslPXWfuLt0KEXyzv/4DmarRIQ8
         tgtuh1xBz+hrXHRAuQHUB7C30kfxtRXN601IiyCYCtn4qqaKdB3pPOQS5EiYGp74CW5k
         liR0mHLwbSRDscIWX+SI2C2i40lNUH8sLkkGRSfVv0gOuiOtw9oFaZN0Omq6jhT4TohC
         tRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=TcqWwvyVpIkF7B0Ywik4aBRzcXxru9d3IKM54Q3XvFA=;
        b=Xt/PwsuZP/9kxMePwuanXsilGwGlUPb6lXnmFb156cnnkd5imJN4ZPUZWYMqPyp4Sr
         htHTRt8HbQjnAjnNNB044I6B5wcRcIniFK3mgccHVjx4nJZoPlcd1bZPtbeh07c1NG85
         LUQcLqSGXj6MWkpyQJ6//XxCnHaSnJGItTbS+5hcqCLeqWh/u5QxlSkhkSxqTq22jRX7
         VflRs/9hz1X8UXuAIK50dW2MxG/ceq7DaYMiSUTpvirq94lVQvgcrtZQJ/hcHoJeLoiw
         9QRdWyMfIGMzFJtNdLlsDe0O07eoHhvdncTJbnF3TADRYao/Ex1uogZNC1hSp6oUq3+S
         I5TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=kNHz30gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si708069qtn.534.2017.09.21.23.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Sep 2017 23:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=kNHz30gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:56961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvHpH-0004gd-Vt
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 02:52:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dvHp5-0004fK-1r
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 02:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dvHp0-0000CH-PF
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 02:52:27 -0400
Received: from mail-he1eur01on0052.outbound.protection.outlook.com
	([104.47.0.52]:63616
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dvHp0-0000AR-6J; Fri, 22 Sep 2017 02:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TcqWwvyVpIkF7B0Ywik4aBRzcXxru9d3IKM54Q3XvFA=;
	b=kNHz30gdPezrSPWtA318m77lTXBRRfd2VmVvGRsp6HJMUmKYkiyCO1eVAdyGKkkyB9IyD1+NscpjYXF+5fGAgu86/rXyAmr43k/eVBQywaqEKkscpAvFVT7RU/Po0wuoGTburN31XKP+LeqRD1kDhzKPyY176M3f3Supms4xg7g=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Fri, 22 Sep 2017 06:52:18 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.011;
	Fri, 22 Sep 2017 06:52:18 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v4 09/16] virtio-iommu: Implement translate
Thread-Index: AQHTMRvAI7uJ8TEjsU68XPILEWpGzaLAfCXA
Date: Fri, 22 Sep 2017 06:52:18 +0000
Message-ID: <AM5PR0401MB254525F47824ADD5A73EF2DB9A670@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<1505807208-9063-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-10-git-send-email-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2545;
	6:lkSDAk+F0loO/SEIZgXenBr1OUyUsvXR2Cpz6lqG/m5JEni2nBwnwvAU0NlRSMQtreynXy2OjT4nA0xXmXIzmflxxrfAdRQTCBhSdrh4W2ZFD82nN/Ktql4bOtv61pZemOsMg9d+meeKxI+Q5i90y/ini7Ktrvv269tTJ9+2WjFcIZowreX3E/OOMcx+EkY5baDRPus8E0qowrxJHbuQFzhvSKcmd7nOiZqCtBJeMBL4Py96PY49YGNTR4LfMV80/3S0VlSVx/J/U5yttQISmCjGv1cU9J0KweIYqRie+0jJbAkiDtQ+wBwJKRPRu0q5Dl9BkqbRrNIKlhsWOCpJQg==;
	5:pjH3ljyJ1YukVnRvFDBY7tF5aZ6G639v0CUwPaWOfaqjDCgjpJDCMavDjAEPLLNPn/x8FpENWUQS5XEq/vFX2fXgyBqw2No36KFBz2/Z0WTPHbFASW6vq1VKyp+EaP59nH+QcOgIxeVCjbcG6xscQA==;
	24:yZkQU2k7olvrOYNMCxSi6LxlDW1BAtZLId6s9W2ZTjasJbesyiGLOq5w17Z4l1Pw/UEaJ5KS3kCDsxLItFKPj7tKJ+zwNGeENCHr/RyHba8=;
	7:pPlHoFZgdw6JrpSnEnDPhql1mfEJ2LXgFqArM+M05rdGXUGsSZKz5YJ/YBaCXfwgYOpgMGOgGdFChu7w252LdEImLcsoJicVCnjNaUZiMPYfyCTG1lmbyf8lXdQcHdIOAj7mFZcRx0r0N+pSjqK8siLprsCVAXla1ZWEF0erUkTHRRDdNcN42bJ4KE2axC+WeOP+K+lZ0D4z1bP9ydLnTrOq4/fWfhAZvljwPU6oAwY=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 98d820a8-2428-460c-112d-08d5018677b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2545; 
x-ms-traffictypediagnostic: AM5PR0401MB2545:
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-microsoft-antispam-prvs: <AM5PR0401MB254527C22CCBE506537987699A670@AM5PR0401MB2545.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2545; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2545; 
x-forefront-prvs: 0438F90F17
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(189002)(199003)(13464003)(377454003)(7736002)(50986999)(5660300001)(6436002)(14454004)(68736007)(39060400002)(2950100002)(6506006)(5890100001)(5250100002)(74316002)(25786009)(316002)(101416001)(2900100001)(2201001)(76176999)(2906002)(189998001)(54356999)(7696004)(110136005)(2501003)(305945005)(54906003)(229853002)(33656002)(106356001)(3846002)(7416002)(53936002)(6246003)(66066001)(3660700001)(102836003)(4326008)(8676002)(6116002)(81166006)(53546010)(86362001)(97736004)(99286003)(478600001)(3280700002)(105586002)(55016002)(8936002)(9686003)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2545;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2017 06:52:18.7562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.52
Subject: Re: [Qemu-arm] [RFC v4 09/16] virtio-iommu: Implement translate
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CAaY0VoCS/jO



> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: Tuesday, September 19, 2017 1:17 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> philippe.brucker@arm.com
> Cc: will.deacon@arm.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> christoffer.dall@linaro.org; drjones@redhat.com; wei@redhat.com;
> tn@semihalf.com; Bharat Bhushan <bharat.bhushan@nxp.com>;
> peterx@redhat.com; linuc.decode@gmail.com
> Subject: [RFC v4 09/16] virtio-iommu: Implement translate
>=20
> This patch implements the translate callback
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/trace-events   |  1 +
>  hw/virtio/virtio-iommu.c | 39
> +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events index
> da298c1..9010fbd 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -45,3 +45,4 @@ virtio_iommu_put_as(uint32_t asid) "Free asid=3D%d"
>  virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t
> next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"],
> new interval=3D[0x%"PRIx64",0x%"PRIx64"]"
>  virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t
> next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"],
> new interval=3D[0x%"PRIx64",0x%"PRIx64"]"
>  virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc
> [0x%"PRIx64",0x%"PRIx64"]"
> +virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr,
> uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
> 6f1a7d1..db46a91 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -496,19 +496,54 @@ static IOMMUTLBEntry
> virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                                              IOMMUAccessFlags flag)  {
>      IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
> +    VirtIOIOMMU *s =3D sdev->viommu;
>      uint32_t sid;
> +    viommu_dev *dev;
> +    viommu_mapping *mapping;
> +    viommu_interval interval;
> +
> +    interval.low =3D addr;
> +    interval.high =3D addr + 1;
>=20
>      IOMMUTLBEntry entry =3D {
>          .target_as =3D &address_space_memory,
>          .iova =3D addr,
>          .translated_addr =3D addr,
> -        .addr_mask =3D ~(hwaddr)0,
> -        .perm =3D IOMMU_NONE,
> +        .addr_mask =3D (1 << ctz32(s->config.page_size_mask)) - 1,
> +        .perm =3D flag,
>      };
>=20
>      sid =3D virtio_iommu_get_sid(sdev);
>=20
>      trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
> +    qemu_mutex_lock(&s->mutex);
> +
> +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
> +    if (!dev) {
> +        /* device cannot be attached to another as */
> +        printf("%s sid=3D%d is not known!!\n", __func__, sid);
> +        goto unlock;
> +    }
> +
> +    mapping =3D g_tree_lookup(dev->as->mappings, (gpointer)(&interval));

Should check of !dev->as before accessing this.

Thanks
-Bharat=20

> +    if (!mapping) {
> +        printf("%s no mapping for 0x%"PRIx64" for sid=3D%d\n", __func__,
> +               addr, sid);
> +        goto unlock;
> +    }
> +
> +    if (((flag & IOMMU_RO) && !(mapping->flags &
> VIRTIO_IOMMU_MAP_F_READ)) ||
> +        ((flag & IOMMU_WO) && !(mapping->flags &
> VIRTIO_IOMMU_MAP_F_WRITE))) {
> +        error_report("Permission error on 0x%"PRIx64"(%d): allowed=3D%d"=
,
> +                     addr, flag, mapping->flags);
> +        entry.perm =3D IOMMU_NONE;
> +        goto unlock;
> +    }
> +    entry.translated_addr =3D addr - mapping->virt_addr + mapping-
> >phys_addr,
> +    trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
> +
> +unlock:
> +    qemu_mutex_unlock(&s->mutex);
>      return entry;
>  }
>=20
> --
> 2.5.5

