Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp2365363lfi;
        Sat, 3 Jul 2021 09:32:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDkh6jH4bgXQOvI4urICC7c/v/4l2f/YPpCMJZGZ/Kq7pWq8OIzhAaBA/lO3NqF630WM+c
X-Received: by 2002:a05:6e02:50c:: with SMTP id d12mr4021367ils.84.1625329973697;
        Sat, 03 Jul 2021 09:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625329973; cv=none;
        d=google.com; s=arc-20160816;
        b=fGZEYf3Pr1HCzYO0ZX8pBN22KVVLVuB7FvlHGatX9Ptbm3zgeOXKVz6jyTPjUDTP0t
         +s+RYCxBB8J39+5ocbBaz8SzKuFmRm8qZpnYFVPvn9HxNCn/VzLA+08YUrylvTEJIyeH
         Q+R/fbMPhPSbHAn3VEr7Kfz1f4056ngvp/nBYFeU9nhrmtBZoMl5FPgf1SfFehxoH/FH
         pIfvfARB+JCgjwY7dGAtuE0+KXlkcQKPGl56/pS0KfK+HLR1r23zTagOje8j2Nv5e8q+
         H9uJp9nPv/jppj/oRPZ3OGwRT9gpnqJYGj2Gx2wUCJ13XrDjEQVmJQBfTZbFuv6CAoLV
         HCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=REGg3QMBdAmIXQp30o/vSn3UkaOQ5OIQAj9pUEbHsp0=;
        b=anJNkYBqSIfm0NaAiyucoWZKRmmIBsHFqwgDfFsFunEgavaxqvatcqnwOhgdm0dHcL
         W7I8bo1mTZ9FFIhTGLQgh+8umD5y5AKb9ai7e3fHH88aKuGH2Xb63f3G00iXMgEpsNzv
         O9l8Fxpf+6ZnhOK2GdaXIk2cNNXRc9WUJP+Aak8nT6XowvqAmFxNZLFT6T27CWWw/Zrh
         sefmFED1d7gEhHyxVwJeGw+TYCQ2rcZMNcLZuyA25SyMxmrCDX49YCMXNlkPQXnBA/w9
         xgA+NVoVubGCIYPuNNT12AuU2EUQsTyqRaCIVKYUQLJ7b+wuspk7G8URk6DaNVEcESF8
         pBhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QiNtA3J3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si8262491ile.135.2021.07.03.09.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jul 2021 09:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QiNtA3J3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lziZZ-0005hS-0Q
	for alex.bennee@linaro.org; Sat, 03 Jul 2021 12:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lziZK-0005eI-6c
 for qemu-arm@nongnu.org; Sat, 03 Jul 2021 12:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lziZI-0002oP-Lu
 for qemu-arm@nongnu.org; Sat, 03 Jul 2021 12:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625329956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=REGg3QMBdAmIXQp30o/vSn3UkaOQ5OIQAj9pUEbHsp0=;
 b=QiNtA3J3wkKDXrknXXip/vcKodFMiIbYWzt0+T4QL7fKDlOzOsiAbSoEhn3klx1gqHthVn
 UlIz4fuGsl9VenGFIKAYrWEaI/7U99UdgaSxBeubZ62xIxKerqal0d9BAoSqkdXNcRfo59
 qCp3kupwAiP+3s6KshJ+Fv83P9lwq3c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ot4y3bfWObmTbaQCtr_4eg-1; Sat, 03 Jul 2021 12:32:35 -0400
X-MC-Unique: ot4y3bfWObmTbaQCtr_4eg-1
Received: by mail-ej1-f71.google.com with SMTP id
 u4-20020a1709061244b02904648b302151so4412780eja.17
 for <qemu-arm@nongnu.org>; Sat, 03 Jul 2021 09:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=REGg3QMBdAmIXQp30o/vSn3UkaOQ5OIQAj9pUEbHsp0=;
 b=ni+zlA3OYru6iGlePv+I+vAjREKGs58PXnea+LvBcin36lRRpN800pjNyU7sXLwwwS
 sTj+YLvB9nvpeRR9UiYU0aDIqqZ/QZw/k9trgaYB74PRcWeGhNOSM3HGZUXvX0N0UT5R
 KyYapsmSfyRFpjJSIj++N6VMR0dDnGWZtCYrc1NhoQ/zP8GPZx36OD5W3vGilFmY/nLS
 jHb1sVkrxDCl0GVrlpZhhS2eLmJM1pxfle4qUcadJJjQ2Wp0zi/nYv2dkrRw8PkZFQP3
 C913bQ1zuW+PqK7VNyAdYQ39hblCdj3Hq3w6jDTmB5qN26vbbrKLXJAQoXb0Zfj2A7tO
 RRUg==
X-Gm-Message-State: AOAM533W7+DoHJo546hiUzf8mbaqmgx1J0ojTgw30AOXGRGHwhrd8e0d
 D3p3btgslGszcQphtJ16QgU+/WmeaJflAQwWs+ngnC9dH6iIRtg7zDxofTtrps6j9iBVzKtR9sj
 bQ/mSoTiJE2YV
X-Received: by 2002:a17:906:5d05:: with SMTP id
 g5mr5074019ejt.201.1625329953952; 
 Sat, 03 Jul 2021 09:32:33 -0700 (PDT)
X-Received: by 2002:a17:906:5d05:: with SMTP id
 g5mr5073993ejt.201.1625329953704; 
 Sat, 03 Jul 2021 09:32:33 -0700 (PDT)
Received: from redhat.com ([77.126.110.253])
 by smtp.gmail.com with ESMTPSA id p26sm2274255ejn.106.2021.07.03.09.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 09:32:33 -0700 (PDT)
Date: Sat, 3 Jul 2021 12:32:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v7 2/5] virtio-iommu: Implement RESV_MEM probe request
Message-ID: <20210703123153-mutt-send-email-mst@kernel.org>
References: <20200629070404.10969-1-eric.auger@redhat.com>
 <20200629070404.10969-3-eric.auger@redhat.com>
 <20210703123113-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210703123113-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 00kMbgBxro6O

Pls ignore, my mail is acting up serving me old patches.
Sorry about the noise!

-- 
MST

