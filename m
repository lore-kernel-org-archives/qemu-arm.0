Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2448309njk;
        Mon, 27 Jan 2025 05:50:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWJlKPrCHGWZT5Rldgmb0IinnnDpTJHaAN5MHhaZMJsmigUycZTyESBit44CRThAfWtoaF9coK3mQSRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEuf7ZUZ2/bCxWj37WOsYiOYQDLwJI078ETS/M/IMwxZm1DljM01Sp61SmdiZJtH2h0tXqS
X-Received: by 2002:a05:620a:29c4:b0:7b6:6c46:55b with SMTP id af79cd13be357-7be631e723emr7622890585a.7.1737985806939;
        Mon, 27 Jan 2025 05:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737985806; cv=none;
        d=google.com; s=arc-20240605;
        b=iQgiErrdxVcnwmOCG9Jin/vduITXqPEO5kwlLuFoIMYxqXQ4OSVGD/k0ep5u6tVZPd
         fyeMmU1fKB1Q+Yje7Kgj59CLS2sXLBawQkbw68s7wldHuoG0sIkSmTn37HEgljqBgaPw
         KR/iyg7qCK5UA3Y4H0Uv46P4/BABj57r0+YnCQoRng0HHEB4qF/JauSVvMhe/20Hl3nP
         lkw3KzACVBollP5vX/RDCEybC8wu6A2djFl3GsNGr2aSvskeFbGuB3bLu4dRWlRfRbFw
         14Aa0b6yYh6evQSsMNEEQBu2noSMj+As4kKyoJKue3bFOjUzOxcs91Tnc9WhhCU9BWrH
         imcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=/YDhbe7iX5fjFf8LpFV7FHX2rS2tvLymaKw0h4upkUU=;
        fh=rOnkePo1cBxysbC66fOtZxnqWiZLjlbt+9S0ROmSCwo=;
        b=koaBl03XR9RTEfPaufHF9uSpJ/oBW9GIJmMUjlSw88ETp5XvVsyKVPB5Yl/BHfCbq5
         mvG7dXqA6S8BlSB6beTSjDetXB8ONbyI2U6MssPjaUN227Ls2Q6mPS/UlTZwXx58Oeqq
         aa3TGurewKAntks91spFqe8cjhLLSr1W0nIzlY1UGP8liwvMALZn/SUV6qrgj3LOHMcB
         L9guAmNPmLFkM9aSAv6184pG7b6brZ8lTNLa9bnZXZtCm8cigCAeKGFmhSIvLLCrRUf1
         JaS+RfUlAEO67IrqmWn++zrRZewCssoJ7vchEmfYMQ/t38j/VHMC9BYHhLTfSmJ3xd0j
         7lVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OuBwRcx/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9d4716e3si1010157885a.534.2025.01.27.05.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OuBwRcx/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPUh-0006Kg-NV; Mon, 27 Jan 2025 08:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPUc-0006B3-JY
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPUa-0006hx-BK
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737985770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/YDhbe7iX5fjFf8LpFV7FHX2rS2tvLymaKw0h4upkUU=;
 b=OuBwRcx/QstNKvcDzuyWsW26+vC+gUTsVGQ4kkeY9Mu2M0f4V4nLPr9AwqQPQL+8OQp88x
 B343rAUyUagRizugwWONk6u3MDz3hOvxkVlax6Uqh5OI42h22tanXf+DSF9QUiLI4NWACH
 VYXgHhaNryJmWh+cipa6cUUTBFu7ZmE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-RItvYEbNP_y-AOjLF9esNw-1; Mon, 27 Jan 2025 08:49:29 -0500
X-MC-Unique: RItvYEbNP_y-AOjLF9esNw-1
X-Mimecast-MFC-AGG-ID: RItvYEbNP_y-AOjLF9esNw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4361ac607b6so31818375e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737985768; x=1738590568;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/YDhbe7iX5fjFf8LpFV7FHX2rS2tvLymaKw0h4upkUU=;
 b=QGsdub6zHwUuEvK3/shvnBvmepKA/0sNHrJWpMIm1A+1KDRxszk+5SDcBO1YTNcl89
 q0jcimLG2JbkKzpo0+PDaDC1LGxtRcN8/T8sytLiP67lA8VE8fz7yFbQMcl9UKIck0xD
 MJpH9bFDdI0Nt1YWJm9lbxF2b9jwoZSpPxJzmjLpzYJKKfswAZnVAaIx3v9x31Zv7uKv
 stb+d/snCxr7ejmomr5mmLyVWRIphmkyoG5sY+Od54CkJR7xE4yEJH+PG/Tnpq0UcTZj
 bkF7o0peUp/Seqe7QzwAFbmCALDrc7dHDo9pGgUAaulQ280dLkFPpRHcOftUg/LA0TpB
 1f/w==
X-Gm-Message-State: AOJu0Yx8NBNcqb0b3SR39mGKkyr9sMKf9lBOF+CLiRtG25G3Xz33WVkN
 6wkLpjQN/542cCePIzs+LfHvEs08iyzo9FwE8+W2J83wejee4hfNstEAtydLP0X0tA7fwGX5Y++
 zDRaPHnqFCqmjyHl/eL3zYhNOM37ioU3f1v9FahrrCGsMGl8UMw==
X-Gm-Gg: ASbGncsOQ3LH6STLB721/FTclNOCpJknx9w2gOwzUg45L1nWg+DtgfNXQw2mmX3pIRy
 Q7fZ+PC1vRnFwDRMuFNLzadVLppxwnXQRfc1e7lGh3PJO+XlAorCgGZ+2sOMlOar/XgqZTpvbVS
 hEMml8Pmr0xWo6UXAwLlEeaxzXXECj+89aJY+o09bwjO1MVU/4Un3LToE496QWZrNTgFWCNIk4R
 4g4fASV8/V634MJ3vuIGtp0nV+8uUWMwqeU1wnfCLlMv/NzlQPQWx4MeoeX3N4Yvog0Ehiz5Tht
 VE36QRZozyN7uK6FxCJ3Lwe4nMPuXw==
X-Received: by 2002:a05:600c:1c83:b0:434:a746:9c82 with SMTP id
 5b1f17b1804b1-438913be56bmr368530545e9.5.1737985768286; 
 Mon, 27 Jan 2025 05:49:28 -0800 (PST)
X-Received: by 2002:a05:600c:1c83:b0:434:a746:9c82 with SMTP id
 5b1f17b1804b1-438913be56bmr368530335e9.5.1737985767914; 
 Mon, 27 Jan 2025 05:49:27 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b1cc8151sm131104915e9.1.2025.01.27.05.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 05:49:27 -0800 (PST)
Message-ID: <fdb08f0a-2a48-4439-8a9c-cc3735baa9a3@redhat.com>
Date: Mon, 27 Jan 2025 14:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] target: Set disassemble_info::endian value for
 little-endian targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M5JRYg57o-Zh9EqAAYtLXqssl7QP_GFcFDHbo9UbJwk_1737985768
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
X-TUID: pltnRLCda2Yt

On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field for little-endian targets.
> 
> Note, there was no disas_set_info() handler registered
> for the TriCore target, so we implement one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/alpha/cpu.c     | 1 +
>   target/avr/cpu.c       | 1 +
>   target/hexagon/cpu.c   | 1 +
>   target/i386/cpu.c      | 1 +
>   target/loongarch/cpu.c | 1 +
>   target/rx/cpu.c        | 1 +
>   target/tricore/cpu.c   | 6 ++++++
>   7 files changed, 12 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

