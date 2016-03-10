Received: by 10.25.208.211 with SMTP id h202csp561378lfg;
        Thu, 10 Mar 2016 09:28:57 -0800 (PST)
X-Received: by 10.98.15.145 with SMTP id 17mr6545601pfp.19.1457630937842;
        Thu, 10 Mar 2016 09:28:57 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u74si7262217pfi.144.2016.03.10.09.28.57;
        Thu, 10 Mar 2016 09:28:57 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dkim=neutral (body hash did not verify) header.i=@gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1752574AbcCJR24 (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Thu, 10 Mar 2016 12:28:56 -0500
Received: from mail-wm0-f44.google.com ([74.125.82.44]:34430 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752137AbcCJR2y (ORCPT <rfc822;kvm@vger.kernel.org>);
	Thu, 10 Mar 2016 12:28:54 -0500
Received: by mail-wm0-f44.google.com with SMTP id p65so38034801wmp.1
        for <kvm@vger.kernel.org>; Thu, 10 Mar 2016 09:28:54 -0800 (PST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=UGVo08zp4cmmX9L9coxpM34m4HSe+AkIA1tOhuSaVm8=;
        b=GFVXSvbohY59uRLjT7mX9+Fo95pPisHiHV1a8k8K7h+VYFFAAevr5ZSzCYCl4/BILJ
         56dvTWV+HxSgSbbtbm8uqEC76HtQm0Gs3CR49Z7EtdGpXU47hvhdjddZcTLm9EbxwxX6
         j/JIlPum0wXshBsaGGd/PRdUDA62fhUv2OdmXIzQGs4T4agfZpRLGlmhQ7W/qUKNK1Cp
         Ibsly9a8INXoFE94HuL5LExOZt3qs3yVUWl7GS6lqxISlvwphj5O+5ysmbJqgV615rvu
         ErrGQeaFJ2RWehdytKo85Wey8nNcAJCZdLSelL4nF9TLC2DMgNebwDuI6Yiwe0caGIgj
         Sw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=UGVo08zp4cmmX9L9coxpM34m4HSe+AkIA1tOhuSaVm8=;
        b=MwzQAbEp8hfPx25MOdLw8VHFuCfAguRRZWToC4CjFrh+3TqXN6rNiPcCgjEGN71M2H
         DlJAVv9dIoD/c0A6sn5BkXBJUHtr3cQKhoLeHdLy29dOp49y6B8780GVugIdqN7Dga8d
         Xwc6p9J40KQCcqMS6ajgmuPGpA2ms16eSP0ttGlw1ozDuQ4pKK9f+bpucUgaO93EdaL2
         GnjiHMMP9lo86loPy9Y+uDndPZkqkM8FYt3mze6eAFXImAn9JLqGDxTqxIzyvFTloa6u
         L5DNYB+ixPB6bBLDLU1Mh0dKS93xyvkyPixwQvigdvH9Ismav8AbxAsKvcpgg7oi8Ck4
         YD5w==
X-Gm-Message-State: AD7BkJKn3YMuE4+i69jWIB9ZY/CN02xqwsOpK9gdLErZMpPqY4BgqmYtFitMFFHKuS93hQ==
X-Received: by 10.28.137.139 with SMTP id l133mr5644307wmd.1.1457630933374;
        Thu, 10 Mar 2016 09:28:53 -0800 (PST)
Received: from [192.168.10.150] (94-39-161-17.adsl-ull.clienti.tiscali.it. [94.39.161.17])
        by smtp.googlemail.com with ESMTPSA id lz5sm4520559wjb.5.2016.03.10.09.28.51
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 10 Mar 2016 09:28:52 -0800 (PST)
Subject: Re: [PATCH] Replaced get_ticks_per_sec calls with
 NANOSECONDS_PER_SECOND
To:	rutuja shah <rutu.shah.26@gmail.com>, qemu-devel@nongnu.org
References: <CAFE_T+SrAELFxgmuNPMt_FR9LwBNoNUwy-gVifuHNdrsWbhM-g@mail.gmail.com>
Cc:	samuel.thibault@ens-lyon.org,
	Stefan Hajnoczi <stefanha@redhat.com>, kwolf@redhat.com,
	crosthwaite.peter@gmail.com, rth@twiddle.net, mst@redhat.com,
	imammedo@redhat.com, peter.maydell@linaro.org, balrogg@gmail.com,
	jsnow@redhat.com, alistair.francis@xilinx.com, agraf@suse.de,
	jasowang@redhat.com, blauwirbel@gmail.co,
	mark.cave-ayland@ilande.co.uk, kraxel@redhat.com,
	cornelia.huck@de.ibm.com, borntraeger@de.ibm.com,
	lcapitulino@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, kvm@vger.kernel.org
From:	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56E1AED3.8080508@redhat.com>
Date:	Thu, 10 Mar 2016 18:28:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFE_T+SrAELFxgmuNPMt_FR9LwBNoNUwy-gVifuHNdrsWbhM-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: NCTX9x4/fBwh



On 10/03/2016 18:22, rutuja shah wrote:
> Hi,
> As there are no callers to get_ticks_per_sec() function, definition of
> this function could be removed completely?

Yes, please.

> diff --git a/backends/baum.c b/backends/baum.c
> index c11320e..20b49f2 100644
> --- a/backends/baum.c
> +++ b/backends/baum.c
> @@ -336,7 +336,7 @@ static int baum_eat_packet(BaumDriverState *baum,
> const uint8_t *buf, int len)
> 
>          /* Allow 100ms to complete the DisplayData packet */
>          timer_mod(baum->cellCount_timer,
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                       get_ticks_per_sec() / 10);
> +                       NANOSECONDS_PER_SECOND / 10);

There is a problem with your patch, probably because you're using gmail;
lines are wrapped (for example the timer_mod line shows as two lines).

You can use the smtp.gmail.com server and git-send-email to avoid this
issue.

Thanks,

Paolo
