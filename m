Received: by 10.25.44.15 with SMTP id s15csp3551908lfs;
        Mon, 31 Jul 2017 05:22:51 -0700 (PDT)
X-Received: by 10.55.33.195 with SMTP id f64mr21461472qki.208.1501503771527;
        Mon, 31 Jul 2017 05:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501503771; cv=none;
        d=google.com; s=arc-20160816;
        b=AVZJqQ4Na6/yboxZr7d4E+o2vbUcnOAUJBY7DgMsZF4aPUUaXaWhP7wpoDmiRC1g3l
         jiy7BHfHmKURjPrYNXvDjv62NusdwOtbbnWc9PYbSO/ypR4/x6osixrHCwrPZob28rmO
         s/6tAlgmcO90eWnfMTyCZc84ggx96IW/RWfGVx+4skNL2WANXDaD3Mr4CmPWpIJKqGSb
         PaZmvnFAeAOvQ0b4lHebp8gYvOdgXyDMR074LxeQ7BL2DDMOYJ1nMe27R10IQPbycUzr
         NHyp6Y1N0Juq1ORleMny3EiePRR+AZyB+OooINDeKdLOCVfKGxX7vO8/oUtvOErWbAM/
         3+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=FrxnHF6zLxiXhA1H4l2Bknv7f0UL21cr0AswuBAQ8ys=;
        b=v1CWSqdibe9m5I5a1c4a81GJTJ9vV2hWBa30A3vrwlECUnkrSEu2NPx4aMRjJJ7qVa
         NHV7lqUW7vTJfjQic682PjfrBd4S4GxRA/nqdTU/L/2jG4eJnOmlEexJBX5TEUFI6bLw
         s4BWmdumk5I+8ma70KLumVTdCa0f04NXRslSVzValr+FTBzfL9c0U9Ae4YearCk24Mqs
         6mQ+w3NGNojkZcVtMwzlhBeozZ1reHUA7ix7TLJMTUhboxsvCrmeHNLa2NsAgIDOgSp6
         nemwYjZiMgiEouRIakQPNa9O7o3PvGIO+cqlhU5KeGvwJb4xqlXq3Hp6QJ2E+eriDKsu
         NmyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=JGKhkF81;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si18579134qkb.42.2017.07.31.05.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 05:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=JGKhkF81;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dc9ii-0001Lu-TV
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 08:22:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9hX-0000lt-4f
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 08:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9hW-0002mo-By
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 08:21:35 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:37759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dc9hW-0002mE-4t
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 08:21:34 -0400
Received: by mail-wm0-x22d.google.com with SMTP id t201so47692610wmt.0
	for <qemu-devel@nongnu.org>; Mon, 31 Jul 2017 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FrxnHF6zLxiXhA1H4l2Bknv7f0UL21cr0AswuBAQ8ys=;
	b=JGKhkF81q5nv+tjXdwbKITp+KiqjPleAjpTyw0KOUvtIdYPyyhiEBpZ0H7PdCYl/n2
	7e0wm/nRJnDZbC0YUzXZCwrPf8axDjeAYSlwaCVHkVfwz2SFaEDsJPV3TVPCdyB9tsOq
	/vcZuP+i0zOPhPtd9eL9U6hExNsZyB4geDE6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FrxnHF6zLxiXhA1H4l2Bknv7f0UL21cr0AswuBAQ8ys=;
	b=RGhtQOZR6LEvr+VFIamojLTId7XFBpWNg77GODkrPVgXms2w2oBWjKrgbl9TMeTOzZ
	ihWsOGNrSmonH+3VHbLEEDpOFMG/Ka/YkOJfcoFxkHO1TN/dzsZJdROhBNSI5PVYJ35l
	ZOJ/bCZbP0IvlEvTFOQqsVnMGMTOUQyJtpBT8AshNT0LZtIQp6xGvIPpkbE3uEDbXRZk
	N9KwNDOIhkAzigr3/sA9sOPKIDeSI4qVEAf3gHCKc9r1354psPQW7bmdg7rwZmRILfsn
	/lR3OiupPDGyrPW90r4yHjUiSq1tDS5j/rl9Zr6RDtWsiwnEuP2rQzAtqG89DqfpDO3Q
	T6vg==
X-Gm-Message-State: AIVw110y5LJ0yxowhyJjsq+Rfq19T9cnGyzee6D9fb7AV7lb29eGTGfG
	6zIkgnjTdRmX01vNtKoQJ7llQXHAkmOq
X-Received: by 10.28.161.3 with SMTP id k3mr11619979wme.155.1501503206451;
	Mon, 31 Jul 2017 05:13:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 31 Jul 2017 05:13:05 -0700 (PDT)
In-Reply-To: <20170729234930.725-1-f4bug@amsat.org>
References: <20170729234930.725-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jul 2017 13:13:05 +0100
Message-ID: <CAFEAcA96EWJqRpmcdr_zD+KyLfnn50zzfui+sNewb4AwWthVHQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-devel] [PATCH for 2.10] hw/mps2_scc: fix incorrect
 properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D8Sx4N84VUGa

On 30 July 2017 at 00:49, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> sorry, I missed them in my review :(
>
>  hw/misc/mps2-scc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
> index cc58d26f29..32be2a9df1 100644
> --- a/hw/misc/mps2-scc.c
> +++ b/hw/misc/mps2-scc.c
> @@ -270,9 +270,9 @@ static Property mps2_scc_properties[] =3D {
>      /* Values for various read-only ID registers (which are specific
>       * to the board model or FPGA image)
>       */
> -    DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, aid, 0),
> +    DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, cfg4, 0),
>      DEFINE_PROP_UINT32("scc-aid", MPS2SCC, aid, 0),
> -    DEFINE_PROP_UINT32("scc-id", MPS2SCC, aid, 0),
> +    DEFINE_PROP_UINT32("scc-id", MPS2SCC, id, 0),
>      /* These are the initial settings for the source clocks on the board=
.
>       * In hardware they can be configured via a config file read by the
>       * motherboard configuration controller to suit the FPGA image.
> --
> 2.13.3

Oops, nice catch. Applied to target-arm.next for 2.10.

thanks
-- PMM
