Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1099076ejb;
        Thu, 16 Feb 2023 19:21:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9nl06INyBxqnWF8i3vmhV1tPF13SPdUk0r0oIS5w+y8tI+jwLIWxl2j5eMaLYD8t2Irthj
X-Received: by 2002:a05:622a:41:b0:3ba:2c69:2bec with SMTP id y1-20020a05622a004100b003ba2c692becmr12478291qtw.53.1676604097826;
        Thu, 16 Feb 2023 19:21:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676604097; cv=none;
        d=google.com; s=arc-20160816;
        b=RADohnVP0AHYNy57xR46rm84jpFEiqiaVYWM5/FM4RuL21kG4lN3p1sPwjeSvOnDZX
         xutRY6YkFbnntFRfDm88WK2mvEuQtPw4m7Tsg/diMBF0tiDna4DodZfGjsWwQFsqRJ8a
         qMltYsQ80eEuG0InxLo2MOHjrkFkHa+tlawD9+Wu9i2X0/AgjEt7deOVpYfWHGti2KS9
         pZ6zQaxl3c/Ai82gpSXTUra2QGnLlbjXOYsRU206xklhO2u+bGjD7JtfcThLOSSg9Pij
         EgA/LKLOOTCTqUShwi1SOY9kWPHxrPEYSBEQM4ewH2IfUaMccNXLtqU/Y0rPE018jzCR
         IyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WfJG9S7n0TN875rrUng9CuCRxbI1KmTFZy8NPQKWgr8=;
        b=hIaVeu49q/+jM6uZ6PITofk9kjQE8QCQ/Xw7cyuLq6CE9AeT3rZBS/XH0U3TcBv8Nu
         MalROj0krrCnQWm6jjn3+OQoEn1GX19UkwW9HQANLTHhW+K/gabOtxkqVLUXoyyaYlnT
         1uzCX9VcCi2ietDgQdWu+bcBNLacNhwvb+VGNh8d3V7XxIOlcLCUHEo0tyP6vQq0Kctt
         kRQ9Ew/2/R8u8AhGHpdmw0Wipgkf1OhSe83BuCQjZf/SXDO0+I8iNMpArmhFUowbXFxN
         Ag4MmRw+cLblsH1XjorWXfZCbI6vz5VIILXiZZrUOoQk08wN7D/7rxBd8rjhQ9WdaAAS
         DtYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@celestica.com header.s=google-201810 header.b=TQ+n29EB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=celestica.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05622a050b00b003b8328e179asi2705936qtx.561.2023.02.16.19.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 19:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@celestica.com header.s=google-201810 header.b=TQ+n29EB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=celestica.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrJ0-0007Ap-Lx; Thu, 16 Feb 2023 22:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSrIy-000791-D2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:21:00 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSrIw-0006J3-Kg
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:21:00 -0500
Received: by mail-pg1-x534.google.com with SMTP id v3so2492462pgh.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 19:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=celestica.com; s=google-201810; t=1676604057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WfJG9S7n0TN875rrUng9CuCRxbI1KmTFZy8NPQKWgr8=;
 b=TQ+n29EBIQDg4fgNenccsf12pglyq39sonM/cO0/SZ4cgI2SZPEy1OKdwTeuwDEqX2
 WfS+nG+GsWp9GGqe+HLmwi5KY6ctAotJiT9TepK+nGm9TNUK8itFTItndXtHK6pH0d0D
 nSfU2F0Pkaxk0zgOEEisdHYx+VEVW/OHKSdSQyYpUPD6aqwv2PSBCc8ClSNuGCHWqBwK
 C86p07wDkB5oju5d76LthJMB/NN9Mn3hEtHEm8Uyqifcmylry1pK560tqCUyZqHsYrJm
 s3gQcU0V3CiPVGhbMbYs22EYXX813Nviq0P38xK8nPiXh8z/E9UxGXBiw+emAsLaerH6
 y5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676604057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WfJG9S7n0TN875rrUng9CuCRxbI1KmTFZy8NPQKWgr8=;
 b=rvZtH2ihURnuOL6jAXVhmxh6pHUiv+CmWRN5BLNivUj+a1aFj+kV3Q6HzgMIZkVFF7
 SM80WG2fpxGPy9gmLvf/SyLig+4DZD6OIl2ERcIL/CTmoaDMfo8PK0h0mbxXptBxF3Yk
 V+RM1VTphOiRoQiEE5qomnbUA29eK0SFlT0J6fPQQ03LHAwC43GKqjGRTH8FfhDsn4+A
 SZNCAjjJBpuywCB8WI+qxjkRQxe7goVy/BQ77ntuStZcIhzJyDW/F1TeHQYgAp4YFIU1
 xUq20h0FzNtI1B2RS+vFixZU5JaQbJ0xe4qB5MVgZ775yUrLNNOtrQxybRf6qQFGHOFM
 rQGQ==
X-Gm-Message-State: AO0yUKW4AigUsGaogD0TXmacUtAcXYioZBCW5KFC/SMB/FlNFWQ1ecBY
 Gq4Ys5i6U0OtQ6P7jvB+XWG7A1ZqOTjW2dl+f92nz7fjR3hfxq1DmXgUv8XTvVyZuvDfUah3G/L
 mRk2XpTlNg2uCJ9c68/X9aYAJd2xGpVxrOeMC2LkA/RK83Rgmqhs43CE5guYmlyxA5x8+Iib3sZ
 pZn06UVBOQv7V+bZptkQGkgSPR8mirpQ8SPg==
X-Received: by 2002:aa7:989a:0:b0:5a8:4c7e:bafd with SMTP id
 r26-20020aa7989a000000b005a84c7ebafdmr1262762pfl.32.1676604056607; Thu, 16
 Feb 2023 19:20:56 -0800 (PST)
MIME-Version: 1.0
References: <167660357595.26523.10278976309538219635-0@git.sr.ht>
 <167660357595.26523.10278976309538219635-1@git.sr.ht>
In-Reply-To: <167660357595.26523.10278976309538219635-1@git.sr.ht>
From: Sittisak Sinprem <ssinprem@celestica.com>
Date: Fri, 17 Feb 2023 10:20:30 +0700
Message-ID: <CAE+aGtV6Ytk-eLS6oZsxZqQ2QHwu8GD4DMVHE3HFVUyqKjsR1A@mail.gmail.com>
Subject: Re: [PATCH qemu v2 2/2] aspeed/fuji : correct the eeprom size
To: "~ssinprem" <ssinprem@celestica.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org, 
 ssumet@celestica.com, srikanth@celestica.com, kgengan@celestica.com, 
 clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Content-Type: text/plain; charset="UTF-8"
X-CLS-Gapps: True
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: celesticainc,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=ssinprem@celestica.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u662B8sXZhiH

the rebase auto merge failure, I will resend patches again.



On Fri, Feb 17, 2023 at 10:13 AM ~ssinprem <ssinprem@git.sr.ht> wrote:
>
> From: Sittisak Sinprem <ssinprem@celestica.com>
>
> Device 24C64 the size is 64 kilobits = 8kilobyte
> Device 24C02 the size is 2 kilobits = 256byte
>
> Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
> ---
>  hw/arm/aspeed.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 27dda58338..40f6076b44 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -840,42 +840,46 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
>
> -    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
> -    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
> +    /*
> +    * EEPROM 24c64 size is 64Kbits or 8 Kbytes
> +    *        24c02 size is 2Kbits or 256 bytes
> +    */
> +    at24c_eeprom_init(i2c[19], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[20], 0x50, 256);
> +    at24c_eeprom_init(i2c[22], 0x52, 256);
>
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
>      i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
>
> -    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x51, 8 * KiB);
>      i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
>
>      i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> -    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);
>      i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
>
>      i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
>
> -    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[65], 0x53, 8 * KiB);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> -    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[68], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[69], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[70], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[71], 0x52, 8 * KiB);
>
> -    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[73], 0x53, 8 * KiB);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> -    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[76], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[77], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[78], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[79], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[28], 0x50, 256);
>
>      for (int i = 0; i < 8; i++) {
>          at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
> --
> 2.34.6
