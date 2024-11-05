Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2679811njc;
        Tue, 5 Nov 2024 00:47:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWX6voZZxa7c/QHMdHpsMPPvvYdUJoS94lIkAToLZi3pmD48qCJC8n7g0U+gRoc22Jg9PlADwBt33bMVg==@linaro.org
X-Google-Smtp-Source: AGHT+IFDzouH2a53pwFBU81PJw1+pIW1vQovU+0jXOVkXEXSzkuoc3B8sAP2GTGFpHLRRpBel84r
X-Received: by 2002:a05:6122:1806:b0:4f6:b094:80aa with SMTP id 71dfb90a1353d-5101510d77dmr33850491e0c.9.1730796465289;
        Tue, 05 Nov 2024 00:47:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730796465; cv=none;
        d=google.com; s=arc-20240605;
        b=dCqwx8Q7QDLkvKdN78TMSDCl/SwCOFW9zhwDtUmeEegZ95jRndFq00ZNxtfijJtkA+
         ypcXnPPJFAR1GHHeGGXsenKPHGv7sCtiMXqj97ymTaUAjNUg4STRZWiwiqzcIa/vOii6
         +mJVgScIsqvPlgcE2/ghXcJmpFncZHAOuS2yDbDIW0SHcUMU0GpWSvnXPb9A6KlB2yOK
         nfMeqkGbpAtJb8j0wci9ybFtYzEkNRutyHJtyYw/0BJA+R/y+r9v2hqudfCujSdjUCm4
         fLIy+uW8QnAIg/SUKYWRxGnNxw5T1CKcTiU55kTfGOvhF5vr0FFH7eGri+G279Q9b7oB
         mQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9lx/PXV0Dppq7a1WCdCLmWcW2OTPkQgfNhcvY0PfGPk=;
        fh=8EUhv5ffL3VMFeWJ9lbDJwlmTBJtrgSuJy2RRoHo0NU=;
        b=C+1GS4JoCYDWmCcWFPs9Tv0nBCOHjiHyYZUMDKq6qagyMsQ1Wvk5BX9eR26SN1k43/
         iaE4NU0nGbEEfEG1AG+2td1Sla/a39hLLGhRHm7Dgn8/19lg0QcCvgO5KzZt61eCTDwF
         D7KveVwmn6Hvxl/x5VXMWPP0LnuVz2DzC4WYwid8i37ynmICISLNKwIONIoVQ8imzdyI
         2Jvt2mqkVZb8V02U/IAATZrWNbIE+0BzwilOunDuc2E4QBeg2ESRly7gQtKwfmkrmfdz
         Tzt6+kTvAUW4eymn6YByiLSM6/aDCWg2Ows8afTuTEMXF/hAHZXPEIlZLFsreofKcMND
         14xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=LaAVf008;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3541ad53fsi129638626d6.515.2024.11.05.00.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 00:47:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=LaAVf008;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8FDw-0004CC-OD; Tue, 05 Nov 2024 03:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t8FDo-00049j-8s
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 03:47:32 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t8FDl-0000F0-RW
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 03:47:32 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-7f3f184985bso160140a12.1
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 00:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1730796448; x=1731401248;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9lx/PXV0Dppq7a1WCdCLmWcW2OTPkQgfNhcvY0PfGPk=;
 b=LaAVf008mXNiI/sjLRmpSkA2L4SoToHwRG9gQOxUj3S434h5JiU9O4yqvncRZ23T9x
 DjDFDlpLbZ2aIH2LTqmSAJUA31thsK6XZdItYSMUXW1lURjEV40WwZqLYIqUbuZ/SEPz
 a2rmAzOLECHEKFVyfXMNLtYaa08h7W5Xe+bftZxLJ5znD+eXGoOfmPYsVkiDkQI20bG9
 DyFFIGEH8Qm9u6swfWC/wfAUCM1iIlBhNPhdtY6uFcHaMViKaudtUEG0V8FcYK4v64us
 CLAyt/+8LOZtkEQgL+QK5ngLB9O3iO0qZTroobVrl9lexJELsWWt6LmOVYOvK1WygMho
 1dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730796448; x=1731401248;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9lx/PXV0Dppq7a1WCdCLmWcW2OTPkQgfNhcvY0PfGPk=;
 b=tQRhKEBPv62iAj3QajdQdU0Dr9nfyRiSVJh1yiJUeBSokqHYmtXMqdiJZPtQaBohQm
 FI8xD6tPnef5PVRXdjpySPVW3aZiWetLxg2lGkAOrrCTtQqG3h7kCB4OopIIzgCREboz
 O3cOl2PImUHVgoMhzdajS3pJ4W1TMiO3cg48wb4DxR5ZiJ2LvmUw8ILkm5re+TPxlIe4
 Dy3mctjaeH0tkuWnkpG3NFms+ie8Ezz9Zyk8o+rdbiQplCGj4b7s4SVtZdT4Mb8s7lGU
 xVIrv0ZXZ0Z5Q2NdjOSY49qPjbYAfTmHseTSSkBE5qfa9esQKYR+kIsvM9eKUpiLjt55
 2MkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFdzSfPsT5nRwBnwbsYr+bKyTse76LuHkSizy0zXJBlxPj4NrvT01zQiOH2l39XBHYLW6qw3YaZw==@nongnu.org
X-Gm-Message-State: AOJu0YwsSv+MLPj1ocgCEb04IaMkJFRrUz9xQOfJ7kirFh+L2a4k8kKn
 47cCUFtD8Q+shgQ2RaherNyCyrI+Wts4W49SNCP24kKkQ57jAPK+Ou0RZV8y2Pk=
X-Received: by 2002:a05:6a20:8c22:b0:1d9:c6a6:61d8 with SMTP id
 adf61e73a8af0-1d9c6a661dbmr31288175637.7.1730796448132; 
 Tue, 05 Nov 2024 00:47:28 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e93daac772sm9128653a91.21.2024.11.05.00.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 00:47:27 -0800 (PST)
Message-ID: <c611b7b9-98a4-4648-97d8-a08d4f5f27e8@daynix.com>
Date: Tue, 5 Nov 2024 17:47:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/15] hw/vmapple/virtio-blk: Add support for apple
 virtio-blk
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20241103150037.48194-1-phil@philjordan.eu>
 <20241103150037.48194-14-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241103150037.48194-14-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8aWFBizCCiQ5

On 2024/11/04 0:00, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Apple has its own virtio-blk PCI device ID where it deviates from the
> official virtio-pci spec slightly: It puts a new "apple type"
> field at a static offset in config space and introduces a new barrier
> command.
> 
> This patch first creates a mechanism for virtio-blk downstream classes to
> handle unknown commands. It then creates such a downstream class and a new
> vmapple-virtio-blk-pci class which support the additional apple type config
> identifier as well as the barrier command.
> 
> It then exposes 2 subclasses from that that we can use to expose root and
> aux virtio-blk devices: "vmapple-virtio-root" and "vmapple-virtio-aux".
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
