Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp721046ejb;
        Wed, 24 Apr 2024 09:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLexehf3dlI/YIugLP6L/k5p/oflSJnLPO4WvDwkY0izaC7LVtURlbsJRhfNiRqsY5/DGqaaECjBr6EJYJ9G0Euqbq/e/w
X-Google-Smtp-Source: AGHT+IH7IOWN16So+gjTxesh1iWghcMn0MJfj2xKu93Aw30RjCq7pMaY+OfLQS6wW+mW6XE046Gn
X-Received: by 2002:a05:620a:5745:b0:78e:fd19:4e56 with SMTP id wj5-20020a05620a574500b0078efd194e56mr3192851qkn.28.1713974741654;
        Wed, 24 Apr 2024 09:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713974741; cv=none;
        d=google.com; s=arc-20160816;
        b=fk3CZuiGFGjyeqcrNqzPDckFMksSlJlIBtZ2UDwhfpw9/poGHuD8YDQw07AFSW/mv/
         HTCYzJdSjoRm5SVy3M2uCyrOMctiO5GiKyD9d3w00h2od9YMXj7eu6gaJ/bueBR+HOFS
         q49DNZpMJjxl0xmt1qQ8YiOEX5ohe4xOXIlRf6ZW3Jzo3p4a0Xx0cCcFscZl1M6lF8MD
         VF/hBci9lNCfSQuHa4kMy8DIJu6rYN7vBBqvggHodYgMcCGI/n+IJ8K8/GofXYgBxBhx
         cqPgudAZWNW/7dbQ5Jzhr+5N5Cog/g3JmyDpC+D92SUov67RzDaIM3a50uBSTu00QLlD
         wkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AvhxFkw9jqfxOrZ5LRzVFFZbTM1fOmun5chamhyiV+E=;
        fh=KhPmtqiO7I+RHVSwxM6Q+2pSaisfnKJNQ7kjg9iU24w=;
        b=NfoqIC08Tc4MeTcwj8Ttj2s70VTVJCc5FlJy9uhRY4K6c/vj7iiNo4O5iCrkQICdP0
         5k5nqYaKYEd+/ytKs+xPu47zD8Sk9WqqZAdZyDsCRmWtfaY0SL5IVfe8cPMkm41zt8pt
         /A5DomEoq17F5P69kPkfqr9P4cXdRagKwcXYEO0nwfOkHPptg1kKYI13awsxSPXUJhBk
         c3eWXjpTumABjxs/be+4kUTBB0Za1eOxoz9ob+fKM0yHds39TChzeufrNLPcuIvFRta1
         Fqdkdbh/d56kslT0WerYpa85aQhNqMi99duoLoeAcBcAaETHDxKGYuddAqhIQAvGN/aV
         31Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c00QQ/5J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj33-20020a05620a1da100b0078d67e70f5esi15041851qkn.222.2024.04.24.09.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 09:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c00QQ/5J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzf75-00007E-7N; Wed, 24 Apr 2024 12:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rzf6x-00006Q-7J
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 12:04:44 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rzf6v-0001eb-FH
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 12:04:42 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e69a51a33so6621425a12.1
 for <qemu-arm@nongnu.org>; Wed, 24 Apr 2024 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713974679; x=1714579479; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AvhxFkw9jqfxOrZ5LRzVFFZbTM1fOmun5chamhyiV+E=;
 b=c00QQ/5JSjI1aIwpD8LUKni5NY7zpf2CRYNAlaG6jK9ApGQ++ElHUK0NirR7lo7vT5
 02IwyYfnzhT3VB4Gk1lxms8+fFQX8pVTAZDmm1pt/QdthuY23Pg8NKUB51Tkx3Y488Ge
 d8m1thsJOCykNCu4vgqUBLUPK8cL7OE63wR/LIJmiDfT/4AvOtmX0H8bFkfDo0ZG12YD
 kszQv8m3VIuLHv0Pa71JaLnV0FV+RnVDIziVSZm0S3IJOm4g0eQyJ7vnm81sEsDU1hrm
 r5eP5hrIypZ+Yu8wS6E7DbmtB2nHNMngSdUTuEd6kLol4H8MevhMsKKEDCmxbdTMztiq
 EzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713974679; x=1714579479;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AvhxFkw9jqfxOrZ5LRzVFFZbTM1fOmun5chamhyiV+E=;
 b=ZSxPlRnn9K4G3F3MrBvRx6sZNZPGROePAxpJNYYQynrd0oz6sjSlEGS/Nkh6wT3sXm
 yz6KcaZsXhfq67wVNpox/ExMpm5ByqFTj4Xe1Q961x695rC3smUB4xHINjQpbQIjB5oi
 2UGUXOyedrT524f/GsMj4Cg2k9f5cxAiDWrHxkrmGOhc7uUozNAEpXkvf13/UclLh7B5
 EjJ6cGa32m83ZkZVwdY/DDjsZWkyriTZN7RmteUeG8T4RYUNgnrpHQSijn8tSBIdLuYk
 IiMgCCbx7Ru4SiNfUn6tYLo4CSd/oPCGXVGEcbDx4DCLazsyNrfoEYX/kaDnOOQgd+gW
 jK6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE/5hRwEPM0pq3munEsQOu/Q1mFqadPsPeYEzWf7eSbN4ASy3aswLHRtVcRtMn4A2ltNqiv9oMOVy5qd0zm1sEN3nB
X-Gm-Message-State: AOJu0Yy5wI36bIL3tNbPg/EQ4p8dT73vS1JlP1bELytqEfTpoKG2WOjd
 DLg97+kYzJbo18KRd4BqlAfu/nvIhoJFnjQHVuy8ApcQF19TGdy4hIvr95fRwhiCo/8ShMCK4JB
 97iwoO+2r63JRBZqXDGR+8AcOPW1vb544f+GAgSiB0ewNXaWMd14=
X-Received: by 2002:a50:f688:0:b0:570:1ea6:e9d8 with SMTP id
 d8-20020a50f688000000b005701ea6e9d8mr2137218edn.9.1713974679115; Wed, 24 Apr
 2024 09:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9JXOxkbQP6-1uTK+hG5yvYRcO31PYFZSxGjfrPis1nYA@mail.gmail.com>
 <20240424125324.1628-1-adiupina@astralinux.ru>
In-Reply-To: <20240424125324.1628-1-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Apr 2024 17:04:27 +0100
Message-ID: <CAFEAcA-=kk_TQVRLLQvH96DC-ffmDqd_hU5=z=Og8ntYGxPUeg@mail.gmail.com>
Subject: Re: [PATCH v2 RFC] fix host-endianness bug and prevent overflow
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>, "Konrad,
 Frederic" <Frederic.Konrad@amd.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: k4MArdBADw/w

On Wed, 24 Apr 2024 at 13:53, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> Add a type cast and use extract64() instead of extract32()
> to avoid integer overflow on addition. Fix bit fields
> extraction according to documentation.
> Also fix host-endianness bug by swapping desc fields from guest
> memory order to host memory order after dma_memory_read().

Thanks for this patch. Could you split it into two, please?
The error in handling of the descriptor extension fields is a
separate problem from the endianness bug, so they should be
fixed in separate patches.

> @@ -660,6 +660,24 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
>              break;
>          }
>
> +        /* Convert from LE into host endianness.  */
> +        desc.control = le32_to_cpu(desc.control);
> +        desc.descriptor_id = le32_to_cpu(desc.descriptor_id);
> +        desc.xfer_size = le32_to_cpu(desc.xfer_size);
> +        desc.line_size_stride = le32_to_cpu(desc.line_size_stride);
> +        desc.timestamp_lsb = le32_to_cpu(desc.timestamp_lsb);
> +        desc.timestamp_msb = le32_to_cpu(desc.timestamp_msb);
> +        desc.address_extension = le32_to_cpu(desc.address_extension);
> +        desc.next_descriptor = le32_to_cpu(desc.next_descriptor);
> +        desc.source_address = le32_to_cpu(desc.source_address);
> +        desc.address_extension_23 = le32_to_cpu(desc.address_extension_23);
> +        desc.address_extension_45 = le32_to_cpu(desc.address_extension_45);
> +        desc.source_address2 = le32_to_cpu(desc.source_address2);
> +        desc.source_address3 = le32_to_cpu(desc.source_address3);
> +        desc.source_address4 = le32_to_cpu(desc.source_address4);
> +        desc.source_address5 = le32_to_cpu(desc.source_address5);
> +        desc.crc = le32_to_cpu(desc.crc);
> +
>          xlnx_dpdma_update_desc_info(s, channel, &desc);
>
>  #ifdef DEBUG_DPDMA

I would suggest factoring out a function like

static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
uint64_t desc_addr,
                                              DPDMADescriptor *desc)

which wraps up "read the descriptor from desc_addr and fill in desc"
as a single operation (by calling dma_memory_read() and then
doing the byteswap).

thanks
-- PMM
