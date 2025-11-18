Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D276CED25D
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 09:49:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLILA-0005Yc-6J; Tue, 18 Nov 2025 04:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vLIL8-0005Xt-UF
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 04:49:34 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vLIL7-0002fb-D9
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 04:49:34 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so293843466b.1
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 01:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763459372; x=1764064172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJQ8tpBuyZ5+9y3u/flqoPxP6xI1/ckz4rUo0h6WcHw=;
 b=W5cxSfl4R+TQ/ZFXOdKV+cE+dYVz/5lpEIRcizMRvB2k2kXQv2bGTMC4PGWjkNAwtD
 AIjn+KDfczXARQleQwZI8LK+2Ft8ODY6dDX2x1l+G1Uhn7avj3umsLCK+v5MrzT/fJq1
 gv+Uob1/J2RGhhNF/TOwI1MVYdkPCCwWcgmo9Rcs3Z2383rlfjI7VyEwyJXBX46Ob8lI
 vYJYc3StQGkwIZodoMUCf3PclNSo7h2PrvXeqE3t7iPFlwWCF24338irXYcMClL2MYwh
 nz+7Jz5MRSCA2yZMdGC4Fuc4/jpZ8qkIzxRUWvdrBctXXr1hj5vfEn8yu8sBDpaGGJEe
 KXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763459372; x=1764064172;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iJQ8tpBuyZ5+9y3u/flqoPxP6xI1/ckz4rUo0h6WcHw=;
 b=xIziUvBnCfkvwAAMLPPohMl38pxRembjMCVadeRZfweK1mELDAuBZSY4LsAS/ACCnD
 eXVpN65uBdfHdUySMhTeEa+JLoc47DFb704go45HMVOskU0sagBeGXXFZeix5Ij/bGkI
 q86rc/RsQVehlcFlUSIQ9QXs1TayBsCLmO9Nbi0sKLFn5QS7pfTq7eGp6OId8hzNuBSk
 WtFPgtDd2AvfgLt5ykTxNtDIq52EKr/HX1pKUvI0BW8HQHHjJqrasFJnENQzCSz4ZsTX
 k9q6OcDSUh9dq2lQcLiRaoKLNIis8EIJ2tvmLDFsm2O/7OtjOelf42y3ifXCUePUn/lG
 4ahw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Ud5ONU7LFaAEXUUV5DDWcj5I0NLfF3vPAOIeKHk62w3V3oVX7c49l3dUzRQq8aKeexFMkhumQw==@nongnu.org
X-Gm-Message-State: AOJu0YxaeB8NgMm73qTdRSgzcREhGpKLty2kwRgDSglDVGxHUrj5GY+a
 EZFJp/IQojCrGg0hxgJWKhptfs3rzORrb5tQRzT8mVu8rSu30rPbcCL4
X-Gm-Gg: ASbGncsyBUxKUhsGT1/EDUydcbsnw1Zm6YKb/PWDzkMcmou3MqjxKNRtgvbSss4q5UW
 OqjYMOblwnaKhep99TFv73C6M13LuCdgSQg9QfyYGa4Le/54zG57n4N04AMbbv1OvUhDkNrK2ey
 L8X8kxERr4VyU056cnnmHSLEN0A3SgGVw493FsoiciHuzxk5pNng7RENBM8k6SbdyxgZCaJaEkf
 +Pq95rz6YusODHFU43HkAPvhnGTuj1E09VTewJCibQaYYfPE3Y4ZELHd3R0E2FdXi/idJdHomg9
 zeCthDiOkjeBIvDOgxujJKNlbRvEqQXVc1HmKhmsMiPW4B94COsLyVco14z2Bp+wanynYaxPZrW
 BzSHNfk26jnUTL7CSO20Enfb9//bNIv+0eK4rvMHz/DFiRDroXvPPvQnctWX2UQ9lBrcWOawnPY
 eV/b4Yxw6dQ3WC90b07Q==
X-Google-Smtp-Source: AGHT+IEpU2I5/6HyR/jp3nIFK5hdxBgAx+FEDEcN5ib8wOCZ8ZP2ek80uPzugY2X9L1XIKaJC3t0eg==
X-Received: by 2002:a17:907:944d:b0:b2a:47c9:8ff5 with SMTP id
 a640c23a62f3a-b758bb55b15mr317505466b.10.1763459371558; 
 Tue, 18 Nov 2025 01:49:31 -0800 (PST)
Received: from ehlo.thunderbird.net ([90.187.110.129])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73783ef841sm929777366b.46.2025.11.18.01.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 01:49:30 -0800 (PST)
Date: Tue, 18 Nov 2025 09:49:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
CC: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/2] hw/arm/imx8mp-evk: Add KVM support
In-Reply-To: <CAFEAcA_XORdwONC2YbVKPois6BLPEr0dFt_QjTHE=UWmiCiv-g@mail.gmail.com>
References: <20251101120130.236721-1-shentey@gmail.com>
 <20251101120130.236721-2-shentey@gmail.com> <87v7j8r399.fsf@redhat.com>
 <CAFEAcA_XORdwONC2YbVKPois6BLPEr0dFt_QjTHE=UWmiCiv-g@mail.gmail.com>
Message-ID: <2EAC1B70-89DE-4694-A4E8-350DC6F9C343@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 17=2E November 2025 17:38:03 UTC schrieb Peter Maydell <peter=2Emaydell=
@linaro=2Eorg>:
>On Mon, 17 Nov 2025 at 17:13, Cornelia Huck <cohuck@redhat=2Ecom> wrote:
>> Running current master (resp=2E with this patch applied), I'm getting m=
ake
>> check failures on an aarch64 (Mt=2E Snow) host ("qemu-system-aarch64:
>> unknown type 'arm-gicv3'" while using this machine); going back right
>> before this patch, everything works fine=2E Haven't tried to debug this
>> yet (maybe I'm the one with the weird config again=2E=2E=2E)
>
>Is this a KVM-only config (no TCG) ?
>
>I think this happens because the KConfig now says
>+    depends on TCG || KVM
>
>but because the machine by default doesn't use KVM then
>trying to run the machine with no extra arguments falls
>over if TCG isn't present=2E
>
>This thing we put in to handle "creation of the SoC object
>via device introspection means it doesn't have an ms->cpu_type
>to look at":
>
>+    const char *cpu_type =3D ms->cpu_type ?: ARM_CPU_TYPE_NAME("cortex-a=
53");
>
>also probably won't do anything useful under a KVM-only config=2E
>
>I think the simplest thing here is to put the KConfig back to:
>
>  depends on TCG && AARCH64
>
>People building a KVM-only config almost certainly do not
>want this machine type and its devices, because the main
>reason to build KVM-only is because you're in the
>"virtualization use case" and want to not build in a
>load of not-security-supported machine types=2E

Do we need this treatment for further machines, e=2Eg=2E isapc, e500, mips=
? Or shall the CPU type handling in the SoC consider kvm_enabled()?

Best regards,
Bernhard

>
>thanks
>-- PMM

