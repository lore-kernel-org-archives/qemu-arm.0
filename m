Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2457699njk;
        Mon, 27 Jan 2025 06:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyqBKFnMo4BaWd6bVaJr0tz+g3SjHRnCDrryJ5sZ7auf1XgdhlAkUdQYYp+cQVYOP4xgFBWgozJ4wPyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFISHD3XMeb9kIYtp3BEep1WBktkdyxwhcH3g4pl/XfZDPTxFyAwTUyAlZ5A0dDs9P6T7kO
X-Received: by 2002:adf:e105:0:b0:385:fd07:85f4 with SMTP id ffacd0b85a97d-38bf5678c42mr28039195f8f.31.1737986668711;
        Mon, 27 Jan 2025 06:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986668; cv=none;
        d=google.com; s=arc-20240605;
        b=HWgxlJySplPuLrJh3gbZn+gG8FhsQg09DDBGI6eujamCi7R/GMr1eDl+fovPl/yHgX
         EygSRhCF8MJXHetxjQO0IyB8T2A/ZH906bT7HHEQJuFySLJ+EbzG1Z+oWR+A97rMQtW3
         RYn9RRaUPi75UkgTlKAhO1IziEdtzUigwG8A9s5Mmcmg2vJ0Va958eXCZC5zoCEISMU0
         m8Gy351TQh+2cpnpNx3zGB/ITPf6o4lOcxlEC+dIJzwjeLnoRHjTdqRZ3KS0cSmfajsH
         HPNCtAzhjCpzVzRMcDotGiBjhSI2eTOhIoR/lpTT4IhyEOiktKDh56H68l/ZUaoaxJKl
         GA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6epSKZ6GZBUVHSjF61IsPpp6qD3BS5wB5s+ioOpg+lE=;
        fh=rOnkePo1cBxysbC66fOtZxnqWiZLjlbt+9S0ROmSCwo=;
        b=OZ9FjxOSIHAoCLyN8atq9EK3Lc1EXcqBA0xpcqXp24hvbQFPd7dO/gBJbnPF7L/3yS
         czIpg+zcG1M1vbvT1jOYrplQE8rKFkStdOkTW+30RkWKapuTrURTzrAwSYRnjRk01wrE
         M6CVhSp6A0ykAMiej0S2OABAbBAKKFG5xEasWy+npMVQ2Vhgz6V8CG6lC9tOIg6CmAAp
         brLaikc40JhWL3xeaUj3hlKNRSDcQgAfRyK3gdB82YJU+nE0l4BBGnOY+cz7eecGXjPD
         sVWNi3cCllN/hTj2Ras+FcntwidWQAcnAiyBfozmiD7wFSo7r6m1UOkPPf2OUN8Th+w5
         nh5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HN0BW9k2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38c2a172c96si6084346f8f.97.2025.01.27.06.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:04:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HN0BW9k2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPib-00066r-Kv; Mon, 27 Jan 2025 09:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPhx-0005rk-2k
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:03:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPhv-0008TM-P0
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737986599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6epSKZ6GZBUVHSjF61IsPpp6qD3BS5wB5s+ioOpg+lE=;
 b=HN0BW9k2JL1AQKlvcPuN0hnkwolJlSsJnK44fR9qdO2n9ICCVWYCB2rWXZAV4tR2/fF4I4
 ANEMcfGofx2EKkUkkJLRv0qNWbfxePXT3a3PJGETkebUywAbGN/o0zL4uKAKlLhEA45gYu
 /2rZzxuDIAx80K9wMR4a7kJf8HP+klY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-OMzewlaKOEOvSzu_8F4esw-1; Mon, 27 Jan 2025 09:03:14 -0500
X-MC-Unique: OMzewlaKOEOvSzu_8F4esw-1
X-Mimecast-MFC-AGG-ID: OMzewlaKOEOvSzu_8F4esw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38a35a65575so2970573f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986593; x=1738591393;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6epSKZ6GZBUVHSjF61IsPpp6qD3BS5wB5s+ioOpg+lE=;
 b=Z57JiqXvMQXVnEPQSEqpdNut5nAIDs/yMZawlAMJE5yuDSCiMAmfPHcJHgqBG5OoT1
 bmeeAUzQCspUZ3s0gzs5rfJK2wbeOEMaAAQGi9XNvbhDCNCKaZ2XAUceESYryFj9JN7m
 fhZfQs9q+mqWEyYQT4YDwyzQ6lbVACxHrg9NUc+3tc5mTwsTv7V0CI3053BNE3aiGdYc
 d4Vfws8xKF8fA3t69YPg1MB1T6PXhVrQ7xb1U9WIg2IzW+YlvCIWvyvRAIX8QBnaX5zi
 TffpMtf4z8dYpo0jkP85FJPz3obyxmE4edjElUBow9ATgnRkJEx4DDB8Z8Y3WZFVe0P0
 nB7w==
X-Gm-Message-State: AOJu0YxNdek+qJcsFEAMaDUm/dzz1ZE4bzwZ5z7B25vVUDx0N4D5TMgF
 2SdyLBQ/d/hnOkEnlazNew5zR0FmIPJeY2c3YiqgdaiK6WadIFiwaFQY/sTLSC+kx8Hj/AW1owf
 3RmXmcHK9rt6TPavYSUFWJqrFbBYw04REB29F1jWVyty9L1mUTw==
X-Gm-Gg: ASbGncvqiHuTJsAD4QumiRoMfNXXIPmhW2tvM4y9AK407MtVryG7+Zg8lkadKoVPMiL
 FAnvvRQ2YmyRBxvWVspsKMIYXA4Ix5ccQsWPRoi/gZZNiz3x0SwzMWuzjospv1QqCC1RKHoSNlD
 h5cT3OR7Pxm0H4VtQaGOR02rppinl9R8aocJftpASUsDNOPdbN19LSRWttesUkaA586qA8jTGhI
 BgxWYSujeaXZKbZ6Rbk/uwIyRGVORkbFGmhCP7tZ/6hVnhBK2JYrpCJmn9Uoxumff4FRlFXUKE5
 K4Xg1pqjmnEDdiP1OTIBaHOzpUTBOw==
X-Received: by 2002:a5d:5a51:0:b0:385:f64e:f163 with SMTP id
 ffacd0b85a97d-38bf5679504mr26489389f8f.32.1737986589221; 
 Mon, 27 Jan 2025 06:03:09 -0800 (PST)
X-Received: by 2002:a5d:5a51:0:b0:385:f64e:f163 with SMTP id
 ffacd0b85a97d-38bf5679504mr26489333f8f.32.1737986588590; 
 Mon, 27 Jan 2025 06:03:08 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c402esm11321429f8f.97.2025.01.27.06.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:03:08 -0800 (PST)
Message-ID: <44c1e15b-6317-48a3-845e-35df89a69dfb@redhat.com>
Date: Mon, 27 Jan 2025 15:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] target/ppc: Set disassemble_info::endian value in
 disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: it5PATGVSD_3I0uEnRBei8_NeQ_g9mjxBD-pvb_y4k8_1737986593
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
X-TUID: 8ZfMkliT4kQY

On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.

Maybe add a "always" between "callback" and "set" ?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>


> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ed85448bc7d..c3263f26219 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7398,6 +7398,8 @@ static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
>   
>       if ((env->hflags >> MSR_LE) & 1) {
>           info->endian = BFD_ENDIAN_LITTLE;
> +    } else {
> +        info->endian = BFD_ENDIAN_BIG;
>       }
>       info->mach = env->bfd_mach;
>       if (!env->bfd_mach) {

