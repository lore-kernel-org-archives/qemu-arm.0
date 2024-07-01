Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1295823njm;
        Mon, 1 Jul 2024 04:20:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTJXDiNZz4e4q233PdDzxB2g2Ey6ZmyJQis0IqJfS0dm0cyHe0w5+3duqBEy9KEHxUXXHnbQPevuE2boBx4BdgFogqOLJM
X-Google-Smtp-Source: AGHT+IHkAzxn/jfUmGCJNW+g/vDkREevSJNd8pbl8FL5tS6K3lJY9rNf5PBP+bSXiUJH1G8tSii+
X-Received: by 2002:a05:6214:acf:b0:6b5:2f57:1a5c with SMTP id 6a1803df08f44-6b5b71bab99mr71297516d6.59.1719832855786;
        Mon, 01 Jul 2024 04:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719832855; cv=none;
        d=google.com; s=arc-20160816;
        b=rfGfiWr++6uDtNGI2chf6Pfv+7e8qwfqalgL5sqfUJziMzVnpMWknPtq15Wv4gE3OA
         O/29Kl+YjKbi+HB1TU7vSRa4RnMWoelJCOItvlZii7oL0e03/h+3uV66e8Hfr0sIyhJg
         nE2/VQgYIpf/j6TE14vFG/K+lB+TRreSgErJppMudcIBg1zyXxAEjwBncGhpboCKLoPH
         9wYoV+QGWxZd92hfHH7WIjAbdEGqw27rCsr/BBiR5lYO8eqmZw769RuQca5vp96uIyUb
         gMAiYQBJXn+uFZQuEbHrztvdmdF88ZZj98EVS7eu9ryH/wttC5u5UaCMzCW0XX7nICWx
         T+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zOiJPBPWUzVl7WVl54hnbFaILNRK3SzH3sCQhMNGCdw=;
        fh=EmGpDTS13xYwSQEwpUO761JqD6uOYfQESP4xKEhDjNY=;
        b=gO6PN8zD8O+Gn1ambFa6OVn01eq73h2dpOyEOWXVKYmxJ8XrzxT4pStzif027N5hPR
         2g4/p+GRrlNNs6TsCe3MObxLlILFEwrsqu2FJuELP3C7MOFlAEHFV0ivo9IUvipr7WeQ
         rsML1XZscqlCNMCNrEiR9hX7fYom6AV3rOzr4gyk1FlytGfFH2ZNFLap+3velacsw7uu
         gwSJBlH8l6/nOUyrW+UYhoJdE21ty2NhLWm25G0t9IVYdpmY1C0kkS8vh0NbSXr2MBO9
         Xwt0mvB96zxHTQXj0sHdsMgyxzQR1PaqnydRPeetlCfOgoePQL0upZ6sOu60ZSxi9WvC
         yr3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JFMS0r7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e618651si75210956d6.585.2024.07.01.04.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 04:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JFMS0r7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOF5R-0004LV-Mh; Mon, 01 Jul 2024 07:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOF5P-0004Im-Gq
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:20:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOF5M-0004eA-GQ
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:20:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-424aa70fbc4so19821655e9.1
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719832839; x=1720437639; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zOiJPBPWUzVl7WVl54hnbFaILNRK3SzH3sCQhMNGCdw=;
 b=JFMS0r7LYAkDjx9/vAvUnnx7gAWQnSVwLlBLxiTDzlvtmuXWUmK63BkrZqhd6WQkUa
 U+5lvd8CZQ/g+gY3r/zSuehwu3MWK3Q/wKzne87te7QKjxKNRDTPt89dIZ1IULzTar1F
 6h2x6fwg4NTPqUI491KwBl+jh2WiPxnRc2EQr0/66fh/Yu+VzqNue6Z3RrSA6yn8WDjj
 RXlpNcb/fZCyXNaZ7luy4ppKb2OW8AcRXAkHwZNKhV2UuT8AQYx0nDsLnYudeiZKvAHT
 OOga95G8bytHx0gjyxWxpx9NhMD8hX59mtf0NchcrVqmxnOFPPMJz5jaDQo/7DEhtbAW
 gJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719832839; x=1720437639;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zOiJPBPWUzVl7WVl54hnbFaILNRK3SzH3sCQhMNGCdw=;
 b=sQ7zdk6fIprXCg/ow3BUNdyyAn3N7QRG1i7ArvvQdOMU7rYNk2MgrYfc26rqauz3x1
 Su56/ElsfA1kSzwhVnyE717gZ4qJi0abML/ykrQEJ31npcRBMFsSnYBkcePYUM3PgmWO
 CdInxRAduParCTB0jQYSSXLrEnc4sB7kez2/AMcdmyCVCr7EJEaZNti+844AGjlJ7iKi
 0bAXpjMNIp4HnRXw/vgaH6MVCNNnNSh2i+4Dd96hj77H5Sb+uYWB5KGfNQ7Wf+E200hd
 QsXMSTOu8DsCov5t55w2crknDs3JUKSpysrPwdV7ZmiY1K/f+qGQaHAitsEN/oPg25q6
 rkig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUALNruPCqc2qGSTo6qi+rYy0KoWewKht/J4APkyv/Hy2VsTOxfvfgjaANctJXwypK1gv7YxabzJSEsxui22t+apOFV
X-Gm-Message-State: AOJu0YwZrPn4EXiAl2UoEnYM1VsUlPp7RBl9lkCWipqVbmQsbwoekRzf
 7sgzYio5mxkwf52cYFo1olev7sC044qeSlIvdiJgjrPF+ibKKqxLFb3gfw8WbTg=
X-Received: by 2002:a7b:c7d9:0:b0:424:a7f3:1360 with SMTP id
 5b1f17b1804b1-4257a03c07bmr40452915e9.17.1719832838763; 
 Mon, 01 Jul 2024 04:20:38 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af389efsm149589875e9.7.2024.07.01.04.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 04:20:38 -0700 (PDT)
Message-ID: <e175720f-6fa3-4c7c-b801-1ade72c1e5e1@linaro.org>
Date: Mon, 1 Jul 2024 13:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] hw: set deprecation info for all versioned
 machine types
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org
References: <20240620165742.1711389-1-berrange@redhat.com>
 <20240620165742.1711389-11-berrange@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620165742.1711389-11-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: jlspdAwLOaTF

On 20/6/24 18:57, Daniel P. Berrangé wrote:
> This calls the MACHINE_VER_DEPRECATION() macro in the definition of
> all machine type classes which support versioning. This ensures
> that they will automatically get deprecation info set when they
> reach the appropriate point in their lifecycle.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c              | 1 +
>   hw/m68k/virt.c             | 1 +
>   hw/ppc/spapr.c             | 1 +
>   hw/s390x/s390-virtio-ccw.c | 1 +
>   include/hw/i386/pc.h       | 1 +
>   5 files changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

