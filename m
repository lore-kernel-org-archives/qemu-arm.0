Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4549203lfp;
        Mon, 4 Oct 2021 22:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQkRs0us0Y5WhFfp+FoA6NDDUKfZ9GgmL+wZkKpXG19U3dEdUZMRODGNdsvwU5Bgb4MDXc
X-Received: by 2002:a5d:8857:: with SMTP id t23mr927994ios.21.1633411738098;
        Mon, 04 Oct 2021 22:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633411738; cv=none;
        d=google.com; s=arc-20160816;
        b=eDWFKBxQhRPzNBBxmhnHY5Lgd5wIzHGJv76S7uD2RTisuoPNhkJ2XV2Er7P5Llq56C
         C1Mx5TCvQCOUt0vRWPnw51RkXHZC4FKP8sQ9apvLwizc3iv+OwruU096A8m/8lYVo28C
         x7dkNHC1EQ62YYKbNyTvH/8YeNSG5NOnLsTN8AN7v1zCWNI3s0Gjh/F8bgIJ7ekrYxUl
         ay3K26gAwyaLRATcyweT94Af9Z6kAOgYNb1GZZq0tIR2rqHqA6qYDY6P5DlmjDaUTZTv
         TUQsJuLfAgvgwxGprRcHuHhHBH6jKobR4AQozTYTV3ECq4rCFi585yoQr0Dx9QpesXqI
         dy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=fugQ0CzHB1aOiTbKa2/YI88w0TtcR7Uc8sV19lZ7Qps=;
        b=idr0b2UY0i4OuZy4pyjdz9BIaVygN/00iaA4/UEkteVEDLgttyUSZn8OWETfygkd7+
         kDQl7/U7+vrfWIdZUXjJlTPDxTNQ4Jp/COO+70WqOxFSL5TakOD0qAncUrl8hFpFVmYn
         b1YTdE+TXCWjkZmJRmwYjl8EBZk7coNsqBzQeIIsoF2vWbbXw+yHm5fm9s7hGa3OfPx5
         xatNL4EphH3km/AKPq1ObjpD9bGitFzET5plP/L0mYuJZA1NwYMwZGvKd7z91ubK8q5W
         JnuPqkEF+aY/yWcGvIAB1EzLg463nIMnX91zoWcZ2ibi6qr+tdGHRhYsSsPB7cAokMhU
         swEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=S7giCBYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si5869270jak.26.2021.10.04.22.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Oct 2021 22:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=S7giCBYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXd0b-0005rg-D2
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 01:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99121193c4=pdel@fb.com>)
 id 1mXd0J-0005rP-O6
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 01:28:39 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:36008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99121193c4=pdel@fb.com>)
 id 1mXd0H-0001yB-JS
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 01:28:39 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195385O5013303
 for <qemu-arm@nongnu.org>; Mon, 4 Oct 2021 22:28:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=fugQ0CzHB1aOiTbKa2/YI88w0TtcR7Uc8sV19lZ7Qps=;
 b=S7giCBYRcLXQBiCgBHttDk2un45Ke4FaZfxF+GTLR0k1MEdIeRYGoCMRMprAxb4oJHu8
 SV5IOB2guV+YkFkPyT+cC7kzhrkhBhlQ+mQmsUoBNkAYwJv4Lce/owHS7ZKnRQ1DISpo
 jlmjok84W5k5otkcZOs31EHkak52nHICRHY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bg4kbkkfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 04 Oct 2021 22:28:34 -0700
Received: from intmgw001.46.prn1.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 4 Oct 2021 22:28:33 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id D12D95346169; Mon,  4 Oct 2021 22:26:05 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <alistair@alistair23.me>, <peter.maydell@linaro.org>, <clg@kaod.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <zhdaniel@fb.com>, <patrick@stwcx.xyz>,
 <billy_tsai@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v3 0/2] hw/adc: Add basic Aspeed ADC model
Date: Mon, 4 Oct 2021 22:26:02 -0700
Message-ID: <20211005052604.1674891-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="UTF-8"
X-FB-Internal: Safe
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: uLtzsl6qnm7oY0DtW_VzQvrxbLDn7c19
X-Proofpoint-GUID: uLtzsl6qnm7oY0DtW_VzQvrxbLDn7c19
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050030
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=99121193c4=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rnoe2glJFNj9

From: Peter Delevoryas <pdel@fb.com>

v1: https://lore.kernel.org/qemu-devel/20211002214414.2858382-1-pdel@fbc.om/
v2: https://lore.kernel.org/qemu-devel/20211003191850.513658-1-pdel@fb.com/
v3:
    - Reduced the minimum access size to 2, to allow 16-bit reads
    - Shifted the read value down 16 bits when reading an odd channel's
      data register.

So, v1 and v2 only attempted to support 32-bit reads and writes, but
Patrick was testing Witherspoon with my patches and revealed that the
upstream kernel driver (I was looking at 5.10 and 5.14) definitely
performs 16-bit reads of each channel, and that my patches crash
when that happens.

https://lore.kernel.org/openbmc/YVtJTrgm3b3W4PY9@heinlein/

  static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
                     struct iio_chan_spec const *chan,
                     int *val, int *val2, long mask)
  {
      struct aspeed_adc_data *data =3D iio_priv(indio_dev);
      const struct aspeed_adc_model_data *model_data =3D
              of_device_get_match_data(data->dev);
=20=20
      switch (mask) {
      case IIO_CHAN_INFO_RAW:
          if (!strcmp(model_data->model_name, "ast2600-adc")) {
              *val =3D readw(data->base + chan->address) + data->cv;
                     ^^^^^
          }
          else {
              *val =3D readw(data->base + chan->address);
                     ^^^^^
          }
          return IIO_VAL_INT;

I actually tested an image that uses this driver, but I wasn't testing
reads through the driver, I was just using the QEMU monitor, so it
didn't crash.

It's easy to at least relax the restrictions enough to allow the 16-bit
reads, and it's also not that hard to return the correct channel from
the channel data sampling. I didn't attempt to do anything special for
correctness of other registers, because I think we just perform 32-bit
reads and writes for them, and I didn't attempt to do the correct thing
for 16-bit writes to the data registers since that's not done by the
driver. (And I'm not sure the hardware supports that anyways?)

Thanks,
Peter

Andrew Jeffery (2):
  hw/adc: Add basic Aspeed ADC model
  hw/arm: Integrate ADC model into Aspeed SoC

 hw/adc/aspeed_adc.c         | 427 ++++++++++++++++++++++++++++++++++++
 hw/adc/meson.build          |   1 +
 hw/adc/trace-events         |   3 +
 hw/arm/aspeed_ast2600.c     |  11 +
 hw/arm/aspeed_soc.c         |  11 +
 include/hw/adc/aspeed_adc.h |  55 +++++
 include/hw/arm/aspeed_soc.h |   2 +
 7 files changed, 510 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

Interdiff against v2:
diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index fcd93d6853..c5fcae29f6 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -148,6 +148,11 @@ static uint64_t aspeed_adc_engine_read(void *opaque, h=
waddr addr,
         /* fallthrough */
     case DATA_CHANNEL_1_AND_0 ... DATA_CHANNEL_7_AND_6:
         value =3D read_channel_sample(s, reg);
+        /* Allow 16-bit reads of the data registers */
+        if (addr & 0x2) {
+            assert(size =3D=3D 2);
+            value >>=3D 16;
+        }
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: engine[%u]: 0x%" HWADDR_PRIx "\n",
@@ -234,7 +239,7 @@ static const MemoryRegionOps aspeed_adc_engine_ops =3D {
     .write =3D aspeed_adc_engine_write,
     .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
-        .min_access_size =3D 4,
+        .min_access_size =3D 2,
         .max_access_size =3D 4,
         .unaligned =3D false,
     },
--=20
2.30.2

