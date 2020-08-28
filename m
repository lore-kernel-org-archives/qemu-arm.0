Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1316408lfc;
        Fri, 28 Aug 2020 02:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYmhXSyrxullO1y1RenZCMdmtR5JTtPzIIBYNK7Sd5wtB7nMf3OLZACvAD0DltoawCq6W5
X-Received: by 2002:a25:f20d:: with SMTP id i13mr1318781ybe.152.1598608672351;
        Fri, 28 Aug 2020 02:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598608672; cv=none;
        d=google.com; s=arc-20160816;
        b=K0Ug+9KaErhlIqndMUDUL3hG+5CuBu4Qat6a2EsSYLSmSofI7DtFbBeJzROFZ++Q/U
         5XicTitblQJppY8G8g833kXyvETngcaO8Rin9oFfN2E8WYTWMyY2HEx8ykuGWfOHH8UL
         35JC4TGdJ+2GMgWm1YRezQdTq3a3mIcheta7Yh9pUkqZhqzKsnF0WD35zP3o+Gly5Kzv
         RJQCZZOZYAEubAGHo+9JkufLIigGvuRMlqE1YNnGzwTS40sYdVKlDQCVjgt8T0B05s4l
         oQYmEyTt/1uPf8lHqSZWfBA1mjkK8L4EGNZuHyphO/061k7CvHhQTleTqdpP5x5Ich4a
         w+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jQ0veCTMiRXpwXeE5aYaK9LCfJZeYU8q1ATj3ASz1Gg=;
        b=UKVfyGY5m4jvaXkcDT7M2eXQ+IB0BjHTMc1whQpzkFvbddgzHpGBSpn+YPMCxNSKcT
         YJIylw9MFb9O01T/OFAIRd3Z3Vo1N4q9U756MSqKOgq0A4fobZN2giO6PdQ4juyQRMjT
         sufNV7mLNyaclEs5CN2iVqvs02b91ChF4V2sSR8L+zEvRDAt2Vt75e79s7OT2GDnYbj6
         JGgmrecgh8+mBa/bgs2YsdoRSMGn14YZqduyjVwiPMINNZWm7wHrOI1oOXkMY1sHeISJ
         NJlL6Ws5LG9xjTMkpoP9HNimO6pv5u6zMJjarPHrpQG46mBr6fFQdDMx3ew7BU8EWfC5
         U6Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q/Wb3D0s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si563626ybo.229.2020.08.28.02.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 02:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Q/Wb3D0s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBb8p-0007Tp-Mu
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 05:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kBb8c-0007GS-Dd; Fri, 28 Aug 2020 05:57:38 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:39107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kBb8a-0008Tz-LV; Fri, 28 Aug 2020 05:57:38 -0400
Received: by mail-oo1-xc44.google.com with SMTP id m4so129696oos.6;
 Fri, 28 Aug 2020 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jQ0veCTMiRXpwXeE5aYaK9LCfJZeYU8q1ATj3ASz1Gg=;
 b=Q/Wb3D0s04VXQ0fWexx0EoIg1xNvzWp9XwFWCKPJVX3ts2Vv8XYgkbf7YFK7L2jM+J
 lQAnkNIgS7HBOqFM4U8wyg852DeXGRHxZTeQRHiPut5rgs0lNnVa5rDN/91/8FH0EraV
 ba2rMiYXe1efsPCdbHqFyguE4pvSnt1u4PmrvrBh4JP6GavGVezdGeHGrZfa24/2a+hN
 rnQeuMeevYlN4TwG2w7rI9wHGQjFJOtTuptj+TeVDXg5qrCCPwiNjAG/egwmt2AJDuYT
 ajbFcEsQCK1NNRwLXoB9HBR7FEECwWYcoOHtEK/GpX4T+4PVTYS0c06rPkn9BDqMViKm
 870w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jQ0veCTMiRXpwXeE5aYaK9LCfJZeYU8q1ATj3ASz1Gg=;
 b=snYUsFVr5PcRXTSg3A0R77H9OEKcmECcZ/s0/wDNj24N2VArK3fucKpCZuZwoWL/yg
 83Jca9jLlotHK6kazcVruJJncTTL3zGtGrZZs2YMDRXAc5d1WjtMj5P3Ox1rzwrIVyic
 b3RmLm3mZJz+3dnwhEDA73Aj+J8KkTi9F+nSuJOFrSB5iQQLe6epDrsiPwi3G43Dsxe+
 VEcswAQA8rNe6QH29XrKZ03hyHgwHPk+iFYeuR4PUUiqyL0YJjdY5TM2/E9UaaJIkJkr
 LbTd3WR4A2Dj+lv722ZqZ95QAyZVZQ9noeOADGe7PdryeiGA534+CMi1wkGuaivDofUD
 NH+w==
X-Gm-Message-State: AOAM530Oolr6yjAximJjpr83U8azNNq4+jBsMOsYY02Ymk0cZ0mkriDf
 0Pub2JpKLZAhz7BGkz6qNnFDyuWhkirr91JQHvg=
X-Received: by 2002:a4a:be0c:: with SMTP id l12mr590082oop.22.1598608653835;
 Fri, 28 Aug 2020 02:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200822180950.1343963-1-f4bug@amsat.org>
 <20200822180950.1343963-2-f4bug@amsat.org>
In-Reply-To: <20200822180950.1343963-2-f4bug@amsat.org>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 28 Aug 2020 17:56:57 +0800
Message-ID: <CAKXe6SLwoUJ76QRCYkOi5pRZ+ROmAwXV6QsR7TUkZLaF7kA4Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] util/hexdump: Convert to take a void pointer
 argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu Developers <qemu-devel@nongnu.org>, Zhang Chen <chen.zhang@intel.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FJGH62y4FnG2

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =E4=BA=8E2020=E5=B9=B48=E6=9C=
=8823=E6=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=882:11=E5=86=99=E9=81=93=
=EF=BC=9A
>
> Most uses of qemu_hexdump() do not take an array of char
> as input, forcing use of cast. Since we can use this
> helper to dump any kind of buffer, use a pointer to void
> argument instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> Since v1:
> - renamed argument 'bufptr' (Peter Maydell)
> ---
>  include/qemu-common.h    |  3 ++-
>  hw/dma/xlnx_dpdma.c      |  2 +-
>  hw/net/fsl_etsec/etsec.c |  2 +-
>  hw/sd/sd.c               |  2 +-
>  hw/usb/redirect.c        |  2 +-
>  net/colo-compare.c       | 12 ++++++------
>  net/net.c                |  2 +-
>  util/hexdump.c           |  4 +++-
>  8 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index bb9496bd80f..6834883822f 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -138,7 +138,8 @@ int os_parse_cmd_args(int index, const char *optarg);
>   * Hexdump a buffer to a file. An optional string prefix is added to eve=
ry line
>   */
>
> -void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t =
size);
> +void qemu_hexdump(const void *bufptr, FILE *fp,
> +                  const char *prefix, size_t size);
>
>  /*
>   * helper to parse debug environment variables
> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> index b40c897de2c..d75a8069426 100644
> --- a/hw/dma/xlnx_dpdma.c
> +++ b/hw/dma/xlnx_dpdma.c
> @@ -388,7 +388,7 @@ static void xlnx_dpdma_dump_descriptor(DPDMADescripto=
r *desc)
>  {
>      if (DEBUG_DPDMA) {
>          qemu_log("DUMP DESCRIPTOR:\n");
> -        qemu_hexdump((char *)desc, stdout, "", sizeof(DPDMADescriptor));
> +        qemu_hexdump(desc, stdout, "", sizeof(DPDMADescriptor));
>      }
>  }
>
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index 7035cf4eb97..c817a28decd 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -357,7 +357,7 @@ static ssize_t etsec_receive(NetClientState *nc,
>
>  #if defined(HEX_DUMP)
>      fprintf(stderr, "%s receive size:%zd\n", nc->name, size);
> -    qemu_hexdump((void *)buf, stderr, "", size);
> +    qemu_hexdump(buf, stderr, "", size);
>  #endif
>      /* Flush is unnecessary as are already in receiving path */
>      etsec->need_flush =3D false;
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index fad9cf1ee7a..190e4cf1232 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1781,7 +1781,7 @@ send_response:
>      }
>
>  #ifdef DEBUG_SD
> -    qemu_hexdump((const char *)response, stderr, "Response", rsplen);
> +    qemu_hexdump(response, stderr, "Response", rsplen);
>  #endif
>
>      return rsplen;
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 417a60a2e68..09edb0d81c0 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -240,7 +240,7 @@ static void usbredir_log_data(USBRedirDevice *dev, co=
nst char *desc,
>      if (dev->debug < usbredirparser_debug_data) {
>          return;
>      }
> -    qemu_hexdump((char *)data, stderr, desc, len);
> +    qemu_hexdump(data, stderr, desc, len);
>  }
>
>  /*
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 2c20de1537d..550272b3baa 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -494,9 +494,9 @@ sec:
>          g_queue_push_head(&conn->secondary_list, spkt);
>
>          if (trace_event_get_state_backends(TRACE_COLO_COMPARE_MISCOMPARE=
)) {
> -            qemu_hexdump((char *)ppkt->data, stderr,
> +            qemu_hexdump(ppkt->data, stderr,
>                          "colo-compare ppkt", ppkt->size);
> -            qemu_hexdump((char *)spkt->data, stderr,
> +            qemu_hexdump(spkt->data, stderr,
>                          "colo-compare spkt", spkt->size);
>          }
>
> @@ -535,9 +535,9 @@ static int colo_packet_compare_udp(Packet *spkt, Pack=
et *ppkt)
>          trace_colo_compare_udp_miscompare("primary pkt size", ppkt->size=
);
>          trace_colo_compare_udp_miscompare("Secondary pkt size", spkt->si=
ze);
>          if (trace_event_get_state_backends(TRACE_COLO_COMPARE_MISCOMPARE=
)) {
> -            qemu_hexdump((char *)ppkt->data, stderr, "colo-compare pri p=
kt",
> +            qemu_hexdump(ppkt->data, stderr, "colo-compare pri pkt",
>                           ppkt->size);
> -            qemu_hexdump((char *)spkt->data, stderr, "colo-compare sec p=
kt",
> +            qemu_hexdump(spkt->data, stderr, "colo-compare sec pkt",
>                           spkt->size);
>          }
>          return -1;
> @@ -578,9 +578,9 @@ static int colo_packet_compare_icmp(Packet *spkt, Pac=
ket *ppkt)
>          trace_colo_compare_icmp_miscompare("Secondary pkt size",
>                                             spkt->size);
>          if (trace_event_get_state_backends(TRACE_COLO_COMPARE_MISCOMPARE=
)) {
> -            qemu_hexdump((char *)ppkt->data, stderr, "colo-compare pri p=
kt",
> +            qemu_hexdump(ppkt->data, stderr, "colo-compare pri pkt",
>                           ppkt->size);
> -            qemu_hexdump((char *)spkt->data, stderr, "colo-compare sec p=
kt",
> +            qemu_hexdump(spkt->data, stderr, "colo-compare sec pkt",
>                           spkt->size);
>          }
>          return -1;
> diff --git a/net/net.c b/net/net.c
> index bbaedb3c7a6..f3e5d533fd7 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -636,7 +636,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetC=
lientState *sender,
>
>  #ifdef DEBUG_NET
>      printf("qemu_send_packet_async:\n");
> -    qemu_hexdump((const char *)buf, stdout, "net", size);
> +    qemu_hexdump(buf, stdout, "net", size);
>  #endif
>
>      if (sender->link_down || !sender->peer) {
> diff --git a/util/hexdump.c b/util/hexdump.c
> index f879ff0ad6b..053f05d4160 100644
> --- a/util/hexdump.c
> +++ b/util/hexdump.c
> @@ -16,8 +16,10 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>
> -void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t =
size)
> +void qemu_hexdump(const void *bufptr, FILE *fp,
> +                  const char *prefix, size_t size)
>  {
> +    const char *buf =3D bufptr;
>      unsigned int b, len, i, c;
>
>      for (b =3D 0; b < size; b +=3D 16) {
> --
> 2.26.2
>
>
