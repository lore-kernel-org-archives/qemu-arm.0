Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp37058ejb;
        Wed, 15 Feb 2023 18:05:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9u6By0pUqlKytVeujGQLIGPtW6fD0xP1XXYDw5IKZdD1jHHINhIJ3FefnJXnkZVMI697GK
X-Received: by 2002:a05:622a:2c7:b0:3bb:7702:97f5 with SMTP id a7-20020a05622a02c700b003bb770297f5mr7588070qtx.15.1676513154713;
        Wed, 15 Feb 2023 18:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676513154; cv=none;
        d=google.com; s=arc-20160816;
        b=S0NTT/n3TDaT7CGvktFPVnZ8f5z001C21tjz1UR2q96WpySq/BGAOdD5w9qocU+DL5
         ek5YyIL2u8DQXXUfPcU64UkSEKI6hyK8q+YjOsKDdeG38/EY7Ue7rWhsAE4Hmj9Z2xaT
         x5C9XRKnM2+UHRkBW2A68V1ouzEM+CL9PjlCl0WFVva1wURAJ/GnlAr04m9QXrF3SpWQ
         u7TFkVObmCrJ3nMtpASkDDTVAj+KdCMvKumdaL9MTLFs5zorlFpowyXTchX8qJUqP+6V
         N6j0swaVNw2D9ritCd1KEMgNzr66MYErZGz+uPrppl1p7APOVBB+w7yrtQxCuXber+yU
         mqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:content-disposition
         :mime-version:mail-followup-to:message-id:subject:to:from:date;
        bh=Qf2evU4qHgxA92P6yrcybedYnppIHsCkoFc/87HvnVk=;
        b=LDP/t/7BJSz/VgNpotZzLaY3fusRIjVF8wIJZOgnv5/erhBLuU1XJaEIis6ykbJfYj
         hxCafl+kJ4q6p1VEEUYJZe3zfoGAzKIvmBrM0iVHfMYW6zOKhfeVZ/32b5xD+mkKrFsk
         NQliA73iwdCbzK7nozsS7Ztz5pEa20OvyyoIz/eDIWrJrrL7PsjdFXlHVesvV5rrFl6u
         E1sxKbzw+OpcdrEmsVm2vK7nrFW4/3VsHmZ8MSPcAwEu/Bp1mdzB41GK/9DyyDiD0lD5
         p71XdsuAtXuv7g+sOg7mvk+sflO5+LwOkCIRrdjQP14UaIj1xgg7ijoXoYT0gMveP7pe
         qEYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020a05622a05d000b003b9a3e7e113si409238qtb.87.2023.02.15.18.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 18:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSTeY-0001T1-HV; Wed, 15 Feb 2023 21:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmg@gold.funkthat.com>)
 id 1pSRwc-0004Lv-Dg; Wed, 15 Feb 2023 19:16:14 -0500
Received: from gold.funkthat.com ([2001:470:800b::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmg@gold.funkthat.com>)
 id 1pSRwX-0001qd-1M; Wed, 15 Feb 2023 19:16:14 -0500
Received: from gold.funkthat.com (localhost [127.0.0.1])
 by gold.funkthat.com (8.15.2/8.15.2) with ESMTPS id 31FNmkqk025715
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 15 Feb 2023 15:48:46 -0800 (PST)
 (envelope-from jmg@gold.funkthat.com)
Received: (from jmg@localhost)
 by gold.funkthat.com (8.15.2/8.15.2/Submit) id 31FNmkJg025714;
 Wed, 15 Feb 2023 15:48:46 -0800 (PST) (envelope-from jmg)
Date: Wed, 15 Feb 2023 15:48:46 -0800
From: John-Mark Gurney <jmg@funkthat.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Detecting qemu from guest on arm/hvf (apple arm)
Message-ID: <20230215234846.GJ95670@funkthat.com>
Mail-Followup-To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: FreeBSD 11.3-STABLE amd64
X-PGP-Fingerprint: D87A 235F FB71 1F3F 55B7  ED9B D5FF 5A51 C0AC 3D65
X-Files: The truth is out there
X-URL: https://www.funkthat.com/
X-Resume: https://www.funkthat.com/~jmg/resume.html
X-TipJar: bitcoin:13Qmb6AeTgQecazTWph4XasEsP7nGRbAPE
X-to-the-FBI-CIA-and-NSA: HI! HOW YA DOIN? can i haz chizburger?
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (gold.funkthat.com [127.0.0.1]); Wed, 15 Feb 2023 15:48:46 -0800 (PST)
Received-SPF: none client-ip=2001:470:800b::2;
 envelope-from=jmg@gold.funkthat.com; helo=gold.funkthat.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 21:05:40 -0500
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
X-TUID: 5nnrSLbd+Tl3

Hello,

I was wondering what the best way to detect that FreeBSD is running
under qemu/hvf on Apple ARM?  FreeBSD doesn't see the ACPI FADT table,
so I'm wondering if keying off of something like the QEMU0002 device
in ACPI is the best way?  Or is there another option?

Thanks for your help.

-- 
  John-Mark Gurney				Voice: +1 415 225 5579

     "All that I will do, has been done, All that I have, has not."
