Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp136607ejb;
        Thu, 5 Oct 2023 23:42:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPvaBtpkAkyEmWoKFRI9MoUizbgEpArQ1aqXeNlCWYmMAPSJt3+zuuf37A0UH2kAc6ywWx
X-Received: by 2002:a05:6214:1045:b0:651:94b2:8d87 with SMTP id l5-20020a056214104500b0065194b28d87mr7733747qvr.6.1696574526398;
        Thu, 05 Oct 2023 23:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696574526; cv=none;
        d=google.com; s=arc-20160816;
        b=rS1ILqv5q4Tu9YAekKK40sMQ57NWKQFzJs1tj/xk7L457puOKD6Slqr9qeIv61pEoz
         4hz6LymprfyHtMoAZWSdo2iSCo9wejByXh4KfFkVbOIDhrvrBv57OMI5gdh2FP7O5D/D
         uDl+pWdhxPhuCHFyUClm5YlWolBcfGkbkihK+ZbI8XFfH4GK7g75/I4gsihecsZmoEWa
         +l4dBQWWgWNv5Kll6W5VDiElDEbPHrh79P/ePO5MvHIr7+c95agzpaGqXHrWN/w84Ag8
         4MMpBPJmHSyQRrHCwZxwjCl9IWmjY7LEnqkR2RNj84g0LuUSxfdseA/B0o0e8AEYGoBf
         0U0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Yh+z5mICiLpfaQCQhpjc3Pzp/QFumAqO9s5EtUdSLr0=;
        fh=ActZnKf/M9urpO4fs8X4s0wIHjbOlUGzjL6DRa2n950=;
        b=Y9AObGahH+i7CO4xgHOWxuKayVelTS2v2Xh0uJ3H88Cn7kD7wcrgy5kqi+nzbDv5g0
         keiSWxlBT9k8sErjCfsB2rOUYCD/AGb8X5tMwemgKJm4FCtIPl8DCOCQahqE+GCiG7ty
         hF/ZQg3cW4LgNwJ4UQZIs0E8aR/lgK2IPxbBTcvqzG+ALMCp4p2DoUFyRnr/pjQp3Td6
         PpELvmOB1slfp7dhQtv4Clx/dtd+wTxW60IGUVCyfrPMK8se//AOCNFP6ONfDbNtw1HG
         m4e50gCRDcGWyIMqZKuRd8Vwdts4uqfpcXN/Icq803pkQbZ8+wFUgrwvzFU7aVHE2grR
         UwgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a0cdb8e000000b0065af2538b24si1927792qvk.215.2023.10.05.23.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Oct 2023 23:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoeX8-0005LP-Pr; Fri, 06 Oct 2023 02:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qoeX2-0005L1-L5; Fri, 06 Oct 2023 02:41:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qoeX0-0008Gc-GJ; Fri, 06 Oct 2023 02:41:51 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3411528175;
 Fri,  6 Oct 2023 09:41:52 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C40A32D494;
 Fri,  6 Oct 2023 09:41:47 +0300 (MSK)
Message-ID: <df30e1f8-469e-443b-a36b-7f6e76ffa27f@tls.msk.ru>
Date: Fri, 6 Oct 2023 09:41:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add some unowned files to the SBSA-REF
 section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230929141918.397096-1-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230929141918.397096-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
X-TUID: oogY3jRt5kxz

Applied to my trivial-patches tree, thanks!

/mjt
