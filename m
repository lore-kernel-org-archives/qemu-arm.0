Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp923432wrq;
        Mon, 4 Jun 2018 11:24:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIRJw7s/NYaBNsFpxZLZ6pewWXew2pQ3OUxfQwufDBlT7l/gzaxuf4+GSNIBKYkv/WQ+Dqg
X-Received: by 2002:ac8:19ca:: with SMTP id s10-v6mr21144985qtk.303.1528136645632;
        Mon, 04 Jun 2018 11:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528136645; cv=none;
        d=google.com; s=arc-20160816;
        b=WrbjMUVAikqA+1tubLExtcsUoqXIWZmPzebJT9VNv+P1wbNHPb7W7KJ93JKxAfxfwM
         U7K3lybVj44eP+I2Rob3D6FDP32k9zzvhnNs1SbwrENP6YKy7ulcX/MIH60BM2EIkhjz
         JWzX9MjI+5QlS0CVKtJ8uNXhN4fCyNZggnaLmDeq0jhHLwl8CIUL46Xx3vn3+WOKLca9
         LG3HmjfWQ9CWhbnAZntnKEmAVuBPRlnr+tm1oPR9i7pe1JZagNvmT8+t+Y3We07IB1DV
         WfcXixU3dCZYSrZi72lJBKwz50Mm6RuqQlNxjcxYe1z1NWxyNmzc+ytpa/WhVg4Csr3M
         jhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=HiE5kVNpzvR6f576369e3bMITZp57lYNjp1j/csXMXg=;
        b=V8fcXk7OzAe6xr8aItrO9cpTal4ay6qpqn77OiSWRvmI54x0VVBtKvGKzZ816FV5v8
         RQYS1PbUp+BMNt0UvqT30xYU+XXzVEPEeKUS98saJZKfYUKhWf64X+PaWUdlNM4K0Iqs
         gfquFB7tvtQfP1v4B77ingreyxNnIABJVICtsdfY2igCx5KcKyAAHKYovMiSGd2FGZt7
         mwf6q29wdwb7HdpPzf4wwslQOYtNFmc8qc3Ip8eFCTI4esoAnEPGCpX0pUaVOBjk+qeB
         YZY6GRE0wuE8Vr+j4cJKGODCCObC2doo6weCGjefilI8cO223ZwPCs+XQWZ2ZqafVW+H
         SclQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rCYLakFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123-v6si1256743qkc.165.2018.06.04.11.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 11:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rCYLakFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPu9F-0007N7-4b
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 14:24:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu92-0007Ku-Eu
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu91-0000MK-Hh
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:23:52 -0400
Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a]:46874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fPu91-0000LN-9A; Mon, 04 Jun 2018 14:23:51 -0400
Received: by mail-lf0-x22a.google.com with SMTP id j13-v6so22289313lfb.13;
	Mon, 04 Jun 2018 11:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HiE5kVNpzvR6f576369e3bMITZp57lYNjp1j/csXMXg=;
	b=rCYLakFDmBgKUZvgaNvL1Bthp6n+rwB1LCnN3nY+kkhr6MqeULDANgmThLE9zIh4xo
	Yf8cGINawjtvGS60lNfdcxufdUL9VXbGgLSrKMe3ECLlzD2tOtWvs+/wN0i3WVB6nL9K
	9IsX77JL/YAwZ/B8UaGgS0mQBp3ExGIhcRpcGMowBGeYDuxXiaLABJHaWEA0dnw9MlFK
	hKAhRmkpV1KYHzGM+TH8HntOCWV+yguFwXvg7OmUbOvtrXGg4NMpSsOOP83YYqKUDfPQ
	OZMAzuiRK1515NbtAjG5n2dJZCSBCXCbVjKPjICp18h2vS83N3huIPciU7U6+iZf8ZA1
	bGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HiE5kVNpzvR6f576369e3bMITZp57lYNjp1j/csXMXg=;
	b=omsPr9gs9FJJIEMhg5hMF0CSahHEocCOJkOteXT0scJw9DsDeNJCY83XVRvWteblI9
	tjJGwX8RnWTePlBw4e06r0TKM2JvDfyjCr+2BpplgZxlJLzM/S6ip2ma+U2FWsVync9V
	k8e6HDq6m+WPaRgpzYuFS7xLFXeFO7rvP6GeuDr6eJJcPcbCXVrwdQQxJ7os8nEzWrXW
	PYTP5+aljKLINBI0m91t+LUEcbixUW0UtqhxWh9DAdvaYPNYOAoWDdMt47mxtymMEdl6
	Aav8Y6ll7TKMdsSxx0P/+7hF8hc0qsHxALHW95muLiI7CuTdxZiTGRyOUcDGoEBaDlFr
	6CEw==
X-Gm-Message-State: ALKqPwcg9gt65JSSSMHw/gM8xDga943Qa0v3A+0RZ2sPKbvBVRwdMXud
	HDeBcUJDI+Ce8JOOrsyc0+5WGgt8IHIDNavNxik=
X-Received: by 2002:a2e:5019:: with SMTP id
	e25-v6mr16835229ljb.122.1528136630107; 
	Mon, 04 Jun 2018 11:23:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 11:23:19 -0700 (PDT)
In-Reply-To: <20180603000827.30872-5-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 11:23:19 -0700
Message-ID: <CAKmqyKP3HtfP1_S7WynXM7UB_A_+ynBO3RsNoZEmJBH1Yb9Mcg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/8] sdcard: Set Spec v2.00 as
 default
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
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /mpcUS7oa9FB

On Sat, Jun 2, 2018 at 5:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/sd/sd.h |  1 +
>  hw/sd/sd.c         | 13 +++++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 49f22b0b89..7c6ad3c8f1 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -56,6 +56,7 @@
>
>  enum SDPhySpecificationVersion {
>      SD_PHY_SPECv1_10_VERS     =3D 1,
> +    SD_PHY_SPECv2_00_VERS     =3D 2,
>  };
>
>  typedef enum {
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 5ddd211114..81f178b36e 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -311,8 +311,12 @@ static void sd_ocr_powerup(void *opaque)
>
>  static void sd_set_scr(SDState *sd)
>  {
> -    sd->scr[0] =3D (0 << 4)       /* SCR structure version 1.0 */
> -                 | 1;           /* Spec Version 1.10 */
> +    sd->scr[0] =3D 0 << 4;        /* SCR structure version 1.0 */
> +    if (sd->spec_version =3D=3D SD_PHY_SPECv1_10_VERS) {
> +        sd->scr[0] |=3D 1;        /* Spec Version 1.10 */
> +    } else {
> +        sd->scr[0] |=3D 2;        /* Spec Version 2.00 */
> +    }
>      sd->scr[1] =3D (2 << 4)       /* SDSC Card (Security Version 1.01) *=
/
>                   | 0b0101;      /* 1-bit or 4-bit width bus modes */
>      sd->scr[2] =3D 0x00;          /* Extended Security is not supported.=
 */
> @@ -2060,7 +2064,8 @@ static void sd_realize(DeviceState *dev, Error **er=
rp)
>      sd->proto_name =3D sd->spi ? "SPI" : "SD";
>
>      switch (sd->spec_version) {
> -    case SD_PHY_SPECv1_10_VERS:
> +    case SD_PHY_SPECv1_10_VERS
> +     ... SD_PHY_SPECv2_00_VERS:
>          break;
>      default:
>          error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_ve=
rsion);
> @@ -2084,7 +2089,7 @@ static void sd_realize(DeviceState *dev, Error **er=
rp)
>
>  static Property sd_properties[] =3D {
>      DEFINE_PROP_UINT8("spec_version", SDState,
> -                      spec_version, SD_PHY_SPECv1_10_VERS),
> +                      spec_version, SD_PHY_SPECv2_00_VERS),
>      DEFINE_PROP_DRIVE("drive", SDState, blk),
>      /* We do not model the chip select pin, so allow the board to select
>       * whether card should be in SSI or MMC/SD mode.  It is also up to t=
he
> --
> 2.17.1
>
>
