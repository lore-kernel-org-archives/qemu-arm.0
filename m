Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4432764lfc;
        Tue, 1 Sep 2020 02:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykAeJxPuCBgGzFvxtXMKHQem/gNz7TQQMPUMuOnx0HOvRCPqeEj6zNS4F6GqMKBvkAu/d/
X-Received: by 2002:a25:7809:: with SMTP id t9mr1504127ybc.359.1598954133427;
        Tue, 01 Sep 2020 02:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598954133; cv=none;
        d=google.com; s=arc-20160816;
        b=yYhQS328T9ut6C01WGZAUfLlGWScKuuuAcdXeR1XAfNEkLLtLTTnpnVt0iVeQwzNon
         8of0ZPyLXUN7H7dodJec+OAZgG22Nvag0x1K4E18akrDxCEvPkbR8pfGAOUkI+5lAM6u
         PGD+fsD47UG3d6eV6U9K5aOzYYaIFIJE1V2Q0IGPT80Rjh1hA/nvVa7Im8/i9bCK0prS
         +0ZvoZ9llkIkNi2TB5/nto0LozNU5K6J6x9YVg1kLiOursXAOM6B0QYKoEylInWsB1c1
         OXTkKD2CLGWBgTz2YUWmf6M9Cahy1bobm88EFCOdeAWEGHC7Vg8EspWm3oOXlDl74dR1
         9x7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ak1MELy64MVFTjZtGG5oZHevqS7oZZr0pksQQpBgw3Y=;
        b=X250VKYxsChZZ0Fne1UV9H3trSjwa6StFY+QRY0t9umyonwXDwccjgg/OT+rRJ1F+k
         zz0flYcYoDFtIn6rib0xGemBK1Xr1V0WZE1X8EJLWVJzt8AFciUYPUieLRXcEP5GOn9D
         eetIEZYSUSKFG+1FDT/GD2eTMl7pg4IToFWOaGc4rGWHS6C+rL2D6SxQSUkGh3wRj6MX
         lrR3TvKZ2Mk0meMLK6i5qkYGbYtySzHhk/QpZeCsO7xsL9UmDD9jhWcGwFtM+sDot/ze
         6kXWeODw69LGs6CzwC1hSXLfalUhsXvI8u3RNZpSiQkyVDr9JpERqqBVGhtWdsoSZbQ8
         W68Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eFzfNtaT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d192si554690ybf.426.2020.09.01.02.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 02:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eFzfNtaT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD30m-0005MF-Pl
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 05:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2qi-0003YV-9h; Tue, 01 Sep 2020 05:45:08 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2qg-0002KC-IQ; Tue, 01 Sep 2020 05:45:08 -0400
Received: by mail-wr1-x441.google.com with SMTP id c15so740663wrs.11;
 Tue, 01 Sep 2020 02:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ak1MELy64MVFTjZtGG5oZHevqS7oZZr0pksQQpBgw3Y=;
 b=eFzfNtaTeZDUe7avJJpEJRi8X2aKN70Pw1Cztdqdq5xa+4DkmgJTb1XZbA33irPMsd
 n6kTcjpnlU7Dj9SrjwSUiyhwMkiZO9BoPXSH0L1VBqwWnxD3PSCWMQrV+9IxrTdx3/i4
 UqX87eWW8cu2SUqJDNTSIi7mMrZBi63BRZOrXoSbRC89mYbrDnU+sFYlGNDonNGIqaOD
 bZSllu/jbJrSFu55+EKEU0s3UO/sW7SPCxpCQZNKeDTOelXGMSOtd0HJtByY8uDnpF1Y
 4k3NwSKY68DmsHePT/9xB7Qi1awbd4jvF6iuSgNsYNM1g+eDMtkaoCuQAzHbSuLhaXyG
 9lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ak1MELy64MVFTjZtGG5oZHevqS7oZZr0pksQQpBgw3Y=;
 b=AmJ4nkXkUaoerYPesQePn8BQV2X/kaIUtEALweORljolbyL0vwE2PDia5fDHbpMFih
 1a68LY8ZZ5wPQIrU+04ymo8s2mMpgyfxDqyk6ndnnBpNF/ayaTQuBR05HNjF8UnpsTTo
 vWZxJBcYwggpX5LYEQdc6DFSxZSrvVKGU2RuVcxBGpo7X3G0KHOyNiSbmUQR13oQkPVB
 t4ytAIcIAzJVnj47MZ8pHP7KLQEWm/Erb+Q9cmvuB3EhIpDTyYqzVS/NgumEsi/gDMYc
 jOu+aF7pcMZnEhfTwldXC1kcUFwGDBzBObaVQfcOCY7O4YwSo7zgBbp2yQd7efsBPQ0o
 ty5w==
X-Gm-Message-State: AOAM532l6bKWfo9tlXdc0XwSx67cmZK6h5+F7voCLcC+9NAu2k/PVagX
 T7TRnTDUMjmdRJDVSvtaa2Y=
X-Received: by 2002:a5d:5704:: with SMTP id a4mr939876wrv.318.1598953504454;
 Tue, 01 Sep 2020 02:45:04 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id l8sm1443299wrx.22.2020.09.01.02.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 02:45:03 -0700 (PDT)
Subject: Re: [PATCH v3 12/16] hw/arm: xlnx: Set all boards' GEM 'phy-addr'
 property value to 23
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
 <1598924352-89526-13-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7df18804-3a54-321b-8aa5-4e07a93a1318@amsat.org>
Date: Tue, 1 Sep 2020 11:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598924352-89526-13-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxJRYwQ9hiHz

On 9/1/20 3:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> When cadence_gem model was created for Xilinx boards, the PHY address
> was hard-coded to 23 in the GEM model. Now that we have introduced a
> property we can use that to tell GEM model what our PHY address is.
> Change all boards' GEM 'phy-addr' property value to 23, and set the
> PHY address default value to 0 in the GEM model.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - use the correct (Object *) to set the 'phy-addr' in xlnx-zynqmp.c
> 
>  hw/arm/xilinx_zynq.c | 1 +
>  hw/arm/xlnx-versal.c | 1 +
>  hw/arm/xlnx-zynqmp.c | 2 ++
>  hw/net/cadence_gem.c | 6 +++---
>  4 files changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
