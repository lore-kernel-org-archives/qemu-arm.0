Received: by 10.25.15.165 with SMTP id 37csp179982lfp;
        Sun, 18 Jun 2017 21:22:18 -0700 (PDT)
X-Received: by 10.237.55.228 with SMTP id j91mr26601594qtb.68.1497846137920;
        Sun, 18 Jun 2017 21:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497846137; cv=none;
        d=google.com; s=arc-20160816;
        b=etOJMrna9+aI9PzPegmIvGUXtPjsh8Erl5fLAMCHZGIaGKhK1pozat4Z6N7+h2MZk7
         VOPNZXNrUSJL6QjzYwGw0oh+XqPGDONYSygh6pAys+0RwGl271QWcTOG6BN0oZMmlLky
         a5hGZ9Ap09oPXTHtP9WK90rDBfPCLd2QrwfR2fxdAlj8DGfctELz1eqzikYYOgBDlvi/
         3r0kUVf5CMmjtbX8CWg1OuHh4We4qsicvEyVMk1fspTyXjUR9x+/jbt9ySWNonx7Fe2S
         kxLKTCatPGKkmZzexM5YBwvdspay1GH5ASPDRmhtfMi89zVul+SbgcGilidseI5bojQi
         YBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=8Tlp1RHaMG0rbnirxziUmHGrUvO5NbTnSzMz1ZZDVJI=;
        b=OLctpuh+xDt5BGflFTGznxTcoVlG8zFSjjDZ2SQy7F3mf6B/5l82Mkoz24i1Wo7qmK
         UWju6e1HMBoOFWBEVCnxjCHE4N3GAagQDl/k6OvlKtOmN+teLYX002Mf9TSeUd/4XvAG
         Blze80VXAtWsZaF7+wOZkhGhk7WEoe4ak/3AZ+FufA+6VmAkuHn4w1DWgmo9WYbRNYNm
         XwxaRV1iaGxYKKzHMBf2FZNfAUBFGeCyECurzVgbO4pMY5K2odHPjjvlktLOT6H6l7Lw
         DI6CeCMRZNgW/UDKwM2ORt+YHR4nrDd4Q6XNANCEVJAO1BhWjPOaswrarxd0ZMK/79ZX
         mlHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=V2f3ZFSm;
       dkim=pass header.i=@messagingengine.com header.b=OoRh61j1;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com. [66.111.4.27])
        by mx.google.com with ESMTPS id b73si4052738qkc.260.2017.06.18.21.22.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Jun 2017 21:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) client-ip=66.111.4.27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=V2f3ZFSm;
       dkim=pass header.i=@messagingengine.com header.b=OoRh61j1;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 75BE22088E;
	Mon, 19 Jun 2017 00:22:17 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Mon, 19 Jun 2017 00:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=8Tlp1RHaMG0rbni
	rxziUmHGrUvO5NbTnSzMz1ZZDVJI=; b=V2f3ZFSmzIUdDIeVrBtDcPpcY/p9byH
	6PK7rzTEDAhftC42Ctjq3wDpwDIjpxYe9scXPAVVTMb7/GVrMLGzbJ4jqd9iKqiz
	hvjLd15lGS1VmGYujTYIqG8WfBDfH1LEY5rPGzEnoq3AQoPeAFzH76d5AB7SZ9SL
	KzI1rNrATGvU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=8Tlp1RHaMG0rbnirxziUmHGrUvO5NbTnSzMz1ZZDVJI=; b=OoRh61j1
	TJX4Tbzjw6cK4E6ESRC5LSxXp6hUqYrDe79S02q+odIt27nbNuvMBEfh9HAr1Bnw
	nNxG2ZPSSPnHXA+vnHoE4/cmjCT8FqPn/hIq5OBRbZeowhSZu6rHpR7LDis3heTs
	XnYeqQLQH4b7Dt0soT6PhEmvPLjDTKDCFqo1/Lxwbk50p/sOkggDWXHwhUq2KarP
	EGSA5K9OyrPOyx3T1QAJu5qOwFetaDzYQRAXDIIYooEwT5gsN2jBrIJzVPu6Dgsy
	bPoU8384eULkiux4gX+YtfRL6/SQcaRV8sbGE9REDvnjyObnopOeYtKEJSYF422g
	uWDKqK2BhRMf8Q==
X-ME-Sender: <xms:eVFHWR2fjFdt6i7PdOwfoh5qkNHuaZzX11AMeqvSz27RXDAVnEMI-w>
X-Sasl-enc: ebSbi+8B+bNfbxCj+3kpDPX/W0EDSdGSWfQQKJ/LFCvN 1497846137
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2BA627E887;
	Mon, 19 Jun 2017 00:22:17 -0400 (EDT)
Date: Mon, 19 Jun 2017 00:22:16 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v6 6/6] target: [tcg, arm] Port to generic
 translation framework
Message-ID: <20170619042216.GC10709@flamenco>
References: <149727922719.28532.11985025310576184920.stgit@frigg.lan>
 <149727927074.28532.17986481795216498698.stgit@frigg.lan>
 <20170616001842.GA25056@flamenco>
 <87mv95cq9t.fsf@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mv95cq9t.fsf@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: eWY/pXyDsfGo

On Sun, Jun 18, 2017 at 17:41:02 +0300, Lluís Vilanova wrote:
> Is there any ready-made kernel or disk image I can test with?

I test ARM with:

$ qemu-system-arm -machine type=virt -nographic -smp 1 -m 4096 \
	-netdev user,id=unet,hostfwd=tcp::2222-:22 \
	-device virtio-net-device,netdev=unet \
	-drive file=jessie-arm32-die-on-boot.qcow2,id=myblock,index=0,if=none \
	-device virtio-blk-device,drive=myblock \
	-kernel aarch32-current-linux-kernel-only.img \
	-append 'console=ttyAMA0 root=/dev/vda1' \
	-name arm,debug-threads=on -smp 1

Grab the image & kernel from:
  http://www.cs.columbia.edu/~cota/qemu/
NB. The image shuts down without even asking for a username; it's convenient
for testing/benchmarking.

		E.
