Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp177905ejv;
        Thu, 11 Apr 2024 13:54:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWfoQX5sBp/dm5EwKe+S4z7xEe4i1IAAgDRx3ycrzSx596WMX/MAR+lnYF2v7UcqHihG23mq5rBmpiBsi4b7YA/xg21LE0
X-Google-Smtp-Source: AGHT+IHSSGhH0RFCmmtiVNGBTrAljIGk+vxN1S82eTYpduijjjhwbUBxLPGAx0lLCWFyVgj7S74u
X-Received: by 2002:a05:620a:8c03:b0:78e:c301:1b48 with SMTP id qz3-20020a05620a8c0300b0078ec3011b48mr3515961qkn.24.1712868883238;
        Thu, 11 Apr 2024 13:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712868883; cv=none;
        d=google.com; s=arc-20160816;
        b=h6ehkQphAoJJ4FjpJFGQ4qiQv9UY5jmBmmxClh2TU8dFo14T4UUdvurNol06qVfu6D
         XV2c0VIK49cNclaTRxxhkx5HRTiB6oZu4zKQHEGExFZjCOnP0lIauan2EwKPVT+5JI90
         HJmSReO4nJMt3ZZS6htBbzqU5gm7il57/zFRbg1Nj4U3RepriycPgOwB/O3aHvl3w6aH
         g90bvjbnVWsujJB6ixG0Gmjw4mZ94GXDht9d0bBdUDtlzC6O9jjCbF++QaGGc7PefHOC
         HuDxMAfnRVY3emEzbzfd8KTRihIVQPHG6B2mbPqMfdW7dKWwzJj0FHJNGo8Wc+byCD8B
         88Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8kFh1bUn8wCBoA1if8y0uBAHiFo2LlhWP35Q9LZcmac=;
        fh=gZxXWFfA3GfIrZnd1/ry64X3TY+EzkqX4DokbgazV0s=;
        b=halykbhpWuVJkRrsC0QI4acb6BacVgBhjeJhtasm3ZQYrK4cCE4sCQQKXDo6nzRE2i
         RMgPHCwXlOcIa1lgwOPzrcpBnmr7fu/Rti5iO1/rueVbnfV1SOe8qQ0GezEKmK9Du0Ol
         XBGTbpXT8Uzb3/7eQ1QzJM7/a0kDHkaVvxXAw30WAX0jMBjE+99lenulIo3VttXxTEOZ
         etJB1OWuB3dgx4Esxa6SkMiTtkAuUipE+XGwKHrxOkoIzQx1+cx1xblE72vF6yuV2aou
         J9LgnQ4RZ2DU7UizFTwp7crMJn8g545JHW8AA38KszoM598PEgp13udGm92e7FNrBtKR
         M0aQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gTRX1uXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020ae9e708000000b0078d747cbed2si2378427qka.421.2024.04.11.13.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 13:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gTRX1uXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1Qt-0000V6-CY; Thu, 11 Apr 2024 16:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1Qs-0000UR-6w
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:54:06 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1Qp-0005Zj-Hj
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:54:05 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6ee12766586so182344b3a.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 13:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712868842; x=1713473642; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8kFh1bUn8wCBoA1if8y0uBAHiFo2LlhWP35Q9LZcmac=;
 b=gTRX1uXPm8KgL+Dv/TxVHJl7CFYTBBS+ShbzEUijYU6djc4UdkMW5zzaFJM7MWKmLb
 35z3vLN9hXEIDG8QkZAu/jiBBWoQ8MHD9gtDm49GnCF765nFnPe0W4Z3Bk8oXJKf5nGX
 hAYwsMLVPfKUvnEGMukm/TOmEIUNh1hkpqaZOs0KxGrvZHtwbRnxO/l/XsLL6j5N1OOl
 iaVnUI+jYv70tMgOeipwMfiBal/0L2+NkZkQjU/azZ7BatR6gaus5r25rxxIshSJriYa
 dkEQWgrej2P+I+ZuTSC3+0D5HARgLJNQoAkMFzZKPUFuqInOkogB+Q5WPDTHsiceB2sR
 B25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712868842; x=1713473642;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8kFh1bUn8wCBoA1if8y0uBAHiFo2LlhWP35Q9LZcmac=;
 b=BMrtbajhSKG1VTxC45yJF6iHW5h+Ey+avGklSIz8Xtux322jLysniwqaBgtSVhA9PG
 cNhQvIokxxv+FXZ/eIYdGqkrMI0e0g34v703ZlMF6/5gTFY9YkW1h3pvpYdtuzBWFS09
 fE5MjmV8BdfI6M0TkzfZCwtnXAZNwedNgL378iALTvtmRDQR7Sk4WWAjjxb2pL+0NKz2
 7DhnTLFYjozh5FTcDMa41w53wAuSIjNUYCqpKg8fIyTUbt9U9hJy6PppV34yYR2UV0c/
 yySS1UjKE8QMyBOi9JYoNlCdtp/jXlISznGNcFwZdTtHEBXTJSsuHG+QiHOMb2R3g2QB
 h61Q==
X-Gm-Message-State: AOJu0YxrezBad65rZYN+f+IVegXk0pslxMwrKVbXuxJ6ymMKA5y4MZQM
 yNxVkPJ3a4Te6HNte9cqeVaPkeuvJjQWUHrO8m2f2gj0sU3rZbvDLY4rlZ4uPek=
X-Received: by 2002:a05:6a00:939c:b0:6ea:c7bd:90e3 with SMTP id
 ka28-20020a056a00939c00b006eac7bd90e3mr1040492pfb.14.1712868841223; 
 Thu, 11 Apr 2024 13:54:01 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 z3-20020aa79e43000000b006ed38ae38f2sm1594967pfq.121.2024.04.11.13.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:54:00 -0700 (PDT)
Message-ID: <170e5227-2ae1-4028-bb70-c2b5559dd068@linaro.org>
Date: Thu, 11 Apr 2024 13:53:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] hw/scsi/scsi-disk: Use qemu_hexdump_line() to
 avoid sprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0PSJOywrMUrW

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
> 
> Use qemu_hexdump_line() to avoid sprintf() calls, silencing:
> 
>    [105/169] Compiling C object libcommon.fa.p/hw_scsi_scsi-disk.c.o
>    hw/scsi/scsi-disk.c:2659:14: warning: 'sprintf' is deprecated:
>      This function is provided for compatibility reasons only.
>      Due to security concerns inherent in the design of sprintf(3),
>      it is highly recommended that you use snprintf(3) instead.
>      [-Wdeprecated-declarations]
>          p += sprintf(p, " 0x%02x", buf[i]);
>               ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/scsi/scsi-disk.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 4bd7af9d0c..4f914df5c2 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2648,16 +2648,12 @@ static const SCSIReqOps *const scsi_disk_reqops_dispatch[256] = {
>   
>   static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
>   {
> -    int i;
>       int len = scsi_cdb_length(buf);
> -    char *line_buffer, *p;
> +    char *line_buffer;
>   
>       assert(len > 0 && len <= 16);
> -    line_buffer = g_malloc(len * 5 + 1);
>   
> -    for (i = 0, p = line_buffer; i < len; i++) {
> -        p += sprintf(p, " 0x%02x", buf[i]);
> -    }
> +    line_buffer = qemu_hexdump_line(buf, 0, len, false);

This is adding "0000: " as an unnecessary prefix, because it's added by qemu_hexdump_line.
I think having qemu_hexdump_line as a primitive is good, but probably the offset argument 
should be dropped and printed by the two callers that need it (mostly qemu_hexdump).


r~
