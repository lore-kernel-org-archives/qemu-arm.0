Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp394826ejv;
        Wed, 27 Mar 2024 04:33:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFCQIDuQ1xPjrBUzy/sFt7SYzwH1NCf6yHuoL0c+HMugcyr4gM2jusFD40ScVEscqbbbkOy5fceEylE26JeuJ7hp4F975G
X-Google-Smtp-Source: AGHT+IFf+rJOcWiz/P0A+Cpoepfp7VkQCADn0Tr+yuoHUGU3lJUeFXRbURXDaaNwuHbdsCle6RCF
X-Received: by 2002:a05:622a:100a:b0:431:3b89:56ef with SMTP id d10-20020a05622a100a00b004313b8956efmr2678617qte.26.1711539198277;
        Wed, 27 Mar 2024 04:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711539198; cv=none;
        d=google.com; s=arc-20160816;
        b=E8ggBZttzBh7H4bV16Ht0I4JHKfq7yV5+XOeCUwEsDMa2AqdSU2yt2Tzpq4qS2bOXA
         69ujOJq+3kNr3iRXL69Zpbt8xaSkAEuEqoiAVnEdU6wh8vLr66vxPeH1EvpyA7wP0jzd
         f66ptAcnWYUssZZeik/ve1X9k5Z7PozXnoK1sskVOn5whA2PHYegWjvdETYxYpfhF3/h
         Q974Ryxvx+MHbf9SjETbzmq5jFdEXpj9/N5XWHPYlYHDFgMVN1DytDcB9MjuEFMygxtV
         Xnb8BbRucN6kL9HhBiX5Lgf3df8GsInSYL9c8HvSSZqdM95+aUNWJPPNsMh+DF43Xnz3
         evaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bfDbELUBL42nSNspRHmOQfetn1RK91xgMK0dD6SXkvQ=;
        fh=YeNnkE/bihvGxX11Lgk8EOIj8xwp5LZTn5MColUFsBI=;
        b=Hv/x2QAW2WMgy4KJW6fS5l3TpzdBrm0LRfCcw3+x63ZcWUCm/sJVJQepTBCE6uT+nb
         t9y6y7BVG8tlEJk7/wga41KmX3vArNVWDzXboVlXWqtZDmgRGed13DQp0zaoDRRyCR6J
         2Y3xvbEUUXxlxaz8fv+JS/M2f3EctZPWi7rkztWjr2KND0GbSRrou9op8NUcQ0Su/Oqv
         8usXNZJKYa4yYuJeIbN/0j/mvrqsyKsPhQ6CleOF5itQ/2a93jhl0A7N3sMfrv0Q3oX7
         ilK9nahWk8i4ZZsq9Xx9T6wHJDHTNJD2LeV1LQQ9K6bQWqwXa3nT9QHA3FRvFt/oSt3W
         LK/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfPyX5jW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj8-20020a05622a258800b00430eb084557si9522364qtb.807.2024.03.27.04.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2024 04:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfPyX5jW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpRWX-0006SD-Am; Wed, 27 Mar 2024 07:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1rpRWU-0006RF-8K
 for qemu-arm@nongnu.org; Wed, 27 Mar 2024 07:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1rpRWR-0000nE-SC
 for qemu-arm@nongnu.org; Wed, 27 Mar 2024 07:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711539160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bfDbELUBL42nSNspRHmOQfetn1RK91xgMK0dD6SXkvQ=;
 b=DfPyX5jW9ViBgqX3N9e0xSf1qbdlRwSnshzrKPXJSorjqTFzK4mBA6BrO3hQ/Jm1TZyg+C
 G7OpR6o1ynpHHJ8X53M480usj5ywyAa7QhBOTC6E6+/zN+Hcfh1A/BN2D0iN+KcZIIUK9O
 KBGk9iXxZbrtOu1BUrOgKEqKm5Y98zo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-GGmlvwlSMsCVg5c_xmFYsw-1; Wed, 27 Mar 2024 07:32:38 -0400
X-MC-Unique: GGmlvwlSMsCVg5c_xmFYsw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2d6c94d98afso34458521fa.3
 for <qemu-arm@nongnu.org>; Wed, 27 Mar 2024 04:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711539157; x=1712143957;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfDbELUBL42nSNspRHmOQfetn1RK91xgMK0dD6SXkvQ=;
 b=Zm+hi4w3DLk4vaw5uY9Dwd284IvKOvUmA4vy8uz5VdCvpfcMR9rvGLmhMK/TUkidYO
 PXG/EGPwCjqBjaI5WKclg9ehc9B/QTB9tLc3WHjqaVwjhDRwb7awvxVn94wa+m2XxEwP
 9iozUbzdPAKHOc40NClxwBAeG+tj/u130+/+IAPSfsrO509hj1WtV86KB1aaHQPk9Udu
 TZmwls47qWMBJPgVa+r/icfLAAGPFVPFfMbn0TpFVNywR+C7T3GLSxAd5OdTEf2oSPqf
 yoHePWXDGzxnxJ+WFTF5tLuJ5YufAcCGaSyKImtoFY6PJlOutVdULh1Vgi7Ja954EbwM
 l9kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJIi77cSu57W6geYBWQxGgv+Ty0l6r6RKGHMmS9yrFTCrVKcvcbu+UdXi8DbKM4itnj7lKkQ2kT9Zaq7ehG9F6A53A
X-Gm-Message-State: AOJu0Yza3muGvoNFmIzCPeAdLamJ9YTCFxyfy1dEcDy1qIzV8WHGNVIB
 nez/XqiGzYZ8qcfvj+0SQF7Z7FlJa60APkUAaAhhHUp/jsRyUZWrkQPHzMKQpBNXLOxULqCRf6s
 twaBjEs7ZLp6RZf5RmSNhWXHVIGjavH86pW2svS6KlNDr3Zhu9w==
X-Received: by 2002:a2e:97d5:0:b0:2d6:8e88:5a6c with SMTP id
 m21-20020a2e97d5000000b002d68e885a6cmr3420121ljj.49.1711539157381; 
 Wed, 27 Mar 2024 04:32:37 -0700 (PDT)
X-Received: by 2002:a2e:97d5:0:b0:2d6:8e88:5a6c with SMTP id
 m21-20020a2e97d5000000b002d68e885a6cmr3420079ljj.49.1711539156768; 
 Wed, 27 Mar 2024 04:32:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:8a00:362b:7e34:a3bc:9ddf?
 (p200300cbc7088a00362b7e34a3bc9ddf.dip0.t-ipconnect.de.
 [2003:cb:c708:8a00:362b:7e34:a3bc:9ddf])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c218900b00414895d014fsm1835725wme.41.2024.03.27.04.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 04:32:36 -0700 (PDT)
Message-ID: <5efe6309-2c7e-404c-9674-2221606b35ac@redhat.com>
Date: Wed, 27 Mar 2024 12:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 v2 13/21] hw/mem/pc-dimm: Remove legacy_align
 argument from pc_dimm_pre_plug()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, devel@lists.libvirt.org,
 Zhao Liu <zhao1.liu@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20240327095124.73639-1-philmd@linaro.org>
 <20240327095124.73639-14-philmd@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240327095124.73639-14-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DsOonbPfMgtH

On 27.03.24 10:51, Philippe Mathieu-Daudé wrote:
> 'legacy_align' is always NULL, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20240305134221.30924-11-philmd@linaro.org>
> ---

I was really confused for a second until I saw that this series is 
dependent on another one.

Please make sure to CC people you CC on patches to also CC on the cover 
letter.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

