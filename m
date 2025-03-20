Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp763248njc;
        Thu, 20 Mar 2025 00:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWd5bPaD8NstACJZBL6gXzE9oFMueVAhWoKyipB/Bxa4cPi5ZRkO8adHCf6K4cQHmwu65afs/k6PjOrQw==@linaro.org
X-Google-Smtp-Source: AGHT+IEwHxHidtX+r+RqzZyDB4sbph6EHTESIS/kmPhecPpJDPnh9uwUoCjVqOXofEBwyw7YVoLH
X-Received: by 2002:a05:622a:5a8e:b0:474:e711:3c7f with SMTP id d75a77b69052e-47708386830mr104120961cf.43.1742456539068;
        Thu, 20 Mar 2025 00:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742456539; cv=none;
        d=google.com; s=arc-20240605;
        b=C92M6gsnvJ35C5YdbtKN4CLZXBK0DT6iH1bwhPsSA43ghcSH8WZDDWST/CU8hwEmAR
         HSoVb7K/zqm0315pTByJg2J+yQ/7HyBPkni38WqMG9MDHQzpjlBwHGj1MMTEY49axJr4
         2VH7Np8GvOZJaebVLFLEysJRFUZ9AExtKs/qoH+Snsb87WTM1kECYzmAbwknl2vAqmAT
         GbQwH60K0adCHqC3tN27qCoc+t5SA3DKkaEeqqgKZ8ucyFxHzwcskD2DxR3FVJ89gwev
         cp8w/ZQLW4TaBz1rmgNrkIj46dt6VGhbbyxqAQmrNSKvTenAuJQHA02CzDQOvFOYaTBs
         Uktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cXMy2FP8eVpjmuzvVyPyu2ht4al3Gpodl5VUdnLP7kY=;
        fh=XB2FNOLT8sKMkm/Ys8MuP8DJJybtHJtHfhauMkfdQRY=;
        b=RkKpGCPbUmRaV6KzDzBA3U3O65yjMNWbqVveBGqFhGRtXpy5XjMMsqW6i3xU3wCz0d
         A1b0dYRdmBGc+ZVSF4rYSdVvgTtDYli5al6IggS9zwVgT/9AoXo0X56BMuBCAlFPaoAL
         E95rfAL9OVL/TDm3K1bEePfaZhjYfHbFbduuk+oeAqjIQPQ4I1nzg8+0Noq2UBy+aX/R
         BOJubkrzJJ48/DYK7hWtpHdlDTbrzFIpplDLgaOuPmtA9pAz67AC+A6cexGLb8GYqgZ4
         ils8Cl31/P06iLg/ZvcXPygE+Tyu6ilbn3qIz6ubO5T90oE+9UnKFbZkUX3hiYyfHNkc
         +y3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EALJQvLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb81eaedsi149746361cf.468.2025.03.20.00.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 00:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EALJQvLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvAXA-0001HM-1Z; Thu, 20 Mar 2025 03:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvAX8-0001Gz-So
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 03:41:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvAX5-0006tx-PR
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 03:41:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso351795f8f.0
 for <qemu-arm@nongnu.org>; Thu, 20 Mar 2025 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742456498; x=1743061298; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cXMy2FP8eVpjmuzvVyPyu2ht4al3Gpodl5VUdnLP7kY=;
 b=EALJQvLAesPIsHWz8cvQc8HmkVF8kybhqedh8QKH6sxslaRnFU+QKtf6EPZwy9Ishh
 NmZGeEnQT9wbGwG3dhURw4IPpc+dOfuYUWQmUTJmMDQmn/mwG1pBgeA0lIrHt73ozB+O
 j8Jjhm2aYUMIRboiJJPB4spec6GBtH/2F44Bvjv72fUyWYyoY8P3jiBLiuLggVXHY0pr
 5z6sy6MhOw/2ACj97UOz7q/2fdByFmvGuLVkaNLGJNUsWbBT2mcWbeTRZt/8/QZRmNMi
 bJFsUQE9EA/7znZrfUKDbm5F3cazLCP/F24ZJinJfXilp60UdwptT6COw5+1hCw+ikYL
 grQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742456498; x=1743061298;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cXMy2FP8eVpjmuzvVyPyu2ht4al3Gpodl5VUdnLP7kY=;
 b=ZqDFXYivnSlnxj5KkEN2yoKZViA8cd5aOpzdIGrbggKfB41CBPAuCRua2fi/YjvV/y
 zv7K9JQL8yN/a4yHqLV5BqUowtZsDy9Z8f7OjUfGMaDX48aglTI6zjz9YfcUWhnoK3VL
 uslhwarRJ33KhuBAf5ZgyS/268OkrAhHQBXJ8C3QBPhHHMOT1WxUXIFR5yfuZjv9EiTF
 XlnJ+F+XIV0AAhxYYeh8QkK7qOysfT5JAP9zyq+6WEEP2p9QkQktEvg4V3UdG5duDN33
 ia2Tul4AvHvvpeLshtpq+2sBKm7SDgM5Zhpd1h6lhezVpltL9sx9HjinDzVxStXIw6F9
 CVyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYKNmBhy1V2kGyMiGKvv2qGa6A2c9RBvnFIfaArlj5WEmeDhio8ZwMYtM0vSyOhtWYWFGnPmqPag==@nongnu.org
X-Gm-Message-State: AOJu0Yxw+fSYxfH6lk/qe8UIYhWhO8fdiC2/ouQb6e//JrJmNOdsTgR5
 NAqKTbPCGALtVbPXhWtuv4wyMv5qhQ70r9/B2KYzJEHbgCBvFkQSwUTOVGbYzik=
X-Gm-Gg: ASbGncsUie1W9ZrZzqK9QNMELUKS1AQfvOapEjXvDpstsRoKU/uKiBLKd2uwUJqLbna
 76wMPL4ws8+oSSuclMMK0FJ+a37Z8vvUf1EzwOhhiWu/etjFq///ijyQk2rRPMx1KwQAQ36qHUB
 TMEZtcRmgEiM90gg4XgIkfEnv9/QMen033UX+xxrengfB5Brk4Eo1pfmOhtINoPdBc5z1wYrCVn
 +1HTGXrKOzD7/5jlHdW1ASMhMpgIdh/mFta/S4yFXTLYcJHXQz0qA1nU8zMI7Lioii8ZjbpniCo
 r2895HxXHXVuvxkUKmI3QthWMEtAj/bSfAtj/usdm/vn/04ZdnsDvIq/r289rIsIRmKOUMIwwJf
 zCv39Ch1/AMuq
X-Received: by 2002:a05:6000:2c7:b0:391:4835:d888 with SMTP id
 ffacd0b85a97d-39973af9092mr5073139f8f.42.1742456498039; 
 Thu, 20 Mar 2025 00:41:38 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a5esm22642398f8f.27.2025.03.20.00.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 00:41:37 -0700 (PDT)
Message-ID: <2c5bc1aa-c8d6-4077-84df-421d59b542c7@linaro.org>
Date: Thu, 20 Mar 2025 08:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/24] docs: add uefi variable service documentation
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
 <20250225163031.1409078-25-kraxel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250225163031.1409078-25-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qlbYbWSsRAAV

On 25/2/25 17:30, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   docs/devel/index-internals.rst |  1 +
>   docs/devel/uefi-vars.rst       | 68 ++++++++++++++++++++++++++++++++++

Missing MAINTAINERS update:

   F: docs/devel/uefi-vars.rst

>   hw/uefi/LIMITATIONS.md         |  7 ++++
>   3 files changed, 76 insertions(+)
>   create mode 100644 docs/devel/uefi-vars.rst
>   create mode 100644 hw/uefi/LIMITATIONS.md

