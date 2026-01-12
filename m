Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFE3CF45A4
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 17:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfLKk-0006pu-Tf; Mon, 12 Jan 2026 12:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfLJK-0006Mo-KZ
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 12:02:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfLJJ-0006Ca-6l
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 12:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768237352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rKFUdQx23abFlJVm0uQPQFiuDu8lmtmxqOTgmBnKZI=;
 b=EN/mLACyTo+RJ0aTPAg/BTaaoffKHpDROrgzsFWCRx+SC4kzGwHwUTCV2JrHXjYYs9sgEr
 aI+aGphlzu/dAKt3G2LOiPzJIWqBqJWc+mGonaY66E8pus/BeKXJICXscKVWmkrY2BxQoD
 WlweRHOvyeDh8DMAige+YldLgvxFcUk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-XGBfLQTAMGarBuddje8V1g-1; Mon, 12 Jan 2026 12:02:30 -0500
X-MC-Unique: XGBfLQTAMGarBuddje8V1g-1
X-Mimecast-MFC-AGG-ID: XGBfLQTAMGarBuddje8V1g_1768237349
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477bf8c1413so44795615e9.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 09:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768237349; x=1768842149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7rKFUdQx23abFlJVm0uQPQFiuDu8lmtmxqOTgmBnKZI=;
 b=XVsnIckq//bqfKvgJAhcOVuvCK6iMqDG3peTePxtoejItsl3nTEucbM+joQefs0dGr
 AfIO6HSv1Mal+nrUq9pkC3rM+oZs03GmIN+HpIs7/cD3Mk4SULRYTUr/MBI0772wbrwP
 sqXXjNufBlpPloQj6ytsuSUX0tlq384KMx1JyZkL325Etcktb1ZGMIBer2Oqfxh4NQ78
 JMvszNwrF5njGCcogZmDj5J0tk0Es5jbIT4XTRA+MxMSbzcgXTihG+OpWBYFs9+9OL11
 IyaPWSIaZPPOFkNdNMQQJZsICgtUDZauwk7YQz3izuBuv4U74tIUgESJXWMw0dl5DwkY
 p1OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV95KE+P0jX1bEYa75XXvZKEIbFgw5id9+zTAL6//coYnCa1+g+7fJ45nkKNwp7djf0niqqF64yPw==@nongnu.org
X-Gm-Message-State: AOJu0Yy/g20Pq7V6OvDQulEXtBXcAR/lvWzOVuxckS2K5U3hy/kB9hA5
 cp6Mo2y/SlA1qxV2C30CAYoBRCgTzWez0CGa7Uk8eil31J5KK5ZXDPzYaWXzDgQGDN2K0VyU0xu
 LAPAFIEmDQ18bFqy38tTjaAA+5GPDROyMfVACgfUFUmMfymhjRiRBAmL25DJ52GflymAJblP8kt
 6DUeb/14CzdAcEN3y1nDN1QIrQtJgp
X-Gm-Gg: AY/fxX7mwFSoIXpgjOShV7cQaAoLx2+SRpZ8rEqqepaoty1pNusA+g1qZwOSG/QE+ow
 UK2/dBKa0TwbUGbDEtEP7LHnrvhMZ9AO250aQ/hnD7Wb8Wptvmd4UpWLHfRRhxnrb6idGVetjbl
 v+oISVu+wX0TARZ8sG+Hb0xbz1QHmYP2zdnvSpGNkLtjRU+aiFCb/N5PtjIhc7hJT5vvw4GKN30
 213tinIAUD8mFrx/ZJoi5fwy/4FK5AvkGsPT/zMwBTLH0biC/YCaaohDnpsoTzkqN2L2w==
X-Received: by 2002:a05:600c:4e8a:b0:479:2a09:9262 with SMTP id
 5b1f17b1804b1-47d84b18037mr244900425e9.9.1768237349459; 
 Mon, 12 Jan 2026 09:02:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUkrA/EFIxVDM9YasT0A251/Gyn1594BDFpmWhdj7boyiZzv/zO4AO7cbSLgAcvcRPwuDBrYXkZ0Raazwm8y8=
X-Received: by 2002:a05:600c:4e8a:b0:479:2a09:9262 with SMTP id
 5b1f17b1804b1-47d84b18037mr244899935e9.9.1768237349058; Mon, 12 Jan 2026
 09:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20260112132259.76855-1-anisinha@redhat.com>
 <20260112132259.76855-5-anisinha@redhat.com>
In-Reply-To: <20260112132259.76855-5-anisinha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Jan 2026 18:02:17 +0100
X-Gm-Features: AZwV_QiPnwcipYRTdzj7RyQ4o9zK-24ynHKg3jtYwESKklZ6rTj1MR4pRLLSp6w
Message-ID: <CABgObfbDTAvm6E0imC=HSm2=BAC4rzUDmuHcoUbVjJ-YeXFw-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/32] accel/kvm: add changes required to support KVM
 VM file descriptor change
To: Ani Sinha <anisinha@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, 
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bs9RrV1XuODXeHaqPABepV0mxuSqkFVdAGm4UEmsbGE_1768237349
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Jan 12, 2026 at 2:23=E2=80=AFPM Ani Sinha <anisinha@redhat.com>:
 > +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)

Weird name since there are no "operations". Maybe kvm_arch_on_vmfd_change?

Paolo


