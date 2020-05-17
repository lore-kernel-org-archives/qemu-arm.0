Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2309062lfb;
        Sun, 17 May 2020 10:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMuTy6Mc0aRZyY77VeGI6MAR7HNvDcCmzMm+y1+812XXgqyrhftG9NVEAJsIzhm8ahLdRd
X-Received: by 2002:aa7:c944:: with SMTP id h4mr6442734edt.383.1589736418307;
        Sun, 17 May 2020 10:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589736418; cv=none;
        d=google.com; s=arc-20160816;
        b=H0DhLg5bMc/e7vY+b8+rob812jEuCKQOlFWYKXcIom78F13gQR5wvqO4ZsgKPNNIY3
         +grU7rtWZ+sgLrrGHfsDNjVJuesjeSyK80aXlCTXECbevasL9Z1rMZAlXhRIz6DHn3th
         mJB8BC5Zrq3S1J49tDchX7So+L6knlHWufRkQ6e4qd2jtYgv2orG26s9br4q7pFMmU11
         UtgxrrLI7Lx46fFGNx/C4voeEa03+XBM5SvAU+BY5QiFODc9pysc/G/MdJHIdIWUwXbe
         HPAFk/6ICOWKzobgXdtwngk8c0Ge7D5kECXytEHhF2hZDfEgcW06gp2ybP8aW27q0LBN
         9THA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=10XxOGKrmTpGZtgTI3efNNlk3/0TULQ+VOPtrrNccZI=;
        b=ujU+owcJ06Mu+9CIHqaS/hEvHYtA65fLJ0Cryg73rJglVEzEpjPXG+s8mQpdWJL7M3
         yQLFVSY0Dc1O7i4qBgj2c8NDsSZV9zxTgV0FREj919kn/kfVnoSgvObvaAVe/CEnOSYf
         Mg+CCRL5k97CsoY2qnP7j5tpfn4uuC/IQikUDUZ7b3rRms8TdFw/LVq+sj5l5Pyd8Viy
         RdUsdCVGBsw2uNMRnUR8Y/RAOf/tdAxsRNQMXgplULTBeEe4IFlO+V3Kn9Pq1JWarbSX
         BHOnpuRNgA38RMjcc1dG/Oy97MsnV4CECCeZwMAI8mU3bhHIP8Rth+/mW6T3DNthcj51
         t2GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZB5qsanX;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id h16si617399edj.301.2020.05.17.10.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 May 2020 10:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZB5qsanX;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589736417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=10XxOGKrmTpGZtgTI3efNNlk3/0TULQ+VOPtrrNccZI=;
	b=ZB5qsanXQDEqL5eJVJmPA5xCTeOISEFCqECtN+OPG3NtTTUDSTysHd1GGi3q+uxd/gbMvG
	6Twa8PpFmuiiIDQtY4cZCGIY/tD1Yi+xTFNoqFDWuwzmLYmvx376Fvs7DlZhe9/uMy2ZDX
	jxpMfOJsw8cDf8KjjLhRvaqT0fmenKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-DghnPjlPMza4NBgRzkZtjg-1; Sun, 17 May 2020 13:26:53 -0400
X-MC-Unique: DghnPjlPMza4NBgRzkZtjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB0380B700;
	Sun, 17 May 2020 17:26:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-98.ams2.redhat.com [10.36.112.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B2A1001925;
	Sun, 17 May 2020 17:26:46 +0000 (UTC)
Subject: Re: [PATCH v2 02/10] MAINTAINERS: Add an 'overall' entry for
 accelerators
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
 <20200515170804.5707-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <528c5bbd-7bf4-4dc8-c69e-5d5b6fa30493@redhat.com>
Date: Sun, 17 May 2020 19:26:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: c6SFEPvJ9LJJ

On 15/05/2020 19.07, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd88a3de49..659092eb43 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -415,6 +415,15 @@ S: Supported
>  F: target/i386/kvm.c
>  F: scripts/kvm/vmxcap
>  
> +Guest CPU Cores (other accelerators)

Maybe s/other accelerators/accelerators generic code/ ?

> +------------------------------------
> +Overall
> +M: Richard Henderson <rth@twiddle.net>
> +R: Paolo Bonzini <pbonzini@redhat.com>
> +S: Maintained
> +F: include/sysemu/accel.h
> +F: accel/stubs/Makefile.objs

What about accel/accel.c and accel/Makefile.objs ? Should they also be
in the list here?

 Thomas
