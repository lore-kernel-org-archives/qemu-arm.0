Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1518181lfr;
        Tue, 6 Apr 2021 07:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+OQkwQHx2wAzkrgd5xLVhY3oA8bZNAIuY/dkbK51fon4H6kioCTPvxvXWRpc8G4DqHJa/
X-Received: by 2002:a92:da12:: with SMTP id z18mr23882010ilm.189.1617719283223;
        Tue, 06 Apr 2021 07:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617719283; cv=none;
        d=google.com; s=arc-20160816;
        b=DGx9CWe9NJuupCYLGgRMkfLyJPfOCSR3f0l/YNOPC6hada15Zqc93ykBDwti4vg/jZ
         vD28sOPDE+8/kmRU8E/IthRaavJvsWyRzS9qJBZd7xUtIyHK/EfQx0VbbLlzvVzbj14K
         E6ObBPwwlZkEOUnjV0BLF3HGLNY5aTf7rjCE1UixPsSA28ouJftspotAj00rr8oYL/lD
         yhUzIGLcLS3RdFlRs64dq9RaFpPHcsHqRvSKYgeZ0FHWZUAenq9VXknsY0z/JYZQd5uf
         bTyBY/Ly0NPBj7LEKZyr8U7/7aJoilW93PLcH9XFGl2WdE1wmGSsalS2ZMM+fWUK0b+2
         bVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WK/+Q636j9NbcjKaUJ90ilbbbJkCMwCKcdTntGnBjDU=;
        b=w1oKQg2bCyz8Eh9Kogg6Cu5SomI37x4mW6Kg5BrE5572xXOLx1UNijRTdSdidlQOVo
         tvPte7MVgm3oGNf9Pz2lOdNyq/zAoRsD+LtDnviWbo9T/AZ2ugm4WA5XdaEyk93gyQxt
         ijMO/Qlu+JZzUpWPHd7tGOw6oSVnwpj8z6p4URxlHI6kWkpoOEdv3+JN2LfKh8TATPG8
         tgtvQHn+ye6fCEaWfddwwBHr6IEOrrEwj1sKp3Y2HsXJ1aQVhJZiPk9aHUIuDeiVyuEr
         qn1dyN7t48BLYkiRPB3U/LBHVTOaoXLNBQnDmhM3OcQYPs5zu+7Loh6BTdZFd9XX6HXN
         lcJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ikBHWj0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si8474538ilb.85.2021.04.06.07.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 07:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ikBHWj0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTmgU-0003fR-IU
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 10:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTmfn-0002ti-N6
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 10:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTmfi-0002DF-TC
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 10:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617719234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WK/+Q636j9NbcjKaUJ90ilbbbJkCMwCKcdTntGnBjDU=;
 b=ikBHWj0bKKNWD+0UjPBQidM79USM5yIfgpaPMiJCBqb3LJ1z+g04tP0dzbgjv4oLBVVtr3
 09ga/DRLDZl+f0oV9lvS+0T8vxZpdOCew3jDy8bPrxvGB43oQ8JLqVm0ecCsuQ062sSC1c
 14I6Ke7isgAgHu9GECUnV6uoBIv/dlE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-8dpz_MsmPFqWnMFiwIX7DQ-1; Tue, 06 Apr 2021 10:27:10 -0400
X-MC-Unique: 8dpz_MsmPFqWnMFiwIX7DQ-1
Received: by mail-ej1-f72.google.com with SMTP id o11so1846506ejx.23
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 07:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WK/+Q636j9NbcjKaUJ90ilbbbJkCMwCKcdTntGnBjDU=;
 b=labfrJEQhtPQu6nDo+d8tMAw/mBPGyTbT6FNVHnh+/w1HsVUNcvmVMs6H32ZXDlbYe
 8lBQOFzUzAY3Mm1xR1ntbDT4KoIOyKQWvRP8zpe+2D99JVmCIppGKd9CEdgNvugOGRHy
 7JZsmhr3u5DD0fLcALbn7oktsUXMVdImGibCKX56a9L3dx1H26wjZzhF6DkLJeQekLa2
 78768zi+pVvJAj39CTY/1UVT6Jy1COilAzda9kVVIt3RfYqfbb9p7SFqNnua2u1Wa1gU
 J0pt8SSR0XnOMV5KjYC1YhVPm9ZBclKyy1+xYOw13EKuJbz8hPRlHsJtiCRRcCa/vQrC
 3SLQ==
X-Gm-Message-State: AOAM532g0k/2Ick43+sOwix9DJav+0FnmhSnj0LmjcS1nCK3CUhYR+b2
 JIYADbW7sp3k/NIVnFgFE70XDQRfjxqtIfI6oQFzhlLco/XCIOVviYUoHSiHcR321NpqzB9IjjS
 OYv4oTy9cMisU
X-Received: by 2002:a17:906:1f89:: with SMTP id
 t9mr5727154ejr.144.1617719229188; 
 Tue, 06 Apr 2021 07:27:09 -0700 (PDT)
X-Received: by 2002:a17:906:1f89:: with SMTP id
 t9mr5727120ejr.144.1617719228860; 
 Tue, 06 Apr 2021 07:27:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t15sm14132064edw.84.2021.04.06.07.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 07:27:08 -0700 (PDT)
Subject: Re: [PATCH-for-6.0 1/2] disas/arm-a64.cc: Fix build error
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20210320041854.68668-1-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <06a9d6c3-b0e6-9aac-0d97-979ef319d353@redhat.com>
Date: Tue, 6 Apr 2021 16:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210320041854.68668-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Kamil Rytarowski <kamil@netbsd.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7eS/EEYOnB7m

Still worth 6.0 IMO.

On 3/20/21 5:18 AM, Gavin Shan wrote:
> This fixes the following build error with gcc v11.0.0:
> 
>   # gcc --version
>   gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
> 
>   [969/2604] Compiling C++ object libcommon.fa.p/disas_arm-a64.cc.o
>   FAILED: libcommon.fa.p/disas_arm-a64.cc.o
>     :
>   In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
>                    from /usr/lib64/glib-2.0/include/glibconfig.h:9,
>                    from /usr/include/glib-2.0/glib/gtypes.h:32,
>                    from /usr/include/glib-2.0/glib/galloca.h:32,
>                    from /usr/include/glib-2.0/glib.h:30,
>                    from /home/gavin/sandbox/qemu.main/include/glib-compat.h:32,
>                    from /home/gavin/sandbox/qemu.main/include/qemu/osdep.h:126,
>                    from ../disas/arm-a64.cc:21:
>   /usr/include/c++/11/type_traits:56:3: error: template with C linkage
>      56 |   template<typename _Tp, _Tp __v>
>         |   ^~~~~~~~
>   ../disas/arm-a64.cc:20:1: note: ‘extern "C"’ linkage started here
>      20 | extern "C" {
>         | ^~~~~~~~~~

+Kamil & Eric for:

https://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03321.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg450478.html

> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  disas/arm-a64.cc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
> index 9fa779e175..8545c04038 100644
> --- a/disas/arm-a64.cc
> +++ b/disas/arm-a64.cc
> @@ -17,13 +17,13 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include "vixl/a64/disasm-a64.h"
> +
>  extern "C" {
>  #include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
>  }
>  
> -#include "vixl/a64/disasm-a64.h"
> -
>  using namespace vixl;
>  
>  static Decoder *vixl_decoder = NULL;
> 

