Received: by 10.25.227.6 with SMTP id a6csp504667lfh;
        Sat, 1 Jul 2017 18:45:37 -0700 (PDT)
X-Received: by 10.55.174.67 with SMTP id x64mr32795432qke.52.1498959937491;
        Sat, 01 Jul 2017 18:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498959937; cv=none;
        d=google.com; s=arc-20160816;
        b=mYOr8Lg92O3FVCAk89QqY5sIfqAwzvtxs9mNZ3zf7HaSs9luh0WH4P5XTtRg2vnFkL
         tll8ktSAFim8UAGl0GhugfWj8wr//KhLA/JxAwKGec5AdL3iTt5wx3nGC2FEW6RuQ0Li
         zudTG3L3JKeypakR9nWzdkgryivwymfTJ5LHGqTsX8SA0GKufAgWH2u0TjMVliPFNrwX
         /LSQUAACEHSDe5l4D648GOfLSd4hUlMKspsErPOEDi08qBEuSwKuc2Flx8kjwZL+PCa9
         wQjhBl/dcVN8z6ILR+f+IZ1vx2fipaCVJB0q6Lmvil487JW9Q5pELrPaoFHHI23cJUHw
         ny+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=XPZOVUGcQaGxQZyxD7ohC9McNOKuDYgazWLtU33WzUI=;
        b=DlsF+v79aa50pLWqeV/yqO4+nzmfVh3PVaEiVHBezRjAq2Gp5YOO1Om1+lE+nUZn/v
         42+zBV3XmmR9iyPn1cdWADrRzPflYx8Cl152XbGChcJIt2QoT3rNgUZ847o0/p8Bpyar
         Rjam60NCeipgw8FWnZNFI6gk+GhUSE3dNrTSMLUrhS2Ct4pBaFuYMOFclMQvy6sF1cYW
         OsLYPT3fZ9BHGdsNJgdCfABbCIet1haLWA+s3TVHxKPAjrNKc3GAtamtkctou4g8mQz8
         g26ECQSHtfqHbHPncp1w47dm90byUYcqTx7T2eeo4Cc3RNXzJTxlBUkdMmSadB9govOl
         pd4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=pR/i1eJ7;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id 22si7368972qtu.224.2017.07.01.18.45.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=pR/i1eJ7;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id v31so19710448qtb.3;
        Sat, 01 Jul 2017 18:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XPZOVUGcQaGxQZyxD7ohC9McNOKuDYgazWLtU33WzUI=;
        b=pR/i1eJ7+PoExRzlU0cNWeDxfxpLaHRwopq5wBlFKswQPJYJGGijTlBTIhqYvIvkve
         9QSlYK+PO2ya2KV43OO3c18MYZT7U8L2wIf/5nnjJbNDSvkKGUWZ5vdeJSS7f/+R7FeU
         U8zBkPNZC28anCshGn+9GF4qjkXWNlBrmsyceowBm1EL24MAndDAkF5VRBj2EbvzifnQ
         O4IYOEPsV+hLdYudMSgx5/+GHp2KsD3Ltyq0Ygf6h1VgCK1G6nmjV+I1euWz4sS6jJ/u
         Xvf2s8MIREAkApJft2V0Vi1hp9rF8jekn+PjwLCfiPJfy+TGQzCTCX3B5M0nF5JW6YJq
         CiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XPZOVUGcQaGxQZyxD7ohC9McNOKuDYgazWLtU33WzUI=;
        b=Q4G2WtxehqnxMx9Ad9H3lREit46n0Cj1pISHBYxIotf26NPfCpQmqqPLk5/+ZsuR0x
         DhOTkcuoqEtEKcVkB5yOfIZ8Q2LDZBUVORct11ZXNlKC9UvR+ALy+NL8G/Md8NC7uCbt
         VPG2XWX2UGS3i8x86RnY8VtRTpLVXmaRaBWeAosC43PLLh3ZVFxKNcMEeeRFZfba409D
         rKziZMn7gXCfhjKwdADCLAMfMVK53JZFYPP0LcE2vWozRmk52d4PC0bL2bVLjun+fab8
         TKt1NAwaZuddtq/wPukKEhYeUkL62rFVR/n3iNfNlKT8pQYIq2H4watrvGSfwI2YyDkc
         hp7Q==
X-Gm-Message-State: AKS2vOz1kYeB7SAv4bldEnca/nHiMWk731qnmuzDAkE1WdG+wJcnEgs4
	ITszNdGkC1T+O9tRev4=
X-Received: by 10.200.3.213 with SMTP id z21mr30735821qtg.185.1498959936977;
        Sat, 01 Jul 2017 18:45:36 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id o36sm9286265qtf.9.2017.07.01.18.45.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:45:36 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 25/29] target/arm: [tcg] Port to tb_stop
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865825357.17063.13113603039704787150.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <ae9e2ddd-8a58-cc7b-fcbf-bcab107a98fd@twiddle.net>
Date: Sat, 1 Jul 2017 18:45:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865825357.17063.13113603039704787150.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: IhCrR41wJRe2

On 06/28/2017 06:57 AM, Lluís Vilanova wrote:
> -    if (max_insns > TCG_MAX_INSNS) {
> -        max_insns = TCG_MAX_INSNS;
> +    if ((dc->base.tb->cflags & CF_LAST_IO) && dc->condjmp) {
> +        /* FIXME: This can theoretically happen with self-modifying code. */
> +        cpu_abort(cpu, "IO on conditional branch instruction");
>       }
...
> -        gen_io_end();
> +    if (dc->base.tb->cflags & CF_LAST_IO && dc->condjmp) {
> +        /* FIXME: This can theoretically happen with self-modifying code. */
> +        cpu_abort(cpu, "IO on conditional branch instruction");

Two copies of this code... sequentially, apparently?


r~
