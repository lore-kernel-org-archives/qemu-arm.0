Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3457220lff;
        Sun, 12 Jan 2020 15:19:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTG0PR4PUAU5Gl/h0wWMDk2CaxyisLrWaVawMXoS8MBlyBnKt8ffl16yv1d+MsmAzyuBwB
X-Received: by 2002:a05:6402:1a5b:: with SMTP id bf27mr14764200edb.243.1578871151985;
        Sun, 12 Jan 2020 15:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578871151; cv=none;
        d=google.com; s=arc-20160816;
        b=Tt515dj0o8eGDD1FZcBMFeb6nxCZnOqopTCYwV/tcnXYlte1PvadfA/FYumy0fHQ6f
         4XptSWx8GeAP+wCqHSVVgn258f1sToVJVaLG+9xqvwjUbry3f5NwjuCTTyi4AZOkx/gp
         oDQgfICemjZdUWkJAAz2irNE7zlWqfl9BPRe9SPm7cP0KpWpM2SJBSDN7JT5adN1H6U2
         HsA0aHffQ1S+z8m0s7T79uwaS+dlYxLBcS0eiJ9mKxz7oPyjJ2DRyUSzVC55Z9IRphOw
         z6eiOuOJs3jMHWZYSMTH08FhbO2Tos1ETLG5LCRunQAu0XISNpjSTEVFZUqOFQOu1ew+
         oGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=zx26KD5Pz02YJ+yg8O2oz5kKMQr/WceSgZS/j9AYF68=;
        b=Nm3YXBk/RlA2z6Ybhnu7mFARUfXT8/h2Si0lIBR1revuAEeww901ZwCSXMfMhiqs7D
         HhmC7OMTAkYSiGWNtpEycGXcgeZ0pMQ4NitKaabZn/1bQn5bf6m6RG0QIgRU2LrPzPAL
         YO315ou8ORACgil9XiN+grjhGSZfRG8Jw2718mQ2u/udu5fff+QdhgkPaVEaPkS97fvn
         AhFBvX6FYPoTuVEUmFbjiyH0V3PowyH1sXfkv+wIqGyYePZQPBTCn5RwUDvEnfsGv9QF
         vbD9YuG1IAFIfbitawxjEHBMjZgxRFvXJPXtt/EnKzfNcCJ0jFObGpIJB+vchAtCpS3z
         OE8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b="KcW/XsGE";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=LAm65t9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22si4539726edv.509.2020.01.12.15.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2020 15:19:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b="KcW/XsGE";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=LAm65t9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqmVi-0006As-T6
	for alex.bennee@linaro.org; Sun, 12 Jan 2020 18:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iqmVS-0006Ad-VN
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 18:18:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iqmVR-0000S2-Vo
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 18:18:54 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37379)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iqmVR-0000HR-IB; Sun, 12 Jan 2020 18:18:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6817A2015D;
 Sun, 12 Jan 2020 18:18:51 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 12 Jan 2020 18:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=zx26K
 D5Pz02YJ+yg8O2oz5kKMQr/WceSgZS/j9AYF68=; b=KcW/XsGEt0FCMmLJiEYN4
 91vO/qsCjwaqId83f4EtJ1ttPfWFoL7WvI2Imv6Le8kWOj6eNqfro6iRBP48yGQz
 dql4fQSkhEea4PAIXPPqtpbb9tkfNQf766CFUtYsIT4dtBHmOhDpbW46xNkEaWG0
 57JksM/x3maOjtqM2AYrrVHgn7TkGI04u2wJLCpo9g0PbZsaT1BfYrGLgkvEIhPQ
 C7x9ZMrw/0N9LnUW89ZVMwCNgeJ5RKKshGgsqjhA4StgWKjI9OBX34Y+kwtLq/JA
 jYHNGpV5xDKPjKp8CeBp5pTGZt8MjcPVznuIxr8dovy0RRnqnqTdGFvrzHj3hQwc
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=zx26KD5Pz02YJ+yg8O2oz5kKMQr/WceSgZS/j9AYF
 68=; b=LAm65t9FtOdokN5o5SO3VP4eBJ8f3+gtDgGq0yq8ax3USZ+R860GvTtxt
 JKas0KABzEeZueublkI+j/7ilu6MNuDX/CQB6LOEbkFFJsmXGFR4z92FWiOtQC4D
 dBjHKIxGhIM1EAMJJRumkQMLoIDsuwKcKH6DYLyE/wm06C1N3tFhtIOfOMcAjgh/
 RZ8LDEmUWPbA4c9YJ4JBMLLgNeGmBqCEwlnhVHnE9ie3I7mZ6ppJOQQITiRQa3MN
 WQXTlaD4/WsiV8fVKMQhhdu570y3Td0sAOCJmyIE0J3eE0XOI+70Vc5X9dvIc29Z
 pzL2rZWcgG9P6H1g9aWLV4VyLkdLQ==
X-ME-Sender: <xms:WqkbXqH3MtBqPHeKol5Y8SmMuYOMnm_1TbDJroXgtN-EQ4QTo-NbHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:WqkbXnoCRRhH4AizuF5xBoSICJ4nJlJy8mw5z2_U5sB7dc5Mmb-gxg>
 <xmx:WqkbXm6zEnmBrhyyXuCipCY9JRqEuHlhB2L5tGXQNzISlleR1BSmbw>
 <xmx:WqkbXl7ZJgAfHoL-ADMPRFYtfAXZebkPm2MGA06SJDfjIrHqrwFfyw>
 <xmx:W6kbXt9pZlGI1kky6NvHOHb89Ki_bmDeQB9a_FLKo86Djbz2Fv1NUw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 97B0AE00A2; Sun, 12 Jan 2020 18:18:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <114b0ca0-3e98-43f5-818d-f69df5a0c5c9@www.fastmail.com>
In-Reply-To: <901d2dc7-f8ed-bbca-b587-19fce5fed631@kaod.org>
References: <20200107073423.30043-1-clg@kaod.org>
 <20200107073423.30043-3-clg@kaod.org>
 <a7c45303-e624-d7aa-df6f-e03f26b3cba7@redhat.com>
 <901d2dc7-f8ed-bbca-b587-19fce5fed631@kaod.org>
Date: Mon, 13 Jan 2020 09:50:53 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/5] hw/arm: ast2600: Wire up the eMMC controller
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.25
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3BMmf10W6l1n



On Fri, 10 Jan 2020, at 22:26, C=C3=A9dric Le Goater wrote:
> >> +
> >> +=C2=A0=C2=A0=C2=A0 sysbus_init_child_obj(obj, "emmc", OBJECT(&s->e=
mmc), sizeof(s->emmc),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 TYPE_ASPEED_SDHCI);
> >> +
> >> +=C2=A0=C2=A0=C2=A0 object_property_set_int(OBJECT(&s->emmc), 1, "n=
um-slots", &error_abort);
> >> +
> >> +=C2=A0=C2=A0=C2=A0 sysbus_init_child_obj(obj, "emmc[*]", OBJECT(&s=
->emmc.slots[0]),
> >=20
> > Single block, so use "emmc" instead.
>=20
> Andrew, how should we call the objects in the slots ? "sdhci" ?=20

I think that's the right way to go, but maybe we need to rethink the nam=
ing at the
controller level.

Andrew
