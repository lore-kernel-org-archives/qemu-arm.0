Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1033479ejo;
        Tue, 12 Dec 2023 08:42:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2dMEO6DA+3M6qVQ++aXFzGakzNkhD2np9s+7OdGuWx84hwDCLfQVUavxDQHEN1bhhZYib
X-Received: by 2002:a05:620a:2048:b0:77d:77cc:a36d with SMTP id d8-20020a05620a204800b0077d77cca36dmr9194983qka.6.1702399377337;
        Tue, 12 Dec 2023 08:42:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702399377; cv=none;
        d=google.com; s=arc-20160816;
        b=g3ybut72Nx8lbkgBIyo33fTA+sZDXeYC39dkcK8l0RJmz2MeutvPZJF5h0NaacIMJO
         BC27SWZaXuueOgUXmhuI367ADZynN6ez4/42HolvlSe3Yy4WtieAVBMetxzlnQPMF69P
         dSPbTFko9JqysAOuXGxAUHDa02vTqkDxqg0vzAnUdjgR9TwQZkzBTTid3jY1GH/sVMrn
         LEUTz94qxdhRi8IM6lRblKvFfcfdCHie4MSN3Uno5/99e/xX8LHifs/JvLPL+KV4Pldz
         gcwDYWsV5ru4CFglagoWs8fNFzXsWjoxKjZ6x88RuAQNDByNo2bWmHOAOLfJvuRGzXqe
         /gLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6V3XEQ7dCz9Oc4xHbCPWCUQ4m1Buvb3dGtaqJs6JjpQ=;
        fh=OvxsSc1PGY5Z5ELrkbN1hqRsN7mMM/aB5TwiNUvax40=;
        b=C420vrra10FU1S8WnLZonCoYZXrPC4hqs+7y55HaEZaxcss/33W+kYwgaX5dbCxr28
         GtegHTErbYt1/T24Ze4PQt5tdPbAzpVcbynJm6PjjhEopkI7bPZpUXxVY4kvcK0DKp6A
         ab2Ca7kFJG8XFZnXffBY5akis1hQ2k1s6MfWBoJ/dmZ5ipZC+iV8iGW0TuM9ENz85fXL
         fDphhvYiKG9GR6YArkDI2fAriW92RFcBkqeVldd28IPUe7fnI6L9FmJPuAp7uJCuAnoD
         OIoAdqrC3Hungx0ZtmWhPLf+sywd3Vl2WfsPK7Yq7v35eDYOdr+tPWJbj7WD4p+jKGPH
         iegg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAmm3vbL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a444c00b0076f1797fa7csi8006371qkp.534.2023.12.12.08.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 08:42:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAmm3vbL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD5q1-0002KP-9I; Tue, 12 Dec 2023 11:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5py-0002Jr-9t
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:42:26 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5pt-0004MC-JW
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:42:25 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54cde11d0f4so8235565a12.2
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702399340; x=1703004140; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6V3XEQ7dCz9Oc4xHbCPWCUQ4m1Buvb3dGtaqJs6JjpQ=;
 b=VAmm3vbLMPJggSTX6imGVkE6L8nTck7IBL+T4S/q4VwIvzXd/ZueHh5u62Ex42no1a
 x9+YY/l4yqi6NG0fmjIUMb3GiF9roZkfB5GC92R2UB+hoaVVIcO4a+TxEyBnMAuduvOA
 6pKZpQodgs2lAVA4euIQmBOZihHQ7QiryTN1rXSNhTnT34rCnvsTSCyE3Rd2/qeWjNcN
 giVFqFpflBO169E0M/oiCh2OMJR8l0qw5GnzLSYJiv+YLl8VK2bWri8giUY/o41RjXLT
 vfSScnyyt3xUai5hJazq1yxp4kB6u8lyjnX/05E9kOJ1ifOmUg2NsNAfb8GPNC4UnSQT
 RZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702399340; x=1703004140;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6V3XEQ7dCz9Oc4xHbCPWCUQ4m1Buvb3dGtaqJs6JjpQ=;
 b=vocCC3gO0ZTrdkenK3ijCUghNP6rY1gPXVIm0TWNZ+Ab5VssHvWBd2XRzYMX4qDCNs
 40zS3vRkWyn10aE+neWFzL8F8opSDVD2h3sip2FBJLCCmySwtymDTdEZRX9pnT+FLX+g
 /rTbJUJMAYlIleM3VTmU0BCEQiCkdp9zA5veXY6qoTXeTBcLottpvWjtLWcgWSP+AsxF
 0JVtlsJ8g5lmgsNwaKv08Rr3WDsnIvoK39bhAzCq1Xti65TmG912+w1O9bNsHAZNKDyx
 A0vDzbMBToMxWtX2/bI20LgjteeJw2Qv+aH+qF4CzHgPlWSGzrIwBqnhTRhIlcJ1efK+
 hkpg==
X-Gm-Message-State: AOJu0YwOWdPqQXkX5yO7XMSvBE/VIs34AUeM9PT1x+HIBC060bCyDL59
 9zn0nBH1fdNTpcE0B/NrKwZ0FHZ88RChnSpTezaD3w==
X-Received: by 2002:a50:c94d:0:b0:54b:fea4:c57f with SMTP id
 p13-20020a50c94d000000b0054bfea4c57fmr3959506edh.25.1702399339992; Tue, 12
 Dec 2023 08:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20231205100802.2705561-1-sai.pavan.boddu@amd.com>
 <20231205100802.2705561-2-sai.pavan.boddu@amd.com>
In-Reply-To: <20231205100802.2705561-2-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 16:42:08 +0000
Message-ID: <CAFEAcA_gyAEs5PmTy6Edfep5HrwG6Prgij18MT1PeysV++=3Tw@mail.gmail.com>
Subject: Re: [PATCH 1/1] xlnx-versal-ospi: disable reentrancy detection for
 iomem_dac
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Francisco Iglesias <frasse.iglesias@gmail.com>,
 saipavanboddu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: mKbKC65bTv1t

On Tue, 5 Dec 2023 at 10:08, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> The OSPI DMA reads flash data through the OSPI linear address space (the
> iomem_dac region), because of this the reentrancy guard introduced in
> commit a2e1753b ("memory: prevent dma-reentracy issues") is disabled for
> the memory region.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
>  hw/ssi/xlnx-versal-ospi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
> index 1a61679c2f..5123e7dde7 100644
> --- a/hw/ssi/xlnx-versal-ospi.c
> +++ b/hw/ssi/xlnx-versal-ospi.c
> @@ -1772,6 +1772,7 @@ static void xlnx_versal_ospi_init(Object *obj)
>      memory_region_init_io(&s->iomem_dac, obj, &ospi_dac_ops, s,
>                            TYPE_XILINX_VERSAL_OSPI "-dac", 0x20000000);
>      sysbus_init_mmio(sbd, &s->iomem_dac);
> +    s->iomem_dac.disable_reentrancy_guard = true;

Where we set this flag we should have a comment explaining why
we need to do it, please.

PS: for a single patch you don't need to use a separate cover letter;
cover letters are only needed for multi-patch series.

thanks
-- PMM
