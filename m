Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp602090lft;
        Thu, 30 Jun 2022 12:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usgKqqwixUPDX4aqGLORJUZH3gUG3YSdkLC2ApTWaaoiP5CaxhkW3rUugcQOFkZOS5Na/d
X-Received: by 2002:ac8:5b0d:0:b0:305:2994:6f0d with SMTP id m13-20020ac85b0d000000b0030529946f0dmr9171652qtw.668.1656616878590;
        Thu, 30 Jun 2022 12:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656616878; cv=none;
        d=google.com; s=arc-20160816;
        b=rMzw2AoRCVjWkvRz66SVHvquIPvjLrO4vEKwDgOavs0JTAvTRMBFhUuoCgCxeQqHhZ
         dWx5HIsZB2Cgh3kg7MLSAD4aD7Hp2qsZcS/U8GjuQ9OwowZtS233llfIXl6r+IiwHiWs
         DcpTsMV0sn2C3gTuQmrIYIeonm031Q0ChTCuaFftG1VqKTWWD5meDA1SctwTu37nfu1X
         RVHSNnFiFNmN3UENFiFoh1xlG661ViAQ8JDj/YkF1JYjPXIkXRAYjKwzNFWJAKbPZeCa
         vr998ceVEv48xyFuBGthGqQNZh1IiK2E+ttaAd51+mOcGCaSt+QzSZLU/ycxsfs5WIsM
         3ujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a1w7+0wxsNclvx4djImB6Wc1PSYF5nBBybU6HIHm2Qs=;
        b=ce7y91IsfYhIB5E4M+FQm4ErboEpNHcXLY+zYOM47Au8XCb8t9pk+t9fp50v/rym2T
         XYKGIrPb98SkxkvwbgqgTMfyGEUOUh1qps5NoULXaEt0iLeUk6g6r1IfZ6P/fDwhYger
         oECFoqHBasPgETPajhQXaamMJTGSjebjB9NJ2UXoSlcqR0TrAvGWWXarMjSHxGCzVvlG
         UoSZAICNrQDsuxvLcxP3JuUpmbHbp35lygxJE6QFh7PG7g6H8xkHFJ+lDw0c3UOX++eh
         A0CSZXaemKW+BX/qSu+V6jqlnUXMrUzLpYx1ieEPejuQpoMccQYdOHQfpRLqNvRzNAH1
         5V9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Asf3Xxba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a0562140c6800b004703c6466a4si10951586qvj.271.2022.06.30.12.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 12:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Asf3Xxba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6zj4-0005Ro-2r
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 15:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6ziV-0005Mj-Oq
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:20:52 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6ziT-0000aQ-5n
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:20:42 -0400
Received: by mail-ed1-x533.google.com with SMTP id o9so120132edt.12
 for <qemu-arm@nongnu.org>; Thu, 30 Jun 2022 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1w7+0wxsNclvx4djImB6Wc1PSYF5nBBybU6HIHm2Qs=;
 b=Asf3Xxba0qe6L0mN2wKCtrUDvoqBp9aJJlmzOm/ndmr7WKtJYmysDDI2i/M/Ryr33z
 TKRGLBFWoTxstdAdOEDGaTKSrthP0Ptl8UOarjP/7zq4Bjhr6QCdCk7qoihUoUP1hKwU
 X60yOYvACstADANfuKvThnkymyP1AXcxR8WtJtbCBIbzcYDQeC5g50S5T0Fw6UfIHbyf
 0/wALobmIoiw3CwHxHxsXvUJn69Kh6ijV1eMMVORY9WBftdqL8yjgyMikjYo7fi8L8V1
 cdwm09xZT/sCSDIbspHy/aWNoy69237jIKRg6jEGWBgZDBuYwoC1m5IudRnEaARy+u67
 5a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1w7+0wxsNclvx4djImB6Wc1PSYF5nBBybU6HIHm2Qs=;
 b=wwgGi/8QEgIWjsU5+jwMy15QdXgfTsoQEd366aHwan0Oz5PZKwkucqEsr8EdMAH7jZ
 xjq0ndZ+T2eNEdKm9n6iy1HD6/GuGqw2xexLFYVWtFoF5sRk+9JDTm1QS6F01XEj1Lpx
 V8bJ7uACRPg477L+5zgIw/kLxGfc/WBq9ZjaSkeBwNATezV/I/sQzEv3XbUL6BhCAgUp
 0qIW1WH0MnKqJmang4rO4Je3oYYLjSUFeIUzXPS2Nxa/dxPyhnUq7k84x7+1YLKRaDm8
 6P0F0ExfJJyLxG3M9zc34Y3RVif+1alwUALYcthUtKRJp2MXEqp88oAV6ybw+xgrICvm
 /aKQ==
X-Gm-Message-State: AJIora/QxkcthGdkquynS/Wu0oXfeSc53L41Y6eRztKqu8q8e7Vi0BwH
 Tvsdb/M3emRU4fkOY4gbkIDmsGBMAHWUnYPokocxDw==
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id
 dz17-20020a0564021d5100b0041fcf6c35a5mr13996111edb.25.1656616839516; Thu, 30
 Jun 2022 12:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-10-me@pjd.dev>
In-Reply-To: <20220630045133.32251-10-me@pjd.dev>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Jun 2022 12:20:03 -0700
Message-ID: <CAMvPwGogaMiSdS5dbrqLRSqUvGmtic1nxKqHBedVNhnW4ja50g@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] hw/sensor: Add IC_DEVICE_ID to ISL voltage
 regulators
To: me@pjd.dev
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=titusr@google.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PikSTaOlMMxN

On Wed, 29 Jun 2022 at 21:52, Peter Delevoryas <me@pjd.dev> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> This commit adds a passthrough for PMBUS_IC_DEVICE_ID to allow Renesas
> voltage regulators to return the integrated circuit device ID if they
> would like to.
>
> The behavior is very device specific, so it hasn't been added to the
> general PMBUS model. Additionally, if the device ID hasn't been set,
> then the voltage regulator will respond with the error byte value.  The
> guest error message will change slightly for IC_DEVICE_ID with this
> commit.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/sensor/isl_pmbus_vr.c         | 12 ++++++++++++
>  include/hw/sensor/isl_pmbus_vr.h |  5 +++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index e11e028884..799ea9d89e 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -15,6 +15,18 @@
>
>  static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
>  {
> +    ISLState *s = ISL69260(pmdev);
> +
> +    switch (pmdev->code) {
> +    case PMBUS_IC_DEVICE_ID:
> +        if (!s->ic_device_id_len) {
> +            break;
> +        }
> +        pmbus_send(pmdev, s->ic_device_id, s->ic_device_id_len);
> +        pmbus_idle(pmdev);
> +        return 0;
> +    }
> +
>      qemu_log_mask(LOG_GUEST_ERROR,
>                    "%s: reading from unsupported register: 0x%02x\n",
>                    __func__, pmdev->code);
> diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
> index 3e47ff7e48..aa2c2767df 100644
> --- a/include/hw/sensor/isl_pmbus_vr.h
> +++ b/include/hw/sensor/isl_pmbus_vr.h
> @@ -12,12 +12,17 @@
>  #include "hw/i2c/pmbus_device.h"
>  #include "qom/object.h"
>
> +#define TYPE_ISL69259   "isl69259"
>  #define TYPE_ISL69260   "isl69260"
>  #define TYPE_RAA228000  "raa228000"
>  #define TYPE_RAA229004  "raa229004"
> +#define ISL_MAX_IC_DEVICE_ID_LEN 16
>
>  struct ISLState {
>      PMBusDevice parent;
> +
> +    uint8_t ic_device_id[ISL_MAX_IC_DEVICE_ID_LEN];
> +    uint8_t ic_device_id_len;
>  };
>
>  OBJECT_DECLARE_SIMPLE_TYPE(ISLState, ISL69260)
> --
> 2.37.0
>
Reviewed-by: Titus Rwantare <titusr@google.com>
