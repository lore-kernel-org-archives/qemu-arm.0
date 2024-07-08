Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2725072njb;
        Mon, 8 Jul 2024 07:26:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcDqNn4Bav80WHS/DojBBzcOBzO2zjWwo1UNpqZAzHDQ0feZM6Gtmkm2ot0hzdYjczcFHcDYOOePiL59XDEyZBsXCJ6GkU
X-Google-Smtp-Source: AGHT+IGCV9WFvnGW79vjQxIRHZFwaTICMVkEjPukMEWUWROM6q+K2NGf03lsUL/zJUvChuRnzu7Y
X-Received: by 2002:a05:6122:3781:b0:4ec:f8b1:a34b with SMTP id 71dfb90a1353d-4f2f3f10334mr12868072e0c.8.1720448793003;
        Mon, 08 Jul 2024 07:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720448792; cv=none;
        d=google.com; s=arc-20160816;
        b=A2SfjlDM9Z+2sMYxby6ddFB84IFjNrESA7fUlolFjlfAG/gC38QDILk8LEOkHfy20R
         Hqh6vw7Xq4Sa11Fsq8tC6xEoCFiIE+QQ8NTmwEEpsy7Dnf0kvV9geHrF/5SJRIpNdTBi
         l7Npqf3HLZBp9BHKC2F0/Ju4hiA78Jqp/BbcULiVBcFzbi8FVk3kiN39479q7RfEgqBj
         HvPUnmc1lSFv0kntw807Fd5wOs3Ojo9vK2coO/7hEQNbE2dglJTvYLKJ2s4cI7lh64y4
         /FtHlnwSXYsTKRMb4Ir9pIOrDbbpsThHzWxg9YHH+VM9J5+WviokX166oV/NlOBG+CHV
         CTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=62pq1SIFDKjIXIXOgcgF+DnxBDPzl/esRPeShLoiKf0=;
        fh=OEOrVDeodf/DvOGAXR8/e4hKonofUFu9wBXCzY42yRo=;
        b=Q3qcBro16PQiVr2g2EvWOQe11ytBGcW74SMulLTs0VNdrN/LJ2gRBwsz5Y/nSOTWU6
         BtXGSv3KDYLCsfFuTfLFAvC1U7HrSt9gGA7INtdRcbjMlhA5x9YbtguaKwVG/UqPX1mT
         G9jvhNpaABVTVoalvB2+d7WMnAd7vZfnhs7IgVMRJRAEQ7HuWEOkxlPQRpI+BE7nKHx5
         nhPeSXnpi42axICXfeU7CZO9+0j99sxUcoBm6KxWKxFn/8ZRM+L29QljqVbfMHqTNNM9
         IxfLmaJ2+5ECSwW8ddBQyHZUNPZkxCJeWZjmoOth0IzJYA+nHQvRqNguCIE+5Qzsg9b7
         FDqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPRc567z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f32fde15si14219371cf.364.2024.07.08.07.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2024 07:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPRc567z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQpJO-0005tf-El; Mon, 08 Jul 2024 10:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sQpJJ-0005r3-F0
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 10:25:45 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sQpJG-0000Ou-Fy
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 10:25:45 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so5077768a12.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2024 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720448740; x=1721053540; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=62pq1SIFDKjIXIXOgcgF+DnxBDPzl/esRPeShLoiKf0=;
 b=lPRc567zEX6vpYECdg7C3zPWgJunkmoO+wQFBeLYo5hvTVdnUDiDvfWwwXXq84C8zH
 Yr7RhkQDo8oUGd72SEy2Qy5pZWFRuLS7KIk3C8immC6BoIR/W4BUMlDPLXBwfTKs/USj
 5nLeG5fK4hK7tKuJArV8smilFsEDOy7PBBLXpK8a7LaXExxmmdeBt5fwIYU0deMIdfDd
 bapMrrrTnlkgAhcxFx0yfk0M5yIKA/ikU76OV/XVSVewnMl+c5i4T9MMSkclREq///Wi
 CWp4lF5L9X2NuXysI2Wx14lAfXYQYjxQWDY/ENRcHK16e2eQoki6KItmCQ4bodwi6X3f
 stMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720448740; x=1721053540;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=62pq1SIFDKjIXIXOgcgF+DnxBDPzl/esRPeShLoiKf0=;
 b=G9jxCOVD1TVBSm45RlXq6XKgFsT82DZHJv6XZPM68rebZVDjhBfsyCyxqeOLX14FkS
 stGG6ulVhKRA2puQmM4mTKm6o5Q6JcB4JMTbDSrjZdpao68iEwNPYz+L1uupdgVvz9pj
 wgtksXXjqtVP0i6ywOsG35csxTP4FAbeA3N7hvUiRjg+7JImWenIKITpnqNLVWduGcgt
 16WteAes0i8rb6YFEy/rYJM1Xmh2e28RQzxg3GoKRxNYTnq3l+hKWumwfs93UazTD6Yq
 5cls9xDBas1ys1L7BYWPQxVA8tZNBe1IqU89qglAupcZPmBAwYA2XHjq6ZkLNFaKDIBt
 VP9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXTL8dosSc3Nqsaebwf0nBoRxjRdKMA+A3MABXDKDRd1PTUIvVWVJ4s3RsFAHnLP8qiqrH4jbszejvAFrKHeFfyUFt
X-Gm-Message-State: AOJu0YyOKx4JNISFPxUA3i/FSQdCXdGrRhKufcbZ4m8D9h8u/tm0sCp9
 V3hHuVkhKjrnh8xkEHV7wYQ5hXLm6X6l0AFC8/F/tL2s+PoBRwMOvz1A5/5j35/Hz2miyMycbvZ
 jNL587THj+sFBs6KyiuPjOaVfcAtgdyumJHSQeg==
X-Received: by 2002:a05:6402:51cd:b0:58f:cf2b:6707 with SMTP id
 4fb4d7f45d1cf-58fcf2b682dmr6835361a12.25.1720448740067; Mon, 08 Jul 2024
 07:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
In-Reply-To: <20240702234155.2106399-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jul 2024 15:25:28 +0100
Message-ID: <CAFEAcA9+EP88kUB_3qpiFdsf1Lqb1NmbqM=+hNaC_5=kYWiJ9w@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Fix unwind from dc zva and FEAT_MOPS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 iii@linux.ibm.com, david@redhat.com, balaton@eik.bme.hu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bxGOe+xwuvaM

On Wed, 3 Jul 2024 at 00:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While looking into Zoltan's attempt to speed up ppc64 DCBZ
> (data cache block set to zero), I wondered what AArch64 was
> doing differently.  It turned out that Arm is the only user
> of tlb_vaddr_to_host.

riscv also seems to use it in vext_ldff(), fwiw.

-- PMM
