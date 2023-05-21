Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp609601ejb;
        Sun, 21 May 2023 03:47:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6epWwhWgMzAiPJUVeLZrow567uYXjyZFP9bdst/yxrTy6IMfV0ckhJc8vsPOpdqrYqaTRn
X-Received: by 2002:a05:622a:44e:b0:3ed:a2f5:f27c with SMTP id o14-20020a05622a044e00b003eda2f5f27cmr12449287qtx.12.1684666070240;
        Sun, 21 May 2023 03:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684666070; cv=none;
        d=google.com; s=arc-20160816;
        b=g9rIlPqVbACc8Zetx4GOUtz+kjByRQgG73H0DV7Vh2PfYX0cuBTjvwzrcSv3KGoPQ/
         t+HQD1vgcWFn8DaUkDMub/LanTymeWJ2Aacmof/s1TwxZ4b9qhU+hzlZAAK1bAZnpZbp
         J9x69BjQ7A2N5be0uQh6huoRun6mRNkhMIreHfloj853Ngd4khU8V7LCI9T9QLfY1UXw
         ZyGvXZ/vM1o7fS2OobuHmXN1D7Yg+LztZJEf0ysAuxEzfUhUWlcEqBeO2T2wtgjGNrBh
         lN+PUc26bL+B+GjLbIT49DKu7sg2ky5aJwSgCvpcirZL/UKp6c966z38GxO3ZG0QfzvJ
         DEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6cYsSlpsUo2NEw0M7LWJm5pe6RfuXpa7vSt/MgnCt98=;
        b=toxxlnVirgPSVeWGDULURt06fmXyAhsJV4L5sIotTLxX5EbiiZOG42b3w513kdgJV4
         IvVmWsoQUaJlKsQX7Kj/GcC/5nXY0FIng5NqKa+fLlfdDO1x4uK1dz5O75oUVBrio8ay
         9vVZGZUIFSds/QAetNKFDhIU0IWvAjQQNyg+4lDokbvifXYmxU9ABsbCImK/JwQdJJH1
         vDzy9E5y05ubCajNoImIgqEerz0AflqhVhHzdm2g8FT7pXzMNH2wF6ZDVGSWZiNuNQ/I
         /oSoJMDWBS1H65XTFElOKFhkuf+arkBwlVCxs+pQ0wt71peEJWCBV7cI89soeJDNbg/G
         AxJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFCa90RW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ae9f10d000000b0075aca7bdd6esi1823066qkg.674.2023.05.21.03.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 03:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFCa90RW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0gb9-0002V8-UM; Sun, 21 May 2023 06:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0gb5-0002Uh-IQ
 for qemu-arm@nongnu.org; Sun, 21 May 2023 06:47:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0gb4-0007fm-0A
 for qemu-arm@nongnu.org; Sun, 21 May 2023 06:47:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so48578175e9.0
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684666048; x=1687258048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6cYsSlpsUo2NEw0M7LWJm5pe6RfuXpa7vSt/MgnCt98=;
 b=YFCa90RWXZEDaRh95VEL91w8G9X8th3ucm/fh1edHuHJ8rVzeS39Bpgwi44v/mhlf4
 f+oVqX/P2K/W91U7q+4ZJf4s3XNeO0dx+KJIJ6eUh+Ws52W9VgExJRc+/6NAweurafDK
 Xod6iRS+iSDsrcQDHo5sqCa5J5x/EkphI72roQT56aX18ch5mhgWalJMoExGchTEj4mt
 3MkBomaPsKkgbGmObTW0bVism36rqB1ykcWitPHxl1EmXbvJHjksCLWDZTaLiXhwmADU
 zLEPsaAP3NMFH9xPgJ/4/ZAh/u3l9O63Ww/95iB+wKYbdsPAlz2+9EjMmGjmIj+eM0Fy
 oDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684666048; x=1687258048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cYsSlpsUo2NEw0M7LWJm5pe6RfuXpa7vSt/MgnCt98=;
 b=CZ0ZeXmpefZC4vMAbRpse94nkx5C+pnN8bpnVnVnRDVu6G6X80+unkuUkw4JA4ZBe9
 oAYCwEI6PCn2UuM+MYRNxUS49DnIrMCRjPfL9S8Y1aKDQFdadCHxeOg0md2BXsJf0TeA
 caT4H5XPrEiZVq8r4Wid0lU3pkZaYYJhItUasGeFSRL9g5MuYXhy0f1PJ4HSwXM3y/lJ
 YqiH1GFwtQS7tYtdPiuJLF2owo2VuWPdJJxhqXoA3LtdU2SFcMISgHVza4H3I3Ypz6tv
 cbK9+HyBGMVD8DdVW0OQcGGvAWJa/pA3wOkT2svQigVpmzTc6eHxIrQph5N67lKVycb8
 oAQw==
X-Gm-Message-State: AC+VfDxrRzq85Xd0G/7PxY89QKZCZFGs3FEuEBIAwEl28y23BdEDACgd
 aCUqqs9BxfD6k1MaMekDCW6QzA==
X-Received: by 2002:a05:600c:245:b0:3f5:4e1:2a89 with SMTP id
 5-20020a05600c024500b003f504e12a89mr5163982wmj.34.1684666048393; 
 Sun, 21 May 2023 03:47:28 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.177])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bce09000000b003f4247fbb5fsm8028151wmc.10.2023.05.21.03.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 03:47:27 -0700 (PDT)
Message-ID: <80ec6d3c-f4bb-2513-ab88-4179e3396c23@linaro.org>
Date: Sun, 21 May 2023 12:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 01/27] util: Introduce host-specific cpuinfo.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Juan Quintela <quintela@redhat.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230520162634.3991009-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /dbC1E28L8ig

On 20/5/23 18:26, Richard Henderson wrote:
> The entire contents of the header is host-specific, but the
> existence of such a header is not, which could prevent some
> host specific ifdefs at the top of the file for the include.
> 
> Add host/include/{arch,generic} to the project arguments.
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   host/include/generic/host/cpuinfo.h | 4 ++++
>   meson.build                         | 8 ++++++++
>   2 files changed, 12 insertions(+)
>   create mode 100644 host/include/generic/host/cpuinfo.h
> 
> diff --git a/host/include/generic/host/cpuinfo.h b/host/include/generic/host/cpuinfo.h
> new file mode 100644
> index 0000000000..eca672064a
> --- /dev/null
> +++ b/host/include/generic/host/cpuinfo.h
> @@ -0,0 +1,4 @@
> +/*
> + * No host specific cpu indentification.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> diff --git a/meson.build b/meson.build
> index 0a5cdefd4d..4ffc0d3e59 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -512,6 +512,14 @@ add_project_arguments('-iquote', '.',
>                         '-iquote', meson.current_source_dir() / 'include',
>                         language: all_languages)
>   
> +host_include = meson.current_source_dir() / 'host/include/'
> +if fs.is_dir(host_include / host_arch)
> +  add_project_arguments('-iquote', host_include / host_arch,
> +                        language: all_languages)
> +endif

Maybe add a comment "generic include path must come last, after
host specific include path".

> +add_project_arguments('-iquote', host_include / 'generic',
> +                      language: all_languages)
> +
>   sparse = find_program('cgcc', required: get_option('sparse'))
>   if sparse.found()
>     run_target('sparse',

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

