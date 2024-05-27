Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3080062ejb;
        Mon, 27 May 2024 03:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXn+bqVqBAo+KKEPZXjfsq2BN1jwb2jxC334sEvPp9HOxRxJXq7KteFjgFA5iviWgPMBVbGmsEzZbihN/puGpWlrT5IjgC+
X-Google-Smtp-Source: AGHT+IHh2Si6Giql4YRWtk5fEBM35GxCVcWRvxIwQn9LuGNKi9c/pQW4NsKm0dSVJFcjynmO2X4h
X-Received: by 2002:a0c:f209:0:b0:6ab:9228:634 with SMTP id 6a1803df08f44-6abcd13bab6mr96498496d6.60.1716805496623;
        Mon, 27 May 2024 03:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716805496; cv=none;
        d=google.com; s=arc-20160816;
        b=cUVfAhhH7lkTK1I4baFk2vx1v7Mh6tpig9yTKhdP+EKfEHxi8ucf/rVMOigg33g2UZ
         BBZYIdu3zIWFtDNE4uZsRXX88iEbR3rWKe4j5xvv8qopwCJL4kksj3vb2hHCfN/durLM
         PuLw0d+FF5/AMdLAeajmGYr98FDWPh7xXtO66CjSTKklZB4V9Q2XYaB80sL3WaCO6EEm
         qSzcdJAy5mQjLkTzo1LMIv9q8vd2rAidIoA5hDdu2HBoVNXgIzKYaiTB2gzQW9V8adlS
         whmdwvwOtBayG46aPNYNeC2CzWSySs2rA2RXGCkpRa1q2zCXhqYQYH+tlxX62KGqIC5V
         ipKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d9MKMenTCE2J2BnrIZin+JMaHJt8YZSj8qiit9MGsw0=;
        fh=wvgX7Nm6b0CBHahGfMya4IiBlm1Zv+3us1AkSu7QV1M=;
        b=YvGlYrLy0nRzNalRQXZahICTQkPsH2aNx7n33wMFmJjoDjSFYJQv3tu4y+kTuWPg6n
         j9qQ3I5WcQP1BNhA/Q0mhRwB7I6H070hhCsQI8yiam0I9gTUtKVV740FurXlFSk+VBED
         mr54Y41s4Pxn1G8YKS7PAFZHQ1GF9TUuHYE/EBaYrRzsBTwBLcRspnMpZ119c+Y0+S41
         vYSQMJUYqt2YMBas0q/aWm4c3Lu3eCK7yNbz3tjRvkWF8jNqBh9n2V8pV/RQxe+RzOwJ
         p4vDlewsA58VwgH0/ukHBUGaPBFiPoNtInnWeqZ4f+p7fvrJx+an1HJvKZkgxaDP25lG
         Qkig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3vMHKJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b49b3si76174776d6.491.2024.05.27.03.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 03:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3vMHKJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBXXA-0007GO-2l; Mon, 27 May 2024 06:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBXX8-0007DU-8p
 for qemu-arm@nongnu.org; Mon, 27 May 2024 06:24:50 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBXX0-00055v-VQ
 for qemu-arm@nongnu.org; Mon, 27 May 2024 06:24:48 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5295f201979so3251062e87.2
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716805480; x=1717410280; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9MKMenTCE2J2BnrIZin+JMaHJt8YZSj8qiit9MGsw0=;
 b=M3vMHKJ7WfNIf2r0DBs4LazqjVKhTHXXQ9+49sKH6iENPNNzt9bqFW9CPm01wRDVqx
 uMW/CIIWYzyHwjF1FS2p3suZM/vi0TOaZ9omlr2mGQwfBG13ffjAAPqGYE9j4D49501W
 CWxmptG3vAo8ZIBFFjcG5ESORxKLN03/5VilQ7xVr0CGu9EDSFBdOx5sPo63zfCRX6pl
 MHhutKBFPjKvfgMP0XRipLNpONQr0BDe9vAypdsF3glRZuVtAPlFpqhpnNOrJhAdcB1w
 EU/tI8o2CCZNMGhTxF3Q5QMZQQq7qKKUEHDvzPxd6GkTM1Q5tvR5gKZpKijh9n81etXv
 6xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716805480; x=1717410280;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9MKMenTCE2J2BnrIZin+JMaHJt8YZSj8qiit9MGsw0=;
 b=FCV9uzAbZvtNXlAnZSYKB3NCm5CwD6QIg+N1+lCAEm0XnoBdUWWtclFsk4F7IdEwC5
 cKtHg5p5j5TD9/44tvREb9PqKipa5/lrTk9LB5wagpD2ijdkMOnjLzGgx2E1HDImIEmj
 pLVWJIq6vg5Fg/ZfPCdgtND7qx5ky9XX0V1gmWopx3fxoBPib+8MDVy3H5PIeiqutVhG
 Ev+wM3d3OY0ShdbcJ7P2P1n9OWPPhpJ7fBjTicgGCt/R/JQHQ8Nk5BIQcFVODMqQwTi/
 YJ529xl6KUfjeFx1lCW4Idjez90RkoRYe/BGpm7C5teBR3U/yd3TkPZaQ0s6vZksoChM
 9ykw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEcxHqRnAPu84hfUuaFM6Za780Ga1JZaACZh45tppJUqIOOmdqa1n7/jMR/b/HWCVsVtgV73wDdfjFSsdoYS2l7osV
X-Gm-Message-State: AOJu0YxZj8/CQn2faZBPVvNAGyKf8X7XLYFZ/SnQwgnHSmMzmeJCNedZ
 dHjWjPqZpDL8JoMxJr0UtGxc3+axVjvrkVqeK8yUw7g+DrHBqMyR940JPcbOG/8=
X-Received: by 2002:ac2:495c:0:b0:51b:afe0:3f4c with SMTP id
 2adb3069b0e04-529666d832bmr5543647e87.48.1716805480230; 
 Mon, 27 May 2024 03:24:40 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a9b9sm503475e87.85.2024.05.27.03.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 03:24:39 -0700 (PDT)
Message-ID: <9476cfcc-5a7c-4b76-a684-1361463bd161@linaro.org>
Date: Mon, 27 May 2024 12:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] aspeed/sdmc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-6-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240527080231.1576609-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: VzwCvZBUidBh

Hi Jamin,

On 27/5/24 10:02, Jamin Lin wrote:
> The SDRAM memory controller(DRAMC) controls the access to external
> DDR4 and DDR5 SDRAM and power up to DDR4 and DDR5 PHY.
> 
> The DRAM memory controller of AST2700 is not backward compatible
> to previous chips such AST2600, AST2500 and AST2400.
> 
> Max memory is now 8GiB on the AST2700. Introduce new
> aspeed_2700_sdmc and class with read/write operation and
> reset handlers.
> 
> Define DRAMC necessary protected registers and
> unprotected registers for AST2700 and increase
> the register set to 0x1000.
> 
> Add unlocked property to change controller protected status.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/misc/aspeed_sdmc.c         | 190 +++++++++++++++++++++++++++++++++-
>   include/hw/misc/aspeed_sdmc.h |   5 +-
>   2 files changed, 193 insertions(+), 2 deletions(-)


> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
> index ec2d59a14f..61c979583a 100644
> --- a/include/hw/misc/aspeed_sdmc.h
> +++ b/include/hw/misc/aspeed_sdmc.h
> @@ -17,6 +17,7 @@ OBJECT_DECLARE_TYPE(AspeedSDMCState, AspeedSDMCClass, ASPEED_SDMC)
>   #define TYPE_ASPEED_2400_SDMC TYPE_ASPEED_SDMC "-ast2400"
>   #define TYPE_ASPEED_2500_SDMC TYPE_ASPEED_SDMC "-ast2500"
>   #define TYPE_ASPEED_2600_SDMC TYPE_ASPEED_SDMC "-ast2600"
> +#define TYPE_ASPEED_2700_SDMC TYPE_ASPEED_SDMC "-ast2700"
>   
>   /*
>    * SDMC has 174 documented registers. In addition the u-boot device tree
> @@ -29,7 +30,7 @@ OBJECT_DECLARE_TYPE(AspeedSDMCState, AspeedSDMCClass, ASPEED_SDMC)
>    * time, and the other is in the DDR-PHY IP which is used during DDR-PHY
>    * training.
>    */
> -#define ASPEED_SDMC_NR_REGS (0x500 >> 2)
> +#define ASPEED_SDMC_NR_REGS (0x1000 >> 2)

This change breaks the migration stream.

>   struct AspeedSDMCState {
>       /*< private >*/
> @@ -41,6 +42,7 @@ struct AspeedSDMCState {
>       uint32_t regs[ASPEED_SDMC_NR_REGS];
>       uint64_t ram_size;
>       uint64_t max_ram_size;
> +    bool unlocked;
>   };

