Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp326691wrt;
        Sun, 10 Mar 2019 23:52:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHyLNN+HkkKBd9JiPCKnExjGW6CywMk/f0q21sssZ34vO5Mpd4NQQTpzEgqwVw5e3UrWcY
X-Received: by 2002:a25:bdcb:: with SMTP id g11mr6454390ybk.227.1552287143979;
        Sun, 10 Mar 2019 23:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552287143; cv=none;
        d=google.com; s=arc-20160816;
        b=PDHN0B2VdCfPX3cOSyWNP/8CavccGSiPUpKj3Zsbcphdv+NtLzZAHGkC9ZFRXd4Qfd
         KW55h304c5k3WXNZ9Sc+FCG0LcHb2OL7ph6yDPAttqyFamtIIs+TCYDXsqey5Fk6GAQQ
         Tc7T/vIQDgzLsCNBHAdukFry/nK0Sp9vwNqAGduwKeNfNxgSd+wB1MSntF2ZYeh8MLsf
         6N74dKujd8LR7o5XqfI/OeG0soG4yc4uL7PubttfRZ74nx1i9by3d7oXS/La7t1uAZ1v
         7LYh1Zkg3dNewVXVSoSgKhDTdmZzfnB9YjsXU482xAe6mDuycpiSu5YT9XCUqINTLy/b
         45pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=YoaXxDgozkiDHI5deVYXGfKDh49Xx2VXdZg4sqrgiag=;
        b=M6/XolnQ4yZSsku+1lV2JRR/rqDHBaYpXpyHQBrDTxyr87Spqur9YtQoUZgwqQCRz7
         N2DJ7idnUHWy+AsVZ4uhb5eKsVeGNapIrPAm8ucBz1T87h+oJCeAldW8xJHh45KMOqAg
         Cbbfk+btXsQ4/v3ZlABFt+rilAGnWyg1YT6LEOIj5rqepIs3JOjofkGIcN3LHfhcM6kg
         T6gJO7qi8+ubtrpLQs8z84l2gM+qEuzAIMGhUF2ZW0C/dhEq81rpex9g2zvqFN7DrQge
         dOJXHJQ2OSDLm552/KDl8EVtgRRZeKHnzgUovbqfbmwW9zt/6ffSzrAkJtceoNTGW4rh
         3pgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si2372086ywm.332.2019.03.10.23.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 23:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3EnP-0002h1-AD
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 02:52:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h3EnA-0002Wp-RC
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 02:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h3EXh-0004FR-00
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 02:36:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h3EXg-00049p-Md; Mon, 11 Mar 2019 02:36:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DDBC307E059;
	Mon, 11 Mar 2019 06:36:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-155.ams2.redhat.com [10.36.116.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5109260851;
	Mon, 11 Mar 2019 06:35:53 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	yang.zhong@intel.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
	<1551968334-18982-20-git-send-email-thuth@redhat.com>
	<7e477c03-59d0-f6a4-a557-a8f5740d259a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <8cf27b8a-2868-12e7-9b21-483884067029@redhat.com>
Date: Mon, 11 Mar 2019 07:35:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <7e477c03-59d0-f6a4-a557-a8f5740d259a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 11 Mar 2019 06:36:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 19/29] hw/arm: Express dependencies of the
 MPS2 boards with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hUHX2Wccgf4O

On 10/03/2019 22.33, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Thomas,
>=20
> On 3/7/19 3:18 PM, Thomas Huth wrote:
>> Add Kconfig dependencies for the mps2-an* machines.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  default-configs/arm-softmmu.mak | 20 +-------------------
>>  hw/arm/Kconfig                  | 18 ++++++++++++++++++
>>  2 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-sof=
tmmu.mak
>> index b6f3d60..b8509fd 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -27,6 +27,7 @@ CONFIG_Z2=3Dy
>>  CONFIG_COLLIE=3Dy
>>  CONFIG_ASPEED_SOC=3Dy
>>  CONFIG_NETDUINO2=3Dy
>> +CONFIG_MPS2=3Dy
>> =20
>>  CONFIG_VGA=3Dy
>>  CONFIG_SSI_M25P80=3Dy
>> @@ -35,28 +36,9 @@ CONFIG_IMX_FEC=3Dy
>>  CONFIG_FRAMEBUFFER=3Dy
>> =20
>>  CONFIG_DIGIC=3Dy
>> -CONFIG_MPS2=3Dy
>>  CONFIG_RASPI=3Dy
>>  CONFIG_NRF51_SOC=3Dy
>> =20
>> -CONFIG_CMSDK_APB_TIMER=3Dy
>> -CONFIG_CMSDK_APB_DUALTIMER=3Dy
>> -CONFIG_CMSDK_APB_UART=3Dy
>> -CONFIG_CMSDK_APB_WATCHDOG=3Dy
>> -
>> -CONFIG_MPS2_FPGAIO=3Dy
>> -CONFIG_MPS2_SCC=3Dy
>> -
>> -CONFIG_TZ_MPC=3Dy
>> -CONFIG_TZ_MSC=3Dy
>> -CONFIG_TZ_PPC=3Dy
>> -CONFIG_ARMSSE=3Dy
>> -CONFIG_IOTKIT_SECCTL=3Dy
>> -CONFIG_IOTKIT_SYSCTL=3Dy
>> -CONFIG_IOTKIT_SYSINFO=3Dy
>> -CONFIG_ARMSSE_CPUID=3Dy
>> -CONFIG_ARMSSE_MHU=3Dy
>> -
>>  CONFIG_FSL_IMX6=3Dy
>>  CONFIG_FSL_IMX25=3Dy
>>  CONFIG_FSL_IMX7=3Dy
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 743c78b..32c8663 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -308,6 +308,13 @@ config ASPEED_SOC
>> =20
>>  config MPS2
>>      bool
>> +    select ARMSSE
>> +    select LAN9118
>> +    select MPS2_FPGAIO
>> +    select MPS2_SCC
>> +    select PL022    # Serial port
>> +    select PL080    # DMA controller
>> +    select TZ_MPC
>=20
> Can we move TZ_MPC to ARMSSE?

Oh, right, armsse_init() uses TYPE_TZ_MPC, too, so it should be moved.

 Thomas
