Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2307112lfb;
        Sun, 17 May 2020 10:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ji9uyDCd9LFLqoc/ezkngGJrqu+VWFqadpOlX3zVpIIJRxD/2IJiTi1lrgzt75//czDs
X-Received: by 2002:a17:906:6843:: with SMTP id a3mr12208994ejs.245.1589736228928;
        Sun, 17 May 2020 10:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589736228; cv=none;
        d=google.com; s=arc-20160816;
        b=RJ58uywG5sw7Hkl1ZXnWbnQzWimm2PuaX1OH3KuV+USaXFvNd7jAXBRMaCh61x7Ui3
         H65Ksi2sAavpHWOC+LWNqVQQvD5SQMt/A1UumVDDBkMBX4Bhhpzv+66glXATBBThcAue
         pFHK2bll7UdnKcXh7HOLlHczI64Ez0Iy0buyTagaqdxOk6uS+nzwHO5+nmLMLTiy/l6t
         MXW/Yh3hXZeYz1WdSC4hRowP6vCoMI2gMmrHrLm7CXhujGWo4/My2ZD+Ekhuk/1DY11h
         AhWfswO5UT0VfTO+vWXhbqyj9ceTqQGeE05IHAKNfXu3Wk6H87Im7iHcing4Zxb9eieW
         XFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=rlRpGP7lZ1BbdLKPa6j3raKO/TET11U3U5RyLw6CsDY=;
        b=WdzA2U/bKcIQIvG2v3ltfMb2u0Dv3VkaooZ+/qwh6j1WGMTLzk91q7qYXYlyg+KGR+
         SSNp6pNxAAvdBHuvIoOlWgX/bL1Zh5MtgKu0rPbr70hKXR89fIDIFl0NbairtC77JHTK
         X9LNfO/TwYg977G/GbzgVdPHnaU/Q8BQScDEOh8nknjeZpAoPnGevbLrcwuttEqaVF6F
         unGP90NCd5K2Tx1J/fSCBozE0vkE4acz1znGfmo4rPmF6oylC0cBdRABE5epDP37tGt+
         QQ6TWiYGD5XLShBva3J+6elF+Vz8/aQ7LemhdEEeGV6m8ibK9QaGDbAzT0m1w03sv1Jv
         QGhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FmyzQw58;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id dj17si4576942edb.556.2020.05.17.10.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 May 2020 10:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FmyzQw58;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589736227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=rlRpGP7lZ1BbdLKPa6j3raKO/TET11U3U5RyLw6CsDY=;
	b=FmyzQw58TlVgQRaX349EJhrG4bPJ1i/nRCszlQNQttCpHu42z78ZejeLunoaZsWvSZ9QNe
	aN2pvl6mEFwZBoXWnNK/P+gHiWk+JDrerU/16K+SBsRPqndFEhvWxfOwkhtehvNclJtM5R
	mIJZcE+E+kXYuz5N1MDD2nQrLHfJH1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-DKW3VnAuPICfpJH_kA0eMA-1; Sun, 17 May 2020 13:23:41 -0400
X-MC-Unique: DKW3VnAuPICfpJH_kA0eMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15B37107ACCA;
	Sun, 17 May 2020 17:23:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-98.ams2.redhat.com [10.36.112.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 805929CA0;
	Sun, 17 May 2020 17:23:31 +0000 (UTC)
Subject: Re: [PATCH v2 01/10] MAINTAINERS: Fix KVM path expansion glob
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <09d86ad7-88b6-9f68-8ea3-5d277fe6eea3@redhat.com>
Date: Sun, 17 May 2020 19:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: ZCkb83tCssWm

On 15/05/2020 19.07, Philippe Mathieu-Daudé wrote:
> The KVM files has been moved from target-ARCH to the target/ARCH/
> folder in commit fcf5ef2a. Fix the pathname expansion.
> 
> Fixes: fcf5ef2a ("Move target-* CPU file into a target/ folder")

Oops, my bad. Sorry for that oversight!

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 47ef3139e6..fd88a3de49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -361,7 +361,7 @@ Overall KVM CPUs
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  L: kvm@vger.kernel.org
>  S: Supported
> -F: */kvm.*
> +F: */*/kvm*
>  F: accel/kvm/
>  F: accel/stubs/kvm-stub.c
>  F: include/hw/kvm/
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
