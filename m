Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3388791wrt;
        Mon, 8 Oct 2018 05:27:16 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63dHLD1W0rM/YvynFM0htlc8l+emOG1g54DDr6x7txADakGdO+arNb4tcVLOOjIeXXd1N6t
X-Received: by 2002:a37:a252:: with SMTP id l79-v6mr18822889qke.0.1539001636132;
        Mon, 08 Oct 2018 05:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539001636; cv=none;
        d=google.com; s=arc-20160816;
        b=ei497O786lcZTz2g47LCbTs8pDSHhXXSrePV4T3+fvG2ci6ikz6I/kv59Moao4A7F4
         /CCWNooefRSV+VZ1xEGC26DVLuodQKlfO8Z/BmEhQWFzqduUTDBuNtm8BdXKzVbRLnP/
         PB4YAMJmqvljFwKpH2O9IJuboZTt1fPSbwwdUuJhrBgOksm49r940ha9oQpcIYwvqHeS
         zNFk6ItOJBp9yv2IxemC0AFUP/aWIRpb//nvNAjmaBOzfjeg7ADNfSAGL/ODlYG5trTW
         kAjGJwERZoCSngh2+GZChYtQZNPbh1qZDWXdeHibe3SAvv0wUBQsDbEWTjwOE6/57x7n
         2eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=iB/8W6A7neIQ4/h/dtUgr5oIaXQC9BnryAaxoSzwOG8=;
        b=Zq0XpPeoATkpxqKZKVImb52vWF5rkxSpvKKsDfSYl7eeOroOyIiRToiNJz1TlsVWUS
         /5o0lEiU8W9LD1CIJPszeUg9CnNj1MmNo0liB2nbg9OBi9rNidY03/w56KO20tjPalLY
         gcOxpRsNBZG3TDYgst4XWAub43sDe0BCxEjsUNE3gpBJOQLJsrtIzJAsnkAHdjOyyZb+
         esJlyOdad90K8HNBBjE3m1CSinoG80soWUXfsmgWsoQx8IZuVGjgb6OKRZhp3phwauNj
         8swG3QDvQufEbhq7EVAcm2WwZHHjFOjv1K21DQk3UD5P1mNIwlwFhRXCfgs/z7SG7n0L
         aXsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FJWyg6Z9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c91-v6si5274994qkh.242.2018.10.08.05.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 05:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FJWyg6Z9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9Ud1-0002fT-KY
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 08:27:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9Ucn-0002eH-DS
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:27:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9Ucm-00030I-C0
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:27:01 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9Ucm-0002ze-4p
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:27:00 -0400
Received: by mail-ot1-x344.google.com with SMTP id c32so951004otb.8
	for <qemu-arm@nongnu.org>; Mon, 08 Oct 2018 05:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iB/8W6A7neIQ4/h/dtUgr5oIaXQC9BnryAaxoSzwOG8=;
	b=FJWyg6Z9J8CD1WMQ6FdpCYAFz1K9hqbzgcDeS0aq9rCc1q/0H3nN52E/095sbzmiTS
	onrxFxYfy3m+4xHoVb5nFj5DBO2EayR+a5U6/TjB7VzmspF9oIbaAotno2TJzHSS7VCH
	U0CvOMtPLChYSSa4L+MMDKl2kO9STYMmioBak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iB/8W6A7neIQ4/h/dtUgr5oIaXQC9BnryAaxoSzwOG8=;
	b=kvMT8sbOQwyDr784aMNBsFUOWQ2Hwok5m9qm5sZRrDzYO7UIIOZ1fB0uINJ8Sr73ZC
	d6X0AkmMcPIpWPw/Qr3ZtJ/XlFsliZl+27OD+jGkywj6MzL0OzakBHDl78ROJ4upNCBe
	cKPgP/PsQ6PudIZKtJnmgkBXIUD4jUYqq9qqnfkm0+f5hWGxrLQr4XKZvNoIOPFtTax/
	zf8+QPYlhWynIhdsnPbZ5Bq93tc165LW79rfmOGlahaPwy0KOab+ZC/5RIcgJ2sfxLau
	eiV5MqkJvgDIrr8Rl6RndU/O9fME5SxcGbeppkeZgp+dni+lsU5J1BtGZ3y4bFsNRPEz
	Oymg==
X-Gm-Message-State: ABuFfog8tYYJ4iYy/zGRFjdLGOCB8hjsbaIV0nbUhaJ3LxRvWpXev4EQ
	ad+z7ceJXa+v+AvHqu2HnG6UJzYJ3bWrKNnk2JYneQ==
X-Received: by 2002:a9d:1ea3:: with SMTP id n32mr1784873otn.352.1539001619390; 
	Mon, 08 Oct 2018 05:26:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 05:26:38 -0700 (PDT)
In-Reply-To: <0ed94c1e-4c58-d1ac-6ceb-c851cc089cec@redhat.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
	<0ed94c1e-4c58-d1ac-6ceb-c851cc089cec@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 13:26:38 +0100
Message-ID: <CAFEAcA-SRO6Jod2TyRuEiBH+2G12hKKEiYPfBVaVvTvvMvcHgQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 06/12] net: cadence_gem: Add
 support for selecting the DMA MemoryRegion
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DhVn+MbjtdV2

On 6 October 2018 at 00:14, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>=
 wrote:
> Hi Edgar,
>
> On 03/10/2018 17:07, Edgar E. Iglesias wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>
>> Add support for selecting the Memory Region that the GEM
>> will do DMA to.

>> @@ -1500,6 +1506,13 @@ static void gem_realize(DeviceState *dev, Error *=
*errp)
>>      CadenceGEMState *s =3D CADENCE_GEM(dev);
>>      int i;
>>
>> +    if (s->dma_mr) {
>> +        s->dma_as =3D g_malloc0(sizeof(AddressSpace));
>> +        address_space_init(s->dma_as, s->dma_mr, NULL);
>> +    } else {
>> +        s->dma_as =3D &address_space_memory;
>> +    }
>
> This is not the first time I see this if() block.
>
> Should we consider refactor it?

Given that there are only three users of the device in the tree,
I think the nicest cleanup would be to make those callers pass
in a suitable MemoryRegion (which could just be the system memory
MR), and make the "dma" property of the device mandatory to set.
We can do that as followup, though.

thanks
-- PMM
