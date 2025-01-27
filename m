Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2457572njk;
        Mon, 27 Jan 2025 06:04:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGEePnDUdDsShglbuoeEmh32Pho6behjyRoZAVVr6Gl9as2BfQ2I0HJhW3zaqsWaWF1Vei/xXocAUAMg==@linaro.org
X-Google-Smtp-Source: AGHT+IFu5rQB1fQ3uyPDWmKxHQJvSSrAZdQkfwmOaePenjLNN9DCfGcfR4+p2zaij3l8PrVjXp1H
X-Received: by 2002:ac8:59c3:0:b0:46c:782f:5f78 with SMTP id d75a77b69052e-46e12a3f3bamr526520751cf.17.1737986662325;
        Mon, 27 Jan 2025 06:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986662; cv=none;
        d=google.com; s=arc-20240605;
        b=bOHhnWi0MCU6gzBSffi0KbQJA4zViYc0XbJGYV9v/WMB0DcYTaFfgWT4EEBLTuAsZ9
         iIoKvIw6hOwej65qFuBJ3izvwOLOtvBt+yximMYQ50qWz4bGbaYRaYiu1t8TZWhFoa9h
         mEQ53ko/Z2WEA7shkzrwjg9BqLYpQN6Xa/duPv/CzlwVbloZMZaJinkMBGREG/65GwwC
         9s4B9NrjPBeVp52kjbJnUQCwJNNT/4UY8UvsRmI/+E+mTjbX8QXScJIs/7u1QmiH0X60
         VoVIhJ7Ozq3n7fr1SNP8iY2NQDUPatdHKmpyF/rTd0fiZ1+glulg0OvHWVg3NL3ELslu
         UvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ggj2I1JcSOzej71ecAmre0Qpcx4+lvYf04MiPoiuoSc=;
        fh=rOnkePo1cBxysbC66fOtZxnqWiZLjlbt+9S0ROmSCwo=;
        b=MG0bsDyyWizEx+34nCawYi2hMJUSMP3RTZX5p0ogB4oLtvj8W5nG99WlC7JykDyOvR
         mbngUrzujIz8WFvgooONrLndnLiib72xoCSyCEGh3K/O/jYzu4azOqavgeIvJ4shz/Jx
         56RFOvI8yyl1Jya6d8cWk0jijT/Yj9wS1162AG5ECguODnpm2kNs/NvUfblxBWaBAnDh
         GH30Tew3B4rUuIyZg7NNBiXgf2HtB63UBURSfrJBx3l+cHhiCIA5tn7T/SObz+AoAHbf
         c0Ci7BxEFXG5f6YRH6lStHwDaclMsdFg7BN6GeGGtfGgxYjBhULIAkYK7h0AeSxtvNXM
         iW8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GgcnDKdt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bcde66si105621241cf.638.2025.01.27.06.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GgcnDKdt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPij-0006Bs-Md; Mon, 27 Jan 2025 09:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPid-00069d-Lr
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:04:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPic-00007V-5y
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737986641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ggj2I1JcSOzej71ecAmre0Qpcx4+lvYf04MiPoiuoSc=;
 b=GgcnDKdtc6qleRLXP3ER0ftBv+C0nZTs7pJ7AwdXZtzh+53gk1MZAucl4nbKb9eFuw1yIo
 5GGFnBfk6dmDpcGGjxVaijx+THESXGZrJxDYmQdhc5KiKBYebw3ZqV3FiiovAy3PVmcLKE
 6Va0x2wueavJa6HjS8Mq7LOtfTvTsN8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-LkzwY7YmOqqdzrnwSQbPfA-1; Mon, 27 Jan 2025 09:03:59 -0500
X-MC-Unique: LkzwY7YmOqqdzrnwSQbPfA-1
X-Mimecast-MFC-AGG-ID: LkzwY7YmOqqdzrnwSQbPfA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38a873178f2so2469677f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986638; x=1738591438;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ggj2I1JcSOzej71ecAmre0Qpcx4+lvYf04MiPoiuoSc=;
 b=bz5mExN0c1MmdTcLG6cUbGY39M12b+LvclrC53UqlxG5WQRdG7Eixg1irHu2bzJ6+u
 BMFZUeMkX7ufj8wB0uH1mK6y456U7bxNhNVhCO2pxmsNF2cweE/I5BCZWMY9TFw4TIGD
 xx9m7xTgZMY1JF/byTXEgmq+ZPNK/clgCdkZcKnDx0yFDs+wJHS4EoqAWxU8az/8g4Zz
 ikE6QFDu+NxC+O0Hdmm5Mj5mfIIFtEtqtKN1ldgNKxLo0IU0CekI9cPaVIDJj82s/eTG
 xXnOf6jMnu0P8RMccfMfnVck1R51cEg+pXVX47VXbFS2fpNQqBf9Rkd3DrvZSEDkjkAn
 MjyA==
X-Gm-Message-State: AOJu0Yytjypv0HWIH4po1vpAcwPCNpkawR9OkHrgKRLF/rjqbjJd1j2W
 5HjkRU+aFyWKy+IG5PD3qfpzubQGE27LmFxctV7Xggy3aLekvFKtFBS7BWwN/vaLMSU0I3PexfO
 J8UqzsvmjkfU3VDdCR0iy/8Edr8oWLJvThJEx212bnUWwW0B5eA==
X-Gm-Gg: ASbGncvtfgap949uvxqJ81HW0PIv1b5JzfioH6EKpQrSLThBgewItxh5zqpR6xR66fI
 vBq749NVa9uo66DuTf3k4HXcOHR0phHD5w2tFcS9ENZl60dcAULKrztz7jaTbCH/VebEAiZTKBe
 8hgf1hw3n1cE3nIbcWv81dE7TqPFPjkSzwRSfrXNLvAaj+2WbwDb+HvONQOXVhkhLHLF9GfG3w5
 rMqrWehvmaNOMgqmbGgZKNadD/mvXKaw13HT4mHl5OWmTWs3+X7A1MZtqUry0AUo4480bXo130b
 mDceNznt8Ov7RknyVwMKXAUqDeM8Eg==
X-Received: by 2002:a5d:5f51:0:b0:38b:e32a:10ab with SMTP id
 ffacd0b85a97d-38bf564d0d2mr38893239f8f.9.1737986638101; 
 Mon, 27 Jan 2025 06:03:58 -0800 (PST)
X-Received: by 2002:a5d:5f51:0:b0:38b:e32a:10ab with SMTP id
 ffacd0b85a97d-38bf564d0d2mr38893189f8f.9.1737986637674; 
 Mon, 27 Jan 2025 06:03:57 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1761f4sm11156059f8f.20.2025.01.27.06.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:03:57 -0800 (PST)
Message-ID: <f4d22210-bc44-4bbd-bdd6-1d9b37352d09@redhat.com>
Date: Mon, 27 Jan 2025 15:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/microblaze: Set disassemble_info::endian
 value in disas_set_info
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EX0LdrgYs_RinQmt55bP_splXpDErZqXuu_H5UZnpUQ_1737986638
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1hrKMGENwllN

On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/microblaze/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 13d194cef88..7603d2e8f73 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -224,6 +224,11 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
>       info->mach = bfd_arch_microblaze;
>       info->print_insn = print_insn_microblaze;
> +#if TARGET_BIG_ENDIAN
> +    info->endian = BFD_ENDIAN_BIG;
> +#else
> +    info->endian = BFD_ENDIAN_LITTLE;
> +#endif
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>

