Received: by 10.28.91.67 with SMTP id p64csp1329268wmb;
        Thu, 15 Mar 2018 05:11:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvo1iMDC5YK66L/5oEZLoWykCwOxjMr4eWw8S0GbJ5+vlyicx8FV92slvFFI0sJV/umFI6g
X-Received: by 10.237.57.106 with SMTP id l97mr12745185qte.198.1521115877879;
        Thu, 15 Mar 2018 05:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521115877; cv=none;
        d=google.com; s=arc-20160816;
        b=btCqHWo1B2dDVjkngptK33wevnIDuDd6B9gnry4ICkXdYD2rZURZbaH6rfijUy0k3h
         n7z+PUNhQlgWha5yj5ifzsbxSSP1x7/zeW65uGrsZ2q/eFcY1dmn2mv8Xwo5qxvxJQ1o
         GeHgMj8IOsFlYyahde0eGz+VVF+eX/WuNjzsbqdglVD5hFC7IhrwWILFKsU6kry6ngNp
         eqelLddCqAjIrbTb6lzYQVnczffCkq8mKvh3CUE2KPawUEl3eBSjgJQUYLGvtHmMcXQl
         g9C7QEP/+4HOftxjZ5MF9gTEsrocE/dHdq0IxZDXiFOgV4ox9ET6J0a67TjXsCw9WluM
         zEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=kK/C11GzpNVG1whTEdN5i5etb3aIFJBQ4uf/HuDzZow=;
        b=WBouno3wbOMAk8spcggAJJeDzi8kpdg4aFLxc7KKg9Ns143+99keJ8UGLSUZZ/qHMX
         rbT10l2FlVig0C7DhffytLmDau7BV0hcY+xFylkQOaQwcHSrgNulgdELlmZjXtSXfiDi
         hR2AdyPVx8bPVxmOymQyjF9u3Fbyujnn0VvDs/j0mlD3t8I1KwOZrmuKn/XcZw+lDXDO
         SHnjZ/sq/cdCvTWHfN6A1gh20UebXDn2aBRNwpyNmKTI57SMpDxs67XavxnEWFmRdZMk
         Xup2MBrPcZppeJJeWqrbEvYGSIDROr32+S01GXcnaWugLv08reXBgSuQE3BiezJg/W1a
         3TJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nyj+4AjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k126si1794802qkf.323.2018.03.15.05.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Mar 2018 05:11:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nyj+4AjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewRj3-0006SJ-Bo
	for alex.bennee@linaro.org; Thu, 15 Mar 2018 08:11:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ewRiq-0006OY-7I
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 08:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ewRip-0000no-9R
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 08:11:04 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:52890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ewRik-0000hA-Su; Thu, 15 Mar 2018 08:10:59 -0400
Received: by mail-wm0-x243.google.com with SMTP id t3so9974741wmc.2;
	Thu, 15 Mar 2018 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kK/C11GzpNVG1whTEdN5i5etb3aIFJBQ4uf/HuDzZow=;
	b=Nyj+4AjKozrlgkabUweJ3G1aUr54R0e3pCgc3Q4odN7nR1RL1b+njYgDwvji3IbUOs
	kUo+X2XFHhvNgxnuGfbiRQzJR3pAEFA+6aP1q7H2eRyawF//+j3nfHfn6erh1LfS3VG6
	FOtY1ABiU6M9niRxkxljCbt73ow/9LZTcpFFyhgwOXG1dVmcOqGYVJ9EimtTkZpb8rSP
	bx9jZ0c8xnjCmxmhlqbVps4jRdCcsuLdmkgN5a0aAZMdchPEyI5EDSAqKSJubjMZLO9K
	/+5jKs1ZupW7hCIwCE7+rXA7tsqIIsH3uq8jV7JCKUT4XCUp3eLikZzojxuR3F0/AJ96
	iIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=kK/C11GzpNVG1whTEdN5i5etb3aIFJBQ4uf/HuDzZow=;
	b=BQibT9kWibF8+fnb1HVzHg2ulRh5DcP7Yh8q3fMo6kX53RFaAEgha6ri2yGqHR1n4Y
	F7RgULLqyrwbRoNY00aRX/aMdW8OGLc/NBX0IjBJLVMjzmFb5jr9KTjSidKBHuQ4OHCK
	5qp4Tl1HbHEi3igUxGC7o6EMTystOPY0q8Uljvn+L21WrXNaOpXscUGDjpfglBRyOsGU
	MkUFsqTiip+So2pFJV0vbfT+0bCdoDLwfQTRhWu2jk1fekG2+XKVafNwzsR7yKMnfOED
	tPN3kEZLj/dWatAWEHepFtlW+hEokWPKgOq3BGCQ/46ejz628UmTf90C1S9bgSt8+6fG
	eiQw==
X-Gm-Message-State: AElRT7Fw15kZXDPDl8JuJ8HM24f4K50ttiC1G42cpdV5HoNP6b74VQ9Q
	FLij67w2thvC3k1Osoj/SCM=
X-Received: by 10.28.183.9 with SMTP id h9mr4122744wmf.99.1521115857757;
	Thu, 15 Mar 2018 05:10:57 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65])
	by smtp.gmail.com with ESMTPSA id e6sm4528404wra.67.2018.03.15.05.10.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Mar 2018 05:10:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8d9b206b-3d30-5ceb-cf37-07cf5857afc3@amsat.org>
Date: Thu, 15 Mar 2018 13:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCH 7/9] hw/arm/bcm2836: Use correct affinity
 values for BCM2837
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gOnMLqxRkpzz

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> The BCM2837 sets the Aff1 field of the MPIDR affinity values for the
> CPUs to 0, whereas the BCM2836 uses 0xf. Set this correctly, as it
> is required for Linux to boot.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I don't have the datasheet for this SoC,
but checked Linux dts ("ARM CPUs bindings -> cpus and cpu node bindings
definition" from doc/Documentation/devicetree/bindings/arm/cpus.txt,
then arch/arm/boot/dts/bcm283[67].dtsi). This might be useful to add in
the commit description.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/bcm2836.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 07d2705f96..7140257c98 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,14 +25,17 @@
>  
>  struct BCM283XInfo {
>      const char *name;
> +    int clusterid;
>  };
>  
>  static const BCM283XInfo bcm283x_socs[] = {
>      {
>          .name = TYPE_BCM2836,
> +        .clusterid = 0xf,
>      },
>      {
>          .name = TYPE_BCM2837,
> +        .clusterid = 0x0,
>      },
>  };
>  
> @@ -58,6 +61,8 @@ static void bcm2836_init(Object *obj)
>  static void bcm2836_realize(DeviceState *dev, Error **errp)
>  {
>      BCM283XState *s = BCM283X(dev);
> +    BCM283XClass *bc = BCM283X_GET_CLASS(dev);
> +    const BCM283XInfo *info = bc->info;
>      Object *obj;
>      Error *err = NULL;
>      int n;
> @@ -119,7 +124,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
>          /* Mirror bcm2836, which has clusterid set to 0xf
>           * TODO: this should be converted to a property of ARM_CPU
>           */
> -        s->cpus[n].mp_affinity = 0xF00 | n;
> +        s->cpus[n].mp_affinity = (info->clusterid << 8) | n;
>  
>          /* set periphbase/CBAR value for CPU-local registers */
>          object_property_set_int(OBJECT(&s->cpus[n]),
> 
