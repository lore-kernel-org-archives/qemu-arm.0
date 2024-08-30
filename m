Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp212832njf;
        Fri, 30 Aug 2024 04:19:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwMIg1YrfSUvRh6RlY1fuVN1XY3WCHDnQAuazEd5p9pZFp6hJK0Qkz2iJZ8FVhverA8RHkwzptNFEw5g==@linaro.org
X-Google-Smtp-Source: AGHT+IHDPPg2QSvmdWwaybRjn2eevHWMZx24QXd1ipBlA4sMEuqslZ8I5tE2bLjHpmS2fbHgecDF
X-Received: by 2002:a05:6214:3f90:b0:6bf:6f67:2d27 with SMTP id 6a1803df08f44-6c33e670613mr74993306d6.27.1725016744017;
        Fri, 30 Aug 2024 04:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725016744; cv=none;
        d=google.com; s=arc-20160816;
        b=c7igFavq1KNR7cePVDa93LMMuyc48KmcS7fo+Nhgc4dPcZ59z2iOvaxTwjKtrh0SAU
         Dgs1Zm2Y6/j9iEPRkhqQ02FnBdrp8m2PnAtDVP/N/aeOkQQVnm0FHuil6rxiH0w6L7TP
         cZ4N0tF0h1lngYBlBkq9dQFbR8QjtiZ9gHNDOXXOWLH3Wv9sHvQtJ6MCmKk5W+HmqTwW
         NeFO7wv+CfK6XX5gp8f4jSPMwL6D3OFwZtSgV9HvDHINaw1EC5408i3jId5mUTNF0lk3
         As1g2P7RTEaDu59VadjU3ySDegFMTlhyIfySOuxXd5u22GIEJNUEJSuBLSz3A41Vy2il
         ig0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=CTB+O+LgSsytuJH6D+O87QEepxnL72eGDPaiaHw4vwY=;
        fh=n1pNRimLHi8i/G9YmXY8rIVcJD5z/xUgfM0fFR0QWwM=;
        b=RXoH4kkrqfDBdkVi1Tl0WnqZGRa/r2pGVUESD93yh6BRO9yJPUQWdXbsyM/7a34ohU
         fTnIDgTMZEnGLmyfeui89/hew4lJ5TJ9c61BMuL5db862jkMggy++v6euJvDcI1yQ5bC
         Sil9fypWq3fSA09Lcj9l52cecRps7Y/q+QWVruMrBfJf3p7iZuC/EfEorUn8/IAVpiUm
         EdpBcvywM+TbxhGy/+Ze0UW/GKOMgMY711qmkS3HDHrhCU5NlHAigGjEelrseUS9lcAL
         pHSPM1XXGeEO9a6IwPlb18mOP5GN3yREOcbmEr5jFcpHDHrzkWYqtdFSId5nRSjf+C0f
         QM9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340db0045si37386266d6.481.2024.08.30.04.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 04:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sjzeH-00037F-1T; Fri, 30 Aug 2024 07:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1sjzeF-00032J-OM; Fri, 30 Aug 2024 07:18:35 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1sjzeE-0007DX-7Q; Fri, 30 Aug 2024 07:18:35 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WwFtR5t4sz6J7v8;
 Fri, 30 Aug 2024 19:15:11 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id E469A140736;
 Fri, 30 Aug 2024 19:18:30 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 Aug
 2024 12:18:30 +0100
Date: Fri, 30 Aug 2024 12:18:29 +0100
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
CC: <quic_llindhol@quicinc.com>, <peter.maydell@linaro.org>,
 <marcin.juszkiewicz@linaro.org>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <chenbaozi@phytium.com.cn>, <wangyinfeng@phytium.com.cn>,
 <shuyiqi@phytium.com.cn>
Subject: Re: [RFC PATCH 0/2] Sbsa-ref CXL Enablement
Message-ID: <20240830121829.00005d79@Huawei.com>
In-Reply-To: <20240830041557.600607-1-wangyuquan1236@phytium.com.cn>
References: <20240830041557.600607-1-wangyuquan1236@phytium.com.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xLcrTCDbPldl

On Fri, 30 Aug 2024 12:15:55 +0800
Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:

> RFC because
> - Many contents are ported from Jonathan' patch on qemu virt design
> 
> - Bring plenty of PCDs values and modifying the original PCIE values
> 
> - Less experience and not particularly confident in ACPI area so this might be
>   stupidly broken in a way I've not considered.

Hi Yuquan,

So an opening question for you.  What do you want to use this for?
If the aim is to do full software stack verification, I'd be tempted to
make a slightly more complex setup from the start and have at least
2 CXL host bridges so that you can enable interleaving + probably 2 or
3 CFMWS so that you can test that interleaving.
Even then it won't meet my requirements which is to stress the software
stack but then that's not the aim of sbsa ref so fair enough.

What you have here looks good to me in general, just superficial
suggestions in the various patches.

Thanks,

Jonathan



