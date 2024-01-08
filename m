Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2332432ejo;
        Mon, 8 Jan 2024 07:01:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmRHDokSPbU1IP2JczRJZOXSq775X9sJ0Y0kbsTQzoW6wETO2a/V+Mm5AdZ1wYstNHd0KS
X-Received: by 2002:a05:6102:3ec7:b0:467:cabb:c6a9 with SMTP id n7-20020a0561023ec700b00467cabbc6a9mr1264809vsv.3.1704726078236;
        Mon, 08 Jan 2024 07:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704726078; cv=none;
        d=google.com; s=arc-20160816;
        b=B3AX8FBnty9onHNeOJitj/TMl9C5I6BmLpP9umwvoz5ig5D/n8wHbO8N2uIKvSC2My
         t0bDH2F4M3WjBdNEu9r4B4z/HG5iTKWuwv7kT20re/dvbBqC9GWCCEcnsSNN6oRsy/E9
         53Rl6VVp8+2MKfSgyNmwXpAmd2WEw1GiSU/g0eEbMrmmwXusouHx+Zf9s2S6F+793zNR
         nOkPmI+GyihefyRLejh9chCd4say/g954yl6JE6Vd0drV3lQY5N9ZZFY1wTlZ7BvDdml
         qJBoH3C6U/W+oGsRGtlPHb50mroEls4RfycXNo4h7oJWVDYGaY8zKu/37gIL6RD4jUr0
         hMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xjuJ8p64YYyiyxB8HtYFESOS8y/RlKCSYwiAqrSM4ZQ=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=JQTG2E39Fu61/Y9LhgA8AahEZI4U7alfSPNpZrESMkF7j1ijYHFpu8noc5mWhins5N
         3KBRDa7qzCnniE7yfoE8/Cpa6EMyPieOdO19b9N3WqkruyMMJiJpQg5jPgU8fhN+cLpi
         N6MH+P+TgTAh5V393K4LqR8GQGEBNv4HtAwu3awwnUDxGAfMAJLcDKOgngkZYZUmT7yB
         F10I9g3ERk7JmtzKL5i3Ul5V/qunCoPV1R8btxvcRW3zYxDQbe6Q7xhn1pm0B9vfKb+F
         FRYw0jg4bw5PIJTc88otQVi+wdCNPc+CwPrYu5t8yRXe+FXtWvU1BLemihENd52kb/iX
         E3BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oYPQYYDc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm41-20020a056102512900b00466e75aefbasi4003vsb.12.2024.01.08.07.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 07:01:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oYPQYYDc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMr7o-0006CJ-S4; Mon, 08 Jan 2024 10:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMr7l-0006Bo-3c
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 10:01:11 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMr7j-0002tF-1u
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 10:01:08 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-557d08bb0f7so717479a12.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 07:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704726065; x=1705330865; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xjuJ8p64YYyiyxB8HtYFESOS8y/RlKCSYwiAqrSM4ZQ=;
 b=oYPQYYDcOXsTRWn3enElgBHjISZ7allLnbHvUWgCOZN/HGISDDgyQD5vXhzQ4BCdaG
 V+a+0XE8SPBqhzfh1cI6rxp+xdgcLCsNMRm3A/17ZaBs2ZbsedPrKKIUYOdB29R36Bjy
 pGmcZRwR+TI8mdvfblJ8hm3/MSZRU+IzmDivdpfJt26PqAK9FoArD/xG5b6QW58V8m4K
 n6cCbvufzosM2nKTLEJb2AJNtzAowUYNz3e8IRbCpzKRxDQfop8Nw+HKv5YZaNew0iRU
 UR3lohyJ5B/+FsSeY1TmDlqzO1/mTEQm5FhBV/rUbZYdf3ozn//7329umtPnvayNlOnO
 JJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704726065; x=1705330865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xjuJ8p64YYyiyxB8HtYFESOS8y/RlKCSYwiAqrSM4ZQ=;
 b=bDB5olomld/FohLzRVBjdAOU5gfZ7EvU/g0a5GXJJkKpYQSECMEBWCjaZkyGFj1kZD
 GUGr14hMif5v65IPkdE1R7nEbeCbg/lzgtSHrUqmqZLSLXQRUDG0Deq6t71JudJHzf+O
 yxgNEAkxwI3X6tcXyHBxdfMBh+0M+cOwfXFsyTL3ZkZRweC/Fh2Aqc7N65UYApTC89rV
 fFzJ1ZDAbEB7DAilXXXUc6ciAhpIjBCwcMUk1bFeSo4FfeZWkCnzX2s9LSXsl6GHw5i6
 1jjZnRrHavLl8ho/5Wu2MtTAcGnAxhOV0ncu8TXNnZxWdtZGDi0VGsnr1Y+JNU1zJcOW
 tjDw==
X-Gm-Message-State: AOJu0YxtlI7q7kzcHSvo0Vvc0XDBhA1fbdLEDH1RSbyk9XbV7/rmQArr
 YF87SBvPnA92AYfy2TTlB02YG1UaN+UaVGbILkzCk1IxTJj3Wx1gSjUSw/9B
X-Received: by 2002:a50:cd90:0:b0:557:e92:155f with SMTP id
 p16-20020a50cd90000000b005570e92155fmr1663909edi.71.1704726065390; Mon, 08
 Jan 2024 07:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20231219213255.604535-1-nabihestefan@google.com>
 <20231219213255.604535-9-nabihestefan@google.com>
In-Reply-To: <20231219213255.604535-9-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2024 15:00:54 +0000
Message-ID: <CAFEAcA8awaf=fdPGk+YcV9zPjGNbhP0n=-L0p0VEwPe1U6tXRg@mail.gmail.com>
Subject: Re: [PATCH v9 08/10] hw/net: GMAC Rx Implementation
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: mA57NHClfonR

On Tue, 19 Dec 2023 at 21:33, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> - Implementation of Receive function for packets
> - Implementation for reading and writing from and to descriptors in
>   memory for Rx
>
> When RX starts, we need to flush the queued packets so that they
> can be received by the GMAC device. Without this it won't work
> with TAP NIC device.
>
> When RX descriptor list is full, it returns a DMA_STATUS for software to handle it. But there's no way to indicate the software ha handled all RX descriptors and the whole pipeline stalls.

Please make sure you line wrap commit messages at an
appropriate line length.

> We do something similar to NPCM7XX EMC to handle this case.
>
> 1. Return packet size when RX descriptor is full, effectively dropping these packets in such a case.
> 2. When software clears RX descriptor full bit, continue receiving further packets by flushing QEMU packet queue.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---

> +    /* write frame part to memory */
> +    if (dma_memory_write(&address_space_memory, (uint64_t) rx_buf_addr,
> +                         *frame_ptr, to_transfer, MEMTXATTRS_UNSPECIFIED))
> +    {

Our coding style says the open brace of an if goes on the same line,
not on a line of its own.

> +        return -1;
> +    }

thanks
-- PMM
