Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp768477njc;
        Fri, 6 Jun 2025 01:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpYZyRbpTIEll/Mmbobh/kw19x/V36q+RlIrLwDBU7F+uWO3zvN6SqUha2HmjWE7b5RvmiF597x+kPYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFkAhXEWBSnCwIWZJlU/TT6aaFc8yIIcd1DYV2Vfj6iqI0IMdrqlR1uOqfGUfh03BntIgAF
X-Received: by 2002:a05:6214:29cc:b0:6fa:c81a:6229 with SMTP id 6a1803df08f44-6fb08fcc259mr37784326d6.43.1749197682061;
        Fri, 06 Jun 2025 01:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749197682; cv=none;
        d=google.com; s=arc-20240605;
        b=F5Ki2vzD7YOjPE1ThHWiEdgp6g9TfQOBBb76wFxVpFMGKQ3dMQSSL6wqSL9P/tWDg5
         XfRIZL84056v7zGun54KMkq5X6ZeX9byUvOntXGGKPATdo5Xay6d6kiXJpflug/2LDAf
         U4+gR2UJA/kn4Cb0wny79wcWOZJtlKVDnnY1MtwIMlyw35wCGwggz9vPX/QqaHNWV4dF
         MkdmpU0HhaGyIG7wsc4/EzHE1iq8gP2IkeUylZrf72/8ET/mvIG8nQJEobhT9uln8WU5
         5nU2jH/y1Df1kmoXVgJySwEAgKGQoDsIcZDg21GypOxMkJf1cdpvCxQvhq9IsmI7vOSi
         OQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=0+FS9BkIoMhaRphWZ++NxWvT7PyqZ+GUZ6pkvX8TRzg=;
        fh=nyoZ//OPy8Zc0Eia7s8hfEG+KlLPqkVyG0HeOo79Dus=;
        b=hqRUZc9HdQYcNRzHc2YjFEUsgQDTeV2euP9dyADCYU2mG+qMA9KPXKIiqkgqdKi+X9
         xRt3SzSusMCG9g17g7vPKf5qJtQxZe2sH78CkH4wODjCNT7fiHjyEa9X+W7Kd4x78hEV
         /LZODfnbYqKX9aAs70ZxJUIPmqHzTY4PkuYBitmSBohzEF2Cp42nqR4+rTSp5ErXSiqM
         hr54XIUvr5Q9h4SjzE7jl0ZeMo0qALMbaUF20oIupmCTunKbAjsJLDog0tedfhqGH/iB
         1+pXS80PmsP5IfQQ5HyMNJ6+JXmr5iUl6XPhnyzsLdNWZqU+XjVT28Zh7XXwwE21vcVN
         YfMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E9qWx4w1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b3f985si12098746d6.449.2025.06.06.01.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 01:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E9qWx4w1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNSDX-0003FZ-0A; Fri, 06 Jun 2025 04:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uNSDV-0003FA-CQ
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uNSDT-0006hR-Ng
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749197657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0+FS9BkIoMhaRphWZ++NxWvT7PyqZ+GUZ6pkvX8TRzg=;
 b=E9qWx4w18XfMe+9qeYOyPVJ0AVGESoauDcFnJjaAINmOHaL9M/sswpNZixKR1ejWq7NHvV
 4pv78d3w9wEsEJ+fOOUl/MKEqDpYIutzSOxaSdS4ifS1U8y/F2+V9YAeo5PbgNs8+lwsjG
 IIvtAuudn5nmwPXOJPFOna0obnZIe+s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-i1cIYKs_NFaxQ_BrI4Tt0w-1; Fri, 06 Jun 2025 04:14:15 -0400
X-MC-Unique: i1cIYKs_NFaxQ_BrI4Tt0w-1
X-Mimecast-MFC-AGG-ID: i1cIYKs_NFaxQ_BrI4Tt0w_1749197655
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4e6d426b1so1511413f8f.1
 for <qemu-arm@nongnu.org>; Fri, 06 Jun 2025 01:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749197654; x=1749802454;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0+FS9BkIoMhaRphWZ++NxWvT7PyqZ+GUZ6pkvX8TRzg=;
 b=LfMZuuWCB3R1GRS17bPw4lEi/mQfYnEkkqFH7Fxe3SHti0lnBfIvNdPHcpv8jhdb+L
 OYU75AYuJPJdrOSPECf624YHTYKJ9DQjnaMcvsTQ/UXGDJm3wjmRysasr+nnjKrM6aIl
 hNIORO9FmbFZ7n+3nfF6SSqrTxQbvVL4/pYBrr0cqN3GshhfzJQVrWMmHy/6cNsbGEHc
 5ULYF822PhLXcn3o3UwvptsS4T3rIQsow5JMOzZ0qWMDZbL2hPpycGgK3Kw7FwpY1SAk
 iL7yvEHu3vkpRvSgj0G4zgBQF7lv5CimjMx1EciE6M8Sd5sfBnuhoxYBWNsdW9N5OUQV
 iWeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVu2kYQlSafqXFrZY2F8tN8dTXOZW1C3e+5nm1HkQBJnDZ0gx4EFFPdcmXthTCu1VUTvLUS+Ig3w==@nongnu.org
X-Gm-Message-State: AOJu0Yy43Wr/xa44J7KCBFpHr95kbSYiqiaV+oBYrg0afo/TwEqBezgI
 US52EjVc/a4dlW7n0yvoaCwOxCMLR1vX04W5mF3vNTyACHjnqZPG9yDr9Ho0kc/vD4JDrf4IJCE
 0a/7Cqs0WVFXquJCl3c69EvAKq5SLVYI5EP96gwrG/qLVO5sjSVP5hw==
X-Gm-Gg: ASbGncsUf9dbzLyg9Cczyg4weS2CNpQJTQ/ZNqHwEeTJeuVoyVJRA3LpZhDFT9WLBXC
 WJ8SzbCVteorpXoOtpuP1AxUDi/mGCGPN6/+UpXeK9RIzG/joUrq0QbBaHPrR8P0LcZOtNZCwyK
 CIkTx08E4UIw/JnMezHcwqdVHL75KqaEdDIRnT/pJO9rD0TACISm3Kv086IeDvnW0sVyHQ8HjXH
 DsXVrhOkfPevPMRl6ZobV1FxMDQWbDbWkSJQNRV2aLmG1rKpwteIE3oV02qSv5bldSYdQEIMU0V
 wt2kyLuSGrG8u8mQOdATw+yWF5v1h8epEwJAMzWG7zHtseuNonQG+Q==
X-Received: by 2002:a05:6000:2211:b0:3a4:eee4:f73a with SMTP id
 ffacd0b85a97d-3a5314342dbmr2599924f8f.22.1749197654521; 
 Fri, 06 Jun 2025 01:14:14 -0700 (PDT)
X-Received: by 2002:a05:6000:2211:b0:3a4:eee4:f73a with SMTP id
 ffacd0b85a97d-3a5314342dbmr2599893f8f.22.1749197654155; 
 Fri, 06 Jun 2025 01:14:14 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-42-50-214.web.vodafone.de.
 [109.42.50.214]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324360a3sm1166975f8f.50.2025.06.06.01.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 01:14:13 -0700 (PDT)
Message-ID: <6f9cd053-0701-4f7e-9d04-3f8d92ece5fb@redhat.com>
Date: Fri, 6 Jun 2025 10:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] backends/tpmL Avoid using g_alloca()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
 <20250605193540.59874-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250605193540.59874-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WC1aioYgPZ6urlWvNJLoV8jLCIXk4XE20WfOjhXBfDw_1749197655
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ot9scp7MSC1u

On 05/06/2025 21.35, Philippe Mathieu-Daudé wrote:
> tpm_emulator_ctrlcmd() is not in hot path.
> Use the heap instead of the stack, removing
> the g_alloca() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   backends/tpm/tpm_emulator.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 43d350e895d..4a234ab2c0b 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -129,11 +129,11 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
>       CharBackend *dev = &tpm->ctrl_chr;
>       uint32_t cmd_no = cpu_to_be32(cmd);
>       ssize_t n = sizeof(uint32_t) + msg_len_in;
> -    uint8_t *buf = NULL;
>       ptm_res res;
>   
>       WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
> -        buf = g_alloca(n);
> +        g_autofree uint8_t *buf = g_malloc(n);
> +
>           memcpy(buf, &cmd_no, sizeof(cmd_no));
>           memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
>   

With the typo fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>

