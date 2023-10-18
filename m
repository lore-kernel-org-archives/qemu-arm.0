Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4290799ejc;
        Tue, 17 Oct 2023 17:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs+E41+Ph/AjEP/4wn0hCa89DN1gFU1Hma7vPEf+svCBIt5BRJCfkiUWAWmLjRcp7XdT7z
X-Received: by 2002:ac8:5911:0:b0:412:1e0a:772d with SMTP id 17-20020ac85911000000b004121e0a772dmr4711204qty.12.1697588741991;
        Tue, 17 Oct 2023 17:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697588741; cv=none;
        d=google.com; s=arc-20160816;
        b=H6kymwwxlr2JArzICEZajTXPJp6U9irwoOeAZZR3wXo87eFC//6nPPiTr4Z2hEHwh6
         CXCM0pnqd7MBvT4aXgX6/IItxWXps79642lzxwUd10Qtml8xPIT2Z1JalKLc63FdTcsa
         Mg0kwzaTmIJR8tS6mJQqaqaLzhB9mYzBCSPEV+H3iLve7xuiuRnGO8+6LWC0nfZKIXEt
         Y/LT+BlxLphR8PM/E84wi3UWsdi5go1aGVdMzP+3Y4wAyRyr8i8YYJZSo1EOGSr7te3T
         iHfVwk21d9VGoJtXfcw3dbS39rGufpia2PVDF/xJ9hZRH1h4HhwL9o4gHE6Ig6PKMLIk
         0ePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ybG2Vveyw7JeGUChumzZTY47p02/yeer/1v/nWeiVm4=;
        fh=cqIjlAi2zhmDjIzjdtteyLS7F+9TI9/jfANOVH19gSw=;
        b=ArR9wNQ1xpZm7XpRzz+RRBAxelbqwx+8wz0SngsBBYGsODNj0sMQdZmJCyj5E0/zGo
         kZ62UXz1cnXWutcqOLJIUW39b5r8vkGzykpV2XXv65FFAZnNcvbsa1ofJTzzIMFxV66b
         Y4lY7cmKlRd5NxbaZn3tXWVxut40Xv/4YWYZq06bavGci1/cwz35xmyBS+3UbyHdKLci
         jiYaozLD7U3mQ7vCv0GfqKe5fINeMwvjTc2jGTA3dYODncZS1BeFEc7xKV/kFZkLsE+P
         4NwMP44kZjfNaLH6m0HnrDCralJa+KWDiI2DO5D4vtVjP5J+x6DPNOm83dBYDX/jPPFt
         gw4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=X1ky7mgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10-20020ac8470a000000b0041cbaed294esi495280qtp.609.2023.10.17.17.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 17:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=X1ky7mgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsuNL-0007Xl-En; Tue, 17 Oct 2023 20:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qsuNG-0007Uu-Om
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 20:25:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qsuNE-0008Ro-72
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 20:25:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40837124e1cso24135e9.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697588718; x=1698193518; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ybG2Vveyw7JeGUChumzZTY47p02/yeer/1v/nWeiVm4=;
 b=X1ky7mgXNXGUlDX8tnCVvb8RoMKDSU6P265owtA4Aln6+cOqvZfxOodpiECF8yUah1
 D9bMfOz/lWpRwkl800YAM4fDNs2X4A2qt6T/kjuWgDb4FhXoUdc/cNBHx03zDkX7zBQ2
 j0w/dFYRgpXxC0nMVRtedexoPv5ihqdHwX7eXXgekU9Ou7rRmczohKGUSe/N/4kJBkPW
 umkcAFez02lE8oPBXzBsCYonnbyauvnOpTVO1LuFCNirJwFzR16MyaVHe+AL6SssR90n
 KwWES3Vw8U5pm/vgiGzWV67jxdf/3sSKO8K5rqshg8imWZfCB9uevGLLW66wMGwA4/hm
 mOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697588718; x=1698193518;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ybG2Vveyw7JeGUChumzZTY47p02/yeer/1v/nWeiVm4=;
 b=f5deIiiG+Wua5U5NNFLZndMjSEkOiX+/PvAgxZQYDGI8TXtiZCgPNfL3wpoWZjRTSR
 vw7P++qOWjOP/Yu4RNU27Kt29vN1Ne76SYcmqtDDvGpf9WIF7LEi7Ajf+RHjiufZ0wug
 5bTnQWd/I/hyO0s4J9n6LUnJjoxKQHEOtkP7Sspu+LwP6tPNin03l4N70XyOb5bRD8K8
 XHLsC6ER4AnzFS1Ugco/evTqBRX16gsb0War2517d6DWxLyw3jyHsAPJElU4HDILQDDZ
 ZM3q7nXe/LKnE2eLSMdObxfO1UWZw7l5c2JuCcHh3zGBXsVNAEAL7K0xhHV3jokMQNJ0
 YPuA==
X-Gm-Message-State: AOJu0Yw/gDdGkMocz7+Ta/WS9HpyP4j6LSLfmq+KuYI2xDULrTzIKeBc
 cHaRbfHcfm+LUgL7ZHMJ8Pqhpo06/Cdu7zGIiPmNEw==
X-Received: by 2002:a05:600c:4893:b0:3fe:eb42:7ec with SMTP id
 j19-20020a05600c489300b003feeb4207ecmr35359wmp.1.1697588718486; Tue, 17 Oct
 2023 17:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231017230342.311227-1-nabihestefan@google.com>
 <20231017230342.311227-12-nabihestefan@google.com>
In-Reply-To: <20231017230342.311227-12-nabihestefan@google.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 17 Oct 2023 17:25:06 -0700
Message-ID: <CAGcCb13d0CVrN-RyBBr66kOWbdivqfpLDTcvoXWspjgUS=JJ8w@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] tests/qtest: Adding PCS Module test to GMAC Qtest
To: Nabih Estefan <nabihestefan@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 kfting@nuvoton.com, jasonwang@redhat.com, avi.fishman@nuvoton.com
Content-Type: multipart/alternative; boundary="0000000000008a9bee0607f2ac05"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=wuhaotsh@google.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UPPERCASE_50_75=0.008,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: PmHQOimReeSj

--0000000000008a9bee0607f2ac05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 4:04=E2=80=AFPM Nabih Estefan <nabihestefan@google.=
com>
wrote:

> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
>  - Add PCS Register check to npcm_gmac-test
>
> Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  tests/qtest/npcm_gmac-test.c | 134 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 133 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/npcm_gmac-test.c b/tests/qtest/npcm_gmac-test.c
> index 84511fd915..1f0ad664f4 100644
> --- a/tests/qtest/npcm_gmac-test.c
> +++ b/tests/qtest/npcm_gmac-test.c
> @@ -20,6 +20,10 @@
>  /* Name of the GMAC Device */
>  #define TYPE_NPCM_GMAC "npcm-gmac"
>
> +/* Address of the PCS Module */
> +#define PCS_BASE_ADDRESS 0xf0780000
> +#define NPCM_PCS_IND_AC_BA 0x1fe
> +
>  typedef struct GMACModule {
>      int irq;
>      uint64_t base_addr;
> @@ -111,6 +115,62 @@ typedef enum NPCMRegister {
>      NPCM_GMAC_PTP_STNSUR =3D 0x714,
>      NPCM_GMAC_PTP_TAR =3D 0x718,
>      NPCM_GMAC_PTP_TTSR =3D 0x71c,
> +
> +    /* PCS Registers */
> +    NPCM_PCS_SR_CTL_ID1 =3D 0x3c0008,
> +    NPCM_PCS_SR_CTL_ID2 =3D 0x3c000a,
> +    NPCM_PCS_SR_CTL_STS =3D 0x3c0010,
> +
> +    NPCM_PCS_SR_MII_CTRL =3D 0x3e0000,
> +    NPCM_PCS_SR_MII_STS =3D 0x3e0002,
> +    NPCM_PCS_SR_MII_DEV_ID1 =3D 0x3e0004,
> +    NPCM_PCS_SR_MII_DEV_ID2 =3D 0x3e0006,
> +    NPCM_PCS_SR_MII_AN_ADV =3D 0x3e0008,
> +    NPCM_PCS_SR_MII_LP_BABL =3D 0x3e000a,
> +    NPCM_PCS_SR_MII_AN_EXPN =3D 0x3e000c,
> +    NPCM_PCS_SR_MII_EXT_STS =3D 0x3e001e,
> +
> +    NPCM_PCS_SR_TIM_SYNC_ABL =3D 0x3e0e10,
> +    NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_LWR =3D 0x3e0e12,
> +    NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_UPR =3D 0x3e0e14,
> +    NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_LWR =3D 0x3e0e16,
> +    NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_UPR =3D 0x3e0e18,
> +    NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_LWR =3D 0x3e0e1a,
> +    NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_UPR =3D 0x3e0e1c,
> +    NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_LWR =3D 0x3e0e1e,
> +    NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_UPR =3D 0x3e0e20,
> +
> +    NPCM_PCS_VR_MII_MMD_DIG_CTRL1 =3D 0x3f0000,
> +    NPCM_PCS_VR_MII_AN_CTRL =3D 0x3f0002,
> +    NPCM_PCS_VR_MII_AN_INTR_STS =3D 0x3f0004,
> +    NPCM_PCS_VR_MII_TC =3D 0x3f0006,
> +    NPCM_PCS_VR_MII_DBG_CTRL =3D 0x3f000a,
> +    NPCM_PCS_VR_MII_EEE_MCTRL0 =3D 0x3f000c,
> +    NPCM_PCS_VR_MII_EEE_TXTIMER =3D 0x3f0010,
> +    NPCM_PCS_VR_MII_EEE_RXTIMER =3D 0x3f0012,
> +    NPCM_PCS_VR_MII_LINK_TIMER_CTRL =3D 0x3f0014,
> +    NPCM_PCS_VR_MII_EEE_MCTRL1 =3D 0x3f0016,
> +    NPCM_PCS_VR_MII_DIG_STS =3D 0x3f0020,
> +    NPCM_PCS_VR_MII_ICG_ERRCNT1 =3D 0x3f0022,
> +    NPCM_PCS_VR_MII_MISC_STS =3D 0x3f0030,
> +    NPCM_PCS_VR_MII_RX_LSTS =3D 0x3f0040,
> +    NPCM_PCS_VR_MII_MP_TX_BSTCTRL0 =3D 0x3f0070,
> +    NPCM_PCS_VR_MII_MP_TX_LVLCTRL0 =3D 0x3f0074,
> +    NPCM_PCS_VR_MII_MP_TX_GENCTRL0 =3D 0x3f007a,
> +    NPCM_PCS_VR_MII_MP_TX_GENCTRL1 =3D 0x3f007c,
> +    NPCM_PCS_VR_MII_MP_TX_STS =3D 0x3f0090,
> +    NPCM_PCS_VR_MII_MP_RX_GENCTRL0 =3D 0x3f00b0,
> +    NPCM_PCS_VR_MII_MP_RX_GENCTRL1 =3D 0x3f00b2,
> +    NPCM_PCS_VR_MII_MP_RX_LOS_CTRL0 =3D 0x3f00ba,
> +    NPCM_PCS_VR_MII_MP_MPLL_CTRL0 =3D 0x3f00f0,
> +    NPCM_PCS_VR_MII_MP_MPLL_CTRL1 =3D 0x3f00f2,
> +    NPCM_PCS_VR_MII_MP_MPLL_STS =3D 0x3f0110,
> +    NPCM_PCS_VR_MII_MP_MISC_CTRL2 =3D 0x3f0126,
> +    NPCM_PCS_VR_MII_MP_LVL_CTRL =3D 0x3f0130,
> +    NPCM_PCS_VR_MII_MP_MISC_CTRL0 =3D 0x3f0132,
> +    NPCM_PCS_VR_MII_MP_MISC_CTRL1 =3D 0x3f0134,
> +    NPCM_PCS_VR_MII_DIG_CTRL2 =3D 0x3f01c2,
> +    NPCM_PCS_VR_MII_DIG_ERRCNT_SEL =3D 0x3f01c4,
>  } NPCMRegister;
>
>  static uint32_t gmac_read(QTestState *qts, const GMACModule *mod,
> @@ -119,6 +179,15 @@ static uint32_t gmac_read(QTestState *qts, const
> GMACModule *mod,
>      return qtest_readl(qts, mod->base_addr + regno);
>  }
>
> +static uint16_t pcs_read(QTestState *qts, const GMACModule *mod,
> +                          NPCMRegister regno)
> +{
> +    uint32_t write_value =3D (regno & 0x3ffe00) >> 9;
> +    qtest_writel(qts, PCS_BASE_ADDRESS + NPCM_PCS_IND_AC_BA, write_value=
);
> +    uint32_t read_offset =3D regno & 0x1ff;
> +    return qtest_readl(qts, PCS_BASE_ADDRESS + read_offset);
> +}
> +
>  /* Check that GMAC registers are reset to default value */
>  static void test_init(gconstpointer test_data)
>  {
> @@ -129,7 +198,12 @@ static void test_init(gconstpointer test_data)
>  #define CHECK_REG32(regno, value) \
>      do { \
>          g_assert_cmphex(gmac_read(qts, mod, (regno)), =3D=3D, (value)); =
\
> -    } while (0)
> +    } while (0) ;
> +
> +#define CHECK_REG_PCS(regno, value) \
> +    do { \
> +        g_assert_cmphex(pcs_read(qts, mod, (regno)), =3D=3D, (value)); \
> +    } while (0) ;
>
>      CHECK_REG32(NPCM_DMA_BUS_MODE, 0x00020100);
>      CHECK_REG32(NPCM_DMA_XMT_POLL_DEMAND, 0);
> @@ -180,6 +254,64 @@ static void test_init(gconstpointer test_data)
>      CHECK_REG32(NPCM_GMAC_PTP_TAR, 0);
>      CHECK_REG32(NPCM_GMAC_PTP_TTSR, 0);
>
> +    /* TODO Add registers PCS */
> +    if (mod->base_addr =3D=3D 0xf0802000) {
> +        CHECK_REG_PCS(NPCM_PCS_SR_CTL_ID1, 0x699e)
> +        CHECK_REG_PCS(NPCM_PCS_SR_CTL_ID2, 0)
> +        CHECK_REG_PCS(NPCM_PCS_SR_CTL_STS, 0x8000)
> +
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_CTRL, 0x1140)
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_STS, 0x0109)
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_DEV_ID1, 0x699e)
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_DEV_ID2, 0x0ced0)
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_AN_ADV, 0x0020)
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_LP_BABL, 0)
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_AN_EXPN, 0)
> +        CHECK_REG_PCS(NPCM_PCS_SR_MII_EXT_STS, 0xc000)
> +
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_ABL, 0x0003)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_LWR, 0x0038)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_UPR, 0)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_LWR, 0x0038)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_UPR, 0)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_LWR, 0x0058)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_UPR, 0)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_LWR, 0x0048)
> +        CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_UPR, 0)
> +
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MMD_DIG_CTRL1, 0x2400)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_AN_CTRL, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_AN_INTR_STS, 0x000a)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_TC, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_DBG_CTRL, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_MCTRL0, 0x899c)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_TXTIMER, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_RXTIMER, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_LINK_TIMER_CTRL, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_MCTRL1, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_DIG_STS, 0x0010)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_ICG_ERRCNT1, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MISC_STS, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_RX_LSTS, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_BSTCTRL0, 0x00a)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_LVLCTRL0, 0x007f)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_GENCTRL0, 0x0001)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_GENCTRL1, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_STS, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_RX_GENCTRL0, 0x0100)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_RX_GENCTRL1, 0x1100)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_RX_LOS_CTRL0, 0x000e)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MPLL_CTRL0, 0x0100)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MPLL_CTRL1, 0x0032)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MPLL_STS, 0x0001)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MISC_CTRL2, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_LVL_CTRL, 0x0019)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MISC_CTRL0, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MISC_CTRL1, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_DIG_CTRL2, 0)
> +        CHECK_REG_PCS(NPCM_PCS_VR_MII_DIG_ERRCNT_SEL, 0)
> +    }
> +
>      qtest_quit(qts);
>  }
>
> --
> 2.42.0.655.g421f12c284-goog
>
>

--0000000000008a9bee0607f2ac05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 17, 2023 at 4:04=E2=80=AF=
PM Nabih Estefan &lt;<a href=3D"mailto:nabihestefan@google.com">nabihestefa=
n@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Nabih Estefan Diaz &lt;<a href=3D"mailto:nabihestefan@goo=
gle.com" target=3D"_blank">nabihestefan@google.com</a>&gt;<br>
<br>
=C2=A0- Add PCS Register check to npcm_gmac-test<br>
<br>
Signed-off-by: Nabih Estefan Diaz &lt;<a href=3D"mailto:nabihestefan@google=
.com" target=3D"_blank">nabihestefan@google.com</a>&gt;<br></blockquote><di=
v>Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@g=
oogle.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
---<br>
=C2=A0tests/qtest/npcm_gmac-test.c | 134 ++++++++++++++++++++++++++++++++++=
-<br>
=C2=A01 file changed, 133 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/npcm_gmac-test.c b/tests/qtest/npcm_gmac-test.c<br=
>
index 84511fd915..1f0ad664f4 100644<br>
--- a/tests/qtest/npcm_gmac-test.c<br>
+++ b/tests/qtest/npcm_gmac-test.c<br>
@@ -20,6 +20,10 @@<br>
=C2=A0/* Name of the GMAC Device */<br>
=C2=A0#define TYPE_NPCM_GMAC &quot;npcm-gmac&quot;<br>
<br>
+/* Address of the PCS Module */<br>
+#define PCS_BASE_ADDRESS 0xf0780000<br>
+#define NPCM_PCS_IND_AC_BA 0x1fe<br>
+<br>
=C2=A0typedef struct GMACModule {<br>
=C2=A0 =C2=A0 =C2=A0int irq;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t base_addr;<br>
@@ -111,6 +115,62 @@ typedef enum NPCMRegister {<br>
=C2=A0 =C2=A0 =C2=A0NPCM_GMAC_PTP_STNSUR =3D 0x714,<br>
=C2=A0 =C2=A0 =C2=A0NPCM_GMAC_PTP_TAR =3D 0x718,<br>
=C2=A0 =C2=A0 =C2=A0NPCM_GMAC_PTP_TTSR =3D 0x71c,<br>
+<br>
+=C2=A0 =C2=A0 /* PCS Registers */<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_CTL_ID1 =3D 0x3c0008,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_CTL_ID2 =3D 0x3c000a,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_CTL_STS =3D 0x3c0010,<br>
+<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_CTRL =3D 0x3e0000,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_STS =3D 0x3e0002,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_DEV_ID1 =3D 0x3e0004,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_DEV_ID2 =3D 0x3e0006,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_AN_ADV =3D 0x3e0008,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_LP_BABL =3D 0x3e000a,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_AN_EXPN =3D 0x3e000c,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_MII_EXT_STS =3D 0x3e001e,<br>
+<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_ABL =3D 0x3e0e10,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_LWR =3D 0x3e0e12,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_UPR =3D 0x3e0e14,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_LWR =3D 0x3e0e16,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_UPR =3D 0x3e0e18,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_LWR =3D 0x3e0e1a,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_UPR =3D 0x3e0e1c,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_LWR =3D 0x3e0e1e,<br>
+=C2=A0 =C2=A0 NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_UPR =3D 0x3e0e20,<br>
+<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MMD_DIG_CTRL1 =3D 0x3f0000,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_AN_CTRL =3D 0x3f0002,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_AN_INTR_STS =3D 0x3f0004,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_TC =3D 0x3f0006,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_DBG_CTRL =3D 0x3f000a,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_EEE_MCTRL0 =3D 0x3f000c,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_EEE_TXTIMER =3D 0x3f0010,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_EEE_RXTIMER =3D 0x3f0012,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_LINK_TIMER_CTRL =3D 0x3f0014,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_EEE_MCTRL1 =3D 0x3f0016,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_DIG_STS =3D 0x3f0020,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_ICG_ERRCNT1 =3D 0x3f0022,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MISC_STS =3D 0x3f0030,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_RX_LSTS =3D 0x3f0040,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_TX_BSTCTRL0 =3D 0x3f0070,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_TX_LVLCTRL0 =3D 0x3f0074,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_TX_GENCTRL0 =3D 0x3f007a,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_TX_GENCTRL1 =3D 0x3f007c,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_TX_STS =3D 0x3f0090,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_RX_GENCTRL0 =3D 0x3f00b0,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_RX_GENCTRL1 =3D 0x3f00b2,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_RX_LOS_CTRL0 =3D 0x3f00ba,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_MPLL_CTRL0 =3D 0x3f00f0,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_MPLL_CTRL1 =3D 0x3f00f2,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_MPLL_STS =3D 0x3f0110,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_MISC_CTRL2 =3D 0x3f0126,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_LVL_CTRL =3D 0x3f0130,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_MISC_CTRL0 =3D 0x3f0132,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_MP_MISC_CTRL1 =3D 0x3f0134,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_DIG_CTRL2 =3D 0x3f01c2,<br>
+=C2=A0 =C2=A0 NPCM_PCS_VR_MII_DIG_ERRCNT_SEL =3D 0x3f01c4,<br>
=C2=A0} NPCMRegister;<br>
<br>
=C2=A0static uint32_t gmac_read(QTestState *qts, const GMACModule *mod,<br>
@@ -119,6 +179,15 @@ static uint32_t gmac_read(QTestState *qts, const GMACM=
odule *mod,<br>
=C2=A0 =C2=A0 =C2=A0return qtest_readl(qts, mod-&gt;base_addr + regno);<br>
=C2=A0}<br>
<br>
+static uint16_t pcs_read(QTestState *qts, const GMACModule *mod,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 NPCMRegister regno)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t write_value =3D (regno &amp; 0x3ffe00) &gt;&gt; 9;<=
br>
+=C2=A0 =C2=A0 qtest_writel(qts, PCS_BASE_ADDRESS + NPCM_PCS_IND_AC_BA, wri=
te_value);<br>
+=C2=A0 =C2=A0 uint32_t read_offset =3D regno &amp; 0x1ff;<br>
+=C2=A0 =C2=A0 return qtest_readl(qts, PCS_BASE_ADDRESS + read_offset);<br>
+}<br>
+<br>
=C2=A0/* Check that GMAC registers are reset to default value */<br>
=C2=A0static void test_init(gconstpointer test_data)<br>
=C2=A0{<br>
@@ -129,7 +198,12 @@ static void test_init(gconstpointer test_data)<br>
=C2=A0#define CHECK_REG32(regno, value) \<br>
=C2=A0 =C2=A0 =C2=A0do { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmphex(gmac_read(qts, mod, (regn=
o)), =3D=3D, (value)); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
+=C2=A0 =C2=A0 } while (0) ;<br>
+<br>
+#define CHECK_REG_PCS(regno, value) \<br>
+=C2=A0 =C2=A0 do { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(pcs_read(qts, mod, (regno)), =
=3D=3D, (value)); \<br>
+=C2=A0 =C2=A0 } while (0) ;<br>
<br>
=C2=A0 =C2=A0 =C2=A0CHECK_REG32(NPCM_DMA_BUS_MODE, 0x00020100);<br>
=C2=A0 =C2=A0 =C2=A0CHECK_REG32(NPCM_DMA_XMT_POLL_DEMAND, 0);<br>
@@ -180,6 +254,64 @@ static void test_init(gconstpointer test_data)<br>
=C2=A0 =C2=A0 =C2=A0CHECK_REG32(NPCM_GMAC_PTP_TAR, 0);<br>
=C2=A0 =C2=A0 =C2=A0CHECK_REG32(NPCM_GMAC_PTP_TTSR, 0);<br>
<br>
+=C2=A0 =C2=A0 /* TODO Add registers PCS */<br>
+=C2=A0 =C2=A0 if (mod-&gt;base_addr =3D=3D 0xf0802000) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_CTL_ID1, 0x699e)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_CTL_ID2, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_CTL_STS, 0x8000)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_CTRL, 0x1140)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_STS, 0x0109)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_DEV_ID1, 0x699e)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_DEV_ID2, 0x0ced0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_AN_ADV, 0x0020)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_LP_BABL, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_AN_EXPN, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_MII_EXT_STS, 0xc000)=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_ABL, 0x0003=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_=
LWR, 0x0038)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_=
UPR, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_=
LWR, 0x0038)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_=
UPR, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_=
LWR, 0x0058)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_=
UPR, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_=
LWR, 0x0048)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_=
UPR, 0)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MMD_DIG_CTRL1, 0=
x2400)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_AN_CTRL, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_AN_INTR_STS, 0x0=
00a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_TC, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_DBG_CTRL, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_MCTRL0, 0x89=
9c)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_TXTIMER, 0)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_RXTIMER, 0)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_LINK_TIMER_CTRL,=
 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_EEE_MCTRL1, 0)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_DIG_STS, 0x0010)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_ICG_ERRCNT1, 0)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MISC_STS, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_RX_LSTS, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_BSTCTRL0, =
0x00a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_LVLCTRL0, =
0x007f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_GENCTRL0, =
0x0001)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_GENCTRL1, =
0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_TX_STS, 0)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_RX_GENCTRL0, =
0x0100)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_RX_GENCTRL1, =
0x1100)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_RX_LOS_CTRL0,=
 0x000e)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MPLL_CTRL0, 0=
x0100)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MPLL_CTRL1, 0=
x0032)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MPLL_STS, 0x0=
001)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MISC_CTRL2, 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_LVL_CTRL, 0x0=
019)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MISC_CTRL0, 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_MP_MISC_CTRL1, 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_DIG_CTRL2, 0)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_REG_PCS(NPCM_PCS_VR_MII_DIG_ERRCNT_SEL, =
0)<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0qtest_quit(qts);<br>
=C2=A0}<br>
<br>
-- <br>
2.42.0.655.g421f12c284-goog<br>
<br>
</blockquote></div></div>

--0000000000008a9bee0607f2ac05--
