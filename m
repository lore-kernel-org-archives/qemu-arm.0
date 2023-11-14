Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2116698ejc;
        Tue, 14 Nov 2023 07:28:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw2GRdWclY3HmmO8d6byyzycRA2ofCwnK04hUo5SkywVh2SEPVdbEimoGgwI7KBs8QcpZ3
X-Received: by 2002:a05:6000:a03:b0:32d:a4d0:1364 with SMTP id co3-20020a0560000a0300b0032da4d01364mr2586543wrb.29.1699975688303;
        Tue, 14 Nov 2023 07:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699975688; cv=none;
        d=google.com; s=arc-20160816;
        b=WHpvI2DH00zEFMVLZ12nIpnSRqjZhlhye8Zi3042x4BKX9MV/QEDKP2Mvokl2x/03s
         oDNHH4buEAyOdF2nzKqUxiPc2gwoa3gV7SajlO4nUifBQ+cSda90qbBS18EUAiAqlMOn
         /atUTt1aFCJQBswv06Q8n+aw1OgZwH5eKeH2fqNLCcYlZMQ5Kx9b5dfTI032cOUH+02M
         sn53byGzl3Kn8XJM4y9S6J7LjsutrU9NDu4NtZEgmUBN6H4/rnHSN3wRMP0PL5QuMX5J
         wI2QI38YrjeSDw6HN5BYeGZDifVjYLcji9blcXNdPh1rudKTQDZouMd1PaVWWyj8I777
         4/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=N6lsIAvT/LEG0QMHScLeB5rAujKwbWfIcynqEX/JTgg=;
        fh=7JhNqaM1Mp0687uOFl7YXgBivNCe7ij7R1FacKyuXcU=;
        b=ZIUgK1kWvA3XzQ/flORyxzy/Ce2v7ooPihvS+oX6o5Gt3LWHsaqxBsBqoC77BariXu
         l+w/Ze0xxapppYcKhQ7L2dnnAf2yyeZZ4e3meiqvPIXtZmS26nyPApaXIG+b6uz5fpaC
         NYruoAD/E0tK3T/8sSlQ/lA13NNOJME05NHInvvDLxYnb2Turgr/+SXTZZAuNStGFpkn
         KaAr/f01T5ZxyKCUMZ4GN5oqQ3pTnREpBNf2gnje+1bbrz5qehSWLyudErjuMhWT/Lfw
         55uOzP01bEGEkLRNfYiHkjFSFBujnNqEKxFpFvTIwoy9Ot3vmLmTABCPk9Dl1Ruvhmh1
         9Vxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=Q8wLxLTE;
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
Return-Path: <BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org>
Received: from casper.infradead.org (casper.infradead.org. [2001:8b0:10b:1236::1])
        by mx.google.com with ESMTPS id d9-20020adffd89000000b0032f7e235a3fsi4833141wrr.704.2023.11.14.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:28:08 -0800 (PST)
Received-SPF: none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1236::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=Q8wLxLTE;
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=N6lsIAvT/LEG0QMHScLeB5rAujKwbWfIcynqEX/JTgg=; b=Q8wLxLTE99gkmHRWLTsrO2SdeW
	XfdKzTjDRskRz4FgWweoVthPGWW6En3PnTPFiWPPGI0GLEqYKFCbaeUhWCc7eqRld+EkmItyFum/u
	f8mR/LaDGf97Vypg8dR70A9njyk0ujfA7GZDBcceSMpPvIfPG8ySvMi5k6XkPRB+nhXIzXfrUJtqt
	0clzgOwbYlqSSo1XvNoqUO0a+GmML4/eWxE/IEVjTty/Z4Wj8qtR55DQRxJj44VukxbGuuQxa91Un
	cEKKoaJzdph/iZGXdVUaBR1VS+02QOG0uU75aMm/LiOK4lkOlIuQpg//W3mDTgD24Mh/X3NI0TbGv
	wu90QKlA==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r2vKf-008iHm-67; Tue, 14 Nov 2023 15:28:05 +0000
Date: Tue, 14 Nov 2023 10:27:59 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_07/19=5D_hw/xen=3A_Rem?= =?US-ASCII?Q?ove_unnecessary_xen=5Fhvm=5Finject=5Fmsi=28=29_stub?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-8-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-8-philmd@linaro.org>
Message-ID: <017E3F40-47A2-4F1D-98B6-18863ABB0FD6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: sE/KOCl0Ngjv

On 14 November 2023 09:38:03 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Since commit 04b0de0ee8 ("xen: factor out common functions")
>xen_hvm_inject_msi() stub is not required=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>

