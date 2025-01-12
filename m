Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1356207njn;
        Sun, 12 Jan 2025 10:18:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvihEIS1aJwcxQdHetQuS3VxE3Y9kGJvqDYeVp1YLK1OeAGJUselnmmX4RdYhM4vjzQskKgJICUrAhhA==@linaro.org
X-Google-Smtp-Source: AGHT+IEGV+VMwNv3gdJv2Sjqhq8OACUJcaTZwxUDce+5g0BDHRgdCw4uC77FeJVCwqL62kMssY6d
X-Received: by 2002:a05:6214:4290:b0:6d8:9a85:5b4d with SMTP id 6a1803df08f44-6df9b1f466amr329339606d6.5.1736705891412;
        Sun, 12 Jan 2025 10:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736705891; cv=none;
        d=google.com; s=arc-20240605;
        b=UVyMuDB5S8wpBtQrUYaoe0XFIGFrsZt51cm+E5pefF/EZSpQIT4P76Wm1YXiLfPiX4
         OVoi8c9d4Ji9PdqLQZOAcZEZQ+ewktskQq1Ej4e/CjL5WeG4Gj7TRN/Hf9Js9UVKlWmP
         8AmK8lrb11/q560J7Uc4G1B2D3yMGEm5JYPuFKDjUcVhMfE+6j3x0lhaoVQZ7Go8UPsv
         H5bnFxQ6QUafg1wHrQLAfwrCgD9MAVRQBSp2e3IwZDKOrxlrKHGNxDCOM9w8nvlZRjDT
         VAczd/j1Q2z+qDE0YmChHeU4eRYrrBtXYZzL/NKlZlhmjuOP2YcTBj8V9xaRkdZZlCj1
         0LZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tJlrmxxKy8QK2Sqqisic+Nnsc8wfC643ue6qLvSCilA=;
        fh=G0VwAY14xHODdocIFr1t03b/C0zaEnp05QKzG4ettTo=;
        b=PrD8RvwPncOMuwijqM6n1wn1kSxZ4nUCkCcjfVgi06N6emrHO4sMCIbKJIEcOqxk5C
         F9A7SsJHQqKNKCyDqubycugIh2bOrYobkXbBJEtrEgDXJ9KgOtQiED1SOWACp6FDs/x3
         n8qtGcfxyElVi6/QATY8A8bbVHW4jcJVtmACQuSjcuzeAsRGU6G1hlZO5vnPq0jpe2Qb
         6B+fbJ+Y4XQIyXoUf4En0BvTpPCyDsP3lGZvNnpPgYnD0Da0oBFGhGo5s2Ih/2vp1vef
         xC5I3fZfeEU3DAmPL/YgRQWqDTDVQIFp7MnEvsO+NSCQ8WE2+4b4uZ62EmsA2Epkp/tK
         2q0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mGP/OP2R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfae0415f5si75924306d6.509.2025.01.12.10.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 10:18:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mGP/OP2R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX2Ww-00018i-PZ; Sun, 12 Jan 2025 13:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX2Wp-000183-Vs
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 13:17:41 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX2Wo-0005Kr-97
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 13:17:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so35027005e9.1
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 10:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736705856; x=1737310656; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tJlrmxxKy8QK2Sqqisic+Nnsc8wfC643ue6qLvSCilA=;
 b=mGP/OP2RLB3buzfOvQQuCXt9upugUTneISDJpCmAUCQEXOM20C72eMO6AhbDQRC2t7
 HjnpCtHl2vC6u9GjmNkgQSYMM2wFOP/jzbIaV5huXzAAzdGufsN1HhuxYjoyO9C12G5h
 LcNMQmLJC4apkZ4TE+7/IhWDGH4q245zplXCb9MsYzWzCy4t7Ak8nwrwb3+SwEtQq6DL
 doMLZnCNY2Dxm4/exlqLg8CDQjFAA/tsXo5wDzcwvgX0YbwoIcd/DwIFh9JNhv25McD2
 XbS3QtfVHdU7yAA91VNDAkSZ96TYGH6dnM3OlEnGkif8GiqiTLB6mW13Ounn6r4zYDrj
 vz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736705856; x=1737310656;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tJlrmxxKy8QK2Sqqisic+Nnsc8wfC643ue6qLvSCilA=;
 b=WJbdfYm5psUK72k0rmQszywNxG28Ejwzu4Hm9ELieyAj2wRyBwxR9GvH2i6E6YIaer
 O8xtg/vlUNq7j0yv3JFRVTwz/vZNbJYB9xSIi0ylK3JaXrXmT0P+rE3XpY/fcHOhIdHz
 cSUWZCJBVXeCsQ4DvaZ14be4mWNcqiWC3ixQME4JM6YQKJaJtb4593UaQ0Q8gp3NWS0P
 behS65XWeaPwpqCabRnEAmZUjGgr3VICV9pCRJXRqQMRysUwYo0vHboZwKrARLp9kudV
 XCbCDkgMASyv19Xeao5BwxgpCHh/lWwEJ4bRXeauCYwfCwOLCuhJAkRajUnBGS8qvSqE
 YniQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxdXVlo5hX1m7r8UeoP2LZtaYRVYr+e1+4ie0R3VQEfI1DE4i6omF3w+4+ajIbOFvLCF3DH/c1iA==@nongnu.org
X-Gm-Message-State: AOJu0YyxTVSkiuzgi+iPM99qq/gysjlVouT17xaP4dQ/jfIQGsa58FKD
 Fwh/BE//ALBvJ1w4kV9QLMDyqkJF8mc5N5fG89c18dxSDR32yXJhSOYG9WDYyqs=
X-Gm-Gg: ASbGncs2chAO6zUy9UdohoTCo38rpCykxeRg8hy0DiK+K0/MDQj9Ege7JbVMO1L36sR
 eG3GPxR3BKyNDExgA0kQLI3Q0Nr+DvGa1rTuvI78GnptbZexQ4cghvoLUy5BoxS6OgBFpmJM8MT
 NMwIr0ebkcd4Dcrh06oy+doMOJv3htGQBps1f76cSLvs+DTr5L0c4DTshp7c29stxylNXXuP3vX
 Xr0d0qWwqBsG+2pFr7MBu6rTvrV62tiwCB8dOH78RtnJ0bv56Nm8ilZ9KHZwDLK66Z8YSbkUlV+
 sPDplCkov9KfPxWvBfESAUwo
X-Received: by 2002:a5d:47af:0:b0:38b:dbeb:63a2 with SMTP id
 ffacd0b85a97d-38bdbeb64acmr1417724f8f.55.1736705855626; 
 Sun, 12 Jan 2025 10:17:35 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80besm9988954f8f.83.2025.01.12.10.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jan 2025 10:17:34 -0800 (PST)
Message-ID: <821300ca-47f0-4de7-a7ce-a49aeb0d3dbd@linaro.org>
Date: Sun, 12 Jan 2025 19:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 00/19] hw/net/xilinx_ethlite: Map RAM buffers as
 RAM and remove tswap() calls
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
References: <20241114210010.34502-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: pMp+mVLGoCF7

On 14/11/24 21:59, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (19):
>    hw/microblaze: Restrict MemoryRegionOps are implemented as 32-bit
>    hw/net/xilinx_ethlite: Convert some debug logs to trace events
>    hw/net/xilinx_ethlite: Remove unuseful debug logs
>    hw/net/xilinx_ethlite: Update QOM style
>    hw/net/xilinx_ethlite: Correct maximum RX buffer size
>    hw/net/xilinx_ethlite: Map MDIO registers (as unimplemented)
>    hw/net/xilinx_ethlite: Rename rxbuf -> port_index
>    hw/net/xilinx_ethlite: Introduce txbuf_ptr() helper
>    hw/net/xilinx_ethlite: Introduce rxbuf_ptr() helper
>    hw/net/xilinx_ethlite: Access TX_GIE register for each port
>    hw/net/xilinx_ethlite: Access TX_LEN register for each port
>    hw/net/xilinx_ethlite: Access TX_CTRL register for each port
>    hw/net/xilinx_ethlite: Map RX_CTRL as MMIO
>    hw/net/xilinx_ethlite: Map TX_LEN as MMIO
>    hw/net/xilinx_ethlite: Map TX_GIE as MMIO
>    hw/net/xilinx_ethlite: Map TX_CTRL as MMIO
>    hw/net/xilinx_ethlite: Map the RAM buffer as RAM memory region
>    hw/net/xilinx_ethlite: Rename 'mmio' MR as 'container'
>    hw/net/xilinx_ethlite: Map RESERVED I/O as unimplemented

Series queued.
