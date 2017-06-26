Received: by 10.25.15.197 with SMTP id 66csp1569951lfp;
        Mon, 26 Jun 2017 11:05:19 -0700 (PDT)
X-Received: by 10.55.104.195 with SMTP id d186mr1810241qkc.176.1498500319294;
        Mon, 26 Jun 2017 11:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498500319; cv=none;
        d=google.com; s=arc-20160816;
        b=c8PJFARx+7HZ9NwZvBxijZuqp3OIJ6SCkTGk1jW2Yj7o1Pa9ansotT/u+i8gyqORb1
         1mkArMqViuPpjBiO4uVwJLFToZEYtW7xejyOtb8b/g7CPy43JKzwVwscUcqGvfKrFXdA
         V3py5WBzTYHhKB4nblsiuroA6Hm5m6/9YNrbkQerlIMJJyKzPKSmGii8M2oXN0AVN1Hm
         CBQD72iaziw9jDO2elqRgYIAs7rs3zP73PSvQG14pO7YvddbOCdnRMwMZ3V3hbTvHfJH
         HAC4Kjewrt/NqR3GUBraN4xm+glMc/6C2i9PxPeLQ7buc5F5Kt3QRjiKH2z4IXzGSOoP
         as3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=/g1g1tzPMImdY8b1R2Ly4ouBIYuSgs31oZ6hz9N5Knc=;
        b=RGYb7ftT7Dpvb65crTYCktV7p/24hQNCkBgYJ6rzjILKqidux8xgnkr6+I4nWE7MTV
         lkOvfSMkAP5Hp7gCC/9OH1nUcn801ah/juEP71eqYxBxNGPJTZmvvDMPIlTAkRwMFYaJ
         55sM2jaj5lHqOtNUg6ZEnzK2A4lUgMg3H14cSGyxt9w4c8aWxeMY26hkgBPRGE0etkPM
         A59S4M2b5r6+XOnLsQVrElxP0SgLrpAZr6I3TtfSsH03KT54tKuuyuBLee0V6p8Ar3BI
         +j4QYUIYPnmwF/25qu90fg9grc1G7/9ZmT0/YubJ0CFM8rgsjZ3O0vIdRzGmfr5+HRjT
         e6eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=dQeit7Ju;
       dkim=pass header.i=@messagingengine.com header.b=OeMPlc+J;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com. [66.111.4.27])
        by mx.google.com with ESMTPS id n38si622669qta.238.2017.06.26.11.05.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 11:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) client-ip=66.111.4.27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=dQeit7Ju;
       dkim=pass header.i=@messagingengine.com header.b=OeMPlc+J;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CFA6020D52;
	Mon, 26 Jun 2017 14:05:18 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Mon, 26 Jun 2017 14:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=/g1g1tzPMImdY8b
	1R2Ly4ouBIYuSgs31oZ6hz9N5Knc=; b=dQeit7JuA/fhk3Ubeem9pWuIjld2gEs
	PIz8H55n7nEXVFKehAxmdPzmXtLEXfw8YZ3BPmnYCr1KfDKQuDfK0sZVsbm4bxs1
	ywhwC43aLG2Tr+65jAsujKl83nBJYQ6IglVo1LVBfNZtHhqxFygHy1tNNkq6cUyG
	aXe6/9MHN3jo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=/g1g1tzPMImdY8b1R2Ly4ouBIYuSgs31oZ6hz9N5Knc=; b=OeMPlc+J
	uXU1LwnV644CQw+UTwIYj+CXmwUhTpDrlaW6+Zcf9LMqnFd15U5fFaY7fcfb9Gxr
	0fJ0s1QGxEPpapPFIDPBFrg0DW7xr5eEUHetV9Tb7Un+u7srGKP9fkCeaLjOk+jW
	W8vO2opthnvgWCf5vROzPoZbdF+019K0gdIbF1LzYJSOkSqhjRBDQqM85RYMonWD
	5JV6deyg5AmMFOWxkbMCZWnNTB/clG9exHnnMah7mi8MGCKtIHh0P4SIn+0dtKlC
	XB3NhFVsAtjrSRjFyGQaHWHQvzrXw03S4r6GInoLeCS8AIQXAXg+7liX3pmdAdOY
	r95Cbg9Wi7StVQ==
X-ME-Sender: <xms:3kxRWQR2oc2PQB55wPeFP_dCMrf1Qy1X7x2K2R3B_uXB55J75u73ww>
X-Sasl-enc: uyKW4OlBtO2nNZyiX/1e4j2B81Weg2QdSJkz0VBvnHis 1498500318
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 85C007E766;
	Mon, 26 Jun 2017 14:05:18 -0400 (EDT)
Date: Mon, 26 Jun 2017 14:05:18 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>, Alexander Graf <agraf@suse.de>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v9 05/26] target: [tcg] Redefine DISAS_*
 onto the generic translation framework (DJ_*)
Message-ID: <20170626180518.GE17935@flamenco>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
 <149838143590.6497.11184953059640962891.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149838143590.6497.11184953059640962891.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: SWQMNkl2ZENb

On Sun, Jun 25, 2017 at 12:03:56 +0300, Lluís Vilanova wrote:
> Temporarily redefine DISAS_* values based on DJ_TARGET. They should
> disappear as targets get ported to the generic framework.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc)
> Acked-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com> (i386)
> Acked-by: Laurent Vivier <laurent@vivier.eu> (m68k)
> Reviewed-by: Alex Benée <alex.benee@linaro.org> (arm)

Why don't we just keep DISAS_* instead? That will simplify diffs (i.e.
no need to eventually convert anything to DJ_*), and really DISAS_NEXT
makes more sense than DJ_NEXT. You can define a few generic DISAS_foo's,
plus DISAS_TARGET that the existing DISAS_* can build from.

Also, IMO DJ is a poor choice for an acronym. Am I the only one
immediately thinking of 'disc jockey'? =)

		E.
