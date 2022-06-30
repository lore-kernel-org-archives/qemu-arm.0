Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp602366lft;
        Thu, 30 Jun 2022 12:21:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uK0oZ7Y+vLNjvIhj6GeXculf7CeLlCxDFn5mo8V+d7oKMJmDvS9NPQKfi0OKvpcSyYfsyF
X-Received: by 2002:a05:6214:5284:b0:444:10c8:ee59 with SMTP id kj4-20020a056214528400b0044410c8ee59mr13215151qvb.68.1656616903198;
        Thu, 30 Jun 2022 12:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656616903; cv=none;
        d=google.com; s=arc-20160816;
        b=XAmbqq+i2cJKb3Eq2lJ+onbFRxCvxp8dKcgXt/yCg9bRAAxPIZKCJn2Yb01KnMia5r
         65tG92rbPtJoStC52oRNYY4V9hWJK3r6psWF3xRxk1VTjmC8/6rPtan+dmxScD2OkEhg
         jYkbW8ECYVekCJSi31wgb6tVDQ/0sB9N0089jDC11Wc6tF+ubvMX7bRnw94u5Qah6S1t
         TZzwOfKn/ONxMWwE6QfLBaLUr3xBxnMVztfZB1cQ3bDDotf6a6aImIVilp9Wqo3uPk8A
         2gFpzOG18lcDqhUn0LYckuEhl/iDb4EkTy65h8sHV+CHvVkt/y1O8+J9kLeXJI0Uz7Q6
         fsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fA23ErRTzLQJPvGEr2VDI4wbxiKnUq0Jb3AXwzPvH1o=;
        b=nzCFihWOMbY0/TqzJiqFwaOXqFFeWn2Gz2585IXjbRZnGzeC3cEjLAxOZXK3gpQFIV
         CDwZCtN8G/YnbtHVpjls2oowke8Xcs6W/njWxKtFqY07t6FbEbhRJy4ko6zsOnY25Ikh
         h8lUT4VH19jy7RYOFgjbDpFfNhPFETwdAAqhK8XHGwCqBrnkLixiE0NsSeEDmdTkDQ6N
         027eRPx75aXWEsSP1AM64R0N60ZLZHbcqQOisOKzksmOrwkDp47+qX/ocE/D0b7tUENQ
         093KaxrFCPV7J/D9m6xHSnMjYJZEnwPvsBR3r0MmXeP2hGGb23GNTQW58AkDTa15gvZ5
         z/uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=eq1QTMg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a0562140c8400b004703dba39bfsi10271478qvr.12.2022.06.30.12.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 12:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=eq1QTMg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6zjS-0006Ab-Hi
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 15:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zgu-0003OQ-KQ
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:19:07 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zgs-0000Bz-U2
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:19:04 -0400
Received: by mail-ej1-x631.google.com with SMTP id mf9so48078ejb.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jun 2022 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fA23ErRTzLQJPvGEr2VDI4wbxiKnUq0Jb3AXwzPvH1o=;
 b=eq1QTMg+jnIVRJSzrJA+G907+EFudAqESxbAbWrcTpvKO1Dl4CsjG/vFvJplvUjaIO
 eafIvAjyU9/MqY+Sw57MtHGaDwLpEqmDUKvx5A88H+uR2CJ1bom8gVr3qa0vuiJs0XRk
 NIzyQyXkQ8t7Z6zqisoKPz7W0HVdd3orTC8c8+wKb/P1festq2WP7+RFVuGVh+8T2dbd
 EOUXCTWjrz2PWQ2g2M35fbldObIIcF2HQuWUGjmdWUGuFryD/ty9OH2JAWg9E1xSuAZY
 QvMCPdJeGxuT5BhfjDgjglUcTbT8GXS0WAIxXaiI+UcLUah2O3JVV52uapfD2sAxnt8X
 Aevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fA23ErRTzLQJPvGEr2VDI4wbxiKnUq0Jb3AXwzPvH1o=;
 b=j3rcYkoeOIseP9/r0N4UiCWs78ua/qNKNAfcLPI9aa8P0gfv17ibRHtV3MbJ1ctpjf
 6j2pyyQAq7Z5eSEOxo6pX1Pmwr3OEQF00JToVi12gWE09UGj/OHK24HdxnWp/AOEieTU
 sGRD3flhVNQCUyfDfojb4VFCZBOHJ16EKtQD7TgX7kELIdOxfTlHKuYXTEul5ASRfRHr
 tv6bmTsYHqjw708Sr+TuVoMuV6LncvXizCm3i0YcvWcqNaK2taAX3GOA/88GIsLfLFJN
 7JO16FDpdpL4p/TlOBkXZQbsm6FZVFPzYDNAeHPOnCuh6XurmRwNS8iNKkYYVeyIUmDR
 zpEw==
X-Gm-Message-State: AJIora9YOgAx1x9+4Qr0bS0YaJ/QtSOW5SNU1dTq61DoBXqOporynNuf
 1jADQU3GAB3zCtpmQuPRDRkW0jn+TlkrmrQqFnar6A==
X-Received: by 2002:a17:907:da5:b0:726:2a4d:be69 with SMTP id
 go37-20020a1709070da500b007262a4dbe69mr10556994ejc.208.1656616739535; Thu, 30
 Jun 2022 12:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-9-me@pjd.dev>
In-Reply-To: <20220630045133.32251-9-me@pjd.dev>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Jun 2022 12:18:23 -0700
Message-ID: <CAMvPwGqd1tpkY7=atXUEx7tWwQjhDN=PAcnAirjtpYU4YRDj8A@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] hw/i2c/pmbus: Add idle state to return 0xff's
To: me@pjd.dev
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=titusr@google.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lRvfU8p3NHSz

On Wed, 29 Jun 2022 at 21:52, Peter Delevoryas <me@pjd.dev> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/i2c/pmbus_device.c         | 9 +++++++++
>  include/hw/i2c/pmbus_device.h | 7 +++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a1..f89fea65f3 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -261,6 +261,11 @@ void pmbus_check_limits(PMBusDevice *pmdev)
>      }
>  }
>
> +void pmbus_idle(PMBusDevice *pmdev)
> +{
> +    pmdev->code = PMBUS_IDLE_STATE;
> +}
> +
>  /* assert the status_cml error upon receipt of malformed command */
>  static void pmbus_cml_error(PMBusDevice *pmdev)
>  {
> @@ -984,6 +989,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>
> +    case PMBUS_IDLE_STATE:
> +        pmbus_send8(pmdev, PMBUS_ERR_BYTE);
> +        break;
> +
>      case PMBUS_CLEAR_FAULTS:              /* Send Byte */
>      case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
>      case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 0f4d6b3fad..93f5d57c9d 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -155,6 +155,7 @@ enum pmbus_registers {
>      PMBUS_MFR_MAX_TEMP_1            = 0xC0, /* R/W word */
>      PMBUS_MFR_MAX_TEMP_2            = 0xC1, /* R/W word */
>      PMBUS_MFR_MAX_TEMP_3            = 0xC2, /* R/W word */
> +    PMBUS_IDLE_STATE                = 0xFF,
>  };
>
>  /* STATUS_WORD */
> @@ -527,6 +528,12 @@ int pmbus_page_config(PMBusDevice *pmdev, uint8_t page_index, uint64_t flags);
>   */
>  void pmbus_check_limits(PMBusDevice *pmdev);
>
> +/**
> + * Enter an idle state where only the PMBUS_ERR_BYTE will be returned
> + * indefinitely until a new command is issued.
> + */
> +void pmbus_idle(PMBusDevice *pmdev);
> +
>  extern const VMStateDescription vmstate_pmbus_device;
>
>  #define VMSTATE_PMBUS_DEVICE(_field, _state) {                       \
> --
> 2.37.0
>

Reviewed-by: Titus Rwantare <titusr@google.com>
