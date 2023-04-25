Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3344883ejm;
        Tue, 25 Apr 2023 01:34:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zxc5tNudJi5pMpoo/zHMCvhJBETkm2TYF/L0SfNGd80G8L+H7Meti+aTc1g3AsVH//0PMA
X-Received: by 2002:a05:622a:104c:b0:3ea:d941:2435 with SMTP id f12-20020a05622a104c00b003ead9412435mr27828252qte.42.1682411666879;
        Tue, 25 Apr 2023 01:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682411666; cv=none;
        d=google.com; s=arc-20160816;
        b=SuFuJf/DRqph4FMFqDQtVl2GOJaRhZSK8SOUepW8Jc/ySYjnQ8Ar0KyxMVd01vq1i5
         IA8613+FqxEAHWecNaG0ghfyHItAoZ4BfWx0pR1CCknnmXuWzB1OqHNM5jWS0hKt+fOP
         NPSpzWPikSjbYVMkeTCVC3cCDyXBVTUyUboL2w9qYSaRszBKapWbjKYJoTMkVgTDR6Jn
         KGsywO/7W3VLRqHuxKs01fOs9Ixd+z45AHmdT1FugB0/F7sJ9lSTP7LJjchrShVQp+dw
         uZjZABT0DFPMOtatId2G9pDOANlBzcCGkSzmy1BSwmhS100SfcKOrCp19xWsv1SC3YRu
         oP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sfVvmjx4jVX5oKrdZ1dhyTszYlmbskAF8iZOfbAflKA=;
        b=Y0SWdfk2QWnWxGrA7agaX+RDPNzn+joXS6RyVrijNNGhPyukf1T2XFJWFpmbfYQun0
         9kxOLW4QymS/AubaMEqcH8CavRwO9v4/ktY/UfE9XR/4ntbNXQo3bojV1VsHSlig6t6m
         axc2OoKz69K4WgqUKVGltE5Sog++rQ4MZg2YR+Z55BZhxyeR1guFeAR7ucDF07lljOPy
         f74U1BZM+MN1KHK4wzEeAOP91qvV1ExNIm6x50U/7yXq7jZnBFBUIpepXKFWAQllwIM0
         oSxFuQxaSgKJ832Z5cy9iOzynZDNq/mDFJZd93+jYaFEfub0G5sCHvEA2vaXTaB7wUaT
         qQ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZn8lCG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a05622a000c00b003eadeb54286si8695439qtw.458.2023.04.25.01.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 01:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZn8lCG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prE7x-000685-OW; Tue, 25 Apr 2023 04:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prE7v-00067m-Va
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 04:34:20 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prE7s-00061Y-TM
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 04:34:19 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5058181d58dso9688816a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682411655; x=1685003655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfVvmjx4jVX5oKrdZ1dhyTszYlmbskAF8iZOfbAflKA=;
 b=HZn8lCG9SlD2PmTK+J/MfpM4qIAhYUOHrgsj+2RlCZsHPRiXN/RiEblsYVGMx3xWdG
 QErQkpsDmkm3zodVNbxs3ICNlp5fxrMWTEepZWPSk1/Cm2n1deusvUj16b1hd/e2r8vk
 A7zBufF3T8g/hMRlobHCMR+GIp0LBGMM0AUKk+S4abDDLZivKogU19OVNgOeLUb9V+ue
 caEgF27qv/wVCOXaFDMZa8i+YUZPbBM0FPBnILTcb85Oyu8/8gjHHkLhQV8yJSIFwFH1
 HjbMVnj6YEhbnfZv0kb9Zq56/ipgCJ8IVWzbtELuI8kPJOf66SS1ExJhaDFnYbdb0ncX
 mFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682411655; x=1685003655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sfVvmjx4jVX5oKrdZ1dhyTszYlmbskAF8iZOfbAflKA=;
 b=d7wYrh6HP/OWG+PjQI/wWjkdYoqMk4KaMVoqjRRcpl98NLZQ+GtBTTdKQYIRWkH/MJ
 Xf/7ngWzbOyklc92ZfbgvZOdxG8PcHzsUkHQuXL+wsBTqPO56DZISjR8yWvLn0ScNHWf
 k/YOE96/SHZUp+PvJS4tyfF913IdtcgB0U3lCDbs/xVFZIG47D1ZRDDKrIb5AZvOnoBg
 kv9WWDmmYN7w4kkVb5Mo4xcaDWLIwtdoFlKZMXtB7oyuMoP/TyXKrpV0rdZH4nUC6P21
 CBzmACSrppuARaDjrs7QrbxL3VxCB/0+Vo+7YSpHSjV0v3o94R+wNToFEjERnexhlEIP
 jjXw==
X-Gm-Message-State: AAQBX9fKU6zPfqsUpMN7r4kCXQ/euxMSK2I0X4jln00PPhURjP6d8lu4
 rqmaKPsnsQuXAkJXthn7QEsSgi3endDGLB2gvdgK4g==
X-Received: by 2002:a05:6402:890:b0:502:70e9:2c14 with SMTP id
 e16-20020a056402089000b0050270e92c14mr14188787edy.29.1682411655131; Tue, 25
 Apr 2023 01:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
In-Reply-To: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2023 09:34:04 +0100
Message-ID: <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
Subject: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
To: =?UTF-8?B?546L5a6H5rOJ?= <wangyuquan1236@phytium.com.cn>
Cc: qemu-arm@nongnu.org, rad@semihalf.com, quic_llindhol@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: Hatxr/37/7gZ

On Mon, 24 Apr 2023 at 13:33, =E7=8E=8B=E5=AE=87=E6=B3=89 <wangyuquan1236@p=
hytium.com.cn> wrote:
> As a junior OS engineer, I met a problem of initialization of platform-eh=
ci-usb in sbsa-ref recently.
>
> The result of sbsa-acs(UEFI Shell application) on sbsa-ref shows that "Pe=
ripheral: Num of USB controllers: 0".
>
> And I found that the platform-ehci-usb in qemu is a 32-bits DMA device wh=
ile our sbsa-ref machine does not own
>
> DRAM memory below 4G. It seems like a contradiction point.

This definitely doesn't seem like an intentional thing.
What specifically do you mean by "32-bits DMA device" ?
Is our implementation of this device accidentally not
handling addresses above 4GB? Or is the specification of
the device itself limited to 4GB addresses? Or is this a
guest driver problem?

thanks
-- PMM
