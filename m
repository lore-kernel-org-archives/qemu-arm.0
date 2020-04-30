Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2235600lfm;
        Thu, 30 Apr 2020 11:51:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypIcr2BoJWC5EUjaZW6FHcidXQs2y8rwlzUBEmLWsexkNi1gSs+A7lGWdveOkfp19IXRwZi9
X-Received: by 2002:ac8:2ba7:: with SMTP id m36mr5162102qtm.254.1588272696023;
        Thu, 30 Apr 2020 11:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588272696; cv=none;
        d=google.com; s=arc-20160816;
        b=z/4PHMKwr3z/hDiS42ezuOA0XFW55N5tFNmNICpEsn+40yOCE5fw3op1d0mLr/uoCd
         JdlMSEgEqdOzciqJJe7BQHyvPsZkaFQVLzzAlQBsTf5CVPPLs437fAkme2IxthrOqShh
         Mpzpi4jOUo8WdHTef4ETRFZGZJ6SE1BPW0JLwHWzM2Zm7ejwzfUJyg51QXbdr1CNkX+p
         MR2hD4siGSbXyx+DpgpVccKIk0PqVWBz280uMnT7ZfuQPgQ8olmeNBE/ReVuJKzg1cOt
         yNAxTILzeID9uIkWnAqsAxYRZVpV9Pz473Jc2OuuaEEMlUTFRc9Ri7xVYJJhjMvWtYGy
         129g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6OOFLUi1SxWtdgBWXWd1AWCvifhTD5to69ewq6+eyP8=;
        b=fMC8dpRuS0L29HuDKjQAg5zcOwXiWUGfhJzf1Ty783jQQmCUWhTSu+VMlTbArUwQzX
         TRrvXgxvWBUjVtrh9TDtxd3eQm5GbXzAkSUiNN1MFoRLKFJmf+qlQbVNMkpe3wjqYces
         w9xsmpqI2BcTTntSA15xB+b3sSDJSeNjWAvz+0LBxc3tmzqpz+cq6KZE/qoUyjBtQlS3
         RDWaH8qdK2vIPTKazCxyVzr9q4pl+H9ipD71xZZMVv49ChnnjBlCGkZxHRtEMvXD2HiP
         uamgGtUkWIf0z1mjqJIfGV3fw84C07XmIISKPvPfH2eX59sHssEFVV3XlXvtdfUu/Lkb
         gO6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uyaEiF0J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id y3si242982qke.231.2020.04.30.11.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uyaEiF0J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEHX-0007Wf-DW
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEBi-0007Ru-6J
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEAE-0002FF-19
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:45:33 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUEAD-0002Ez-Ib
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:44:01 -0400
Received: by mail-pj1-x1043.google.com with SMTP id fu13so1123639pjb.5
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 11:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6OOFLUi1SxWtdgBWXWd1AWCvifhTD5to69ewq6+eyP8=;
 b=uyaEiF0JsnWBmkL5w182qFAbEyJemoI0YjZ/TNjSksiGeqQNp9BQUVgYphRgTq01GZ
 mn1JsFeNiwqhFdfcIuNObmZ5VfieHM7d/tAXHDuvR195sq1PSoqY76H4DFSmlnPPsYKO
 iZ63tnnnxOVUsH8nEHh62rmaHSXtt3GphiQC2cD7X1QF3io8nn9CoNTK0eNrcXpkhh/g
 MQ8jZSvuZwlBlWZvTcy0xTYLRL9U+q2kluSYcYWD0oaIuXTWF223H1ZkjbLj/rQY1Ujp
 ARIaoMK2vAPPsdk5fqXWCrW2WYIxGUCiyk4L5inrHY6WhLHde1Ql9MnQQioA7GHMnv1D
 DC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6OOFLUi1SxWtdgBWXWd1AWCvifhTD5to69ewq6+eyP8=;
 b=PB/+9L1B+iZcgguAjVLwBO0ATDKrlCjhJqZD8V0mm+8JtYKNI/yiBOqUcjoHVum0d7
 Q1XuFc7stbdNW7w1OEZueqXTK8+j4qT8XkfY3Ao+uZd4MsiCVYYRsNUfz216ax45FjnD
 UkWSDE21TDX4Vmx+P1eB8L/0Z9pVog6/gH1CkZIdlYnoGARPHMPttmj6i/eKAV4q1Nuc
 f65GaZx+ctnBcN+KMf77VHbo4Zy4lzUpgNI9x/3lI96pt88UvWXITYCqBTyiUwV0qqet
 DQX1WaZxmsC+8K+vCWry5/JlqySp+3o8WYKgJrCuEjdf2r1wPSZoHKIY25FkdoaksA9k
 dqCQ==
X-Gm-Message-State: AGi0PuayUnU/GvLLTQUISnK4JSX7UYfONxPqcB7XQ9vqcd2QMag75bho
 TuRkE+2+BqeS1hKgmdx5dUr8+47F0tk=
X-Received: by 2002:a17:902:d34a:: with SMTP id
 l10mr379388plk.234.1588272239314; 
 Thu, 30 Apr 2020 11:43:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 184sm422206pfy.144.2020.04.30.11.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:43:58 -0700 (PDT)
Subject: Re: [PATCH 07/36] target/arm: Convert VFM[AS]L (vector) to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82a9f876-e965-c33e-4f80-1e0f94a0d6f2@linaro.org>
Date: Thu, 30 Apr 2020 11:43:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1043
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WhWMXACCexXg

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the VFM[AS]L (vector) insns to decodetree.  This is the last
> insn in the legacy decoder for the 3same_ext group, so we can
> delete the legacy decoder function for the group entirely.
> 
> Note that in disas_thumb2_insn() the parts of this encoding space
> where the decodetree decoder returns false will correctly be directed
> to illegal_op by the "(insn & (1 << 28))" check so they won't fall
> into disas_coproc_insn() by mistake.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 31 +++++++++++
>  target/arm/translate.c          | 92 +--------------------------------
>  target/arm/neon-shared.decode   |  6 +++
>  3 files changed, 38 insertions(+), 91 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
