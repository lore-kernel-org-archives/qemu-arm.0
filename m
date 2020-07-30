Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2551792lfy;
        Thu, 30 Jul 2020 06:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5RQuvoo5Nq+vvavKAgWqoWVU0QNGqadmmYxfEk/50suPxT0BjzX2f5ewQpOElaDFsfN/U
X-Received: by 2002:a37:6d46:: with SMTP id i67mr35942638qkc.404.1596115092244;
        Thu, 30 Jul 2020 06:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596115092; cv=none;
        d=google.com; s=arc-20160816;
        b=vgkG1SM9pk0OZWcu+LhTDPLLd2jmHfEVMIC4MTLcir9ZL+82xz5X4gN17dB2PYM582
         jDVVGjC8dZPI+wkbU9JWWEn2Mk5HHGLkFZavRrjZhClyRN5f+E4ksmNiUowo69q8n3LV
         7VJmXxX6O26psj+Rlm5rKa7A5G2IlutTEvGEl7p6F99h3b0HbWkYI46frMKUZyMk+1yp
         jSmiKo+cbWncUQmx2HJlgRKEjWcsGVX4Y8MFndOC5lPWsqRbxo/OytSKhSRbGl535LUu
         p0fEb4oVqGBrtts++C1sGhFed58pJzAoNzSYBAU8SOjgw38oS3aW6coubhGYceapxnSf
         AbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=OpLzgsFkNX8PZg8qnS3MlSi1x1A+9qtPsiXmj3np3Zg=;
        b=e5LlXVK8c5AFdvQycOUE9xCO7acMiGIH2hZbdZ0P+QG71kCkdxviATM7sV2kNPEcUd
         l8G1Z2J7YhcQKaRBunTRJ4OiOioplhMJ/q+MZzEx/a50JKI0uUvoxITpS+r3ZXO/vowO
         i0WvyqgCAwsnOSXYoCaXguhBlG3KVDIan9HIVOw0rNih7pw7I3okv0I56WbiaLZEyGfv
         hTCelDIQv3jwSdjsP5+0eJZs1jqntmbdAR1F4gO3L2lUxfvkJl2pK1S4FPoK2O2kr4YK
         6dnHi9EwfX2pn8HZzg6oTt8oPYSQBjgtAd2d+nUuQ3r0IzgYNaJ+ECzHXAjzWkF6nZdq
         zH0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d+LAL2NK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w37si369133qth.65.2020.07.30.06.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 06:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d+LAL2NK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k18Rn-0007MP-HB
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 09:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k18Qq-00069M-Vr
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:17:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30859
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k18Qp-0004w0-7U
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596115030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OpLzgsFkNX8PZg8qnS3MlSi1x1A+9qtPsiXmj3np3Zg=;
 b=d+LAL2NKrPvY1phYGn/UKTHyQ3AuqY3rYkQ3m+8M3KXkjyn+madQmMa7skqm6VyH1hoSwD
 xFRgqUHbg5Eee/2T72ykii2b6J/Y88sdmVNgdo5d8HlAKVGBZKsDc9q3Z3qE3JZGdyAKof
 9WfwS25cd48X4YJ30HKKBlbk5mFRAMk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-GDRom5MqNYe1Y9kSNrQH1w-1; Thu, 30 Jul 2020 09:17:06 -0400
X-MC-Unique: GDRom5MqNYe1Y9kSNrQH1w-1
Received: by mail-wr1-f72.google.com with SMTP id b13so5183000wrq.19
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 06:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OpLzgsFkNX8PZg8qnS3MlSi1x1A+9qtPsiXmj3np3Zg=;
 b=BkizcWLLgWyvR9DAN6m2jSR7DUCoKqQ/2gtvabW5SKZ4t2tj4dki9LWHwkWen233mS
 ksx//RXUwmthcMpsjxNpHCLChmpflCuCRhsfuNcoiXZZb3WpbCW+P1aHvIo+tU75QR8h
 O9DmNw2iYr5yW2X6PvOvRCIi9xitXDDbQuJv27cWG6HIG+hDaEO6dyoRtK0vHRn7cmfd
 0hKHMHL9TZ+pbJywv/42P3bXCRmNEd6NgEwW7DbDBiX8c1BZ0a8P0ymjyhvIwlx5vIsc
 +sMfHrB7DPBmOJ7T+r6gX4E6HBlZHc2GvjKbo0DosHwoZhuRuFQqKnd3i/e3j3YYVeoq
 Q7pQ==
X-Gm-Message-State: AOAM530L7Yk+RnMCoXEm/ZJB37p/Yxid4fRrC0Do69GM2uF3ebR3CB3d
 mKqvwFuQS8rn8uXaLCWchhAv5WY+VzQRmNLm28vPtzO5px6Np9xQgX7vSqv9uKM54C0weZ23JZz
 a1WPs/9Tf6WR2
X-Received: by 2002:a5d:4109:: with SMTP id l9mr2882465wrp.398.1596115025401; 
 Thu, 30 Jul 2020 06:17:05 -0700 (PDT)
X-Received: by 2002:a5d:4109:: with SMTP id l9mr2882432wrp.398.1596115025043; 
 Thu, 30 Jul 2020 06:17:05 -0700 (PDT)
Received: from [192.168.1.39] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id h199sm9111133wme.42.2020.07.30.06.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:17:04 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] target/arm: Fix compile error.
To: Kaige Li <likaige@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
 <1596110248-7366-2-git-send-email-likaige@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <43e912f0-4383-93c0-ccd7-204c7eaf9850@redhat.com>
Date: Thu, 30 Jul 2020 15:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1596110248-7366-2-git-send-email-likaige@loongson.cn>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 23:51:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Azt4NU0IIQbm

On 7/30/20 1:57 PM, Kaige Li wrote:
> When I compile qemu with such as:
> 
> git clone https://git.qemu.org/git/qemu.git
> cd qemu
> git submodule init
> git submodule update --recursive
> ./configure
> make

Again, timeless information is not useful.

> 
> There is error log:
> 
> /home/LiKaige/qemu/target/arm/translate-a64.c: In function ‘disas_ldst’:
> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: ‘fn’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
>      ^
> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: ‘fn’ was declared here
>      AtomicThreeOpFn *fn;
>                       ^
> cc1: all warnings being treated as errors

Again, what compiler / version are you using? My guess is you are
using an old GCC, and I wonder if it is still supported.

> 
> So, add an initiallization value NULL for fn to fix this.
> 
> Signed-off-by: Kaige Li <likaige@loongson.cn>
> ---
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 8c07649..c98dfb1 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3315,7 +3315,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
>      bool r = extract32(insn, 22, 1);
>      bool a = extract32(insn, 23, 1);
>      TCGv_i64 tcg_rs, clean_addr;
> -    AtomicThreeOpFn *fn;
> +    AtomicThreeOpFn *fn = NULL;
>  
>      if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
>          unallocated_encoding(s);
> 

