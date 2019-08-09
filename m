Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9364944wrv;
        Fri, 9 Aug 2019 08:49:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvkwan6b0d46fIsw+VbedxYU79UOUG7brEDkg53rYBBcXdd0Fwhira1usIWT7a4CQRCMtv
X-Received: by 2002:a17:906:4d0d:: with SMTP id r13mr7819651eju.77.1565365769020;
        Fri, 09 Aug 2019 08:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565365769; cv=none;
        d=google.com; s=arc-20160816;
        b=IvhNFWfX9r57arkzaQ7nZBRQCAbREkyT2h+bzfTa/jiKz8kd+SeDB/19ZLQ3stP+Tz
         9AmK1vRLntNnd+si+yVGqEiiwqFapdqx96Oe3u3JYPhx1FbqhE9zZBEafYgMD8fzX2LA
         m2u6yAgQT8MhxLhPWIhRD9y+DTPFTrUHvOU3sqBKkP0XgAM0IIqHu1j7aeuD1+wl+Xlc
         wpeaG6R39IiSqIWMAPllwrpldUIJpnPx7AovhqME7Qt/+miuq3htPplwcj+qEdRmVwGf
         dqH/F6KoD52SsaMb1ZyOWKo2W4H1/RJ6n1mCAUwX0xGdBvHBELsvoHgbdHhw8HDf5omn
         eA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=5Oi13/rZPM+SHevM7m+/KQw8/CzWh3xVBc3OgoZVhB0=;
        b=Kd2B8dAHfNHNU3Txk57ZhrcdwTC1CpCav52NhurBb7hF3XlfZofwX9mzuDCrSUzCi9
         2NMcbgX1p9ZVkQUPYZvJnqjx3OWaQurWLpECWbt5XdTk6lNWS2IpWpKPvpKHbyUVJY6+
         6XLHeuRAgnbJ5j1LxiZvH8D4YqGupblHmqeABlD1G923G357GER+r4rL73xmAuIBJNna
         Nc4YfUskXwXd5WeeeGyOLAN73ju6w8ZFxt1OEK3bKsdO21kzGXTP2/gXt12G0W1hQ5aB
         ZMa7g1O51Xi3lFR+huucKr2Wd/GTShVED0ZSYBT6SAA4/dnlKGZDbE71uwPKUrmTIY74
         HRXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg14si3083681ejb.333.2019.08.09.08.49.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 08:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw78y-00007f-4k
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 11:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hw78R-0007WP-I5
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hw78Q-00051e-I5
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:48:55 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44820)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hw78Q-00050q-BS
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:48:54 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so98668020wrf.11
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 08:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Oi13/rZPM+SHevM7m+/KQw8/CzWh3xVBc3OgoZVhB0=;
 b=gmWoMZCWmjPJHLKLsj3ncjf4fKE39agcpQ5CWhiWdvuTCWRzTL7s3p+QJbN3D8Gnyr
 04zNSbVr4PB6FsLKk898cezwdNbr4/L0M/IeAHNe3QaVVlNzetbqkcGxByn4utOHptIa
 TRa5xY3CThfnxVaBBWKHTcSwyGIfzqKpnThi0qzFq9pkT+HYzUuNU04r122zG3ERYfLE
 fucVMC9acbBfxlcT4e64TrdSw+UgsFI5Yj/h9BkaI9q4Kqh8psJqg+Dx4SrFUiJh6lGP
 dNNwxjymRAp9+RcgpesI75iU0/2DYju/w3PO8Dv9Hf6ZA8YGvzFOECjAsNg52CIOLgPU
 u9fQ==
X-Gm-Message-State: APjAAAVfAGi3qjRg7xG+1OKfPeQSdZ49QEIiFaQoP1hqCvqt7jMyUYkh
 qmMJvHbsDdDHPJGPvD0ZUp4EaQ==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr24111168wru.156.1565365733268; 
 Fri, 09 Aug 2019 08:48:53 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id p3sm5238896wmg.15.2019.08.09.08.48.52
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 08:48:52 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190809154153.31763-1-richard.henderson@linaro.org>
 <20190809154153.31763-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2ca2d3fc-36cf-b3ef-8220-4bce3898b633@redhat.com>
Date: Fri, 9 Aug 2019 17:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190809154153.31763-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH 3/3] target/riscv: Remove redundant
 declaration pragmas
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
Cc: peter.maydell@linaro.org, Alistair.Francis@wdc.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vl2+yWUqXkiZ

On 8/9/19 5:41 PM, Richard Henderson wrote:
> These are now generated by decodetree itself.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/riscv/translate.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8d6ab73258..adeddb85f6 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -708,26 +708,9 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>  #include "insn_trans/trans_rvd.inc.c"
>  #include "insn_trans/trans_privileged.inc.c"
>  
> -/*
> - * Auto-generated decoder.
> - * Note that the 16-bit decoder reuses some of the trans_* functions
> - * initially declared by the 32-bit decoder, which results in duplicate
> - * declaration warnings.  Suppress them.
> - */
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> -# pragma GCC diagnostic push
> -# pragma GCC diagnostic ignored "-Wredundant-decls"
> -# ifdef __clang__
> -#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> -# endif
> -#endif
> -
> +/* Include the auto-generated decoder for 16 bit insn */
>  #include "decode_insn16.inc.c"
>  
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> -# pragma GCC diagnostic pop
> -#endif
> -
>  static void decode_opc(DisasContext *ctx)
>  {
>      /* check for compressed insn */
> 
