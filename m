Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp286923njc;
        Fri, 27 Sep 2024 05:10:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRMwwsxfRlnd+HbQYnMJhYVBbTbWyIcudQR13BtDiXeyKT8uXFISPLQzxkhUQRBIzm0ROWWkB50geB/A==@linaro.org
X-Google-Smtp-Source: AGHT+IGZXNrNmL7+dx4OQ+QBQjAw3P5V/7PJfV/+Mj6gJe1pksjcnW88N88zEO+XfNvIki7g/D/j
X-Received: by 2002:a05:6358:7e52:b0:1bc:47ad:bfb0 with SMTP id e5c5f4694b2df-1becbc51a02mr186177055d.7.1727439045707;
        Fri, 27 Sep 2024 05:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727439045; cv=none;
        d=google.com; s=arc-20240605;
        b=aqFyc+yTjQrWfr81uAnb29OaJdRVEsCuKIjNnVKVzC3FURCm0AEvJNiUyotc2rVDgh
         SOm8/BUpLupqTqIBFeO++jU9Ct2Qis7e1iM2ccgYSrcIQKCbsfNZv7wbsFLyL1uILGkt
         HidxZaV00Pgj7xzzPMszlu3lCuFieljTGUviLyBq+tCkRL3TIIIISevsHK/GPC6gO4fN
         +wYRMvO7RUM4YdVwez+dpPlLNLEdU2CGazG/JrOKuV3QmcI+aKzN0RGy+1DRclEYoC8h
         igLeqKDGdlL20h/jPy0rWBXYW5cZB48Lw+q41dGhT+EUs6gVayphQuw15FDdkUonH1Gv
         odoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=5kFMIEY21qJRpKemUDedCoQZv50+sydYsmEiM6oXTfQ=;
        fh=CL8FkEck4sBUNnn94VzrZRxnUNRexsX6t//lDNccdpQ=;
        b=GqPTzUqd/TheBPPckHY/alcVt/BziQwMwCjxq0j3sA/t4oNnfiADjkXkcio8a/c5rH
         uh/kAs8lFSDpfP+PQFN3Ie5dthfowBr6VH3D1kyb46x4C3R2Cz1INdNtnpKRGlZI89Fs
         mwo9cyjyG4+G1mBVbhvodgVk6fnv9jzPU/IWI3VRYtnJPwd7d+PTeoBqqGY5I1RjOu7J
         +c4IeBN+ojO/QtlSD68GbGDhSdP32v/ATMcdTXboU49d/YI/xcBGKB4tOa3oD/e532m6
         2zMA/biOxdCJINUHVzdjF8kgtxS/il0J0/Occ9Xd01bLRRoNPGVoTEubAq/MXtVMwUuq
         kRcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b6055afsi21225916d6.100.2024.09.27.05.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 05:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su9nT-0007Tg-IT; Fri, 27 Sep 2024 08:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org>)
 id 1su9nS-0007Rk-Em; Fri, 27 Sep 2024 08:10:06 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org>)
 id 1su9nQ-00014W-GF; Fri, 27 Sep 2024 08:10:06 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XFTmj5zDWz4xTP;
 Fri, 27 Sep 2024 22:09:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XFTmf0djRz4xPl;
 Fri, 27 Sep 2024 22:09:53 +1000 (AEST)
Message-ID: <c35b0d3f-9883-433b-8991-acd6a514aced@kaod.org>
Date: Fri, 27 Sep 2024 14:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Support GPIO for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
 <e1076f8e-2e32-41ba-adf4-8e28aae8e526@kaod.org>
 <SI2PR06MB5041AC649E5F76F2700A42D9FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <1f517713-bb9c-420d-8dce-9423123a3eab@kaod.org>
 <SI2PR06MB5041632B8C7403F6B4B9D4F6FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB5041632B8C7403F6B4B9D4F6FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: N/ry3byQQciV

On 9/27/24 08:29, Jamin Lin wrote:
> 
> Also, your emails have an invalid "From" field set to
> "qemu-devel@nongnu.org" when retrieved with the b4 command.
> I have been fixing them for a while. Could you please tell us how you send the
> patchsets ?

hmm, curious. I wonder what's happening.


Thanks,

C.


