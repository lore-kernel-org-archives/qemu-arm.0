Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2468144ejb;
        Sun, 3 Dec 2023 20:46:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL8uEPkImZoLV2/4Y3smUWy+VOuc5biN8z/YsMdTtOrTcAZbuqY/udjSMgnpNXfM5acLIQ
X-Received: by 2002:ac8:5784:0:b0:425:4043:41ae with SMTP id v4-20020ac85784000000b00425404341aemr5949607qta.90.1701665187581;
        Sun, 03 Dec 2023 20:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665187; cv=none;
        d=google.com; s=arc-20160816;
        b=IlIvO5KCNSQpC6CEZTAKlnu850JiUSfI+Jn/GiW5KEL9VVDMcLbPg6iWH7kH8chS9Z
         kijSm3lU7h0R+NmhhY/a7Hf/cqxO8E7Yen4V0cUstPeR6vuI9axtjK+zRv1AwGg+pkqW
         r2cuS+Zqa5m6G/X2lAdi06Or9kd4c7jc395iMazS41k8FRZTxr7nOj4fhlwc+glCArnZ
         Pib1RBUZ6+dJOUJz/FfG+hnjLdfugFiCuVAhVEaDayqiMPOe8J8Bj6JpwngPtCh9WOP8
         FAmFzPelbSDfOgYOcqqWmwkRcLUNFUnFVMnLVFDZnZ0WKj7FoQlDaWyABHhHm7p1Qsxj
         cDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4kXdObeEtLtxRoYNcLehjsHCdjrSdjq3cH/wfmO/qic=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=wF27iCFujPR1M1+TUpy98/64c7GyX50XE0yYHyTVRuYhyoNaf79mTbOknAo7mvY1D+
         lH5FhipzvwuIPIVqSjznh+T6XZAc7X6wG3HNjKBtixPNBq43Jfs378BVhfvKIdsmfCbt
         eQe5OtrTjjGB7WWlBWHe+tGlOVE4iWe6XO50zswiv67bE9CfPOijKwTNSnmrm4KBgLEz
         9PbAAperRKkgKmYlA5QixHyBl0DmE75tqVCbW8Kb04K1DnV681ygQF3HlgGgvnDIR8KP
         JO09JTdugQ9915nDKqEQxkgRRy99CNE1+HLhFTIj5crZCIuPd6R9hdj0T4m2+NbRPZsn
         bhmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VT+DRh5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc20-20020a05622a411400b00423ed420568si9537264qtb.223.2023.12.03.20.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:46:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VT+DRh5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rA0qd-000602-2y; Sun, 03 Dec 2023 23:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0qU-0005uw-CM
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0qS-00004u-Uy
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4kXdObeEtLtxRoYNcLehjsHCdjrSdjq3cH/wfmO/qic=;
 b=VT+DRh5WshrqyQ4LRJCnypuruyzKZpBElp0bohJxwkrrxKrQ1SC1sW7GfCbnrHvgDoMAGF
 JiKQhgyKS73zIv+XR0EAIrAlAjSWgTlLOy5XBOWdjn4fT7vXhvysSvM7RAfjk+ACAyApBd
 jx++ndF6S+JlMEa/vlrRheXeBmHlzoM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-gZCUpyB8PNWXGOBND-73oA-1; Sun, 03 Dec 2023 23:46:10 -0500
X-MC-Unique: gZCUpyB8PNWXGOBND-73oA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1d05f027846so12203335ad.2
 for <qemu-devel@nongnu.org>; Sun, 03 Dec 2023 20:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665169; x=1702269969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kXdObeEtLtxRoYNcLehjsHCdjrSdjq3cH/wfmO/qic=;
 b=ofq8mS4TvLD3oQw8DPX/OJKv1AmsHUWFbQ097OczQQuwu/+j5lk5a+6B/OKhOH7Qhz
 Ky/nflzpJNDn3oNVIvQWr0cSWTQAULevd73l+UGX4qxsocoINJKl3A4gnYYxQ78XtTOu
 9YvmYCIjRWxKUZuF0a93EcE78E7vEuO4vUraT4k4XySxD4JbqA5PzWNaIecOeLV/mTnQ
 DgKMyZG3AxHBKd1QFul1FeMuu+J+ju3fUbZ3Pz5bIVTZsXS/lZ/MIGo1PPJUIvxONJ/4
 vjA2cEMO3so21LqUY0ReN0WPpmiM+ZHdjTj18+LdLhRYm/BkpKfi4RU2VSmxNNBlcOD1
 spIg==
X-Gm-Message-State: AOJu0YxSnC3Z88mU11lXl6mPtvv77KvReMcLV197aDsDVgTxGYoDxjLb
 kQMmdmRUR2YBtos0L7jcAFMkRvRNv/CXXL0vAtXHmwuSiv/SZ+RJ0wvhwfzw218ojNr+3mJfCFM
 T0PQhdfJsmqb9UF8=
X-Received: by 2002:a17:902:bd48:b0:1d0:aee3:59fd with SMTP id
 b8-20020a170902bd4800b001d0aee359fdmr294634plx.55.1701665169668; 
 Sun, 03 Dec 2023 20:46:09 -0800 (PST)
X-Received: by 2002:a17:902:bd48:b0:1d0:aee3:59fd with SMTP id
 b8-20020a170902bd4800b001d0aee359fdmr294617plx.55.1701665169389; 
 Sun, 03 Dec 2023 20:46:09 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:46:09 -0800 (PST)
Message-ID: <cbfb5140-6007-45f2-84bd-63232c24f858@redhat.com>
Date: Mon, 4 Dec 2023 14:46:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/25] memory: Simplify
 memory_region_init_rom_nomigrate() calls
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-5-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: NLXLm3pkx6Tv

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
> @@
> expression mr, owner, arg3, arg4, errp;
> @@
> -   memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp);
>      if (
> -       errp
> +       !memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp)
>      ) {
>          ...
>          return;
>      }
> 
> and removing the local Error variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   system/memory.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

