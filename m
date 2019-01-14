Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2808121wrt;
        Mon, 14 Jan 2019 00:46:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6ZUPydGIeJ0olTVDl+ecsJnuRm8ex09RFPbBiC0zbOT3QG5y37j3mvWizdGRnUJ1ywR7gq
X-Received: by 2002:a1c:cc2:: with SMTP id 185mr11218589wmm.1.1547455587272;
        Mon, 14 Jan 2019 00:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547455587; cv=none;
        d=google.com; s=arc-20160816;
        b=JwKGiA4Kuzw7zg0lsIFaJoUu1ZigMQfSkKRHXTKVe5Y1EzGmte+EMIg3qOcq2e3Ukl
         f6t7BbYUHnJj30/B4kCpFOg5kDVxwXRPqfwJh7tcp9CTcdzEM0nbM+F3lHGQoGOSDSsE
         BbhkDLvlEqj7Zt3sO5Eh8ZEJXf/6x5eV4RgwqvUwPHpyNZiFsHt7wJ0oFixQKT7ywiHL
         hjPCC/fneGClshntWdEUc8uyAnJhqaF+XAjmWu/2YUg8UJCYTl8B6wlYyTwbJMTHcz1+
         9TgQRc4huldj1iK8yjQSRIuEuSPFtr2r3mMJ5IXOUSfz4/AY4h3aUQg2bY8SIMmdmrpa
         jqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=8732+6QxzfOOt8TU0tphhYMqG/s2tH8tvnNuWlB9nGg=;
        b=iXgCeJf/TF/7nDg1tHVzS6BuVyUBRWFuTAUd/cu20666YB/2YpVUQCX3RI6BYsnnuo
         9A3AoceJ30skdzFUdCVJ/vwkxry6feTbUVOb5Sqb/nqCNQmnnP9LyW2a36E7vcvma4HQ
         jHAbTjKUNjOs2BljJY4Ro/SIyB7gqCPPrlkTf40+AMt6chggGAb7ITSoAzfNh/KZD0Ak
         gprdtCHBSlMj4fXFofnHNQJ0ozaq12FHdZWBr0hbWmvEbyxQ8S5uhBzVAAUqP3Iulo21
         DtSyT92T0Aup1mzYNz5UrEnSjXVvVdS+wnansGp5CDAGm9YrtvCQSN/wfXkB/2CdLW81
         dXqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s123si7178098wmd.29.2019.01.14.00.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 00:46:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gixt4-0006p8-AO
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 03:46:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gixsp-0006oy-MQ
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 03:46:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gixso-0001vg-Vl
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 03:46:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60062)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gixso-0001vI-Ns; Mon, 14 Jan 2019 03:46:10 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E92644E8B7;
	Mon, 14 Jan 2019 08:46:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E181BAA8;
	Mon, 14 Jan 2019 08:45:55 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
	yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
	4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
	tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
	0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
	O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
	0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
	gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
	3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
	zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzRxUaG9tYXMgSHV0
	aCA8dGguaHV0aEBnbXguZGU+wsF7BBMBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIX
	gAUCUfuWKwIZAQAKCRAu2dd0/nAttbe/EACb9hafyOb2FmhUqeAiBORSsUifFacQ7laVjcgR
	I4um8CSHvxijYftpkM2EdAtmXIKgbNDpQoXcWLXB9lu9mLgTO4DVT00TRR65ikn3FCWcyT74
	ENTOzRKyKLsDCjhXKPblTPIQbYAUCOWElcyAPm0ERd62fA/rKNxgIiNo/l4UODOMoOJm2/Ox
	ZoTckW68Eqv7k9L7m7j+Hn3hoDTjAmcCBJt+j7pOhzWvCbqoNOIH8C8qvPaNlrba+R/K6jkO
	6jZkTbYQpGIofEQJ/TNn38IsNGpI1ALTHWFtoMxp3j2Imz0REO6dRE2fHRN8sVlHgkoeGhmY
	NbDsDE1jFQOEObFnu0euk//7BXU7tGOHckVAZ8T1smiRPHfQU7UEH2a/grndxJ+PNeM5w7n2
	l+FN3cf2KgPotCK2s9MjSdZA7C5e3rFYO8lqiqTJKvc62vqp3e7B0Kjyy5/QtzSOejBij2QL
	xkKSFNtxIz4MtuxN8e3IDQNxsKry3nF7R4MDvouXlMo6wP9KuyNWb+vFJt9GtbgfDMIFVamp
	ZfhEWzWRJH4VgksENA4K/BzjEHCcbTUb1TFsiB1VRnBPJ0SqlvifnfKk6HcpkDk6Pg8Q5FOJ
	gbNHrdgXsm+m/9GF2zUUr+rOlhVbK23TUqKqPfwnD7uxjpakVcJnsVCFqJpZi1F/ga9IN87B
	TQRR+3lMARAAtp831HniPHb9AuKq3wj83ujZK8lH5RLrfVsB4X1wi47bwo56BqhXpR/zxPTR
	eOFT0gnbw9UkphVc7uk/alnXMDEmgvnuxv89PwIQX6k3qLABeV7ykJQG/WT5HQ6+2DdGtVw3
	2vjYAPiWQeETsgWRRQMDR0/hwp8s8tL/UodwYCScH6Vxx9pdy353L1fK4Bb9G73a+9FPjp9l
	x+WwKTsltVqSBuSjyZQ3c3EE8qbTidXZxB38JwARH8yN3TX+t65cbBqLl/zRUUUTapHQpUEd
	yoAsHIml32e4q+3xdLtTdlLi7FgPBItSazcqZPjEcYW73UAuLcmQmfJlQ5PkDiuqcitn+KzH
	/1pqsTU7QFZjbmSMJyXY0TDErOFuMOjf20b6arcpEqse1V3IKrb+nqqA2azboRm3pEANLAJw
	iVTwK3qwGRgK5ut6N/Znv20VEHkFUsRAZoOusrIRfR5HFDxlXguAdEz8M/hxXFYYXqOoaCYy
	6pJxTjy0Y/tIfmS/g9Bnp8qg9wsrsnk0+XRnDVPak++G3Uq9tJPwpJbyO0vcqEI3vAXkAB7X
	VXLzvFwi66RrsPUoDkuzj+aCNumtOePDOCpXQGPpKl+l1aYRMN/+lNSk3+1sVuc2C07WnYyE
	gV/cbEVklPmKrNwu6DeUyD0qI/bVzKMWZAiB1r56hsGeyYcAEQEAAcLBXwQYAQIACQUCUft5
	TAIbDAAKCRAu2dd0/nAttYTwEACLAS/THRqXRKb17PQmKwZHerUvZm2klo+lwQ3wNQBHUJAT
	p2R9ULexyXrJPqjUpy7+voz+FcKiuQBTKyieiIxO46oMxsbXGZ70o3gxjxdYdgimUD6U8PPd
	JH8tfAL4BR5FZNjspcnscN2jgbF4OrpDeOLyBaj6HPmElNPtECHWCaf1xbIFsZxSDGMA6cUh
	0uX3Q8VI7JN1AR2cfiIRY7NrIlWYucJxyKjO3ivWm69nCtsHiJ0wcF8KlVo7F2eLaufo0K8A
	ynL8SHMF3VEyxsXOP2f1UR9T2Ur30MXcTBpjUxml1TX3RWY5uH89Js/jlIugBwuAmacJ7JYh
	lTg6sF/GNc4nPb4kk2yktNWTade+TzsllYlJPaorD2Qe8qX0iFUhFC6y9+O6mP4ZvWoYapp9
	ezYNuebMgEr93ob1+4sFg3812wNP01WqsGtWCJHnPv/JoonFdMzD/bIkXGEJMk6ks2kxQQZq
	g6Ik/s/vxOfao/xCn8nHt7GwvVy41795hzK6tbSl+BuyCRp0vfPRP34OnK7+jR2nvQpJu/pU
	rCELuGwT9hsYkUPjVd4lfylN3mzEc6iAv/wwjsc0DRTSQCpXT3v2ymTAsRKrVaEZLibTXaf+
	WslxWek3xNYRiqwwWAJuL652eAlxUgQ5ZS+fXBRTiQpJ+F26I/2lccScRd9G5w==
Organization: Red Hat
Message-ID: <a6cff6e3-afd1-6c75-5c5d-208a803d7219@redhat.com>
Date: Mon, 14 Jan 2019 09:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190111140857.4211-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 14 Jan 2019 08:46:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 04/15] hw/ide/ahci: Remove AllwinnerAHCIState
 from "qemu/typedefs.h"
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pLAS7A3CAgHa

On 2019-01-11 15:08, Philippe Mathieu-Daud=C3=A9 wrote:
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> Files requiring AllwinnerAHCIState already include "hw/ide/ahci.h".
>=20
> To clean "qemu/typedefs.h", move the declaration to "hw/ide/ahci.h"
> (removing the forward declaration).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/ide/ahci.h   | 4 ++--
>  include/qemu/typedefs.h | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
> index b7bb2b02d6..b44e3000cf 100644
> --- a/include/hw/ide/ahci.h
> +++ b/include/hw/ide/ahci.h
> @@ -73,13 +73,13 @@ typedef struct SysbusAHCIState {
>  #define ALLWINNER_AHCI_MMIO_OFF  0x80
>  #define ALLWINNER_AHCI_MMIO_SIZE 0x80
> =20
> -struct AllwinnerAHCIState {
> +typedef struct AllwinnerAHCIState {
>      /*< private >*/
>      SysbusAHCIState parent_obj;
>      /*< public >*/
> =20
>      MemoryRegion mmio;
>      uint32_t regs[ALLWINNER_AHCI_MMIO_SIZE/4];
> -};
> +} AllwinnerAHCIState;
> =20
>  #endif /* HW_IDE_AHCI_H */
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index c026229573..3a5ca74bd3 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -8,7 +8,6 @@
>  typedef struct AdapterInfo AdapterInfo;
>  typedef struct AddressSpace AddressSpace;
>  typedef struct AioContext AioContext;
> -typedef struct AllwinnerAHCIState AllwinnerAHCIState;
>  typedef struct AudioState AudioState;
>  typedef struct BdrvDirtyBitmap BdrvDirtyBitmap;
>  typedef struct BdrvDirtyBitmapIter BdrvDirtyBitmapIter;
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>
