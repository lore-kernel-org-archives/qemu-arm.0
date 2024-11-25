Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1334177njc;
        Mon, 25 Nov 2024 06:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxVN/ZvEQLqJNYfVj4dckKnHLYClQoeGDx6deiKXRw46m1WQkPk2H1+EuQEQSy3nfMHar+p7RoFvA9Pg==@linaro.org
X-Google-Smtp-Source: AGHT+IFJHQ9UHSnfQPvGCWYXCejlqc7K6N/OmONJql/fpNQmiyvGDnvDKkVy1Elm7LDfqSX1mrCy
X-Received: by 2002:ad4:5ba9:0:b0:6d4:20fa:83f0 with SMTP id 6a1803df08f44-6d451358550mr179494446d6.41.1732545295851;
        Mon, 25 Nov 2024 06:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732545295; cv=none;
        d=google.com; s=arc-20240605;
        b=CY01NAdSpu90drS57eAfeVpDx0JXPlFFVZvy//TPLoMqdcaGtzymUAEyW8K5h67jtV
         +R4KGOitQKKSH21zGIy/JljoyY5ce501ToAc6PyI/44TsZsb164Zs0ySournO9tXbqn3
         faU5CqwQmqHak6pMdTyzDVQlI53QoXof3XEgAPGmTu3zqBGlKaBD+Ypjpop8bGJKsXmo
         vJMaRWvAx+7WRPdT1xuJOSCkVYYae6L5D8WiREKSGQ3hjqLJaIonqzFyla0h4yhcbts8
         MnTyFZzvFBXEAXs8k51MCSLnp0UPPctQZjZrPe2CJ275yIMPlKspOr85PbiJ6Bs7zfa9
         V/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=L13NRCkyqi0c2bLphchlHQO/5yzR5oeo9xAOVXdqqPk=;
        fh=W9OqHBK7aHX62sP91izq74ILzaB4FFPmoXNP304vEmM=;
        b=JuDrUfYnUsgTHFEdahFT4B/mKbCZnp8NinUtDu6W2emkXTfoBFNSyvNX+2Lpl79oFK
         b4uEVniD6RBVt6eglic3NaVg+Swcm3r0sGCh5W0UBRhIYS+KyQ1u5rrkRY/DQ+a2t153
         d85X5nC50R6gUnuIBxJPRJ8irPA8PAjWtpV/ZkUwABdrGmVseNZ4XpnMNwPO9OWzkNYk
         Hfql9JE2GQhYB239iOa3yftrRC5dlq5Rbc21LwN5UOHIwlewdqBVyAvP7sxy3uQedbLk
         LmjdTRQHXBFvavGsAsEiI+Ajg8OoN8H2WknpOviLn8xjW1YQijX8Q8P2hQXOl802ly3R
         1SPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o2YWXFBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451a83893si95222256d6.99.2024.11.25.06.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 06:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o2YWXFBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFaAT-0005l9-72; Mon, 25 Nov 2024 09:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFaAR-0005ks-On
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:34:24 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFaAP-0002XQ-AA
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:34:23 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ffa97d99d6so32919181fa.1
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732545258; x=1733150058; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L13NRCkyqi0c2bLphchlHQO/5yzR5oeo9xAOVXdqqPk=;
 b=o2YWXFBOjm/IBxrBDpLz27I/HSV5n07zPvr/3do3IHoZcGUXHIX/0tHbqfniJ0Byf2
 6MGeWdY2DWjeFU14wUbgjIm9w7YZFuSxKT0/+VOegn2GE9JLuCuiJ5as1Ly/Nl6fDDRX
 z0n1b21GesHIEkiOpgKI2dTrwPzaoAiZpgHu4AXkfsO1jMd6eRzkdmId4J7ZZu2HslHn
 POUhbxlZz862oL8sRnMizUb3/xWMN9qpUcsKuto1KJXd0PJU8KM1fNnHE4KPwzj14ICd
 R8wF/eVKrO09w+ozLWnRnHuqVsHvPhhYyQmSzyRv0l4z8P7dnQqZhea6GoI4+XfK3bb7
 M5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732545258; x=1733150058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L13NRCkyqi0c2bLphchlHQO/5yzR5oeo9xAOVXdqqPk=;
 b=AppIfuVMERVX5JxpmN2K0sPN4OUA39PKz/7FvUaf9G4zCt1at0jafT0hKx8MJNi6G5
 mb1sm/lakIx0AXVIH/0IHw3/XDVAqbuLKV8+5pkfQ3vxm7vernPmme6FAk7Lhw3kMmKx
 wHf9ZAc9HnrTrzz3m5BQtqK+ao+gobuQvJ7hSrW1LKVwz9G9yXnrIwbkiWI01nqM1YEu
 TNvvWqbnslArbZwOy2Pq0XyRtsWWRbhHcG4rmmqo3Fcayyx+BOphmWb0/4Joi9IM0VGF
 mfBiFxW1fQYJK1I0ulD6cBLuERPZHcFSCGsTcRykLJ8UQj9lNDkMbzzpPckqjqoc4uPC
 5yqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxeaBVrQFcZOC+NNSph9MEs6BqiqyT7fDvkh0Wbo19Wvqnr/0hfY0ROF0/Wf4a9tvUXxClghOf3Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz+0uK5Rh1WYabwAXljSEOvcXom02ojK4B7e2/EJITf6m9rK6dZ
 MrkfePlVgc03QMIvKSZYk1sPUUZfiKMAUQBKFeCnW/mhqsFphSZLI6nGKKsSvaRI9npUi0sZzzx
 rx7TYRmzT/34fJukrAWSOiQUdKuqtOS36fxjCwQ==
X-Gm-Gg: ASbGnctzQPcCD2DWQrhiLXVXxu3aharxARZ2zGesexMZKn9FkiB8m4Te1qGlO21v2Mm
 HwVaQZVYuAFQdyl3G9J8TYLbk/h2pqGOa
X-Received: by 2002:a2e:a551:0:b0:2f6:6074:db71 with SMTP id
 38308e7fff4ca-2ffa712ce91mr63772451fa.17.1732545258234; Mon, 25 Nov 2024
 06:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20241125140535.4526-1-philmd@linaro.org>
 <20241125140535.4526-4-philmd@linaro.org>
In-Reply-To: <20241125140535.4526-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Nov 2024 14:34:07 +0000
Message-ID: <CAFEAcA9hW6yBt9w3+2RDBovP1pNreBcvW4N7-6Kq_Gohvtv4eg@mail.gmail.com>
Subject: Re: [PATCH-for-10.0 3/8] hw/pci-host/gpex: Allow machines to set
 PCI_BUS_IO_ADDR0_ALLOWED flag
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Thomas Huth <thuth@redhat.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3SSnvCoeHNto

On Mon, 25 Nov 2024 at 14:06, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Expose the "allow-io-addr0-accesses" property so machines
> using a GPEX host bridge can set this flag on the bus.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/pci-host/gpex.h | 1 +
>  hw/pci-host/gpex.c         | 6 ++++++
>  2 files changed, 7 insertions(+)

Given the way the gpex controller handles its MMIO regions,
I rather suspect that none of its users really need to set
"no address 0 accesses", though of course this is a behaviour
change for some machines so would need testing.

-- PMM
