Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4262539lfq;
        Mon, 21 Sep 2020 12:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtj19WhGExAnfFo0uCtSnJK3AXImm9ZZumCrKTVdjFyTCV4Ut3ouCMrQnCjE57DOybnsZ0
X-Received: by 2002:a25:da4f:: with SMTP id n76mr2241909ybf.229.1600718194219;
        Mon, 21 Sep 2020 12:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600718194; cv=none;
        d=google.com; s=arc-20160816;
        b=zzVGltd6+PHOQ1vhzpFZwY2v215w3XyViGa++3duwwKlMGTzCcAdNXj4ABW0G4sBar
         JQVzfQdHwlkKdtIiuaP0tFRNAlftSO24ADB3Uwi7utgLUqQMKD1OCAGmg9W2si13/Z4z
         hT4Ol5mKT3ZsjuvqT9E5wGTcMdk6MDFULmpU4wiytSFgEoOhp0yp0KYhcBM/IFWKlICN
         9rT0ayeophqeOth0DXEFJPq8dsONLCalBBqmqAOVv2tCGbWz16BeN71iICi4tUU/KDWo
         2UixHXXZHU3O9I9fQXDNhstdGyZfDnPA8pGUd7/AFgghdfGKyKEYwfm1Ov2GfGSlk1xA
         2SRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jV84NWfob7iFqQ72PXICmBExh/p25a+IK2AhAOvOBPg=;
        b=c4/vuQE4f5gdv8pSecxwBNlpfA6HR7/X9rtLQw132dCtfkPSoBjryK+WKu5eTPyyrP
         XniXkuUNyzP7onm0lr2wttM7U1aUUeF0Ya0tzSByY+3yXyl1ag7pXHa5wHFIPNmtf4DE
         Sz+wyKLEWg5B6W2/yJAPLt36Nsy+hzpfYYmXV/hMCSqkU/8Up2fvwBYLRvDJx8u+xZzf
         nnPHRt07gEwUF1EG2Cqj4p6THPmlK5PEQn13266SLK2xk7GF5ZUTk314XYJ03ndGeVvH
         M0Eb/QbJOSRYks8R51TCmOEcXb/wpm+h4l/tWp2bUTycUlN20M2Q24zC1UBldQ9J9RKz
         S6kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HZsqvPGv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si8078220ybt.239.2020.09.21.12.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 12:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HZsqvPGv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKRvN-0000CP-Fx
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 15:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRrN-00078R-Ud; Mon, 21 Sep 2020 15:52:26 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRrM-00017I-1l; Mon, 21 Sep 2020 15:52:25 -0400
Received: from [172.17.10.14] (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A82CE21CC5;
 Mon, 21 Sep 2020 19:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1600717942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jV84NWfob7iFqQ72PXICmBExh/p25a+IK2AhAOvOBPg=;
 b=HZsqvPGvn6tgrCJIi75pY+MnhiVV7pd+1A2OwJnVM0uBrm7H9rR6Z7FzIngOTaIfB63ysI
 UQ4+JIGy3v6d0p0QKPHDMqDFFk9A/2wLCo1sH+kUSoptRoKmf0MW34X1spUZKwDEsR3oGj
 bOaLAJMecAatdPuO4hXMAWvCku84aDc=
Subject: Re: [PATCH v3 1/8] hw/arm/raspi: Display the board revision in the
 machine description
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200921075628.466506-1-f4bug@amsat.org>
 <20200921075628.466506-2-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <7879f1d3-f367-addc-d57b-924c41606fa6@greensocs.com>
Date: Mon, 21 Sep 2020 21:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921075628.466506-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 15:38:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dcI4lbvx3goH

On 9/21/20 9:56 AM, Philippe Mathieu-Daudé wrote:
> Display the board revision in the machine description.
> 
> Before:
> 
>    $ qemu-system-aarch64 -M help | fgrep raspi
>    raspi2               Raspberry Pi 2B
>    raspi3               Raspberry Pi 3B
> 
> After:
> 
>    raspi2               Raspberry Pi 2B (revision 1.1)
>    raspi3               Raspberry Pi 3B (revision 1.2)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/arm/raspi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 811eaf52ff5..46d9ed7f054 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -312,7 +312,9 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
>       uint32_t board_rev = (uint32_t)(uintptr_t)data;
>   
>       rmc->board_rev = board_rev;
> -    mc->desc = g_strdup_printf("Raspberry Pi %s", board_type(board_rev));
> +    mc->desc = g_strdup_printf("Raspberry Pi %s (revision 1.%u)",
> +                               board_type(board_rev),
> +                               FIELD_EX32(board_rev, REV_CODE, REVISION));
>       mc->init = raspi_machine_init;
>       mc->block_default_type = IF_SD;
>       mc->no_parallel = 1;
> 
