Received: by 10.25.21.156 with SMTP id 28csp405084lfv;
        Tue, 12 Jul 2016 07:19:47 -0700 (PDT)
X-Received: by 10.129.54.16 with SMTP id d16mr1684707ywa.41.1468333187566;
        Tue, 12 Jul 2016 07:19:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si2492539qku.337.2016.07.12.07.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 07:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMyXK-00033J-Uf
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 10:19:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMyXG-00031j-Ms
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMyXF-0007rh-PX
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:19:42 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMyXF-0007rP-LZ
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:19:41 -0400
Received: by mail-vk0-x22d.google.com with SMTP id f7so23620292vkb.3
	for <qemu-arm@nongnu.org>; Tue, 12 Jul 2016 07:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YvOeYOdrBDLzxEC0AaOrsVo/7ylEpVklLQvHi3T4L1g=;
	b=WXX5OXlqybBfyuuia4tuuqhSwAnDs2FFJlGC9Zja8hirS7oulRiGd3h78STG4EJBdm
	+9TpUmnBHjhkU6GZzoqOIGO65M4zAkJ8xqDc94SYkIV0QlGHYB4O2u1VO2ulLJRoZks3
	VfYyEbXSVAREVfszUuJWtz5Kwik5Q0kyJxhg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YvOeYOdrBDLzxEC0AaOrsVo/7ylEpVklLQvHi3T4L1g=;
	b=IhJ5lXH3C301sV2KkJrdqSSs2o0QX39NevzdUFJP0FRwaszvoW5w+6DORo5dK6tGfL
	3+7twzxTCmFwBrpFxvYYGZlLdseL9fxKRWKA3x7BzlXm4XRw6+2AMtMwfcWp4fNQw0ZD
	4BANb15h3HkepMckg5CmG9Vn7X4XcE2yY84F6XXSqQcmMPvr7RJIDrTqUFlJsT7Qo5lx
	cllWP8c5MIKYWa4BZkA3My72WtkdmgdH2yEDjy9d5rQVQfaF/0NBjH/FffSuVBhhJ8eU
	TRZjb55RbZc67kfpbq3C7/H5hhJLf6CepCCfNsBZsPoNcD3e7PzQrUNXh31SLOCQSqnS
	02Ig==
X-Gm-Message-State: ALyK8tINpHvT3h7nSeuHnJMNAI7CcNYqA+v96vRm0HS4WhAN76jqB+aP/1iWc0xCzDtHfkNSKC7PUzUeN/rKVwhR
X-Received: by 10.31.248.73 with SMTP id w70mr1222076vkh.30.1468333181339;
	Tue, 12 Jul 2016 07:19:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Tue, 12 Jul 2016 07:19:21 -0700 (PDT)
In-Reply-To: <1467994016-11678-1-git-send-email-clg@kaod.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2016 15:19:21 +0100
Message-ID: <CAFEAcA_pvYaFuo=U_LjnD6-+2iHzbaAahjTMxf_X41+BGDR0vA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH 0/5] ast2400: some cleanups and a simple
 memory controller model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+6SaIxseArb

On 8 July 2016 at 17:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> Here are a couple of cleanups and a very basic memory controller model
> providing a configuration register. This is needed to determine the
> RAM size of the SOC, only used by U-Boot as of today.
>
> Ultimately, we would want to add more support for U-Boot and be able
> to boot from flash 0 but the device model of the m25p80 object is not
> designed to use a memory region. And so, it is difficult to define a
> rom device for the flash backend.
>
> Some initial patches were proposed but they are not being friendly
> with the object interface. Work in progress.

Hi; the release process is now at the point where I wouldn't really
want to put this into 2.7; I can be persuaded if you have a solid
justification, though.

thanks
-- PMM
