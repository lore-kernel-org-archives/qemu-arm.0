Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5084651ejc;
        Thu, 31 Aug 2023 06:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwlADlm++kQr58j27HpgTZtp2sHoVAXansZMLILndIp1PTlpCPlcH6g1Lv5cbY9ropSoFv
X-Received: by 2002:a05:622a:18d:b0:410:95bd:d43d with SMTP id s13-20020a05622a018d00b0041095bdd43dmr3100140qtw.51.1693487593352;
        Thu, 31 Aug 2023 06:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487593; cv=none;
        d=google.com; s=arc-20160816;
        b=SU1oYd+4EDTegXyJ8eUr1PQ2Ivq//chUbUIV60qRSdQLx1pqIu4mFne0exO9zfZJYM
         8yqRQgjjyu0KzQYeseZj9kQscKmtOCglk3b5L/WiyPX3K4dOIhw7/e+BJ1ko22vVYi2V
         nCig5j0HVrUc3ZW2GvFpg22E0Eym4j/PEoY5wfsScCk8SYl58rSHK2nNXVIjHhD3j9DP
         akHXUe8UTXeO0fpAXwDJO+AT7L9w0CH78mfIDkmRTI3ThAuM/hPbAYDQ3UEKD/RqimU5
         BBqhHTUEtOkCycAQF5sUEHZkPK745/ZOe3AuiLg7JELuGMfYXIsKi3MQP8A/m4K6pLkQ
         AABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=oTElfa6x1asqO1yVDwx+AkTTcj1GEqgMR6IvF3lJxt8=;
        fh=39XuJaeA0CMDOeOmJnRHnRp4sFvUkufNLN50yAlZ+lE=;
        b=Jyvy/pQGJed1UtEUnCl35z2Xpj5rgiavbu5PRya6a/lcdJFRc51xjp6WdAP4WatsD4
         /c5cAkT5CHFTCG4CmjUShsIJHCfCuNJ4qvlu0vLSg15HnUR5ZXuqdiD9J18tN6m/FZTT
         oex/Q8M0jQvugMih4g1ZC5HKFSx09i0ke2pcmv59a+PZKKfMat/h741Ge2aVONA/x/3Z
         0DjdTSiGqtAfpGYv+lKEK9qpgyAzCnHmuW7fwtOaXyhKKISudSvswEnGlS/DmJGoBWFL
         7/XkS4mgV4LC5cHMi2wmnjIaAYgH5/hx8noQqf9gRQ9lWVKesIkvPQ8jKZxoTsD0ARqZ
         djjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21-20020a05622a1a9500b0040681c1920esi864770qtc.343.2023.08.31.06.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhOB-0001GM-UD; Thu, 31 Aug 2023 09:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qbhO9-0001F7-Aj; Thu, 31 Aug 2023 09:07:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qbhO5-00005s-LP; Thu, 31 Aug 2023 09:07:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9D4461E3BC;
 Thu, 31 Aug 2023 16:07:27 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7D3D424D23;
 Thu, 31 Aug 2023 16:06:53 +0300 (MSK)
Message-ID: <cc0e09e8-8ffc-741f-1ac9-5cebe312b684@tls.msk.ru>
Date: Thu, 31 Aug 2023 16:06:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PULL 39/41] meson: Fix MESONINTROSPECT parsing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20230831125646.67855-1-philmd@linaro.org>
 <20230831125646.67855-40-philmd@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230831125646.67855-40-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -103
X-Spam_score: -10.4
X-Spam_bar: ----------
X-Spam_report: (-10.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.478,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vHRCEZhV2Mht

31.08.2023 15:56, Philippe Mathieu-Daudé wrote:
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> The arguments in MESONINTROSPECT are quoted with shlex.quote() so it
> must be parsed with shlex.split().
> 
> Fixes: cf60ccc330 ("cutils: Introduce bundle mechanism")
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
> Tested-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-ID: <20230812061540.5398-1-akihiko.odaki@daynix.com>
> ---
>   scripts/symlink-install-tree.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
> index 8ed97e3c94..b72563895c 100644
> --- a/scripts/symlink-install-tree.py
> +++ b/scripts/symlink-install-tree.py
> @@ -4,6 +4,7 @@
>   import errno
>   import json
>   import os
> +import shlex
>   import subprocess
>   import sys
>   
> @@ -14,7 +15,7 @@ def destdir_join(d1: str, d2: str) -> str:
>       return str(PurePath(d1, *PurePath(d2).parts[1:]))
>   
>   introspect = os.environ.get('MESONINTROSPECT')
> -out = subprocess.run([*introspect.split(' '), '--installed'],
> +out = subprocess.run([*shlex.split(introspect), '--installed'],
>                        stdout=subprocess.PIPE, check=True).stdout

This turned out to be wrong on windows.

/mjt
