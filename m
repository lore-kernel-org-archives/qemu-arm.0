Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDD7E92FC4
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ4d-0004ll-08; Mon, 29 Dec 2025 14:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4Q-00043Z-RW
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:23 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4O-0000JS-5K
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:22 -0500
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso3867811cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037099; cv=none;
 d=google.com; s=arc-20240605;
 b=NQPOKOKETpfpaCGT1I8gideJaK2z/tWy8FgC5KiRB6SShCO2B3Hdx6uWHq7Q6cjajD
 hZyUIY7azam6Sw0m58EdxC2FI3Vr3BQV2iN3G1np3sdo7TBCy5a/H9STLVccESMhh3lF
 sm2uZaojrlh8sLvsxMlnzBV3ENyNQt4LQ9QXXvtbuhujAR8jCztVQygxuaHD7oOf2EB8
 niH7I0re91Q4rcTABwYkRCnS3sRGAz8+pe9vU4Tw2CCZxVgIA0U2iVBqL8p5gBYZQM6w
 LfEg8b89BtGNakk2SIRrPGgKmxJMCJXcHcy1wKZKRUQVis2c1bA0EZ2sRYtoKVdG1Jc+
 klog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iSHe0s9M59jQH1SzGvfiZ1+HXChWWuPGtrcv9A89JEE=;
 fh=uC3+FyQ+UV6iX4MumeF6FmMOd8rrUWghL4zb0y/u1pk=;
 b=SZAtGSUULRDvrPz4voOT876dXDwHphQuWCjyjj5JdB5fMZ160IOKdsL2ae0LNoNqW2
 HWFuMdmG+XfI5H9mE8wFYqmoRre2Knp6xORzc2CD1V+0UNQbCqXYtDY69KslOWZY2lJl
 bJpdmp1UJSd3pR3s5PLCPfl9LZtm1Kl/+OO1oWyq/XZ4Ydt1rmG+MCVmk0wGiIsAwVBk
 KhRQhbQqU2HmDzVSWe6PaHmJJuKM98Au39tnkqMlISHHBWfna0RCLbxLnfSQBdxx/oaw
 12UM2Ejc98qB/5XRvLBqdXVB8czN0vSLqBBQSts706cxmZJlLthnsOHrKLV/CrmhXSRM
 d7jA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037099; x=1767641899; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iSHe0s9M59jQH1SzGvfiZ1+HXChWWuPGtrcv9A89JEE=;
 b=uFvaz2961zrUSW78eoxwOETFbiA2hMkczveZh+vDeOXQuVauaQeY7wnjivNRGltwa6
 mEXeKenBWKXTfUHSBCnZxqqPuorechjU553QDgJmFiY1YMpmj0pGfQ5nbq7/5mAqEZTN
 Y6R9dqFgzvOYj9WZP2+cG1lg15MerEWmG1ItUQpGcpU3WmNq0boUM5hWUdzfZPKx2pKG
 p3iJIzyfnznyVzeBvC2Hp+JgdpqGLZ+T3BrftUymTvXQAdfDobqQrD+pH7i2XMpNZeBW
 9uY6F0VIMQdeFXqYRqwJmH0zmHFOzYLSC7tYCOPVLHO4f5fb4Syua1/T+1e+6o3v399X
 ZHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037099; x=1767641899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iSHe0s9M59jQH1SzGvfiZ1+HXChWWuPGtrcv9A89JEE=;
 b=C3PQRBrPYd9nrxIQbtRa5HRuVY318RSQR95wwak21/LcrMEmwY0AZx75K0DpyVEQHU
 KDEeX5c2J8colqbXHYl2oy1ycXQb4PPLt8asQCmXVFYsiJz5c5Of4qSK35J1P6CnJNln
 gTM55zRSb/qVmXc9kY/H77HdCJ+ry1ZDCC9DpCN9hUT3930gSThm1VuIWF4b2tgGrJTQ
 Dce0LEBEJeTL5gcPuppB4TeL606++FCvz6bjaIuBXHD8syw7KcRItt3xAQJQJ4jzIaF8
 a+xhS39M8C8SqJU+U53vwrchGGA3mQVGpX7Z72QybQI19bPw3evBqgjH5FMP+948RdoP
 p1KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNyO1NqjTOIJxp/alICfFGAV/2KEtet9AUTuqKGn1CjQ1co0mxbQ78y4y9AyDtkc1F/sKTmj213w==@nongnu.org
X-Gm-Message-State: AOJu0YztW0eiAPLnZ8NCXa/sMxArilOFH0tZiMjILk1PuG86GHNaL0Yj
 e6G7C73LpfIv8t0dpmBtiPqH6eHeHzB6boMBCkU8WR2HW+2IYr++oXejHLNYzDIGoFmmsSkzd9U
 f/i2LEPSoAsJRKIdLyyCzNv5k6NDk7RRUNhyfR8LD
X-Gm-Gg: AY/fxX78vebVJK2NDioNKv6hGZH2R87Ye7rOZWwOIo8M62VLLZSJuo7LsHY7oJkJQ3+
 bysrvLcqgVwW0dz+WTmz7XHl3B6FGaAsdEsbz56QSqCmK1SiNCPp+9mtGw83y23795UNPeMa0so
 wGDMUNnpAHT7FtWVDkJpyFKvIVURv9w4YL4MhxWqt7IwZklkRtPTbpE9llbofteN3t7vwR2A48y
 xQt6eF1gvdc/GAEKSaTvrf6La7qdtuBqOcgmQAzsiQYGka9hqf4F5426BDQTSdi/jwRq2mxG0UK
 eO4WdJUxVG6Ke6k8tADPe2A7yQ==
X-Google-Smtp-Source: AGHT+IFp+zk5i/1xH0hJ2cC5ENduTb5O1V6JaEXoywsghiQBh0ln2M367h75zm0IU5YIIRCJRZShaH5rvf+qL5qzZw0=
X-Received: by 2002:a05:622a:1308:b0:4f3:b0f3:62bb with SMTP id
 d75a77b69052e-4f4e5f746cdmr33506191cf.13.1767037099009; Mon, 29 Dec 2025
 11:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-10-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-10-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:07 -0800
X-Gm-Features: AQt7F2qHyuy0Rjs9h4p2xga7-Nm5mI_12tEjB8I0iD1yXmFVitSSKnEErrcsRr8
Message-ID: <CA+QoejV4vX4SqX87y7jd81DXL-4hfHRvYhTLBpjwdf+oH4EMaQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/19] hw/arm/aspeed: Attach SRAM device to AST1700
 model
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Dec 23, 2025 at 5:42=E2=80=AFPM Kane Chen <kane_chen@aspeedtech.com=
> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Map the SRAM device to AST1700 model
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> ---
>  include/hw/arm/aspeed_ast1700.h |  2 ++
>  hw/arm/aspeed_ast1700.c         | 18 ++++++++++++++++++
>  hw/arm/aspeed_ast27x0.c         |  1 +
>  3 files changed, 21 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index a0d6b3ae44..23588f7a81 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -20,9 +20,11 @@ struct AspeedAST1700SoCState {
>      SysBusDevice parent_obj;
>
>      MemoryRegion iomem;
> +    uint8_t board_idx;
>
>      AspeedLTPIState ltpi;
>      SerialMM uart;
> +    MemoryRegion sram;
>  };
>
>  #endif /* ASPEED_AST1700_H */
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index f444582795..cb07d94054 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -14,13 +14,16 @@
>  #include "hw/arm/aspeed_ast1700.h"
>
>  #define AST2700_SOC_LTPI_SIZE        0x01000000
> +#define AST1700_SOC_SRAM_SIZE        0x00040000
>
>  enum {
> +    ASPEED_AST1700_DEV_SRAM,
>      ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
>  };
>
>  static const hwaddr aspeed_ast1700_io_memmap[] =3D {
> +    [ASPEED_AST1700_DEV_SRAM]      =3D  0x00BC0000,
>      [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
>  };
> @@ -29,12 +32,21 @@ static void aspeed_ast1700_realize(DeviceState *dev, =
Error **errp)
>  {
>      AspeedAST1700SoCState *s =3D ASPEED_AST1700(dev);
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +    char dev_name[32];
>
>      /* Occupy memory space for all controllers in AST1700 */
>      memory_region_init(&s->iomem, OBJECT(s), TYPE_ASPEED_AST1700,
>                         AST2700_SOC_LTPI_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
>
> +    /* SRAM */
> +    snprintf(dev_name, sizeof(dev_name), "aspeed.ioexp-sram.%d", s->boar=
d_idx);
> +    memory_region_init_ram(&s->sram, OBJECT(s), dev_name,
> +                           AST1700_SOC_SRAM_SIZE, errp);
> +    memory_region_add_subregion(&s->iomem,
> +                            aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_=
SRAM],
> +                            &s->sram);
> +
>      /* UART */
>      qdev_prop_set_uint8(DEVICE(&s->uart), "regshift", 2);
>      qdev_prop_set_uint32(DEVICE(&s->uart), "baudbase", 38400);
> @@ -69,11 +81,17 @@ static void aspeed_ast1700_instance_init(Object *obj)
>
>      return;
>  }
> +
> +static const Property aspeed_ast1700_props[] =3D {
> +    DEFINE_PROP_UINT8("board-idx", AspeedAST1700SoCState, board_idx, 0),
> +};
> +
>  static void aspeed_ast1700_class_init(ObjectClass *klass, const void *da=
ta)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->realize =3D aspeed_ast1700_realize;
> +    device_class_set_props(dc, aspeed_ast1700_props);
>  }
>
>  static const TypeInfo aspeed_ast1700_info =3D {
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 678d4eb6d9..f2418e0e45 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -1096,6 +1096,7 @@ static void aspeed_soc_ast2700_realize(DeviceState =
*dev, Error **errp)
>
>      /* IO Expander */
>      for (i =3D 0; i < sc->ioexp_num; i++) {
> +        qdev_prop_set_uint8(DEVICE(&s->ioexp[i]), "board-idx", i);
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->ioexp[i]), errp)) {
>              return;
>          }
> --
> 2.43.0
>

