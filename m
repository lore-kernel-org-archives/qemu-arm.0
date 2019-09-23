Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2419209wrp;
        Mon, 23 Sep 2019 02:01:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgr7EHa5BZ2VaMOJOEB5xKhNp7/Nkl2Kne+t8hRXy89IOcJMM6C40IrDZTLNZobD7l+D4E
X-Received: by 2002:a17:906:cc9b:: with SMTP id oq27mr27951852ejb.125.1569229290255;
        Mon, 23 Sep 2019 02:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569229290; cv=none;
        d=google.com; s=arc-20160816;
        b=lyIPWiSaWaIajLtXUSy9JEFZ4TSItUMcdVl1ZoIPylmb3g4zhFNZU1L3YSp4mZVfqV
         fUdSbDgGSsLckGPogEHd/nRRw0wXleXHEWzepqNp1IhM5zEb9K07/1c0xP/dLLzokjCE
         r+yhDkBnH4YRyZobeyWnBvd11VOU5wBsybm/4mNNlXce+g7Y60gfU3o6CvrQ4iQNTiyI
         XY2cd0e+YA75/xD+B9ADYLGvbzmwv9YJcp/2NqYHM19Xy/NmNWVGacZeiybmioxVzaxE
         sNQkkWQJ04NIXvZJmJISgNq2sLHoYEBUM+qAKo/dDIEA95MT2Us0/2mmM52/9kbgMeWK
         IrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=RFYnWbkfz1MBbuANm+asXdk8SH26k+1g537UA+wKKKM=;
        b=hpErVBIM2Bn2M2+lGc8Voy9vL8vzZHwiF72YTaTZUGTPbxTHsBhd6D3AFM2X4BE7vp
         hE/d/yjVCLibi5OslLsLd93n7GNLziqfQQylooS++lS9CZ3BXxeBk2G+bWFEpXQwwEHx
         vF5fugzJJgEIbMjTjnBt0BUBM6pFwZqHBPTd2wEvI9Di5k5M/I2UpljV5/KaYubBrP+8
         538Ycc4SU6TB3d0ZMx34nElDWN6Nt98JRSXz1Aj6osMTf+JBIIXl+EK1e0UrQk0Ib8MR
         XZy4LWMHLcG8EsBg7Lq7PBUc94Xhd7cp/jxsw/PhjTBTKpx7RTrerHh+pMle3C5ha9Zc
         c4Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si6261469edc.231.2019.09.23.02.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 02:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCKDp-0008Hn-2i
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 05:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCJqx-0005WU-Kk
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:37:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCJqv-0003Vy-Ci
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:37:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iCJqt-0003QR-Oh
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:37:49 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E9542CD7E5
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 08:37:46 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id w8so4590396wrm.3
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 01:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RFYnWbkfz1MBbuANm+asXdk8SH26k+1g537UA+wKKKM=;
 b=iDQl9VGRGFq1/upFS6wCU8+CHv9tABbb7Ojo+Gztuupwdftp9oCQbXPkfetK4aNPDM
 cP9Kf4fxMTx3wbMETpbxyg1E40kVRqSw5L7wYlgWMB5kAqyVv0gR1crympX+QTnbYlQc
 zDrkswk4ADQmCWl0FmxtPSsLmIpnbRCRtAJj+IkcCikSJi1LkO50dHcquPadxE+cA1L/
 bgpEZN8DQKO9lfVNanyzKI0TSbCSbVsij4gswrkN4gbZU3yu/rwESA3tga2Xkc/ts1hp
 YjhVix7wVIOmMF170xjD5ZiqxyRhiXhhxOXTra+b24oXaDnCXWnPDWRzPIjrSR9lik0D
 87Tg==
X-Gm-Message-State: APjAAAWZ2YUDafKrHatJ3RQ/HNxkn+Fx1NUdbXaLoMnk1TTpAm7uwaqS
 Hg2/tayWkGyk+MDThe7S5m0DpuuhRMEjxdTBNsZLDNX1EVM0WQhYV+TeU/abR527j9cCRgIOdd4
 RCs7JNppTnwcq
X-Received: by 2002:a05:600c:1089:: with SMTP id
 e9mr13192388wmd.176.1569227864570; 
 Mon, 23 Sep 2019 01:37:44 -0700 (PDT)
X-Received: by 2002:a05:600c:1089:: with SMTP id
 e9mr13192373wmd.176.1569227864356; 
 Mon, 23 Sep 2019 01:37:44 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id s9sm10303619wme.36.2019.09.23.01.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 01:37:43 -0700 (PDT)
Subject: Re: [PATCH 0/4] Make it possible to compile with CONFIG_ARM_V7M=n
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <faa7f493-6c40-a5ac-cc70-8cba6e016cb8@redhat.com>
Date: Mon, 23 Sep 2019 10:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190921150420.30743-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fpzV/wNjM9bN

Hi Thomas,

On 9/21/19 5:04 PM, Thomas Huth wrote:
> We've got CONFIG_ARM_V7M, but it currently can't be disabled.
> Here are some patches that should allow to disable the switch
> (if the corresponding boards are disabled, too).

What about the ARMv4/v5/v6/v7r?
