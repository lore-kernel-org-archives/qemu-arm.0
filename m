Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1278685ejx;
        Thu, 17 Nov 2022 06:01:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7cuaDX5Tm0Vp1kKyjVIBHT5508HwYEHTFrnQesGQKlrue4Rv3eQKk5KqYlgeQTZkfFaa3U
X-Received: by 2002:a05:6402:1d87:b0:459:41fa:8e07 with SMTP id dk7-20020a0564021d8700b0045941fa8e07mr2238433edb.140.1668693703292;
        Thu, 17 Nov 2022 06:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668693703; cv=none;
        d=google.com; s=arc-20160816;
        b=Z562MJkMRhlmjXzJ5gHQn3y9j3XGOBlp0ggI36QfjTPXYEqdmMETNN7n/lvOgOJaYS
         kyGHuQXUPAdltc3a3ehn4DbcM6ZEE5KRoihFf9HZ6RzBCGxg2GdAWrTQFHvwxtApKiVE
         zSGulKM3cXe69lXxCrfxIa24rbr7u5y1CtjgJrbBf9Jdw69j0V1NOsrxbbGdELV1zXHm
         1mP/0W91BrVKo5IxlYbSFuKH9eYO3CRTtJB7UiFYWJspkocEFWd7n8RW1pbmV4JcrWaG
         rQo2GAT6Nj90Z5krm9tHfejKiHugvdEssknNncKYKLGVl+2pDcR5nGb+CTQI6c9Ma9DM
         fWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=OvGnz51jVYD/BB2OS/rakVFjGPrvVn6qd5YZip8TVb8=;
        b=EwsycUDEvDbPEReRw3YXOT/iC9tRkJsuagb7LdKB3bv7sJn0OITeMPXLmHNqidaN1b
         IK8iY/bhSNYVqJppaRkNGvmfpL3BdYLpxVRvDvQ41K0dNI9O3WXi0MqHFP/i9Htw14+Z
         9GNuuI+OjmqdOXJa0i6N9RM4+7q45/oTU19PeueYSmFQuqgi+t2eufrYAh8oUJ9vfIIh
         skeAA5SXdpGvg8EFnzFNk2pgeCViHgkCJm7caKURKT9NiPJ5fi1C5ykJTGeKawM32/Uj
         GJzfAKsL762AqkFhJfjeI2Jx8rgEfBoG+S7dz0XXoR1b+4x07tfitsN32piUZISsIJJg
         ZsbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=ZubXFGJW;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.198 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from mr85p00im-ztdg06011901.me.com (mr85p00im-ztdg06011901.me.com. [17.58.23.198])
        by mx.google.com with ESMTPS id l16-20020a056402255000b0046276ef250asi1007128edb.298.2022.11.17.06.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.23.198 as permitted sender) client-ip=17.58.23.198;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=ZubXFGJW;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.198 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1668693701; bh=OvGnz51jVYD/BB2OS/rakVFjGPrvVn6qd5YZip8TVb8=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=ZubXFGJWokoKwI9GLp+sWyQkklgTHE0ldEOzefyzJD+8P0w16kWHlHyTE8YC5MyqI
	 Mt1fNHLiq2yN9EKmkWuaan4G3Ck6pfTVAEWlpaSmvGerVOb3OA84dVFGN8VVM21q7r
	 M5CR+BsuYv1oZvtrrM40UpD/3mXqBpXGZ557yYWZh7mAXa9OgVTeKl+F6SW+7ninf9
	 TL1v0r3KRlOOY5W6mLrOvFjiYRF4xvUR8JSUfDdwdYaQm3znub3EEY8/rrBbaOMayr
	 2w8Rnq2KvFbKuCeTJS+GpYbMpQ19uFr4JMCtGmuHzjHEalb++45B6v70kEloWd/hDL
	 r1i4i38WiSWSQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id C32FC900C1D;
	Thu, 17 Nov 2022 14:01:39 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221116174749.65175-3-fcagnin@quarkslab.com>
Date: Thu, 17 Nov 2022 15:01:27 +0100
Cc: qemu-devel@nongnu.org,
 dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <412ED80C-27AE-462F-A123-DA14CD9704D5@ynddal.dk>
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-3-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: KumqZfe-pRlVpCGBMm9jfOZmvbNF2oVN
X-Proofpoint-ORIG-GUID: KumqZfe-pRlVpCGBMm9jfOZmvbNF2oVN
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=507 phishscore=0
 clxscore=1030 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211170106
X-TUID: Flr7u6DlLpje


> On 16 Nov 2022, at 18.47, francesco.cagnin@gmail.com wrote:
>=20
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>=20
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>=20
> Guests can be debugged through the gdbstub.
>=20
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> accel/hvf/hvf-accel-ops.c | 123 ++++++++++++++++++++++++
> accel/hvf/hvf-all.c       |  24 +++++
> cpu.c                     |   3 +
> include/sysemu/hvf.h      |  29 ++++++
> include/sysemu/hvf_int.h  |   1 +
> target/arm/hvf/hvf.c      | 194 +++++++++++++++++++++++++++++++++++++-
> 6 files changed, 372 insertions(+), 2 deletions(-)

Looks good. I've tested hw/sw breakpoints, hw watchpoints and =
single-stepping.

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=
