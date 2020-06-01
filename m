Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3546999lfc;
        Mon, 1 Jun 2020 16:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyezMFNnC/4Ixp+vidu1ivk+d8JTlm9keApjQJhwxzkuOVqjXQ4zlPpzpcOPuZcbhgNJt0w
X-Received: by 2002:a25:6c6:: with SMTP id 189mr26914710ybg.375.1591054727596;
        Mon, 01 Jun 2020 16:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054727; cv=none;
        d=google.com; s=arc-20160816;
        b=GinD54W4B82+GkXavD+e7EGhgMZDhgtsNmbdssc6dDWf6ZgDH3cjFOM9ywJhr/K5t4
         uX4UZH4aqS+ysNNmQjYYDjtpdGEDbsOjtt1w3gNFyl5Gbj4ID/nmx2iyBVirUAh0sIVy
         I2TJ/CFBsg6sLETseyRCB14T9gFxo9kly0ljptk+k0uo9xWbqiQ5j/SutnZtd809Qj74
         7kIrfko0Oj9+3egpOJdsZbsyBMXX7x6110QueNuQkRiIiSxf4F19zd6JBHyEmAwBaM4a
         b11Gn0/89lwj/t65n3lQvxDk+68vk47OjxGesiatMPNWntv+FP6OqjgLC62vpJrFt2Kf
         +6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hGrlH3PqgBr3ZkLXs0ICSwS5m6e98ZxaoB6gTALk4to=;
        b=WwCo2WBTblQPR6h6gX5jLcWbrQRKybkqYNf5V/+bDuGUisHTNcLQfoQlt8oXL+PdMp
         OLsQy6m68t8UpTT9kY6AAHhYHBoGV7CHK99kLmqTu1bgk5APWz00mAx2U/jmD9FTyhh7
         XixevS2ScGgBJogCiGjkvD5+x5CQc2Nme3up+FDwsfpGAXDXyTdlYxOiiq0HIt7tlNQH
         v1kVuWOlm2eB5yS1U8Vj4uTqPdT4PBzxVkuD7XyafkINlN+VXjQCyAqIwc4Mu5QYBCcV
         5c50EwlTqYyufz1cZEQ12ysNUDrE8EEzSuoHsBUPWbROWRNHOiwpWH44q/pWxS5Mnv8h
         FVgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GFWJNcIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r65si791312ybc.379.2020.06.01.16.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GFWJNcIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfu10-0003vD-OZ
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftyP-0000wT-KR
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:36:06 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftyM-0004vY-Sh
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:36:04 -0400
Received: by mail-pf1-x441.google.com with SMTP id d66so4169051pfd.6
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hGrlH3PqgBr3ZkLXs0ICSwS5m6e98ZxaoB6gTALk4to=;
 b=GFWJNcIJwd07F0D6M4IVLW6PM8NwXWcTh05r+2LsqCuNKmw3KcaiHOLhKJcdunMpKy
 k8C7roaMyHD4kAFgeLh1abx6yLpKVPoLQr+e1sZVtY3Aw9W8WkhIiKz6w76YB+JqcH4P
 MxkAomMSNK8vmd+4Jxt+xrrsCTPQEsE8onWo67228m4xttiom20ukivbUAHX8Q8JUeWg
 0S/zSvXhSxLPN+S8RUH60vBO3/IgfMPExKMPz0QsEnIpgApVtllcayn9Qb0l9VfAtI6h
 +YQXQOC2rlmxeKBLJRIZWtdy0au/+c1OsjwAQZ0kpGZpn/9flGgboP2H4IxvkCRz+1fm
 FVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hGrlH3PqgBr3ZkLXs0ICSwS5m6e98ZxaoB6gTALk4to=;
 b=DEPxMx4BU7L9TMOmkhdotGtM6bPzQXJg09yToAHsgzcuoZt9GuFjVn+QclEblz7jXv
 30RAQIe3nI6vsXFSUyeVTETHJY8soNlais0lY78CwQkxxOvj61Oh9tHkQ0Bu9/XB2J2c
 gmBbpr+zHMxdeS5k9Zk4TvuODwV7Mda9g8TapjhQFSfSWQ1oOukhML3FiiLaQJSEIWTe
 G4EOPxUTnMa0LnwvUKPHSYUw00rXsKbRu2MKNalP+IGOsu9MnF8AgldNIIuHzyQyhIVi
 Oa4Cl0l3wW0biZwcMFcmJ2F5+iqujwtsYU/viODGqGvD5oRiyHk39dLF/X6MYELXwyt6
 4JWw==
X-Gm-Message-State: AOAM532rYP2Tw5P7fesQjJ1gVfnhZFwb29hywE6LZhb3Ci6fKT4gHS5y
 y2QPgn0kzltWWn3goG647qFjkw==
X-Received: by 2002:a62:ee07:: with SMTP id e7mr22044574pfi.42.1591054561486; 
 Mon, 01 Jun 2020 16:36:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m14sm445894pgn.83.2020.06.01.16.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:00 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] hw/pci/pci_bridge: Correct pci_bridge_io memory
 region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35f77178-dc79-3b4a-7562-9bc37fad9d9b@linaro.org>
Date: Mon, 1 Jun 2020 16:35:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DmhWGZeo7h+7

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the pci_bridge_io MemoryRegion
> ends up missing 1 byte:
> 
>   (qemu) info mtree
>   memory-region: pci_bridge_io
>     0000000000000000-00000000fffffffe (prio 0, i/o): pci_bridge_io
>       0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
>       0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
>       00000000000001ce-00000000000001d1 (prio 0, i/o): vbe
>       0000000000000378-000000000000037f (prio 0, i/o): parallel
>       00000000000003b4-00000000000003b5 (prio 0, i/o): vga
>       ...
> 
> Fix by using the correct value. We now have:
> 
>   memory-region: pci_bridge_io
>     0000000000000000-00000000ffffffff (prio 0, i/o): pci_bridge_io
>       0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
>       0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
>       ...
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci/pci_bridge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

