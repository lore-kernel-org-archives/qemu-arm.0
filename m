Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3082399lfg;
        Sun, 28 Feb 2021 15:07:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHFy73lv08csG8tiKgyx694r9OElL3IYprLhfmGG4lfP8NR0m/afxxlq8Zl+PZgLjI969C
X-Received: by 2002:aca:5381:: with SMTP id h123mr9348901oib.134.1614553662962;
        Sun, 28 Feb 2021 15:07:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614553662; cv=none;
        d=google.com; s=arc-20160816;
        b=FvWqDOebt/u5XEIM8QCJa/tc2mM0ByoHsl0PifMwgnPpJvNYlCyJ8oQZ8b+VqCYkYI
         SObYqJNne+l2kn23FV2yj8Vh2xrFqHOgBsjAT/XdM7NURtVaaTKMogqN4xM9BccLNxRP
         gt6QecDkf5XMBSDUAB3SBXq+uVzz/wGcswSfC+LkdhRuuoR/dtRYjT38zi6Simz/cDGp
         7XUDf5Esi6vLyppbfqibEGbEJ16kmcwWufFcmTM7Iy00x3yhzVl+4tduYK32nWcRvp1v
         Wjn66hHNRmCiCglrYPxk6rSw6L+fEkVH0JT3PjQNjRoXuXzXTxxUVKB0JIBKqupPUc/p
         5LuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=r8kganQMACnpTwhCNua7t0wdW1Szzoj5H7CTSvz4Fp4=;
        b=EFThUvxI8tsivta4o5ugBdUTqg+iwwJGqdfsVAfXWrf4ihF0PgGeTVHoR2pdRjCdHE
         TbQW6U7ylHkoj/yFxGhhs9osF4P/WpSJd8pkDrx1HcjHaSy5drpG7myPUOmxNcRNcD0M
         suIzzGLzfyeYP2yHD4wb4wmChiICPeX7wIhN46YUbZRLViRbkiyqVs6/zJC2HMdFq8y+
         LLwbbRclztTxSy0DAyzEoHccNdFZPmMpUbnbrYZe5CCV4hM5m1RnNYcj+j8gA7Obpd40
         6UECItUZL9hMVC/nh1bCszu1uZysYRnlWrBKIU+zyZGHwXlE3RpidDhrTe2QyNVyBCE0
         O24Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=Uv0BSG8X;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=KcQrn8Pv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si11901864oic.22.2021.02.28.15.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 15:07:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=Uv0BSG8X;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=KcQrn8Pv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGVA6-0000Sj-96
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 18:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGV9y-0000SZ-N8; Sun, 28 Feb 2021 18:07:34 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGV9u-0000nd-A3; Sun, 28 Feb 2021 18:07:32 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 646095C0093;
 Sun, 28 Feb 2021 18:07:25 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 18:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=r8kga
 nQMACnpTwhCNua7t0wdW1Szzoj5H7CTSvz4Fp4=; b=Uv0BSG8XNbytYunRlOG7f
 Sq1mIvLc9o5YbS1QUPZTqOt25zzFKPN/ftvKRslp1pGrNLmqyHzBNgH5o+EJiq3a
 yP60o9NHqijDyjjyxQ1Ouz4hqA0CgwuACYVjKL9p66nOwXlmDdv+PVm0s18fh96/
 D8AG2SE/uvEZIh8Lf325nn6YcQ1CAlfG2DS7iccqCwggK+RpG0mzCRWDcXx+l2uR
 C69u/onMkvwkz1cBsrpVFxRty4bjGK2G+a6kxwaJApHlOZ81JA7J7fKEi1/8C1KS
 UO3Fj1ZgQ77qk4UP2q96mKfFMnIkRI8A/RMfEi0CyaNqmThq0BU4SK361wCkMKtD
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=r8kganQMACnpTwhCNua7t0wdW1Szzoj5H7CTSvz4F
 p4=; b=KcQrn8PvXRIyWWBV6LQr8nl8z4PauGoMO3BfFAOmwCe4fOW2dDOfHN7Ej
 jjaWil8WIvBVEuTEgq1jqgyblA+KRHGS5X6+f9au8AfXZ3X75rp0qt1H5L/7JnGr
 AY5nOvq55QHDatBZwMBneqL3NancCHX3RB5OxgLbfTm9m5MUfD0wYJRnltUd/CZw
 kcgurm4Ylc0NOEFPaKxVgpT4v54KofcuQt/waxjeOlzuT8xbXVwHUV25OIcpQkwr
 wzejB/EjwK0rY0dN6tTgaMce494lRAi7XxVcuJjc1J+hRn7VVBNqm+QgxMnVyYKp
 ajCWQtSmUMIyUpQB10CDDbsq2oVgQ==
X-ME-Sender: <xms:KyI8YBmPNdtnjbhzooGFSeEqusAXBRpBFgoUYSUYwvPFG68bEgCMyg>
 <xme:KyI8YM1_YFVz-R0xI2HsZ-gyH5SzE_ZVEGajBEQlfEIr9ibYWC6Idxq1o2vrJR4Bw
 SNLjPkfcX8pT9VqaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:KyI8YHrwRJuyV91b-_wguahDHjyIkzPFITXV1cZY3X26aQT6sArRbA>
 <xmx:KyI8YBlsw81cI_ciF-hKFI7AOe0k5-UaeTIov3ZoPYFwZraWG6lK-A>
 <xmx:KyI8YP1Ao8DvjT6CXOjBpHhBw7FhaLbOUvORkaNCAF0QCCP5Hh2vtw>
 <xmx:LSI8YP9xS0EDPfuM6hQWpTPj9tDRsmccUD4zLUz7CNu_xasHPcHXAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E856EA00064; Sun, 28 Feb 2021 18:07:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <10a65ca0-0f6a-46be-a292-d37647e03a7f@www.fastmail.com>
In-Reply-To: <1681fdc1-2c9d-db2c-a872-c0ff156e07c4@amsat.org>
References: <20210226065758.547824-1-andrew@aj.id.au>
 <20210226065758.547824-2-andrew@aj.id.au>
 <1681fdc1-2c9d-db2c-a872-c0ff156e07c4@amsat.org>
Date: Mon, 01 Mar 2021 09:37:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Subject: =?UTF-8?Q?Re:_[PATCH_1/4]_arm:_ast2600:_Force_a_multiple_of_32_of_IRQs_f?=
 =?UTF-8?Q?or_the_GIC?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XB9bZyFtL905



On Fri, 26 Feb 2021, at 19:26, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/26/21 7:57 AM, Andrew Jeffery wrote:
> > This appears to be a requirement of the GIC model.
>=20
> If so this should be adjusted in the GIC or a15mp_priv_realize(),
> not in each caller, isn't it?
>=20

Maybe, let me look into it. I'll clean it up in v2 if it makes sense.

Cheers,

Andrew
