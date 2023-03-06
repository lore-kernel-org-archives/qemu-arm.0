Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4774066ejc;
        Mon, 6 Mar 2023 07:23:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+1r/8G4KHQcNdv5skcR9t8fOi8LPli8pNQSQEA2ONnbXQtKlmDcJzH+FLJxb9jqddVLRtG
X-Received: by 2002:ac8:7f4a:0:b0:3bf:dae3:bde2 with SMTP id g10-20020ac87f4a000000b003bfdae3bde2mr19309665qtk.36.1678116200230;
        Mon, 06 Mar 2023 07:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678116200; cv=none;
        d=google.com; s=arc-20160816;
        b=r1WHpaS7JtO1z7brwcQYWeh8+uJZJEMMzdXWJ0wERGAkLjoxbf6wKV4WCj79TyfYdh
         BKUIYV+XvKlK9OpL05T5gPYr3VrFluvtCqFcmVHqMwjyxXbotbGQdWWKcCpnYZUctOkf
         zAGlzRwSiL9PjubDmLyJ+q6yhu81MIDHM3SfthYBpUMaKOTy1PJcY/V6nrdXT5XSLAq9
         VUWR4aQsqIUWY2v97agujKKOcV7lnUL7ThRf68VsKwLXzWHdbqZWIo2U+Hi/JNec6oOf
         PITnleviIh5nsTL+JUmz98nEg0RCC1tc3v3R9EYRYhEHOuFPoJ2z1xpBkvrs5P+C+h53
         vWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zaZzsHFDAUulgPgGq9RguUXw3QMu9+56YCieruNcXXI=;
        b=i/D3T754GYbHgP47aRC22n1rRtt1OLNgtI8PmWhfmEILcmqUVEgByLkNKvL40F+9dq
         mNkom2K0bkkrNMmcXQABJLOmxH98W+u/fpt5icv1X8ZhBGr3xp3VawGKYyVgxkAnJqK7
         Dx1qQMQfbZPenpsLIRG66C73iuPAl07Y4y1du/dXH1VJFV5NnCGdJY3dmtAv46swwQQG
         JxBloEbTLqa/AtU3OHRh/v9n3gnJ08N/iAWd6GKrvKtl6kry9m9RLNwazLPyAvIA6YMP
         NmQsJ9mNx+sNOWIt/oOAU3Jwu/ExvxK9RdUBOj7ZWMBd5GmFSMMR0IP5YYZudeiik9Sj
         2F4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c7QSTelM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020ac85d94000000b003bcdd210492si7938402qtx.202.2023.03.06.07.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c7QSTelM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCfy-0005bH-9y; Mon, 06 Mar 2023 10:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCfx-0005Xy-4n
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:22:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCfu-0007y9-BH
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:22:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id c18so5902416wmr.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zaZzsHFDAUulgPgGq9RguUXw3QMu9+56YCieruNcXXI=;
 b=c7QSTelMP52C0T+LH3uI4z+izyvCVWq3rMkgcJZM0Oxv7yItWV0PtyaMoAfCkzc0iK
 IMgVp16UUpFJSmq2wUmrpxqwMDkNV4LZ3b9sU+Jo+MBxqwMJ0dOqDJhwkh8xiU/+NDde
 UJw3O0yoRFKuRzwvMnIBlVf4pu7mUboLiqE5hLOgrzG6dncfaoZKxyqZw9TW92HolWMw
 LriMP6tHWmlwbLvQIqV0vB3NH42jtF6cQPRKj8Z+A/c5TKy9sbvq5LH9AeN3bC9Q9uOt
 HvQY9MOUTxjKRlVuCo3vWXLWL8NKjYnj2CCa0eDORQYKHhw4/LZWNrX7IBgABROsggSz
 XAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zaZzsHFDAUulgPgGq9RguUXw3QMu9+56YCieruNcXXI=;
 b=d24pss1+Ww0FmZySBMRQDcLUtJmeEQekydPm9Lv1O9kasvE22Ihw+qID9dcE1eH5Ty
 Jb03LCO+QIGxF9oY0qgdB8eWME3nqKGWhXLnZbmuP0mUgmjXgA45eklA/68O+EkoF1Ka
 h3YhsfNHS/sTsnd9opWy3J74UDOXTN74v+w95j0MaEiMTY57AK2K79JZkm9gyO6DLork
 Yy90w92iCEYkNYO1fm7VP0Kfqw5VqiSM8R4PG7ew2Ky4dDALgadQs0SInwBcWpEsULzK
 avHF7nfFVmI0jYmR/ZUGgcEiP8LWU7aTtD3nUYcPmzTYx/EZGSD0WP04fuayaaWnlO42
 KW/g==
X-Gm-Message-State: AO0yUKUrcCHQOkja/AlGP4jexsxpcInb7LcXDg5UTpSDw5RcMztTHviF
 /jra8owhbzlRPFO6MehnCN7Q1w==
X-Received: by 2002:a05:600c:6001:b0:3eb:38e6:f650 with SMTP id
 az1-20020a05600c600100b003eb38e6f650mr9546881wmb.41.1678116172461; 
 Mon, 06 Mar 2023 07:22:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003e2052bad94sm15658781wms.33.2023.03.06.07.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:22:51 -0800 (PST)
Message-ID: <651db4ce-9085-2f48-f1e7-295884759833@linaro.org>
Date: Mon, 6 Mar 2023 16:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 11/70] target/arm: Avoid tcg_const_ptr in handle_rev
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0dbe8Le8oHwD

On 27/2/23 06:41, Richard Henderson wrote:
> Here it is not trivial to notice first initialization, so explicitly
> zero the temps.  Use an array for the output, rather than separate
> tcg_rd/tcg_rd_hi variables.
> 
> Fixes a bug by adding a missing clear_vec_high.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 16aa71451c..02a61aa8b7 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -12003,22 +12003,26 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
>           int esize = 8 << size;
>           int elements = dsize / esize;
>           TCGv_i64 tcg_rn = tcg_temp_new_i64();
> -        TCGv_i64 tcg_rd = tcg_const_i64(0);
> -        TCGv_i64 tcg_rd_hi = tcg_const_i64(0);
> +        TCGv_i64 tcg_rd[2];
> +
> +        for (i = 0; i < 2; i++) {
> +            tcg_rd[i] = tcg_temp_new_i64();
> +            tcg_gen_movi_i64(tcg_rd[i], 0);
> +        }
>   
>           for (i = 0; i < elements; i++) {
>               int e_rev = (i & 0xf) ^ revmask;
> -            int off = e_rev * esize;
> +            int w = (e_rev * esize) / 64;
> +            int o = (e_rev * esize) % 64;
> +
>               read_vec_element(s, tcg_rn, rn, i, size);
> -            if (off >= 64) {
> -                tcg_gen_deposit_i64(tcg_rd_hi, tcg_rd_hi,
> -                                    tcg_rn, off - 64, esize);
> -            } else {
> -                tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, off, esize);
> -            }
> +            tcg_gen_deposit_i64(tcg_rd[w], tcg_rd[w], tcg_rn, o, esize);
>           }
> -        write_vec_element(s, tcg_rd, rd, 0, MO_64);
> -        write_vec_element(s, tcg_rd_hi, rd, 1, MO_64);
> +
> +        for (i = 0; i < 2; i++) {
> +            write_vec_element(s, tcg_rd[i], rd, i, MO_64);
> +        }

Preferably splitting the bugfix in a preliminary patch,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        clear_vec_high(s, true, rd);
>       }
>   }
>   

