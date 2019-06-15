Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp243293wrg;
        Fri, 14 Jun 2019 23:18:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTes2hCtldyetBb1mfUiTLP3VDEJRSX8bT6vpMg3tRWvkkc/wq+N4IdHI0fMrjfj3cZFwI
X-Received: by 2002:ac8:1a1c:: with SMTP id v28mr80810019qtj.270.1560579484045;
        Fri, 14 Jun 2019 23:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560579484; cv=none;
        d=google.com; s=arc-20160816;
        b=nFPWNMlWNC2jTi2XHmsR4NXOai9UmdYz+l1f2dEO9Ycs+vsgWDmnc7v4bGUIxk/gOI
         9Qf+83wduYZ38VCYv1yJAib4DHRwSxAQzdtAI1AEwFSlZ2ZF03K5pKw6yglIYMRzrGJS
         JoAEs4xAMz2YgVnHJU8ThLydG7WO5rap+6fZ6Ddl2eLt1a4MaU7Rlu0LUu7oh27i+vDV
         CUGZqB0UzNez+mFP8Kqzvh999LmDU2QyNLMdQ+vo36Ohw8oIYTZtLxXyEZMP1oWT2xJ6
         xb44PUU+bbg35bgxJONKjGsPbb0rU4Fxj80h6cKSdVQeKqN9GfBc+mNjazP0syjekF62
         6yJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:from:to
         :content-transfer-encoding:mime-version:references:in-reply-to
         :user-agent:date:dkim-signature;
        bh=DAxc5dy0+uGy/JP2OU5SIVh5tvhIxU8HqRH7eFKD2F8=;
        b=NT4WQidWRj0HMQ0N0bLdx6hb4vHqI70D4xGDmXQPWiSrVNEblq7pdRDRC/Rg7nVe6B
         YC9FAUPma0H4yDgWlAiU8ndFZtALgVx16vxOSElzpbON6SIT2TWzaV3Vt6dkuF6kjanY
         CpH4XB9uRYruUPhTMr1hUUKqvCdnPXTd/ZvIXdKnNfJGNpR2zhFvpfq+V5epj2DO7F1x
         r4Avu8Fcz/4Q92KNoYaHR2FPyqF79y0MhIzpw+7m7hPjkQI7Ln+QelnTGb1Dgi6hi+HE
         mLAGLxfSX2SMwK9/F1ZBZoQJKNZohtMglFfbPlrovBhfLj2jIpMj26aDSBegeAsjA3w5
         D/OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=al7gbUJI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si2766328qvi.210.2019.06.14.23.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 23:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=al7gbUJI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hc20p-00010e-JG
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 02:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59929)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hc1zS-0008QY-T4
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 02:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hc1zR-0002CO-DY
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 02:16:38 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50358)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hc1zP-0001sl-7i; Sat, 15 Jun 2019 02:16:37 -0400
Received: by mail-wm1-x341.google.com with SMTP id c66so4349749wmf.0;
 Fri, 14 Jun 2019 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=DAxc5dy0+uGy/JP2OU5SIVh5tvhIxU8HqRH7eFKD2F8=;
 b=al7gbUJIjpcVYXPD+EEyM/rHZ8wIgZZffKlBetKAvVOxLxFxO9xS4EEFql8+sOd0is
 QmMsosot4g4olenik2BQb4zhDEt4XysDZvi9Y//AXcciSwl4CxzOAOqsNwylBEuqGJv4
 ZmGd9p09wIw5b6oZ+OVtUE0TCaXjXsoFXludVBtkkmvWn9oCKPDe2+Hstj6V6b1aqtW7
 XeJkuyBR4C3eHoHJEcH52GFhG8zLiYdZuOOOe10/lT3Fl4AN4TOF7oDTkK6d5uWILLjU
 OXNwMoL8eEaBMY8/0oTscyYTK5FaxKLfpruF+8UGZNJescGQ5brzDWVVN6dxV9vbMSDy
 PYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=DAxc5dy0+uGy/JP2OU5SIVh5tvhIxU8HqRH7eFKD2F8=;
 b=VLshLYxU61vDuLTBEBb28F8ugz6sm/9QsGV/PdZWc1J608Z8Km8G5ANlDsTJK0mk13
 e0bXq8mcY1gcZaYllQqaEW+wYpiptzgyQrcUZNONyImZ9gNXAudUQ3DXRJeLNbcu+lPj
 Puo21AD8ZUiOF8OzNA/DIflMA0M98BaUWJYXwRqR+M5tku4rm4FHTt4MLFVPaxsQTQdO
 xlPtBC77hzHOqEg+Ej0g/zjoNocyZofQ1NkgiskBme07GP2ONmoZZCuasLY24xf4OJvI
 6PpKKfEh24pIszAM6rDhvrAtbOavzG61uMAJH6ruTfkO+6Y+kgNqIxEyH7WYMH0/XK+e
 XE9Q==
X-Gm-Message-State: APjAAAV7z/Cg2GD52n3mgZk6JfAA/c3LcieEEKBD5AgXGprwszP+SVO9
 7XXo+23jvhiQ+HPO0skrCAM=
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr10925560wmf.60.1560579371253; 
 Fri, 14 Jun 2019 23:16:11 -0700 (PDT)
Received: from [192.168.1.10] ([141.226.31.91])
 by smtp.gmail.com with ESMTPSA id g131sm3598355wmf.37.2019.06.14.23.16.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 23:16:10 -0700 (PDT)
Date: Sat, 15 Jun 2019 09:16:06 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <d87ea542-7ecc-4fb1-ac1d-929825d23a8a@redhat.com>
References: <20190615051559.13767-1-rfried.dev@gmail.com>
 <d87ea542-7ecc-4fb1-ac1d-929825d23a8a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Ramon Fried <rfried.dev@gmail.com>
Message-ID: <E1523CDB-895A-4EC7-908F-8A3A3717353C@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v3] net: cadence_gem: fix compilation error
 when debug is on
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XyKvVPMG1hm7



On June 15, 2019 8:38:35 AM GMT+03:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@redhat=2Ecom> wrote:
>Hi Ramon,
>
>On 6/15/19 7:15 AM, Ramon Fried wrote:
>> defining CADENCE_GEM_ERR_DEBUG causes compilation
>> errors, fix that=2E
>>=20
>> Signed-off-by: Ramon Fried <rfried=2Edev@gmail=2Ecom>
>> ---
>> v2: change %lx to HWADDR_PRIx and %lx to %zdx
>> v3: change %zdx to %zx
>>=20
>>  hw/net/cadence_gem=2Ec | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/hw/net/cadence_gem=2Ec b/hw/net/cadence_gem=2Ec
>> index 7f63411430=2E=2Eecee22525c 100644
>> --- a/hw/net/cadence_gem=2Ec
>> +++ b/hw/net/cadence_gem=2Ec
>> @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc,
>const uint8_t *buf, size_t size)
>>              return -1;
>>          }
>> =20
>> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy,
>rxbufsize),
>> -                rx_desc_get_buffer(s->rx_desc[q]));
>> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",
>MIN(bytes_to_copy, rxbufsize),
>> +                rx_desc_get_buffer(s, s->rx_desc[q]));
>> =20
>>          /* Copy packet data to emulated DMA buffer */
>>          address_space_write(&s->dma_as, rx_desc_get_buffer(s,
>s->rx_desc[q]) +
>> @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
>>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>>                                                 (p - tx_packet)) {
>>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x
>space " \
>> -                         "0x%x\n", (unsigned)packet_desc_addr,
>> +                         "0x%zx\n", (unsigned)packet_desc_addr,
>>                           (unsigned)tx_desc_get_length(desc),
>>                           sizeof(tx_packet) - (p - tx_packet));
>>                  break;
>>=20
>
>I still get an error when trying to build on 32bit host with
>CADENCE_GEM_ERR_DEBUG enabled (pre-existing to your patch):
>
>  CC      hw/net/cadence_gem=2Eo
>=2E/hw/net/cadence_gem=2Ec: In function 'gem_receive':
>=2E/hw/net/cadence_gem=2Ec:973:14: error: format '%ld' expects argument o=
f
>type 'long int', but argument 4 has type 'size_t {aka unsigned int}'
>[-Werror=3Dformat=3D]
>    DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
>              ^
>=2E/hw/net/cadence_gem=2Ec:38:24: note: in definition of macro 'DB_PRINT'
>     fprintf(stderr, ## __VA_ARGS__); \
>                        ^
>cc1: all warnings being treated as errors
>=2E/rules=2Emak:69: recipe for target 'hw/net/cadence_gem=2Eo' failed
>make: *** [hw/net/cadence_gem=2Eo] Error 1
>
>However the 64bit host is indeed fixed, so I'm fine with your patch:
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat=2Ecom>
>Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat=2Ecom>
>
>Regards,
>
>Phil=2E
Thanks!=20

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
