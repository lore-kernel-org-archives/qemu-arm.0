Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2133200ejb;
        Tue, 30 May 2023 05:21:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71schmbk0VlQirUJ2D6V1ipGxP5h3SLppdsM3a8bf23KXgODcbg/r4Z+7v/FDO6CsH9X4v
X-Received: by 2002:a05:6214:c8d:b0:625:aa1a:b6d3 with SMTP id r13-20020a0562140c8d00b00625aa1ab6d3mr1256785qvr.53.1685449299702;
        Tue, 30 May 2023 05:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449299; cv=none;
        d=google.com; s=arc-20160816;
        b=XiVHLNfOoA9kc63+euDaqR/VWjVzlv0tAjsU8L2sMtOZQu144unWKxDrGkDbyG9o1Z
         /rxV0CAeJCiIB2jwOi3ieby5YQrMy5fIdGVpL11/V2EQrwjqmtM+FRXjFm41vxEBmoX9
         25UpvzLB+oKxcloj334aAxlfX+GVnc8aCMy0TAEg1v7gqb4ePKj/xolMa5rFK1gaJtDc
         zeiQjx/CIM/2k/TRV+e60wGQo/v66RULd7cticyrPrxzGRqJk3y8Z3HMgB93DCpUEsch
         j4cRX0hlq/UFaAyEDo9l/wRHH9HFMLgpzodXaBtGqf6Hh2VIOfaLQGcuGsqYl6sZ1qwe
         6CVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DFtZntuEl1to71WY1h4Q8k2NANDLHZYkiiH+L8N/vek=;
        b=ZlwFAmAZqCFD9uNCH59ouHWiAYjeIZrchNDY+CtDTva05TXfecNyKAZc+IhqM/xGB8
         mfqt0IDw01JtUyboDUftQhBdl2yGxbYgouEMikn+ZCXeCLdgU23V58+Z7zjI4EWEt2oA
         RP4FzD3kkFOQ2qzwE8HFPImbuSYtwDffwGSgYdpEWOIiIoV3Qzo3Prd2LDrHAYZ2ReKE
         recowGkjLrol4F/vy/Q16oK9zcueu47aCSdMoZE0bO+XVvBXZGlDXJttEU2ifd7Z5wm0
         bk7v3j+O6a7SrRhOh0DJ0hlBHz9rSs944P1c6MuafhVbnCcSepDY9pW6ndG2jSSPHXI3
         hMwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4rNGmhw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a05620a078f00b0075cd16efb1asi4261474qka.75.2023.05.30.05.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4rNGmhw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yLs-0001kI-Jk; Tue, 30 May 2023 08:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yLQ-0001aA-Mp
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:21:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yLO-0007WY-8R
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:20:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f601c57d8dso31787105e9.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449251; x=1688041251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DFtZntuEl1to71WY1h4Q8k2NANDLHZYkiiH+L8N/vek=;
 b=l4rNGmhwwjm0FuoTpbC6CI1/Ks59+Prjr6+cI/jLIs3y7h0VvUu2MAkUoPmPtcGvdQ
 zjgbjm9evt+mYkZzTkexUa8EtwHD4zyJFN6ZAglQbUCcfQ8K+J0aHU2yOypjk6hYZgXN
 dkw8NtbTSSqaQuE/WA6fp56VR+wlrAPyPK646lAlaYZmKgANHQOSVXqVocB7Co5Y+ZmU
 56TCLUo5D1dEALpjbl/wK1M9tcb1+8kTFQkV6lDEXm3GI5ly8lh2k5uL6f7q9FEx1Ngd
 9499Gn/RV5RvOy2qPIoQPW5qw96KqyShFQLtWHWgsee4hnGrZidC+OXwh45P9i6KTuwB
 E38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449251; x=1688041251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFtZntuEl1to71WY1h4Q8k2NANDLHZYkiiH+L8N/vek=;
 b=ArFU1IqI240qB+hkpoIfuPb8whMPqTr2coJn7IUQrCmqC+249vShvMTiCQcNUC+tia
 ix4TCgatlNWAb7sDZ4O6nCuvFGlc+oPRIFpo6wZRE11QPaxRJ3lRRMGWcbOfdSQgz3RO
 xP45a73xbcUMpPTzaBpm99fU2GslbGgxfGqmiLV6A0+9qahBdLqTjaS+W8ViDUxcqEeL
 sCb2qQg9mPmfwSpfPYftTq2/te391/k9IqYiS8HkxXfnNJzU6xqizY33bHTNm92taASu
 hQ51DB8s1yulcwSs4U74VIt/LEyTnVp37rdY6SUj+VuOCeQZXN5kR/YeSrwWzCivDIjw
 +7oA==
X-Gm-Message-State: AC+VfDzHjW2XMfMX1/sGdwsoYnrox35sSTTqxEoPmHsf/P2KsqiPmL2Z
 jnct7VrGZKzql7Yh4gxq/bDuyA==
X-Received: by 2002:a05:600c:3551:b0:3f7:15:ad37 with SMTP id
 i17-20020a05600c355100b003f70015ad37mr5806037wmq.4.1685449251375; 
 Tue, 30 May 2023 05:20:51 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1c4b0c000000b003f4290720d0sm20720665wma.47.2023.05.30.05.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:20:51 -0700 (PDT)
Message-ID: <56ea1eb5-34fb-8650-0d3d-4a63b196658f@linaro.org>
Date: Tue, 30 May 2023 14:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 05/10] hw/loongarch/virt: Use memory_devices_init()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-6-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530113838.257755-6-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 0NP6cMKm5sB8

On 30/5/23 13:38, David Hildenbrand wrote:
> Let's use our new helper.
> 
> Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Cc: Song Gao <gaosong@loongson.cn>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/loongarch/virt.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

