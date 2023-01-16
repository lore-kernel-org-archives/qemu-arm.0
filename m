Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1509401ejc;
        Mon, 16 Jan 2023 07:37:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7duAykPCrKRm+apU3czOlzfiN95z3KwVycnFjl3Dvt3Z2dc1VW/OyTD4i4JIwTgH9ymBm
X-Received: by 2002:a67:f30a:0:b0:3d0:def3:f74 with SMTP id p10-20020a67f30a000000b003d0def30f74mr10668840vsf.22.1673883470213;
        Mon, 16 Jan 2023 07:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673883470; cv=none;
        d=google.com; s=arc-20160816;
        b=AjoJ83dVxrhOTUOifE6SOGPs+mmt0+ioqQzrvgyPyqaB2AXz8uoZ8iGxJmrSOoKs7l
         mDtdVvIyp187VIcsFde0+sEPJRkf5HYF7zmdgrEuJJHP1jbW6ssX0esXxFmtISevl8Kw
         stPoRQ0N6mfviMpSX1+Fj3oCERhc//fhU0q2eHslGtG1sro7gjTAe2lP3i3S1PVL7VMQ
         YBt6XhEfzdke/KZ97HD5d6Udi44ouniAo4MWbZ3NQseAkycjj75fKBPBCHXVdz2TFp2X
         j1VaWZ5hZtDT+PgTEL1opdjDb4YG8MmCaJOjUCK0rmqm2+FXqi3CysI2IAnkpFiz23QF
         2tBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:dkim-signature:dkim-filter;
        bh=y0nlBlXEtoiAjCeIGddAEJEbom40QaX7TQETc5IwyYw=;
        b=BXqyDlreeJYtoAc43svRrU7geXi5N6kGlAIgcCfbDAV4/OsJU6ngl74S4dj0eYpJku
         Qn7vEdKMI2wbywnKUBLH6dsmHJD/wLTk9il5GpqqJ8xnSmPVPTZCfEM4FvNbZMECV33o
         Fq2xNsbn2EOt8zlakTyKwxt02GSGCRXsriUNL7kRhDMPlds0u9M4dfC+HKye2uxElWXo
         VpWYfdil5rjoupdOLiMFqBxR/kawWpV5UmMwsaIIJtUqMhyEiX2guq2lTAlTM1fRtxy6
         PYZbnXHjeY1d7976RuTvHv3RGIisH08Dso3M3PjNkcD54rlmBx1I5GPkZ34+uF9qIksc
         jgOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dquJyh0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a37ea0c000000b006fc2210cf12si16903177qkj.465.2023.01.16.07.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 07:37:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dquJyh0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHRYA-0001Jx-9Y; Mon, 16 Jan 2023 10:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHRY7-0001J3-Ii; Mon, 16 Jan 2023 10:37:29 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHRY4-0001I1-UL; Mon, 16 Jan 2023 10:37:27 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 822FB20DFE74;
 Mon, 16 Jan 2023 07:37:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 822FB20DFE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673883434;
 bh=y0nlBlXEtoiAjCeIGddAEJEbom40QaX7TQETc5IwyYw=;
 h=Date:To:Cc:From:Subject:From;
 b=dquJyh0NPLfz1lX0guNbRhozjRHxlRe9g2RcCBr9DR1oqeTYTMkSQcEZwi6LunYpW
 zJrfV1Xno7RIU2qdp5OLThvXTgXwjBulvyHItKtw6RMWE1vYHXP2c1kM7ZXivAgj62
 7luOGD62JSS4/OlKKBIc/9Ymvun+NUnrzE+y2r5s=
Message-ID: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
Date: Mon, 16 Jan 2023 16:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 eric.auger@redhat.com
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Subject: [RFC] 2-stage translation emulation support for SMMUv3 on TCG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: UsPGU9/2/wE1

Hi!


We are using qemu-tcg-aarch64 to run Hyper-V test and debug builds for 
arm. Besides some minor fixes that i have submitted over the last couple 
of weeks, one big compatibility item for us is SMMUv3 2-stage 
translations support. We can do fine without it right now, but having it 
would also allow us to test nested arm guests with SMMUv3, which is great.


One idea we have floating around is implementing 2-stage translations in 
SMMUv3 in Qemu. We can't make a commitment yet, but before we consider 
it i think it would be wise to ask the community about it, specifically:

* Do 2-stage translations sound like something qemu-arm would be keen on 
accepting? Are there any other use-cases for it besides an arguably wild 
corner case of nesting an EL2 hypervisor on software-emulated arm64?

* Is there anyone already working on it as we speak maybe?

* Were there any previous attempts to do this and if yes why they 
evidently didn't get through?


Thanks!

