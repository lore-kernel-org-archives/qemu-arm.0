Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp569255nji;
        Thu, 12 Sep 2024 08:38:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbwumtT9n/WG/JmHBp7Mg7UwhaTQdKsG+GPdG/w1szeGztFSH5KODrj3ag6/HGY8e8z99p2PD7c1IguA==@linaro.org
X-Google-Smtp-Source: AGHT+IFCWRvtyH+zfmgAg//bOpal4H8Xwr3862+aKyZmsP4pDdcwLEGwhHcbPRafcdrzI8d7UR28
X-Received: by 2002:a05:6902:1a48:b0:e1a:8fce:84fd with SMTP id 3f1490d57ef6-e1d9dc5bdbbmr2885221276.51.1726155498184;
        Thu, 12 Sep 2024 08:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726155498; cv=none;
        d=google.com; s=arc-20240605;
        b=NDTWWfR+UtINf7m5KzsSG/qqt5QStFD057x+tt++Y5ZMh6ZZ6V+W4D/kfRXagw1HE7
         dzNNpkbdgswbh/vamVZsI9TD1Da2swjfV9iLz709+StSWCEhz/5Gh3CHInWesFyuh0v6
         7rcGpf8f5TFZM3RuCz5YzZJLtloT8VhDQ7QXVm38yCFdJhFEznSow7PIHPQPGIdFzGqd
         lLR3ErbzY+DC3fLqkXPKkZtifMVysnV4t3lpTGOk5vgCmzBA6kq58joGA7UN6GgCwhp/
         NuLPcJlnp1w3tB3sOnlSR0Lay7SO1e8nZ0xfYxM6hcK1oNiMVecpLx+3PByPej1zxHSm
         2vhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=yG3RwRKYVV8o+TWmN0BvykfATMUgxIORVXcyp78ULHU=;
        fh=TdOwjSSVRep5+xG4Pf5iIiMtZ0vZqH8UoLYmOexkeiE=;
        b=Um76+gbDJhitZ/MdvXOt0WY2bKfPXRkTYaOSlANqw7UR7Io4TLdahZxzgB7RNWfKNI
         hvdetPKxuAZ2/0YZOoxJBTnjy5hRxGAV6MAiaJgc9/uX9o+5z0dNZ6Quk6dGu2T/GdoY
         /TMtxJMKUnHqM5+IM9cAA6v78K3QvXy7IptwIfOtzTLTedKRgS/v1S1uBQ9kPXg/lHyD
         uV7czdwRhwTmVMtcmAvGlywKBsY/Uajd8I+YUgPWQb2PImADrxzP7MnccPK+88gHe0GF
         H40FrKVW1+apu1VREsW3AVIIxvDmfiFqEucraRmDW63KZqWvgRzonynQ6bgnofNtybwB
         45yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=boSi4JFV;
       spf=pass (google.com: domain of farman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=farman@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <farman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e1d7bbc4605si3752720276.471.2024.09.12.08.38.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2024 08:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of farman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=boSi4JFV;
       spf=pass (google.com: domain of farman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=farman@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CCfff7014165;
	Thu, 12 Sep 2024 15:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	yG3RwRKYVV8o+TWmN0BvykfATMUgxIORVXcyp78ULHU=; b=boSi4JFV1d47E4xh
	xRPzoW7LqT9Wk2q+KSaAjBau67C9tUf8fWWa6Oa57/hXkY2dgj0e0KnXzU/Ni/ox
	aGMYqXX3ZE1B9d2nxq2jh8CLo982z4ha+lcCja5E4FvMG1n9ZQyLCxuxyIgAMQ3z
	aa2Rg5bSFhUA2UMwP7LhwWq5YKlK1q9bWqp+h71jnOuO37vuVLKjMq/2u7+oKmoq
	ZsGwuzdPlTvl8GMmjAnCgZIBWtQ1MSS9AuDwW0jNXyF/Impd9iuKxHAEQcNkMfqo
	YjV2sRLPiARVxUntZLQ9wpEXkoj4Ts8kI/c6jXhBuJai0o24IGIkSrzgPdgXwcVt
	ajd+Ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gd8kvcb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 15:36:01 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48CFa0EV030118;
	Thu, 12 Sep 2024 15:36:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gd8kvcas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 15:36:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48CFWH2d010757;
	Thu, 12 Sep 2024 15:35:59 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41kmb6vdym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 15:35:59 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48CFZwdH55509414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 15:35:58 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0545258043;
	Thu, 12 Sep 2024 15:35:58 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6447858055;
	Thu, 12 Sep 2024 15:35:54 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.61.112.103])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Sep 2024 15:35:54 +0000 (GMT)
Message-ID: <8d93598ebe29a8216e89c54b6a438d9fda67a118.camel@linux.ibm.com>
Subject: Re: [PATCH v2 14/48] include/hw/s390x: replace assert(false) with
 g_assert_not_reached()
From: Eric Farman <farman@linux.ibm.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>,
        Laurent Vivier <lvivier@redhat.com>,
        Marcelo
 Tosatti <mtosatti@redhat.com>,
        Nicholas Piggin <npiggin@gmail.com>, Klaus
 Jensen <its@irrelevant.dk>,
        WANG Xuerui <git@xen0n.name>, Halil Pasic
 <pasic@linux.ibm.com>,
        Rob Herring <robh@kernel.org>, Michael Rolnik
 <mrolnik@gmail.com>,
        Zhao Liu <zhao1.liu@intel.com>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        Fabiano Rosas <farosas@suse.de>, Corey
 Minyard <minyard@acm.org>,
        Keith Busch <kbusch@kernel.org>, Thomas Huth
 <thuth@redhat.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Jesper Devantier <foss@defmacro.it>,
        Hyman Huang <yong.huang@smartx.com>,
        Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
        Laurent Vivier
 <laurent@vivier.eu>, qemu-riscv@nongnu.org,
        "Richard W.M. Jones"
 <rjones@redhat.com>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Aurelien
 Jarno <aurelien@aurel32.net>,
        "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
 <berrange@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Akihiko Odaki <akihiko.odaki@daynix.com>,
        Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,
        Hanna Reitz <hreitz@redhat.com>, Ani Sinha
 <anisinha@redhat.com>,
        qemu-ppc@nongnu.org,
        =?ISO-8859-1?Q?Marc-Andr=E9?=
 Lureau <marcandre.lureau@redhat.com>,
        Alistair Francis
 <alistair.francis@wdc.com>,
        Bin Meng <bmeng.cn@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>,
        Helge Deller <deller@gmx.de>, Peter Xu
 <peterx@redhat.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Dmitry Fleytman <dmitry.fleytman@gmail.com>,
        Nina Schoetterl-Glausch
 <nsg@linux.ibm.com>,
        Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
        Igor Mammedov <imammedo@redhat.com>,
        Jean-Christophe
 Dubois <jcd@tribudubois.net>,
        Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,
        qemu-block@nongnu.org, Stefan Berger
 <stefanb@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>, Eduardo
 Habkost <eduardo@habkost.net>,
        David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>,
        Weiwei Li <liwei1518@gmail.com>,
        Markus
 Armbruster <armbru@redhat.com>
Date: Thu, 12 Sep 2024 11:35:53 -0400
In-Reply-To: <20240912073921.453203-15-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
	 <20240912073921.453203-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r9TPNGqGpx0_YhQSRS1-lT9seE_YIGR7
X-Proofpoint-ORIG-GUID: Gz5qt6Tm2MiyWvmu-JygOZPXVBetGDaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_05,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=727 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120114
X-TUID: Tr7ulEPMBbgx

On Thu, 2024-09-12 at 00:38 -0700, Pierrick Bouvier wrote:
> This patch is part of a series that moves towards a consistent use of
> g_assert_not_reached() rather than an ad hoc mix of different
> assertion mechanisms.
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  include/hw/s390x/cpu-topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>
