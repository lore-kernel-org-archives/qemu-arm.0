Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1392813lfb;
        Tue, 12 May 2020 11:18:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJu0lJZOShlf5dv+qu6vA/Q5eYp9fGkvDO1XlCLkW/v+w/5srbD0v82sraA+ev9n2CBnjqL
X-Received: by 2002:ac8:1387:: with SMTP id h7mr22854007qtj.229.1589307509510;
        Tue, 12 May 2020 11:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589307509; cv=none;
        d=google.com; s=arc-20160816;
        b=dZBa/GFCHAg43mmckVsGRPhrX/qdUvCO9dZ7+DYNqs1Eux10RIsv1IJz4fRMuB7vuV
         3K/62gjNkNyEwZBQXGxfQEbqJJsDU8RkYRw7gQH+cSVGf7cS042iBX6j6Z5HGrh8elLb
         bkSxqlzfOF0nrdL/vMU8PatKCjM+YNanh9bmuduQJj1dPKDYojsS/z5HJ+A/mFZpvCmq
         a94fhY0yVlWWwwIvmkuweMVO2TLuA7LsI4m1EL3BPiHHtuXvcyq1d1OPEGkwyhqOoVYt
         S9tFvln2g9k10RrQ9nu+bbh46auiRdcF3V115WrW+9GTAOiObmpPvmXrqAjHTm4nWXje
         Vetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W1/udW/hfudiHfE0HiCrf5vcO9KbUOkm0wj1Jsrb6oU=;
        b=npdxnlDlBw5XHzVGZalBSkE7pBwrMhbKnYZ9PjBOfyFt1pge3PUexumt3PPb5r3ZQ1
         V7js2TYln3bAzkPlSuFfhQ+TlBXqRRpwGctgBlfxQyOxjPIUWBLA09YOoPULKrdGBSFJ
         DaV2ZRy6DjYQxpHWrd2ssQJ4RChXvIAv2pfv1EluCoNIAvBVDeHmF+NL97OmhBRHZbwD
         5Q817VM5ZWDxuLu2/EP7q/TqMmg5C2gronHN215HVe7l30tgMxqoZcGYbFZvw4bxNExG
         tEKDnrPPyw3AQnKe/JahEqSjuZNwT7Ah4vuUoq+GwNLvNO35ns6SOoA5tgRznlct6X8x
         DSIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y1/NbxcA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27si4918000qka.70.2020.05.12.11.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 11:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y1/NbxcA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYZU4-0001d0-Uj
	for alex.bennee@linaro.org; Tue, 12 May 2020 14:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYZTu-0001cF-0b
 for qemu-arm@nongnu.org; Tue, 12 May 2020 14:18:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52625
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYZTq-0003Tx-Sm
 for qemu-arm@nongnu.org; Tue, 12 May 2020 14:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589307493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1/udW/hfudiHfE0HiCrf5vcO9KbUOkm0wj1Jsrb6oU=;
 b=Y1/NbxcAGCjm+1KKo0lzFOHbBs9UJA2LhEYla0OWe+/WzCvNrIuso7LMwFfgD+ECEqsVBE
 DwzZgflqItFRCZnxMQIqhJBkWQ0Bt+OeR9lQhu09PY7gX8ibgqNFMtpFuF7WZgqxLOxX0l
 DYE57vChUJFOAEcaoAXRHwSxujOkCC4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-4mCOAY9YO8KAirjimcvuIA-1; Tue, 12 May 2020 14:18:12 -0400
X-MC-Unique: 4mCOAY9YO8KAirjimcvuIA-1
Received: by mail-wr1-f70.google.com with SMTP id f2so7320225wrm.9
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 11:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W1/udW/hfudiHfE0HiCrf5vcO9KbUOkm0wj1Jsrb6oU=;
 b=DIZPx69Kg2vpmS2crcsZXH/MZbVlyC/eGEF5L0WRC9YPtj9w5hH1r5AjebotZ8zN9/
 mw9DHN3hI1g2e0s9RLRtifazlQPOZ2W1UmX7sHohgowJ+buBzNHO1oh6EKtmuN9GhWHZ
 hG6oAbplhxVltOJasVYYx1qvWXyM0TyEAXJ+CP61q9dOR3x/1zArmxMMio8XE8vbFluD
 HYRIJ+Un5hCp/29TmUqqbX5U/kyxFih4BGWWKPGq1WGLPWJ6GRJA0d0DMc99dvMoITgb
 KHohtqdHsWzphzBBnlDD3xhVWfEqeoQH2tqBk1qwFTmygXuIjFAaLSGhuf0w4Xo+A2Fq
 5dzQ==
X-Gm-Message-State: AGi0PuZcitUBTpVG+9eUxeJ0odoFE/bj4NUKz/l++kjQyHJ3hauNFkWZ
 IWJPjmBbfXjmzKdv9M7uskqunITpRotoKvji7eKEtaRTKouRdMqCutXx9RWHBMmX+KFkqKtZcTU
 U6a+ZpyIakDaS
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr25118802wrw.57.1589307490968; 
 Tue, 12 May 2020 11:18:10 -0700 (PDT)
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr25118778wrw.57.1589307490755; 
 Tue, 12 May 2020 11:18:10 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id f128sm20662231wme.1.2020.05.12.11.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 11:18:10 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Update Radoslaw Biernacki email address
To: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-arm <qemu-arm@nongnu.org>
References: <20200512170704.9290-1-rad@semihalf.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16d128a6-c07e-d2d1-129d-c4047d0da3ea@redhat.com>
Date: Tue, 12 May 2020 20:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200512170704.9290-1-rad@semihalf.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 14:17:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ydT6772Riu07

On 5/12/20 7:07 PM, Radoslaw Biernacki wrote:
> My Linaro account is no longer active and stop forwarding emails to me.
> Changing it to my current employer domain.
> 
> Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>
> ---
>   .mailmap    | 1 +
>   MAINTAINERS | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6412067bde..668da447e3 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -46,6 +46,7 @@ Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
>   Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
>   James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>   Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
> +Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
>   Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
>   Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
>   Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f84e3ae2c..a9d6893036 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -799,7 +799,7 @@ F: include/hw/misc/imx6_*.h
>   F: include/hw/ssi/imx_spi.h
>   
>   SBSA-REF
> -M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
> +M: Radoslaw Biernacki <rad@semihalf.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>   M: Peter Maydell <peter.maydell@linaro.org>
>   R: Leif Lindholm <leif@nuviainc.com>
>   L: qemu-arm@nongnu.org
> 

