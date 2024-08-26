Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp997889njb;
        Mon, 26 Aug 2024 03:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRFcpF/sySwkRU0FmWk5QYU+ulCZ8n6H8FOOg197v1AeaknydAJ23vBXq8hGdifgElyP+VoMV8Hm/csw==@linaro.org
X-Google-Smtp-Source: AGHT+IFmTQxK1ZvGrCr2lOY2WA8uNrGYN3aY8jSRPfD3nR8SXGFzF7nJ3A+9IeJTOG1BPKpUGgbz
X-Received: by 2002:ad4:58e3:0:b0:6c1:6ec9:605a with SMTP id 6a1803df08f44-6c16ec9610cmr89011796d6.13.1724669718848;
        Mon, 26 Aug 2024 03:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724669718; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRADTGBdkW4e4TmjaKiIHx1EZCToRRoazgpgalLwqTyfwbIBIqhYRCM/p5lNI5NrCd
         PoAPlGripljRwI0b7NB45UImccBbyYLmKE2d1GF4e1Z0KxylM3NZNbqY8DQ9JAcGlkaQ
         LQbo13qDUYiY26VF2woMMyPIzFGv6C039Tif6wq8WazFhD/RTICfDEI3QSXxHzCf0BE9
         VsQiyonM1O0uxAkyIS4fjreFQ4tFkzmLs1pWcftCTYt2cAv0m6iu6NZ/S1lO65uXNXia
         /FVBve0aEdC2hJSF6bHZ2tYIrkND1RsxjFzMW8ANir6Bf3WMx+hzcACzXzWunjqXo9pA
         n+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=tI/uGEZbgWYy1YvQbuxP7ht+QxNnh/wh/BbINhu8luw=;
        fh=8FjEjYou3jgeV63mJYcLEmdkH7l2ZkXE1WL0tDpZFUM=;
        b=uAnsc4uz4PtW7hRlEbZtNxsKEv43NJBjExq1VvevcQ1608ONgGJpSlORkdc2m6t/r5
         Q3qXlFoqB8aKdIuWOy2xQG0KlELwpmW4Er4QyNeVrG1ptw1SDgYqV0jHJE7m58HGzq76
         3Cf+W289O8DanAxVKLmGAOKNU3kpp3sZco6uHvNjLL1P0ZjOb/MTNw2bx2OX5bLhv22U
         /ovj+5afhcJs5BxpIT267/sLhKwUWHldzBACurta0jrkLVXBgBFnxkZk+/Cy8voBnIIL
         Ev8pgauyPerLGAZhBZNiO2UqbEySDF04WzIcVpyD+M9ldYsBBRbp7PBGBZ3za1l0qJdJ
         voJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+LYivRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162e4fbc0si104635306d6.575.2024.08.26.03.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 03:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+LYivRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siXNN-0008Ph-Kr; Mon, 26 Aug 2024 06:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1siXNK-0008O6-RJ
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 06:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1siXNJ-0008T6-87
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 06:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724669703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tI/uGEZbgWYy1YvQbuxP7ht+QxNnh/wh/BbINhu8luw=;
 b=g+LYivRL++dMgoCKEBVUXxfW0yopGxwwrE/P7Gya6N0VdEolPmdwRPbVuFbepI1OsQtwL+
 bTfew0rwZd4V3CntFZ/ujCjJzKRF804m8Swy7moIgzK4R+ONHnrwplKjbUb2gT1eFfduEM
 imzAXlYgyYzAocza90df6uKaiZdnEMA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-a-nwyX22ORCFkYa-u90ssw-1; Mon, 26 Aug 2024 06:55:02 -0400
X-MC-Unique: a-nwyX22ORCFkYa-u90ssw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6bf6a0c2f1eso54776126d6.3
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 03:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724669701; x=1725274501;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tI/uGEZbgWYy1YvQbuxP7ht+QxNnh/wh/BbINhu8luw=;
 b=bStG2I8K4Yow9OFCS8lmHTKrbRxpqUea9cJjYy35Hi6HzrzjEPNLVJH3tMiiw8uhGS
 SC84J5tGbPlAoPx5J91grymlVzEg0x6CI4T5MnT4KJaDxJ/jwno1xZE6v/hwnH2R2r9j
 v6iXR1RJmfmPNG++jpLe3syDZWN94liYPAB3H2CMw5Hgm/VmUfc/BwP6LKf9fuIGz2DD
 mbEqjK93n0kx0sleLYQxs4w/BRfUi0bo1XbCiMXvHtxXNQuQol2o5LyGQuL+ngzHPnkj
 XBIbAL8kdoURxLkPJgmBoXZh3JO1XFvmy+RokxxOdoOzuvdqyC8urr7KHyfWpnJumhDY
 4qrQ==
X-Gm-Message-State: AOJu0Yx1cq+sHX2AB+pD0XJrDSO09sItRIIrsCN2gQGMUFs6sz+CjOSV
 JQPOBeo/ny42JPfwy0xp6T4gZA+kBK4eupMo+5V58JDHlSXefgzSkmHUfNUB9NyKnfIEUAWnnsA
 3EUKf+dgAK/UfrIug0f9OvmMmQA5vvtUjZ6LLLi0b6PifpNvBbA==
X-Received: by 2002:a05:6214:5a03:b0:6bb:bc83:660b with SMTP id
 6a1803df08f44-6c16dc66f5amr108604426d6.20.1724669701696; 
 Mon, 26 Aug 2024 03:55:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5a03:b0:6bb:bc83:660b with SMTP id
 6a1803df08f44-6c16dc66f5amr108604316d6.20.1724669701333; 
 Mon, 26 Aug 2024 03:55:01 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-177-41.web.vodafone.de.
 [109.43.177.41]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162db0979sm45398896d6.81.2024.08.26.03.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 03:55:01 -0700 (PDT)
Message-ID: <41af2968-3d64-449f-8b7e-ada7f117fb82@redhat.com>
Date: Mon, 26 Aug 2024 12:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/functional: Convert Aarch64 Virt machine avocado
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240826103634.52384-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240826103634.52384-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: DNSVNx0czkEd

On 26/08/2024 12.36, Philippe Mathieu-Daudé wrote:
> Straight forward conversion. Update the SHA1 hash to
> SHA256 since SHA1 should not be used anymore nowadays.
> 
> Provide get_qemu_img() helper in qemu_test.
> 
>    $ make check-functional-aarch64 V=1
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv2                 OK
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv3                 OK
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_alpine_virt_tcg_gic_max            OK
>    1/4 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_virt  OK   30.44s  3 subtests passed
>    ...
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20240822114146.86838-1-philmd@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>

