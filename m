Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp432597lfc;
        Tue, 10 Mar 2020 01:04:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtb+xASWPm85//4hd4t5o4bQkIuGZiSr4hofszFdKqHn/u+1Ou1Aeg5LgiR9AAS5T3Yol2X
X-Received: by 2002:a05:6214:287:: with SMTP id l7mr18376772qvv.142.1583827474601;
        Tue, 10 Mar 2020 01:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583827474; cv=none;
        d=google.com; s=arc-20160816;
        b=M5gcHWRFR9POK9Ssu7D+ddgQJi9xQp8foy58W6MwmUmigMYo2XY6qSoyESUF/GCcSk
         tWTsQ3c4L2IQc9nooS4W6EhtjURvSCwarhSqkaCQ/UxTFIYSn7t43/bUAJHjK97r/s4G
         f00mPGwTgR1DLs6fCVtGo+V7xASJa3sLhXWuLTfDNTiQ+BcpMMsp17t8l2yUv01do//Y
         FM9oBb5Gyw+MUskTpudPps4DgDL/2293HMAhy1I5mBVWjXrzdGLs01lVOT0qQkPuCd0x
         EFQSLq6VO6rpX7PvzCwWp0lOlmidb1wmCV0WvAazy4d9m7nukNRqID5qNPca7P/i7d0B
         nyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject;
        bh=c+npGrEGXRfp6WHzzlIDNt8f2sxzZk6/OhgqnBUqxuU=;
        b=FCXo+gk9PTKxeP3VUXPj+3xU1mrOzobUab2QqVl5zURazWVtlcopdL0QB4OZdSCZHj
         22DmKvn+m9TuP9SQRqZINU9Sb0+mAfNjXOC//OBMOoE4FqxUbexp0N5HMt1gHbWJ7g2b
         p2oFWd0i2CPUMXD8rhPlg+K1V2NLsGZPZlbzVgyO4cLPpfnNICd9Ij+rNvHhLIMnR2eR
         ZsAc82OijzrvaL0bNcA9n0zklH9le0UGGMmxeCfECLI3DKwVhzK61VbVszEkhqOBG3Ry
         pAn4WTWaUIqLRDL0CbdHs+amDvEsnWEb0j0eLE0t9HCH+2JnbXLJdcOQ/lzLPmyxAEJe
         1JQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si2178012qvw.43.2020.03.10.01.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 01:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBZsQ-0003yO-1I
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 04:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBZrV-0003TT-6D
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBZrU-0008KK-79
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:03:37 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50965)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBZrR-0008BD-Ro; Tue, 10 Mar 2020 04:03:34 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MElhb-1j8b2O15HH-00GGLv; Tue, 10 Mar 2020 09:02:43 +0100
Subject: Re: [PULL 00/33] Trivial branch patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
Date: Tue, 10 Mar 2020 09:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GK0EHf67tnwp5mS1BBx1c2NmH2cc7kZix51MFuxaU0c+g9SvWAz
 iL9lCntOuacagwnpOB/OW3+3vL2o3UMijKb2hp1s1nAhp28akoFEvhqOhKMFIl87nWw0HV1
 okxw1zNKpCVpSG8ZNSKOjKz6NcIfAgrlGCeheijZ/gYy7C8q8oKVyoEE2tyCvwuShl8+b1w
 ePGj0NGhp7N8IMuYybGtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9C8NqVNEXN4=:E+xGrhX7kxGhPGHY8EtGGZ
 wQG1ER3VuRPBWk/bppd7Zyxe7i4Cqyt1MSeHbukBfFQWRFEpxgSeFOYlVFNgyRBFEYGuIsmfX
 6zia7v3fVf1OPwWF99uJBfTITONtBz4xlNawPYSYZPHUTmSJSlqHTaZpwcp+QJyFXDqxOwBd6
 7PZaT+CR69qqjWZz/vOHq82jt3IpygXpWBsv82KJrQijQWhLGhoNRaIWUMKhB1Z4JTwqh3zsL
 xfKxix+nVxdJTcoSkHJ20wqkX3GiQyF7xzTUXQ3GxV9zAGv+v3XCZj8rxWPfWE2Kh2r6k+uDn
 sp2gDSDZvToXMe2WqRY/nVvnU7vqYD1s7mMbFSEk5+m2LaP90p3vkfmGf4tDEMHSPDIL1sHIs
 nemp4lCufUY7iYAC9y/+MkXpLzdae3gaqMd/9o2+d7e/g7O2XGrfMy2hAkXQHqAJ8lHXS1qsH
 17fze1Wpn+iAuaVKzkbqFar5hQl1KfSSEj+HL4QCgFU0qBfnPo1n5k3uJobIV0d0yJJmlogIG
 yRIR6AWyYr9j8v+dP9W5nTSUmvrFWj+OcrDvgcPy4eFkDCqiMIgIAUlnNDaJeOxZUWccBrO+7
 PJwCtwrrNmkBIKl9QCsK3bMtGQ8NY1hOI4DEPuSu4f/dkL256/GyEEI7XYLBqQ4rxskecLs5b
 2vyjQUYK6+6Z+vo5bjVUXRkoAj+Jo5ybEmAXeaiIrgHe5zOKG6Vkm5YOZW9P7cJvWs0OoYQsw
 a+CnpwpjqnFyWuEZBFkuxlvPS4dKnZROGqhSU47wBVrM/079vLH1fEH7t8pLANXFMvFst5bLK
 06bSAMbUBxTddL0VcYFEJStmVuJHBg68wPWtpUn1IiyrGnjNR6R4M3sD7KHqcsKAtxIXW2u
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vl2IFqd4OfoC

Le 09/03/2020 à 20:30, Philippe Mathieu-Daudé a écrit :
> On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
>> On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
>>> The following changes since commit
>>> 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
>>>
>>>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into
>>> staging (2020-03-09 10:32:53 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>>>
>>> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636bb:
>>>
>>>    monitor/hmp-cmds: Remove redundant statement in
>>> hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
>>
>>
>> Could you avoid CC everyone involved on the whole PULL req?
>> I was involved in a patch or two and don't really need to see
>> the whole series. Just the cover and the relevant patches
>> would be enough - if I do want it there's always lore.
> 
> I suppose Laurent used git-publish, which has this limitation.
> 

Yes, I use git publish and CC are automatically added.

Philippe, you told me some time ago you have a patch to fix this
behaviour and only CC people on a patch base. Is it available?

Thanks,
Laurent


