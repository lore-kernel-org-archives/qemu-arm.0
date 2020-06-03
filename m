Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp13432lfc;
        Tue, 2 Jun 2020 17:46:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPu2TC1UC4IS9SVu+YaTuX9aLRwnE/BEzbyPRul621oQ4djRAcxpNTcASpzOwa4JhYwt2/
X-Received: by 2002:a25:6dc2:: with SMTP id i185mr47511747ybc.370.1591145196481;
        Tue, 02 Jun 2020 17:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591145196; cv=none;
        d=google.com; s=arc-20160816;
        b=d1/CldmCM6PFK6z/1bc6RtpnDA5jfguDMCuhq/QCpsrsCMmzOb4SysP6nYUrFKO86l
         jSvpzUoCdwtbwr/ji81m72hEfZ7ikDFH00EyWSW/eKc0TK4ujcZQRk6bSKalGgBUIHdo
         YUaVNFwHGSGGnboV/UZkSF84XtsncCSeJKO+zFKe70XIS3jGXvBpGRkk6M8C4y1XBuai
         QAPHmID7iapp4qKVreVulXySgkMbufS6sdCvRDl3DeGXa6tvTmmol/KIRcLsb5WBCuB8
         Id7WJvPCnk/Rm7cyz7rWJ7HfQjkTPrT9P4JopBDejOR4aGf7pV2KF/FLjrowfutCB2Yv
         Xpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=7Yr9sQZveh3RFZSr00zd/xCbOzSG4e2csVh5T9HsnJU=;
        b=GjRseHl8sRsCx6mtuLLlw8HFwdbzZkr1Jf4nUkKtmeIdtTpdoNZJn1kL02tceQ35hN
         K541iNCtMIqjzhJGceTwIBhZlDUtj6fmOIY8fNeWGbyKidM3iO1UN2YfXDixgGs+2mT/
         8fDHYFr2jjrdMKpHG0jDijD4/PsTY31K29ulPbb7z2wUrwD2WKs+0m31/2qEGhl75OhG
         /Buj0ZtBpwyHfyIJ7UuqV0dLT7qf2nNbvf9DUcqwJ3aUUOAnrhiUBrC2K8S83O0TGt1b
         INfjnhT9a+mYOym4MbZ9hzc7bwMuD70tPnnhWm6aOMxCrVQxI7IshNsl+NeVQo3tb5Oh
         mJFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=wY3J5oII;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=svIqS5v8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s68si313179ybc.235.2020.06.02.17.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 17:46:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=wY3J5oII;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=svIqS5v8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgHYB-0003xc-TW
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 20:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1jgHY3-0003xG-R1; Tue, 02 Jun 2020 20:46:27 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1jgHY2-0005sX-CC; Tue, 02 Jun 2020 20:46:27 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2C82E642;
 Tue,  2 Jun 2020 20:46:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 02 Jun 2020 20:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=7Yr9sQZveh3RFZSr00zd/xCbOzSG4e2
 csVh5T9HsnJU=; b=wY3J5oIIxNkJpg4siTrGvC8LGKrYEAoaKqo4w18HsAtBVkL
 XhDnYOzCRIJm3HCC70gQxoFsqCRuMsqwOw+/mv4svm0H8l4uyXiMbFzqBDQ44isa
 7jGahCcBaooN300fzLgunSnucX5eNOTXYOyuJllTUNpjQooAunWgvHdWHUEx0blX
 4gow6bqIWPctz9eOcIH7i0ru8udAA7OmVM8H+kwtoS0XHaLsbZy2UIArGGp5PBjq
 G/D/wplLP/DQL/PR5sujHP8W8nWbkcHYkvfX2Lcs4t7h1Rl4QEE647f6f4ilQSSj
 YnsrIUKLnOXGEAMQ7Z7zoqEtZaxoBrbIpdmdRFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7Yr9sQ
 Zveh3RFZSr00zd/xCbOzSG4e2csVh5T9HsnJU=; b=svIqS5v8T7cqMfIFcREKjj
 1ffHiumk+WPUQ45j7qfAHpyHSVpmeWV6y89gwr5nGD2iSDOk6VoRAMJjXDHtL/LI
 G+mHr2bkv2skfCO1JVnKU/bWE5Xs6HaNFKAnhbaIdL3HjOr+msGbAAI77Ey8NCmy
 UERNat47pDDA8lriG4ZtCMpjgYUZINjVA6wb7QFAYzrkUAYP8kMaOM/KzY0DXPMR
 LXXdOVMKmp2CIuMgM0ELz+4xoIb3Ac8WslpcU1gXfUaNKeVo7LhXBLvqplbMKMR3
 +FF3liM53z0ovmVScdJm3M7qz6dLmFNvli2+QUSkgs8hEDrcBAFOgEpq5trgWuCQ
 ==
X-ME-Sender: <xms:3fLWXnTlkOE_6J-HJUvZ8gSepzyVUE7yWCGHoezKnyvTrcc64K9dEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefkedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3fLWXowGvp_rYhBqKlRIf3e8-Skd53g_nuFgX8-4lYo7oN9MuqwFvQ>
 <xmx:3fLWXs3pOiYU9aFwNyMLT-TKIfeUygPn6OY78Ko1XEeqMiQd6DE1ew>
 <xmx:3fLWXnAmA8kzdIIVKpWAQBbWBE7oVGcl8q_U2JzMPTYZR3QIGzqFwQ>
 <xmx:3vLWXjsIUriRek_ZUD9XGx3VQAnlW7GqVp1HJyIjkvioIn2C-Zo4XA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0BCEEE00C9; Tue,  2 Jun 2020 20:46:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <e3d11c90-86d9-4daf-ba4c-9da98942e578@www.fastmail.com>
In-Reply-To: <80e5403f-a842-4542-41d3-d1d8236af637@kaod.org>
References: <20200602135050.593692-1-clg@kaod.org>
 <a46437ce-1be4-3c0a-8403-1c279ad8b90b@amsat.org>
 <80e5403f-a842-4542-41d3-d1d8236af637@kaod.org>
Date: Wed, 03 Jun 2020 10:15:59 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs/system: Document Aspeed boards
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.20; envelope-from=andrew@aj.id.au;
 helo=wout4-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 20:46:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AbIo+wvO9xek

> 
> >> + * Hash/Crypto Engine
> >> + * PCI-Express 1 Controller
> >> + * Graphic Display Controller
> >> + * PECI Controller
> >> + * MCTP Controller
> >> + * Mailbox Controller
> >> + * Virtual UART
> > 
> > Uh what is that? :)
> 
> It is the host console. 
> 

To explain a little more, a 16550-compatible set of registers are exposed to 
both the host (via e.g. the LPC bus) and the BMC, but the FIFOs are shared and 
the transmissions are nothing more than register writes/reads from each side. 
There's no RS-232 involved, hence "Virtual" I guess.

Andrew
