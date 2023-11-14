Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2094366ejc;
        Tue, 14 Nov 2023 06:59:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZjmmyU9VRSVFDGCy47/WhQRI4HQ7cN5JflcF5J4kaLdofnkzaTuL2g+zTupXSkLWhklhz
X-Received: by 2002:a5d:588c:0:b0:32f:83cf:831f with SMTP id n12-20020a5d588c000000b0032f83cf831fmr6584617wrf.48.1699973973364;
        Tue, 14 Nov 2023 06:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699973973; cv=none;
        d=google.com; s=arc-20160816;
        b=MAlL67yVinXKTM8LsDv8eRhy2lru2ER0pSyoRv4HmPv5fjtfZAXW+CAVKmtDd27/Ep
         VzN6kbrRuNC+mlvCYVsDB4WWMvU7iVojbSQZSfrzq/7SMX8vLkxZCnhVPP3DLMTuUD8A
         h3qT9ZXpCPtRok6gT8DhETjZ3yBeLpXk3MNXZ5/H4nqrJxYBRYeiV+bwONg8m820iRjT
         p6BHpvcRIugRfVfC5MMOcn8ossZdiGgN2QUpMFcEwLid2ZTRKhl8T80zjNIb4OzbT0co
         1cr5hdo86LNL9kRcrrgPYO0ilTuQh/2wQOjXGY3D4VKtDkVUMhPb4Wwtcmy0LFelhwMB
         K60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=2V2aN1FlolnINR1l3YlTw25qRr0vJF7wJ6RIq/GchL0=;
        fh=yEiaWr9s9Tlm3Qw3a9nVJ8E1quYzRHFnCsTZa8iVC8c=;
        b=omUBQd16oSLW84BD/ux2pTab1eYJvI5wXi5PXMHHWVzR/vaxYXoTE3IlLnQHJk8bEd
         bVdu7qBFpvi7abw6AsEs2eKV80sWRYZa/mSQKE1g07QNw7puMz1TJBIL/mWvq5vAUjMr
         NtnIKWiowA8Lp3UYtnRWT+VELmAMc062Y8BKZNW6UkgN6kKtV5hBcE6fFCXDmjPlYxLM
         u0VIrdhcEgap3XNmTRiCmnMmdcT4bAUElcCYq4pArOwMOA/GtO/m3taQkTdfZEpvmOB4
         vOVEx7oCJBr5fQNJaVOQqOvGxmf/TyK9WuJ9W/hmikSeKD4gbrH6F3/7/sLAEIDlIDBi
         Vn7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b="E/PEXjvt";
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
Return-Path: <BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org>
Received: from casper.infradead.org (casper.infradead.org. [2001:8b0:10b:1236::1])
        by mx.google.com with ESMTPS id l2-20020a05600012c200b003231fb322fasi4626357wrx.291.2023.11.14.06.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:59:33 -0800 (PST)
Received-SPF: none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1236::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b="E/PEXjvt";
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2V2aN1FlolnINR1l3YlTw25qRr0vJF7wJ6RIq/GchL0=; b=E/PEXjvt0+RnUlYrN++xmBLgjc
	HuCaeTYOVkOefp8uy3ZSz/P6HEQekbeWntiUJxH7m1YR/R9+NhRL2luaaOdAWWsfGwCj9vF7sfChu
	J4kSiafVKeRtFjBPxiuFAo6xu2mHULfx5cUzZjHFsJkKJXM2LkwTPWm94lP3pXzh+8dAXVF2IOAFF
	fSfV1upQceel86/fLJuSmWwADzoC+KPOtbAHed77Z6tkpuV9iEklSCO+Alm8btl+EphB5Pfn4Mzlg
	mK4N8HkJxJMjd+3+0P+LbO2K/yb2HegPlM96HCDpOt/n8/RjcauHGDBym2kUbXZSjBDzkYQJXKD0P
	jq+BiHiQ==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r2ut1-008aJs-S4; Tue, 14 Nov 2023 14:59:32 +0000
Date: Tue, 14 Nov 2023 09:59:29 -0500
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
 Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_04/19=5D_system/physmem=3A_D?= =?US-ASCII?Q?o_not_include_=27hw/xen/xen=2Eh=27_but_=27sysemu/xen=2Eh=27?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-5-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-5-philmd@linaro.org>
Message-ID: <2D88622C-9DFB-4DB6-8F9C-E45850FB1DCD@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: sZje5y2eYdLl

On 14 November 2023 09:38:00 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>physmem=2Ec doesn't use any declaration from "hw/xen/xen=2Eh",
>it only requires "sysemu/xen=2Eh" and "system/xen-mapcache=2Eh"=2E
>
>Suggested-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
