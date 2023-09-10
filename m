Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp615735ejx;
        Sat, 9 Sep 2023 21:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCmD5L4KczQwtDUl/O8bJrciSHEiZjFJ8PmlHu6TiNJWDRRabe7CfZj9kBRRPD7o1DmTlP
X-Received: by 2002:a05:620a:254b:b0:76c:de57:7b61 with SMTP id s11-20020a05620a254b00b0076cde577b61mr8293146qko.25.1694319694040;
        Sat, 09 Sep 2023 21:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694319694; cv=none;
        d=google.com; s=arc-20160816;
        b=UKL4GtKzH25v4yBfvJgXCmMP3sX2Wr+uBDU8p8Ia2A0obJLt2Wa2s9nvy3rPfDK3YW
         qO42Li0fA+xI7e7Dwa+Zkrcnnf9j+rn8CHhDs3oVU5kwSkKaOb5lIk8PTG3AdT4G2Y2a
         59OKV2GrWyAslzJW//vUK86MHJsn1/FArtLgG6S0bKNpL7Cd4XM9RXL62L+PiwhiCT1o
         ykQep2B/QrgRwHHoHClWxuRLy163Udmo2Q+X9Oe+POslBb3e+Hmz49hlODZgtf8U+uA6
         iQYwbGsM4wx6o/c+f48THLdRwO9xrihpCg/rKgkFcqhb7gKn7r8op2Eqms8onzqq1809
         HPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Idn4SpoXhTBIcUWssorGxVnrnkjVjGBeBPgU3vnJMx4=;
        fh=vwr7iB4DEoccMdbHYQuB7k5VDlpJj7Qnu+ANj7nSoQk=;
        b=z+3lyeT/c32CHW5GqO0islsBO8bU54FsysFLTvWfUq68KexRIDbPkdwNoxLULT5kpN
         ueYbEG+V6hX85ysKXa13JwEz5xWHQ9Dduj9LB7vvWKuFp4n0cMP/v7aMypFat9epAzTH
         Du1jvYLyDT/G80i3IvvkqlkqJUP2WOTrDBd69AXVbOrUjbX/gOFYuwRAWiuC4xlm6+7M
         cJPaDTMmOXn7WbUxJ1YfrGoiu65qaos58QiZDb/blrHdR/r8NXVQjgUjK59XxaRm2bwJ
         GWszxMYpEAx6QeWzFuFgUxvNUq/ekh/XDaFjC1drkIa74j4amrHZEAwlUh2VO5zKiUW3
         j2Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Cko+fK6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020a0cca8c000000b0064727f18a4fsi1795703qvk.411.2023.09.09.21.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Sep 2023 21:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Cko+fK6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfBwO-00030E-N3; Sun, 10 Sep 2023 00:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qfBwJ-0002vt-Qr
 for qemu-arm@nongnu.org; Sun, 10 Sep 2023 00:20:51 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qfBwH-0008AX-1M
 for qemu-arm@nongnu.org; Sun, 10 Sep 2023 00:20:51 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3ab29af398aso2475627b6e.1
 for <qemu-arm@nongnu.org>; Sat, 09 Sep 2023 21:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694319647; x=1694924447;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Idn4SpoXhTBIcUWssorGxVnrnkjVjGBeBPgU3vnJMx4=;
 b=Cko+fK6OTVdOcRuRrYfZw4O/gQpAtwG7xzrUfrNFne9HI/Xw3h8BPkUqeeg21uDscr
 ljO2ruesKvm8upjFrPQw9mpbZKUCq9JR6SQAPJmGH4lXPnUpzEYc8AIcOSAJHQNpdDuf
 9BkhxAgcJdFoXubOFYMF56pOBZAG/VvbbnkHnWEsqV+SwzXWNUz81svzAF460UyokYGT
 s+FS+WXBruTIIZ9dtIB/aZc9n6blJG3aELtIzyiIpG5Bdwle/SPxwRqWQNFkTom8OG+M
 MVa9hYPgGaEF/9DwHK0NSNxpQkdtnrAVNDcQNM4kZRh2M2Bs2WIf0pocz1WIBjiS3OQh
 3l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694319647; x=1694924447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Idn4SpoXhTBIcUWssorGxVnrnkjVjGBeBPgU3vnJMx4=;
 b=M87k/1fxbRNvQruEeCY3YBU0e8bc1z86ocOS7eEMUd+/Ak8LD8I+dByCrcfgnoMQi1
 pQD/SI5bJCI2q7Gez3KFpO637KXyc9pDu5kxqRPsVN0PkvvQVv9qL4tcXrsDM0GRmVWz
 HVMtNLst6fyFxX4J4A01Fwbzf+PR5SK0/zSQmGIWUXIz5rPNTRz29Es2UfN93JLoQYlD
 /AwU12vS9uaF3P229hcUffr/A5PJm9LmUnsL1C/Q1fr3SHAGTlheod6ZaeE0f65kPwAa
 XTMPBBv4OVx+0C/F7PGfmxEmXSN9xxKs9rwziD/n+KZ52xWM7dO1xVRTBFpfgx4neLp6
 AUsg==
X-Gm-Message-State: AOJu0YyhtLTYcLKd+clLh7xfJqOzdaxlm9WTGp3Ghme+9kXKftGliXZ3
 zGYTkqRsugsoPgwi+aJ463hXjA==
X-Received: by 2002:a05:6808:198:b0:3a7:215c:e34 with SMTP id
 w24-20020a056808019800b003a7215c0e34mr8060616oic.15.1694319647632; 
 Sat, 09 Sep 2023 21:20:47 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a63b705000000b0056afdbd0a24sm142840pgf.9.2023.09.09.21.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 21:20:47 -0700 (PDT)
Message-ID: <fd472f38-e45d-4174-a179-926a6f501bb5@daynix.com>
Date: Sun, 10 Sep 2023 13:20:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] net/eth: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-16-philmd@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230904161235.84651-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /675BcCx0Pz2

On 2023/09/05 1:12, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>    net/eth.c:435:20: error: declaration shadows a local variable [-Werror,-Wshadow]
>              size_t input_size = iov_size(pkt, pkt_frags);
>                     ^
>    net/eth.c:413:16: note: previous declaration is here
>          size_t input_size = iov_size(pkt, pkt_frags);
>                 ^
> 
> Suggested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   net/eth.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/net/eth.c b/net/eth.c
> index 649e66bb1f..3f680cc033 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -432,8 +432,6 @@ _eth_get_rss_ex_src_addr(const struct iovec *pkt, int pkt_frags,
>           }
>   
>           if (opthdr.type == IP6_OPT_HOME) {
> -            size_t input_size = iov_size(pkt, pkt_frags);
> -
>               if (input_size < opt_offset + sizeof(opthdr)) {
>                   return false;
>               }

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
