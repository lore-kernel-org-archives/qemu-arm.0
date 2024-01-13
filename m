Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2932655ejs;
        Sat, 13 Jan 2024 04:29:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX1uCPTablnW6KGfnR4n/s0jyxZ5Zj9x94d+zhdAJLiN7otYzs/6l9OEeXwO1/Mgp2kC/D
X-Received: by 2002:ac8:7d13:0:b0:429:e003:444c with SMTP id g19-20020ac87d13000000b00429e003444cmr451427qtb.29.1705148961831;
        Sat, 13 Jan 2024 04:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705148961; cv=none;
        d=google.com; s=arc-20160816;
        b=yMnyqWUFq1nQHtytM3PdxYG/UaaMBZJTwOlXpoGK4H5ZlnxNc0tTBfHHNpW1vkU8Qc
         CB8jTmAJut+/6UKjbF8fv+yexFbHch6t5oSjMmk5LfVojExWPSKfLEIHGM3ywRe9CD8M
         2aBvahsTqKCHyBNxSZziFy2MRAA2dgs+dwMFsZosv9r7UPKvM2y3oRGOIM51lHKKE3el
         m68joWxEdCekt2K7kzD3EermbMeJaq0JIFA5oArtOuToUpAwczbsuYBpa7r7FP1/8gZ3
         6dyPqm5wKpUjjyJWYuhpwDJlKwgC7OZpAaI8tnHtaKvecVz7n2vGbgtno0SgzE4U+kA9
         B6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vjpf4U6Ficv9bUwVJnIdKdbrQ8+edT4V7CyfmwDK7x4=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=DINlpaMlkmhqjjDNnKw4gHUsfbida9H6ioW6QEsjTBQvYfjWipljOWMTUwv2gvQMjS
         6IaDRnQg4Qt7g1BBmc+2+WvruNwcHxmSeXEaHKG0jRHWO3YS+S2jsPXjVHxY5RF4qNDu
         EHUIb1Kc+2bMDUNdHD1IgSR3mrYSbq228zb02EMyBdV8UgX3zOChnHlZonK1gk9sVnVT
         X5rSum4goMlRy0Un2ESaDU8iDx980pFUbs7ZE7xVsdB6zJqf8aT53J5Unc+uzPYPMHJi
         9hbilO69zTiIS8LZbakUSk9oAPq00u8bY1zZJlSCLLmmXrlXmHUPOPfRrG7H52LetZgp
         IxJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yay4k8ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020a05622a11c900b00429cab0ff39si3418100qtk.173.2024.01.13.04.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jan 2024 04:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yay4k8ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOd7W-0000za-Gi; Sat, 13 Jan 2024 07:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7M-0000yf-Cb
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:28:05 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7K-0007nf-Eb
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:28:03 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso550915e9.3
 for <qemu-arm@nongnu.org>; Sat, 13 Jan 2024 04:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705148880; x=1705753680; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vjpf4U6Ficv9bUwVJnIdKdbrQ8+edT4V7CyfmwDK7x4=;
 b=Yay4k8ni9keuse0HTt7fbUonhZ/LnD59hz7mVh1D8MXZ0PSyr5iRtM+lvsgX9B6F8Y
 fgZwunVhHAM1ue+FwuyY6PwhCvlAOIuUag9aLuyHgUPAECmlveXtBQ1+2/WQhNDLAPuV
 PhsK4KQOf0Sz2KwSME7zxCsFHmmjJme/jN+sNnU0KsPpkmReybFvrKOipxbUzLW/5lbI
 Geaw8DakC4JlyfvvCZY+SuJxVDEASChzxXSr1V104kHX3r5tZFMG6774EQcCqGnhiRjn
 itiR6NinGW09CC7QxemOICqFAzxF4sn/CRdlqJj7Vx4BR46QNdj4DLpvBgJbr6NNhOeP
 sOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705148880; x=1705753680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vjpf4U6Ficv9bUwVJnIdKdbrQ8+edT4V7CyfmwDK7x4=;
 b=WiArADke1CCn5bpt+ySlTM1G+sjK7rENE1zKeX3g5s9c0rY5xrDDGQZggQs2nbKkqV
 iQGsT7szkBiHHLsekEeyk8jXW14mbLP8u18D9jJIBqOXTLJUnwHUyGf9tjeR6JLVQZgQ
 O7ykYb7TfazHV3vDPFcE7jp2YNXYJq1iNROvSGDTvBiPbxNvWqQm94nwb7jlMz/VRoaC
 PfwkfvYz2n1UXQPeVLNdqWxUy39f7A6WAUtRUERAsDMyWOQYwVn7hUpPSXSk2wEENFIU
 4XEvl63rcHft1hw0v0dsbvlZXGbMV4Brn/+2RmpX5U/YPPYPTdioRLVBQsHUX2mjeJto
 tJKA==
X-Gm-Message-State: AOJu0YzGi3c+wfZj7ePrc8qYMe5xMLekcqhlDOY5LEyVHnqaJg4X4dKv
 JRxlt/I1WWXfC+x8u2qOBzO/ijrHQw7XZJuDM7+9FRlohEx7Zg==
X-Received: by 2002:a05:600c:5387:b0:40e:5186:7ed1 with SMTP id
 hg7-20020a05600c538700b0040e51867ed1mr1067787wmb.25.1705148880639; Sat, 13
 Jan 2024 04:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20240110234232.4116804-1-nabihestefan@google.com>
 <20240110234232.4116804-9-nabihestefan@google.com>
In-Reply-To: <20240110234232.4116804-9-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 12:27:27 +0000
Message-ID: <CAFEAcA-iP01=MCOMntqHm-VdZGwO+w7Ba36s7qvZJsHTWWkCKA@mail.gmail.com>
Subject: Re: [PATCH v12 08/10] hw/net: GMAC Rx Implementation
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: R0S5fefpK7wj

On Wed, 10 Jan 2024 at 23:42, Nabih Estefan <nabihestefan@google.com> wrote:
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
> When RX descriptor list is full, it returns a DMA_STATUS for software
> to handle it. But there's no way to indicate the software has
> handled all RX descriptors and the whole pipeline stalls.
>
> We do something similar to NPCM7XX EMC to handle this case.
>
> 1. Return packet size when RX descriptor is full, effectively
> dropping these packets in such a case.
> 2. When software clears RX descriptor full bit, continue receiving
> further packets by flushing QEMU packet queue.
>
> Added relevant trace-events
>


> +static int gmac_read_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
> +{
> +    if (dma_memory_read(&address_space_memory, addr, desc,
> +                        sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
> +                      HWADDR_PRIx "\n", __func__, addr);
> +        return -1;
> +    }
> +    desc->tdes0 = le32_to_cpu(desc->tdes0);
> +    desc->tdes1 = le32_to_cpu(desc->tdes1);
> +    desc->tdes2 = le32_to_cpu(desc->tdes2);
> +    desc->tdes3 = le32_to_cpu(desc->tdes3);
> +    return 0;
> +}
> +
> +static int gmac_write_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
> +{
> +    struct NPCMGMACTxDesc le_desc;
> +    le_desc.tdes0 = cpu_to_le32(desc->tdes0);
> +    le_desc.tdes1 = cpu_to_le32(desc->tdes1);
> +    le_desc.tdes2 = cpu_to_le32(desc->tdes2);
> +    le_desc.tdes3 = cpu_to_le32(desc->tdes3);
> +    if (dma_memory_write(&address_space_memory, addr, &le_desc,
> +                        sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
> +                      HWADDR_PRIx "\n", __func__, addr);
> +        return -1;
> +    }
> +    return 0;
> +}

The series doesn't compile at this point, because:
../../hw/net/npcm_gmac.c:238:12: error: unused function
'gmac_read_tx_desc' [-Werror,-Wunused-function]
static int gmac_read_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
           ^
../../hw/net/npcm_gmac.c:253:12: error: unused function
'gmac_write_tx_desc' [-Werror,-Wunused-function]
static int gmac_write_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
           ^

(this might be a clang-only warning).

The fix is to move these two function definitions into
the following patch, where we add the code that uses them.

-- PMM
