Received: by 10.28.4.212 with SMTP id 203csp1655442wme;
        Sat, 21 Apr 2018 02:34:47 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49TGfQUTfIPI2Ybb+OJRKN18vanfY29/U8bi3hIv141L5OnwuqsX55U82IX3xOpVMKHMJxL
X-Received: by 10.55.19.35 with SMTP id d35mr13500978qkh.292.1524303287059;
        Sat, 21 Apr 2018 02:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524303287; cv=none;
        d=google.com; s=arc-20160816;
        b=CL7QrO5Vio6n+t3UaXCQhZOeQMsNAvDwcaIXVKMDGOvAEwV5UXKASGYPwVfSlGCpRG
         CR/wkO7AQTNGoxwZ4mAjljstf2OPD8qQcU+Yl0V51dhcGeSS8joCMRMu/gA2sylIL+w6
         VyLWvUXXa5XtHBZoD+yz0n5pZgvgGsNxo9h1zNLfh/jN5Q0h/Xr5olmoJ+BX/G91FJnc
         71hErb3Xpw7ILWpjm523WuI45FjsQgp58Px8y0RxksCIhP7DFqb8rFIULwq1splBkA7G
         K6veQ7DLxYdGFg6//ye+PBKcm5hGx6Ti5AhOa4IJ5GPhBv0q2ihEYb6kG9H1JRspe6d8
         Q7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=+EzZaBsN5R3Hr6onFaS0q/BZ2GrU7eZH9qRDcaD4rSE=;
        b=Ch++yycig0Xnx91Ndq7iMo+lZaXRYoFu1h+QzLIFldXsAWSbtJ/tvIRddZnGTQ0q0q
         BJoiqszd35lB2Hmk7ls3aRuA+I02pVJEoRtobNN4dMUUMlT702xETWt8Ftz8Oq9d9y30
         nzN/2SS8BpxFj20TDWHD/RYa8gXHhY/BmL4jL+PzV5R4G89R7yAlDH9KJpHDvEyAMW1p
         fGL6w6V2bK3HA3wc/EMqbE6Y/Mklk+6PNw+pseF+rw/2YxDMtYsK2Tt+vqJprC8PG8U4
         RGJzm/EL33jnN7mvM8EpkrH0Lc582m0VmRFScXGLqdZgidZjH61I3oOV9B7yk5QNDjTX
         BunQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HSPUGoQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d36-v6si402680qtk.39.2018.04.21.02.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Apr 2018 02:34:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HSPUGoQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9ous-00051I-DF
	for alex.bennee@linaro.org; Sat, 21 Apr 2018 05:34:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9oub-0004z4-OP
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9oua-0001SC-T4
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:34:29 -0400
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:36485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f9oua-0001Rk-Nl
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:34:28 -0400
Received: by mail-ot0-x235.google.com with SMTP id p2-v6so12192049otf.3
	for <qemu-arm@nongnu.org>; Sat, 21 Apr 2018 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+EzZaBsN5R3Hr6onFaS0q/BZ2GrU7eZH9qRDcaD4rSE=;
	b=HSPUGoQ6JjIGfbgb+D3Vy0TAZijgQJyv827gJtVVMj1MWNb+rDEBCM9hTWZCutOLhc
	32xJf2ELNYmzZIgu7VunKiutEekhebw9nZSqetQv0MAdRBo7PbUEWevxXycb/N/4d/or
	z54DI/uqbVaJ2RmgjQP/zbPqxNS4yi9tMQddI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+EzZaBsN5R3Hr6onFaS0q/BZ2GrU7eZH9qRDcaD4rSE=;
	b=I0Y+4WCPaOfcB1yzHcsfRskDuo/lQJvaoiI9hphgOnoiDrx6xK2gy2rMaxuzh8BNSh
	83juloBaXKqtzVTviHM91v5IEhz/btoHwTgRi8+Rx20QZPGXiXUgoh3KuJ/ascj7fIjp
	vKrAIcJdkRStL4jx4L4UE1wkTxX5eMq+D5asPMRW8s8hZ5OB8TIBiOjEp9TTP8s6nZhW
	2SCuoUyrbc8b0kEWqlSWwLgO9bA82EpfxmGeRkO7nSJudkrIjDFuV6BRe7tjUeyT/dTN
	q+/yZiMnMo8v+oJphbQKMoIxQFhW4nFDfOyg2mbDcgaLQRc6iwRKECWOD1FHzAkqT9NF
	Kxag==
X-Gm-Message-State: ALQs6tB8hhcfmRn4ehH8xxhiQy3kzvtzYQQQA3cTzVauDWJMg/O3tS3G
	RLRvr89/s9+SYjqJ8lEIWo535yJXF3csXiIDChzHjg==
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr3819779otd.210.1524303268077; 
	Sat, 21 Apr 2018 02:34:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Sat, 21 Apr 2018 02:34:07
	-0700 (PDT)
In-Reply-To: <f80b3748-12d4-de8b-1661-e07a7d33b60a@kaod.org>
References: <20180420124835.7268-1-peter.maydell@linaro.org>
	<20180420124835.7268-3-peter.maydell@linaro.org>
	<f80b3748-12d4-de8b-1661-e07a7d33b60a@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Apr 2018 10:34:07 +0100
Message-ID: <CAFEAcA8g_qcXj7ErMNODexU4k2k56nYUSzoh3WX06mZTVRMLLg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/arm/aspeed: don't make 'boot_rom'
 region 'nomigrate'
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
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ik5yBi1PsBY

On 21 April 2018 at 10:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 04/20/2018 02:48 PM, Peter Maydell wrote:
>> Currently we use memory_region_init_ram_nomigrate() to create
>> the "aspeed.boot_rom" memory region, and we don't manually
>> register it with vmstate_register_ram(). This currently
>> means that its contents are migrated but as a ram block
>> whose name is the empty string; in future it may mean they
>> are not migrated at all. Use memory_region_init_ram() instead.
>>
>> Note that this is a cross-version migration compatibility break
>> for the "palmetto-bmc", "ast2500-evb" and "romulus-bmc" machines.
>
> Migration does not work for these.

Well, at least we're not breaking anything :-)
Do you know why migration doesn't work?

thanks
-- PMM
