Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp813032njb;
        Fri, 13 Dec 2024 16:07:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWK2K16Q0Kc8j8msW1WfxojwvMu7qp6VbrCToF2IAd9ql2VWMMPrMlYoye7hEqtxGufyyeyayFfIJ18oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF6lb4AMZKsPt1VXN9nNqn7jUDUMyBFOwBNIJNKwZ4qHIcUjclIMZLQP2aEC2zMwA45iG47
X-Received: by 2002:a05:6214:1316:b0:6d8:8f14:2f5c with SMTP id 6a1803df08f44-6dc8ca93ca1mr76435626d6.23.1734134828658;
        Fri, 13 Dec 2024 16:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734134828; cv=none;
        d=google.com; s=arc-20240605;
        b=M3XWSku6YC6TeQdyXh2UtObP44p4VUsgB3AujkX44i7WmfrbI4c8zo5RxOmCaxG+DO
         /Mib0aofJKW+UkQp9exM+1Lt7731wlnLXpBH7ruHQtdS455zuGOLfKA5il/lNf/rUnq7
         RUVuMJrNQNDC/0b/dLCjIH2O/kkiI/Dx/d8LNWitbdqEwI7I9+gdYgwhkX4G0OmwkW44
         k1/jS4a3xJ8QelVSQcFgFjWeBXbW1rr+eyPzZ0oTlqi70E3uL3XMRQ5JmChbpYkgC77R
         LYXO0BXufIIs9cVTLLqZQ120V/ViuDIWEYZTD2akfDi7/gJaLXrg9kNDs2tTymwC0DJw
         DRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=s3baxnvsv0QDjdbqpZIjo+pfDf0zddAKGBM4vYP+R4s=;
        fh=yb65Y4mOsOpySLQkrPBnAbzbJR9+e2xFX8Blo8Hv8VQ=;
        b=NQhEss0p/o9DQDEKUPkpH2l6vZS07CpJ8O5JHNDmWcOB3oMDi3Nr0gjZBafgKnni6k
         pGIIu3APg05DCT0v4hs+tiYjQ8ad4gbkzTkhIvyCqGEDRKlZ6F8zw57v3DoiaIHOJG6s
         +7S6TBKTf1cSqTcpca0ZwnntBd+v6lpijEcdkOzLXykhss6fwEoXOo3QnYn+I25bkptR
         4tkFkL3nIsednjm0Mrsh9yEZ7p21fMQzisV2+1JQTNsofaMkc/4LS4qRhKt2bC/a/cL3
         bgVVDclexYY9b2aBX0dm8oiMaTnyDzIz2NX/h9HQ7gMoKT9cGiE4CfonX1Al1Sdf3a0l
         zLVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=AJ1SV70n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=igalia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2eebf0dsi8416711cf.492.2024.12.13.16.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 16:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=AJ1SV70n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=igalia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMFg4-000501-2b; Fri, 13 Dec 2024 19:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1tMFfp-0004sH-9M; Fri, 13 Dec 2024 19:06:23 -0500
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1tMFfj-0005h9-Bp; Fri, 13 Dec 2024 19:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s3baxnvsv0QDjdbqpZIjo+pfDf0zddAKGBM4vYP+R4s=; b=AJ1SV70n7ay56Wph5Xdsr6p6Fi
 ypQHjAi5++9f6K3K8cMFXVCH2s7dvz+JMkaIlBo/lK9PaeDMNi/Q38Sf5hfM4hllCFstq43GI3JIs
 calJyadqr4UGXbq8Y2sW2/hu/MZNMWw46Zc9M5goyZaQtwdZCeR99GZjBBAinedWfQeEgm/T4miw9
 ZTt+YioIM0tfkuWx3koJEJp+NbnzFzNJO4bQjV05qs8YzDJ09d3TCdIMIcpYb3egXDwr+f4ofM95g
 GhRivEcAA2t/BPOBkuZNquIHG/zCQrdwQ3XsDHwrjeYdqxmhmeJPdToREXKyQKnj+itqMXjmg7WH8
 yJISu/bg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tMFes-002sgk-73; Sat, 14 Dec 2024 01:05:22 +0100
Received: from gate.service.igalia.com ([192.168.21.52])
 by mail.igalia.com with esmtp (Exim)
 id 1tMFeq-007HeJ-9B; Sat, 14 Dec 2024 01:05:22 +0100
Received: from berto by gate.service.igalia.com with local (Exim 4.96)
 (envelope-from <berto@igalia.com>) id 1tMFeq-007aKe-0O;
 Sat, 14 Dec 2024 00:05:20 +0000
From: Alberto Garcia <berto@igalia.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, "Michael S. Tsirkin"
 <mst@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>, =?utf-8?Q?Cl?=
 =?utf-8?Q?=C3=A9ment?=
 Chigot <chigot@adacore.com>, Frederic Konrad <konrad.frederic@yahoo.fr>,
 Thomas Huth <huth@tuxfamily.org>, Joel Stanley <joel@jms.id.au>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Vijai Kumar K <vijai@behindbytes.com>, Bin
 Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas
 Piggin <npiggin@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, Amit Shah <amit@kernel.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "open
 list:Raspberry Pi" <qemu-arm@nongnu.org>, "open list:OpenTitan"
 <qemu-riscv@nongnu.org>, "open list:S390 general arch..."
 <qemu-s390x@nongnu.org>, "open list:sPAPR (pseries)"
 <qemu-ppc@nongnu.org>, "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 20/71] hw/char: Constify all Property
In-Reply-To: <20241213190750.2513964-25-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-25-richard.henderson@linaro.org>
Date: Sat, 14 Dec 2024 01:05:20 +0100
Message-ID: <w511pybi0xr.fsf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: 6
X-Spam-Bar: /
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine2.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZwUdx7eL1hL0

On Fri 13 Dec 2024 01:06:54 PM -06, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alberto Garcia <berto@igalia.com>

Berto
