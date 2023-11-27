Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp903635ejt;
        Mon, 27 Nov 2023 02:16:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcCfHwu0AVsBQkLtVNSp9uI7kIBYFtRRVYCvt353qpWLHg9fO3acyN+1p7zr69I/AeGNyw
X-Received: by 2002:a05:6870:d1c4:b0:1fa:8d1:f886 with SMTP id b4-20020a056870d1c400b001fa08d1f886mr12807467oac.38.1701080202753;
        Mon, 27 Nov 2023 02:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701080202; cv=none;
        d=google.com; s=arc-20160816;
        b=lvUw79Z9sfFa+XmpY0rk5y2D9T92Ht5zAgjhVDR1tUAbORnTdOUzbtAWNyZHnBH9JW
         AAhoNfBUBuuHCQxkWjpf/SA+5cjqSCgNyYoy7B3//6THMm/xvv/7fN1mqijF1Su7kOjR
         Pz8mpVZBdGluActE6SFw5e6B3QFbD8DNEcYtohOylZbyovKTRAlIEQMDaHDJrPvUzjbp
         9NhRplx8z/5pLWWFx6PRf26QanKR3zNGXL1ebL3MqgtP9EJk+A4FAnXtjhiBtsaC7SGd
         /44UqOFrfli+h+sgiAkXetGr4FM0SZbV95nqzxVZGXdDV9ZiuHyaIh4JldksVmVw+UdZ
         ksRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WnDqxlwPP8NlnJnlA+JKQnJAog6oGukwqh/qQR4RmmU=;
        fh=yP29MqULvWgm23LYmFOjskzGuWVDm9tPq1phdPz9jF8=;
        b=rO60CK8h9rXrsnWbhfX7c3ujDjyL9v0+TceawLRu10aY+WzWr63ZoO6P/XR/rKhfyG
         DwQ4EtF7XA0ogt/bgTeNS9RTtyTF9WjPbX0GAwqCIqMH1sIaK4NM7Mm+u3zXJqUt98rI
         NIbLUUbQHQKBpmVXyslRYE7RiGqlY9zMt67GCcn0tx7jJrZ3L8j5tC6PBPa2pC89ZNyP
         OcO3E+X0SeQP+vKtdoSIXVH2Cz1eXmFelaJ/mZD2JqVsnk3D51fkhP0CGdESSzcfkHWV
         Bk0VFBW3y9sZJ2B3ZMncgAJ5YFM7vcgbG2fqacm+2Kgumbh76wDy5Ic8UXoyyvKmjTO/
         xNRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RDjdR7Qr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020ac858cf000000b0041817f70871si9240400qta.510.2023.11.27.02.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 02:16:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RDjdR7Qr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7YfB-0004Dw-W9; Mon, 27 Nov 2023 05:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Yet-0004Ah-I7
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Yep-0007zI-N0
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701080162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnDqxlwPP8NlnJnlA+JKQnJAog6oGukwqh/qQR4RmmU=;
 b=RDjdR7Qr6fqXwtwx5Jafih0DW5AErO8wVYPD6I+iWef7ZZ9MXZHJ0oHcJ/GL3ghwRyEgO4
 60CPeAU7nOwWZCxap8CRj6rJG7BoSUEPeoiZ5Lh8EckbQVf4MPBE8DQPhu6s4RVSsN09UA
 nwb6rguYP/ay/V2swz2uqvRoQ8h7lMI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-XuXdlLgQOQ2wllR2EE5W9Q-1; Mon, 27 Nov 2023 05:16:00 -0500
X-MC-Unique: XuXdlLgQOQ2wllR2EE5W9Q-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1cf8ea601c8so44125115ad.3
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 02:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701080159; x=1701684959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WnDqxlwPP8NlnJnlA+JKQnJAog6oGukwqh/qQR4RmmU=;
 b=ZAkJF+Lz1gjG1W98AiO4nXgrbU3OmUuCYrvUrHExETrJHOLSJOLfhdIlFfLkumc4WT
 goYi3BtSvENOlK2pelltQJw6mdd228uu2MU+IM7RLRHLmZWST6tpvJrjHdCyJ8K62iFo
 Dq6u6nCyjsyLQk6G+xLLo6YFGrFT3hGn0VnRHHOyHNHBUXYziNkoZr6bUw+Ejz410upA
 quqqE4Fzma7eYDKuXvOZr89S2nYvMyb/1N6dGi/6nxhCpXzusgOnnUQN9zqaQ7HDNS1o
 D4HsQUKcpIamzh7pOj+zx2mRFPS30Yknk+8H+Zo/TWvRF06uoBMGFGfnczE5pva7z30f
 HTUg==
X-Gm-Message-State: AOJu0YzvdCTf+dGxDGgxO1kN61/7Mp9W2YCJzxsSsJPyNpLu6O5IwJto
 F99ku+COAgjCLLEnY24/BcXxEyuzDPhK6rSujnc+OwjczgvflVl8JK6Q3arpv/eQcrred9EKIdv
 a9x3TcHe0wOHD
X-Received: by 2002:a17:903:1205:b0:1cc:5589:7dba with SMTP id
 l5-20020a170903120500b001cc55897dbamr11322462plh.43.1701080159653; 
 Mon, 27 Nov 2023 02:15:59 -0800 (PST)
X-Received: by 2002:a17:903:1205:b0:1cc:5589:7dba with SMTP id
 l5-20020a170903120500b001cc55897dbamr11322433plh.43.1701080159341; 
 Mon, 27 Nov 2023 02:15:59 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902e9cd00b001cfca7b8ec4sm1975798plk.101.2023.11.27.02.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 02:15:59 -0800 (PST)
Message-ID: <1a4e1fa1-ee5f-457e-86e3-2dd2a27500e5@redhat.com>
Date: Mon, 27 Nov 2023 21:15:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Unified CPU type check
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <35c87631-062c-43e8-bf46-67aa3cef5b30@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <35c87631-062c-43e8-bf46-67aa3cef5b30@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 70JrUXlKC5yo


On 11/27/23 21:10, Marcin Juszkiewicz wrote:
> W dniu 27.11.2023 o 00:12, Gavin Shan pisze:
>> After the series is applied:
>>
>>    [gshan@gshan q]$ ./build/qemu-system-aarch64 -M virt -cpu cortex-a8
>>    qemu-system-aarch64: Invalid CPU type: cortex-a8
>>    The valid types are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,     \
>>                         cortex-a72, cortex-a76, cortex-a710, a64fx,        \
>>                         neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53, \
>>                         cortex-a57, max
> 
> Can this list have some better order? A35, A53, A55, A57, A72 feels better than current one.
> 

Definitely a good idea. I think this series is about to be queued,
let me send one additional patch to do so after this series is
merged.

Thanks,
Gavin

