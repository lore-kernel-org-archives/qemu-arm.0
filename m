Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2018886ejb;
        Mon, 12 Jun 2023 06:28:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5iyWZQjKCOhTz9WgDJgwS3gaQ3aP6CdJ9+ukWm89/lsu7vvTJ2jvNuUJKzlcDXkpbyU8oT
X-Received: by 2002:a05:6214:2627:b0:626:3375:6fea with SMTP id gv7-20020a056214262700b0062633756feamr12093716qvb.22.1686576494928;
        Mon, 12 Jun 2023 06:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686576494; cv=none;
        d=google.com; s=arc-20160816;
        b=GSjU8McR/+uRezdkd8Eh6Aupcwu/hCG5/F2khXeQ2EUBS+bpDaYRvIvVtEM526kkLz
         oXMZfLREpGcbj1UJXyOAEhijknblBqw1lSnVhid8f8AzQcaBKTo/VRTGaCGswYXkCudR
         BMygoJUg1W4JtuGUnd5+IEIKw+koms4+51P/k8ChJ6/xbMWXeI4iA5J4zFMIn8DhTW6V
         Ovm5QJ90ifLqJbpuBPOBf0TPLkkJ4Vp+4VkWyE78N6Tp4Hm4mpT/oPlHj27QHoRKW8zk
         4CbAzHo7q+1jR0zkwLg+2vYx6yOJvSqyB5Xl7b0NfJdzD6l2A4wPZyrm6whxZawGEIOj
         Gebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YhbAcTLh57k8xBHEyINhzUo+2BvmLiZQZikW0f57zSc=;
        b=iY4PbA3cYnstPOQm2J4txQFZ+WdNW2y6p/dd5fOqoaZMhohtFrzVhqHFQB+HVHixAr
         QCG3HRG2u6evJ7THF0S1W+ytZQGJMKbNA8RsWpAyVDxeCLuL/emcVZ5yL5MrA0nk1efY
         0ANGaVaV26/J9MsulTOM5v5i8e+ewGkgqUuZMcOuNsvnU7U0TIc0vDlpVMHiqHzgaOH5
         K29FHzS/Mq2G46Z9iF1VPETwu41T24xB1nYuChqp/YehwTobLtBz05KMo7Ctqwgrw3tq
         0cgOVjQJHbZ85zI389BDHgutj5esNIA2zmV9b1ZN/ZvEWHqAXjwpuVO+5HZZfXbLrlFY
         SNlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=FG1FPSFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv9-20020ad44ee9000000b0056eb16d587asi5961962qvb.444.2023.06.12.06.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 06:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=FG1FPSFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8haY-0007mI-KF; Mon, 12 Jun 2023 09:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8haW-0007j7-4p; Mon, 12 Jun 2023 09:28:04 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8haU-0003d5-Bt; Mon, 12 Jun 2023 09:28:03 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-558a7faa989so2887184eaf.1; 
 Mon, 12 Jun 2023 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576480; x=1689168480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YhbAcTLh57k8xBHEyINhzUo+2BvmLiZQZikW0f57zSc=;
 b=FG1FPSFaW1DK985/in4Pt/nri5c20683Xdj/4hQTvl4jxXI9TewqET7cZAfZIGrPvN
 0wp3r8lH1NS7+FwgP40bNeH2j6J2iKkymxh34zOMRGBkU9SudI18HtLwzcZgGzM49eVq
 fuUOZn8CTF5N9jmXQjRCJvQw4QuzYvceROefeP30Trbiq2k0JqUhjht/Q188HQrmQ0K2
 JvBANAljGhDwL7PawFCz6N78x7nIEZ7sEewvS6VTBg6zOKAUkEAykGwiCMGbXqVYE3FF
 JfWdbe3Ckn6Dz21P++IrZEiYkI3ScWhsESPBzI5LEuFc0xZ9PzLT7b1no+f+4pSOIVMf
 2BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576480; x=1689168480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhbAcTLh57k8xBHEyINhzUo+2BvmLiZQZikW0f57zSc=;
 b=IbGd8HV1Juf/Xs+O0teNqVH+5bNJVVKuwCrmbZbBssTHnlT6rEwMVOC6YH4TNEcJty
 cj3leBoRcmCldGEjBaVHu1nNBJfQOCMGoySwSho5kIuZ1cAWYLN2gttlhaxesGf0sYy0
 r1paQDLHXjGXcvMu2bkBQQp0HUocZm3rMw4590thqon98YTxaJ2DvVjIz9Z3qAqE1WYx
 LgciI49bjmbgMZlrwFkOBl3NlfvdxFt2NyjrYh1Eva+RMpdDo33cZwynIAQmdTfxadTp
 j1pdf6mfBfenzyDogVTuFlxHeYKgXgW8ID8+lKR4T7/JCUubeewP0xBkH1dz2PGWcalM
 dwyQ==
X-Gm-Message-State: AC+VfDwH49fzIhGBAboXZPg1Tf0y6UQU68c9rhFSsDKADhkmAcQki+PF
 SOT5JtYNsqmxnto8Rv19yac=
X-Received: by 2002:a05:6820:1b95:b0:558:b26b:6442 with SMTP id
 cb21-20020a0568201b9500b00558b26b6442mr5778714oob.6.1686576479878; 
 Mon, 12 Jun 2023 06:27:59 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a4ad025000000b0055b333a3af1sm3171820oor.13.2023.06.12.06.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:27:59 -0700 (PDT)
Message-ID: <fe568cb8-b48f-d72e-a3ff-a5bd32662566@gmail.com>
Date: Mon, 12 Jun 2023 10:27:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 15/38] target/ppc: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-16-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.096,
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
X-TUID: QYbdZ2uROzsY



On 6/8/23 23:23, Richard Henderson wrote:
> This implements the VNCIPHERLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/int_helper.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 34257e9d76..15f07fca2b 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2973,13 +2973,7 @@ void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   
>   void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {
> -    ppc_avr_t result;
> -    int i;
> -
> -    VECTOR_FOR_INORDER_I(i, u8) {
> -        result.VsrB(i) = b->VsrB(i) ^ (AES_isbox[a->VsrB(AES_ishifts[i])]);
> -    }
> -    *r = result;
> +    aesdec_ISB_ISR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
>   }
>   
>   void helper_vshasigmaw(ppc_avr_t *r,  ppc_avr_t *a, uint32_t st_six)
