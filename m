Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2907555lfy;
        Mon, 17 Aug 2020 07:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEpifaW/KZ5NY4OGDLvT+kxUnhAJbwQC5TC/s+aKzJXotxRa10XIhma9qw1p3voTg/9owh
X-Received: by 2002:a25:ef4e:: with SMTP id w14mr19671825ybm.225.1597673100810;
        Mon, 17 Aug 2020 07:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597673100; cv=none;
        d=google.com; s=arc-20160816;
        b=pD5zMShrPM9czp/baXClTXZwb9qz5l2Pz5zUHAyyv1bX0N6lsoligRsfzc2zhhlGJ7
         wd1xKMG9X/W5rvTEuaGcYhn/Fr4FgpGoLGFZgIuUtwhKS1GEfafWfED70pYLE+sFcqZv
         21RDEMrITVkeGcIRdERgtvXvnGzx9xOHNd5sC2Ky1lZeiZukybw/HMLCyle4ToeWxzRK
         zP77/Sgh467WC+hZkVMMT7aHlu0wsBqMXVcVynx9onZOcxhtcanP0H2PBhd/0FLEnkGV
         xYqWTzc5daOcETFl2bigNrJwWb2rnti+W4GGgalFlxGSlrTr7ANAU8DLf4t3YjIOZn5Y
         +3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=N+rLV/pWq3xQfAoGrL1v7pEpSGtwzgoBoIc3nou5BHY=;
        b=MS/zECL4MlBkQXBA7K+HhXsXMwx4ul3SuLHYpuYqj/9GUWGI5zUj97NRtL2Zzr0GDc
         NR825kLTbPkCW/eUkWXleAhwilVXF3a0+pWa7tzXU4Yde8eVTvgmz/YdGt0ay+1NNXxr
         MYDtPlYVTavnTwDoeIvf+riCr57Lj60Ux3+XmxsUMWJxBduRcyLBeRbyBhljd07D76a3
         fICTcRXyPnQ0RZ7yeOcH1/XNPfx4Nv7foHzBm1Tse5Zjx9iDb/Pi+ulQb6PejkTA2Bc7
         XufmGnSC3je9i2JE2hglQt1twh9WRzsk2MyalIRVTRjdkTe91mymyl1nJL0PhhfUaexI
         EyJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A7t0BmXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si21403381ybt.235.2020.08.17.07.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 07:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A7t0BmXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7fky-0000C6-5N
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 10:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fkp-000091-US; Mon, 17 Aug 2020 10:04:51 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:40705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fko-0001o7-Ki; Mon, 17 Aug 2020 10:04:51 -0400
Received: by mail-lf1-x141.google.com with SMTP id m15so8424262lfp.7;
 Mon, 17 Aug 2020 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=N+rLV/pWq3xQfAoGrL1v7pEpSGtwzgoBoIc3nou5BHY=;
 b=A7t0BmXnX8T9MseHJmWpvczP/H3qP19J/giAhcg3xWzXblelPftzEoh7nwJLPM7oi1
 ezkuzT6QD6/lBSP3Hnv4z6L0CoiomkHX3PjT1XJsQb6+pLU6OwT0FqTy0+SC9EN8AREB
 xO3vGQELKI/PUkNn+QEPnWtRQ0eDR6u8f3wEs/h0TVbKFlMPoIc+1ULJqANVxqNSdOQj
 D2zEBXQtgK+DXZTuXLg0K2NpC/IYj7RuMmnu31yn4Z+GKh/APtG/3cBSZPTegVpEFGu0
 ysf5Yf8p4Z/qYaVBNnFYcLF+Au+38RdcBeQVlTewE1t4CqAgewSM1MCxywMdpPOnZI2m
 TS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=N+rLV/pWq3xQfAoGrL1v7pEpSGtwzgoBoIc3nou5BHY=;
 b=RTL9hah1thHQXNUYaGKFfvUZY4PWCBTMCxo8Cgh6PAKW8JsxJmDcu7v/sAtr3/ab4H
 yMFolCfYFeeg6ZJZfUG5PuIC3Lol1WueDAr6/uUuhq4sO3T5X8YEs3mOIPx8XIQLDmxw
 HgAUiWvNARvrVwEFDzZz1zxfdOHwfWiIgFQ9hq8LB/mlpl5spZIms9PO3QFbVTl/SCz6
 UR7Vye6MzIBpd8PQ2OomuvYtXaMkc+RERTWFDlXatMHmmVQLTWdrHpHNtqf7Limil4M3
 iYfzlwQgXrTWBZOUOasToDpfAjF/dM4HIQe77BZ1uMSnzVW7dYI+wXr/cBPDKDhfZGy6
 tLVg==
X-Gm-Message-State: AOAM530+MbzctdkFWjP/g727AWUx3+SGBdAkcnMmE7ysHRw9TDcxa1B9
 6kOF6efkdrYtuDmrDP4Qp5s=
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr7452029lfa.103.1597673088134; 
 Mon, 17 Aug 2020 07:04:48 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h7sm5055641ljc.75.2020.08.17.07.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:04:47 -0700 (PDT)
Date: Mon, 17 Aug 2020 16:04:46 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/net/xilinx_axienet: Remove unused code
Message-ID: <20200817140446.GC2954729@toto>
References: <20200814133007.16850-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200814133007.16850-1-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OW+TpJKovnxm

On Fri, Aug 14, 2020 at 03:30:07PM +0200, Philippe Mathieu-Daudé wrote:
> Most of the MDIOBus fields are unused.  The ADVERTISE_10HALF
> definition is unused.  Remove unused code.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/net/xilinx_axienet.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 1e48eb70c9..2e89f236b4 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -54,7 +54,6 @@
>       TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
>  
>  /* Advertisement control register. */
> -#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  */
>  #define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  */
>  #define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex */
>  #define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex */
> @@ -169,28 +168,6 @@ tdk_init(struct PHY *phy)
>  }
>  
>  struct MDIOBus {
> -    /* bus.  */
> -    int mdc;
> -    int mdio;
> -
> -    /* decoder.  */
> -    enum {
> -        PREAMBLE,
> -        SOF,
> -        OPC,
> -        ADDR,
> -        REQ,
> -        TURNAROUND,
> -        DATA
> -    } state;
> -    unsigned int drive;
> -
> -    unsigned int cnt;
> -    unsigned int addr;
> -    unsigned int opc;
> -    unsigned int req;
> -    unsigned int data;
> -
>      struct PHY *devs[32];
>  };
>  
> -- 
> 2.21.3
> 
